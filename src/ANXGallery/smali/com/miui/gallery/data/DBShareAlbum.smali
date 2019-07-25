.class public Lcom/miui/gallery/data/DBShareAlbum;
.super Ljava/lang/Object;
.source "DBShareAlbum.java"

# interfaces
.implements Lcom/miui/gallery/data/DBItem;


# instance fields
.field private albumId:Ljava/lang/String;

.field private albumStatus:Ljava/lang/String;

.field private babyInfoJson:Ljava/lang/String;

.field private canModified:I

.field private creatorId:Ljava/lang/String;

.field private dateModified:J

.field private datetaken:J

.field private description:Ljava/lang/String;

.field private editedColumns:Ljava/lang/String;

.field private fileName:Ljava/lang/String;

.field private groupId:J

.field private id:Ljava/lang/String;

.field private isPublic:Z

.field private localFlag:I

.field private peopleId:Ljava/lang/String;

.field private publicUrl:Ljava/lang/String;

.field private serverId:Ljava/lang/String;

.field private serverStatus:Ljava/lang/String;

.field private serverTag:J

.field private serverType:I

.field private shareUrl:Ljava/lang/String;

.field private shareUrlLong:Ljava/lang/String;

.field private sharerInfo:Ljava/lang/String;

.field private sortBy:I


# direct methods
.method public constructor <init>(Landroid/database/Cursor;)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/miui/gallery/provider/GalleryDBHelper;->getCursorString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/data/DBShareAlbum;->id:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/miui/gallery/data/DBShareAlbum;->groupId:J

    const/4 v2, 0x2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/miui/gallery/data/DBShareAlbum;->dateModified:J

    const/4 v2, 0x3

    invoke-static {p1, v2}, Lcom/miui/gallery/provider/GalleryDBHelper;->getCursorString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/miui/gallery/data/DBShareAlbum;->description:Ljava/lang/String;

    const/4 v2, 0x4

    invoke-static {p1, v2}, Lcom/miui/gallery/provider/GalleryDBHelper;->getCursorString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/miui/gallery/data/DBShareAlbum;->fileName:Ljava/lang/String;

    const/4 v2, 0x5

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/miui/gallery/data/DBShareAlbum;->datetaken:J

    const/4 v2, 0x6

    invoke-static {p1, v2}, Lcom/miui/gallery/provider/GalleryDBHelper;->getCursorString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/miui/gallery/data/DBShareAlbum;->serverId:Ljava/lang/String;

    const/4 v2, 0x7

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    iput v2, p0, Lcom/miui/gallery/data/DBShareAlbum;->serverType:I

    const/16 v2, 0x8

    invoke-static {p1, v2}, Lcom/miui/gallery/provider/GalleryDBHelper;->getCursorString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/miui/gallery/data/DBShareAlbum;->serverStatus:Ljava/lang/String;

    const/16 v2, 0x9

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/miui/gallery/data/DBShareAlbum;->serverTag:J

    const/16 v2, 0xa

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    iput v2, p0, Lcom/miui/gallery/data/DBShareAlbum;->localFlag:I

    const/16 v2, 0xb

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    iput v2, p0, Lcom/miui/gallery/data/DBShareAlbum;->sortBy:I

    const/16 v2, 0xc

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    iput v2, p0, Lcom/miui/gallery/data/DBShareAlbum;->canModified:I

    const/16 v2, 0xd

    invoke-static {p1, v2}, Lcom/miui/gallery/provider/GalleryDBHelper;->getCursorString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/miui/gallery/data/DBShareAlbum;->albumId:Ljava/lang/String;

    const/16 v2, 0xe

    invoke-static {p1, v2}, Lcom/miui/gallery/provider/GalleryDBHelper;->getCursorString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/miui/gallery/data/DBShareAlbum;->creatorId:Ljava/lang/String;

    const/16 v2, 0xf

    invoke-static {p1, v2}, Lcom/miui/gallery/provider/GalleryDBHelper;->getCursorString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/miui/gallery/data/DBShareAlbum;->shareUrl:Ljava/lang/String;

    const/16 v2, 0x16

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    if-ne v2, v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    iput-boolean v0, p0, Lcom/miui/gallery/data/DBShareAlbum;->isPublic:Z

    const/16 v0, 0x17

    invoke-static {p1, v0}, Lcom/miui/gallery/provider/GalleryDBHelper;->getCursorString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/data/DBShareAlbum;->publicUrl:Ljava/lang/String;

    const/16 v0, 0x1a

    invoke-static {p1, v0}, Lcom/miui/gallery/provider/GalleryDBHelper;->getCursorString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/data/DBShareAlbum;->peopleId:Ljava/lang/String;

    const/16 v0, 0x19

    invoke-static {p1, v0}, Lcom/miui/gallery/provider/GalleryDBHelper;->getCursorString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/data/DBShareAlbum;->babyInfoJson:Ljava/lang/String;

    const/16 v0, 0x1c

    invoke-static {p1, v0}, Lcom/miui/gallery/provider/GalleryDBHelper;->getCursorString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/data/DBShareAlbum;->editedColumns:Ljava/lang/String;

    const/16 v0, 0x1b

    invoke-static {p1, v0}, Lcom/miui/gallery/provider/GalleryDBHelper;->getCursorString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/data/DBShareAlbum;->sharerInfo:Ljava/lang/String;

    const/16 v0, 0x10

    invoke-static {p1, v0}, Lcom/miui/gallery/provider/GalleryDBHelper;->getCursorString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/data/DBShareAlbum;->albumStatus:Ljava/lang/String;

    const/16 v0, 0x14

    invoke-static {p1, v0}, Lcom/miui/gallery/provider/GalleryDBHelper;->getCursorString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/data/DBShareAlbum;->shareUrlLong:Ljava/lang/String;

    return-void
.end method

.method public static getContentValue(Lorg/json/JSONObject;Lcom/miui/gallery/data/DBShareAlbum;)Landroid/content/ContentValues;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "albumId"

    const-string v2, "sharedId"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "status"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "albumStatus"

    const-string v2, "status"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    const-string v1, "albumTag"

    const-string v2, "tag"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "creatorId"

    const-string v2, "creatorId"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "content"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    const-string v1, "serverId"

    const-string v2, "id"

    invoke-static {p0, v2}, Lcom/miui/gallery/cloud/CloudUtils;->getLongAttributeFromJson(Lorg/json/JSONObject;Ljava/lang/String;)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v1, "serverStatus"

    const-string v2, "status"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "serverTag"

    const-string v2, "tag"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "serverType"

    const-string v2, "type"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "fileName"

    const-string v2, "fileName"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "dateModified"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "dateModified"

    const-string v2, "dateModified"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    const-string v1, "isPublic"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    const-string v1, "isPublic"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "isPublic"

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v1, "publicUrl"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    const-string v1, "publicUrl"

    const-string v3, "publicUrl"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    const-string v1, "isPublic"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v1, "publicUrl"

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    :cond_3
    :goto_0
    const-string v1, "renderInfos"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    const-string v1, "renderInfos"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    if-eqz v1, :cond_6

    :goto_1
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v2, v3, :cond_6

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "type"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5

    const-string v4, "type"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lcom/miui/gallery/cloud/baby/BabyAlbumUtils;->BABY_BABY:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz p1, :cond_4

    invoke-static {v1}, Lcom/miui/gallery/cloud/baby/BabyInfo;->fromJSON(Ljava/lang/String;)Lcom/miui/gallery/cloud/baby/BabyInfo;

    move-result-object v3

    iget-object v4, p1, Lcom/miui/gallery/data/DBShareAlbum;->babyInfoJson:Ljava/lang/String;

    invoke-static {v4}, Lcom/miui/gallery/cloud/baby/BabyInfo;->fromJSON(Ljava/lang/String;)Lcom/miui/gallery/cloud/baby/BabyInfo;

    move-result-object v4

    if-eqz v3, :cond_4

    if-eqz v4, :cond_4

    iget-object v2, p1, Lcom/miui/gallery/data/DBShareAlbum;->peopleId:Ljava/lang/String;

    iget-object p1, p1, Lcom/miui/gallery/data/DBShareAlbum;->peopleId:Ljava/lang/String;

    iput-object p1, v3, Lcom/miui/gallery/cloud/baby/BabyInfo;->mPeopleId:Ljava/lang/String;

    iget-boolean p1, v4, Lcom/miui/gallery/cloud/baby/BabyInfo;->mAutoupdate:Z

    iput-boolean p1, v3, Lcom/miui/gallery/cloud/baby/BabyInfo;->mAutoupdate:Z

    invoke-virtual {v3}, Lcom/miui/gallery/cloud/baby/BabyInfo;->toJSON()Ljava/lang/String;

    move-result-object v1

    :cond_4
    const-string p1, "babyInfoJson"

    invoke-virtual {v0, p1, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "peopleId"

    invoke-virtual {v0, p1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_6
    :goto_2
    const-string p1, "dateTaken"

    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_8

    const-string p1, "babyInfoJson"

    invoke-virtual {v0, p1}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_7

    const-string p0, "dateTaken"

    const-wide/16 v1, -0x3e4

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    goto :goto_3

    :cond_7
    const-string p1, "dateTaken"

    const-string v1, "dateTaken"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p1, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_8
    :goto_3
    return-object v0
.end method

.method public static isNormalStatus(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1

    const-string v0, "normal"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "custom"

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method


# virtual methods
.method public getAlbumId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/data/DBShareAlbum;->albumId:Ljava/lang/String;

    return-object v0
.end method

.method public getAlbumStatus()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/data/DBShareAlbum;->albumStatus:Ljava/lang/String;

    return-object v0
.end method

.method public getBabyInfoJson()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/data/DBShareAlbum;->babyInfoJson:Ljava/lang/String;

    return-object v0
.end method

.method public getCreatorId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/data/DBShareAlbum;->creatorId:Ljava/lang/String;

    return-object v0
.end method

.method public getEditedColumns()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/data/DBShareAlbum;->editedColumns:Ljava/lang/String;

    return-object v0
.end method

.method public getFileName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/data/DBShareAlbum;->fileName:Ljava/lang/String;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/data/DBShareAlbum;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getIsPublic()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/data/DBShareAlbum;->isPublic:Z

    return v0
.end method

.method public getLocalFlag()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/data/DBShareAlbum;->localFlag:I

    return v0
.end method

.method public getPeopleId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/data/DBShareAlbum;->peopleId:Ljava/lang/String;

    return-object v0
.end method

.method public getPublicUri()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/data/DBShareAlbum;->publicUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getServerTag()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/data/DBShareAlbum;->serverTag:J

    return-wide v0
.end method

.method public getShareUrl()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/data/DBShareAlbum;->shareUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getShareUrlLong()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/data/DBShareAlbum;->shareUrlLong:Ljava/lang/String;

    return-object v0
.end method

.method public getSharerInfo()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/data/DBShareAlbum;->sharerInfo:Ljava/lang/String;

    return-object v0
.end method
