.class public Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;
.super Ljava/lang/Object;
.source "GPUImage.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage$ScaleType;
    }
.end annotation


# instance fields
.field private mCurrentBitmap:Landroid/graphics/Bitmap;

.field private mFilter:Lcom/miui/filtersdk/filter/base/GPUImageFilter;

.field private mGlSurfaceView:Landroid/opengl/GLSurfaceView;

.field private final mRenderer:Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;

.field private mScaleType:Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage$ScaleType;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage$ScaleType;->CENTER_INSIDE:Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage$ScaleType;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->mScaleType:Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage$ScaleType;

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->supportsOpenGLES2(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_0

    new-instance p1, Lcom/miui/filtersdk/filter/base/GPUImageFilter;

    invoke-direct {p1}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->mFilter:Lcom/miui/filtersdk/filter/base/GPUImageFilter;

    new-instance p1, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->mFilter:Lcom/miui/filtersdk/filter/base/GPUImageFilter;

    invoke-direct {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;-><init>(Lcom/miui/filtersdk/filter/base/GPUImageFilter;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->mRenderer:Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->mRenderer:Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->setDrawBoundLines(Z)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "OpenGL ES 2.0 is not supported on this phone."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private getBitmapWithBlock(Landroid/graphics/Bitmap;Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;Ljava/util/List;)Landroid/graphics/Bitmap;
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Bitmap;",
            "Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/blocksdk/Block;",
            ">;)",
            "Landroid/graphics/Bitmap;"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    new-instance v3, Lcom/miui/gallery/util/CounterUtil;

    const-string v4, "GPUImage"

    invoke-direct {v3, v4}, Lcom/miui/gallery/util/CounterUtil;-><init>(Ljava/lang/String;)V

    iget-object v4, v0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->mFilter:Lcom/miui/filtersdk/filter/base/GPUImageFilter;

    instance-of v4, v4, Lcom/miui/gallery/editor/photo/core/imports/filter/render/ISpecialProcessFilter;

    const/4 v5, 0x0

    if-eqz v4, :cond_0

    iget-object v4, v0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->mFilter:Lcom/miui/filtersdk/filter/base/GPUImageFilter;

    check-cast v4, Lcom/miui/gallery/editor/photo/core/imports/filter/render/ISpecialProcessFilter;

    invoke-interface {v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/ISpecialProcessFilter;->getSpecialBoard()I

    move-result v6

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    const/4 v6, 0x0

    :goto_0
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/miui/gallery/editor/blocksdk/Block;

    iget v7, v7, Lcom/miui/gallery/editor/blocksdk/Block;->mWidth:I

    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/miui/gallery/editor/blocksdk/Block;

    iget v8, v8, Lcom/miui/gallery/editor/blocksdk/Block;->mHeight:I

    mul-int/lit8 v9, v6, 0x2

    add-int/2addr v8, v9

    new-instance v10, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;

    invoke-direct {v10, v7, v8}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;-><init>(II)V

    invoke-static {}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/OpenGlUtils;->genTexture()I

    move-result v11

    invoke-virtual {v1, v11, v7, v8}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->setGLTextureId(III)V

    invoke-virtual {v10, v1}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->setRenderer(Landroid/opengl/GLSurfaceView$Renderer;)V

    invoke-virtual {v1, v5}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->setDrawBoundLines(Z)V

    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/editor/blocksdk/BlockSdkUtils;->bindBitmap(Landroid/graphics/Bitmap;)Z

    move v12, v8

    const/4 v8, 0x0

    :goto_1
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->size()I

    move-result v13

    const/4 v14, 0x1

    if-ge v8, v13, :cond_5

    invoke-interface {v2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/miui/gallery/editor/blocksdk/Block;

    iget v15, v13, Lcom/miui/gallery/editor/blocksdk/Block;->mHeight:I

    add-int/2addr v15, v9

    if-eq v15, v12, :cond_1

    iget v12, v13, Lcom/miui/gallery/editor/blocksdk/Block;->mHeight:I

    add-int/2addr v12, v9

    invoke-virtual {v1, v11, v7, v12}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->setGLTextureId(III)V

    invoke-virtual {v10, v7, v12}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->resetSize(II)V

    :cond_1
    if-nez v8, :cond_2

    iget v14, v13, Lcom/miui/gallery/editor/blocksdk/Block;->mOffset:I

    mul-int/lit8 v14, v14, 0x4

    invoke-static {v11, v7, v12, v7, v14}, Lcom/miui/gallery/editor/blocksdk/BlockSdkUtils;->updateTextureWidthStride(IIIII)V

    const/4 v14, 0x0

    goto :goto_2

    :cond_2
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->size()I

    move-result v15

    sub-int/2addr v15, v14

    if-ne v8, v15, :cond_3

    iget v14, v13, Lcom/miui/gallery/editor/blocksdk/Block;->mOffset:I

    mul-int/lit8 v14, v14, 0x4

    mul-int v15, v6, v7

    mul-int/lit8 v15, v15, 0x4

    mul-int/lit8 v15, v15, 0x2

    sub-int/2addr v14, v15

    invoke-static {v11, v7, v12, v7, v14}, Lcom/miui/gallery/editor/blocksdk/BlockSdkUtils;->updateTextureWidthStride(IIIII)V

    move v14, v9

    goto :goto_2

    :cond_3
    iget v14, v13, Lcom/miui/gallery/editor/blocksdk/Block;->mOffset:I

    mul-int/lit8 v14, v14, 0x4

    mul-int v15, v6, v7

    mul-int/lit8 v15, v15, 0x4

    sub-int/2addr v14, v15

    invoke-static {v11, v7, v12, v7, v14}, Lcom/miui/gallery/editor/blocksdk/BlockSdkUtils;->updateTextureWidthStride(IIIII)V

    move v14, v6

    :goto_2
    if-eqz v4, :cond_4

    invoke-interface {v4, v13, v14}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/ISpecialProcessFilter;->setBlock(Lcom/miui/gallery/editor/blocksdk/Block;I)V

    :cond_4
    invoke-virtual {v10}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->draw()Z

    iget v15, v13, Lcom/miui/gallery/editor/blocksdk/Block;->mWidth:I

    iget v5, v13, Lcom/miui/gallery/editor/blocksdk/Block;->mHeight:I

    iget v13, v13, Lcom/miui/gallery/editor/blocksdk/Block;->mOffset:I

    mul-int/lit8 v13, v13, 0x4

    const/4 v1, 0x0

    invoke-static {v1, v14, v15, v5, v13}, Lcom/miui/gallery/editor/blocksdk/BlockSdkUtils;->readPixelsAndMerge(IIIII)V

    add-int/lit8 v8, v8, 0x1

    move-object/from16 v1, p2

    const/4 v5, 0x0

    goto :goto_1

    :cond_5
    const/4 v1, 0x0

    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/editor/blocksdk/BlockSdkUtils;->unbindBitmap(Landroid/graphics/Bitmap;)Z

    const-string v4, "getBitmapDoneForBlock:%d"

    new-array v5, v14, [Ljava/lang/Object;

    invoke-interface/range {p3 .. p3}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v5, v1

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Lcom/miui/gallery/util/CounterUtil;->tick(Ljava/lang/String;)V

    iget-object v1, v0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->mFilter:Lcom/miui/filtersdk/filter/base/GPUImageFilter;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->destroy()V

    invoke-virtual/range {p2 .. p2}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->deleteImage()V

    invoke-virtual {v10}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->destroy()V

    return-object p1
.end method

.method private supportsOpenGLES2(Landroid/content/Context;)Z
    .locals 1

    const-string v0, "activity"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/app/ActivityManager;

    invoke-virtual {p1}, Landroid/app/ActivityManager;->getDeviceConfigurationInfo()Landroid/content/pm/ConfigurationInfo;

    move-result-object p1

    iget p1, p1, Landroid/content/pm/ConfigurationInfo;->reqGlEsVersion:I

    const/high16 v0, 0x20000

    if-lt p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method


# virtual methods
.method public deleteImage()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->mRenderer:Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->deleteImage()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->mCurrentBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->requestRender()V

    return-void
.end method

.method public getBitmapWithFilterApplied(Landroid/graphics/Bitmap;Z)Landroid/graphics/Bitmap;
    .locals 6

    const/4 v0, 0x0

    if-eqz p1, :cond_3

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    :cond_0
    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->mFilter:Lcom/miui/filtersdk/filter/base/GPUImageFilter;

    invoke-direct {v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;-><init>(Lcom/miui/filtersdk/filter/base/GPUImageFilter;)V

    sget-object v2, Lcom/miui/filtersdk/utils/Rotation;->NORMAL:Lcom/miui/filtersdk/utils/Rotation;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->mRenderer:Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;

    invoke-virtual {v3}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->isFlippedHorizontally()Z

    move-result v3

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->mRenderer:Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;

    invoke-virtual {v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->isFlippedVertically()Z

    move-result v4

    const/4 v5, 0x1

    xor-int/2addr v4, v5

    invoke-virtual {v1, v2, v3, v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->setRotation(Lcom/miui/filtersdk/utils/Rotation;ZZ)V

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->mScaleType:Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage$ScaleType;

    invoke-virtual {v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->setScaleType(Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage$ScaleType;)V

    new-instance v2, Lcom/miui/gallery/util/CounterUtil;

    const-string v3, "GPUImage"

    invoke-direct {v2, v3}, Lcom/miui/gallery/util/CounterUtil;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    invoke-static {v3, v4}, Lcom/miui/gallery/editor/blocksdk/SplitUtils;->split(II)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    if-le v4, v5, :cond_1

    invoke-direct {p0, p1, v1, v3}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->getBitmapWithBlock(Landroid/graphics/Bitmap;Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;Ljava/util/List;)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1

    :cond_1
    new-instance v3, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    invoke-direct {v3, v4, v5}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;-><init>(II)V

    const/4 v4, 0x0

    invoke-virtual {v1, p1, v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->setImageBitmap(Landroid/graphics/Bitmap;Z)V

    invoke-virtual {v3, v1}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->setRenderer(Landroid/opengl/GLSurfaceView$Renderer;)V

    invoke-virtual {v1, v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->setDrawBoundLines(Z)V

    if-eqz p2, :cond_2

    goto :goto_0

    :cond_2
    move-object p1, v0

    :goto_0
    invoke-virtual {v3, p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->getBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object p1

    const-string p2, "getBitmapDone"

    invoke-virtual {v2, p2}, Lcom/miui/gallery/util/CounterUtil;->tick(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->mFilter:Lcom/miui/filtersdk/filter/base/GPUImageFilter;

    invoke-virtual {p2}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->destroy()V

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->deleteImage()V

    invoke-virtual {v3}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->destroy()V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->mRenderer:Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->mFilter:Lcom/miui/filtersdk/filter/base/GPUImageFilter;

    invoke-virtual {p2, v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->setFilter(Lcom/miui/filtersdk/filter/base/GPUImageFilter;)V

    return-object p1

    :cond_3
    :goto_1
    return-object v0
.end method

.method public getBitmapWithFilterApplied(Z)Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->mCurrentBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p0, v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->getBitmapWithFilterApplied(Landroid/graphics/Bitmap;Z)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1
.end method

.method public requestRender()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->mGlSurfaceView:Landroid/opengl/GLSurfaceView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->mGlSurfaceView:Landroid/opengl/GLSurfaceView;

    invoke-virtual {v0}, Landroid/opengl/GLSurfaceView;->requestRender()V

    :cond_0
    return-void
.end method

.method public setBackgroundColor(FFF)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->mRenderer:Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;

    invoke-virtual {v0, p1, p2, p3}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->setBackgroundColor(FFF)V

    return-void
.end method

.method public setFilter(Lcom/miui/filtersdk/filter/base/GPUImageFilter;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->mFilter:Lcom/miui/filtersdk/filter/base/GPUImageFilter;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->mRenderer:Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->mFilter:Lcom/miui/filtersdk/filter/base/GPUImageFilter;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->setFilter(Lcom/miui/filtersdk/filter/base/GPUImageFilter;)V

    return-void
.end method

.method public setGLSurfaceView(Landroid/opengl/GLSurfaceView;)V
    .locals 8

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->mGlSurfaceView:Landroid/opengl/GLSurfaceView;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->mGlSurfaceView:Landroid/opengl/GLSurfaceView;

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Landroid/opengl/GLSurfaceView;->setEGLContextClientVersion(I)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->mGlSurfaceView:Landroid/opengl/GLSurfaceView;

    const/16 v2, 0x8

    const/16 v3, 0x8

    const/16 v4, 0x8

    const/16 v5, 0x8

    const/16 v6, 0x10

    const/4 v7, 0x0

    invoke-virtual/range {v1 .. v7}, Landroid/opengl/GLSurfaceView;->setEGLConfigChooser(IIIIII)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->mGlSurfaceView:Landroid/opengl/GLSurfaceView;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/opengl/GLSurfaceView;->setZOrderOnTop(Z)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->mGlSurfaceView:Landroid/opengl/GLSurfaceView;

    invoke-virtual {p1}, Landroid/opengl/GLSurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object p1

    const/4 v0, -0x2

    invoke-interface {p1, v0}, Landroid/view/SurfaceHolder;->setFormat(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->mGlSurfaceView:Landroid/opengl/GLSurfaceView;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->mRenderer:Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;

    invoke-virtual {p1, v0}, Landroid/opengl/GLSurfaceView;->setRenderer(Landroid/opengl/GLSurfaceView$Renderer;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->mGlSurfaceView:Landroid/opengl/GLSurfaceView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/opengl/GLSurfaceView;->setRenderMode(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->mGlSurfaceView:Landroid/opengl/GLSurfaceView;

    invoke-virtual {p1}, Landroid/opengl/GLSurfaceView;->requestRender()V

    return-void
.end method

.method public setImage(Landroid/graphics/Bitmap;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->mCurrentBitmap:Landroid/graphics/Bitmap;

    if-eq v0, p1, :cond_0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->mCurrentBitmap:Landroid/graphics/Bitmap;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->mRenderer:Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->setImageBitmap(Landroid/graphics/Bitmap;Z)V

    :cond_0
    return-void
.end method
