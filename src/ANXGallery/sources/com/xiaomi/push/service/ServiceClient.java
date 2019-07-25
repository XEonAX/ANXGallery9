package com.xiaomi.push.service;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.pm.PackageInfo;
import android.os.Build.VERSION;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.Message;
import android.os.Messenger;
import android.os.RemoteException;
import com.xiaomi.channel.commonutils.android.MIUIUtils;
import com.xiaomi.channel.commonutils.logger.MyLog;
import com.xiaomi.channel.commonutils.misc.BuildSettings;
import java.util.ArrayList;
import java.util.List;

public class ServiceClient {
    private static ServiceClient sInstance;
    private static String sSession;
    /* access modifiers changed from: private */
    public boolean isConnectingService = false;
    /* access modifiers changed from: private */
    public Messenger mClientMessenger;
    private Context mContext;
    private boolean mIsMiuiPushServiceEnabled = false;
    private Messenger mMessenger;
    /* access modifiers changed from: private */
    public List<Message> pendingMessages = new ArrayList();

    private ServiceClient(Context context) {
        this.mContext = context.getApplicationContext();
        this.mMessenger = new Messenger(new Handler(Looper.getMainLooper()) {
            public void handleMessage(Message message) {
                super.handleMessage(message);
            }
        });
        if (serviceInstalled()) {
            MyLog.v("use miui push service");
            this.mIsMiuiPushServiceEnabled = true;
        }
    }

    private synchronized void bindServiceSafely(Intent intent) {
        if (this.isConnectingService) {
            Message parseToMessage = parseToMessage(intent);
            if (this.pendingMessages.size() >= 50) {
                this.pendingMessages.remove(0);
            }
            this.pendingMessages.add(parseToMessage);
            return;
        } else if (this.mClientMessenger == null) {
            Context context = this.mContext;
            AnonymousClass2 r1 = new ServiceConnection() {
                public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
                    synchronized (ServiceClient.this) {
                        ServiceClient.this.mClientMessenger = new Messenger(iBinder);
                        ServiceClient.this.isConnectingService = false;
                        for (Message send : ServiceClient.this.pendingMessages) {
                            try {
                                ServiceClient.this.mClientMessenger.send(send);
                            } catch (RemoteException e) {
                                MyLog.e((Throwable) e);
                            }
                        }
                        ServiceClient.this.pendingMessages.clear();
                    }
                }

                public void onServiceDisconnected(ComponentName componentName) {
                    ServiceClient.this.mClientMessenger = null;
                    ServiceClient.this.isConnectingService = false;
                }
            };
            Context context2 = this.mContext;
            context.bindService(intent, r1, 1);
            this.isConnectingService = true;
            this.pendingMessages.clear();
            this.pendingMessages.add(parseToMessage(intent));
        } else {
            try {
                this.mClientMessenger.send(parseToMessage(intent));
            } catch (RemoteException unused) {
                this.mClientMessenger = null;
                this.isConnectingService = false;
            }
        }
        return;
    }

    public static ServiceClient getInstance(Context context) {
        if (sInstance == null) {
            sInstance = new ServiceClient(context);
        }
        return sInstance;
    }

    private Message parseToMessage(Intent intent) {
        Message obtain = Message.obtain();
        obtain.what = 17;
        obtain.obj = intent;
        return obtain;
    }

    private boolean serviceInstalled() {
        if (BuildSettings.IsTestBuild) {
            return false;
        }
        try {
            PackageInfo packageInfo = this.mContext.getPackageManager().getPackageInfo("com.xiaomi.xmsf", 4);
            return packageInfo != null && packageInfo.versionCode >= 104;
        } catch (Exception unused) {
            return false;
        }
    }

    public boolean startServiceSafely(Intent intent) {
        try {
            if (MIUIUtils.isMIUI() || VERSION.SDK_INT < 26) {
                this.mContext.startService(intent);
            } else {
                bindServiceSafely(intent);
            }
            return true;
        } catch (Exception e) {
            MyLog.e((Throwable) e);
            return false;
        }
    }
}
