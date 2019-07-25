.class Lcom/miui/gallery/provider/cloudmanager/AlbumFileHandleJob;
.super Ljava/lang/Object;
.source "AlbumFileHandleJob.java"


# instance fields
.field private mId:Ljava/lang/String;

.field private mLocalFlag:I

.field private mRelativeDir:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/provider/cloudmanager/AlbumFileHandleJob;->mId:Ljava/lang/String;

    iput-object p2, p0, Lcom/miui/gallery/provider/cloudmanager/AlbumFileHandleJob;->mRelativeDir:Ljava/lang/String;

    iput p3, p0, Lcom/miui/gallery/provider/cloudmanager/AlbumFileHandleJob;->mLocalFlag:I

    return-void
.end method

.method public static from(Landroid/database/Cursor;)Lcom/miui/gallery/provider/cloudmanager/AlbumFileHandleJob;
    .locals 3

    const/4 v0, 0x0

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x7

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x6

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/cloud/DownloadPathHelper;->getFolderRelativePathInCloud(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :cond_0
    const/4 v2, 0x2

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result p0

    new-instance v2, Lcom/miui/gallery/provider/cloudmanager/AlbumFileHandleJob;

    invoke-direct {v2, v0, v1, p0}, Lcom/miui/gallery/provider/cloudmanager/AlbumFileHandleJob;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    return-object v2
.end method


# virtual methods
.method public run(Landroid/content/Context;)Z
    .locals 5

    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/AlbumFileHandleJob;->mRelativeDir:Ljava/lang/String;

    invoke-static {v1}, Lcom/miui/gallery/util/StorageUtils;->getSafePathInPriorStorage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lcom/miui/gallery/provider/cloudmanager/AlbumFileHandleJob;->mLocalFlag:I

    const/4 v2, -0x1

    const/4 v3, 0x0

    if-eq v1, v2, :cond_2

    const/4 p1, 0x2

    if-eq v1, p1, :cond_1

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    const-string p1, "CloudManager.AlbumFileHandleJob"

    const-string v1, "make folder: %s"

    invoke-static {p1, v1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p1

    if-nez p1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result p1

    const-string v0, "CloudManager.AlbumFileHandleJob"

    const-string v1, "folder maked: %b"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    const-string p1, "CloudManager.AlbumFileHandleJob"

    const-string v0, "folder exist, skip."

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    const-string p1, "CloudManager.AlbumFileHandleJob"

    const-string v0, "cloud deletion, skip folder, db\'s deletion already done"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    const-string v0, "CloudManager.AlbumFileHandleJob"

    const-string v1, "local deletion, just delete from db"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    const-string v1, "_id=?"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    iget-object v4, p0, Lcom/miui/gallery/provider/cloudmanager/AlbumFileHandleJob;->mId:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-virtual {p1, v0, v1, v2}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    :goto_0
    return v3

    nop

    :pswitch_data_0
    .packed-switch 0x7
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
