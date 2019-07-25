.class Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddRemoveFavoritesById;
.super Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddRemoveFavoritesBySha1;
.source "CloudManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/cloudmanager/CloudManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AddRemoveFavoritesById"
.end annotation


# instance fields
.field private mId:J


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/ArrayList;IJ)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;IJ)V"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddRemoveFavoritesBySha1;-><init>(Landroid/content/Context;Ljava/util/ArrayList;ILjava/lang/String;)V

    iput-wide p4, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddRemoveFavoritesById;->mId:J

    return-void
.end method


# virtual methods
.method protected prepare(Landroid/database/sqlite/SQLiteDatabase;)Landroid/database/Cursor;
    .locals 9

    const/4 v0, 0x0

    :try_start_0
    const-string v2, "cloud"

    sget-object v3, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->PROJECTION:[Ljava/lang/String;

    const-string v4, "_id=?"

    const/4 v1, 0x1

    new-array v5, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    iget-wide v6, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddRemoveFavoritesById;->mId:J

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v1

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v1, p1

    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v1, :cond_0

    :try_start_1
    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_0

    const/16 v2, 0x9

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddRemoveFavoritesById;->mSha1:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    invoke-super {p0, p1}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddRemoveFavoritesBySha1;->prepare(Landroid/database/sqlite/SQLiteDatabase;)Landroid/database/Cursor;

    move-result-object p1

    return-object p1

    :catchall_0
    move-exception p1

    move-object v0, v1

    goto :goto_0

    :cond_0
    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return-object v0

    :catchall_1
    move-exception p1

    :goto_0
    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    throw p1

    :catch_0
    move-object v1, v0

    :catch_1
    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 7

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%s favorites by id: [%d]"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    iget v3, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddRemoveFavoritesById;->mOperationType:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    const-string v3, "Add to"

    goto :goto_0

    :cond_0
    const-string v3, "Remove from"

    :goto_0
    const/4 v5, 0x0

    aput-object v3, v2, v5

    iget-wide v5, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddRemoveFavoritesById;->mId:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
