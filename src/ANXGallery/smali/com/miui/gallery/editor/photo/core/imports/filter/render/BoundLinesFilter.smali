.class public Lcom/miui/gallery/editor/photo/core/imports/filter/render/BoundLinesFilter;
.super Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;
.source "BoundLinesFilter.java"


# instance fields
.field private mBoundLocation:I


# direct methods
.method public constructor <init>()V
    .locals 2

    const-string v0, "attribute vec4 position;\nattribute vec4 inputTextureCoordinate;\n \nvarying vec2 textureCoordinate;\n \nvoid main()\n{\n    gl_Position = position;\n    textureCoordinate = inputTextureCoordinate.xy;\n}"

    const-string v1, "precision highp float;\n\nuniform vec2 bound;\nuniform sampler2D inputImageTexture;\nvarying vec2 textureCoordinate;\n\nvoid main() {\n    if( (textureCoordinate.x > 0.0 + bound.x * 0.2 && textureCoordinate.x <= bound.x * 1.2 ) ||     (textureCoordinate.x < 1.0 - bound.x * 0.2 && textureCoordinate.x >= 1.0 - bound.x * 1.2) ||\n    (textureCoordinate.y > 0.0 + bound.y * 0.2 && textureCoordinate.y <= bound.y * 1.2 ) ||      (textureCoordinate.y < 1.0 - bound.y * 0.2 && textureCoordinate.y >= 1.0 - bound.y * 1.2 )){\n        gl_FragColor.rgb = vec3(0,0,0);\n        gl_FragColor.a = 0.20;\n    }\n    else{\n        gl_FragColor.rgb = vec3(0.0,0.0,0.0);\n        gl_FragColor.a = 0.0;\n    }\n }"

    invoke-direct {p0, v0, v1}, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected onInit()V
    .locals 2

    invoke-super {p0}, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;->onInit()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BoundLinesFilter;->getProgram()I

    move-result v0

    const-string v1, "bound"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BoundLinesFilter;->mBoundLocation:I

    return-void
.end method

.method public setImageSize(II)V
    .locals 5

    if-eqz p1, :cond_2

    if-nez p2, :cond_0

    goto :goto_1

    :cond_0
    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BoundLinesFilter;->mOutputWidth:I

    int-to-float v0, v0

    int-to-float p1, p1

    div-float/2addr v0, p1

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BoundLinesFilter;->mOutputHeight:I

    int-to-float v1, v1

    int-to-float p2, p2

    div-float/2addr v1, p2

    cmpl-float v0, v0, v1

    if-lez v0, :cond_1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BoundLinesFilter;->mOutputHeight:I

    int-to-float v0, v0

    mul-float p1, p1, v0

    div-float/2addr p1, p2

    goto :goto_0

    :cond_1
    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BoundLinesFilter;->mOutputWidth:I

    int-to-float v0, v0

    mul-float p2, p2, v0

    div-float p1, p2, p1

    move v4, v0

    move v0, p1

    move p1, v4

    :goto_0
    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BoundLinesFilter;->mBoundLocation:I

    const/4 v1, 0x2

    new-array v1, v1, [F

    const/4 v2, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    div-float p1, v3, p1

    aput p1, v1, v2

    const/4 p1, 0x1

    div-float/2addr v3, v0

    aput v3, v1, p1

    invoke-virtual {p0, p2, v1}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BoundLinesFilter;->setFloatVec2(I[F)V

    return-void

    :cond_2
    :goto_1
    return-void
.end method
