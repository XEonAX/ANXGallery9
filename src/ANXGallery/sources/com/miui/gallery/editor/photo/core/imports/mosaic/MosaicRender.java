package com.miui.gallery.editor.photo.core.imports.mosaic;

import android.graphics.Bitmap;
import android.opengl.GLES20;
import com.miui.filtersdk.utils.OpenGlUtils;
import com.miui.gallery.editor.photo.core.imports.mosaic.shader.GLTransparentShader;
import com.miui.gallery.editor.photo.widgets.glview.AbstractRender;
import com.miui.gallery.editor.photo.widgets.glview.GLFBOManager;
import com.miui.gallery.editor.photo.widgets.glview.shader.GLTextureShader;
import com.miui.gallery.util.Log;
import java.util.Iterator;
import java.util.LinkedList;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.opengles.GL10;

class MosaicRender extends AbstractRender {
    /* access modifiers changed from: private */
    public MosaicGLEntity mCurrentEntity;
    /* access modifiers changed from: private */
    public GLFBOManager mEffectFBOManager;
    float[] mGLPosition = new float[8];
    /* access modifiers changed from: private */
    public GLTextureShader mGLTextureShader;
    /* access modifiers changed from: private */
    public GLTransparentShader mGLTransparentDrawable;
    /* access modifiers changed from: private */
    public Iterator mIterator;
    /* access modifiers changed from: private */
    public GLRectF mLastRect = new GLRectF();
    /* access modifiers changed from: private */
    public GLFBOManager mMaskFBOManager;
    /* access modifiers changed from: private */
    public float[] mMaskPosition = new float[8];
    /* access modifiers changed from: private */
    public MosaicEffectProcessor mMosaicEffectProcessor;
    /* access modifiers changed from: private */
    public Bitmap mOriginBitmap;
    /* access modifiers changed from: private */
    public GLFBOManager mOriginFBOManager;
    /* access modifiers changed from: private */
    public int mOriginTextureId;
    /* access modifiers changed from: private */
    public Bitmap mPenMask;
    /* access modifiers changed from: private */
    public int mPenTexture;
    /* access modifiers changed from: private */
    public int mViewHeight;
    /* access modifiers changed from: private */
    public int mViewWidth;

    private class CaptureTask implements Runnable {
        private final MosaicUndoManager mMosaicUndoManager;

        CaptureTask(MosaicUndoManager mosaicUndoManager) {
            this.mMosaicUndoManager = mosaicUndoManager;
        }

        public void run() {
            this.mMosaicUndoManager.capture(MosaicRender.this.mOriginFBOManager, MosaicRender.this.mGLTextureShader);
        }
    }

    class DestroyBufferTask implements Runnable {
        DestroyBufferTask() {
        }

        public void run() {
            MosaicRender.this.mEffectFBOManager.clear();
            MosaicRender.this.mMaskFBOManager.clear();
            MosaicRender.this.mGLTransparentDrawable.destroy();
            GLES20.glDeleteTextures(2, new int[]{MosaicRender.this.mOriginTextureId, MosaicRender.this.mPenTexture}, 0);
        }
    }

    private class DrawMaskTask implements Runnable {
        private final GLRectF mGLRectF;
        private final boolean mIsFirst;

        DrawMaskTask(GLRectF gLRectF, boolean z) {
            this.mGLRectF = gLRectF;
            this.mIsFirst = z;
        }

        public void run() {
            if (this.mIsFirst) {
                MosaicRender.this.mLastRect.set(this.mGLRectF);
                this.mGLRectF.getVertex(MosaicRender.this.mMaskPosition);
                MosaicRender.this.drawMask(MosaicRender.this.mMaskPosition);
                return;
            }
            MosaicRender.this.drawMaskBetween(MosaicRender.this.mLastRect, this.mGLRectF);
            MosaicRender.this.mLastRect.set(this.mGLRectF);
        }
    }

    private class EnableCaptureTask implements Runnable {
        private final GLFBOManager mCapture;

        EnableCaptureTask(GLFBOManager gLFBOManager) {
            this.mCapture = gLFBOManager;
        }

        public void run() {
            MosaicRender.this.mOriginFBOManager.bind();
            if (this.mCapture != null) {
                MosaicRender.this.mGLTextureShader.drawFBO(this.mCapture.getTextureId());
            } else {
                MosaicRender.this.mGLTextureShader.draw(MosaicRender.this.mOriginTextureId);
            }
            MosaicRender.this.mOriginFBOManager.unBind();
            MosaicRender.this.mMosaicEffectProcessor.draw(MosaicRender.this.mEffectFBOManager, MosaicRender.this.mCurrentEntity, MosaicRender.this.mOriginFBOManager.getTextureId(), MosaicRender.this.mOriginTextureId, MosaicRender.this.mGLTextureShader);
        }
    }

    class EnableEntityTask implements Runnable {
        private final MosaicGLEntity mMosaicGLEntity;
        private final float mScale;

        EnableEntityTask(MosaicGLEntity mosaicGLEntity) {
            this.mMosaicGLEntity = mosaicGLEntity;
            this.mScale = 1.0f;
        }

        EnableEntityTask(MosaicGLEntity mosaicGLEntity, float f) {
            this.mMosaicGLEntity = mosaicGLEntity;
            this.mScale = f;
        }

        public void run() {
            MosaicRender.this.mMosaicEffectProcessor.draw(MosaicRender.this.mEffectFBOManager, this.mMosaicGLEntity, MosaicRender.this.mOriginFBOManager.getTextureId(), MosaicRender.this.mOriginTextureId, MosaicRender.this.mGLTextureShader, this.mScale);
            MosaicRender.this.mCurrentEntity = this.mMosaicGLEntity;
        }
    }

    class InitTask implements Runnable {
        InitTask() {
        }

        public void run() {
            try {
                MosaicRender.this.mOriginTextureId = OpenGlUtils.loadTexture(MosaicRender.this.mOriginBitmap, -1);
            } catch (IllegalArgumentException e) {
                Log.e("MosaicRender", "bitmap : isRecycled : %s config : %s", Boolean.valueOf(MosaicRender.this.mOriginBitmap.isRecycled()), MosaicRender.this.mOriginBitmap.getConfig(), e);
                MosaicRender.this.mOriginTextureId = -1;
            }
            MosaicRender.this.mPenTexture = OpenGlUtils.loadTexture(MosaicRender.this.mPenMask, -1, true);
            MosaicRender.this.mGLTextureShader = new GLTextureShader();
            MosaicRender.this.mGLTransparentDrawable = new GLTransparentShader();
            MosaicRender.this.mMaskFBOManager = new GLFBOManager(MosaicRender.this.mOriginBitmap.getWidth(), MosaicRender.this.mOriginBitmap.getHeight(), MosaicRender.this.mViewWidth, MosaicRender.this.mViewHeight);
            MosaicRender.this.mMaskFBOManager.bind();
            GLES20.glClear(16640);
            MosaicRender.this.mMaskFBOManager.unBind();
            MosaicRender.this.mEffectFBOManager = new GLFBOManager(MosaicRender.this.mOriginBitmap.getWidth(), MosaicRender.this.mOriginBitmap.getHeight(), MosaicRender.this.mViewWidth, MosaicRender.this.mViewHeight);
            MosaicRender.this.mEffectFBOManager.bind();
            GLES20.glClear(16640);
            MosaicRender.this.mEffectFBOManager.unBind();
            MosaicRender.this.mOriginFBOManager = new GLFBOManager(MosaicRender.this.mOriginBitmap.getWidth(), MosaicRender.this.mOriginBitmap.getHeight(), MosaicRender.this.mViewWidth, MosaicRender.this.mViewHeight);
            MosaicRender.this.mOriginFBOManager.bind();
            GLES20.glClear(16640);
            MosaicRender.this.mGLTextureShader.draw(MosaicRender.this.mOriginTextureId);
            MosaicRender.this.mOriginFBOManager.unBind();
            MosaicRender.this.mMosaicEffectProcessor = new MosaicEffectProcessor(MosaicRender.this.mOriginBitmap.getWidth(), MosaicRender.this.mOriginBitmap.getHeight(), MosaicRender.this.mViewWidth, MosaicRender.this.mViewHeight);
            if (MosaicRender.this.mCurrentEntity != null) {
                MosaicRender.this.mMosaicEffectProcessor.draw(MosaicRender.this.mEffectFBOManager, MosaicRender.this.mCurrentEntity, MosaicRender.this.mOriginFBOManager.getTextureId(), MosaicRender.this.mOriginTextureId, MosaicRender.this.mGLTextureShader);
            }
            MosaicRender.this.mIterator = new Iterator((float) MosaicRender.this.mOriginBitmap.getWidth(), (float) MosaicRender.this.mOriginBitmap.getHeight());
        }
    }

    MosaicRender(Bitmap bitmap, Bitmap bitmap2) {
        this.mOriginBitmap = bitmap;
        this.mPenMask = bitmap2;
    }

    /* access modifiers changed from: private */
    public void drawMask(float[] fArr) {
        drawMaskPre();
        this.mGLTextureShader.draw(this.mPenTexture, fArr);
        drawMaskAfter();
    }

    private void drawMaskAfter() {
        GLES20.glBlendFunc(772, 0);
        this.mGLTextureShader.drawFBO(this.mEffectFBOManager.getTextureId());
        GLES20.glDisable(3042);
        this.mMaskFBOManager.unBind();
        this.mOriginFBOManager.bind();
        GLES20.glEnable(3042);
        GLES20.glBlendFuncSeparate(1, 771, 0, 1);
        this.mGLTextureShader.draw(this.mMaskFBOManager.getTextureId(), GLTextureShader.CUBE_REVERSE);
        GLES20.glDisable(3042);
        this.mOriginFBOManager.unBind();
    }

    /* access modifiers changed from: private */
    public void drawMaskBetween(GLRectF gLRectF, GLRectF gLRectF2) {
        this.mIterator.countMiddleRect(gLRectF, gLRectF2);
        drawMaskPre();
        while (this.mIterator.hasNext()) {
            this.mIterator.next(this.mMaskPosition);
            this.mGLTextureShader.draw(this.mPenTexture, this.mMaskPosition);
        }
        drawMaskAfter();
    }

    private void drawMaskPre() {
        this.mMaskFBOManager.bind();
        this.mGLTransparentDrawable.draw();
        GLES20.glEnable(3042);
        GLES20.glBlendFuncSeparate(1, 771, 1, 771);
    }

    /* access modifiers changed from: 0000 */
    public void capture(MosaicUndoManager mosaicUndoManager) {
        runOnDraw(new CaptureTask(mosaicUndoManager));
    }

    /* access modifiers changed from: 0000 */
    public void drawMaskPaintingItems(LinkedList<PaintingItem> linkedList) {
        drawMaskPre();
        Iterator it = linkedList.iterator();
        while (it.hasNext()) {
            boolean z = true;
            GLRectF gLRectF = null;
            Iterator it2 = ((PaintingItem) it.next()).points.iterator();
            while (it2.hasNext()) {
                GLRectF gLRectF2 = (GLRectF) it2.next();
                if (z) {
                    gLRectF2.getVertex(this.mMaskPosition);
                    this.mGLTextureShader.draw(this.mPenTexture, this.mMaskPosition);
                    z = false;
                } else {
                    this.mIterator.countMiddleRect(gLRectF, gLRectF2);
                    while (this.mIterator.hasNext()) {
                        this.mIterator.next(this.mMaskPosition);
                        this.mGLTextureShader.draw(this.mPenTexture, this.mMaskPosition);
                    }
                }
                gLRectF = gLRectF2;
            }
        }
        drawMaskAfter();
    }

    /* access modifiers changed from: 0000 */
    public void drawRect(GLRectF gLRectF, boolean z) {
        runOnDraw(new DrawMaskTask(gLRectF, z));
    }

    /* access modifiers changed from: 0000 */
    public void enableCapture(GLFBOManager gLFBOManager) {
        runOnDraw(new EnableCaptureTask(gLFBOManager));
    }

    /* access modifiers changed from: 0000 */
    public void enableEntity(MosaicGLEntity mosaicGLEntity) {
        runOnDraw(new EnableEntityTask(mosaicGLEntity));
    }

    /* access modifiers changed from: 0000 */
    public void init(MosaicGLEntity mosaicGLEntity) {
        runOnDraw(new InitTask());
        if (mosaicGLEntity != null) {
            runOnDraw(new EnableEntityTask(mosaicGLEntity));
        }
    }

    public void onDrawFrame(GL10 gl10) {
        super.onDrawFrame(gl10);
        GLES20.glClear(16640);
        this.mGLTextureShader.draw(this.mOriginFBOManager.getTextureId(), this.mGLPosition);
    }

    public void onSurfaceChanged(GL10 gl10, int i, int i2) {
        GLES20.glViewport(0, 0, i, i2);
        this.mViewWidth = i;
        this.mViewHeight = i2;
    }

    public void onSurfaceCreated(GL10 gl10, EGLConfig eGLConfig) {
        GLES20.glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
        GLES20.glDisable(2929);
    }
}
