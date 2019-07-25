.class final Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager$QueryProgressAsyncTask;
.super Landroid/os/AsyncTask;
.source "PhotoPageImageItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "QueryProgressAsyncTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mUri:Landroid/net/Uri;

.field final synthetic this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;Landroid/content/Context;Landroid/net/Uri;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager$QueryProgressAsyncTask;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager$QueryProgressAsyncTask;->mContext:Landroid/content/Context;

    iput-object p3, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager$QueryProgressAsyncTask;->mUri:Landroid/net/Uri;

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Integer;
    .locals 7

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager$QueryProgressAsyncTask;->isCancelled()Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    return-object v0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager$QueryProgressAsyncTask;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager$QueryProgressAsyncTask;->mUri:Landroid/net/Uri;

    const-string p1, "progress_percentage"

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager$QueryProgressAsyncTask;->isCancelled()Z

    move-result v1

    if-eqz v1, :cond_1

    return-object v0

    :cond_1
    if-nez p1, :cond_3

    invoke-static {}, Lcom/miui/gallery/ui/PhotoPageImageItem;->access$1900()Z

    move-result p1

    if-eqz p1, :cond_2

    const-string p1, "PhotoPageImageItem"

    const-string v1, "Failed to obtain cursor for: %s"

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager$QueryProgressAsyncTask;->mUri:Landroid/net/Uri;

    invoke-static {p1, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_2
    return-object v0

    :cond_3
    :try_start_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_4

    const-string v0, "progress_percentage"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    return-object v0

    :cond_4
    :try_start_1
    invoke-static {}, Lcom/miui/gallery/ui/PhotoPageImageItem;->access$1900()Z

    move-result v1

    if-eqz v1, :cond_5

    const-string v1, "PhotoPageImageItem"

    const-string v2, "Failed to find item for: %s"

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager$QueryProgressAsyncTask;->mUri:Landroid/net/Uri;

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_5
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    return-object v0

    :catchall_0
    move-exception v0

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    throw v0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager$QueryProgressAsyncTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Ljava/lang/Integer;)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager$QueryProgressAsyncTask;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager$QueryProgressAsyncTask;->this$1:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager$QueryProgressAsyncTask;->mUri:Landroid/net/Uri;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->access$2100(Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;Landroid/net/Uri;I)V

    :cond_1
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager$QueryProgressAsyncTask;->onPostExecute(Ljava/lang/Integer;)V

    return-void
.end method
