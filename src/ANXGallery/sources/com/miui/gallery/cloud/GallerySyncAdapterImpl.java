package com.miui.gallery.cloud;

import android.accounts.Account;
import android.content.Context;
import android.content.Intent;
import android.content.SyncResult;
import android.net.ParseException;
import android.os.Bundle;
import android.support.v4.content.LocalBroadcastManager;
import android.text.TextUtils;
import android.util.Log;
import android.util.Pair;
import com.miui.gallery.cloud.AsyncUpDownloadService.SyncLock;
import com.miui.gallery.cloud.GalleryCloudSyncTagUtils.SyncTagConstant;
import com.miui.gallery.cloud.GalleryCloudSyncTagUtils.SyncTagItem;
import com.miui.gallery.cloud.ServerErrorCode.MiCloudServerExceptionHandler;
import com.miui.gallery.cloud.adapter.PullCardAdapter;
import com.miui.gallery.cloud.adapter.PullFaceDataAdapter;
import com.miui.gallery.cloud.adapter.PullOwnerDataAdapter;
import com.miui.gallery.cloud.adapter.PullSecretDataAdapter;
import com.miui.gallery.cloud.adapter.PullShareAdapter;
import com.miui.gallery.cloud.adapter.PushBabyInfoAdapter;
import com.miui.gallery.cloud.adapter.PushCardAdapter;
import com.miui.gallery.cloud.adapter.PushFaceDataAdapter;
import com.miui.gallery.cloud.adapter.PushOwnerDataAdapter;
import com.miui.gallery.cloud.adapter.PushShareDataAdapter;
import com.miui.gallery.cloud.base.AbstractSyncAdapter;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import com.miui.gallery.cloud.base.GallerySyncCode;
import com.miui.gallery.cloud.base.GallerySyncResult;
import com.miui.gallery.cloud.base.SyncType;
import com.miui.gallery.cloud.control.BatteryMonitor;
import com.miui.gallery.cloud.control.ServerTagCache;
import com.miui.gallery.cloud.control.SyncMonitor;
import com.miui.gallery.cloud.download.BatchDownloadManager;
import com.miui.gallery.cloud.syncstate.SyncStateManager;
import com.miui.gallery.cloud.syncstate.SyncStateUtil;
import com.miui.gallery.cloudcontrol.CloudControlRequestHelper;
import com.miui.gallery.preference.GalleryPreferences.CloudControl;
import com.miui.gallery.preference.GalleryPreferences.Sync;
import com.miui.gallery.provider.GalleryDBHelper;
import com.miui.gallery.sdk.download.util.DownloadUtil;
import com.miui.gallery.settingssync.GallerySettingsSyncHelper;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.SyncLog;
import com.miui.gallery.util.SyncUtil;
import com.miui.gallery.util.deprecated.Preference;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map.Entry;
import java.util.concurrent.TimeUnit;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import org.apache.http.client.ClientProtocolException;
import org.json.JSONException;

public class GallerySyncAdapterImpl {
    private static List<Pair<Long, Class<? extends AbstractSyncAdapter>>> sSyncAdapters = new LinkedList();
    Context mContext;
    private SyncLock mSyncLock;

    static {
        sSyncAdapters.add(new Pair(Long.valueOf(1), PullOwnerDataAdapter.class));
        sSyncAdapters.add(new Pair(Long.valueOf(2), PullSecretDataAdapter.class));
        sSyncAdapters.add(new Pair(Long.valueOf(4), PullCardAdapter.class));
        sSyncAdapters.add(new Pair(Long.valueOf(8), PullFaceDataAdapter.class));
        sSyncAdapters.add(new Pair(Long.valueOf(16), PullShareAdapter.class));
        sSyncAdapters.add(new Pair(Long.valueOf(32), PushOwnerDataAdapter.class));
        sSyncAdapters.add(new Pair(Long.valueOf(64), PushCardAdapter.class));
        sSyncAdapters.add(new Pair(Long.valueOf(128), PushFaceDataAdapter.class));
        sSyncAdapters.add(new Pair(Long.valueOf(256), PushBabyInfoAdapter.class));
        sSyncAdapters.add(new Pair(Long.valueOf(512), PushShareDataAdapter.class));
    }

    public GallerySyncAdapterImpl(Context context) {
        this.mContext = context;
    }

    private void acquireLock() {
        synchronized (this) {
            if (this.mSyncLock == null) {
                this.mSyncLock = AsyncUpDownloadService.newSyncLock("GallerySyncAdapterImpl");
            }
            this.mSyncLock.acquire();
        }
    }

    private static <T extends AbstractSyncAdapter> T create(Context context, Class<T> cls) {
        try {
            return (AbstractSyncAdapter) cls.getConstructor(new Class[]{Context.class}).newInstance(new Object[]{context});
        } catch (InstantiationException e) {
            e.printStackTrace();
            return null;
        } catch (IllegalAccessException e2) {
            e2.printStackTrace();
            return null;
        } catch (InvocationTargetException e3) {
            e3.printStackTrace();
            return null;
        } catch (NoSuchMethodException e4) {
            e4.printStackTrace();
            return null;
        }
    }

    private void doPostFirstSyncJob() {
        long currentTimeMillis = System.currentTimeMillis();
        if (CloudControl.getLastRequestSucceedTime() <= 0) {
            GallerySettingsSyncHelper.doSync(this.mContext);
            SyncLog.d("GallerySyncAdapterImpl", "Request cloud control after first sync, result %s", (Object) String.valueOf(new CloudControlRequestHelper(this.mContext).execRequestSync(true)));
        }
        LocalBroadcastManager.getInstance(this.mContext).sendBroadcast(new Intent("com.miui.gallery.action.FIRST_SYNC_FINISHED"));
        if (BatchDownloadManager.canAutoDownload()) {
            BatchDownloadManager.getInstance().startBatchDownload(this.mContext, true);
        }
        statFirstSync(currentTimeMillis);
    }

    private <T> GallerySyncResult<T> executeAdapter(AbstractSyncAdapter<T> abstractSyncAdapter, Account account, GalleryExtendedAuthToken galleryExtendedAuthToken, Bundle bundle) {
        abstractSyncAdapter.isAsynchronous();
        return abstractSyncAdapter.startSync(account, bundle, galleryExtendedAuthToken);
    }

    private boolean fetchSyncExtraInfoFromV2ToV3(Account account, GalleryExtendedAuthToken galleryExtendedAuthToken) throws ClientProtocolException, IOException, JSONException, URISyntaxException, IllegalBlockSizeException, BadPaddingException, GalleryMiCloudServerException {
        if (Preference.getSyncFetchSyncExtraInfoFromV2ToV3()) {
            new FetchSyncExtraInfoTask(this.mContext, account, galleryExtendedAuthToken).run();
            if (Preference.getSyncFetchSyncExtraInfoFromV2ToV3()) {
                SyncLog.e("GallerySyncAdapterImpl", "fail to fetch syncExtraInfo when upgrade from v2 to v3");
                return false;
            }
        }
        return true;
    }

    private void handlePush(Account account, GalleryExtendedAuthToken galleryExtendedAuthToken, Bundle bundle) {
        Bundle parsePushParams = parsePushParams(this.mContext, account, bundle);
        int i = parsePushParams.getInt("sync_tag_type");
        String string = parsePushParams.getString("sync_tag_data");
        SyncLog.d("GallerySyncAdapterImpl", "request caused by push: type[%s], data[%s].", Integer.valueOf(i), string);
        if (parsePushParams.getBoolean("sync_data_exist", false)) {
            SyncLog.w("GallerySyncAdapterImpl", "push data[%s] exist, ignore!");
        } else {
            long j = 0;
            if (i != 11) {
                switch (i) {
                    case 1:
                        if (!ServerTagCache.getInstance().contains(string)) {
                            j = 1;
                            break;
                        } else {
                            SyncLog.d("GallerySyncAdapterImpl", "operation server tag, ignore push: %s", (Object) string);
                            return;
                        }
                    case 2:
                    case 3:
                    case 4:
                    case 5:
                        j = 16;
                        break;
                    default:
                        SyncLog.e("GallerySyncAdapterImpl", "unknown push %s", bundle);
                        break;
                }
            } else {
                j = 8;
            }
            SyncLog.d("GallerySyncAdapterImpl", "request by push, sync reason[%s]", (Object) Long.toBinaryString(j));
            for (AbstractSyncAdapter executeAdapter : maskAdapters(this.mContext, j)) {
                executeAdapter(executeAdapter, account, galleryExtendedAuthToken, parsePushParams);
            }
        }
    }

    private void handleRequest(Account account, GalleryExtendedAuthToken galleryExtendedAuthToken, Bundle bundle) {
        if (!Preference.sIsFirstSynced()) {
            Sync.setFirstSyncStartTime(System.currentTimeMillis());
        }
        SyncType unpackSyncType = SyncUtil.unpackSyncType(bundle);
        SyncStateManager.getInstance().setSyncType(unpackSyncType, false);
        long j = bundle.getLong("sync_reason", Long.MAX_VALUE);
        SyncLog.d("GallerySyncAdapterImpl", "request caused by local: syncType[%s], reason[%s].", unpackSyncType, Long.toBinaryString(j));
        Sync.setLastSyncTimestamp(System.currentTimeMillis());
        GallerySettingsSyncHelper.doSync(this.mContext);
        Boolean bool = null;
        for (AbstractSyncAdapter abstractSyncAdapter : maskAdapters(this.mContext, j)) {
            SyncStateManager.getInstance().unmergeReason(abstractSyncAdapter.getBindingReason());
            GallerySyncResult executeAdapter = executeAdapter(abstractSyncAdapter, account, galleryExtendedAuthToken, bundle);
            if (abstractSyncAdapter instanceof PullOwnerDataAdapter) {
                bool = Boolean.valueOf(executeAdapter != null && executeAdapter.code == GallerySyncCode.OK);
            }
        }
        if (bool != null) {
            onPullOwnerEnd(bool.booleanValue());
        }
    }

    private static boolean isPush(Bundle bundle) {
        return !TextUtils.isEmpty(bundle.getString("pushName"));
    }

    private static List<AbstractSyncAdapter> maskAdapters(Context context, long j) {
        LinkedList linkedList = new LinkedList();
        for (Pair pair : sSyncAdapters) {
            if ((((Long) pair.first).longValue() & j) == ((Long) pair.first).longValue()) {
                AbstractSyncAdapter create = create(context, (Class) pair.second);
                if (create != null) {
                    linkedList.add(create);
                } else {
                    SyncLog.e("GallerySyncAdapterImpl", "create instance error for %s", ((Class) pair.second).getSimpleName());
                }
            }
        }
        return linkedList;
    }

    private void onPullOwnerEnd(boolean z) {
        if (z) {
            Sync.setSyncCompletelyFinish(true);
            if (!Preference.sIsFirstSynced()) {
                Preference.sSetFirstSynced();
                doPostFirstSyncJob();
                return;
            }
            return;
        }
        Sync.setSyncCompletelyFinish(false);
    }

    private static Bundle parsePushParams(Context context, Account account, Bundle bundle) {
        Bundle bundle2 = new Bundle();
        bundle.getString("pushType");
        String string = bundle.getString("pushName");
        String string2 = bundle.getString("pushData");
        for (Entry entry : GalleryCloudSyncTagUtils.sSyncTagConstantsMap.entrySet()) {
            if (TextUtils.equals(string, ((SyncTagConstant) entry.getValue()).pushName)) {
                bundle2.putInt("sync_tag_type", ((Integer) entry.getKey()).intValue());
                bundle2.putString("sync_tag_data", string2);
                ArrayList arrayList = new ArrayList();
                arrayList.add(new SyncTagItem(((Integer) entry.getKey()).intValue()));
                bundle2.putBoolean("sync_data_exist", TextUtils.equals(Long.toString(((SyncTagItem) GalleryCloudSyncTagUtils.getSyncTag(context, account, arrayList).get(0)).currentValue), string2));
            }
        }
        return bundle2;
    }

    private void recordSyncError(Throwable th) {
        if (th != null) {
            HashMap hashMap = new HashMap();
            hashMap.put("error", Log.getStackTraceString(th));
            GallerySamplingStatHelper.recordErrorEvent("Sync", "sync_error_message", hashMap);
            if (!Preference.sIsFirstSynced()) {
                Sync.increaseFirstSyncFailCount();
            }
        }
    }

    private void releaseLock() {
        synchronized (this) {
            if (this.mSyncLock != null) {
                this.mSyncLock.release();
                this.mSyncLock = null;
            }
        }
    }

    public static void resetAccountInfo(Account account, GalleryExtendedAuthToken galleryExtendedAuthToken) {
        AccountCache.update(account, galleryExtendedAuthToken);
        SyncLog.d("GallerySyncAdapterImpl", "reset AccountCache");
        GalleryKssManager.reset();
        SyncLog.d("GallerySyncAdapterImpl", "reset GalleryKssManager");
    }

    private void statFirstSync(long j) {
        long firstSyncStartTime = Sync.getFirstSyncStartTime();
        if (firstSyncStartTime == 0 || firstSyncStartTime > j) {
            SyncLog.w("GallerySyncAdapterImpl", "invalid first sync time, start: %d, finish: %d", Long.valueOf(firstSyncStartTime), Long.valueOf(j));
            return;
        }
        int[] syncedCount = SyncStateUtil.getSyncedCount(this.mContext);
        long minutes = TimeUnit.MILLISECONDS.toMinutes(j - firstSyncStartTime);
        HashMap hashMap = new HashMap();
        hashMap.put("image_count", String.valueOf(syncedCount[0]));
        hashMap.put("video_count", String.valueOf(syncedCount[1]));
        hashMap.put("time_in_minutes", String.valueOf(minutes));
        hashMap.put("fail_count", String.valueOf(Sync.getFirstSyncFailCount()));
        GallerySamplingStatHelper.recordCountEvent("Sync", "first_sync_duration", hashMap);
        Sync.clearFirstSyncFailCount();
        SyncLog.d("GallerySyncAdapterImpl", "first sync finished: %s", (Object) hashMap.toString());
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Removed duplicated region for block: B:79:0x0244  */
    public void onPerformMiCloudSync(Bundle bundle, Account account, SyncResult syncResult, GalleryExtendedAuthToken galleryExtendedAuthToken) throws GalleryMiCloudServerException {
        Exception cloudServerException;
        acquireLock();
        BatteryMonitor.getInstance().start();
        long currentTimeMillis = System.currentTimeMillis();
        Throwable th = null;
        if (account != null) {
            try {
                if (!TextUtils.isEmpty(account.name)) {
                    if (!TextUtils.isEmpty(account.type)) {
                        if (!CloudUtils.checkAccount(null, true, null)) {
                            SyncLog.e("GallerySyncAdapterImpl", "check account failed, return.");
                            SyncLog.d("GallerySyncAdapterImpl", "perform sync finished, cost: %d", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
                            releaseLock();
                            BatteryMonitor.getInstance().end();
                            GalleryDBHelper.getInstance(this.mContext).analyze();
                            DeleteAccount.deleteAccountAfterSyncIfNeeded();
                            return;
                        }
                        resetAccountInfo(account, galleryExtendedAuthToken);
                        GalleryCloudSyncTagUtils.insertAccountToDB(this.mContext, account);
                        MiCloudServerExceptionHandler.checkMiCloudServerException();
                        SyncConditionManager.setCancelledForAllBackground(false);
                        if (!fetchSyncExtraInfoFromV2ToV3(account, galleryExtendedAuthToken)) {
                            SyncLog.e("GallerySyncAdapterImpl", "fetchSyncExtraInfoFromV2ToV3 Exit");
                            SyncLog.d("GallerySyncAdapterImpl", "perform sync finished, cost: %d", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
                            releaseLock();
                            BatteryMonitor.getInstance().end();
                            GalleryDBHelper.getInstance(this.mContext).analyze();
                            DeleteAccount.deleteAccountAfterSyncIfNeeded();
                            return;
                        }
                        if (ClearDataManager.getInstance().clearDataBaseIfNeeded(this.mContext, account)) {
                            SyncLog.w("GallerySyncAdapterImpl", "clear data before syncing");
                        }
                        if (isPush(bundle)) {
                            handlePush(account, galleryExtendedAuthToken, bundle);
                        } else {
                            handleRequest(account, galleryExtendedAuthToken, bundle);
                        }
                        DownloadUtil.resumeInterrupted();
                        SyncLog.d("GallerySyncAdapterImpl", "perform sync finished, cost: %d", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
                        releaseLock();
                        BatteryMonitor.getInstance().end();
                        GalleryDBHelper.getInstance(this.mContext).analyze();
                        DeleteAccount.deleteAccountAfterSyncIfNeeded();
                    }
                }
            } catch (JSONException e) {
                e = e;
                syncResult.stats.numParseExceptions++;
                SyncLog.d("GallerySyncAdapterImpl", "perform sync finished, cost: %d", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
                releaseLock();
                BatteryMonitor.getInstance().end();
            } catch (URISyntaxException e2) {
                e = e2;
                syncResult.stats.numParseExceptions++;
                SyncLog.d("GallerySyncAdapterImpl", "perform sync finished, cost: %d", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
                releaseLock();
                BatteryMonitor.getInstance().end();
            } catch (IOException e3) {
                e = e3;
                syncResult.stats.numIoExceptions++;
                SyncLog.d("GallerySyncAdapterImpl", "perform sync finished, cost: %d", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
                releaseLock();
                BatteryMonitor.getInstance().end();
            } catch (ParseException e4) {
                e = e4;
                syncResult.stats.numParseExceptions++;
                SyncLog.d("GallerySyncAdapterImpl", "perform sync finished, cost: %d", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
                releaseLock();
                BatteryMonitor.getInstance().end();
            } catch (IllegalArgumentException e5) {
                e = e5;
                syncResult.stats.numParseExceptions++;
                SyncLog.d("GallerySyncAdapterImpl", "perform sync finished, cost: %d", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
                releaseLock();
                BatteryMonitor.getInstance().end();
            } catch (Exception e6) {
                e = e6;
                if (!(e instanceof GalleryMiCloudServerException)) {
                    SyncLog.d("GallerySyncAdapterImpl", "perform sync finished, cost: %d", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
                    releaseLock();
                    BatteryMonitor.getInstance().end();
                } else {
                    cloudServerException = ((GalleryMiCloudServerException) e).getCloudServerException();
                    throw ((GalleryMiCloudServerException) e);
                }
            } catch (Throwable th2) {
                th = th2;
                th = cloudServerException;
                SyncLog.d("GallerySyncAdapterImpl", "perform sync finished, cost: %d", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
                releaseLock();
                BatteryMonitor.getInstance().end();
                if (th != null) {
                }
                GalleryDBHelper.getInstance(this.mContext).analyze();
                DeleteAccount.deleteAccountAfterSyncIfNeeded();
                throw th;
            }
        }
        SyncLog.e("GallerySyncAdapterImpl", "account: %s, name: %s, type %s, have none value, return.", account, account == null ? "" : account.name, account == null ? "" : account.type);
        SyncLog.d("GallerySyncAdapterImpl", "perform sync finished, cost: %d", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
        releaseLock();
        BatteryMonitor.getInstance().end();
        GalleryDBHelper.getInstance(this.mContext).analyze();
        DeleteAccount.deleteAccountAfterSyncIfNeeded();
        return;
        SyncLog.e("GallerySyncAdapterImpl", e);
        SyncMonitor.getInstance().onSyncThrowable(e);
        recordSyncError(e);
        GalleryDBHelper.getInstance(this.mContext).analyze();
        DeleteAccount.deleteAccountAfterSyncIfNeeded();
    }

    public void onSyncCanceled() {
        SyncConditionManager.setCancelledForAllBackground(true);
        UpDownloadManager.cancelAllBackgroundPriority(true, true);
    }
}
