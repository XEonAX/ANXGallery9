.class Lcom/miui/gallery/editor/photo/app/DraftManager$ReRenderTask;
.super Landroid/os/AsyncTask;
.source "DraftManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/DraftManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ReRenderTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Boolean;",
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

.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/DraftManager;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/editor/photo/app/DraftManager;Lcom/miui/gallery/editor/photo/utils/Callback;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/editor/photo/utils/Callback<",
            "Landroid/graphics/Bitmap;",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$ReRenderTask;->this$0:Lcom/miui/gallery/editor/photo/app/DraftManager;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$ReRenderTask;->mCallback:Lcom/miui/gallery/editor/photo/utils/Callback;

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Boolean;)Landroid/graphics/Bitmap;
    .locals 5

    const/4 v0, 0x0

    aget-object p1, p1, v0

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$ReRenderTask;->mCallback:Lcom/miui/gallery/editor/photo/utils/Callback;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/miui/gallery/editor/photo/utils/Callback;->onExecute(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$ReRenderTask;->this$0:Lcom/miui/gallery/editor/photo/app/DraftManager;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->access$600(Lcom/miui/gallery/editor/photo/app/DraftManager;)Landroid/graphics/Bitmap;

    move-result-object v0

    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    const/4 v3, 0x1

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object v0

    if-nez p1, :cond_0

    :try_start_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$ReRenderTask;->this$0:Lcom/miui/gallery/editor/photo/app/DraftManager;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/DraftManager;->access$700(Lcom/miui/gallery/editor/photo/app/DraftManager;)Ljava/io/InputStream;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$ReRenderTask;->this$0:Lcom/miui/gallery/editor/photo/app/DraftManager;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/app/DraftManager;->access$800(Lcom/miui/gallery/editor/photo/app/DraftManager;)Lcom/miui/gallery/editor/photo/app/XmpExtraManager;

    move-result-object v1

    invoke-virtual {v1, v0, p1}, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->sweepImage(Landroid/graphics/Bitmap;Ljava/io/InputStream;)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    :catch_0
    move-exception v1

    goto :goto_0

    :catchall_0
    move-exception v0

    move-object p1, v1

    goto :goto_2

    :catch_1
    move-exception p1

    move-object v4, v1

    move-object v1, p1

    move-object p1, v4

    :goto_0
    :try_start_2
    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :goto_1
    const-string v1, "DraftManager"

    invoke-static {v1, p1}, Lcom/miui/gallery/editor/photo/utils/IoUtils;->close(Ljava/lang/String;Ljava/io/Closeable;)V

    goto :goto_3

    :catchall_1
    move-exception v0

    :goto_2
    const-string v1, "DraftManager"

    invoke-static {v1, p1}, Lcom/miui/gallery/editor/photo/utils/IoUtils;->close(Ljava/lang/String;Ljava/io/Closeable;)V

    throw v0

    :cond_0
    :goto_3
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$ReRenderTask;->this$0:Lcom/miui/gallery/editor/photo/app/DraftManager;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/DraftManager;->access$900(Lcom/miui/gallery/editor/photo/app/DraftManager;)Landroid/content/Context;

    move-result-object p1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$ReRenderTask;->this$0:Lcom/miui/gallery/editor/photo/app/DraftManager;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/app/DraftManager;->access$1000(Lcom/miui/gallery/editor/photo/app/DraftManager;)Ljava/util/List;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$ReRenderTask;->this$0:Lcom/miui/gallery/editor/photo/app/DraftManager;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/app/DraftManager;->access$1100(Lcom/miui/gallery/editor/photo/app/DraftManager;)[Lcom/miui/gallery/editor/photo/core/RenderEngine;

    move-result-object v2

    invoke-static {p1, v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/RenderEngine;->render(Landroid/content/Context;Landroid/graphics/Bitmap;Ljava/util/List;[Lcom/miui/gallery/editor/photo/core/RenderEngine;)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/app/DraftManager$ReRenderTask;->doInBackground([Ljava/lang/Boolean;)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Landroid/graphics/Bitmap;)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$ReRenderTask;->this$0:Lcom/miui/gallery/editor/photo/app/DraftManager;

    invoke-static {v0, p1}, Lcom/miui/gallery/editor/photo/app/DraftManager;->access$302(Lcom/miui/gallery/editor/photo/app/DraftManager;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$ReRenderTask;->mCallback:Lcom/miui/gallery/editor/photo/utils/Callback;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$ReRenderTask;->this$0:Lcom/miui/gallery/editor/photo/app/DraftManager;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->access$300(Lcom/miui/gallery/editor/photo/app/DraftManager;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/miui/gallery/editor/photo/utils/Callback;->onDone(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$ReRenderTask;->mCallback:Lcom/miui/gallery/editor/photo/utils/Callback;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lcom/miui/gallery/editor/photo/utils/Callback;->onError(Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/app/DraftManager$ReRenderTask;->onPostExecute(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager$ReRenderTask;->mCallback:Lcom/miui/gallery/editor/photo/utils/Callback;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/utils/Callback;->onPrepare()V

    return-void
.end method
