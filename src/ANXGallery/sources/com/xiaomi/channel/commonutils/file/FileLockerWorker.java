package com.xiaomi.channel.commonutils.file;

import android.content.Context;
import java.io.File;
import java.io.IOException;

public abstract class FileLockerWorker implements Runnable {
    private Context mContext;
    private File mFile;
    private Runnable mRunnable;

    private FileLockerWorker(Context context, File file) {
        this.mContext = context;
        this.mFile = file;
    }

    public static void runMutiProcessJob(Context context, File file, final Runnable runnable) {
        new FileLockerWorker(context, file) {
            /* access modifiers changed from: protected */
            public void doWork(Context context) {
                if (runnable != null) {
                    runnable.run();
                }
            }
        }.run();
    }

    /* access modifiers changed from: protected */
    public abstract void doWork(Context context);

    /* JADX WARNING: Removed duplicated region for block: B:22:0x0042  */
    /* JADX WARNING: Removed duplicated region for block: B:24:0x0048  */
    /* JADX WARNING: Removed duplicated region for block: B:29:? A[RETURN, SYNTHETIC] */
    public final void run() {
        FileLocker fileLocker = null;
        try {
            if (this.mFile == null) {
                this.mFile = new File(this.mContext.getFilesDir(), "default_locker");
            }
            FileLocker lock = FileLocker.lock(this.mContext, this.mFile);
            try {
                if (this.mRunnable != null) {
                    this.mRunnable.run();
                }
                doWork(this.mContext);
                if (lock != null) {
                    lock.unlock();
                }
            } catch (IOException e) {
                FileLocker fileLocker2 = lock;
                e = e;
                fileLocker = fileLocker2;
                try {
                    e.printStackTrace();
                    if (fileLocker == null) {
                    }
                } catch (Throwable th) {
                    th = th;
                    if (fileLocker != null) {
                        fileLocker.unlock();
                    }
                    throw th;
                }
            } catch (Throwable th2) {
                FileLocker fileLocker3 = lock;
                th = th2;
                fileLocker = fileLocker3;
                if (fileLocker != null) {
                }
                throw th;
            }
        } catch (IOException e2) {
            e = e2;
            e.printStackTrace();
            if (fileLocker == null) {
                fileLocker.unlock();
            }
        }
    }
}
