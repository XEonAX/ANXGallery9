.class Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$3;
.super Ljava/lang/Object;
.source "VideoEditorFragment.java"

# interfaces
.implements Lcom/miui/gallery/video/editor/widget/DisplayWrapper$IProgress;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->initListener()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field tempCurrentTime:I

.field final synthetic this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$3;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onVideoProgressChanged()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$3;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    iget v1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$3;->tempCurrentTime:I

    invoke-static {v0, v1}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$302(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;I)I

    return-void
.end method

.method public onVideoProgressChanging(IF)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$3;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$300(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$3;->tempCurrentTime:I

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$3;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$400(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Lcom/miui/gallery/video/editor/VideoEditor;

    move-result-object v0

    if-eqz v0, :cond_6

    const/4 v0, 0x0

    cmpl-float v0, p2, v0

    if-lez v0, :cond_6

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$3;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$400(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Lcom/miui/gallery/video/editor/VideoEditor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/VideoEditor;->getProjectTotalTime()I

    move-result v0

    int-to-float v0, v0

    mul-float v0, v0, p2

    float-to-int p2, v0

    sget v0, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->LEFT:I

    const/4 v1, 0x0

    if-ne p1, v0, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$3;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$300(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)I

    move-result p1

    if-gtz p1, :cond_0

    return-void

    :cond_0
    iget p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$3;->tempCurrentTime:I

    if-le p1, p2, :cond_1

    iget p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$3;->tempCurrentTime:I

    sub-int/2addr p1, p2

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    iput p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$3;->tempCurrentTime:I

    goto :goto_1

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$3;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$300(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)I

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$3;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$400(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Lcom/miui/gallery/video/editor/VideoEditor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/VideoEditor;->getProjectTotalTime()I

    move-result v0

    if-lt p1, v0, :cond_3

    return-void

    :cond_3
    iget p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$3;->tempCurrentTime:I

    add-int/2addr p1, p2

    iput p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$3;->tempCurrentTime:I

    iget p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$3;->tempCurrentTime:I

    iget-object p2, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$3;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-static {p2}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$400(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Lcom/miui/gallery/video/editor/VideoEditor;

    move-result-object p2

    invoke-virtual {p2}, Lcom/miui/gallery/video/editor/VideoEditor;->getProjectTotalTime()I

    move-result p2

    if-le p1, p2, :cond_4

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$3;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$400(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Lcom/miui/gallery/video/editor/VideoEditor;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/VideoEditor;->getProjectTotalTime()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$3;->tempCurrentTime:I

    :cond_4
    :goto_1
    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$3;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$400(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Lcom/miui/gallery/video/editor/VideoEditor;

    move-result-object p1

    iget p2, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$3;->tempCurrentTime:I

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Lcom/miui/gallery/video/editor/VideoEditor;->seek(ILcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)V

    iget p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$3;->tempCurrentTime:I

    int-to-float p1, p1

    iget-object p2, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$3;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-static {p2}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$400(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Lcom/miui/gallery/video/editor/VideoEditor;

    move-result-object p2

    invoke-virtual {p2}, Lcom/miui/gallery/video/editor/VideoEditor;->getProjectTotalTime()I

    move-result p2

    int-to-float p2, p2

    div-float/2addr p1, p2

    iget-object p2, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$3;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$3;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$600(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->getViewWidth()F

    move-result v0

    mul-float p1, p1, v0

    float-to-int p1, p1

    invoke-static {p2, p1}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$502(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;I)I

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$3;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$600(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$3;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-static {p2}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$500(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)I

    move-result p2

    invoke-virtual {p1, v1, v1, p2, v1}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->updatePlayProgress(IIII)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$3;->this$0:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->access$600(Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;)Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    move-result-object p1

    iget p2, p0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment$3;->tempCurrentTime:I

    if-lez p2, :cond_5

    const/4 v1, 0x1

    :cond_5
    invoke-virtual {p1, v1}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->showPlayProgress(Z)V

    :cond_6
    return-void
.end method
