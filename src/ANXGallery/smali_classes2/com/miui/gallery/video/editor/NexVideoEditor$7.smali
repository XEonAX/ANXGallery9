.class Lcom/miui/gallery/video/editor/NexVideoEditor$7;
.super Ljava/lang/Object;
.source "NexVideoEditor.java"

# interfaces
.implements Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/video/editor/NexVideoEditor;->seek(ILcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)V
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

    iput-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$7;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    iput p2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$7;->val$time:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$7;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    iget v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$7;->val$time:I

    invoke-static {v0, v1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1300(Lcom/miui/gallery/video/editor/NexVideoEditor;I)V

    return-void
.end method
