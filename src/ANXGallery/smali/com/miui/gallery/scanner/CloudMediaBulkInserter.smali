.class public Lcom/miui/gallery/scanner/CloudMediaBulkInserter;
.super Lcom/miui/gallery/scanner/MediaBulkInserter;
.source "CloudMediaBulkInserter.java"


# static fields
.field private static final PROJECTION:[Ljava/lang/String;


# instance fields
.field private mWhereArgs:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mWhereClause:Ljava/lang/StringBuilder;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const-string v0, "_id"

    const-string v1, "localGroupId"

    const-string v2, "localFile"

    const-string v3, "dateModified"

    filled-new-array {v0, v1, v2, v3}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/scanner/CloudMediaBulkInserter;->PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 2

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "URI_PARAM_REQUEST_SYNC"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/scanner/MediaBulkInserter;-><init>(Landroid/net/Uri;)V

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/scanner/CloudMediaBulkInserter;->mWhereClause:Ljava/lang/StringBuilder;

    new-instance p1, Ljava/util/ArrayList;

    iget v0, p0, Lcom/miui/gallery/scanner/CloudMediaBulkInserter;->mBulkCount:I

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p1, p0, Lcom/miui/gallery/scanner/CloudMediaBulkInserter;->mWhereArgs:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public flush(Landroid/content/Context;)V
    .locals 18

    move-object/from16 v1, p0

    invoke-super/range {p0 .. p1}, Lcom/miui/gallery/scanner/MediaBulkInserter;->flush(Landroid/content/Context;)V

    iget-object v0, v1, Lcom/miui/gallery/scanner/CloudMediaBulkInserter;->mWhereArgs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_2

    new-array v0, v0, [Ljava/lang/String;

    iget-object v2, v1, Lcom/miui/gallery/scanner/CloudMediaBulkInserter;->mWhereArgs:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, [Ljava/lang/String;

    const/4 v8, 0x0

    const/4 v9, 0x0

    :try_start_0
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sget-object v3, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    sget-object v4, Lcom/miui/gallery/scanner/CloudMediaBulkInserter;->PROJECTION:[Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "localFile IN ("

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, v1, Lcom/miui/gallery/scanner/CloudMediaBulkInserter;->mWhereClause:Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ")"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v7, "dateModified DESC "

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v2, :cond_1

    :try_start_1
    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-lez v0, :cond_1

    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v0

    new-array v0, v0, [Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$RecentMediaEntry;

    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    const/4 v3, 0x0

    :goto_0
    invoke-interface {v2}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v4

    if-nez v4, :cond_0

    new-instance v4, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$RecentMediaEntry;

    const/4 v5, 0x1

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v11

    invoke-interface {v2, v9}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v13

    const/4 v5, 0x2

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    const/4 v5, 0x3

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v16

    move-object v10, v4

    invoke-direct/range {v10 .. v17}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$RecentMediaEntry;-><init>(JJLjava/lang/String;J)V

    aput-object v4, v0, v3

    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    move-object/from16 v3, p1

    invoke-static {v3, v0}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->insertToRecent(Landroid/content/Context;[Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$RecentMediaEntry;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    move-object v8, v2

    goto :goto_4

    :catch_0
    move-exception v0

    move-object v8, v2

    goto :goto_2

    :cond_1
    :goto_1
    invoke-static {v2}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    goto :goto_3

    :catchall_1
    move-exception v0

    goto :goto_4

    :catch_1
    move-exception v0

    :goto_2
    :try_start_2
    const-string v2, "CloudMediaBulkInserter"

    invoke-static {v2, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    invoke-static {v8}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    :goto_3
    iget-object v0, v1, Lcom/miui/gallery/scanner/CloudMediaBulkInserter;->mWhereClause:Ljava/lang/StringBuilder;

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->setLength(I)V

    iget-object v0, v1, Lcom/miui/gallery/scanner/CloudMediaBulkInserter;->mWhereArgs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    goto :goto_5

    :goto_4
    invoke-static {v8}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    throw v0

    :cond_2
    :goto_5
    return-void
.end method

.method public insert(Landroid/content/Context;Landroid/content/ContentValues;)V
    .locals 3

    if-eqz p2, :cond_1

    const-string v0, "localFile"

    invoke-virtual {p2, v0}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/scanner/CloudMediaBulkInserter;->mWhereClause:Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/scanner/CloudMediaBulkInserter;->mWhereClause:Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/scanner/CloudMediaBulkInserter;->mWhereClause:Ljava/lang/StringBuilder;

    const-string v2, "?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/scanner/CloudMediaBulkInserter;->mWhereArgs:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    invoke-super {p0, p1, p2}, Lcom/miui/gallery/scanner/MediaBulkInserter;->insert(Landroid/content/Context;Landroid/content/ContentValues;)V

    return-void
.end method
