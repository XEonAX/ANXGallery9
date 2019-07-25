.class Lcom/miui/gallery/editor/photo/sdk/CleanService$CleanTask;
.super Landroid/os/AsyncTask;
.source "CleanService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/sdk/CleanService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CleanTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Landroid/app/job/JobParameters;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/sdk/CleanService;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/editor/photo/sdk/CleanService;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/sdk/CleanService$CleanTask;->this$0:Lcom/miui/gallery/editor/photo/sdk/CleanService;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/editor/photo/sdk/CleanService;Lcom/miui/gallery/editor/photo/sdk/CleanService$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/sdk/CleanService$CleanTask;-><init>(Lcom/miui/gallery/editor/photo/sdk/CleanService;)V

    return-void
.end method

.method private delete(Ljava/io/File;)Z
    .locals 13

    if-eqz p1, :cond_c

    invoke-virtual {p1}, Ljava/io/File;->isFile()Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :cond_1
    :goto_0
    const-string v0, "CleanService.CleanTask"

    const-string v2, "deleting file: %s. deleted: %b"

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-static {v0, v2, p1, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return v1

    :cond_2
    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/sdk/CleanService$CleanTask;->this$0:Lcom/miui/gallery/editor/photo/sdk/CleanService;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/sdk/CleanService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v0, "external"

    invoke-static {v0}, Landroid/provider/MediaStore$Files;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    const-string v0, "_id"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "_data=?"

    new-array v7, v1, [Ljava/lang/String;

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v7, v2

    const/4 v8, 0x0

    invoke-virtual/range {v3 .. v8}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    const-wide/16 v3, -0x1

    if-eqz v0, :cond_4

    :try_start_0
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :cond_3
    move-wide v5, v3

    :goto_1
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    goto :goto_2

    :catchall_0
    move-exception p1

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    throw p1

    :cond_4
    move-wide v5, v3

    :goto_2
    const-string v0, "CleanService.CleanTask"

    const-string v7, "cleaning directory(%d)"

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-static {v0, v7, v8}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v0, Landroid/util/ArraySet;

    invoke-direct {v0}, Landroid/util/ArraySet;-><init>()V

    cmp-long v7, v5, v3

    if-eqz v7, :cond_7

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/sdk/CleanService$CleanTask;->this$0:Lcom/miui/gallery/editor/photo/sdk/CleanService;

    invoke-virtual {v3}, Lcom/miui/gallery/editor/photo/sdk/CleanService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    const-string v3, "external"

    invoke-static {v3}, Landroid/provider/MediaStore$Files;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v8

    const-string v3, "_data"

    filled-new-array {v3}, [Ljava/lang/String;

    move-result-object v9

    const-string v10, "parent=?"

    new-array v11, v1, [Ljava/lang/String;

    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v11, v2

    const/4 v12, 0x0

    invoke-virtual/range {v7 .. v12}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3

    const-string v4, "CleanService.CleanTask"

    const-string v7, "mark children of %d, count: %d"

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    if-nez v3, :cond_5

    const/4 v6, -0x1

    goto :goto_3

    :cond_5
    invoke-interface {v3}, Landroid/database/Cursor;->getCount()I

    move-result v6

    :goto_3
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v4, v7, v5, v6}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    if-eqz v3, :cond_7

    :goto_4
    :try_start_1
    invoke-interface {v3}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface {v3, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_4

    :cond_6
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    goto :goto_5

    :catchall_1
    move-exception p1

    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    throw p1

    :cond_7
    :goto_5
    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p1

    array-length v3, p1

    const/4 v4, 0x0

    const/4 v5, 0x1

    :goto_6
    if-ge v4, v3, :cond_a

    aget-object v6, p1, v4

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v0, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_9

    iget-object v8, p0, Lcom/miui/gallery/editor/photo/sdk/CleanService$CleanTask;->this$0:Lcom/miui/gallery/editor/photo/sdk/CleanService;

    invoke-virtual {v8}, Lcom/miui/gallery/editor/photo/sdk/CleanService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v8

    const-string v9, "external"

    invoke-static {v9}, Landroid/provider/MediaStore$Files;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v9

    const-string v10, "_data=?"

    new-array v11, v1, [Ljava/lang/String;

    aput-object v7, v11, v2

    invoke-virtual {v8, v9, v10, v11}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v8

    const-string v9, "CleanService.CleanTask"

    const-string v10, "deleted %d item from MediaProvider"

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-static {v9, v10, v11}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    if-lez v8, :cond_8

    invoke-interface {v0, v7}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    invoke-direct {p0, v6}, Lcom/miui/gallery/editor/photo/sdk/CleanService$CleanTask;->delete(Ljava/io/File;)Z

    move-result v6

    and-int/2addr v5, v6

    goto :goto_7

    :cond_8
    const/4 v5, 0x0

    goto :goto_7

    :cond_9
    invoke-direct {p0, v6}, Lcom/miui/gallery/editor/photo/sdk/CleanService$CleanTask;->delete(Ljava/io/File;)Z

    move-result v6

    and-int/2addr v5, v6

    :goto_7
    add-int/lit8 v4, v4, 0x1

    goto :goto_6

    :cond_a
    return v5

    :cond_b
    return v2

    :cond_c
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "file can\'t be null"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Landroid/app/job/JobParameters;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/sdk/CleanService$CleanTask;->doInBackground([Landroid/app/job/JobParameters;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Landroid/app/job/JobParameters;)Ljava/lang/Void;
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/sdk/CleanService$CleanTask;->this$0:Lcom/miui/gallery/editor/photo/sdk/CleanService;

    const/4 v1, 0x0

    aget-object v2, p1, v1

    invoke-static {v0, v2}, Lcom/miui/gallery/editor/photo/sdk/CleanService;->access$100(Lcom/miui/gallery/editor/photo/sdk/CleanService;Landroid/app/job/JobParameters;)Ljava/util/List;

    move-result-object v0

    const-string v2, "CleanService.CleanTask"

    const-string v3, "start clean files: %s"

    invoke-static {v2, v3, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v2, 0x0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-direct {p0, v3}, Lcom/miui/gallery/editor/photo/sdk/CleanService$CleanTask;->delete(Ljava/io/File;)Z

    move-result v3

    xor-int/lit8 v3, v3, 0x1

    or-int/2addr v2, v3

    goto :goto_0

    :cond_1
    const-string v0, "CleanService.CleanTask"

    const-string v3, "job finish, reschedule ? %b"

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {v0, v3, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/sdk/CleanService$CleanTask;->this$0:Lcom/miui/gallery/editor/photo/sdk/CleanService;

    aget-object p1, p1, v1

    invoke-virtual {v0, p1, v2}, Lcom/miui/gallery/editor/photo/sdk/CleanService;->jobFinished(Landroid/app/job/JobParameters;Z)V

    const/4 p1, 0x0

    return-object p1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/sdk/CleanService$CleanTask;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/sdk/CleanService$CleanTask;->this$0:Lcom/miui/gallery/editor/photo/sdk/CleanService;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/sdk/CleanService;->access$202(Lcom/miui/gallery/editor/photo/sdk/CleanService;Lcom/miui/gallery/editor/photo/sdk/CleanService$CleanTask;)Lcom/miui/gallery/editor/photo/sdk/CleanService$CleanTask;

    return-void
.end method
