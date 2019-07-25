.class Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$LongPressedRunnable;
.super Ljava/lang/Object;
.source "VideoEditorRangeSeekBar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LongPressedRunnable"
.end annotation


# instance fields
.field private mIsCanceled:Z

.field final synthetic this$0:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$LongPressedRunnable;->this$0:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$LongPressedRunnable;->mIsCanceled:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$LongPressedRunnable;-><init>(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;)V

    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$LongPressedRunnable;->mIsCanceled:Z

    return-void
.end method

.method public run()V
    .locals 6

    iget-boolean v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$LongPressedRunnable;->mIsCanceled:Z

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$LongPressedRunnable;->this$0:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->access$1300(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;)I

    move-result v0

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eq v0, v2, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$LongPressedRunnable;->this$0:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->access$1300(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;)I

    move-result v0

    if-ne v0, v1, :cond_3

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$LongPressedRunnable;->this$0:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->access$1400(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;)F

    move-result v0

    iget-object v3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$LongPressedRunnable;->this$0:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    invoke-static {v3}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->access$1500(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;)I

    move-result v3

    int-to-float v3, v3

    cmpg-float v0, v0, v3

    if-gez v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$LongPressedRunnable;->this$0:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    iget-object v3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$LongPressedRunnable;->this$0:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    invoke-static {v3}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->access$1600(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;)F

    move-result v3

    float-to-int v3, v3

    iget-object v4, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$LongPressedRunnable;->this$0:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    invoke-static {v4}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->access$1400(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;)F

    move-result v4

    const/4 v5, 0x0

    cmpg-float v4, v4, v5

    const/4 v5, 0x0

    if-gez v4, :cond_1

    const/4 v4, 0x1

    goto :goto_0

    :cond_1
    const/4 v4, 0x0

    :goto_0
    invoke-virtual {v0, v3, v4}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getNearbyThumbId(IZ)I

    move-result v0

    const/high16 v3, 0x40a00000    # 5.0f

    if-ne v0, v2, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$LongPressedRunnable;->this$0:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$LongPressedRunnable;->this$0:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    invoke-static {v1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->access$1700(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;)F

    move-result v1

    invoke-static {v0, v3, v1, v5}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->access$1800(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;FFZ)V

    goto :goto_1

    :cond_2
    if-ne v0, v1, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$LongPressedRunnable;->this$0:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$LongPressedRunnable;->this$0:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;

    invoke-static {v1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->access$1900(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;)F

    move-result v1

    invoke-static {v0, v3, v1, v5}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->access$1800(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;FFZ)V

    :cond_3
    :goto_1
    return-void
.end method
