.class public Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLMosaicBlurShaderImp;
.super Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLShaderGroup;
.source "GLMosaicBlurShaderImp.java"


# instance fields
.field private mRatio:F


# direct methods
.method public constructor <init>(IIII)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLShaderGroup;-><init>(IIII)V

    new-instance p3, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLMosaicBlurShader;

    invoke-direct {p3, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLMosaicBlurShader;-><init>(II)V

    invoke-virtual {p0, p3}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLMosaicBlurShaderImp;->addShader(Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;)V

    new-instance p3, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLMosaicBlurShader;

    invoke-direct {p3, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLMosaicBlurShader;-><init>(II)V

    invoke-virtual {p0, p3}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLMosaicBlurShaderImp;->addShader(Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;)V

    const p1, 0x3fd9999a    # 1.7f

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLMosaicBlurShaderImp;->mRatio:F

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLMosaicBlurShaderImp;->notifyShaderAdded()V

    return-void
.end method


# virtual methods
.method protected onPreDraw()V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLMosaicBlurShaderImp;->mShaders:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLMosaicBlurShaderImp;->mRatio:F

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLMosaicBlurShaderImp;->mScale:F

    mul-float v1, v1, v2

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLMosaicBlurShaderImp;->mTextureWidth:I

    int-to-float v2, v2

    div-float/2addr v1, v2

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLMosaicBlurShaderImp;->mRatio:F

    iget v3, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLMosaicBlurShaderImp;->mScale:F

    mul-float v2, v2, v3

    iget v3, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLMosaicBlurShaderImp;->mTextureHeight:I

    int-to-float v3, v3

    div-float/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;->getProgram()I

    move-result v2

    const-string v3, "texelWidthOffset"

    invoke-static {v2, v3}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v2

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;->getProgram()I

    move-result v3

    const-string v4, "texelHeightOffset"

    invoke-static {v3, v4}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v3

    invoke-virtual {v0, v2, v1}, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;->setFloat(IF)V

    const/4 v2, 0x0

    invoke-virtual {v0, v3, v2}, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;->setFloat(IF)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLMosaicBlurShaderImp;->mShaders:Ljava/util/List;

    const/4 v3, 0x1

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;->getProgram()I

    move-result v3

    const-string v4, "texelWidthOffset"

    invoke-static {v3, v4}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v3

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;->getProgram()I

    move-result v4

    const-string v5, "texelHeightOffset"

    invoke-static {v4, v5}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v4

    invoke-virtual {v0, v3, v2}, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;->setFloat(IF)V

    invoke-virtual {v0, v4, v1}, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;->setFloat(IF)V

    return-void
.end method
