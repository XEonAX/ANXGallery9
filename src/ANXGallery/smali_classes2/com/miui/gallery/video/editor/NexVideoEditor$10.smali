.class Lcom/miui/gallery/video/editor/NexVideoEditor$10;
.super Lcom/nexstreaming/nexeditorsdk/nexEngine$OnAutoTrimResultListener;
.source "NexVideoEditor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/video/editor/NexVideoEditor;->autoTrim(ILcom/miui/gallery/video/editor/VideoEditor$TrimStateInterface;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

.field final synthetic val$time:I


# direct methods
.method constructor <init>(Lcom/miui/gallery/video/editor/NexVideoEditor;I)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$10;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    iput p2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$10;->val$time:I

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine$OnAutoTrimResultListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onAutoTrimResult(I[I)V
    .locals 7

    if-eqz p2, :cond_4

    array-length p1, p2

    if-nez p1, :cond_0

    goto/16 :goto_2

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$10;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1500(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/nexstreaming/nexeditorsdk/nexProject;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->allClear(Z)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$10;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1400(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTotalTime()I

    move-result p1

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    array-length v3, p2

    if-ge v2, v3, :cond_2

    iget-object v3, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$10;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v3}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1400(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v3

    invoke-static {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->dup(Lcom/nexstreaming/nexeditorsdk/nexClip;)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v3

    iget-object v4, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$10;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v4}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1500(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/nexstreaming/nexeditorsdk/nexProject;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/nexstreaming/nexeditorsdk/nexProject;->add(Lcom/nexstreaming/nexeditorsdk/nexClip;)I

    aget v4, p2, v2

    if-lt v4, p1, :cond_1

    aget v5, p2, v2

    iget v6, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$10;->val$time:I

    div-int/lit8 v6, v6, 0x5

    add-int/2addr v5, v6

    goto :goto_1

    :cond_1
    aget v5, p2, v2

    iget v6, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$10;->val$time:I

    div-int/lit8 v6, v6, 0x5

    add-int/2addr v5, v6

    invoke-static {v5, p1}, Ljava/lang/Math;->min(II)I

    move-result v5

    :goto_1
    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v6

    invoke-virtual {v6, v4, v5}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->setTrim(II)V

    iget-object v4, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$10;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v4}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$100(Lcom/miui/gallery/video/editor/NexVideoEditor;)I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setRotateDegree(I)V

    iget-object v3, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$10;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v3}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$200(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/nexstreaming/nexeditorsdk/nexEngine;

    move-result-object v3

    iget-object v4, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$10;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v4}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1500(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/nexstreaming/nexeditorsdk/nexProject;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setProject(Lcom/nexstreaming/nexeditorsdk/nexProject;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$10;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1400(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v0}, Lcom/miui/gallery/video/editor/util/FileHelper;->generateOutputFilePath(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$10;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {p2}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$2100(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/miui/gallery/video/editor/VideoEditor$TrimStateInterface;

    move-result-object p2

    if-eqz p2, :cond_3

    iget-object p2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$10;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {p2}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$2100(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/miui/gallery/video/editor/VideoEditor$TrimStateInterface;

    move-result-object p2

    invoke-interface {p2, p1}, Lcom/miui/gallery/video/editor/VideoEditor$TrimStateInterface;->onTrimEnd(Ljava/lang/String;)V

    :cond_3
    iget-object p2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$10;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {p2, v1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$400(Lcom/miui/gallery/video/editor/NexVideoEditor;I)V

    iget-object p2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$10;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {p2}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$2300(Lcom/miui/gallery/video/editor/NexVideoEditor;)Landroid/os/Handler;

    move-result-object p2

    new-instance v0, Lcom/miui/gallery/video/editor/NexVideoEditor$10$1;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/video/editor/NexVideoEditor$10$1;-><init>(Lcom/miui/gallery/video/editor/NexVideoEditor$10;Ljava/lang/String;)V

    invoke-virtual {p2, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_4
    :goto_2
    return-void
.end method
