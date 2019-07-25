.class Lcom/miui/gallery/video/editor/NexVideoEditor$2$1;
.super Landroid/os/AsyncTask;
.source "NexVideoEditor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/video/editor/NexVideoEditor$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/video/editor/NexVideoEditor$2;


# direct methods
.method constructor <init>(Lcom/miui/gallery/video/editor/NexVideoEditor$2;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$2$1;->this$1:Lcom/miui/gallery/video/editor/NexVideoEditor$2;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Boolean;
    .locals 6

    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$2$1;->this$1:Lcom/miui/gallery/video/editor/NexVideoEditor$2;

    iget-object p1, p1, Lcom/miui/gallery/video/editor/NexVideoEditor$2;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    iget-object v2, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$2$1;->this$1:Lcom/miui/gallery/video/editor/NexVideoEditor$2;

    iget-object v2, v2, Lcom/miui/gallery/video/editor/NexVideoEditor$2;->val$path:Ljava/lang/String;

    invoke-static {p1, v2}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$500(Lcom/miui/gallery/video/editor/NexVideoEditor;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$2$1;->this$1:Lcom/miui/gallery/video/editor/NexVideoEditor$2;

    iget-object p1, p1, Lcom/miui/gallery/video/editor/NexVideoEditor$2;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$600(Lcom/miui/gallery/video/editor/NexVideoEditor;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$2$1;->this$1:Lcom/miui/gallery/video/editor/NexVideoEditor$2;

    iget-object p1, p1, Lcom/miui/gallery/video/editor/NexVideoEditor$2;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$700(Lcom/miui/gallery/video/editor/NexVideoEditor;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$2$1;->this$1:Lcom/miui/gallery/video/editor/NexVideoEditor$2;

    iget-object p1, p1, Lcom/miui/gallery/video/editor/NexVideoEditor$2;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$800(Lcom/miui/gallery/video/editor/NexVideoEditor;)V

    const-string p1, "NexVideoEditor"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "load project using :"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    const/4 v5, 0x0

    sub-long/2addr v3, v0

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, "ms"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    const-string v0, "NexVideoEditor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "doInBackground: e"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/video/editor/NexVideoEditor$2$1;->doInBackground([Ljava/lang/Void;)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Ljava/lang/Boolean;)V
    .locals 2

    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$2$1;->this$1:Lcom/miui/gallery/video/editor/NexVideoEditor$2;

    iget-object v0, v0, Lcom/miui/gallery/video/editor/NexVideoEditor$2;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$900(Lcom/miui/gallery/video/editor/NexVideoEditor;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$2$1;->this$1:Lcom/miui/gallery/video/editor/NexVideoEditor$2;

    iget-object v0, v0, Lcom/miui/gallery/video/editor/NexVideoEditor$2;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    iget-object v0, v0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mDisplayWrapper:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->getDisplayView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->requestLayout()V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$2$1;->this$1:Lcom/miui/gallery/video/editor/NexVideoEditor$2;

    iget-object v0, v0, Lcom/miui/gallery/video/editor/NexVideoEditor$2;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    iget-object v0, v0, Lcom/miui/gallery/video/editor/NexVideoEditor;->mDisplayWrapper:Lcom/miui/gallery/video/editor/widget/DisplayWrapper;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$2$1;->this$1:Lcom/miui/gallery/video/editor/NexVideoEditor$2;

    iget-object v1, v1, Lcom/miui/gallery/video/editor/NexVideoEditor$2;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {v1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1000(Lcom/miui/gallery/video/editor/NexVideoEditor;)F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/widget/DisplayWrapper;->setAspectRatio(F)V

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$2$1;->this$1:Lcom/miui/gallery/video/editor/NexVideoEditor$2;

    iget-object p1, p1, Lcom/miui/gallery/video/editor/NexVideoEditor$2;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$2$1;->this$1:Lcom/miui/gallery/video/editor/NexVideoEditor$2;

    iget-object v0, v0, Lcom/miui/gallery/video/editor/NexVideoEditor$2;->val$listener:Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;

    invoke-static {p1, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$1100(Lcom/miui/gallery/video/editor/NexVideoEditor;Lcom/miui/gallery/video/editor/VideoEditor$OnCompletedListener;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$2$1;->this$1:Lcom/miui/gallery/video/editor/NexVideoEditor$2;

    iget-object p1, p1, Lcom/miui/gallery/video/editor/NexVideoEditor$2;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$200(Lcom/miui/gallery/video/editor/NexVideoEditor;)Lcom/nexstreaming/nexeditorsdk/nexEngine;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->updateScreenMode()V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/video/editor/NexVideoEditor$2$1;->this$1:Lcom/miui/gallery/video/editor/NexVideoEditor$2;

    iget-object p1, p1, Lcom/miui/gallery/video/editor/NexVideoEditor$2;->this$0:Lcom/miui/gallery/video/editor/NexVideoEditor;

    const/16 v0, 0x1f4

    invoke-static {p1, v0}, Lcom/miui/gallery/video/editor/NexVideoEditor;->access$400(Lcom/miui/gallery/video/editor/NexVideoEditor;I)V

    :cond_1
    :goto_0
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/video/editor/NexVideoEditor$2$1;->onPostExecute(Ljava/lang/Boolean;)V

    return-void
.end method
