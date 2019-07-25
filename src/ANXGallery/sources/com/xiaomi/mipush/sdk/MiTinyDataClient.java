package com.xiaomi.mipush.sdk;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.text.TextUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.push.service.PacketHelper;
import com.xiaomi.push.service.TinyDataHelper;
import com.xiaomi.xmpush.thrift.ActionType;
import com.xiaomi.xmpush.thrift.ClientUploadDataItem;
import com.xiaomi.xmpush.thrift.XmPushActionNotification;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

public class MiTinyDataClient {

    public static class MiTinyDataClientImp {
        private static MiTinyDataClientImp sInstance;
        private String mChannel;
        /* access modifiers changed from: private */
        public Context mContext;
        private final ArrayList<ClientUploadDataItem> mPendingList = new ArrayList<>();
        private Boolean mPushServiceAcceptTinyData;
        private SmoothSender mSmoothSender = new SmoothSender();

        public class SmoothSender {
            private ScheduledThreadPoolExecutor mExecutor = new ScheduledThreadPoolExecutor(1);
            /* access modifiers changed from: private */
            public ScheduledFuture<?> mFuture;
            public final ArrayList<ClientUploadDataItem> mList = new ArrayList<>();
            private final Runnable repeatTask = new Runnable() {
                public void run() {
                    if (SmoothSender.this.mList.size() != 0) {
                        SmoothSender.this.doSend();
                    } else if (SmoothSender.this.mFuture != null) {
                        SmoothSender.this.mFuture.cancel(false);
                        SmoothSender.this.mFuture = null;
                    }
                }
            };

            public SmoothSender() {
            }

            /* access modifiers changed from: private */
            public void awake() {
                if (this.mFuture == null) {
                    this.mFuture = this.mExecutor.scheduleAtFixedRate(this.repeatTask, 1000, 1000, TimeUnit.MILLISECONDS);
                }
            }

            /* access modifiers changed from: private */
            public void doSend() {
                ClientUploadDataItem clientUploadDataItem = (ClientUploadDataItem) this.mList.remove(0);
                for (XmPushActionNotification xmPushActionNotification : TinyDataHelper.pack(Arrays.asList(new ClientUploadDataItem[]{clientUploadDataItem}), MiTinyDataClientImp.this.mContext.getPackageName(), AppInfoHolder.getInstance(MiTinyDataClientImp.this.mContext).getAppID(), 30720)) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("MiTinyDataClient Send item by PushServiceClient.sendMessage(XmActionNotification).");
                    sb.append(clientUploadDataItem.getId());
                    MyLog.v(sb.toString());
                    PushServiceClient.getInstance(MiTinyDataClientImp.this.mContext).sendMessage(xmPushActionNotification, ActionType.Notification, true, null);
                }
            }

            public void add(final ClientUploadDataItem clientUploadDataItem) {
                this.mExecutor.execute(new Runnable() {
                    public void run() {
                        SmoothSender.this.mList.add(clientUploadDataItem);
                        SmoothSender.this.awake();
                    }
                });
            }
        }

        private void addToPendingList(ClientUploadDataItem clientUploadDataItem) {
            synchronized (this.mPendingList) {
                if (!this.mPendingList.contains(clientUploadDataItem)) {
                    this.mPendingList.add(clientUploadDataItem);
                    if (this.mPendingList.size() > 100) {
                        this.mPendingList.remove(0);
                    }
                }
            }
        }

        private boolean checkSupportTinyData(Context context) {
            if (!PushServiceClient.getInstance(context).shouldUseMIUIPush()) {
                return true;
            }
            try {
                PackageInfo packageInfo = context.getPackageManager().getPackageInfo("com.xiaomi.xmsf", 4);
                return packageInfo != null && packageInfo.versionCode >= 108;
            } catch (Exception unused) {
                return false;
            }
        }

        public static MiTinyDataClientImp getInstance() {
            if (sInstance == null) {
                synchronized (MiTinyDataClientImp.class) {
                    if (sInstance == null) {
                        sInstance = new MiTinyDataClientImp();
                    }
                }
            }
            return sInstance;
        }

        private boolean missingAppId(Context context) {
            return AppInfoHolder.getInstance(context).getAppID() == null && !checkSupportTinyData(this.mContext);
        }

        private boolean upload(ClientUploadDataItem clientUploadDataItem) {
            if (TinyDataHelper.verify(clientUploadDataItem, false)) {
                return false;
            }
            if (this.mPushServiceAcceptTinyData.booleanValue()) {
                StringBuilder sb = new StringBuilder();
                sb.append("MiTinyDataClient Send item by PushServiceClient.sendTinyData(ClientUploadDataItem).");
                sb.append(clientUploadDataItem.getId());
                MyLog.v(sb.toString());
                PushServiceClient.getInstance(this.mContext).sendTinyData(clientUploadDataItem);
            } else {
                this.mSmoothSender.add(clientUploadDataItem);
            }
            return true;
        }

        public boolean alreadyInit() {
            return this.mContext != null;
        }

        public void init(Context context) {
            if (context == null) {
                MyLog.w("context is null, MiTinyDataClientImp.init() failed.");
                return;
            }
            this.mContext = context;
            this.mPushServiceAcceptTinyData = Boolean.valueOf(checkSupportTinyData(context));
            processPendingList("com.xiaomi.xmpushsdk.tinydataPending.init");
        }

        public void processPendingList(String str) {
            StringBuilder sb = new StringBuilder();
            sb.append("MiTinyDataClient.processPendingList(");
            sb.append(str);
            sb.append(")");
            MyLog.v(sb.toString());
            ArrayList arrayList = new ArrayList();
            synchronized (this.mPendingList) {
                arrayList.addAll(this.mPendingList);
                this.mPendingList.clear();
            }
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                processUploadRequest((ClientUploadDataItem) it.next());
            }
        }

        public synchronized boolean processUploadRequest(ClientUploadDataItem clientUploadDataItem) {
            boolean z = false;
            if (clientUploadDataItem == null) {
                return false;
            }
            if (TinyDataHelper.verify(clientUploadDataItem, true)) {
                return false;
            }
            boolean z2 = TextUtils.isEmpty(clientUploadDataItem.getChannel()) && TextUtils.isEmpty(this.mChannel);
            boolean z3 = !alreadyInit();
            if (this.mContext == null || missingAppId(this.mContext)) {
                z = true;
            }
            if (!z3 && !z2) {
                if (!z) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("MiTinyDataClient Send item immediately.");
                    sb.append(clientUploadDataItem.getId());
                    MyLog.v(sb.toString());
                    if (TextUtils.isEmpty(clientUploadDataItem.getId())) {
                        clientUploadDataItem.setId(PacketHelper.generatePacketID());
                    }
                    if (TextUtils.isEmpty(clientUploadDataItem.getChannel())) {
                        clientUploadDataItem.setChannel(this.mChannel);
                    }
                    if (TextUtils.isEmpty(clientUploadDataItem.getSourcePackage())) {
                        clientUploadDataItem.setSourcePackage(this.mContext.getPackageName());
                    }
                    if (clientUploadDataItem.getTimestamp() <= 0) {
                        clientUploadDataItem.setTimestamp(System.currentTimeMillis());
                    }
                    return upload(clientUploadDataItem);
                }
            }
            if (z2) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("MiTinyDataClient Pending ");
                sb2.append(clientUploadDataItem.getName());
                sb2.append(" reason is ");
                sb2.append("com.xiaomi.xmpushsdk.tinydataPending.channel");
                MyLog.v(sb2.toString());
            } else if (z3) {
                StringBuilder sb3 = new StringBuilder();
                sb3.append("MiTinyDataClient Pending ");
                sb3.append(clientUploadDataItem.getName());
                sb3.append(" reason is ");
                sb3.append("com.xiaomi.xmpushsdk.tinydataPending.init");
                MyLog.v(sb3.toString());
            } else if (z) {
                StringBuilder sb4 = new StringBuilder();
                sb4.append("MiTinyDataClient Pending ");
                sb4.append(clientUploadDataItem.getName());
                sb4.append(" reason is ");
                sb4.append("com.xiaomi.xmpushsdk.tinydataPending.appId");
                MyLog.v(sb4.toString());
            }
            addToPendingList(clientUploadDataItem);
            return true;
        }
    }

    public static boolean upload(Context context, ClientUploadDataItem clientUploadDataItem) {
        StringBuilder sb = new StringBuilder();
        sb.append("MiTinyDataClient.upload ");
        sb.append(clientUploadDataItem.getId());
        MyLog.v(sb.toString());
        if (!MiTinyDataClientImp.getInstance().alreadyInit()) {
            MiTinyDataClientImp.getInstance().init(context);
        }
        return MiTinyDataClientImp.getInstance().processUploadRequest(clientUploadDataItem);
    }

    public static boolean upload(Context context, String str, String str2, long j, String str3) {
        ClientUploadDataItem clientUploadDataItem = new ClientUploadDataItem();
        clientUploadDataItem.setCategory(str);
        clientUploadDataItem.setName(str2);
        clientUploadDataItem.setCounter(j);
        clientUploadDataItem.setData(str3);
        clientUploadDataItem.setFromSdk(true);
        clientUploadDataItem.setChannel("push_sdk_channel");
        return upload(context, clientUploadDataItem);
    }

    public static boolean upload(String str, String str2, long j, String str3) {
        ClientUploadDataItem clientUploadDataItem = new ClientUploadDataItem();
        clientUploadDataItem.setCategory(str);
        clientUploadDataItem.setName(str2);
        clientUploadDataItem.setCounter(j);
        clientUploadDataItem.setData(str3);
        return MiTinyDataClientImp.getInstance().processUploadRequest(clientUploadDataItem);
    }
}
