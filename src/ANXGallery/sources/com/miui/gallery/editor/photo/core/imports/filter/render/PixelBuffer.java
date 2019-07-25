package com.miui.gallery.editor.photo.core.imports.filter.render;

import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.opengl.GLSurfaceView.Renderer;
import android.os.Build;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import java.nio.ByteBuffer;
import java.util.HashMap;
import javax.microedition.khronos.egl.EGL10;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.egl.EGLContext;
import javax.microedition.khronos.egl.EGLDisplay;
import javax.microedition.khronos.egl.EGLSurface;
import javax.microedition.khronos.opengles.GL10;

public class PixelBuffer {
    Bitmap mBitmap;
    EGL10 mEGL = ((EGL10) EGLContext.getEGL());
    EGLConfig mEGLConfig;
    EGLConfig[] mEGLConfigs;
    EGLContext mEGLContext;
    EGLDisplay mEGLDisplay = this.mEGL.eglGetDisplay(EGL10.EGL_DEFAULT_DISPLAY);
    EGLSurface mEGLSurface;
    GL10 mGL;
    int mHeight;
    Renderer mRenderer;
    String mThreadOwner;
    int mWidth;

    public PixelBuffer(int i, int i2) {
        this.mWidth = i;
        this.mHeight = i2;
        int[] iArr = new int[2];
        int[] iArr2 = {12375, this.mWidth, 12374, this.mHeight, 12344};
        this.mEGL.eglInitialize(this.mEGLDisplay, iArr);
        this.mEGLConfig = chooseConfig();
        this.mEGLContext = this.mEGL.eglCreateContext(this.mEGLDisplay, this.mEGLConfig, EGL10.EGL_NO_CONTEXT, new int[]{12440, 2, 12344});
        this.mEGLSurface = this.mEGL.eglCreatePbufferSurface(this.mEGLDisplay, this.mEGLConfig, iArr2);
        this.mEGL.eglMakeCurrent(this.mEGLDisplay, this.mEGLSurface, this.mEGLSurface, this.mEGLContext);
        this.mGL = (GL10) this.mEGLContext.getGL();
        this.mThreadOwner = Thread.currentThread().getName();
    }

    private EGLConfig chooseConfig() {
        int[] iArr = new int[1];
        int[] iArr2 = {12325, 0, 12326, 0, 12324, 8, 12323, 8, 12322, 8, 12321, 8, 12352, 4, 12344};
        int[] iArr3 = iArr;
        this.mEGL.eglChooseConfig(this.mEGLDisplay, iArr2, null, 0, iArr3);
        int i = iArr[0];
        this.mEGLConfigs = new EGLConfig[i];
        this.mEGL.eglChooseConfig(this.mEGLDisplay, iArr2, this.mEGLConfigs, i, iArr3);
        return this.mEGLConfigs[0];
    }

    private void convertToBitmap(Bitmap bitmap) {
        if (bitmap == null || bitmap.isRecycled() || bitmap.getConfig() != Config.ARGB_8888) {
            this.mBitmap = Bitmap.createBitmap(this.mWidth, this.mHeight, Config.ARGB_8888);
        } else {
            this.mBitmap = bitmap;
        }
        ByteBuffer allocate = ByteBuffer.allocate(this.mBitmap.getByteCount());
        this.mGL.glReadPixels(0, 0, this.mWidth, this.mHeight, 6408, 5121, allocate);
        allocate.rewind();
        Log.d("PixelBuffer", "convertToBitmap width:%d,height:%d,byteCount:%d,capacity:%d", Integer.valueOf(this.mWidth), Integer.valueOf(this.mHeight), Integer.valueOf(this.mBitmap.getByteCount()), Integer.valueOf(allocate.capacity()));
        this.mBitmap.copyPixelsFromBuffer(allocate);
    }

    public void destroy() {
        this.mRenderer.onDrawFrame(this.mGL);
        this.mEGL.eglMakeCurrent(this.mEGLDisplay, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_SURFACE, EGL10.EGL_NO_CONTEXT);
        this.mEGL.eglDestroySurface(this.mEGLDisplay, this.mEGLSurface);
        this.mEGL.eglDestroyContext(this.mEGLDisplay, this.mEGLContext);
        this.mEGL.eglTerminate(this.mEGLDisplay);
    }

    public boolean draw() {
        if (this.mRenderer == null) {
            Log.e("PixelBuffer", "getBitmap: Renderer was not set.");
            return false;
        } else if (!Thread.currentThread().getName().equals(this.mThreadOwner)) {
            Log.e("PixelBuffer", "getBitmap: This thread does not own the OpenGL context.");
            return false;
        } else {
            this.mRenderer.onDrawFrame(this.mGL);
            return true;
        }
    }

    public Bitmap getBitmap(Bitmap bitmap) {
        if (this.mRenderer == null) {
            Log.e("PixelBuffer", "getBitmap: Renderer was not set.");
            return null;
        } else if (!Thread.currentThread().getName().equals(this.mThreadOwner)) {
            Log.e("PixelBuffer", "getBitmap: This thread does not own the OpenGL context.");
            return null;
        } else {
            this.mEGL.eglSwapBuffers(this.mEGLDisplay, this.mEGLSurface);
            this.mRenderer.onDrawFrame(this.mGL);
            try {
                convertToBitmap(bitmap);
            } catch (OutOfMemoryError e) {
                StringBuilder sb = new StringBuilder();
                sb.append("convertToBitmap error:");
                sb.append(e.toString());
                Log.e("PixelBuffer", sb.toString());
                HashMap hashMap = new HashMap();
                hashMap.put(nexExportFormat.TAG_FORMAT_TYPE, "pixelBuffer");
                hashMap.put("model", Build.MODEL);
                GallerySamplingStatHelper.recordCountEvent("photo_editor", "memory_error", hashMap);
                return null;
            } catch (Exception e2) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("convertToBitmap error:");
                sb2.append(e2.toString());
                Log.e("PixelBuffer", sb2.toString());
            }
            return this.mBitmap;
        }
    }

    public void resetSize(int i, int i2) {
        this.mWidth = i;
        this.mHeight = i2;
        this.mRenderer.onSurfaceChanged(this.mGL, this.mWidth, this.mHeight);
    }

    public void setRenderer(Renderer renderer) {
        this.mRenderer = renderer;
        if (!Thread.currentThread().getName().equals(this.mThreadOwner)) {
            Log.e("PixelBuffer", "setRenderer: This thread does not own the OpenGL context.");
            return;
        }
        this.mRenderer.onSurfaceCreated(this.mGL, this.mEGLConfig);
        this.mRenderer.onSurfaceChanged(this.mGL, this.mWidth, this.mHeight);
    }
}
