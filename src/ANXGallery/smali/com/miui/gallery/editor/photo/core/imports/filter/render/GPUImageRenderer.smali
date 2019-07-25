.class public Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;
.super Ljava/lang/Object;
.source "GPUImageRenderer.java"

# interfaces
.implements Landroid/opengl/GLSurfaceView$Renderer;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xb
.end annotation


# static fields
.field static final CUBE:[F


# instance fields
.field private mBackgroundBlue:F

.field private mBackgroundGreen:F

.field private mBackgroundRed:F

.field private mBoundLinesFilter:Lcom/miui/gallery/editor/photo/core/imports/filter/render/BoundLinesFilter;

.field private mDrawBoundLines:Z

.field private mDrawFilter:Lcom/miui/filtersdk/filter/base/GPUImageFilter;

.field private mDrawForSmallPic:Z

.field private mFilter:Lcom/miui/filtersdk/filter/base/GPUImageFilter;

.field private mFlipHorizontal:Z

.field private mFlipVertical:Z

.field private final mGLCubeBuffer:Ljava/nio/FloatBuffer;

.field private final mGLTextureBuffer:Ljava/nio/FloatBuffer;

.field private mGLTextureId:I

.field private mImageHeight:I

.field private mImageWidth:I

.field private mOutputHeight:I

.field private mOutputWidth:I

.field private mRotation:Lcom/miui/filtersdk/utils/Rotation;

.field private final mRunOnDraw:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private final mRunOnDrawEnd:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private mScaleType:Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage$ScaleType;

.field public final mSurfaceChangedWaiter:Ljava/lang/Object;

.field private mSurfaceTexture:Landroid/graphics/SurfaceTexture;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x8

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->CUBE:[F

    return-void

    :array_0
    .array-data 4
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        -0x40800000    # -1.0f
        -0x40800000    # -1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public constructor <init>(Lcom/miui/filtersdk/filter/base/GPUImageFilter;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mSurfaceChangedWaiter:Ljava/lang/Object;

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mGLTextureId:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage$ScaleType;->CENTER_INSIDE:Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage$ScaleType;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mScaleType:Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage$ScaleType;

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mBackgroundRed:F

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mBackgroundGreen:F

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mBackgroundBlue:F

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mFilter:Lcom/miui/filtersdk/filter/base/GPUImageFilter;

    new-instance p1, Ljava/util/LinkedList;

    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mRunOnDraw:Ljava/util/Queue;

    new-instance p1, Ljava/util/LinkedList;

    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mRunOnDrawEnd:Ljava/util/Queue;

    sget-object p1, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->CUBE:[F

    array-length p1, p1

    mul-int/lit8 p1, p1, 0x4

    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object p1

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mGLCubeBuffer:Ljava/nio/FloatBuffer;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mGLCubeBuffer:Ljava/nio/FloatBuffer;

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->CUBE:[F

    invoke-virtual {p1, v0}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    sget-object p1, Lcom/miui/filtersdk/utils/TextureRotationUtil;->TEXTURE_NO_ROTATION:[F

    array-length p1, p1

    mul-int/lit8 p1, p1, 0x4

    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object p1

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mGLTextureBuffer:Ljava/nio/FloatBuffer;

    sget-object p1, Lcom/miui/filtersdk/utils/Rotation;->NORMAL:Lcom/miui/filtersdk/utils/Rotation;

    invoke-virtual {p0, p1, v0, v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->setRotation(Lcom/miui/filtersdk/utils/Rotation;ZZ)V

    new-instance p1, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BoundLinesFilter;

    invoke-direct {p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BoundLinesFilter;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mBoundLinesFilter:Lcom/miui/gallery/editor/photo/core/imports/filter/render/BoundLinesFilter;

    new-instance p1, Lcom/miui/filtersdk/filter/base/GPUImageFilter;

    invoke-direct {p1}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mDrawFilter:Lcom/miui/filtersdk/filter/base/GPUImageFilter;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;)Lcom/miui/filtersdk/filter/base/GPUImageFilter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mFilter:Lcom/miui/filtersdk/filter/base/GPUImageFilter;

    return-object p0
.end method

.method static synthetic access$002(Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;Lcom/miui/filtersdk/filter/base/GPUImageFilter;)Lcom/miui/filtersdk/filter/base/GPUImageFilter;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mFilter:Lcom/miui/filtersdk/filter/base/GPUImageFilter;

    return-object p1
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->initForFilter()V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mGLTextureId:I

    return p0
.end method

.method static synthetic access$202(Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mGLTextureId:I

    return p1
.end method

.method static synthetic access$300(Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mImageWidth:I

    return p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mImageHeight:I

    return p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;)Lcom/miui/gallery/editor/photo/core/imports/filter/render/BoundLinesFilter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mBoundLinesFilter:Lcom/miui/gallery/editor/photo/core/imports/filter/render/BoundLinesFilter;

    return-object p0
.end method

.method private addDistance(FF)F
    .locals 1

    const/4 v0, 0x0

    cmpl-float p1, p1, v0

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const/high16 p1, 0x3f800000    # 1.0f

    sub-float p2, p1, p2

    :goto_0
    return p2
.end method

.method private adjustImageScaling()V
    .locals 15

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mImageWidth:I

    if-eqz v0, :cond_4

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mImageHeight:I

    if-nez v0, :cond_0

    goto/16 :goto_1

    :cond_0
    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mOutputWidth:I

    int-to-float v0, v0

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mOutputHeight:I

    int-to-float v1, v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mRotation:Lcom/miui/filtersdk/utils/Rotation;

    sget-object v3, Lcom/miui/filtersdk/utils/Rotation;->ROTATION_270:Lcom/miui/filtersdk/utils/Rotation;

    if-eq v2, v3, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mRotation:Lcom/miui/filtersdk/utils/Rotation;

    sget-object v3, Lcom/miui/filtersdk/utils/Rotation;->ROTATION_90:Lcom/miui/filtersdk/utils/Rotation;

    if-ne v2, v3, :cond_2

    :cond_1
    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mOutputHeight:I

    int-to-float v0, v0

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mOutputWidth:I

    int-to-float v1, v1

    :cond_2
    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mImageWidth:I

    int-to-float v2, v2

    div-float v2, v0, v2

    iget v3, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mImageHeight:I

    int-to-float v3, v3

    div-float v3, v1, v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    move-result v2

    iget v3, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mImageWidth:I

    int-to-float v3, v3

    mul-float v3, v3, v2

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    iget v4, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mImageHeight:I

    int-to-float v4, v4

    mul-float v4, v4, v2

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v3, v3

    div-float/2addr v3, v0

    int-to-float v0, v2

    div-float/2addr v0, v1

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->CUBE:[F

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mRotation:Lcom/miui/filtersdk/utils/Rotation;

    iget-boolean v4, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mFlipHorizontal:Z

    iget-boolean v5, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mFlipVertical:Z

    invoke-static {v2, v4, v5}, Lcom/miui/filtersdk/utils/TextureRotationUtil;->getRotation(Lcom/miui/filtersdk/utils/Rotation;ZZ)[F

    move-result-object v2

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mScaleType:Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage$ScaleType;

    sget-object v5, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage$ScaleType;->CENTER_CROP:Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage$ScaleType;

    const/16 v6, 0x8

    const/4 v7, 0x7

    const/4 v8, 0x6

    const/4 v9, 0x5

    const/4 v10, 0x4

    const/4 v11, 0x3

    const/4 v12, 0x2

    const/4 v13, 0x1

    const/4 v14, 0x0

    if-ne v4, v5, :cond_3

    const/high16 v4, 0x3f800000    # 1.0f

    div-float v3, v4, v3

    sub-float v3, v4, v3

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v3, v5

    div-float v0, v4, v0

    sub-float/2addr v4, v0

    div-float/2addr v4, v5

    new-array v0, v6, [F

    aget v5, v2, v14

    invoke-direct {p0, v5, v3}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->addDistance(FF)F

    move-result v5

    aput v5, v0, v14

    aget v5, v2, v13

    invoke-direct {p0, v5, v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->addDistance(FF)F

    move-result v5

    aput v5, v0, v13

    aget v5, v2, v12

    invoke-direct {p0, v5, v3}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->addDistance(FF)F

    move-result v5

    aput v5, v0, v12

    aget v5, v2, v11

    invoke-direct {p0, v5, v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->addDistance(FF)F

    move-result v5

    aput v5, v0, v11

    aget v5, v2, v10

    invoke-direct {p0, v5, v3}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->addDistance(FF)F

    move-result v5

    aput v5, v0, v10

    aget v5, v2, v9

    invoke-direct {p0, v5, v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->addDistance(FF)F

    move-result v5

    aput v5, v0, v9

    aget v5, v2, v8

    invoke-direct {p0, v5, v3}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->addDistance(FF)F

    move-result v3

    aput v3, v0, v8

    aget v2, v2, v7

    invoke-direct {p0, v2, v4}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->addDistance(FF)F

    move-result v2

    aput v2, v0, v7

    goto :goto_0

    :cond_3
    new-array v1, v6, [F

    sget-object v4, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->CUBE:[F

    aget v4, v4, v14

    div-float/2addr v4, v0

    aput v4, v1, v14

    sget-object v4, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->CUBE:[F

    aget v4, v4, v13

    div-float/2addr v4, v3

    aput v4, v1, v13

    sget-object v4, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->CUBE:[F

    aget v4, v4, v12

    div-float/2addr v4, v0

    aput v4, v1, v12

    sget-object v4, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->CUBE:[F

    aget v4, v4, v11

    div-float/2addr v4, v3

    aput v4, v1, v11

    sget-object v4, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->CUBE:[F

    aget v4, v4, v10

    div-float/2addr v4, v0

    aput v4, v1, v10

    sget-object v4, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->CUBE:[F

    aget v4, v4, v9

    div-float/2addr v4, v3

    aput v4, v1, v9

    sget-object v4, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->CUBE:[F

    aget v4, v4, v8

    div-float/2addr v4, v0

    aput v4, v1, v8

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->CUBE:[F

    aget v0, v0, v7

    div-float/2addr v0, v3

    aput v0, v1, v7

    move-object v0, v2

    :goto_0
    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mGLCubeBuffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v2}, Ljava/nio/FloatBuffer;->clear()Ljava/nio/Buffer;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mGLCubeBuffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v2, v1}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    move-result-object v1

    invoke-virtual {v1, v14}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mGLTextureBuffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v1}, Ljava/nio/FloatBuffer;->clear()Ljava/nio/Buffer;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mGLTextureBuffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v1, v0}, Ljava/nio/FloatBuffer;->put([F)Ljava/nio/FloatBuffer;

    move-result-object v0

    invoke-virtual {v0, v14}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    return-void

    :cond_4
    :goto_1
    return-void
.end method

.method private initForFilter()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mFilter:Lcom/miui/filtersdk/filter/base/GPUImageFilter;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mOutputWidth:I

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mOutputHeight:I

    invoke-virtual {v0, v1, v2}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->onInputSizeChanged(II)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mFilter:Lcom/miui/filtersdk/filter/base/GPUImageFilter;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mOutputWidth:I

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mOutputHeight:I

    invoke-virtual {v0, v1, v2}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->onDisplaySizeChanged(II)V

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mImageWidth:I

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mOutputWidth:I

    if-ge v0, v1, :cond_0

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mImageHeight:I

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mOutputHeight:I

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mDrawForSmallPic:Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mFilter:Lcom/miui/filtersdk/filter/base/GPUImageFilter;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mImageWidth:I

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mImageHeight:I

    invoke-virtual {v0, v1, v2}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->initFrameBuffers(II)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mDrawForSmallPic:Z

    :goto_0
    const-string v0, "GPUImageRenderer"

    const-string v1, "initForFilter draw for small:%b"

    iget-boolean v2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mDrawForSmallPic:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method private runAll(Ljava/util/Queue;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Queue<",
            "Ljava/lang/Runnable;",
            ">;)V"
        }
    .end annotation

    if-eqz p1, :cond_1

    monitor-enter p1

    :goto_0
    :try_start_0
    invoke-interface {p1}, Ljava/util/Queue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-interface {p1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    :cond_0
    monitor-exit p1

    goto :goto_1

    :catchall_0
    move-exception v0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_1
    :goto_1
    return-void
.end method


# virtual methods
.method public deleteImage()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer$2;-><init>(Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->runOnDraw(Ljava/lang/Runnable;)V

    return-void
.end method

.method public isFlippedHorizontally()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mFlipHorizontal:Z

    return v0
.end method

.method public isFlippedVertically()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mFlipVertical:Z

    return v0
.end method

.method public onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 4

    const/16 p1, 0x4100

    invoke-static {p1}, Landroid/opengl/GLES20;->glClear(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mRunOnDraw:Ljava/util/Queue;

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->runAll(Ljava/util/Queue;)V

    iget-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mDrawForSmallPic:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mFilter:Lcom/miui/filtersdk/filter/base/GPUImageFilter;

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mGLTextureId:I

    invoke-virtual {p1, v0}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->onDrawToTexture(I)I

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mDrawFilter:Lcom/miui/filtersdk/filter/base/GPUImageFilter;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mGLCubeBuffer:Ljava/nio/FloatBuffer;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mGLTextureBuffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v0, p1, v1, v2}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->onDrawFrame(ILjava/nio/FloatBuffer;Ljava/nio/FloatBuffer;)I

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mFilter:Lcom/miui/filtersdk/filter/base/GPUImageFilter;

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mGLTextureId:I

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mGLCubeBuffer:Ljava/nio/FloatBuffer;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mGLTextureBuffer:Ljava/nio/FloatBuffer;

    invoke-virtual {p1, v0, v1, v2}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->onDrawFrame(ILjava/nio/FloatBuffer;Ljava/nio/FloatBuffer;)I

    :goto_0
    iget-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mDrawBoundLines:Z

    if-eqz p1, :cond_1

    const/16 p1, 0xbe2

    invoke-static {p1}, Landroid/opengl/GLES20;->glEnable(I)V

    const/4 v0, 0x1

    const/16 v1, 0x303

    invoke-static {v0, v1}, Landroid/opengl/GLES20;->glBlendFunc(II)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mBoundLinesFilter:Lcom/miui/gallery/editor/photo/core/imports/filter/render/BoundLinesFilter;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mGLTextureId:I

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mGLCubeBuffer:Ljava/nio/FloatBuffer;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mGLTextureBuffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v0, v1, v2, v3}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BoundLinesFilter;->onDrawFrame(ILjava/nio/FloatBuffer;Ljava/nio/FloatBuffer;)I

    invoke-static {p1}, Landroid/opengl/GLES20;->glDisable(I)V

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mRunOnDrawEnd:Ljava/util/Queue;

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->runAll(Ljava/util/Queue;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {p1}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    :cond_2
    return-void
.end method

.method public onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V
    .locals 0

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mOutputWidth:I

    if-ne p1, p2, :cond_0

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mOutputHeight:I

    if-eq p1, p3, :cond_1

    :cond_0
    iput p2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mOutputWidth:I

    iput p3, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mOutputHeight:I

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->adjustImageScaling()V

    :cond_1
    const/4 p1, 0x0

    invoke-static {p1, p1, p2, p3}, Landroid/opengl/GLES20;->glViewport(IIII)V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->initForFilter()V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mDrawFilter:Lcom/miui/filtersdk/filter/base/GPUImageFilter;

    invoke-virtual {p1, p2, p3}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->onInputSizeChanged(II)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mBoundLinesFilter:Lcom/miui/gallery/editor/photo/core/imports/filter/render/BoundLinesFilter;

    invoke-virtual {p1, p2, p3}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BoundLinesFilter;->onInputSizeChanged(II)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mBoundLinesFilter:Lcom/miui/gallery/editor/photo/core/imports/filter/render/BoundLinesFilter;

    invoke-virtual {p1, p2, p3}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BoundLinesFilter;->onDisplaySizeChanged(II)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mSurfaceChangedWaiter:Ljava/lang/Object;

    monitor-enter p1

    :try_start_0
    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mSurfaceChangedWaiter:Ljava/lang/Object;

    invoke-virtual {p2}, Ljava/lang/Object;->notifyAll()V

    monitor-exit p1

    return-void

    :catchall_0
    move-exception p2

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p2
.end method

.method public onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V
    .locals 2

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mBackgroundRed:F

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mBackgroundGreen:F

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mBackgroundBlue:F

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {p1, p2, v0, v1}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    const/16 p1, 0xb71

    invoke-static {p1}, Landroid/opengl/GLES20;->glDisable(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mFilter:Lcom/miui/filtersdk/filter/base/GPUImageFilter;

    invoke-virtual {p1}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->init()V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mBoundLinesFilter:Lcom/miui/gallery/editor/photo/core/imports/filter/render/BoundLinesFilter;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BoundLinesFilter;->init()V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mDrawFilter:Lcom/miui/filtersdk/filter/base/GPUImageFilter;

    invoke-virtual {p1}, Lcom/miui/filtersdk/filter/base/GPUImageFilter;->init()V

    return-void
.end method

.method protected runOnDraw(Ljava/lang/Runnable;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mRunOnDraw:Ljava/util/Queue;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mRunOnDraw:Ljava/util/Queue;

    invoke-interface {v1, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public setBackgroundColor(FFF)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mBackgroundRed:F

    iput p2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mBackgroundGreen:F

    iput p3, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mBackgroundBlue:F

    return-void
.end method

.method public setDrawBoundLines(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mDrawBoundLines:Z

    return-void
.end method

.method public setFilter(Lcom/miui/filtersdk/filter/base/GPUImageFilter;)V
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer$1;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer$1;-><init>(Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;Lcom/miui/filtersdk/filter/base/GPUImageFilter;)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->runOnDraw(Ljava/lang/Runnable;)V

    return-void
.end method

.method public setGLTextureId(III)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mGLTextureId:I

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mImageWidth:I

    if-ne p1, p2, :cond_0

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mImageHeight:I

    if-eq p1, p3, :cond_1

    :cond_0
    iput p2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mImageWidth:I

    iput p3, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mImageHeight:I

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->adjustImageScaling()V

    :cond_1
    return-void
.end method

.method public setImageBitmap(Landroid/graphics/Bitmap;Z)V
    .locals 1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mImageWidth:I

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mImageHeight:I

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer$3;

    invoke-direct {v0, p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer$3;-><init>(Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;Landroid/graphics/Bitmap;Z)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->runOnDraw(Ljava/lang/Runnable;)V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method public setRotation(Lcom/miui/filtersdk/utils/Rotation;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mRotation:Lcom/miui/filtersdk/utils/Rotation;

    return-void
.end method

.method public setRotation(Lcom/miui/filtersdk/utils/Rotation;ZZ)V
    .locals 0

    iput-boolean p2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mFlipHorizontal:Z

    iput-boolean p3, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mFlipVertical:Z

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->setRotation(Lcom/miui/filtersdk/utils/Rotation;)V

    return-void
.end method

.method public setScaleType(Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage$ScaleType;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImageRenderer;->mScaleType:Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage$ScaleType;

    return-void
.end method
