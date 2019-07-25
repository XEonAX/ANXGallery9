package com.miui.gallery.editor.photo.core.imports.filter.render;

import android.opengl.GLES20;
import com.miui.filtersdk.filter.base.BaseOriginalFilter;

public class BoundLinesFilter extends BaseOriginalFilter {
    private int mBoundLocation;

    public BoundLinesFilter() {
        super("attribute vec4 position;\nattribute vec4 inputTextureCoordinate;\n \nvarying vec2 textureCoordinate;\n \nvoid main()\n{\n    gl_Position = position;\n    textureCoordinate = inputTextureCoordinate.xy;\n}", "precision highp float;\n\nuniform vec2 bound;\nuniform sampler2D inputImageTexture;\nvarying vec2 textureCoordinate;\n\nvoid main() {\n    if( (textureCoordinate.x > 0.0 + bound.x * 0.2 && textureCoordinate.x <= bound.x * 1.2 ) ||     (textureCoordinate.x < 1.0 - bound.x * 0.2 && textureCoordinate.x >= 1.0 - bound.x * 1.2) ||\n    (textureCoordinate.y > 0.0 + bound.y * 0.2 && textureCoordinate.y <= bound.y * 1.2 ) ||      (textureCoordinate.y < 1.0 - bound.y * 0.2 && textureCoordinate.y >= 1.0 - bound.y * 1.2 )){\n        gl_FragColor.rgb = vec3(0,0,0);\n        gl_FragColor.a = 0.20;\n    }\n    else{\n        gl_FragColor.rgb = vec3(0.0,0.0,0.0);\n        gl_FragColor.a = 0.0;\n    }\n }");
    }

    /* access modifiers changed from: protected */
    public void onInit() {
        super.onInit();
        this.mBoundLocation = GLES20.glGetUniformLocation(getProgram(), "bound");
    }

    public void setImageSize(int i, int i2) {
        float f;
        float f2;
        if (i != 0 && i2 != 0) {
            float f3 = (float) i;
            float f4 = (float) i2;
            if (((float) this.mOutputWidth) / f3 > ((float) this.mOutputHeight) / f4) {
                f2 = (float) this.mOutputHeight;
                f = (f3 * f2) / f4;
            } else {
                float f5 = (float) this.mOutputWidth;
                float f6 = f5;
                f2 = (f4 * f5) / f3;
                f = f6;
            }
            setFloatVec2(this.mBoundLocation, new float[]{1.0f / f, 1.0f / f2});
        }
    }
}
