.class Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager$3;
.super Ljava/lang/Object;
.source "PhotoPageImageItem.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnPreparedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager$3;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 4

    const-string p1, "PhotoPageImageItem"

    const-string v0, "MotionPhoto play prepared"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager$3;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->access$2500(Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;)Lcom/miui/gallery/widget/GalleryVideoView;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager$3;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->access$2600(Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager$3;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->access$2500(Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;)Lcom/miui/gallery/widget/GalleryVideoView;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/widget/GalleryVideoView;->start()V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager$3;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->access$2500(Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;)Lcom/miui/gallery/widget/GalleryVideoView;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/widget/GalleryVideoView;->pause()V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager$3;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageImageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Luk/co/senab/photoview/PhotoView;->setVisibility(I)V

    new-instance p1, Landroid/view/animation/AlphaAnimation;

    const/high16 v0, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    invoke-direct {p1, v0, v1}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    const-wide/16 v0, 0x96

    invoke-virtual {p1, v0, v1}, Landroid/view/animation/AlphaAnimation;->setStartOffset(J)V

    const-wide/16 v2, 0x1f4

    invoke-virtual {p1, v2, v3}, Landroid/view/animation/AlphaAnimation;->setDuration(J)V

    new-instance v2, Lmiui/view/animation/SineEaseInOutInterpolator;

    invoke-direct {v2}, Lmiui/view/animation/SineEaseInOutInterpolator;-><init>()V

    invoke-virtual {p1, v2}, Landroid/view/animation/AlphaAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager$3;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageImageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v2, p1}, Luk/co/senab/photoview/PhotoView;->startAnimation(Landroid/view/animation/Animation;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager$3;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->access$2500(Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;)Lcom/miui/gallery/widget/GalleryVideoView;

    move-result-object p1

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager$3;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;

    invoke-static {v2}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->access$2700(Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-virtual {p1, v2, v0, v1}, Lcom/miui/gallery/widget/GalleryVideoView;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    :cond_1
    :goto_0
    return-void
.end method
