.class public Lcom/miui/gallery/cloud/CloudTableUtils;
.super Ljava/lang/Object;
.source "CloudTableUtils.java"


# static fields
.field public static final IS_VALID_GROUP:Ljava/lang/String;

.field private static final sIdsForGroupWithoutRecord:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public static final sItemIsNotGroup:Ljava/lang/String;

.field public static sPhotoLocalFlag_Create_ForceCreate_Move_Copy:Ljava/lang/String;

.field public static final sPhotoLocalFlag_Synced:Ljava/lang/String;

.field private static final sSystemAlbumGroupIds:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 15

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "(%s = %d AND %s = \"%s\")"

    const/4 v2, 0x4

    new-array v3, v2, [Ljava/lang/Object;

    const-string v4, "localFlag"

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v6, 0x1

    aput-object v4, v3, v6

    const-string v4, "serverStatus"

    const/4 v7, 0x2

    aput-object v4, v3, v7

    const-string v4, "custom"

    const/4 v8, 0x3

    aput-object v4, v3, v8

    invoke-static {v0, v1, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/cloud/CloudTableUtils;->sPhotoLocalFlag_Synced:Ljava/lang/String;

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "(%s = %d OR %s = %d OR %s = %d OR %s = %d)"

    const/16 v3, 0x8

    new-array v4, v3, [Ljava/lang/Object;

    const-string v9, "localFlag"

    aput-object v9, v4, v5

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v4, v6

    const-string v9, "localFlag"

    aput-object v9, v4, v7

    const/4 v9, 0x5

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v4, v8

    const-string v10, "localFlag"

    aput-object v10, v4, v2

    const/4 v10, 0x6

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v4, v9

    const-string v11, "localFlag"

    aput-object v11, v4, v10

    const/16 v11, 0x9

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const/4 v13, 0x7

    aput-object v12, v4, v13

    invoke-static {v0, v1, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/cloud/CloudTableUtils;->sPhotoLocalFlag_Create_ForceCreate_Move_Copy:Ljava/lang/String;

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "(%s = %d OR %s = %d)"

    new-array v4, v2, [Ljava/lang/Object;

    const-string v12, "serverType"

    aput-object v12, v4, v5

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v4, v6

    const-string v12, "serverType"

    aput-object v12, v4, v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v4, v8

    invoke-static {v0, v1, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/cloud/CloudTableUtils;->sItemIsNotGroup:Ljava/lang/String;

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "(%s = %d AND (%s = %d OR %s = %d OR (%s = %d AND %s = \"%s\")))"

    const/16 v4, 0xa

    new-array v12, v4, [Ljava/lang/Object;

    const-string v14, "serverType"

    aput-object v14, v12, v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v12, v6

    const-string v6, "localFlag"

    aput-object v6, v12, v7

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v12, v8

    const-string v6, "localFlag"

    aput-object v6, v12, v2

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v12, v9

    const-string v2, "localFlag"

    aput-object v2, v12, v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v12, v13

    const-string v2, "serverStatus"

    aput-object v2, v12, v3

    const-string v2, "custom"

    aput-object v2, v12, v11

    invoke-static {v0, v1, v12}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/cloud/CloudTableUtils;->IS_VALID_GROUP:Ljava/lang/String;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/miui/gallery/cloud/CloudTableUtils;->sSystemAlbumGroupIds:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/miui/gallery/cloud/CloudTableUtils;->sIdsForGroupWithoutRecord:Ljava/util/ArrayList;

    sget-object v0, Lcom/miui/gallery/cloud/CloudTableUtils;->sSystemAlbumGroupIds:Ljava/util/ArrayList;

    const-wide/16 v1, 0x1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/cloud/CloudTableUtils;->sSystemAlbumGroupIds:Ljava/util/ArrayList;

    const-wide/16 v1, 0x2

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/cloud/CloudTableUtils;->sSystemAlbumGroupIds:Ljava/util/ArrayList;

    const-wide/16 v1, 0x3

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/cloud/CloudTableUtils;->sSystemAlbumGroupIds:Ljava/util/ArrayList;

    const-wide/16 v3, 0x4

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/cloud/CloudTableUtils;->sSystemAlbumGroupIds:Ljava/util/ArrayList;

    const-wide/16 v5, 0x3e8

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/cloud/CloudTableUtils;->sSystemAlbumGroupIds:Ljava/util/ArrayList;

    const-wide/16 v7, 0x3e9

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/cloud/CloudTableUtils;->sIdsForGroupWithoutRecord:Ljava/util/ArrayList;

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/cloud/CloudTableUtils;->sIdsForGroupWithoutRecord:Ljava/util/ArrayList;

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/cloud/CloudTableUtils;->sIdsForGroupWithoutRecord:Ljava/util/ArrayList;

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/cloud/CloudTableUtils;->sIdsForGroupWithoutRecord:Ljava/util/ArrayList;

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static getCloudIdForGroupWithoutRecord(J)J
    .locals 2

    invoke-static {p0, p1}, Lcom/miui/gallery/cloud/CloudTableUtils;->isGroupWithoutRecord(J)Z

    move-result v0

    if-eqz v0, :cond_0

    const-wide/16 v0, -0x1

    mul-long p0, p0, v0

    return-wide p0

    :cond_0
    const-wide/16 p0, 0x0

    return-wide p0
.end method

.method public static getServerIdForGroupWithoutRecord(J)J
    .locals 2

    invoke-static {p0, p1}, Lcom/miui/gallery/cloud/CloudTableUtils;->isGroupWithoutRecordByCloudId(J)Z

    move-result v0

    if-eqz v0, :cond_0

    const-wide/16 v0, -0x1

    mul-long p0, p0, v0

    return-wide p0

    :cond_0
    const-wide/16 p0, 0x0

    return-wide p0
.end method

.method public static isCameraGroup(Ljava/lang/String;)Z
    .locals 2

    const-wide/16 v0, 0x1

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static final isGroupWithoutRecord(J)Z
    .locals 1

    sget-object v0, Lcom/miui/gallery/cloud/CloudTableUtils;->sIdsForGroupWithoutRecord:Ljava/util/ArrayList;

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static final isGroupWithoutRecordByCloudId(J)Z
    .locals 3

    sget-object v0, Lcom/miui/gallery/cloud/CloudTableUtils;->sIdsForGroupWithoutRecord:Ljava/util/ArrayList;

    const-wide/16 v1, -0x1

    mul-long p0, p0, v1

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static isScreenshotGroup(Ljava/lang/String;)Z
    .locals 2

    const-wide/16 v0, 0x2

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static isSecretAlbum(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide p0

    goto :goto_0

    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_1

    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide p0

    invoke-static {p0, p1}, Lcom/miui/gallery/cloud/CloudTableUtils;->getServerIdForGroupWithoutRecord(J)J

    move-result-wide p0

    goto :goto_0

    :cond_1
    const-wide/16 p0, 0x0

    :goto_0
    const-wide/16 v0, 0x3e8

    cmp-long v2, p0, v0

    if-nez v2, :cond_2

    const/4 p0, 0x1

    goto :goto_1

    :cond_2
    const/4 p0, 0x0

    :goto_1
    return p0
.end method

.method public static isSystemAlbum(J)Z
    .locals 1

    sget-object v0, Lcom/miui/gallery/cloud/CloudTableUtils;->sSystemAlbumGroupIds:Ljava/util/ArrayList;

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static sGetWhereClauseAll(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    .locals 13

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "(%d = %d OR %d = %d)"

    const/4 v2, 0x4

    new-array v3, v2, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v6, 0x1

    aput-object v5, v3, v6

    const/16 v5, 0xa

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const/4 v8, 0x2

    aput-object v7, v3, v8

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const/4 v9, 0x3

    aput-object v7, v3, v9

    invoke-static {v0, v1, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "(%d = %d OR %d = %d OR %d = %d)"

    const/4 v7, 0x6

    new-array v10, v7, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v10, v4

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v10, v6

    const/16 v11, 0x8

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v8

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v10, v9

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v10, v2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    const/4 v5, 0x5

    aput-object p2, v10, v5

    invoke-static {v1, v3, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "( (%s) AND ((%s AND (+%s = %s AND %s)) OR (%s AND (%s = %s AND %s))) )"

    const/16 v10, 0x9

    new-array v10, v10, [Ljava/lang/Object;

    sget-object v12, Lcom/miui/gallery/cloud/CloudTableUtils;->sItemIsNotGroup:Ljava/lang/String;

    aput-object v12, v10, v4

    sget-object v4, Lcom/miui/gallery/cloud/CloudTableUtils;->sPhotoLocalFlag_Synced:Ljava/lang/String;

    aput-object v4, v10, v6

    const-string v4, "groupId"

    aput-object v4, v10, v8

    aput-object p1, v10, v9

    aput-object v0, v10, v2

    sget-object p1, Lcom/miui/gallery/cloud/CloudTableUtils;->sPhotoLocalFlag_Create_ForceCreate_Move_Copy:Ljava/lang/String;

    aput-object p1, v10, v5

    const-string p1, "localGroupId"

    aput-object p1, v10, v7

    const/4 p1, 0x7

    aput-object p0, v10, p1

    aput-object p2, v10, v11

    invoke-static {v1, v3, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
