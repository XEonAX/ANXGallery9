package com.miui.gallery.discovery;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.text.TextUtils;
import com.google.gson.Gson;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.R;
import com.miui.gallery.model.DiscoveryMessage;
import com.miui.gallery.model.DiscoveryMessage.BaseMessageDetail;
import com.miui.gallery.provider.GalleryContract.RecentAlbum;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import java.util.ArrayList;
import java.util.List;

public class RecentDiscoveryMessageOperator extends BaseMessageOperator<RecentSaveParams> {
    /* access modifiers changed from: private */
    public static Gson sGson;

    public static class RecentMessageDetail extends BaseMessageDetail {
        private String[] thumbUrls;
        private int unviewMediaCount;

        public static RecentMessageDetail fromJson(String str) {
            if (TextUtils.isEmpty(str)) {
                return null;
            }
            try {
                return (RecentMessageDetail) RecentDiscoveryMessageOperator.sGson.fromJson(str, RecentMessageDetail.class);
            } catch (Exception e) {
                Log.d("RecentDiscoveryMessageOperator", "Unable to parse extraData json to object: %s", (Object) str);
                e.printStackTrace();
                return null;
            }
        }

        public String[] getThumbUrls() {
            return this.thumbUrls;
        }

        public int getUnviewMediaCount() {
            return this.unviewMediaCount;
        }

        public void setThumbUrls(String[] strArr) {
            this.thumbUrls = strArr;
        }

        public void setUnviewMediaCount(int i) {
            this.unviewMediaCount = i;
        }

        public String toJson() {
            return RecentDiscoveryMessageOperator.sGson.toJson((Object) this);
        }
    }

    public static class RecentSaveParams {
        private int mMediaCount;
        private List<String> mThumbUrls;

        public RecentSaveParams(int i, List<String> list) {
            this.mMediaCount = i;
            this.mThumbUrls = list;
        }

        public int getMediaCount() {
            return this.mMediaCount;
        }

        public List<String> getThumbUrls() {
            return this.mThumbUrls;
        }
    }

    public RecentDiscoveryMessageOperator() {
        sGson = new Gson();
    }

    /* access modifiers changed from: protected */
    public boolean doMarkMessageAsRead(Context context, DiscoveryMessage discoveryMessage) {
        discoveryMessage.setConsumed(true);
        if (discoveryMessage.getMessageDetail() instanceof RecentMessageDetail) {
            ((RecentMessageDetail) discoveryMessage.getMessageDetail()).setThumbUrls(null);
            ((RecentMessageDetail) discoveryMessage.getMessageDetail()).setUnviewMediaCount(0);
        } else {
            Log.e("RecentDiscoveryMessageOperator", "messageDetail should be instance of RecentMessageDetail");
        }
        return doUpdateMessage(context, discoveryMessage);
    }

    /* JADX INFO: finally extract failed */
    /* access modifiers changed from: protected */
    public boolean doSaveMessage(Context context, RecentSaveParams recentSaveParams) {
        String[] strArr;
        int i;
        Context context2 = context;
        int mediaCount = recentSaveParams.getMediaCount();
        List thumbUrls = recentSaveParams.getThumbUrls() != null ? recentSaveParams.getThumbUrls() : new ArrayList();
        ContentValues contentValues = new ContentValues();
        long currentTimeMillis = System.currentTimeMillis();
        Cursor queryMessageByType = queryMessageByType(context);
        if (queryMessageByType != null) {
            try {
                if (queryMessageByType.moveToFirst()) {
                    long j = queryMessageByType.getLong(queryMessageByType.getColumnIndex("_id"));
                    RecentMessageDetail fromJson = RecentMessageDetail.fromJson(queryMessageByType.getString(queryMessageByType.getColumnIndex("extraData")));
                    if (fromJson != null) {
                        mediaCount += fromJson.getUnviewMediaCount();
                        strArr = fromJson.getThumbUrls();
                    } else {
                        fromJson = new RecentMessageDetail();
                        strArr = null;
                    }
                    if (strArr != null) {
                        i = mediaCount;
                        for (String str : strArr) {
                            if (thumbUrls.contains(str)) {
                                i--;
                            } else if (thumbUrls.size() < 3) {
                                thumbUrls.add(str);
                            }
                        }
                    } else {
                        i = mediaCount;
                    }
                    fromJson.setUnviewMediaCount(i);
                    String[] strArr2 = new String[Math.min(thumbUrls.size(), 3)];
                    for (int i2 = 0; i2 < strArr2.length; i2++) {
                        strArr2[i2] = (String) thumbUrls.get(i2);
                    }
                    fromJson.setThumbUrls(strArr2);
                    contentValues.put("_id", Long.valueOf(j));
                    contentValues.put("extraData", fromJson.toJson());
                    contentValues.put("isConsumed", Integer.valueOf(0));
                    contentValues.put("updateTime", Long.valueOf(currentTimeMillis));
                    contentValues.put("actionUri", RecentAlbum.VIEW_PAGE_URI.toString());
                    boolean run = new UpdateTask(context2, null, contentValues).run();
                    MiscUtil.closeSilently(queryMessageByType);
                    return run;
                }
            } catch (Exception e) {
                Log.e("RecentDiscoveryMessageOperator", "Something wrong happened when save message: %s.", (Object) e.getMessage());
                e.printStackTrace();
                MiscUtil.closeSilently(queryMessageByType);
                return false;
            } catch (Throwable th) {
                MiscUtil.closeSilently(queryMessageByType);
                throw th;
            }
        }
        RecentMessageDetail recentMessageDetail = new RecentMessageDetail();
        recentMessageDetail.setUnviewMediaCount(mediaCount);
        String[] strArr3 = thumbUrls.size() >= 3 ? new String[3] : new String[thumbUrls.size()];
        for (int i3 = 0; i3 < strArr3.length; i3++) {
            strArr3[i3] = (String) thumbUrls.get(i3);
        }
        recentMessageDetail.setThumbUrls(strArr3);
        contentValues.put("extraData", recentMessageDetail.toJson());
        contentValues.put(nexExportFormat.TAG_FORMAT_TYPE, Integer.valueOf(getMessageType()));
        contentValues.put("receiveTime", Long.valueOf(currentTimeMillis));
        contentValues.put("updateTime", Long.valueOf(currentTimeMillis));
        contentValues.put("isConsumed", Integer.valueOf(0));
        contentValues.put("actionUri", RecentAlbum.VIEW_PAGE_URI.toString());
        boolean run2 = new InsertTask(context2, contentValues).run();
        MiscUtil.closeSilently(queryMessageByType);
        return run2;
    }

    public void doWrapMessage(DiscoveryMessage discoveryMessage, String str) {
        RecentMessageDetail fromJson = RecentMessageDetail.fromJson(str);
        if (fromJson != null) {
            int unviewMediaCount = fromJson.getUnviewMediaCount();
            discoveryMessage.setMessage(GalleryApp.sGetAndroidContext().getResources().getQuantityString(R.plurals.quickly_discovery_message_format, unviewMediaCount, new Object[]{Integer.valueOf(unviewMediaCount)}));
        }
        discoveryMessage.setMessageDetail(fromJson);
    }

    public int getMessageType() {
        return 1;
    }
}
