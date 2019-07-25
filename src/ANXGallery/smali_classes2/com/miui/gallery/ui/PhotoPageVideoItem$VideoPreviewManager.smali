.class Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;
.super Ljava/lang/Object;
.source "PhotoPageVideoItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageVideoItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "VideoPreviewManager"
.end annotation


# instance fields
.field private mBitmap:Landroid/graphics/Bitmap;

.field private mHideRunnable:Ljava/lang/Runnable;

.field private mIsPreviewUpdated:Z

.field private mIsShowPreview:Z

.field private mLayoutParams:Landroid/widget/RelativeLayout$LayoutParams;

.field private mPreviewStarted:Z

.field private mSurface:Landroid/view/Surface;

.field private mSurfaceTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

.field private mTextureView:Landroid/view/TextureView;

.field private mVideoRect:Landroid/graphics/RectF;

.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/PhotoPageVideoItem;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lcom/miui/gallery/ui/-$$Lambda$PhotoPageVideoItem$VideoPreviewManager$8FNbILUrhtJm9h9AHT4RtcQMGgE;

    invoke-direct {p1, p0}, Lcom/miui/gallery/ui/-$$Lambda$PhotoPageVideoItem$VideoPreviewManager$8FNbILUrhtJm9h9AHT4RtcQMGgE;-><init>(Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mHideRunnable:Ljava/lang/Runnable;

    new-instance p1, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager$1;-><init>(Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mSurfaceTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/PhotoPageVideoItem;Lcom/miui/gallery/ui/PhotoPageVideoItem$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;-><init>(Lcom/miui/gallery/ui/PhotoPageVideoItem;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;)Landroid/view/Surface;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mSurface:Landroid/view/Surface;

    return-object p0
.end method

.method static synthetic access$1002(Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;Landroid/view/Surface;)Landroid/view/Surface;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mSurface:Landroid/view/Surface;

    return-object p1
.end method

.method static synthetic access$300(Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->release()V

    return-void
.end method

.method private addTextureView()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mTextureView:Landroid/view/TextureView;

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const-string v0, "VideoItemPreviewManager"

    const-string v1, "addTextureView"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->getVideoRect()Landroid/graphics/RectF;

    move-result-object v0

    if-nez v0, :cond_1

    return-void

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mLayoutParams:Landroid/widget/RelativeLayout$LayoutParams;

    if-nez v1, :cond_2

    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v2, -0x1

    invoke-direct {v1, v2, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    iput-object v1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mLayoutParams:Landroid/widget/RelativeLayout$LayoutParams;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mLayoutParams:Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v2, 0xd

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    :cond_2
    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mLayoutParams:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v2

    float-to-int v2, v2

    iput v2, v1, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mLayoutParams:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v0

    float-to-int v0, v0

    iput v0, v1, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    new-instance v0, Landroid/view/TextureView;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/PhotoPageVideoItem;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/view/TextureView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mTextureView:Landroid/view/TextureView;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mTextureView:Landroid/view/TextureView;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mSurfaceTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

    invoke-virtual {v0, v1}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mTextureView:Landroid/view/TextureView;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mLayoutParams:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v0, v1, v2, v3}, Lcom/miui/gallery/ui/PhotoPageVideoItem;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method private getVideoRect()Landroid/graphics/RectF;
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageVideoItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mVideoRect:Landroid/graphics/RectF;

    if-nez v1, :cond_1

    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mVideoRect:Landroid/graphics/RectF;

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mVideoRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    int-to-float v0, v0

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v3, v2, v0}, Landroid/graphics/RectF;->set(FFFF)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageVideoItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoView;->getDisplayMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mVideoRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mVideoRect:Landroid/graphics/RectF;

    return-object v0
.end method

.method private hideTextureView()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mSurface:Landroid/view/Surface;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const-string v0, "VideoItemPreviewManager"

    const-string v1, "hideTextureView"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mTextureView:Landroid/view/TextureView;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mHideRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/view/TextureView;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageVideoItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Luk/co/senab/photoview/PhotoView;->setVisibility(I)V

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mIsPreviewUpdated:Z

    if-eqz v0, :cond_2

    iput-boolean v1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mIsPreviewUpdated:Z

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mBitmap:Landroid/graphics/Bitmap;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageVideoItem;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mTextureView:Landroid/view/TextureView;

    invoke-virtual {v1}, Landroid/view/TextureView;->getWidth()I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mTextureView:Landroid/view/TextureView;

    invoke-virtual {v2}, Landroid/view/TextureView;->getHeight()I

    move-result v2

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(Landroid/util/DisplayMetrics;IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mBitmap:Landroid/graphics/Bitmap;

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mTextureView:Landroid/view/TextureView;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Landroid/view/TextureView;->getBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mIsShowPreview:Z

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageVideoItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Luk/co/senab/photoview/PhotoView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    :cond_2
    return-void
.end method

.method private hideTextureViewDelay()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mTextureView:Landroid/view/TextureView;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mTextureView:Landroid/view/TextureView;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mHideRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/view/TextureView;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mTextureView:Landroid/view/TextureView;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mHideRunnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/TextureView;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public static synthetic lambda$new$10(Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;)V
    .locals 2

    const-string v0, "VideoItemPreviewManager"

    const-string v1, "hideTextureViewDelay"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->hideTextureView()V

    return-void
.end method

.method private release()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mIsShowPreview:Z

    const-string v0, "release"

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->removeTextureView(Ljava/lang/String;)V

    return-void
.end method

.method private removeTextureView(Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mTextureView:Landroid/view/TextureView;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const-string v0, "VideoItemPreviewManager"

    const-string v1, "removeTextureView %s"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->hideTextureView()V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageVideoItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Luk/co/senab/photoview/PhotoView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mTextureView:Landroid/view/TextureView;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mTextureView:Landroid/view/TextureView;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mHideRunnable:Ljava/lang/Runnable;

    invoke-virtual {p1, v2}, Landroid/view/TextureView;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mTextureView:Landroid/view/TextureView;

    invoke-virtual {p1, v2}, Lcom/miui/gallery/ui/PhotoPageVideoItem;->removeView(Landroid/view/View;)V

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mPreviewStarted:Z

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mIsPreviewUpdated:Z

    iput-object v1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mSurface:Landroid/view/Surface;

    iput-object v1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mTextureView:Landroid/view/TextureView;

    return-void
.end method


# virtual methods
.method getSurface()Landroid/view/Surface;
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->addTextureView()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mSurface:Landroid/view/Surface;

    return-object v0
.end method

.method isShowPreview()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mIsShowPreview:Z

    return v0
.end method

.method onConfigurationChanged()V
    .locals 1

    const-string v0, "configChanged"

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->removeTextureView(Ljava/lang/String;)V

    return-void
.end method

.method onExit()V
    .locals 1

    const-string v0, "exit"

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->removeTextureView(Ljava/lang/String;)V

    return-void
.end method

.method onMatrixChanged()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mTextureView:Landroid/view/TextureView;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->getVideoRect()Landroid/graphics/RectF;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mTextureView:Landroid/view/TextureView;

    invoke-virtual {v2}, Landroid/view/TextureView;->getWidth()I

    move-result v2

    int-to-float v2, v2

    cmpl-float v1, v1, v2

    if-nez v1, :cond_1

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mTextureView:Landroid/view/TextureView;

    invoke-virtual {v1}, Landroid/view/TextureView;->getHeight()I

    move-result v1

    int-to-float v1, v1

    cmpl-float v0, v0, v1

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    const-string v0, "matrixChanged"

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->removeTextureView(Ljava/lang/String;)V

    return-void

    :cond_2
    :goto_0
    return-void
.end method

.method onPreviewStart()V
    .locals 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mPreviewStarted:Z

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mTextureView:Landroid/view/TextureView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mTextureView:Landroid/view/TextureView;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mHideRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/view/TextureView;->removeCallbacks(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method onPreviewStop()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mPreviewStarted:Z

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->hideTextureViewDelay()V

    return-void
.end method

.method onPreviewUpdate(Z)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mSurface:Landroid/view/Surface;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const-string v0, "VideoItemPreviewManager"

    const-string v1, "onPreviewUpdate %b"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mIsPreviewUpdated:Z

    if-eqz p1, :cond_1

    iget-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mPreviewStarted:Z

    if-nez p1, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->hideTextureView()V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageVideoItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Luk/co/senab/photoview/PhotoView;->setVisibility(I)V

    :goto_0
    return-void
.end method

.method onUnSelected(Z)V
    .locals 1

    const-string v0, "unSelected"

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->removeTextureView(Ljava/lang/String;)V

    if-nez p1, :cond_0

    iget-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mIsShowPreview:Z

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mIsShowPreview:Z

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mBitmap:Landroid/graphics/Bitmap;

    if-eqz p1, :cond_0

    const-string p1, "VideoItemPreviewManager"

    const-string v0, "refresh"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->this$0:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageVideoItem;->refreshItem()V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageVideoItem$VideoPreviewManager;->mBitmap:Landroid/graphics/Bitmap;

    :cond_0
    return-void
.end method
