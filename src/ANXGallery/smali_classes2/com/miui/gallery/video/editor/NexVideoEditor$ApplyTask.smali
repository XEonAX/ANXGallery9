.class Lcom/miui/gallery/video/editor/NexVideoEditor$ApplyTask;
.super Landroid/os/AsyncTask;
.source "NexVideoEditor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/video/editor/NexVideoEditor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ApplyTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Lcom/miui/gallery/video/editor/NexVideoEditor$Change;",
        "Ljava/lang/Void;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field private mOnCompletedListener:Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;

.field final synthetic this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/video/editor/NexVideoEditor;Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$ApplyTask;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$ApplyTask;->mOnCompletedListener:Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Lcom/miui/gallery/video/editor/NexVideoEditor$Change;)Ljava/lang/Boolean;
    .locals 3

    if-eqz p1, :cond_0

    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-object v2, p1, v1

    invoke-interface {v2}, Lcom/miui/gallery/video/editor/NexVideoEditor$Change;->applyChange()V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$ApplyTask;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$200(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/nexstreaming/nexeditorsdk/nexEngine;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->updateProject()V

    const/4 p1, 0x1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Lcom/miui/gallery/video/editor/NexVideoEditor$Change;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/video/editor/NexVideoEditor$ApplyTask;->doInBackground([Lcom/miui/gallery/video/editor/NexVideoEditor$Change;)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Ljava/lang/Boolean;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$ApplyTask;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1900(Lcom/miui/gallery/video/editor/NexVideoEditor;)Ljava/util/HashMap;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/HashMap;->clear()V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$ApplyTask;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$400(Lcom/miui/gallery/video/editor/NexVideoEditor;I)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$ApplyTask;->mOnCompletedListener:Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$ApplyTask;->mOnCompletedListener:Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;

    invoke-interface {p1}, Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;->onCompleted()V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$ApplyTask;->mOnCompletedListener:Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;

    :cond_0
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/video/editor/NexVideoEditor$ApplyTask;->onPostExecute(Ljava/lang/Boolean;)V

    return-void
.end method
