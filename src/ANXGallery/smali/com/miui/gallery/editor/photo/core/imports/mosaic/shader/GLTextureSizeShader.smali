.class public abstract Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLTextureSizeShader;
.super Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;
.source "GLTextureSizeShader.java"


# instance fields
.field protected mGLAttrScale:I

.field protected mGLAttrTextureHeight:I

.field protected mGLAttrTextureWidth:I

.field protected mScale:F

.field protected mTextureHeight:I

.field protected mTextureWidth:I


# direct methods
.method public constructor <init>(Ljava/lang/String;II)V
    .locals 1

    const-string v0, "attribute vec4 position;\nattribute vec4 inputTextureCoordinate;\n \nvarying vec2 textureCoordinate;\n \nvoid main()\n{\n    gl_Position = position;\n    textureCoordinate = inputTextureCoordinate.xy;\n}"

    invoke-direct {p0, v0, p1, p2, p3}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLTextureSizeShader;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;II)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const/high16 p1, 0x3f800000    # 1.0f

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLTextureSizeShader;->mScale:F

    iput p3, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLTextureSizeShader;->mTextureWidth:I

    iput p4, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLTextureSizeShader;->mTextureHeight:I

    return-void
.end method


# virtual methods
.method protected init(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;->init(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLTextureSizeShader;->getProgram()I

    move-result p1

    const-string p2, "textureWidth"

    invoke-static {p1, p2}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLTextureSizeShader;->mGLAttrTextureWidth:I

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLTextureSizeShader;->getProgram()I

    move-result p1

    const-string p2, "textureHeight"

    invoke-static {p1, p2}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLTextureSizeShader;->mGLAttrTextureHeight:I

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLTextureSizeShader;->getProgram()I

    move-result p1

    const-string p2, "scale"

    invoke-static {p1, p2}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLTextureSizeShader;->mGLAttrScale:I

    return-void
.end method

.method protected onPreDraw()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;->onPreDraw()V

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLTextureSizeShader;->mGLAttrTextureWidth:I

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLTextureSizeShader;->mTextureWidth:I

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLTextureSizeShader;->mGLAttrTextureHeight:I

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLTextureSizeShader;->mTextureHeight:I

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLTextureSizeShader;->mGLAttrScale:I

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLTextureSizeShader;->mScale:F

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    return-void
.end method

.method public setScale(F)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLTextureSizeShader;->mScale:F

    return-void
.end method
