.class public Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLMosaicShader;
.super Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLTextureSizeShader;
.source "GLMosaicShader.java"


# direct methods
.method public constructor <init>(II)V
    .locals 4

    const-string v0, "varying highp vec2 textureCoordinate;\nuniform sampler2D inputImageTexture;\nuniform int textureWidth;\nuniform int textureHeight;\nuniform highp float scale;\nhighp vec2 mosaicSize = vec2(%f, %f);\n\nvoid main(void)\n{\n    //    highp vec4 color;\n\n    mosaicSize.x = mosaicSize.x * scale;\n    mosaicSize.y = mosaicSize.y * scale;\n\n    highp vec2 texSize = vec2(float(textureWidth), float(textureHeight));\n\n    highp vec2 xy = vec2(textureCoordinate.x * texSize.x, textureCoordinate.y * texSize.y);\n\n    highp vec2 xyMosaic = vec2(floor(xy.x / mosaicSize.x) * mosaicSize.x + mosaicSize.x/2.0,\n         floor(xy.y / mosaicSize.y) * mosaicSize.y + mosaicSize.y/2.0);\n\n    highp vec2 uvMosaic = vec2(xyMosaic.x / texSize.x, xyMosaic.y / texSize.y);\n    gl_FragColor = texture2D( inputImageTexture, uvMosaic );\n}"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLMosaicShader;->calMosaicSize(I)F

    move-result v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLMosaicShader;->calMosaicSize(I)F

    move-result v2

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLTextureSizeShader;-><init>(Ljava/lang/String;II)V

    return-void
.end method

.method private static calMosaicSize(I)F
    .locals 2

    invoke-static {}, Lcom/miui/gallery/util/ScreenUtils;->getScreenWidth()I

    move-result v0

    if-lt p0, v0, :cond_0

    const/high16 p0, 0x42480000    # 50.0f

    return p0

    :cond_0
    int-to-float p0, p0

    const/high16 v0, 0x41f00000    # 30.0f

    div-float/2addr p0, v0

    const/high16 v0, 0x40000000    # 2.0f

    cmpg-float v1, p0, v0

    if-gez v1, :cond_1

    return v0

    :cond_1
    return p0
.end method
