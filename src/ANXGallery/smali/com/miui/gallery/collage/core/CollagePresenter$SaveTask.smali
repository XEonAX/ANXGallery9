.class Lcom/miui/gallery/collage/core/CollagePresenter$SaveTask;
.super Landroid/os/AsyncTask;
.source "CollagePresenter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/collage/core/CollagePresenter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SaveTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mOutPath:Ljava/lang/String;

.field private final mRenderData:Lcom/miui/gallery/collage/core/RenderData;

.field private final mRenderEngine:Lcom/miui/gallery/collage/core/RenderEngine;

.field private mSaveListener:Lcom/miui/gallery/collage/core/CollagePresenter$SaveListener;

.field private mSuccess:Z


# direct methods
.method private constructor <init>(Lcom/miui/gallery/collage/core/RenderEngine;Lcom/miui/gallery/collage/core/RenderData;Ljava/lang/String;Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/collage/core/CollagePresenter$SaveTask;->mSuccess:Z

    iput-object p1, p0, Lcom/miui/gallery/collage/core/CollagePresenter$SaveTask;->mRenderEngine:Lcom/miui/gallery/collage/core/RenderEngine;

    iput-object p2, p0, Lcom/miui/gallery/collage/core/CollagePresenter$SaveTask;->mRenderData:Lcom/miui/gallery/collage/core/RenderData;

    iput-object p3, p0, Lcom/miui/gallery/collage/core/CollagePresenter$SaveTask;->mOutPath:Ljava/lang/String;

    invoke-virtual {p4}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/collage/core/CollagePresenter$SaveTask;->mContext:Landroid/content/Context;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/collage/core/RenderEngine;Lcom/miui/gallery/collage/core/RenderData;Ljava/lang/String;Landroid/content/Context;Lcom/miui/gallery/collage/core/CollagePresenter$1;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/miui/gallery/collage/core/CollagePresenter$SaveTask;-><init>(Lcom/miui/gallery/collage/core/RenderEngine;Lcom/miui/gallery/collage/core/RenderData;Ljava/lang/String;Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$002(Lcom/miui/gallery/collage/core/CollagePresenter$SaveTask;Lcom/miui/gallery/collage/core/CollagePresenter$SaveListener;)Lcom/miui/gallery/collage/core/CollagePresenter$SaveListener;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/collage/core/CollagePresenter$SaveTask;->mSaveListener:Lcom/miui/gallery/collage/core/CollagePresenter$SaveListener;

    return-object p1
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/collage/core/CollagePresenter$SaveTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 5

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/collage/core/CollagePresenter$SaveTask;->mSuccess:Z

    iget-object p1, p0, Lcom/miui/gallery/collage/core/CollagePresenter$SaveTask;->mRenderEngine:Lcom/miui/gallery/collage/core/RenderEngine;

    iget-object v0, p0, Lcom/miui/gallery/collage/core/CollagePresenter$SaveTask;->mRenderData:Lcom/miui/gallery/collage/core/RenderData;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/collage/core/RenderEngine;->render(Lcom/miui/gallery/collage/core/RenderData;)Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/collage/core/CollagePresenter$SaveTask;->isCancelled()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    :cond_0
    new-instance v0, Ljava/io/File;

    iget-object v2, p0, Lcom/miui/gallery/collage/core/CollagePresenter$SaveTask;->mOutPath:Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    :try_start_0
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    :cond_1
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    :cond_2
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    sget-object v3, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v4, 0x64

    invoke-virtual {p1, v3, v4, v2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    invoke-virtual {v2}, Ljava/io/FileOutputStream;->flush()V

    iget-object p1, p0, Lcom/miui/gallery/collage/core/CollagePresenter$SaveTask;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v3}, Lcom/miui/gallery/scanner/MediaScanner;->scanSingleFile(Landroid/content/Context;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/collage/core/CollagePresenter$SaveTask;->mContext:Landroid/content/Context;

    const/4 v3, 0x1

    invoke-static {p1, v0, v3}, Lcom/miui/gallery/util/MediaStoreUtils;->insert(Landroid/content/Context;Ljava/io/File;I)Landroid/net/Uri;

    iput-boolean v3, p0, Lcom/miui/gallery/collage/core/CollagePresenter$SaveTask;->mSuccess:Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    :catch_0
    move-exception p1

    goto :goto_0

    :catchall_0
    move-exception p1

    move-object v2, v1

    goto :goto_2

    :catch_1
    move-exception p1

    move-object v2, v1

    :goto_0
    :try_start_2
    const-string v0, "CollagePresenter"

    invoke-static {v0, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :goto_1
    invoke-static {v2}, Lcom/miui/gallery/editor/photo/utils/IoUtils;->close(Ljava/io/Closeable;)V

    return-object v1

    :catchall_1
    move-exception p1

    :goto_2
    invoke-static {v2}, Lcom/miui/gallery/editor/photo/utils/IoUtils;->close(Ljava/io/Closeable;)V

    throw p1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/collage/core/CollagePresenter$SaveTask;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/collage/core/CollagePresenter$SaveTask;->mSaveListener:Lcom/miui/gallery/collage/core/CollagePresenter$SaveListener;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/collage/core/CollagePresenter$SaveTask;->mSaveListener:Lcom/miui/gallery/collage/core/CollagePresenter$SaveListener;

    iget-object v0, p0, Lcom/miui/gallery/collage/core/CollagePresenter$SaveTask;->mOutPath:Ljava/lang/String;

    iget-boolean v1, p0, Lcom/miui/gallery/collage/core/CollagePresenter$SaveTask;->mSuccess:Z

    invoke-interface {p1, v0, v1}, Lcom/miui/gallery/collage/core/CollagePresenter$SaveListener;->onSaveFinish(Ljava/lang/String;Z)V

    :cond_0
    return-void
.end method
