.class Lcom/miui/gallery/video/editor/NexVideoEditor$11;
.super Lcom/nexstreaming/nexeditorsdk/nexEngine$OnCompletionListener;
.source "NexVideoEditor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/video/editor/NexVideoEditor;->export(Ljava/lang/String;Lcom/miui/gallery/video/editor/VideoEditor$EnocdeStateInterface;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

.field final synthetic val$esi:Lcom/miui/gallery/video/editor/VideoEditor$EnocdeStateInterface;

.field final synthetic val$outputFileURI:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/miui/gallery/video/editor/NexVideoEditor;Ljava/lang/String;Lcom/miui/gallery/video/editor/VideoEditor$EnocdeStateInterface;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$11;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    iput-object p2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$11;->val$outputFileURI:Ljava/lang/String;

    iput-object p3, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$11;->val$esi:Lcom/miui/gallery/video/editor/VideoEditor$EnocdeStateInterface;

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine$OnCompletionListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(I)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$11;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$400(Lcom/miui/gallery/video/editor/NexVideoEditor;I)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$11;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$2300(Lcom/miui/gallery/video/editor/NexVideoEditor;)Landroid/os/Handler;

    move-result-object p1

    new-instance v0, Lcom/miui/gallery/video/editor/NexVideoEditor$11$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/video/editor/NexVideoEditor$11$1;-><init>(Lcom/miui/gallery/video/editor/NexVideoEditor$11;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
