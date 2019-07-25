package com.xiaomi.micloudsdk.remote;

import android.content.ComponentName;
import android.content.Context;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;
import com.xiaomi.micloudsdk.utils.ThreadUtil;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.FutureTask;

public abstract class RemoteMethodInvoker<R> implements ServiceConnection {
    private final AsyncFuture<IBinder> future = new AsyncFuture<>();
    private final Context mContext;

    private static class AsyncFuture<V> extends FutureTask<V> {
        public AsyncFuture() {
            super(new Callable<V>() {
                public V call() throws Exception {
                    throw new IllegalStateException("this should never be called");
                }
            });
        }

        public void setResult(V v) {
            set(v);
        }
    }

    public RemoteMethodInvoker(Context context) {
        if (context != null) {
            this.mContext = context.getApplicationContext();
            return;
        }
        throw new IllegalArgumentException("context can't be null");
    }

    /* access modifiers changed from: protected */
    public abstract boolean bindService(Context context, ServiceConnection serviceConnection);

    /* JADX WARNING: Missing exception handler attribute for start block: B:14:0x002e */
    public R invoke() {
        ThreadUtil.ensureWorkerThread();
        if (bindService(this.mContext, this)) {
            try {
                R invokeRemoteMethod = invokeRemoteMethod((IBinder) this.future.get());
                this.mContext.unbindService(this);
                return invokeRemoteMethod;
            } catch (InterruptedException ) {
                Thread.currentThread().interrupt();
            } catch (ExecutionException unused) {
            } catch (RemoteException e) {
                Log.e("RemoteMethodInvoker", "error while invoking service methods", e);
            } catch (Throwable th) {
                this.mContext.unbindService(this);
                throw th;
            }
        } else {
            Log.e("RemoteMethodInvoker", "Cannot bind remote service.");
            return null;
        }
        this.mContext.unbindService(this);
        return null;
    }

    /* access modifiers changed from: protected */
    public abstract R invokeRemoteMethod(IBinder iBinder) throws RemoteException;

    public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        StringBuilder sb = new StringBuilder();
        sb.append("RemoteMethodInvoker connects remote service ");
        sb.append(componentName.getShortClassName());
        Log.i("RemoteMethodInvoker", sb.toString());
        this.future.setResult(iBinder);
    }

    public void onServiceDisconnected(ComponentName componentName) {
    }
}
