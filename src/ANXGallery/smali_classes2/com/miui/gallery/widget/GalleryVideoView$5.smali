.class Lcom/miui/gallery/widget/GalleryVideoView$5;
.super Ljava/lang/Object;
.source "GalleryVideoView.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/widget/GalleryVideoView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/widget/GalleryVideoView;


# direct methods
.method constructor <init>(Lcom/miui/gallery/widget/GalleryVideoView;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/GalleryVideoView$5;->this$0:Lcom/miui/gallery/widget/GalleryVideoView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Landroid/media/MediaPlayer;II)Z
    .locals 2

    const-string p1, "GalleryVideoView"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Error: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/widget/GalleryVideoView$5;->this$0:Lcom/miui/gallery/widget/GalleryVideoView;

    const/4 v0, -0x1

    invoke-static {p1, v0}, Lcom/miui/gallery/widget/GalleryVideoView;->access$202(Lcom/miui/gallery/widget/GalleryVideoView;I)I

    iget-object p1, p0, Lcom/miui/gallery/widget/GalleryVideoView$5;->this$0:Lcom/miui/gallery/widget/GalleryVideoView;

    invoke-static {p1, v0}, Lcom/miui/gallery/widget/GalleryVideoView;->access$602(Lcom/miui/gallery/widget/GalleryVideoView;I)I

    iget-object p1, p0, Lcom/miui/gallery/widget/GalleryVideoView$5;->this$0:Lcom/miui/gallery/widget/GalleryVideoView;

    invoke-static {p1}, Lcom/miui/gallery/widget/GalleryVideoView;->access$1100(Lcom/miui/gallery/widget/GalleryVideoView;)Landroid/media/MediaPlayer$OnErrorListener;

    move-result-object p1

    const/4 v0, 0x1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/widget/GalleryVideoView$5;->this$0:Lcom/miui/gallery/widget/GalleryVideoView;

    invoke-static {p1}, Lcom/miui/gallery/widget/GalleryVideoView;->access$1100(Lcom/miui/gallery/widget/GalleryVideoView;)Landroid/media/MediaPlayer$OnErrorListener;

    move-result-object p1

    iget-object v1, p0, Lcom/miui/gallery/widget/GalleryVideoView$5;->this$0:Lcom/miui/gallery/widget/GalleryVideoView;

    invoke-static {v1}, Lcom/miui/gallery/widget/GalleryVideoView;->access$400(Lcom/miui/gallery/widget/GalleryVideoView;)Landroid/media/MediaPlayer;

    move-result-object v1

    invoke-interface {p1, v1, p2, p3}, Landroid/media/MediaPlayer$OnErrorListener;->onError(Landroid/media/MediaPlayer;II)Z

    move-result p1

    if-eqz p1, :cond_0

    return v0

    :cond_0
    return v0
.end method
