.class Lcom/miui/gallery/video/editor/NexVideoEditor$TrimInfo;
.super Ljava/lang/Object;
.source "NexVideoEditor.java"

# interfaces
.implements Lcom/miui/gallery/video/editor/NexVideoEditor$Change;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/video/editor/NexVideoEditor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TrimInfo"
.end annotation


# instance fields
.field private end:I

.field private start:I

.field final synthetic this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;


# direct methods
.method constructor <init>(Lcom/miui/gallery/video/editor/NexVideoEditor;II)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TrimInfo;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TrimInfo;->start:I

    iput p3, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TrimInfo;->end:I

    return-void
.end method


# virtual methods
.method public applyChange()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TrimInfo;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1400(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v0

    if-eqz v0, :cond_3

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TrimInfo;->start:I

    iget v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TrimInfo;->end:I

    if-ge v0, v1, :cond_2

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TrimInfo;->end:I

    iget-object v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TrimInfo;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-virtual {v1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->getVideoTotalTime()I

    move-result v1

    if-le v0, v1, :cond_0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TrimInfo;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1400(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getVideoClipEdit()Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;

    move-result-object v0

    iget v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TrimInfo;->start:I

    iget v2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TrimInfo;->end:I

    invoke-virtual {v0, v1, v2}, Lcom/nexstreaming/nexeditorsdk/nexVideoClipEdit;->setTrim(II)V

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TrimInfo;->start:I

    if-nez v0, :cond_1

    iget v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TrimInfo;->end:I

    iget-object v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TrimInfo;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-virtual {v1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->getVideoTotalTime()I

    move-result v1

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TrimInfo;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1600(Lcom/miui/gallery/video/editor/NexVideoEditor;)Ljava/util/HashMap;

    move-result-object v0

    const-string v1, "trim"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TrimInfo;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1600(Lcom/miui/gallery/video/editor/NexVideoEditor;)Ljava/util/HashMap;

    move-result-object v0

    const-string v1, "trim"

    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TrimInfo;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1800(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;

    move-result-object v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TrimInfo;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1800(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor$TextClip;->applyChange()V

    goto :goto_2

    :cond_2
    :goto_1
    const-string v0, "NexVideoEditor"

    const-string v1, "TrimInfo: end time is lower than start time "

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_3
    :goto_2
    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$TrimInfo;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1600(Lcom/miui/gallery/video/editor/NexVideoEditor;)Ljava/util/HashMap;

    move-result-object v0

    const-string v1, "edit_type_smart_effect_template"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;

    if-eqz v0, :cond_4

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor$SmartEffectTemplate;->applyChange()V

    :cond_4
    return-void
.end method
