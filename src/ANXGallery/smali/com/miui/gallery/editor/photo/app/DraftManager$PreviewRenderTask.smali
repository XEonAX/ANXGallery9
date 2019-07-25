.class Lcom/miui/gallery/editor/photo/app/DraftManager$PreviewRenderTask;
.super Landroid/os/AsyncTask;
.source "DraftManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/DraftManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PreviewRenderTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Lcom/miui/gallery/editor/photo/core/RenderData;",
        "Ljava/lang/Void;",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field private mCallback:Lcom/miui/gallery/editor/photo/utils/Callback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/editor/photo/utils/Callback<",
            "Landroid/graphics/Bitmap;",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private mRenderData:Lcom/miui/gallery/editor/photo/core/RenderData;

.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/DraftManager;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/editor/photo/app/DraftManager;Lcom/miui/gallery/editor/photo/utils/Callback;Lcom/miui/gallery/editor/photo/core/RenderData;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/editor/photo/utils/Callback<",
            "Landroid/graphics/Bitmap;",
            "Ljava/lang/Void;",
            ">;",
            "Lcom/miui/gallery/editor/photo/core/RenderData;",
            ")V"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$PreviewRenderTask;->this$0:Lcom/miui/gallery/editor/photo/app/DraftManager;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$PreviewRenderTask;->mCallback:Lcom/miui/gallery/editor/photo/utils/Callback;

    iput-object p3, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$PreviewRenderTask;->mRenderData:Lcom/miui/gallery/editor/photo/core/RenderData;

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Lcom/miui/gallery/editor/photo/core/RenderData;)Landroid/graphics/Bitmap;
    .locals 3

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$PreviewRenderTask;->mCallback:Lcom/miui/gallery/editor/photo/utils/Callback;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lcom/miui/gallery/editor/photo/utils/Callback;->onExecute(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$PreviewRenderTask;->this$0:Lcom/miui/gallery/editor/photo/app/DraftManager;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/DraftManager;->access$600(Lcom/miui/gallery/editor/photo/app/DraftManager;)Landroid/graphics/Bitmap;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$PreviewRenderTask;->this$0:Lcom/miui/gallery/editor/photo/app/DraftManager;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->access$300(Lcom/miui/gallery/editor/photo/app/DraftManager;)Landroid/graphics/Bitmap;

    move-result-object v0

    if-ne p1, v0, :cond_0

    const-string p1, "DraftManager"

    const-string v0, "copy process preview start"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$PreviewRenderTask;->this$0:Lcom/miui/gallery/editor/photo/app/DraftManager;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$PreviewRenderTask;->this$0:Lcom/miui/gallery/editor/photo/app/DraftManager;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->access$300(Lcom/miui/gallery/editor/photo/app/DraftManager;)Landroid/graphics/Bitmap;

    move-result-object v0

    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->access$302(Lcom/miui/gallery/editor/photo/app/DraftManager;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    const-string p1, "DraftManager"

    const-string v0, "copy process preview done"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$PreviewRenderTask;->this$0:Lcom/miui/gallery/editor/photo/app/DraftManager;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/DraftManager;->access$900(Lcom/miui/gallery/editor/photo/app/DraftManager;)Landroid/content/Context;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$PreviewRenderTask;->mRenderData:Lcom/miui/gallery/editor/photo/core/RenderData;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$PreviewRenderTask;->this$0:Lcom/miui/gallery/editor/photo/app/DraftManager;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/app/DraftManager;->access$1100(Lcom/miui/gallery/editor/photo/app/DraftManager;)[Lcom/miui/gallery/editor/photo/core/RenderEngine;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/editor/photo/core/RenderEngine;->findEngine(Landroid/content/Context;Lcom/miui/gallery/editor/photo/core/RenderData;[Lcom/miui/gallery/editor/photo/core/RenderEngine;)Lcom/miui/gallery/editor/photo/core/RenderEngine;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$PreviewRenderTask;->this$0:Lcom/miui/gallery/editor/photo/app/DraftManager;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->access$300(Lcom/miui/gallery/editor/photo/app/DraftManager;)Landroid/graphics/Bitmap;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$PreviewRenderTask;->mRenderData:Lcom/miui/gallery/editor/photo/core/RenderData;

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/editor/photo/core/RenderEngine;->render(Landroid/graphics/Bitmap;Lcom/miui/gallery/editor/photo/core/RenderData;)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Lcom/miui/gallery/editor/photo/core/RenderData;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/app/DraftManager$PreviewRenderTask;->doInBackground([Lcom/miui/gallery/editor/photo/core/RenderData;)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1
.end method

.method protected onCancelled(Landroid/graphics/Bitmap;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$PreviewRenderTask;->mCallback:Lcom/miui/gallery/editor/photo/utils/Callback;

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/utils/Callback;->onCancel()V

    return-void
.end method

.method protected bridge synthetic onCancelled(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/app/DraftManager$PreviewRenderTask;->onCancelled(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method protected onPostExecute(Landroid/graphics/Bitmap;)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$PreviewRenderTask;->this$0:Lcom/miui/gallery/editor/photo/app/DraftManager;

    invoke-static {v0, p1}, Lcom/miui/gallery/editor/photo/app/DraftManager;->access$302(Lcom/miui/gallery/editor/photo/app/DraftManager;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$PreviewRenderTask;->this$0:Lcom/miui/gallery/editor/photo/app/DraftManager;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/DraftManager;->access$1000(Lcom/miui/gallery/editor/photo/app/DraftManager;)Ljava/util/List;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$PreviewRenderTask;->mRenderData:Lcom/miui/gallery/editor/photo/core/RenderData;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$PreviewRenderTask;->mCallback:Lcom/miui/gallery/editor/photo/utils/Callback;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$PreviewRenderTask;->this$0:Lcom/miui/gallery/editor/photo/app/DraftManager;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->access$300(Lcom/miui/gallery/editor/photo/app/DraftManager;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/miui/gallery/editor/photo/utils/Callback;->onDone(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$PreviewRenderTask;->mCallback:Lcom/miui/gallery/editor/photo/utils/Callback;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lcom/miui/gallery/editor/photo/utils/Callback;->onError(Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/app/DraftManager$PreviewRenderTask;->onPostExecute(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$PreviewRenderTask;->mCallback:Lcom/miui/gallery/editor/photo/utils/Callback;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/utils/Callback;->onPrepare()V

    return-void
.end method
