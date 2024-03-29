package com.cdv.io;

import android.content.Context;
import android.graphics.SurfaceTexture;
import android.hardware.Camera;
import android.hardware.Camera.AutoFocusCallback;
import android.hardware.Camera.ErrorCallback;
import android.hardware.Camera.OnZoomChangeListener;
import android.hardware.Camera.Parameters;
import android.hardware.Camera.PreviewCallback;
import android.hardware.Camera.Size;
import android.os.Build.VERSION;
import android.os.Handler;
import android.util.Log;
import android.view.OrientationEventListener;
import com.cdv.io.NvAndroidAudioRecorder.RecordDataCallback;
import java.nio.ByteBuffer;
import java.util.concurrent.Semaphore;

public class NvCamera implements AutoFocusCallback, ErrorCallback, OnZoomChangeListener, PreviewCallback, RecordDataCallback {
    private static final String TAG = "CDV Camera";
    private NvAndroidAudioRecorder m_audioRecorder = null;
    private Camera m_camera = null;
    /* access modifiers changed from: private */
    public int m_cameraId = -1;
    private OrientationEventListener m_orientationEventListener;
    private Size m_previewSize = null;

    static class CameraOpenParam {
        Camera m_cam;
        Semaphore m_semaphore;

        CameraOpenParam() {
        }
    }

    private NvCamera(int i, Camera camera, Context context) {
        this.m_cameraId = i;
        this.m_camera = camera;
        camera.setErrorCallback(this);
        camera.setZoomChangeListener(this);
        this.m_orientationEventListener = new OrientationEventListener(context, 3) {
            public void onOrientationChanged(int i) {
                NvCamera.notifyOrientationChange(NvCamera.this.m_cameraId, i);
            }
        };
    }

    private static native void notifyAudioRecordData(int i, ByteBuffer byteBuffer, int i2);

    private static native void notifyAutoFocusComplete(int i, boolean z);

    private static native void notifyError(int i, int i2);

    private static native void notifyNewPreviewFrame(int i, byte[] bArr, int i2, int i3);

    /* access modifiers changed from: private */
    public static native void notifyOrientationChange(int i, int i2);

    private static native void notifyZoomChange(int i, int i2, boolean z);

    public static NvCamera open(final int i, Context context, Handler handler) {
        Camera camera;
        if (handler != null) {
            try {
                final CameraOpenParam cameraOpenParam = new CameraOpenParam();
                cameraOpenParam.m_semaphore = new Semaphore(0);
                handler.post(new Runnable() {
                    public void run() {
                        try {
                            cameraOpenParam.m_cam = Camera.open(i);
                        } catch (Exception e) {
                            String str = NvCamera.TAG;
                            StringBuilder sb = new StringBuilder();
                            sb.append("");
                            sb.append(e.getMessage());
                            Log.e(str, sb.toString());
                            e.printStackTrace();
                        } catch (Throwable th) {
                            cameraOpenParam.m_semaphore.release();
                            throw th;
                        }
                        cameraOpenParam.m_semaphore.release();
                    }
                });
                cameraOpenParam.m_semaphore.acquire();
                if (cameraOpenParam.m_cam == null) {
                    return null;
                }
                camera = cameraOpenParam.m_cam;
            } catch (Exception e) {
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("Failed to open camera(index=");
                sb.append(i);
                sb.append(")!");
                Log.e(str, sb.toString());
                String str2 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("");
                sb2.append(e.getMessage());
                Log.e(str2, sb2.toString());
                return null;
            }
        } else {
            camera = Camera.open(i);
        }
        return new NvCamera(i, camera, context);
    }

    public void autoFocus() {
        this.m_camera.autoFocus(this);
    }

    public void cancelAutoFocus() {
        this.m_camera.cancelAutoFocus();
    }

    public Parameters getParameters() {
        return this.m_camera.getParameters();
    }

    public void lock() {
        try {
            this.m_camera.lock();
        } catch (Exception e) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("");
            sb.append(e.getMessage());
            Log.e(str, sb.toString());
        }
    }

    public void onAudioRecordDataArrived(ByteBuffer byteBuffer, int i) {
        notifyAudioRecordData(this.m_cameraId, byteBuffer, i);
    }

    public void onAutoFocus(boolean z, Camera camera) {
        notifyAutoFocusComplete(this.m_cameraId, z);
    }

    public void onError(int i, Camera camera) {
        notifyError(this.m_cameraId, i);
    }

    public void onPreviewFrame(byte[] bArr, Camera camera) {
        if (bArr != null) {
            notifyNewPreviewFrame(this.m_cameraId, bArr, this.m_previewSize.width, this.m_previewSize.height);
        }
    }

    public void onZoomChange(int i, boolean z, Camera camera) {
        notifyZoomChange(this.m_cameraId, i, z);
    }

    public void reconnect() {
        try {
            this.m_camera.reconnect();
        } catch (Exception e) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("");
            sb.append(e.getMessage());
            Log.e(str, sb.toString());
        }
    }

    public void release() {
        this.m_camera.release();
    }

    public void setDisplayOrientation(int i) {
        this.m_camera.setDisplayOrientation(i);
    }

    public void setParameters(Parameters parameters) {
        try {
            this.m_camera.setParameters(parameters);
        } catch (Exception e) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("");
            sb.append(e.getMessage());
            Log.e(str, sb.toString());
        }
    }

    public void setPreviewTexture(SurfaceTexture surfaceTexture) {
        try {
            this.m_camera.setPreviewTexture(surfaceTexture);
        } catch (Exception e) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("");
            sb.append(e.getMessage());
            Log.e(str, sb.toString());
        }
    }

    public int startPreview(boolean z, boolean z2) {
        if (z2) {
            this.m_audioRecorder = new NvAndroidAudioRecorder();
            if (!this.m_audioRecorder.startRecord(this)) {
                this.m_audioRecorder.releaseAudioRecorder();
                this.m_audioRecorder = null;
            }
        }
        if (this.m_orientationEventListener.canDetectOrientation()) {
            this.m_orientationEventListener.enable();
        }
        if (z) {
            try {
                this.m_previewSize = this.m_camera.getParameters().getPreviewSize();
                this.m_camera.setPreviewCallback(this);
            } catch (Exception e) {
                e.printStackTrace();
                String str = TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("");
                sb.append(e.getMessage());
                Log.e(str, sb.toString());
                return 2;
            }
        }
        if (VERSION.SDK_INT >= 24) {
            this.m_camera.setDisplayOrientation(0);
        }
        this.m_camera.startPreview();
        return (!z2 || this.m_audioRecorder != null) ? 0 : 1;
    }

    public void startSmoothZoom(int i) {
        try {
            this.m_camera.startSmoothZoom(i);
        } catch (Exception e) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("");
            sb.append(e.getMessage());
            Log.e(str, sb.toString());
        }
    }

    public void stopPreview() {
        if (this.m_audioRecorder != null) {
            this.m_audioRecorder.stopRecord();
            this.m_audioRecorder.releaseAudioRecorder();
            this.m_audioRecorder = null;
        }
        if (this.m_orientationEventListener.canDetectOrientation()) {
            this.m_orientationEventListener.disable();
        }
        this.m_camera.stopPreview();
        this.m_camera.setPreviewCallback(null);
    }

    public void stopSmoothZoom() {
        try {
            this.m_camera.stopSmoothZoom();
        } catch (Exception e) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("");
            sb.append(e.getMessage());
            Log.e(str, sb.toString());
        }
    }

    public void unlock() {
        try {
            this.m_camera.unlock();
        } catch (Exception e) {
            String str = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("");
            sb.append(e.getMessage());
            Log.e(str, sb.toString());
        }
    }
}
