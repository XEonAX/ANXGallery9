.class Lcom/miui/gallery/widget/GalleryVideoView$3;
.super Ljava/lang/Object;
.source "GalleryVideoView.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;


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

    iput-object p1, p0, Lcom/miui/gallery/widget/GalleryVideoView$3;->this$0:Lcom/miui/gallery/widget/GalleryVideoView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/widget/GalleryVideoView$3;->this$0:Lcom/miui/gallery/widget/GalleryVideoView;

    const/4 v0, 0x5

    invoke-static {p1, v0}, Lcom/miui/gallery/widget/GalleryVideoView;->access$202(Lcom/miui/gallery/widget/GalleryVideoView;I)I

    iget-object p1, p0, Lcom/miui/gallery/widget/GalleryVideoView$3;->this$0:Lcom/miui/gallery/widget/GalleryVideoView;

    invoke-static {p1, v0}, Lcom/miui/gallery/widget/GalleryVideoView;->access$602(Lcom/miui/gallery/widget/GalleryVideoView;I)I

    iget-object p1, p0, Lcom/miui/gallery/widget/GalleryVideoView$3;->this$0:Lcom/miui/gallery/widget/GalleryVideoView;

    invoke-static {p1}, Lcom/miui/gallery/widget/GalleryVideoView;->access$700(Lcom/miui/gallery/widget/GalleryVideoView;)Landroid/media/MediaPlayer$OnCompletionListener;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/widget/GalleryVideoView$3;->this$0:Lcom/miui/gallery/widget/GalleryVideoView;

    invoke-static {p1}, Lcom/miui/gallery/widget/GalleryVideoView;->access$700(Lcom/miui/gallery/widget/GalleryVideoView;)Landroid/media/MediaPlayer$OnCompletionListener;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/widget/GalleryVideoView$3;->this$0:Lcom/miui/gallery/widget/GalleryVideoView;

    invoke-static {v0}, Lcom/miui/gallery/widget/GalleryVideoView;->access$400(Lcom/miui/gallery/widget/GalleryVideoView;)Landroid/media/MediaPlayer;

    move-result-object v0

    invoke-interface {p1, v0}, Landroid/media/MediaPlayer$OnCompletionListener;->onCompletion(Landroid/media/MediaPlayer;)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/widget/GalleryVideoView$3;->this$0:Lcom/miui/gallery/widget/GalleryVideoView;

    invoke-static {p1}, Lcom/miui/gallery/widget/GalleryVideoView;->access$800(Lcom/miui/gallery/widget/GalleryVideoView;)I

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/widget/GalleryVideoView$3;->this$0:Lcom/miui/gallery/widget/GalleryVideoView;

    invoke-static {p1}, Lcom/miui/gallery/widget/GalleryVideoView;->access$900(Lcom/miui/gallery/widget/GalleryVideoView;)Landroid/media/AudioManager;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/media/AudioManager;->abandonAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;)I

    :cond_1
    return-void
.end method
