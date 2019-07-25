.class Lcom/miui/gallery/video/editor/NexVideoEditor$12;
.super Lcom/nexstreaming/nexeditorsdk/nexEngine$OnCompletionListener;
.source "NexVideoEditor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/video/editor/NexVideoEditor;->addChange(Lcom/miui/gallery/video/editor/NexVideoEditor$Change;Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

.field final synthetic val$change:Lcom/miui/gallery/video/editor/NexVideoEditor$Change;

.field final synthetic val$listener:Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;


# direct methods
.method constructor <init>(Lcom/miui/gallery/video/editor/NexVideoEditor;Lcom/miui/gallery/video/editor/NexVideoEditor$Change;Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$12;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    iput-object p2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$12;->val$change:Lcom/miui/gallery/video/editor/NexVideoEditor$Change;

    iput-object p3, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$12;->val$listener:Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine$OnCompletionListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(I)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$12;->val$change:Lcom/miui/gallery/video/editor/NexVideoEditor$Change;

    invoke-interface {p1}, Lcom/miui/gallery/video/editor/NexVideoEditor$Change;->applyChange()V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$12;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$200(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/nexstreaming/nexeditorsdk/nexEngine;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$12;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$200(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/nexstreaming/nexeditorsdk/nexEngine;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->updateProject()V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$12;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$400(Lcom/miui/gallery/video/editor/NexVideoEditor;I)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$12;->val$listener:Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$12;->val$listener:Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;

    invoke-interface {p1}, Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;->onCompleted()V

    :cond_1
    return-void
.end method
