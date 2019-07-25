package com.nexstreaming.nexeditorsdk;

import android.graphics.SurfaceTexture;
import android.graphics.SurfaceTexture.OnFrameAvailableListener;
import android.os.Build.VERSION;
import android.os.Handler;
import android.os.HandlerThread;
import android.util.Log;
import java.security.InvalidParameterException;
import java.util.concurrent.Semaphore;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.TimeUnit;

public class WrapperForSurfaceTextureListener implements OnFrameAvailableListener {
    private static final String LOG_TAG = "WrapperForSTL";
    private static Handler sHandler;
    private static HandlerThread sHandlerThread;
    private static int sIntanceNum;
    private SurfaceTexture mConnectedSurfaceTexture = null;
    private Semaphore mFrameAvailableSemaphore = new Semaphore(0);
    private final int mInstanceNum;

    public WrapperForSurfaceTextureListener(int i) {
        int i2 = sIntanceNum + 1;
        sIntanceNum = i2;
        this.mInstanceNum = i2;
        String str = LOG_TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("[W:");
        sb.append(this.mInstanceNum);
        sb.append("] WrapperForSurfaceTextureListener Constructor. a=");
        sb.append(i);
        Log.d(str, sb.toString());
    }

    public static SurfaceTexture makeSurfaceTexture(final int i) {
        final SynchronousQueue synchronousQueue = new SynchronousQueue();
        if (sHandler == null || sHandlerThread == null) {
            sHandlerThread = new HandlerThread("surfaceTextureFactory", -2);
            sHandlerThread.start();
            sHandler = new Handler(sHandlerThread.getLooper());
        }
        sHandler.post(new Runnable() {
            public void run() {
                SurfaceTexture surfaceTexture = new SurfaceTexture(i);
                while (true) {
                    try {
                        break;
                    } catch (InterruptedException unused) {
                        Thread.currentThread().interrupt();
                    }
                }
                if (!synchronousQueue.offer(surfaceTexture, 1000, TimeUnit.MILLISECONDS)) {
                    surfaceTexture.release();
                    Log.w(WrapperForSurfaceTextureListener.LOG_TAG, "Surface texture abandoned");
                }
            }
        });
        SurfaceTexture surfaceTexture = null;
        while (surfaceTexture == null) {
            try {
                surfaceTexture = (SurfaceTexture) synchronousQueue.take();
            } catch (InterruptedException unused) {
                Thread.currentThread().interrupt();
            }
        }
        return surfaceTexture;
    }

    public void connectListener(final SurfaceTexture surfaceTexture) {
        if (this.mConnectedSurfaceTexture == null) {
            String str = LOG_TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("[W:");
            sb.append(this.mInstanceNum);
            sb.append("] WrapperForSurfaceTextureListener connectListener.");
            Log.d(str, sb.toString());
            this.mFrameAvailableSemaphore.drainPermits();
            if (VERSION.SDK_INT >= 21) {
                surfaceTexture.setOnFrameAvailableListener(this, sHandler);
            } else {
                sHandler.post(new Runnable() {
                    public void run() {
                        surfaceTexture.setOnFrameAvailableListener(WrapperForSurfaceTextureListener.this);
                    }
                });
            }
            this.mConnectedSurfaceTexture = surfaceTexture;
            return;
        }
        throw new IllegalStateException();
    }

    public void disconnectListener(SurfaceTexture surfaceTexture) {
        if (surfaceTexture == this.mConnectedSurfaceTexture) {
            String str = LOG_TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("[W:");
            sb.append(this.mInstanceNum);
            sb.append("] WrapperForSurfaceTextureListener disconnectListener.");
            Log.d(str, sb.toString());
            surfaceTexture.setOnFrameAvailableListener(null);
            this.mConnectedSurfaceTexture = null;
            return;
        }
        throw new InvalidParameterException();
    }

    public void onFrameAvailable(SurfaceTexture surfaceTexture) {
        if (surfaceTexture != this.mConnectedSurfaceTexture) {
            String str = LOG_TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("[W:");
            sb.append(this.mInstanceNum);
            sb.append("] WARNING - Frame available to wrong listener : ");
            sb.append(surfaceTexture);
            sb.append(" != ");
            sb.append(String.valueOf(this.mConnectedSurfaceTexture));
            Log.w(str, sb.toString());
            return;
        }
        this.mFrameAvailableSemaphore.release();
    }

    public int waitFrameAvailable(int i) {
        if (this.mConnectedSurfaceTexture != null) {
            if (i < 0) {
                i = 2500;
            }
            long nanoTime = System.nanoTime();
            int i2 = 0;
            boolean z = false;
            while (true) {
                try {
                    break;
                } catch (InterruptedException unused) {
                    Thread.currentThread().interrupt();
                    z = true;
                }
            }
            boolean z2 = !this.mFrameAvailableSemaphore.tryAcquire((long) i, TimeUnit.MILLISECONDS);
            long nanoTime2 = System.nanoTime() - nanoTime;
            if (z2) {
                String str = LOG_TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("[W:");
                sb.append(this.mInstanceNum);
                sb.append("] waitFrameAvailable : (elapsed=");
                sb.append(nanoTime2);
                sb.append(") timeout=");
                sb.append(z2);
                sb.append(" interrupted=");
                sb.append(z);
                Log.w(str, sb.toString());
            }
            int i3 = z2 ? 4 : 0;
            if (z) {
                i2 = 8;
            }
            return i3 | i2;
        }
        throw new IllegalStateException();
    }
}
