.class public Lcom/miui/gallery/scanner/MediaBulkDeleter;
.super Ljava/lang/Object;
.source "MediaBulkDeleter.java"


# static fields
.field private static BULK_MAX:I = 0x64


# instance fields
.field private mColumnName:Ljava/lang/String;

.field private mUri:Landroid/net/Uri;

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
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/net/Uri;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/scanner/MediaBulkDeleter;->mUri:Landroid/net/Uri;

    iput-object p2, p0, Lcom/miui/gallery/scanner/MediaBulkDeleter;->mColumnName:Ljava/lang/String;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/scanner/MediaBulkDeleter;->mWhereClause:Ljava/lang/StringBuilder;

    new-instance p1, Ljava/util/ArrayList;

    sget p2, Lcom/miui/gallery/scanner/MediaBulkDeleter;->BULK_MAX:I

    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p1, p0, Lcom/miui/gallery/scanner/MediaBulkDeleter;->mWhereArgs:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public delete(Landroid/content/Context;J)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/scanner/MediaBulkDeleter;->mWhereClause:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/scanner/MediaBulkDeleter;->mWhereClause:Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/scanner/MediaBulkDeleter;->mWhereClause:Ljava/lang/StringBuilder;

    const-string v1, "?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/miui/gallery/scanner/MediaBulkDeleter;->mWhereArgs:Ljava/util/ArrayList;

    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p2, p0, Lcom/miui/gallery/scanner/MediaBulkDeleter;->mWhereArgs:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    sget p3, Lcom/miui/gallery/scanner/MediaBulkDeleter;->BULK_MAX:I

    if-le p2, p3, :cond_1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/scanner/MediaBulkDeleter;->flush(Landroid/content/Context;)V

    :cond_1
    return-void
.end method

.method public flush(Landroid/content/Context;)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/scanner/MediaBulkDeleter;->mWhereArgs:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    new-array v0, v0, [Ljava/lang/String;

    iget-object v1, p0, Lcom/miui/gallery/scanner/MediaBulkDeleter;->mWhereArgs:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    iget-object v1, p0, Lcom/miui/gallery/scanner/MediaBulkDeleter;->mUri:Landroid/net/Uri;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/miui/gallery/scanner/MediaBulkDeleter;->mColumnName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " IN ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/miui/gallery/scanner/MediaBulkDeleter;->mWhereClause:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2, v0}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p1

    const-string v0, "MediaBulkDeleter"

    const-string v1, "rows deleted: %d"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/miui/gallery/scanner/MediaBulkDeleter;->mWhereClause:Ljava/lang/StringBuilder;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->setLength(I)V

    iget-object p1, p0, Lcom/miui/gallery/scanner/MediaBulkDeleter;->mWhereArgs:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    :cond_0
    return-void
.end method
