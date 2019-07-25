.class Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;
.super Ljava/lang/Object;
.source "PhotoPageImageItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageImageItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MotionPhotoManager"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager$CheckForLongPress;
    }
.end annotation


# instance fields
.field private mAutoPlay:Z

.field private mAutoStopRunnable:Ljava/lang/Runnable;

.field private mHasPerformedLongPress:Z

.field private mHasTransition:Z

.field private mLayoutParams:Landroid/widget/RelativeLayout$LayoutParams;

.field private mNeedHapticFeedback:Z

.field private mOnCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

.field private mOnErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

.field private mOnPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

.field private mPendingCheckForLongPress:Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager$CheckForLongPress;

.field private mPendingStop:Z

.field private mPlayable:Z

.field private mPressed:Z

.field private mRemoveRunnable:Ljava/lang/Runnable;

.field private mStartRunnable:Ljava/lang/Runnable;

.field private mStarted:Z

.field private mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/PhotoPageImageItem;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mStarted:Z

    iput-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mPendingStop:Z

    new-instance p1, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager$1;-><init>(Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mOnErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    new-instance p1, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager$2;

    invoke-direct {p1, p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager$2;-><init>(Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mOnCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    new-instance p1, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager$3;

    invoke-direct {p1, p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager$3;-><init>(Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mOnPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    new-instance p1, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager$4;

    invoke-direct {p1, p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager$4;-><init>(Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mStartRunnable:Ljava/lang/Runnable;

    new-instance p1, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager$5;

    invoke-direct {p1, p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager$5;-><init>(Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mRemoveRunnable:Ljava/lang/Runnable;

    new-instance p1, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager$6;

    invoke-direct {p1, p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager$6;-><init>(Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mAutoStopRunnable:Ljava/lang/Runnable;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/PhotoPageImageItem;Lcom/miui/gallery/ui/PhotoPageImageItem$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;-><init>(Lcom/miui/gallery/ui/PhotoPageImageItem;)V

    return-void
.end method

.method static synthetic access$2300(Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->removeVideoView(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$2400(Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->hideVideoView()V

    return-void
.end method

.method static synthetic access$2500(Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;)Lcom/miui/gallery/widget/GalleryVideoView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    return-object p0
.end method

.method static synthetic access$2600(Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mPendingStop:Z

    return p0
.end method

.method static synthetic access$2700(Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;)Ljava/lang/Runnable;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mStartRunnable:Ljava/lang/Runnable;

    return-object p0
.end method

.method static synthetic access$2802(Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mStarted:Z

    return p1
.end method

.method static synthetic access$2900(Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mNeedHapticFeedback:Z

    return p0
.end method

.method static synthetic access$3000(Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->stopPlayback()V

    return-void
.end method

.method static synthetic access$3200(Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mPressed:Z

    return p0
.end method

.method static synthetic access$3300(Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->performLongClick()V

    return-void
.end method

.method static synthetic access$3402(Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mHasPerformedLongPress:Z

    return p1
.end method

.method private addVideoView(Z)Z
    .locals 8

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->isItemValid()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_5

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->isPlayRequested()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_2

    :cond_0
    const-string v0, "PhotoPageImageItem"

    const-string v2, "MotionPhoto addVideoView"

    invoke-static {v0, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/miui/gallery/widget/GalleryVideoView;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/PhotoPageImageItem;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/miui/gallery/widget/GalleryVideoView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Luk/co/senab/photoview/PhotoView;->setInterceptTouch(Z)V

    iput-boolean v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mNeedHapticFeedback:Z

    iput-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mAutoPlay:Z

    iput-boolean v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mStarted:Z

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mLayoutParams:Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v3, -0x1

    if-nez v0, :cond_1

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v0, v3, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mLayoutParams:Landroid/widget/RelativeLayout$LayoutParams;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mLayoutParams:Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v4, 0xd

    invoke-virtual {v0, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mOnCompletionListener:Landroid/media/MediaPlayer$OnCompletionListener;

    invoke-virtual {v0, v4}, Lcom/miui/gallery/widget/GalleryVideoView;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mOnErrorListener:Landroid/media/MediaPlayer$OnErrorListener;

    invoke-virtual {v0, v4}, Lcom/miui/gallery/widget/GalleryVideoView;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mOnPreparedListener:Landroid/media/MediaPlayer$OnPreparedListener;

    invoke-virtual {v0, v4}, Lcom/miui/gallery/widget/GalleryVideoView;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    const/4 v0, 0x0

    if-eqz p1, :cond_2

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    invoke-virtual {v4, v0}, Lcom/miui/gallery/widget/GalleryVideoView;->setVolume(F)V

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    invoke-virtual {v4, v1}, Lcom/miui/gallery/widget/GalleryVideoView;->setAudioFocusRequest(I)V

    goto :goto_0

    :cond_2
    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-virtual {v4, v5}, Lcom/miui/gallery/widget/GalleryVideoView;->setVolume(F)V

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    const/4 v5, 0x2

    invoke-virtual {v4, v5}, Lcom/miui/gallery/widget/GalleryVideoView;->setAudioFocusRequest(I)V

    :goto_0
    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v4, v4, Lcom/miui/gallery/ui/PhotoPageImageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v4}, Luk/co/senab/photoview/PhotoView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    if-eqz v4, :cond_3

    new-instance v3, Landroid/graphics/RectF;

    iget-object v5, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v5, v5, Lcom/miui/gallery/ui/PhotoPageImageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v5}, Luk/co/senab/photoview/PhotoView;->getWidth()I

    move-result v5

    int-to-float v5, v5

    iget-object v6, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v6, v6, Lcom/miui/gallery/ui/PhotoPageImageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v6}, Luk/co/senab/photoview/PhotoView;->getHeight()I

    move-result v6

    int-to-float v6, v6

    invoke-direct {v3, v0, v0, v5, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    new-instance v5, Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v4

    int-to-float v4, v4

    invoke-direct {v5, v0, v0, v6, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoView;->getDisplayMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    new-instance v4, Landroid/graphics/RectF;

    invoke-direct {v4, v5}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    invoke-virtual {v0, v4}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    invoke-virtual {v4, v4, v3}, Landroid/graphics/RectF;->setIntersect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    iget v6, v4, Landroid/graphics/RectF;->left:F

    neg-float v6, v6

    iget v7, v4, Landroid/graphics/RectF;->top:F

    neg-float v7, v7

    invoke-virtual {v4, v6, v7}, Landroid/graphics/RectF;->offset(FF)V

    new-instance v6, Landroid/graphics/Matrix;

    invoke-direct {v6}, Landroid/graphics/Matrix;-><init>()V

    sget-object v7, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v6, v4, v5, v7}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    invoke-virtual {v6, v0}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    invoke-virtual {v4}, Landroid/graphics/RectF;->centerX()F

    move-result v0

    invoke-virtual {v3}, Landroid/graphics/RectF;->centerX()F

    move-result v5

    sub-float/2addr v0, v5

    invoke-virtual {v4}, Landroid/graphics/RectF;->centerY()F

    move-result v5

    invoke-virtual {v3}, Landroid/graphics/RectF;->centerY()F

    move-result v3

    sub-float/2addr v5, v3

    invoke-virtual {v6, v0, v5}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    invoke-virtual {v0, v6}, Lcom/miui/gallery/widget/GalleryVideoView;->setTransform(Landroid/graphics/Matrix;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mLayoutParams:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v3

    float-to-int v3, v3

    iput v3, v0, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mLayoutParams:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v3

    float-to-int v3, v3

    iput v3, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    goto :goto_1

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Lcom/miui/gallery/widget/GalleryVideoView;->setTransform(Landroid/graphics/Matrix;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mLayoutParams:Landroid/widget/RelativeLayout$LayoutParams;

    iput v3, v0, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mLayoutParams:Landroid/widget/RelativeLayout$LayoutParams;

    iput v3, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    :goto_1
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v0

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v3, v3, Lcom/miui/gallery/ui/PhotoPageImageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v3}, Lcom/miui/gallery/model/BaseDataItem;->getMotionOffset()J

    move-result-wide v3

    iget-object v5, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    invoke-virtual {v5, v0, v3, v4}, Lcom/miui/gallery/widget/GalleryVideoView;->setVideoFilePath(Ljava/lang/String;J)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mLayoutParams:Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {v0, v3, v1, v4}, Lcom/miui/gallery/ui/PhotoPageImageItem;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageImageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mAutoStopRunnable:Ljava/lang/Runnable;

    const-wide/16 v3, 0x2ee

    invoke-virtual {p1, v0, v3, v4}, Luk/co/senab/photoview/PhotoView;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_4
    return v2

    :cond_5
    :goto_2
    return v1
.end method

.method private checkForLongClick()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mPendingCheckForLongPress:Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager$CheckForLongPress;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager$CheckForLongPress;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager$CheckForLongPress;-><init>(Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;Lcom/miui/gallery/ui/PhotoPageImageItem$1;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mPendingCheckForLongPress:Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager$CheckForLongPress;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mPendingCheckForLongPress:Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager$CheckForLongPress;

    const-wide/16 v2, 0x12c

    invoke-virtual {v0, v1, v2, v3}, Lcom/miui/gallery/ui/PhotoPageImageItem;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method private hideVideoView()V
    .locals 4

    const-string v0, "PhotoPageImageItem"

    const-string v1, "MotionPhoto hideVideoView"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Landroid/view/animation/AlphaAnimation;

    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    const-wide/16 v1, 0x1f4

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;->setDuration(J)V

    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Landroid/view/animation/AlphaAnimation;->setFillAfter(Z)V

    new-instance v3, Lmiui/view/animation/SineEaseInOutInterpolator;

    invoke-direct {v3}, Lmiui/view/animation/SineEaseInOutInterpolator;-><init>()V

    invoke-virtual {v0, v3}, Landroid/view/animation/AlphaAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v3, v3, Lcom/miui/gallery/ui/PhotoPageImageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v3, v0}, Luk/co/senab/photoview/PhotoView;->startAnimation(Landroid/view/animation/Animation;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mAutoStopRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v3}, Luk/co/senab/photoview/PhotoView;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mRemoveRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v3}, Lcom/miui/gallery/widget/GalleryVideoView;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mRemoveRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v3, v1, v2}, Lcom/miui/gallery/widget/GalleryVideoView;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_0
    return-void
.end method

.method private isItemValid()Z
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageImageItem;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/extraphoto/sdk/ExtraPhotoSDK;->isDeviceSupportMotionPhoto(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->isMotionPhoto()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getMotionOffset()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private isPlayRequested()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private performLongClick()V
    .locals 2

    const-string v0, "PhotoPageImageItem"

    const-string v1, "MotionPhoto performLongClick"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->startPlay(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "motion_photo"

    const-string v1, "motion_photo_play_press"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method private removeLongPressCallback()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mPendingCheckForLongPress:Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager$CheckForLongPress;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mPendingCheckForLongPress:Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager$CheckForLongPress;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/PhotoPageImageItem;->removeCallbacks(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method private removeVideoView(Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    if-eqz v0, :cond_1

    const-string v0, "PhotoPageImageItem"

    const-string v1, "MotionPhoto removeVideoView %s"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mPendingStop:Z

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/GalleryVideoView;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/GalleryVideoView;->stopPlayback()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/GalleryVideoView;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/GalleryVideoView;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/GalleryVideoView;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mRemoveRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v2}, Lcom/miui/gallery/widget/GalleryVideoView;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mStartRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v2}, Lcom/miui/gallery/widget/GalleryVideoView;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    invoke-virtual {v0, v2}, Lcom/miui/gallery/ui/PhotoPageImageItem;->removeView(Landroid/view/View;)V

    iput-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoView;->clearAnimation()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoView;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/PhotoView;->setInterceptTouch(Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageImageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mAutoStopRunnable:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Luk/co/senab/photoview/PhotoView;->removeCallbacks(Ljava/lang/Runnable;)Z

    :cond_1
    return-void
.end method

.method private startPlay(ZZ)Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageImageItem;->isPaused()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_6

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mHasTransition:Z

    if-nez v0, :cond_6

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mCheckManager:Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;->inAction()Z

    move-result v0

    if-nez v0, :cond_6

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->isItemValid()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_2

    :cond_0
    const/4 v0, 0x1

    if-eqz p1, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->isPlayRequested()Z

    move-result p1

    if-nez p1, :cond_5

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->addVideoView(Z)Z

    move-result v1

    goto :goto_1

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/GalleryVideoView;->isPlaying()Z

    move-result p1

    if-eqz p1, :cond_3

    const-string p1, "PhotoPageImageItem"

    const-string v2, "MotionPhoto cancel auto stop"

    invoke-static {p1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mAutoStopRunnable:Ljava/lang/Runnable;

    invoke-virtual {p1, v2}, Lcom/miui/gallery/widget/GalleryVideoView;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {p1, v2}, Lcom/miui/gallery/widget/GalleryVideoView;->setVolume(F)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    const/4 v2, 0x2

    invoke-virtual {p1, v2}, Lcom/miui/gallery/widget/GalleryVideoView;->requestAudioFocus(I)V

    if-eqz p2, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/PhotoPageImageItem;->performHapticFeedback(I)Z

    :cond_2
    iput-boolean v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mAutoPlay:Z

    const/4 v1, 0x1

    goto :goto_1

    :cond_3
    const-string p1, "MotionPhoto start play"

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->removeVideoView(Ljava/lang/String;)V

    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->addVideoView(Z)Z

    move-result p1

    if-eqz p2, :cond_4

    if-eqz p1, :cond_4

    goto :goto_0

    :cond_4
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mNeedHapticFeedback:Z

    move v1, p1

    :cond_5
    :goto_1
    return v1

    :cond_6
    :goto_2
    return v1
.end method

.method private stopPlayback()V
    .locals 2

    const-string v0, "PhotoPageImageItem"

    const-string v1, "MotionPhoto stopPlayback"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/GalleryVideoView;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/GalleryVideoView;->stopPlayback()V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->hideVideoView()V

    goto :goto_0

    :cond_0
    const-string v0, "stopPlayback"

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->removeVideoView(Ljava/lang/String;)V

    :goto_0
    return-void
.end method


# virtual methods
.method public onActionBarOperationClick()V
    .locals 2

    const-string v0, "PhotoPageImageItem"

    const-string v1, "MotionPhoto onActionBarClick"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->isPlayRequested()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mAutoPlay:Z

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->stopPlayback()V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, v0, v0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->startPlay(ZZ)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "motion_photo"

    const-string v1, "motion_photo_play_action_bar"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public onActivityTransition()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mHasTransition:Z

    const-string v0, "onTransition"

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->removeVideoView(Ljava/lang/String;)V

    return-void
.end method

.method public onConfigurationChanged()V
    .locals 1

    const-string v0, "configChanged"

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->removeVideoView(Ljava/lang/String;)V

    return-void
.end method

.method public onMatrixChanged()V
    .locals 1

    const-string v0, "matrixChanged"

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->removeVideoView(Ljava/lang/String;)V

    return-void
.end method

.method public onPageScrollDragging()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    if-eqz v0, :cond_1

    const-string v0, "PhotoPageImageItem"

    const-string v1, "MotionPhoto pause onDragging"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mPendingStop:Z

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/GalleryVideoView;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/GalleryVideoView;->pause()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mAutoStopRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Luk/co/senab/photoview/PhotoView;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mStartRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/GalleryVideoView;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mRemoveRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/GalleryVideoView;->removeCallbacks(Ljava/lang/Runnable;)Z

    :cond_1
    return-void
.end method

.method public onPageScrollIdle()V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mPendingStop:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mVideoView:Lcom/miui/gallery/widget/GalleryVideoView;

    if-eqz v0, :cond_1

    const-string v0, "PhotoPageImageItem"

    const-string v1, "MotionPhoto hide onIdle"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mStarted:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->hideVideoView()V

    goto :goto_0

    :cond_0
    const-string v0, "onIdle"

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->removeVideoView(Ljava/lang/String;)V

    :cond_1
    :goto_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mPendingStop:Z

    return-void
.end method

.method public onPause()V
    .locals 1

    const-string v0, "onPause"

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->removeVideoView(Ljava/lang/String;)V

    return-void
.end method

.method public onResume()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mHasTransition:Z

    return-void
.end method

.method public onSelected(ZZZ)V
    .locals 0

    return-void
.end method

.method public onTouch(Landroid/view/MotionEvent;)Z
    .locals 3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->isItemValid()Z

    move-result v0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mPlayable:Z

    :cond_0
    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mPlayable:Z

    const/4 v1, 0x0

    if-nez v0, :cond_1

    return v1

    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const/4 v0, 0x1

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iput-boolean v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mPressed:Z

    iget-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mHasPerformedLongPress:Z

    if-eqz p1, :cond_2

    const-string p1, "PhotoPageImageItem"

    const-string v2, "MotionPhoto long press cancel"

    invoke-static {p1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->stopPlayback()V

    :cond_2
    iput-boolean v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mHasPerformedLongPress:Z

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->removeLongPressCallback()V

    goto :goto_0

    :pswitch_1
    iput-boolean v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mHasPerformedLongPress:Z

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mPressed:Z

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->checkForLongClick()V

    return v0

    :goto_0
    :pswitch_2
    return v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method public onUnSelected()V
    .locals 1

    const-string v0, "unSelected"

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->removeVideoView(Ljava/lang/String;)V

    return-void
.end method

.method public release()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->mHasTransition:Z

    const-string v0, "release"

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->removeVideoView(Ljava/lang/String;)V

    return-void
.end method
