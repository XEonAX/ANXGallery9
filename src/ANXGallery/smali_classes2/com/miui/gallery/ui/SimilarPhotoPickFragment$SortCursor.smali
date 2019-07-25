.class Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SortCursor;
.super Landroid/database/CursorWrapper;
.source "SimilarPhotoPickFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/SimilarPhotoPickFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SortCursor"
.end annotation


# instance fields
.field private mPos:I

.field private mResults:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private sortList:[I

.field final synthetic this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/SimilarPhotoPickFragment;Landroid/database/Cursor;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SortCursor;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    invoke-direct {p0, p2}, Landroid/database/CursorWrapper;-><init>(Landroid/database/Cursor;)V

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SortCursor;->mPos:I

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SortCursor;->getCount()I

    move-result p1

    new-array p1, p1, [I

    iput-object p1, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SortCursor;->sortList:[I

    iput-object p3, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SortCursor;->mResults:Ljava/util/ArrayList;

    invoke-direct {p0}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SortCursor;->initSortList()V

    return-void
.end method

.method private initSortList()V
    .locals 9

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SortCursor;->getWrappedCursor()Landroid/database/Cursor;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SortCursor;->getCount()I

    move-result v3

    if-ge v2, v3, :cond_2

    invoke-interface {v0, v2}, Landroid/database/Cursor;->moveToPosition(I)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    const/4 v5, 0x0

    :goto_1
    iget-object v6, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SortCursor;->mResults:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v5, v6, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SortCursor;->getCount()I

    move-result v6

    if-ge v5, v6, :cond_1

    iget-object v6, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SortCursor;->mResults:Ljava/util/ArrayList;

    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    cmp-long v8, v3, v6

    if-nez v8, :cond_0

    iget-object v3, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SortCursor;->sortList:[I

    aput v2, v3, v5

    goto :goto_2

    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_1
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method


# virtual methods
.method public getPosition()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SortCursor;->mPos:I

    return v0
.end method

.method public move(I)Z
    .locals 1

    iget v0, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SortCursor;->mPos:I

    add-int/2addr v0, p1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SortCursor;->moveToPosition(I)Z

    move-result p1

    return p1
.end method

.method public moveToFirst()Z
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SortCursor;->moveToPosition(I)Z

    move-result v0

    return v0
.end method

.method public moveToLast()Z
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SortCursor;->getCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SortCursor;->moveToPosition(I)Z

    move-result v0

    return v0
.end method

.method public moveToNext()Z
    .locals 1

    iget v0, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SortCursor;->mPos:I

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SortCursor;->moveToPosition(I)Z

    move-result v0

    return v0
.end method

.method public moveToPosition(I)Z
    .locals 2

    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SortCursor;->sortList:[I

    array-length v0, v0

    if-ge p1, v0, :cond_0

    iput p1, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SortCursor;->mPos:I

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SortCursor;->getWrappedCursor()Landroid/database/Cursor;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SortCursor;->sortList:[I

    aget p1, v1, p1

    invoke-interface {v0, p1}, Landroid/database/Cursor;->moveToPosition(I)Z

    move-result p1

    return p1

    :cond_0
    if-gez p1, :cond_1

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SortCursor;->mPos:I

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SortCursor;->sortList:[I

    array-length v0, v0

    if-lt p1, v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SortCursor;->sortList:[I

    array-length v0, v0

    iput v0, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SortCursor;->mPos:I

    :cond_2
    invoke-virtual {p0}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SortCursor;->getWrappedCursor()Landroid/database/Cursor;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/database/Cursor;->moveToPosition(I)Z

    move-result p1

    return p1
.end method

.method public moveToPrevious()Z
    .locals 1

    iget v0, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SortCursor;->mPos:I

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$SortCursor;->moveToPosition(I)Z

    move-result v0

    return v0
.end method
