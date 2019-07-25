.class Lcom/miui/gallery/editor/photo/sdk/RenderTask$PrepareTask;
.super Landroid/os/AsyncTask;
.source "RenderTask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/sdk/RenderTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PrepareTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Lcom/miui/gallery/editor/photo/sdk/RenderTask$Parameter;",
        "Ljava/lang/Void;",
        "Lcom/miui/gallery/editor/photo/sdk/RenderTask$Parameter;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/sdk/RenderTask;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/editor/photo/sdk/RenderTask;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask$PrepareTask;->this$0:Lcom/miui/gallery/editor/photo/sdk/RenderTask;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/editor/photo/sdk/RenderTask;Lcom/miui/gallery/editor/photo/sdk/RenderTask$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/sdk/RenderTask$PrepareTask;-><init>(Lcom/miui/gallery/editor/photo/sdk/RenderTask;)V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Lcom/miui/gallery/editor/photo/sdk/RenderTask$Parameter;)Lcom/miui/gallery/editor/photo/sdk/RenderTask$Parameter;
    .locals 6

    const/4 v0, 0x0

    aget-object p1, p1, v0

    iget-object v0, p1, Lcom/miui/gallery/editor/photo/sdk/RenderTask$Parameter;->mOutput:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v0, Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-nez v0, :cond_0

    return-object v2

    :cond_0
    new-instance v0, Lcom/miui/gallery3d/exif/ExifInterface;

    invoke-direct {v0}, Lcom/miui/gallery3d/exif/ExifInterface;-><init>()V

    :try_start_0
    iget-object v1, p1, Lcom/miui/gallery/editor/photo/sdk/RenderTask$Parameter;->mSource:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery3d/exif/ExifInterface;->readExif(Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/miui/gallery3d/exif/ExifInvalidFormatException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    const-string v3, "RenderTask"

    invoke-static {v3, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :catch_1
    move-exception v1

    const-string v3, "RenderTask"

    invoke-static {v3, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    :try_start_1
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask$PrepareTask;->this$0:Lcom/miui/gallery/editor/photo/sdk/RenderTask;

    iget-object v3, p1, Lcom/miui/gallery/editor/photo/sdk/RenderTask$Parameter;->mSource:Landroid/net/Uri;

    invoke-virtual {v1, v3, v0}, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->decodeOrigin(Landroid/net/Uri;Lcom/miui/gallery3d/exif/ExifInterface;)Landroid/graphics/Bitmap;

    move-result-object v1
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_1

    :catch_2
    move-exception v1

    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->printStackTrace()V

    move-object v1, v2

    :goto_1
    if-eqz v1, :cond_2

    new-instance v3, Lcom/miui/gallery/editor/photo/sdk/AutoRenderer;

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask$PrepareTask;->this$0:Lcom/miui/gallery/editor/photo/sdk/RenderTask;

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->access$500(Lcom/miui/gallery/editor/photo/sdk/RenderTask;)Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/miui/gallery/editor/photo/sdk/AutoRenderer;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v1}, Lcom/miui/gallery/editor/photo/sdk/AutoRenderer;->render(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v1

    if-eqz v1, :cond_1

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask$PrepareTask;->this$0:Lcom/miui/gallery/editor/photo/sdk/RenderTask;

    iget-object v5, p1, Lcom/miui/gallery/editor/photo/sdk/RenderTask$Parameter;->mOutput:Landroid/net/Uri;

    invoke-static {v4, v1, v5, v0}, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->access$600(Lcom/miui/gallery/editor/photo/sdk/RenderTask;Landroid/graphics/Bitmap;Landroid/net/Uri;Lcom/miui/gallery3d/exif/ExifInterface;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask$PrepareTask;->this$0:Lcom/miui/gallery/editor/photo/sdk/RenderTask;

    iget-object v1, p1, Lcom/miui/gallery/editor/photo/sdk/RenderTask$Parameter;->mOutput:Landroid/net/Uri;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->performItemFinish(Landroid/net/Uri;)V

    goto :goto_2

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask$PrepareTask;->this$0:Lcom/miui/gallery/editor/photo/sdk/RenderTask;

    invoke-virtual {v0, v2}, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->performItemFinish(Landroid/net/Uri;)V

    :goto_2
    invoke-virtual {v3}, Lcom/miui/gallery/editor/photo/sdk/AutoRenderer;->release()V

    :cond_2
    return-object p1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Lcom/miui/gallery/editor/photo/sdk/RenderTask$Parameter;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/sdk/RenderTask$PrepareTask;->doInBackground([Lcom/miui/gallery/editor/photo/sdk/RenderTask$Parameter;)Lcom/miui/gallery/editor/photo/sdk/RenderTask$Parameter;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Lcom/miui/gallery/editor/photo/sdk/RenderTask$Parameter;)V
    .locals 3

    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/sdk/RenderTask$PrepareTask;->this$0:Lcom/miui/gallery/editor/photo/sdk/RenderTask;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/sdk/RenderTask;->access$100(Lcom/miui/gallery/editor/photo/sdk/RenderTask;)Lcom/miui/gallery/editor/photo/sdk/RenderTask$Callback;

    move-result-object p1

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/sdk/RenderTask$Callback;->onTaskError()V

    return-void

    :cond_0
    const-string v0, "RenderTask"

    const-string v1, "schedule for %s -> %s"

    iget-object v2, p1, Lcom/miui/gallery/editor/photo/sdk/RenderTask$Parameter;->mSource:Landroid/net/Uri;

    iget-object p1, p1, Lcom/miui/gallery/editor/photo/sdk/RenderTask$Parameter;->mOutput:Landroid/net/Uri;

    invoke-static {v0, v1, v2, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/editor/photo/sdk/RenderTask$Parameter;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/sdk/RenderTask$PrepareTask;->onPostExecute(Lcom/miui/gallery/editor/photo/sdk/RenderTask$Parameter;)V

    return-void
.end method
