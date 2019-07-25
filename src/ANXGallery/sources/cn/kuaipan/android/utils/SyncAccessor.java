package cn.kuaipan.android.utils;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;

public class SyncAccessor extends Handler {

    public static class Args {
        private static Args mPool;
        private static int mPoolSize = 0;
        private static Object mPoolSync = new Object();
        public RuntimeException err;
        public volatile boolean handled = false;
        private Args next;
        public Object[] params;
        public Object result;

        private void clearForRecycle() {
            this.params = null;
            this.result = null;
            this.err = null;
            this.handled = false;
        }

        public static Args obtain() {
            synchronized (mPoolSync) {
                if (mPool == null) {
                    return new Args();
                }
                Args args = mPool;
                mPool = args.next;
                args.next = null;
                return args;
            }
        }

        public void recycle() {
            synchronized (mPoolSync) {
                if (mPoolSize < 10) {
                    clearForRecycle();
                    this.next = mPool;
                    mPool = this;
                }
            }
        }
    }

    public SyncAccessor(Looper looper) {
        super(looper);
    }

    private boolean isAlive() {
        Looper looper = getLooper();
        if (looper == null) {
            return false;
        }
        Thread thread = looper.getThread();
        return thread != null && thread.isAlive();
    }

    public synchronized <T> T access(int i, Object... objArr) throws InterruptedException {
        T t;
        Args obtain = Args.obtain();
        obtain.params = objArr;
        if (sendMessage(obtainMessage(i, obtain))) {
            while (!obtain.handled) {
                if (isAlive()) {
                    synchronized (obtain) {
                        obtain.wait(50);
                    }
                } else {
                    throw new RuntimeException("SyncAccessor has dead.");
                }
            }
            t = obtain.result;
            RuntimeException runtimeException = obtain.err;
            obtain.recycle();
            if (runtimeException != null) {
                throw runtimeException;
            }
        } else {
            throw new RuntimeException("SyncAccessor has dead.");
        }
        return t;
    }

    public void dispatchMessage(Message message) {
        Object obj = message.obj;
        if (obj == null || !(obj instanceof Args)) {
            super.dispatchMessage(message);
            return;
        }
        Args args = (Args) obj;
        try {
            args.result = handleAccess(message.what, args.params);
            args.handled = true;
            synchronized (args) {
                args.notifyAll();
            }
        } catch (RuntimeException e) {
            try {
                args.err = e;
                args.handled = true;
                synchronized (args) {
                    args.notifyAll();
                }
            } catch (Throwable th) {
                args.handled = true;
                synchronized (args) {
                    args.notifyAll();
                    throw th;
                }
            }
        }
    }

    public Object handleAccess(int i, Object... objArr) {
        return null;
    }
}
