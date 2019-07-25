package com.miui.gallery.editor.photo.core.imports.mosaic;

import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.opengl.GLES20;
import android.opengl.GLUtils;
import com.miui.gallery.editor.photo.core.imports.mosaic.shader.GLTextureSizeShader;
import com.miui.gallery.editor.photo.widgets.glview.GLFBOManager;
import com.miui.gallery.editor.photo.widgets.glview.shader.GLShaderGroup;
import com.miui.gallery.editor.photo.widgets.glview.shader.GLTextureShader;
import com.miui.gallery.util.ScreenUtils;
import com.nostra13.universalimageloader.core.ImageLoader;

class MosaicEffectProcessor {
    private final int mOriginTextureHeight;
    private final int mOriginTextureWidth;
    private float[] mTextureCood = new float[8];
    private final int mViewHeight;
    private final int mViewWidth;

    MosaicEffectProcessor(int i, int i2, int i3, int i4) {
        this.mOriginTextureWidth = i;
        this.mOriginTextureHeight = i2;
        this.mViewWidth = i3;
        this.mViewHeight = i4;
    }

    private Bitmap changeBitmapSize(Bitmap bitmap) {
        Matrix matrix = new Matrix();
        float screenWidth = ((float) this.mOriginTextureWidth) / ((float) ScreenUtils.getScreenWidth());
        if (screenWidth >= 1.0f) {
            return bitmap;
        }
        matrix.postScale(screenWidth, screenWidth);
        return Bitmap.createBitmap(bitmap, 0, 0, bitmap.getWidth(), bitmap.getHeight(), matrix, false);
    }

    private void drawEffect(GLFBOManager gLFBOManager, MosaicGLEffectEntity mosaicGLEffectEntity, GLTextureShader gLTextureShader, int i, float f) {
        GLTextureSizeShader generateSpecificShader = mosaicGLEffectEntity.generateSpecificShader(this.mOriginTextureWidth, this.mOriginTextureHeight, this.mViewWidth, this.mViewHeight);
        if (generateSpecificShader != null) {
            generateSpecificShader.setScale(f);
            if (generateSpecificShader instanceof GLShaderGroup) {
                int effectedTexture = ((GLShaderGroup) generateSpecificShader).getEffectedTexture(i);
                gLFBOManager.bind();
                GLES20.glClear(16640);
                gLTextureShader.draw(effectedTexture);
                gLFBOManager.unBind();
            } else {
                gLFBOManager.bind();
                GLES20.glClear(16640);
                generateSpecificShader.drawFBO(i);
                gLFBOManager.unBind();
            }
            generateSpecificShader.destroy();
        }
    }

    private void drawOrigin(GLTextureShader gLTextureShader, int i) {
        gLTextureShader.draw(i);
    }

    private void drawResource(MosaicGLResourceEntity mosaicGLResourceEntity, GLTextureShader gLTextureShader, float f) {
        String str = mosaicGLResourceEntity.mTileMode;
        String str2 = mosaicGLResourceEntity.mResourcePath;
        int i = 10497;
        if (str.equals("EDGE")) {
            i = 33071;
        } else {
            boolean equals = str.equals("REPEAT");
        }
        Bitmap loadImageSync = ImageLoader.getInstance().loadImageSync(str2);
        if (loadImageSync != null) {
            Bitmap changeBitmapSize = changeBitmapSize(loadImageSync);
            getTextureCood(this.mTextureCood, (((float) this.mOriginTextureWidth) / ((float) changeBitmapSize.getWidth())) / f, (((float) this.mOriginTextureHeight) / ((float) changeBitmapSize.getHeight())) / f);
            int loadTexture = loadTexture(changeBitmapSize, i);
            gLTextureShader.draw(loadTexture, GLTextureShader.CUBE, this.mTextureCood);
            GLES20.glDeleteTextures(1, new int[]{loadTexture}, 0);
        }
    }

    private static void getTextureCood(float[] fArr, float f, float f2) {
        fArr[0] = 0.0f;
        fArr[1] = f2;
        fArr[2] = f;
        fArr[3] = f2;
        fArr[4] = 0.0f;
        fArr[5] = 0.0f;
        fArr[6] = f;
        fArr[7] = 0.0f;
    }

    private static int loadTexture(Bitmap bitmap, int i) {
        int[] iArr = new int[1];
        GLES20.glGenTextures(1, iArr, 0);
        GLES20.glBindTexture(3553, iArr[0]);
        GLES20.glTexParameterf(3553, 10240, 9729.0f);
        GLES20.glTexParameterf(3553, 10241, 9729.0f);
        float f = (float) i;
        GLES20.glTexParameterf(3553, 10242, f);
        GLES20.glTexParameterf(3553, 10243, f);
        GLUtils.texImage2D(3553, 0, bitmap, 0);
        bitmap.recycle();
        return iArr[0];
    }

    public void draw(GLFBOManager gLFBOManager, MosaicGLEntity mosaicGLEntity, int i, int i2, GLTextureShader gLTextureShader) {
        draw(gLFBOManager, mosaicGLEntity, i, i2, gLTextureShader, 1.0f);
    }

    public void draw(GLFBOManager gLFBOManager, MosaicGLEntity mosaicGLEntity, int i, int i2, GLTextureShader gLTextureShader, float f) {
        if (mosaicGLEntity != null) {
            switch (mosaicGLEntity.type) {
                case ORIGIN:
                    gLFBOManager.bind();
                    GLES20.glClear(16640);
                    drawOrigin(gLTextureShader, i2);
                    gLFBOManager.unBind();
                    break;
                case RESOURCE:
                    gLFBOManager.bind();
                    GLES20.glClear(16640);
                    drawResource((MosaicGLResourceEntity) mosaicGLEntity, gLTextureShader, f);
                    gLFBOManager.unBind();
                    break;
                case EFFECT:
                    drawEffect(gLFBOManager, (MosaicGLEffectEntity) mosaicGLEntity, gLTextureShader, i, f);
                    break;
            }
        }
    }
}
