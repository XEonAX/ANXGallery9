.class public Lcom/miui/gallery/cloud/baby/BabyAlbumUtils;
.super Ljava/lang/Object;
.source "BabyAlbumUtils.java"


# static fields
.field public static BABY_ALBUM_BIRTHDAY:Ljava/lang/String; = "birthday"

.field public static BABY_ALBUM_NAME:Ljava/lang/String; = "name"

.field public static BABY_AUTO_UPDATE:Ljava/lang/String; = "autoUpdate"

.field public static BABY_BABY:Ljava/lang/String; = "baby"

.field public static BABY_BABY_ALBUM_LOCAL_ID:Ljava/lang/String; = "babyAlbumLocalId"

.field public static BABY_FACE_ALBUM_LOCAL_ID:Ljava/lang/String; = "faceAlbumLocalId"

.field public static BABY_GENDER:Ljava/lang/String; = "gender"

.field public static BABY_MALE:Ljava/lang/String; = "male"

.field public static BABY_PEOPLE_ID:Ljava/lang/String; = "peopleId"

.field public static BABY_RELATION:Ljava/lang/String; = "relation"

.field public static BABY_RELATION_TEXT:Ljava/lang/String; = "relationText"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public static isBabyAlbumForThisServerId(Landroid/content/Context;Ljava/lang/String;Z)Z
    .locals 2

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-nez p2, :cond_0

    const-string p2, "serverId"

    invoke-static {p0, p2, p1, v1}, Lcom/miui/gallery/cloud/CloudUtils;->getGroupItemByColumnnameAndValue(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Lcom/miui/gallery/data/DBCloud;

    move-result-object p0

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBCloud;->getBabyInfoJson()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_1

    return v0

    :cond_0
    const-string p2, "serverId"

    invoke-static {p0, p2, p1}, Lcom/miui/gallery/cloud/CloudUtils;->getGroupItemByColumnnameAndValueFromShare(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/data/DBShareAlbum;

    move-result-object p0

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBShareAlbum;->getBabyInfoJson()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_1

    return v0

    :cond_1
    return v1
.end method

.method public static saveBabyInfo(Ljava/lang/String;Lcom/miui/gallery/cloud/baby/BabyInfo;Z)V
    .locals 0

    if-eqz p2, :cond_0

    invoke-static {p0, p1}, Lcom/miui/gallery/cloud/baby/BabyAlbumUtils;->saveShareAlbumBabyInfo(Ljava/lang/String;Lcom/miui/gallery/cloud/baby/BabyInfo;)V

    goto :goto_0

    :cond_0
    invoke-static {p0, p1}, Lcom/miui/gallery/cloud/baby/BabyAlbumUtils;->saveOwnerAlbumBabyInfo(Ljava/lang/String;Lcom/miui/gallery/cloud/baby/BabyInfo;)V

    :goto_0
    return-void
.end method

.method private static saveBabyInfoJson(Ljava/lang/String;Lcom/miui/gallery/cloud/baby/BabyInfo;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    invoke-static {p3}, Lcom/miui/gallery/cloud/GalleryCloudUtils;->transformToEditedColumnsElement(I)Ljava/lang/String;

    move-result-object p3

    const-string v0, "update %s set %s=%s, %s=\'%s\', %s=coalesce(replace(%s, \'%s\', \'\') || \'%s\', \'%s\') where %s=%s"

    const/16 v1, 0xc

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p7, v1, v2

    const/4 p7, 0x1

    aput-object p2, v1, p7

    if-nez p1, :cond_0

    const-string p2, ""

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lcom/miui/gallery/cloud/baby/BabyInfo;->toJSON()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/database/DatabaseUtils;->sqlEscapeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    :goto_0
    const/4 p7, 0x2

    aput-object p2, v1, p7

    const/4 p2, 0x3

    aput-object p4, v1, p2

    const/4 p2, 0x4

    if-nez p1, :cond_1

    const-string p1, ""

    goto :goto_1

    :cond_1
    iget-object p1, p1, Lcom/miui/gallery/cloud/baby/BabyInfo;->mPeopleId:Ljava/lang/String;

    :goto_1
    aput-object p1, v1, p2

    const/4 p1, 0x5

    aput-object p5, v1, p1

    const/4 p1, 0x6

    aput-object p5, v1, p1

    const/4 p1, 0x7

    aput-object p3, v1, p1

    const/16 p1, 0x8

    aput-object p3, v1, p1

    const/16 p1, 0x9

    aput-object p3, v1, p1

    const/16 p1, 0xa

    aput-object p6, v1, p1

    const/16 p1, 0xb

    aput-object p0, v1, p1

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/miui/gallery/util/GalleryUtils;->safeExec(Ljava/lang/String;)Z

    return-void
.end method

.method public static saveOwnerAlbumBabyInfo(Ljava/lang/String;Lcom/miui/gallery/cloud/baby/BabyInfo;)V
    .locals 8

    const-string v2, "babyInfoJson"

    const-string v4, "peopleId"

    const-string v5, "editedColumns"

    const-string v6, "_id"

    const-string v7, "cloud"

    const/16 v3, 0x3f

    move-object v0, p0

    move-object v1, p1

    invoke-static/range {v0 .. v7}, Lcom/miui/gallery/cloud/baby/BabyAlbumUtils;->saveBabyInfoJson(Ljava/lang/String;Lcom/miui/gallery/cloud/baby/BabyInfo;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static saveShareAlbumBabyInfo(Ljava/lang/String;Lcom/miui/gallery/cloud/baby/BabyInfo;)V
    .locals 8

    const-string v2, "babyInfoJson"

    const-string v4, "peopleId"

    const-string v5, "editedColumns"

    const-string v6, "_id"

    const-string v7, "shareAlbum"

    const/16 v3, 0x19

    move-object v0, p0

    move-object v1, p1

    invoke-static/range {v0 .. v7}, Lcom/miui/gallery/cloud/baby/BabyAlbumUtils;->saveBabyInfoJson(Ljava/lang/String;Lcom/miui/gallery/cloud/baby/BabyInfo;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
