package com.miui.gallery.editor.photo.core.imports.mosaic.shader;

import com.miui.gallery.util.ScreenUtils;

public class GLMosaicShader extends GLTextureSizeShader {
    public GLMosaicShader(int i, int i2) {
        super(String.format("varying highp vec2 textureCoordinate;\nuniform sampler2D inputImageTexture;\nuniform int textureWidth;\nuniform int textureHeight;\nuniform highp float scale;\nhighp vec2 mosaicSize = vec2(%f, %f);\n\nvoid main(void)\n{\n    //    highp vec4 color;\n\n    mosaicSize.x = mosaicSize.x * scale;\n    mosaicSize.y = mosaicSize.y * scale;\n\n    highp vec2 texSize = vec2(float(textureWidth), float(textureHeight));\n\n    highp vec2 xy = vec2(textureCoordinate.x * texSize.x, textureCoordinate.y * texSize.y);\n\n    highp vec2 xyMosaic = vec2(floor(xy.x / mosaicSize.x) * mosaicSize.x + mosaicSize.x/2.0,\n         floor(xy.y / mosaicSize.y) * mosaicSize.y + mosaicSize.y/2.0);\n\n    highp vec2 uvMosaic = vec2(xyMosaic.x / texSize.x, xyMosaic.y / texSize.y);\n    gl_FragColor = texture2D( inputImageTexture, uvMosaic );\n}", new Object[]{Float.valueOf(calMosaicSize(i)), Float.valueOf(calMosaicSize(i))}), i, i2);
    }

    private static float calMosaicSize(int i) {
        if (i >= ScreenUtils.getScreenWidth()) {
            return 50.0f;
        }
        float f = ((float) i) / 30.0f;
        if (f < 2.0f) {
            return 2.0f;
        }
        return f;
    }
}
