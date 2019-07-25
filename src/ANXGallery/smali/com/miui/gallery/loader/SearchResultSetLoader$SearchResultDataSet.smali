.class Lcom/miui/gallery/loader/SearchResultSetLoader$SearchResultDataSet;
.super Lcom/miui/gallery/loader/CloudSetLoader$UnfoldBurstCloudDataSet;
.source "SearchResultSetLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/loader/SearchResultSetLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SearchResultDataSet"
.end annotation


# instance fields
.field private mIds:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field mPositionMap:Landroid/util/SparseIntArray;


# direct methods
.method public constructor <init>([Ljava/lang/String;Landroid/database/Cursor;I)V
    .locals 7

    const-string v6, ""

    const/4 v3, 0x0

    const-wide/16 v4, -0x1

    move-object v0, p0

    move-object v1, p2

    move v2, p3

    invoke-direct/range {v0 .. v6}, Lcom/miui/gallery/loader/CloudSetLoader$UnfoldBurstCloudDataSet;-><init>(Landroid/database/Cursor;IIJLjava/lang/String;)V

    if-eqz p1, :cond_0

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/loader/SearchResultSetLoader$SearchResultDataSet;->mIds:Ljava/util/List;

    new-instance p1, Landroid/util/SparseIntArray;

    iget-object p3, p0, Lcom/miui/gallery/loader/SearchResultSetLoader$SearchResultDataSet;->mIds:Ljava/util/List;

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result p3

    invoke-direct {p1, p3}, Landroid/util/SparseIntArray;-><init>(I)V

    iput-object p1, p0, Lcom/miui/gallery/loader/SearchResultSetLoader$SearchResultDataSet;->mPositionMap:Landroid/util/SparseIntArray;

    invoke-virtual {p0}, Lcom/miui/gallery/loader/SearchResultSetLoader$SearchResultDataSet;->isValidate()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    const/4 p3, 0x0

    :goto_0
    invoke-interface {p2}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-ge p3, v0, :cond_0

    invoke-interface {p2, p3}, Landroid/database/Cursor;->moveToPosition(I)Z

    invoke-interface {p2, p1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/loader/SearchResultSetLoader$SearchResultDataSet;->mPositionMap:Landroid/util/SparseIntArray;

    iget-object v2, p0, Lcom/miui/gallery/loader/SearchResultSetLoader$SearchResultDataSet;->mIds:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    invoke-virtual {v1, v0, p3}, Landroid/util/SparseIntArray;->put(II)V

    add-int/lit8 p3, p3, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method protected foldBurst()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method protected moveToPosition(I)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/loader/SearchResultSetLoader$SearchResultDataSet;->mPositionMap:Landroid/util/SparseIntArray;

    if-eqz v0, :cond_0

    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/loader/SearchResultSetLoader$SearchResultDataSet;->mPositionMap:Landroid/util/SparseIntArray;

    invoke-virtual {v0}, Landroid/util/SparseIntArray;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/loader/SearchResultSetLoader$SearchResultDataSet;->mPositionMap:Landroid/util/SparseIntArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseIntArray;->valueAt(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/loader/SearchResultSetLoader$SearchResultDataSet;->isValidate(I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/loader/SearchResultSetLoader$SearchResultDataSet;->mCursor:Landroid/database/Cursor;

    iget-object v1, p0, Lcom/miui/gallery/loader/SearchResultSetLoader$SearchResultDataSet;->mPositionMap:Landroid/util/SparseIntArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseIntArray;->valueAt(I)I

    move-result p1

    invoke-interface {v0, p1}, Landroid/database/Cursor;->moveToPosition(I)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method
