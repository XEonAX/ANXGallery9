.class public Lcom/miui/gallery/scanner/MediaBulkInserter;
.super Ljava/lang/Object;
.source "MediaBulkInserter.java"


# instance fields
.field protected mBulkCount:I

.field private mUri:Landroid/net/Uri;

.field protected mValues:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/content/ContentValues;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/net/Uri;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x14

    iput v0, p0, Lcom/miui/gallery/scanner/MediaBulkInserter;->mBulkCount:I

    iput-object p1, p0, Lcom/miui/gallery/scanner/MediaBulkInserter;->mUri:Landroid/net/Uri;

    new-instance p1, Ljava/util/ArrayList;

    iget v0, p0, Lcom/miui/gallery/scanner/MediaBulkInserter;->mBulkCount:I

    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p1, p0, Lcom/miui/gallery/scanner/MediaBulkInserter;->mValues:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public flush(Landroid/content/Context;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/scanner/MediaBulkInserter;->mValues:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    new-array v0, v0, [Landroid/content/ContentValues;

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    iget-object v1, p0, Lcom/miui/gallery/scanner/MediaBulkInserter;->mUri:Landroid/net/Uri;

    iget-object v2, p0, Lcom/miui/gallery/scanner/MediaBulkInserter;->mValues:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/content/ContentValues;

    invoke-virtual {p1, v1, v0}, Landroid/content/ContentResolver;->bulkInsert(Landroid/net/Uri;[Landroid/content/ContentValues;)I

    iget-object p1, p0, Lcom/miui/gallery/scanner/MediaBulkInserter;->mValues:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    :cond_0
    return-void
.end method

.method public insert(Landroid/content/Context;Landroid/content/ContentValues;)V
    .locals 1

    if-eqz p2, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/scanner/MediaBulkInserter;->mValues:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p2, p0, Lcom/miui/gallery/scanner/MediaBulkInserter;->mValues:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    iget v0, p0, Lcom/miui/gallery/scanner/MediaBulkInserter;->mBulkCount:I

    if-lt p2, v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/scanner/MediaBulkInserter;->flush(Landroid/content/Context;)V

    :cond_0
    return-void
.end method
