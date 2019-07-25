.class public Lcom/miui/gallery/loader/CloudSetLoader;
.super Lcom/miui/gallery/loader/CursorSetLoader;
.source "CloudSetLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/loader/CloudSetLoader$UnfoldBurstCloudDataSet;,
        Lcom/miui/gallery/loader/CloudSetLoader$CloudDataSet;
    }
.end annotation


# instance fields
.field protected mAlbumId:J

.field protected mAlbumName:Ljava/lang/String;

.field protected mInitPos:I

.field protected mOrderBy:Ljava/lang/String;

.field protected mSelection:Ljava/lang/String;

.field protected mSelectionArgs:[Ljava/lang/String;

.field protected mUnfoldBurst:Z

.field protected mUri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/net/Uri;Landroid/os/Bundle;)V
    .locals 3

    invoke-direct {p0, p1}, Lcom/miui/gallery/loader/CursorSetLoader;-><init>(Landroid/content/Context;)V

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/miui/gallery/loader/CloudSetLoader;->mAlbumId:J

    iput-object p2, p0, Lcom/miui/gallery/loader/CloudSetLoader;->mUri:Landroid/net/Uri;

    if-eqz p3, :cond_0

    const-string p1, "photo_init_position"

    const/4 p2, 0x0

    invoke-virtual {p3, p1, p2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/loader/CloudSetLoader;->mInitPos:I

    const-string p1, "photo_selection"

    const/4 v2, 0x0

    invoke-virtual {p3, p1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/loader/CloudSetLoader;->mSelection:Ljava/lang/String;

    const-string p1, "photo_selection_args"

    invoke-virtual {p3, p1}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/loader/CloudSetLoader;->mSelectionArgs:[Ljava/lang/String;

    const-string p1, "photo_order_by"

    invoke-virtual {p3, p1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/loader/CloudSetLoader;->mOrderBy:Ljava/lang/String;

    const-string p1, "album_name"

    invoke-virtual {p3, p1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/loader/CloudSetLoader;->mAlbumName:Ljava/lang/String;

    const-string p1, "album_id"

    invoke-virtual {p3, p1, v0, v1}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/loader/CloudSetLoader;->mAlbumId:J

    const-string p1, "unford_burst"

    invoke-virtual {p3, p1, p2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, p0, Lcom/miui/gallery/loader/CloudSetLoader;->mUnfoldBurst:Z

    :cond_0
    return-void
.end method

.method private static isStoryAlbum(J)Z
    .locals 3

    const-wide/32 v0, 0x7ffffff8

    cmp-long v2, p0, v0

    if-nez v2, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static isVirtualAlbum(J)Z
    .locals 3

    const-wide/32 v0, 0x7fffffff

    cmp-long v2, p0, v0

    if-eqz v2, :cond_1

    const-wide/32 v0, 0x7ffffffd

    cmp-long v2, p0, v0

    if-eqz v2, :cond_1

    const-wide/32 v0, 0x7ffffffa

    cmp-long v2, p0, v0

    if-nez v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method


# virtual methods
.method protected getOperationDupType()I
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/loader/CloudSetLoader;->mUri:Landroid/net/Uri;

    const-string v1, "remove_duplicate_items"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_3

    iget-wide v0, p0, Lcom/miui/gallery/loader/CloudSetLoader;->mAlbumId:J

    invoke-static {v0, v1}, Lcom/miui/gallery/loader/CloudSetLoader;->isVirtualAlbum(J)Z

    move-result v0

    if-nez v0, :cond_2

    iget-wide v0, p0, Lcom/miui/gallery/loader/CloudSetLoader;->mAlbumId:J

    invoke-static {v0, v1}, Lcom/miui/gallery/loader/CloudSetLoader;->isStoryAlbum(J)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-wide v0, p0, Lcom/miui/gallery/loader/CloudSetLoader;->mAlbumId:J

    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-eqz v4, :cond_1

    const/4 v0, 0x2

    return v0

    :cond_1
    const/4 v0, 0x1

    return v0

    :cond_2
    :goto_0
    const/4 v0, 0x3

    return v0

    :cond_3
    return v2
.end method

.method protected getOrder()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/loader/CloudSetLoader;->mOrderBy:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "alias_create_time DESC "

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/loader/CloudSetLoader;->mOrderBy:Ljava/lang/String;

    :goto_0
    return-object v0
.end method

.method protected getProjection()[Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/miui/gallery/util/MediaCursorHelper;->PROJECTION:[Ljava/lang/String;

    return-object v0
.end method

.method protected getSelection()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/loader/CloudSetLoader;->mSelection:Ljava/lang/String;

    return-object v0
.end method

.method protected getSelectionArgs()[Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/loader/CloudSetLoader;->mSelectionArgs:[Ljava/lang/String;

    return-object v0
.end method

.method public getTAG()Ljava/lang/String;
    .locals 1

    const-string v0, "CloudSetLoader"

    return-object v0
.end method

.method protected getUri()Landroid/net/Uri;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/loader/CloudSetLoader;->mUri:Landroid/net/Uri;

    if-nez v0, :cond_0

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Media;->URI:Landroid/net/Uri;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/loader/CloudSetLoader;->mUri:Landroid/net/Uri;

    :goto_0
    return-object v0
.end method

.method protected wrapDataSet(Landroid/database/Cursor;)Lcom/miui/gallery/model/CursorDataSet;
    .locals 16

    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/miui/gallery/loader/CloudSetLoader;->mUnfoldBurst:Z

    if-eqz v1, :cond_0

    new-instance v1, Lcom/miui/gallery/loader/CloudSetLoader$UnfoldBurstCloudDataSet;

    iget v4, v0, Lcom/miui/gallery/loader/CloudSetLoader;->mInitPos:I

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/loader/CloudSetLoader;->getOperationDupType()I

    move-result v5

    iget-wide v6, v0, Lcom/miui/gallery/loader/CloudSetLoader;->mAlbumId:J

    iget-object v8, v0, Lcom/miui/gallery/loader/CloudSetLoader;->mAlbumName:Ljava/lang/String;

    move-object v2, v1

    move-object/from16 v3, p1

    invoke-direct/range {v2 .. v8}, Lcom/miui/gallery/loader/CloudSetLoader$UnfoldBurstCloudDataSet;-><init>(Landroid/database/Cursor;IIJLjava/lang/String;)V

    goto :goto_0

    :cond_0
    new-instance v1, Lcom/miui/gallery/loader/CloudSetLoader$CloudDataSet;

    iget v11, v0, Lcom/miui/gallery/loader/CloudSetLoader;->mInitPos:I

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/loader/CloudSetLoader;->getOperationDupType()I

    move-result v12

    iget-wide v13, v0, Lcom/miui/gallery/loader/CloudSetLoader;->mAlbumId:J

    iget-object v15, v0, Lcom/miui/gallery/loader/CloudSetLoader;->mAlbumName:Ljava/lang/String;

    move-object v9, v1

    move-object/from16 v10, p1

    invoke-direct/range {v9 .. v15}, Lcom/miui/gallery/loader/CloudSetLoader$CloudDataSet;-><init>(Landroid/database/Cursor;IIJLjava/lang/String;)V

    :goto_0
    return-object v1
.end method
