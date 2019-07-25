.class public abstract Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPURGBLutFilter;
.super Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;
.source "GPURGBLutFilter.java"


# instance fields
.field protected mPercent:F

.field protected mPercentLocation:I

.field protected mRGBLutLocation:I

.field private mToneCurveTexture:[I


# direct methods
.method public constructor <init>(I)V
    .locals 3

    const-string v0, "attribute vec4 position;\nattribute vec4 inputTextureCoordinate;\n \nvarying vec2 textureCoordinate;\n \nvoid main()\n{\n    gl_Position = position;\n    textureCoordinate = inputTextureCoordinate.xy;\n}"

    const-string v1, "precision mediump float;\nprecision mediump float;\n\nuniform sampler2D inputImageTexture;\nuniform sampler2D sRGBLut;\nvarying vec2 textureCoordinate;\nuniform float mPercent;\n\n\nvoid main() {\n    vec3 src = texture2D(inputImageTexture, textureCoordinate).rgb;\n\n    vec3 color;\n    color.r = texture2D(sRGBLut, vec2(src.r, 0.0)).r;\n    color.g = texture2D(sRGBLut, vec2(src.g, 0.0)).g;\n    color.b = texture2D(sRGBLut, vec2(src.b, 0.0)).b;\n\n    gl_FragColor = vec4(mix(src, color, mPercent),1.0);\n}"

    invoke-direct {p0, v0, v1}, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const/4 v2, -0x1

    aput v2, v0, v1

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPURGBLutFilter;->mToneCurveTexture:[I

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPURGBLutFilter;->setDegree(I)V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPURGBLutFilter;)[I
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPURGBLutFilter;->mToneCurveTexture:[I

    return-object p0
.end method


# virtual methods
.method protected abstract getLUTPath()Ljava/lang/String;
.end method

.method public isDegreeAdjustSupported()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public onDestroy()V
    .locals 3

    invoke-super {p0}, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;->onDestroy()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPURGBLutFilter;->mToneCurveTexture:[I

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPURGBLutFilter;->mToneCurveTexture:[I

    const/4 v2, -0x1

    aput v2, v0, v1

    return-void
.end method

.method protected onDrawArraysAfter()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPURGBLutFilter;->mToneCurveTexture:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    const v0, 0x84c3

    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    const/16 v0, 0xde1

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    const v0, 0x84c0

    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    :cond_0
    return-void
.end method

.method protected onDrawArraysPre()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPURGBLutFilter;->mToneCurveTexture:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    const v0, 0x84c3

    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    const/16 v0, 0xde1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPURGBLutFilter;->mToneCurveTexture:[I

    aget v1, v2, v1

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPURGBLutFilter;->mRGBLutLocation:I

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPURGBLutFilter;->mPercentLocation:I

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPURGBLutFilter;->mPercent:F

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    :cond_0
    return-void
.end method

.method public onInit()V
    .locals 2

    invoke-super {p0}, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;->onInit()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPURGBLutFilter;->getProgram()I

    move-result v0

    const-string v1, "sRGBLut"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPURGBLutFilter;->mRGBLutLocation:I

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPURGBLutFilter;->getProgram()I

    move-result v0

    const-string v1, "mPercent"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPURGBLutFilter;->mPercentLocation:I

    return-void
.end method

.method protected onInitialized()V
    .locals 1

    invoke-super {p0}, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;->onInitialized()V

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPURGBLutFilter$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPURGBLutFilter$1;-><init>(Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPURGBLutFilter;)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPURGBLutFilter;->runOnDraw(Ljava/lang/Runnable;)V

    return-void
.end method
