.class public Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUImageSharpenFilter;
.super Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;
.source "GPUImageSharpenFilter.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/core/imports/filter/render/IFilterEmptyValidate;
.implements Lcom/miui/gallery/editor/photo/core/imports/filter/render/ISpecialProcessFilter;


# instance fields
.field private mImageHeightFactorLocation:I

.field private mImageWidthFactorLocation:I

.field private mSharpHeight:I

.field private mSharpWidth:I

.field private mSharpness:F

.field private mSharpnessLocation:I


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUImageSharpenFilter;-><init>(F)V

    return-void
.end method

.method public constructor <init>(F)V
    .locals 2

    const-string v0, "attribute vec4 position;\nattribute vec4 inputTextureCoordinate;\n\nuniform float imageWidthFactor; \nuniform float imageHeightFactor; \nuniform float sharpness;\n\nvarying vec2 textureCoordinate;\nvarying vec2 leftTextureCoordinate;\nvarying vec2 rightTextureCoordinate; \nvarying vec2 topTextureCoordinate;\nvarying vec2 bottomTextureCoordinate;\n\nvarying float centerMultiplier;\nvarying float edgeMultiplier;\n\nvoid main()\n{\n    gl_Position = position;\n    \n    mediump vec2 widthStep = vec2(imageWidthFactor, 0.0);\n    mediump vec2 heightStep = vec2(0.0, imageHeightFactor);\n    \n    textureCoordinate = inputTextureCoordinate.xy;\n    leftTextureCoordinate = inputTextureCoordinate.xy - widthStep;\n    rightTextureCoordinate = inputTextureCoordinate.xy + widthStep;\n    topTextureCoordinate = inputTextureCoordinate.xy + heightStep;     \n    bottomTextureCoordinate = inputTextureCoordinate.xy - heightStep;\n    \n    centerMultiplier = 1.0 - 4.0 * sharpness;\n    edgeMultiplier = sharpness;\n}"

    const-string v1, "precision highp float;\n\n            varying highp vec2 textureCoordinate;\n            varying highp vec2 leftTextureCoordinate;\n            varying highp vec2 rightTextureCoordinate;\n            varying highp vec2 topTextureCoordinate;\n            varying highp vec2 bottomTextureCoordinate;\n\n            varying highp float centerMultiplier;\n            varying highp float edgeMultiplier;\n\n            uniform sampler2D inputImageTexture;\n\n            void main()\n            {\n                mediump vec3 textureColor = texture2D(inputImageTexture, textureCoordinate).rgb;\n                mediump vec3 leftTextureColor = texture2D(inputImageTexture, leftTextureCoordinate).rgb;\n                mediump vec3 rightTextureColor = texture2D(inputImageTexture, rightTextureCoordinate).rgb;\n                mediump vec3 topTextureColor = texture2D(inputImageTexture, topTextureCoordinate).rgb;\n                mediump vec3 bottomTextureColor = texture2D(inputImageTexture, bottomTextureCoordinate).rgb;\n\n                mediump vec3 sharpenColor = textureColor * centerMultiplier + (leftTextureColor * edgeMultiplier + rightTextureColor * edgeMultiplier + topTextureColor * edgeMultiplier + bottomTextureColor * edgeMultiplier);\n\n                float weight = 0.3;\n\n                mediump vec3 re = (textureColor - weight * sharpenColor) / (1.0 - weight);\n\n                gl_FragColor = vec4(re , 1.0);\n            }"

    invoke-direct {p0, v0, v1}, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUImageSharpenFilter;->mSharpness:F

    return-void
.end method

.method public constructor <init>(I)V
    .locals 2

    const-string v0, "attribute vec4 position;\nattribute vec4 inputTextureCoordinate;\n\nuniform float imageWidthFactor; \nuniform float imageHeightFactor; \nuniform float sharpness;\n\nvarying vec2 textureCoordinate;\nvarying vec2 leftTextureCoordinate;\nvarying vec2 rightTextureCoordinate; \nvarying vec2 topTextureCoordinate;\nvarying vec2 bottomTextureCoordinate;\n\nvarying float centerMultiplier;\nvarying float edgeMultiplier;\n\nvoid main()\n{\n    gl_Position = position;\n    \n    mediump vec2 widthStep = vec2(imageWidthFactor, 0.0);\n    mediump vec2 heightStep = vec2(0.0, imageHeightFactor);\n    \n    textureCoordinate = inputTextureCoordinate.xy;\n    leftTextureCoordinate = inputTextureCoordinate.xy - widthStep;\n    rightTextureCoordinate = inputTextureCoordinate.xy + widthStep;\n    topTextureCoordinate = inputTextureCoordinate.xy + heightStep;     \n    bottomTextureCoordinate = inputTextureCoordinate.xy - heightStep;\n    \n    centerMultiplier = 1.0 - 4.0 * sharpness;\n    edgeMultiplier = sharpness;\n}"

    const-string v1, "precision highp float;\n\n            varying highp vec2 textureCoordinate;\n            varying highp vec2 leftTextureCoordinate;\n            varying highp vec2 rightTextureCoordinate;\n            varying highp vec2 topTextureCoordinate;\n            varying highp vec2 bottomTextureCoordinate;\n\n            varying highp float centerMultiplier;\n            varying highp float edgeMultiplier;\n\n            uniform sampler2D inputImageTexture;\n\n            void main()\n            {\n                mediump vec3 textureColor = texture2D(inputImageTexture, textureCoordinate).rgb;\n                mediump vec3 leftTextureColor = texture2D(inputImageTexture, leftTextureCoordinate).rgb;\n                mediump vec3 rightTextureColor = texture2D(inputImageTexture, rightTextureCoordinate).rgb;\n                mediump vec3 topTextureColor = texture2D(inputImageTexture, topTextureCoordinate).rgb;\n                mediump vec3 bottomTextureColor = texture2D(inputImageTexture, bottomTextureCoordinate).rgb;\n\n                mediump vec3 sharpenColor = textureColor * centerMultiplier + (leftTextureColor * edgeMultiplier + rightTextureColor * edgeMultiplier + topTextureColor * edgeMultiplier + bottomTextureColor * edgeMultiplier);\n\n                float weight = 0.3;\n\n                mediump vec3 re = (textureColor - weight * sharpenColor) / (1.0 - weight);\n\n                gl_FragColor = vec4(re , 1.0);\n            }"

    invoke-direct {p0, v0, v1}, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUImageSharpenFilter;->setDegree(I)V

    return-void
.end method


# virtual methods
.method public getSpecialBoard()I
    .locals 1

    const/16 v0, 0xa

    return v0
.end method

.method public initFrameBuffers(II)V
    .locals 1

    invoke-super {p0, p1, p2}, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;->initFrameBuffers(II)V

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUImageSharpenFilter;->mSharpWidth:I

    iput p2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUImageSharpenFilter;->mSharpHeight:I

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUImageSharpenFilter;->mImageWidthFactorLocation:I

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUImageSharpenFilter;->mSharpWidth:I

    int-to-float p2, p2

    const/high16 v0, 0x3f800000    # 1.0f

    div-float p2, v0, p2

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUImageSharpenFilter;->setFloat(IF)V

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUImageSharpenFilter;->mImageHeightFactorLocation:I

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUImageSharpenFilter;->mSharpHeight:I

    int-to-float p2, p2

    div-float/2addr v0, p2

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUImageSharpenFilter;->setFloat(IF)V

    return-void
.end method

.method public isDegreeAdjustSupported()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUImageSharpenFilter;->mDegree:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public onDisplaySizeChanged(II)V
    .locals 1

    invoke-super {p0, p1, p2}, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;->onDisplaySizeChanged(II)V

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUImageSharpenFilter;->mSharpWidth:I

    iput p2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUImageSharpenFilter;->mSharpHeight:I

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUImageSharpenFilter;->mImageWidthFactorLocation:I

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUImageSharpenFilter;->mSharpWidth:I

    int-to-float p2, p2

    const/high16 v0, 0x3f800000    # 1.0f

    div-float p2, v0, p2

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUImageSharpenFilter;->setFloat(IF)V

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUImageSharpenFilter;->mImageHeightFactorLocation:I

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUImageSharpenFilter;->mSharpHeight:I

    int-to-float p2, p2

    div-float/2addr v0, p2

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUImageSharpenFilter;->setFloat(IF)V

    return-void
.end method

.method public onInit()V
    .locals 2

    invoke-super {p0}, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;->onInit()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUImageSharpenFilter;->getProgram()I

    move-result v0

    const-string v1, "sharpness"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUImageSharpenFilter;->mSharpnessLocation:I

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUImageSharpenFilter;->getProgram()I

    move-result v0

    const-string v1, "imageWidthFactor"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUImageSharpenFilter;->mImageWidthFactorLocation:I

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUImageSharpenFilter;->getProgram()I

    move-result v0

    const-string v1, "imageHeightFactor"

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUImageSharpenFilter;->mImageHeightFactorLocation:I

    return-void
.end method

.method public onInitialized()V
    .locals 2

    invoke-super {p0}, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;->onInitialized()V

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUImageSharpenFilter;->mDegree:I

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    mul-float v0, v0, v1

    const/high16 v1, 0x42c80000    # 100.0f

    div-float/2addr v0, v1

    const/4 v1, 0x0

    add-float/2addr v0, v1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUImageSharpenFilter;->setSharpness(F)V

    return-void
.end method

.method public setBlock(Lcom/miui/gallery/editor/blocksdk/Block;I)V
    .locals 0

    return-void
.end method

.method public setSharpness(F)V
    .locals 1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUImageSharpenFilter;->mSharpness:F

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUImageSharpenFilter;->mSharpnessLocation:I

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUImageSharpenFilter;->mSharpness:F

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUImageSharpenFilter;->setFloat(IF)V

    return-void
.end method
