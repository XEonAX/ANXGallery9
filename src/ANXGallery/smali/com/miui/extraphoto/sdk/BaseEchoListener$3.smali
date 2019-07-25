.class Lcom/miui/extraphoto/sdk/BaseEchoListener$3;
.super Ljava/lang/Object;
.source "BaseEchoListener.java"

# interfaces
.implements Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/extraphoto/sdk/BaseEchoListener;->updateDataBase(Ljava/lang/String;)Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/util/SafeDBUtil$QueryHandler<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/extraphoto/sdk/BaseEchoListener;

.field final synthetic val$path:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/miui/extraphoto/sdk/BaseEchoListener;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/extraphoto/sdk/BaseEchoListener$3;->this$0:Lcom/miui/extraphoto/sdk/BaseEchoListener;

    iput-object p2, p0, Lcom/miui/extraphoto/sdk/BaseEchoListener$3;->val$path:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic handle(Landroid/database/Cursor;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/extraphoto/sdk/BaseEchoListener$3;->handle(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public handle(Landroid/database/Cursor;)Ljava/lang/String;
    .locals 13

    const/4 v0, 0x0

    if-eqz p1, :cond_5

    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_5

    const-string v1, "_id"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    const-string v3, "serverId"

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "localFlag"

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    iget-object v5, p0, Lcom/miui/extraphoto/sdk/BaseEchoListener$3;->this$0:Lcom/miui/extraphoto/sdk/BaseEchoListener;

    invoke-static {v5, v4}, Lcom/miui/extraphoto/sdk/BaseEchoListener;->access$000(Lcom/miui/extraphoto/sdk/BaseEchoListener;I)Z

    move-result v4

    if-nez v4, :cond_5

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v3, :cond_0

    new-instance p1, Landroid/content/ContentValues;

    invoke-direct {p1}, Landroid/content/ContentValues;-><init>()V

    const-string v3, "_size"

    new-instance v6, Ljava/io/File;

    iget-object v7, p0, Lcom/miui/extraphoto/sdk/BaseEchoListener$3;->val$path:Ljava/lang/String;

    invoke-direct {v6, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/File;->length()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {p1, v3, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v3, "external"

    invoke-static {v3}, Landroid/provider/MediaStore$Files;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v6

    const-string v7, "_data=?"

    new-array v5, v5, [Ljava/lang/String;

    iget-object v8, p0, Lcom/miui/extraphoto/sdk/BaseEchoListener$3;->val$path:Ljava/lang/String;

    aput-object v8, v5, v4

    invoke-static {v6, v3, p1, v7, v5}, Lcom/miui/gallery/util/SafeDBUtil;->safeUpdate(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    invoke-virtual {p1}, Landroid/content/ContentValues;->clear()V

    const-string v3, "sha1"

    iget-object v4, p0, Lcom/miui/extraphoto/sdk/BaseEchoListener$3;->val$path:Ljava/lang/String;

    invoke-static {v4}, Lcom/miui/gallery/util/FileUtils;->getSha1(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "size"

    iget-object v4, p0, Lcom/miui/extraphoto/sdk/BaseEchoListener$3;->val$path:Ljava/lang/String;

    invoke-static {v4}, Lcom/miui/gallery/util/FileUtils;->getFileSize(Ljava/lang/String;)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {p1, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    sget-object v4, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "_id="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v4, p1, v1, v0}, Lcom/miui/gallery/util/SafeDBUtil;->safeUpdate(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    iget-object v0, p0, Lcom/miui/extraphoto/sdk/BaseEchoListener$3;->val$path:Ljava/lang/String;

    goto/16 :goto_2

    :cond_0
    const-string v3, "mixedDateTime"

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    new-instance v3, Ljava/text/SimpleDateFormat;

    const-string v8, "\'IMG\'_yyyyMMdd_HHmmss\'_STEREO.jpg\'"

    invoke-direct {v3, v8}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v8, Ljava/util/Date;

    const-wide/16 v9, 0x2710

    add-long/2addr v6, v9

    invoke-direct {v8, v6, v7}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v3, v8}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    new-instance v6, Ljava/io/File;

    iget-object v7, p0, Lcom/miui/extraphoto/sdk/BaseEchoListener$3;->val$path:Ljava/lang/String;

    invoke-direct {v6, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v7, Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v8

    invoke-direct {v7, v8, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v7}, Lcom/miui/gallery/util/FileUtils;->move(Ljava/io/File;Ljava/io/File;)Z

    move-result v9

    if-eqz v9, :cond_4

    new-instance v6, Landroid/content/ContentValues;

    invoke-direct {v6}, Landroid/content/ContentValues;-><init>()V

    const-string v9, "_data"

    invoke-virtual {v6, v9, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v9, "_size"

    invoke-virtual {v7}, Ljava/io/File;->length()J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v6, v9, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v7, "external"

    invoke-static {v7}, Landroid/provider/MediaStore$Files;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v9

    const-string v10, "_data like ?"

    new-array v11, v5, [Ljava/lang/String;

    iget-object v12, p0, Lcom/miui/extraphoto/sdk/BaseEchoListener$3;->val$path:Ljava/lang/String;

    aput-object v12, v11, v4

    invoke-static {v9, v7, v6, v10, v11}, Lcom/miui/gallery/util/SafeDBUtil;->safeUpdate(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    invoke-virtual {v6}, Landroid/content/ContentValues;->clear()V

    invoke-interface {p1}, Landroid/database/Cursor;->getColumnCount()I

    move-result v7

    const/4 v9, 0x0

    :goto_0
    if-ge v9, v7, :cond_1

    iget-object v10, p0, Lcom/miui/extraphoto/sdk/BaseEchoListener$3;->this$0:Lcom/miui/extraphoto/sdk/BaseEchoListener;

    invoke-static {v10, p1, v9, v6}, Lcom/miui/extraphoto/sdk/BaseEchoListener;->access$100(Lcom/miui/extraphoto/sdk/BaseEchoListener;Landroid/database/Cursor;ILandroid/content/ContentValues;)V

    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    :cond_1
    const-string p1, "size"

    invoke-static {v8}, Lcom/miui/gallery/util/FileUtils;->getFileSize(Ljava/lang/String;)J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v6, p1, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string p1, "sha1"

    invoke-static {v8}, Lcom/miui/gallery/util/FileUtils;->getSha1(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, p1, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "localFlag"

    const/16 v7, 0x8

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v6, p1, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string p1, "_id"

    invoke-virtual {v6, p1}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    const-string p1, "serverId"

    invoke-virtual {v6, p1}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    const-string p1, "groupId"

    invoke-virtual {v6, p1}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    const-string p1, "serverStatus"

    invoke-virtual {v6, p1}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    const-string p1, "serverTag"

    invoke-virtual {v6, p1}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    const-string p1, "fileName"

    invoke-virtual {v6, p1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "title"

    invoke-static {v3}, Lcom/miui/gallery/util/FileUtils;->getFileTitle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, p1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "localFile"

    invoke-virtual {v6, p1, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object p1

    sget-object v3, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    invoke-static {p1, v3, v6}, Lcom/miui/gallery/util/SafeDBUtil;->safeInsert(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_2

    invoke-static {p1}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v9

    const-wide/16 v11, 0x0

    cmp-long p1, v9, v11

    if-lez p1, :cond_2

    invoke-virtual {v6}, Landroid/content/ContentValues;->clear()V

    const-string p1, "localFlag"

    const/4 v3, 0x2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v6, p1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object p1

    sget-object v3, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "_id="

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v3, v6, v1, v0}, Lcom/miui/gallery/util/SafeDBUtil;->safeUpdate(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    const/4 p1, 0x1

    goto :goto_1

    :cond_2
    const/4 p1, 0x0

    :goto_1
    if-eqz p1, :cond_3

    move-object v0, v8

    goto :goto_2

    :cond_3
    const-string p1, "BaseEchoListener"

    const-string v1, "insert file fail %s"

    invoke-static {p1, v1, v8}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    sget-object p1, Lcom/miui/gallery/util/MediaFileUtils$FileType;->ORIGINAL:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-array v1, v5, [Ljava/lang/String;

    aput-object v8, v1, v4

    invoke-static {p1, v1}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/lang/String;)I

    goto :goto_2

    :cond_4
    const-string p1, "BaseEchoListener"

    const-string v1, "server rename file fail %s"

    iget-object v2, p0, Lcom/miui/extraphoto/sdk/BaseEchoListener$3;->val$path:Ljava/lang/String;

    invoke-static {p1, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    sget-object p1, Lcom/miui/gallery/util/MediaFileUtils$FileType;->ORIGINAL:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-array v1, v5, [Ljava/io/File;

    aput-object v6, v1, v4

    invoke-static {p1, v1}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/io/File;)I

    :cond_5
    :goto_2
    return-object v0
.end method
