package com.miui.extraphoto.sdk;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.os.Looper;
import android.os.RemoteException;
import com.miui.extraphoto.sdk.IExtraPhotoService.Stub;
import com.miui.gallery.R;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.util.Log;
import java.util.ArrayList;
import java.util.List;

public class ExtraPhotoWrapper implements ServiceConnection {
    private static ExtraPhotoWrapper sWrapper;
    /* access modifiers changed from: private */
    public IExtraPhotoService mDualService;
    /* access modifiers changed from: private */
    public boolean mHasBindService;
    /* access modifiers changed from: private */
    public StartCallback mStartCallback;

    public interface StartCallback {
        void onStarted(boolean z);
    }

    private ExtraPhotoWrapper() {
    }

    private void bindService(final Context context) {
        ThreadManager.getWorkHandler().post(new Runnable() {
            public void run() {
                if (ExtraPhotoWrapper.this.mHasBindService) {
                    Log.e("ExtraPhotoWrapper", "has bind service");
                    return;
                }
                try {
                    Intent intent = new Intent("com.miui.extraphoto.action.EXTRA_PHOTO");
                    intent.setPackage("com.miui.extraphoto");
                    boolean bindService = context.bindService(intent, ExtraPhotoWrapper.this, 1);
                    ExtraPhotoWrapper.this.mHasBindService = true;
                    Log.i("ExtraPhotoWrapper", "bind %s", (Object) Boolean.valueOf(bindService));
                    if (!bindService) {
                        ExtraPhotoWrapper.this.callbackStarted(false);
                    }
                } catch (Exception e) {
                    Log.e("ExtraPhotoWrapper", (Throwable) e);
                    ExtraPhotoWrapper.this.callbackStarted(false);
                }
            }
        });
    }

    /* access modifiers changed from: private */
    public void callbackStarted(final boolean z) {
        AnonymousClass3 r0 = new Runnable() {
            public void run() {
                if (ExtraPhotoWrapper.this.mDualService != null) {
                    try {
                        ExtraPhotoWrapper.this.mDualService.resumeEcho();
                    } catch (RemoteException e) {
                        Log.e("ExtraPhotoWrapper", (Throwable) e);
                    } catch (Exception e2) {
                        Log.e("ExtraPhotoWrapper", (Throwable) e2);
                    }
                }
                if (ExtraPhotoWrapper.this.mStartCallback != null) {
                    ExtraPhotoWrapper.this.mStartCallback.onStarted(z);
                    ExtraPhotoWrapper.this.mStartCallback = null;
                }
            }
        };
        if (Looper.getMainLooper() == Looper.myLooper()) {
            r0.run();
        } else {
            ThreadManager.getMainHandler().post(r0);
        }
    }

    public static ExtraPhotoWrapper getInstance() {
        if (sWrapper == null) {
            sWrapper = new ExtraPhotoWrapper();
        }
        return sWrapper;
    }

    private void init(Context context, StartCallback startCallback) {
        if (this.mDualService != null) {
            Log.e("ExtraPhotoWrapper", "service has been initialized");
            return;
        }
        this.mStartCallback = startCallback;
        bindService(context);
    }

    private void releaseEcho() {
        Log.i("ExtraPhotoWrapper", "releaseEcho");
        if (this.mDualService != null) {
            try {
                this.mDualService.releaseEcho();
            } catch (RemoteException e) {
                Log.e("ExtraPhotoWrapper", (Throwable) e);
            } catch (Exception e2) {
                Log.e("ExtraPhotoWrapper", (Throwable) e2);
            }
        }
    }

    private int transFunc2Id(ExtraFunc extraFunc) {
        switch (extraFunc) {
            case FUNC_FANCYCOLOR:
                return R.id.fancycolor_enter;
            case FUNC_REFOCUS:
                return R.id.refocus_enter;
            case FUNC_FREEVIEW:
                return R.id.freeview_enter;
            default:
                return 0;
        }
    }

    private void unbindService(final Context context) {
        ThreadManager.getWorkHandler().post(new Runnable() {
            public void run() {
                if (!ExtraPhotoWrapper.this.mHasBindService) {
                    Log.e("ExtraPhotoWrapper", "hasn't bind service");
                    return;
                }
                try {
                    context.unbindService(ExtraPhotoWrapper.this);
                    ExtraPhotoWrapper.this.mHasBindService = false;
                    Log.i("ExtraPhotoWrapper", "unbind service");
                } catch (Exception e) {
                    Log.e("ExtraPhotoWrapper", (Throwable) e);
                }
            }
        });
    }

    public boolean echo(String str, BaseEchoListener baseEchoListener, boolean z) {
        Log.i("ExtraPhotoWrapper", "echo %s, %s, %s", str, baseEchoListener, Boolean.valueOf(z));
        if (this.mDualService != null) {
            try {
                return this.mDualService.echo(str, baseEchoListener, z);
            } catch (RemoteException e) {
                Log.e("ExtraPhotoWrapper", (Throwable) e);
            } catch (Exception e2) {
                Log.e("ExtraPhotoWrapper", (Throwable) e2);
            }
        }
        return false;
    }

    public boolean isExtraCamera() {
        boolean z;
        if (this.mDualService != null) {
            try {
                z = this.mDualService.isExtraCamera();
            } catch (RemoteException e) {
                Log.e("ExtraPhotoWrapper", (Throwable) e);
            } catch (Exception e2) {
                Log.e("ExtraPhotoWrapper", (Throwable) e2);
            }
            Log.i("ExtraPhotoWrapper", "isExtraCamera %s", (Object) Boolean.valueOf(z));
            return z;
        }
        z = false;
        Log.i("ExtraPhotoWrapper", "isExtraCamera %s", (Object) Boolean.valueOf(z));
        return z;
    }

    public boolean isExtraPhoto(String str) {
        boolean z;
        if (this.mDualService != null) {
            try {
                z = this.mDualService.isExtraPhoto(str);
            } catch (RemoteException e) {
                Log.e("ExtraPhotoWrapper", (Throwable) e);
            } catch (Exception e2) {
                Log.e("ExtraPhotoWrapper", (Throwable) e2);
            }
            Log.i("ExtraPhotoWrapper", "isExtraPhoto %s, %s", Boolean.valueOf(z), str);
            return z;
        }
        z = false;
        Log.i("ExtraPhotoWrapper", "isExtraPhoto %s, %s", Boolean.valueOf(z), str);
        return z;
    }

    public boolean needEcho(String str) {
        boolean z;
        if (this.mDualService != null) {
            try {
                z = this.mDualService.needEcho(str);
            } catch (RemoteException e) {
                Log.e("ExtraPhotoWrapper", (Throwable) e);
            } catch (Exception e2) {
                Log.e("ExtraPhotoWrapper", (Throwable) e2);
            }
            Log.i("ExtraPhotoWrapper", "needEcho %s, %s", Boolean.valueOf(z), str);
            return z;
        }
        z = false;
        Log.i("ExtraPhotoWrapper", "needEcho %s, %s", Boolean.valueOf(z), str);
        return z;
    }

    public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        Log.i("ExtraPhotoWrapper", "onServiceConnected %s", (Object) iBinder);
        if (iBinder != null) {
            this.mDualService = Stub.asInterface(iBinder);
            callbackStarted(true);
            return;
        }
        callbackStarted(false);
    }

    public void onServiceDisconnected(ComponentName componentName) {
        Log.i("ExtraPhotoWrapper", "onServiceDisconnected %s", (Object) componentName);
    }

    public List<Integer> resolveExtraFuncs() {
        ArrayList arrayList = new ArrayList();
        if (this.mDualService != null) {
            try {
                List<ExtraFunc> resolveExtraFuncs = this.mDualService.resolveExtraFuncs();
                if (resolveExtraFuncs != null) {
                    for (ExtraFunc extraFunc : resolveExtraFuncs) {
                        int transFunc2Id = transFunc2Id(extraFunc);
                        if (transFunc2Id > 0) {
                            Log.i("ExtraPhotoWrapper", "resolveExtraFuncs %s", (Object) extraFunc.name());
                            arrayList.add(Integer.valueOf(transFunc2Id));
                        }
                    }
                }
            } catch (RemoteException e) {
                Log.e("ExtraPhotoWrapper", (Throwable) e);
            } catch (Exception e2) {
                Log.e("ExtraPhotoWrapper", (Throwable) e2);
            }
        }
        return arrayList;
    }

    public void start(Context context, StartCallback startCallback) {
        Log.i("ExtraPhotoWrapper", "resumeEcho");
        init(context, startCallback);
    }

    public void stop(Context context) {
        Log.i("ExtraPhotoWrapper", "pauseEcho");
        releaseEcho();
        this.mStartCallback = null;
        this.mDualService = null;
        unbindService(context);
    }

    public void unregisterEchoListener(BaseEchoListener baseEchoListener) {
        Log.i("ExtraPhotoWrapper", "unregisterEchoListener %s", (Object) baseEchoListener);
        if (this.mDualService != null) {
            try {
                this.mDualService.unregisterEchoListener(baseEchoListener);
            } catch (RemoteException e) {
                Log.e("ExtraPhotoWrapper", (Throwable) e);
            } catch (Exception e2) {
                Log.e("ExtraPhotoWrapper", (Throwable) e2);
            }
        }
    }
}
