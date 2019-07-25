package com.nexstreaming.app.common.nexasset.preview;

import android.content.Context;
import android.opengl.GLSurfaceView;
import android.opengl.GLSurfaceView.EGLConfigChooser;
import android.opengl.GLSurfaceView.Renderer;
import android.os.Handler;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View.MeasureSpec;
import com.nexstreaming.app.common.nexasset.assetpackage.ItemCategory;
import com.nexstreaming.app.common.nexasset.assetpackage.ItemType;
import com.nexstreaming.app.common.nexasset.assetpackage.c;
import com.nexstreaming.app.common.nexasset.assetpackage.f;
import com.nexstreaming.kminternal.kinemaster.config.NexEditorDeviceProfile;
import com.nexstreaming.kminternal.nexvideoeditor.NexImageLoader;
import com.nexstreaming.kminternal.nexvideoeditor.NexImageLoader.d;
import com.nexstreaming.kminternal.nexvideoeditor.NexThemeRenderer;
import java.io.IOException;
import java.util.Collections;
import javax.microedition.khronos.egl.EGL10;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.egl.EGLDisplay;
import javax.microedition.khronos.opengles.GL10;

/* compiled from: AssetPreviewView */
public class a extends GLSurfaceView {
    private static final long FRAME_RATE = 30;
    private static final long FRAME_TIME = 33;
    /* access modifiers changed from: private */
    public static String TAG = "NexThemePreviewView";
    private float mAspectRatio = 1.7777778f;
    /* access modifiers changed from: private */
    public float mColor = 0.0f;
    private int m_absTime = 0;
    /* access modifiers changed from: private */
    public c m_assetPackageManager;
    public boolean m_done = false;
    /* access modifiers changed from: private */
    public f m_effect;
    /* access modifiers changed from: private */
    public String m_effectOptions = null;
    /* access modifiers changed from: private */
    public long m_effectTime = 2000;
    /* access modifiers changed from: private */
    public long m_frameEnd;
    /* access modifiers changed from: private */
    public long m_frameStart;
    /* access modifiers changed from: private */
    public Handler m_handler = new Handler();
    /* access modifiers changed from: private */
    public boolean m_isClipEffect;
    /* access modifiers changed from: private */
    public boolean m_isRenderItem;
    /* access modifiers changed from: private */
    public NexThemeRenderer m_nexThemeRenderer = null;
    private d m_overlayPathResolver = null;
    /* access modifiers changed from: private */
    public long m_pauseTime = 1000;
    /* access modifiers changed from: private */
    public Object m_renderLock = new Object();
    /* access modifiers changed from: private */
    public f m_setEffect;
    /* access modifiers changed from: private */
    public String m_setEffectOptions = null;
    /* access modifiers changed from: private */
    public long m_setEffectTime = -1;
    /* access modifiers changed from: private */
    public boolean m_showOnRender = false;
    /* access modifiers changed from: private */
    public long m_startTime;
    /* access modifiers changed from: private */
    public boolean m_swapPlaceholders = false;

    /* renamed from: com.nexstreaming.app.common.nexasset.preview.a$a reason: collision with other inner class name */
    /* compiled from: AssetPreviewView */
    private class C0001a implements Renderer {
        private C0001a() {
        }

        /* JADX WARNING: Removed duplicated region for block: B:79:0x02b8 A[Catch:{ IOException -> 0x01c2 }] */
        /* JADX WARNING: Removed duplicated region for block: B:80:0x02b9 A[Catch:{ IOException -> 0x01c2 }] */
        public void onDrawFrame(GL10 gl10) {
            boolean z;
            boolean z2;
            boolean z3;
            boolean z4;
            boolean z5;
            GL10 gl102 = gl10;
            a.this.m_frameEnd = a.miliTime();
            if (a.this.m_frameStart == 0) {
                a.this.m_frameStart = a.this.m_frameEnd;
            }
            long access$100 = (a.FRAME_TIME - (a.this.m_frameEnd - a.this.m_frameStart)) - 5;
            if (access$100 > 5) {
                try {
                    Thread.sleep(access$100);
                } catch (InterruptedException unused) {
                    Log.d("NexThemePreviewView", "Preview sleep INTERRUPTED");
                }
            }
            a.this.m_frameStart = a.this.m_frameStart + a.FRAME_TIME;
            a.this.mColor = a.this.mColor + 0.005f;
            if (a.this.mColor > 1.0f) {
                a.this.mColor = 0.0f;
            }
            gl102.glClearColor(1.0f, 0.2f, a.this.mColor, 1.0f);
            gl102.glClear(16640);
            long j = -1;
            if (a.this.m_effectTime == 0) {
                z = false;
            } else {
                long access$600 = a.this.m_pauseTime + a.this.m_effectTime;
                long access$200 = (a.miliTime() - a.this.m_startTime) % (2 * access$600);
                long j2 = access$200 - (access$200 % a.FRAME_TIME);
                z = j2 > access$600 && !a.this.m_isClipEffect;
                j = j2;
            }
            if (z != a.this.m_swapPlaceholders) {
                a.this.m_swapPlaceholders = z;
                if (a.this.m_swapPlaceholders) {
                    a.this.m_nexThemeRenderer.setPlaceholders("placeholder2.jpg", "placeholder1.jpg");
                } else {
                    a.this.m_nexThemeRenderer.setPlaceholders("placeholder1.jpg", "placeholder2.jpg");
                }
                z2 = true;
            } else {
                z2 = false;
            }
            synchronized (a.this.m_renderLock) {
                if (a.this.m_nexThemeRenderer != null) {
                    if (a.this.m_effectOptions != a.this.m_setEffectOptions) {
                        a.this.m_setEffectOptions = a.this.m_effectOptions;
                        z4 = true;
                    } else {
                        z4 = false;
                    }
                    if (a.this.m_effect == null || a.this.m_effect == a.this.m_setEffect) {
                        z5 = false;
                    } else {
                        a.this.m_setEffect = a.this.m_effect;
                        z5 = true;
                    }
                    if (a.this.m_setEffectTime != a.this.m_effectTime) {
                        a.this.m_setEffectTime = a.this.m_effectTime;
                        z4 = true;
                    }
                    int i = 50;
                    if (a.this.m_assetPackageManager != null && (z4 || z5)) {
                        a.this.m_nexThemeRenderer.clearClipEffect();
                        a.this.m_nexThemeRenderer.clearTransitionEffect();
                        if (z5) {
                            String str = null;
                            try {
                                str = a.this.m_isRenderItem ? a.this.m_assetPackageManager.a((Iterable<String>) Collections.singletonList(a.this.m_effect.getId())) : a.this.m_assetPackageManager.a((Iterable<String>) Collections.singletonList(a.this.m_effect.getId()), false);
                            } catch (IOException e) {
                                e.printStackTrace();
                            }
                            StringBuilder sb = new StringBuilder();
                            sb.append(" m_isRenderItem=");
                            sb.append(a.this.m_isRenderItem);
                            sb.append(",m_isClipEffect=");
                            sb.append(a.this.m_isClipEffect);
                            Log.d("EffectPreviewView", sb.toString());
                            if (str != null) {
                                if (a.this.m_isRenderItem) {
                                    a.this.m_nexThemeRenderer.clearRenderItems();
                                    a.this.m_nexThemeRenderer.loadRenderItem(a.this.m_effect.getId(), str);
                                } else {
                                    a.this.m_nexThemeRenderer.a(str);
                                }
                            }
                        }
                        if (a.this.m_effect != null) {
                            if (a.this.m_isClipEffect) {
                                z3 = z2;
                                a.this.m_nexThemeRenderer.setClipEffect(a.this.m_effect.getId(), a.this.m_effectOptions, 1, 3, 0, ((int) a.this.m_effectTime) + 100, 50, ((int) a.this.m_effectTime) + 50);
                            } else {
                                z3 = z2;
                                a.this.m_nexThemeRenderer.setTransitionEffect(a.this.m_effect.getId(), a.this.m_effectOptions, 1, 3, 0, (int) a.this.m_effectTime);
                            }
                            NexThemeRenderer access$1000 = a.this.m_nexThemeRenderer;
                            int min = (int) Math.min(j % (a.this.m_pauseTime + a.this.m_effectTime), a.this.m_effectTime - 1);
                            if (a.this.m_isClipEffect) {
                                i = 0;
                            }
                            access$1000.setCTS(min + i);
                            a.this.m_nexThemeRenderer.render();
                        }
                    }
                    z3 = z2;
                    NexThemeRenderer access$10002 = a.this.m_nexThemeRenderer;
                    int min2 = (int) Math.min(j % (a.this.m_pauseTime + a.this.m_effectTime), a.this.m_effectTime - 1);
                    if (a.this.m_isClipEffect) {
                    }
                    access$10002.setCTS(min2 + i);
                    a.this.m_nexThemeRenderer.render();
                } else {
                    z3 = z2;
                }
            }
            if (a.this.m_showOnRender) {
                a.this.m_showOnRender = false;
                a.this.m_handler.post(new Runnable() {
                    public void run() {
                        a.this.setVisibility(0);
                    }
                });
            }
            if (z3) {
                long access$2002 = a.miliTime() - a.this.m_frameEnd;
                a.this.m_startTime = a.this.m_startTime + access$2002;
                a.this.m_frameStart = a.this.m_frameStart + access$2002;
            }
        }

        public void onSurfaceChanged(GL10 gl10, int i, int i2) {
            Log.d(a.TAG, "onSurfaceChanged");
            gl10.glViewport(0, 0, i, i2);
            if (a.this.m_nexThemeRenderer != null) {
                a.this.m_nexThemeRenderer.surfaceChange(i, i2);
            }
        }

        public void onSurfaceCreated(GL10 gl10, EGLConfig eGLConfig) {
            Log.d(a.TAG, "onSurfaceCreated");
        }
    }

    public a(Context context) {
        super(context);
        init(false, 0, 1);
    }

    public a(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        init(false, 0, 1);
    }

    public a(Context context, boolean z, int i, int i2) {
        super(context);
        init(z, i, 1);
    }

    private void destroyRenderer() {
        synchronized (this.m_renderLock) {
            if (this.m_nexThemeRenderer != null) {
                this.m_nexThemeRenderer.deinit(true);
                this.m_nexThemeRenderer = null;
            }
        }
    }

    private void init(boolean z, int i, int i2) {
        this.m_assetPackageManager = c.a(getContext());
        setEGLContextClientVersion(2);
        setZOrderOnTop(true);
        getHolder().setFormat(1);
        final NexEditorDeviceProfile deviceProfile = NexEditorDeviceProfile.getDeviceProfile();
        setEGLConfigChooser(new EGLConfigChooser() {
            public EGLConfig chooseConfig(EGL10 egl10, EGLDisplay eGLDisplay) {
                int[] iArr;
                int[] iArr2 = new int[19];
                iArr2[0] = 12352;
                iArr2[1] = 4;
                int i = 2;
                iArr2[2] = 12324;
                iArr2[3] = 8;
                iArr2[4] = 12323;
                iArr2[5] = 8;
                iArr2[6] = 12322;
                iArr2[7] = 8;
                iArr2[8] = 12321;
                iArr2[9] = 8;
                iArr2[10] = 12326;
                iArr2[11] = 1;
                iArr2[12] = 12338;
                iArr2[13] = deviceProfile.getGLMultisample();
                iArr2[14] = 12337;
                if (!deviceProfile.getGLMultisample()) {
                    i = 0;
                }
                iArr2[15] = i;
                iArr2[16] = 12325;
                iArr2[17] = deviceProfile.getGLDepthBufferBits();
                iArr2[18] = 12344;
                int[] iArr3 = {12352, 4, 12324, 8, 12323, 8, 12322, 8, 12321, 8, 12326, 8, 12344};
                int[] iArr4 = new int[1];
                egl10.eglChooseConfig(eGLDisplay, iArr2, null, 0, iArr4);
                if (iArr4[0] < 1) {
                    iArr = iArr4;
                    iArr2 = iArr3;
                    egl10.eglChooseConfig(eGLDisplay, iArr3, null, 0, iArr);
                } else {
                    iArr = iArr4;
                }
                int[] iArr5 = iArr2;
                EGLConfig[] eGLConfigArr = new EGLConfig[iArr[0]];
                egl10.eglChooseConfig(eGLDisplay, iArr5, eGLConfigArr, eGLConfigArr.length, iArr);
                return eGLConfigArr[0];
            }
        });
        C0001a aVar = new C0001a();
        setRenderer(aVar);
        setRenderMode(1);
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("GL View Created ");
        sb.append(aVar);
        Log.d(str, sb.toString());
        this.m_startTime = miliTime();
    }

    private void makeRenderer() {
        if (this.m_nexThemeRenderer == null && !this.m_done) {
            this.m_nexThemeRenderer = new NexThemeRenderer();
            com.nexstreaming.kminternal.nexvideoeditor.a e = c.a(getContext()).e();
            NexThemeRenderer nexThemeRenderer = this.m_nexThemeRenderer;
            NexImageLoader nexImageLoader = new NexImageLoader(getContext().getResources(), e, this.m_overlayPathResolver, 1440, 810, 1500000);
            nexThemeRenderer.init(nexImageLoader);
            if (!this.m_swapPlaceholders || this.m_isClipEffect) {
                this.m_nexThemeRenderer.setPlaceholders("placeholder1.jpg", "placeholder2.jpg");
            } else {
                this.m_nexThemeRenderer.setPlaceholders("placeholder2.jpg", "placeholder1.jpg");
            }
        }
    }

    /* access modifiers changed from: private */
    public static long miliTime() {
        return System.nanoTime() / 1000000;
    }

    public void deinitRenderer() {
    }

    public float getAspectRatio() {
        return this.mAspectRatio;
    }

    public String getEffectOptions() {
        return this.m_effectOptions;
    }

    public int getPauseTime() {
        return (int) this.m_pauseTime;
    }

    public int getRenderingMode() {
        return getRenderMode();
    }

    /* access modifiers changed from: protected */
    public void onAttachedToWindow() {
        makeRenderer();
        super.onAttachedToWindow();
    }

    /* access modifiers changed from: protected */
    public void onDetachedFromWindow() {
        destroyRenderer();
        super.onDetachedFromWindow();
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int i, int i2) {
        int size = MeasureSpec.getSize(i);
        int size2 = MeasureSpec.getSize(i2);
        if (this.mAspectRatio > 0.0f) {
            float f = (float) size2;
            float f2 = (float) size;
            if (this.mAspectRatio * f > f2) {
                size2 = (int) (f2 / this.mAspectRatio);
            } else {
                size = (int) (f * this.mAspectRatio);
            }
        }
        setMeasuredDimension(size, size2);
    }

    public void resumeRendering() {
        setRenderMode(1);
    }

    public void setAspectRatio(float f) {
        this.mAspectRatio = f;
    }

    public void setEffect(f fVar) {
        if (fVar != this.m_effect) {
            this.m_startTime = miliTime();
            boolean z = false;
            this.m_isClipEffect = fVar.getCategory() == ItemCategory.effect;
            if (fVar.getType() == ItemType.renderitem) {
                z = true;
            }
            this.m_isRenderItem = z;
            this.m_effect = fVar;
        }
    }

    public void setEffect(String str) {
        setEffect(c.a(getContext()).c(str));
    }

    public void setEffectOptions(String str) {
        if (str == null || this.m_effectOptions == null || !str.equals(this.m_effectOptions)) {
            this.m_effectOptions = str;
        }
    }

    public void setEffectTime(int i) {
        long j = (long) i;
        if (j != this.m_effectTime) {
            this.m_startTime = miliTime();
            this.m_effectTime = j;
        }
    }

    public void setOverlayPathResolver(d dVar) {
        this.m_overlayPathResolver = dVar;
    }

    public void setPauseTime(int i) {
        this.m_pauseTime = (long) i;
    }

    public void showOnRender() {
        this.m_showOnRender = true;
    }

    public void stepBackward(int i) {
        this.m_absTime -= i;
        if (this.m_absTime < 0) {
            this.m_absTime = 0;
        }
        if (this.m_absTime > 60) {
            this.m_absTime = 60;
        }
        this.m_effectTime = 0;
    }

    public void stepForward(int i) {
        this.m_absTime += i;
        if (this.m_absTime < 0) {
            this.m_absTime = 0;
        }
        if (this.m_absTime > 60) {
            this.m_absTime = 60;
        }
        this.m_effectTime = 0;
    }

    public void suspendRendering() {
        setRenderMode(0);
    }
}
