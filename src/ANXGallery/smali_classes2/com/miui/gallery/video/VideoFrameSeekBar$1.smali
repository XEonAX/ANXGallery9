.class Lcom/miui/gallery/video/VideoFrameSeekBar$1;
.super Landroid/support/v7/widget/RecyclerView$OnScrollListener;
.source "VideoFrameSeekBar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/video/VideoFrameSeekBar;->onFinishInflate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/video/VideoFrameSeekBar;


# direct methods
.method constructor <init>(Lcom/miui/gallery/video/VideoFrameSeekBar;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/VideoFrameSeekBar$1;->this$0:Lcom/miui/gallery/video/VideoFrameSeekBar;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroid/support/v7/widget/RecyclerView;I)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/video/VideoFrameSeekBar$1;->this$0:Lcom/miui/gallery/video/VideoFrameSeekBar;

    invoke-static {p1}, Lcom/miui/gallery/video/VideoFrameSeekBar;->access$000(Lcom/miui/gallery/video/VideoFrameSeekBar;)Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/video/VideoFrameSeekBar$1;->this$0:Lcom/miui/gallery/video/VideoFrameSeekBar;

    invoke-static {p1, v0}, Lcom/miui/gallery/video/VideoFrameSeekBar;->access$002(Lcom/miui/gallery/video/VideoFrameSeekBar;Z)Z

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/video/VideoFrameSeekBar$1;->this$0:Lcom/miui/gallery/video/VideoFrameSeekBar;

    invoke-static {p1}, Lcom/miui/gallery/video/VideoFrameSeekBar;->access$300(Lcom/miui/gallery/video/VideoFrameSeekBar;)Lcom/miui/gallery/video/VideoFrameSeekBar$OnSeekBarChangeListener;

    move-result-object p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/video/VideoFrameSeekBar$1;->this$0:Lcom/miui/gallery/video/VideoFrameSeekBar;

    invoke-static {p1}, Lcom/miui/gallery/video/VideoFrameSeekBar;->access$300(Lcom/miui/gallery/video/VideoFrameSeekBar;)Lcom/miui/gallery/video/VideoFrameSeekBar$OnSeekBarChangeListener;

    move-result-object p1

    if-eqz p2, :cond_1

    const/4 v0, 0x1

    :cond_1
    invoke-interface {p1, v0}, Lcom/miui/gallery/video/VideoFrameSeekBar$OnSeekBarChangeListener;->onScrollStateChanged(Z)V

    :cond_2
    return-void
.end method

.method public onScrolled(Landroid/support/v7/widget/RecyclerView;II)V
    .locals 0

    iget-object p2, p0, Lcom/miui/gallery/video/VideoFrameSeekBar$1;->this$0:Lcom/miui/gallery/video/VideoFrameSeekBar;

    invoke-static {p2}, Lcom/miui/gallery/video/VideoFrameSeekBar;->access$000(Lcom/miui/gallery/video/VideoFrameSeekBar;)Z

    move-result p2

    if-nez p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/video/VideoFrameSeekBar$1;->this$0:Lcom/miui/gallery/video/VideoFrameSeekBar;

    iget-object p3, p0, Lcom/miui/gallery/video/VideoFrameSeekBar$1;->this$0:Lcom/miui/gallery/video/VideoFrameSeekBar;

    invoke-static {p3}, Lcom/miui/gallery/video/VideoFrameSeekBar;->access$200(Lcom/miui/gallery/video/VideoFrameSeekBar;)Lcom/miui/gallery/video/VideoFrameThumbAdapter;

    move-result-object p3

    invoke-virtual {p3, p1}, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->getScrollPercent(Landroid/support/v7/widget/RecyclerView;)F

    move-result p1

    invoke-static {p2, p1}, Lcom/miui/gallery/video/VideoFrameSeekBar;->access$102(Lcom/miui/gallery/video/VideoFrameSeekBar;F)F

    iget-object p1, p0, Lcom/miui/gallery/video/VideoFrameSeekBar$1;->this$0:Lcom/miui/gallery/video/VideoFrameSeekBar;

    invoke-static {p1}, Lcom/miui/gallery/video/VideoFrameSeekBar;->access$300(Lcom/miui/gallery/video/VideoFrameSeekBar;)Lcom/miui/gallery/video/VideoFrameSeekBar$OnSeekBarChangeListener;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/video/VideoFrameSeekBar$1;->this$0:Lcom/miui/gallery/video/VideoFrameSeekBar;

    invoke-static {p1}, Lcom/miui/gallery/video/VideoFrameSeekBar;->access$300(Lcom/miui/gallery/video/VideoFrameSeekBar;)Lcom/miui/gallery/video/VideoFrameSeekBar$OnSeekBarChangeListener;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/video/VideoFrameSeekBar$1;->this$0:Lcom/miui/gallery/video/VideoFrameSeekBar;

    invoke-static {p2}, Lcom/miui/gallery/video/VideoFrameSeekBar;->access$100(Lcom/miui/gallery/video/VideoFrameSeekBar;)F

    move-result p2

    invoke-interface {p1, p2}, Lcom/miui/gallery/video/VideoFrameSeekBar$OnSeekBarChangeListener;->onProgressChanged(F)V

    :cond_0
    return-void
.end method
