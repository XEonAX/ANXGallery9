.class Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;
.super Ljava/lang/Object;
.source "PhotoPageAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/adapter/PhotoPageAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CheckState"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState$Source;
    }
.end annotation


# instance fields
.field private mSelectedIds:Landroid/util/SparseLongArray;

.field private mSource:Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState$Source;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState$Source;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;->mSource:Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState$Source;

    new-instance v0, Landroid/util/SparseLongArray;

    invoke-interface {p1}, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState$Source;->getCount()I

    move-result p1

    invoke-direct {v0, p1}, Landroid/util/SparseLongArray;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;->mSelectedIds:Landroid/util/SparseLongArray;

    return-void
.end method


# virtual methods
.method public appendCheck(IJ)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;->mSelectedIds:Landroid/util/SparseLongArray;

    invoke-virtual {v0, p1, p2, p3}, Landroid/util/SparseLongArray;->append(IJ)V

    return-void
.end method

.method public getSelectedPositions()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;->mSelectedIds:Landroid/util/SparseLongArray;

    invoke-virtual {v0}, Landroid/util/SparseLongArray;->size()I

    move-result v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    iget-object v3, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;->mSelectedIds:Landroid/util/SparseLongArray;

    invoke-virtual {v3, v2}, Landroid/util/SparseLongArray;->keyAt(I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v1
.end method

.method public isCheckedId(J)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;->mSelectedIds:Landroid/util/SparseLongArray;

    invoke-virtual {v0, p1, p2}, Landroid/util/SparseLongArray;->indexOfValue(J)I

    move-result p1

    const/4 p2, -0x1

    if-le p1, p2, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public notifyDataChanged()V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;->mSelectedIds:Landroid/util/SparseLongArray;

    invoke-virtual {v0}, Landroid/util/SparseLongArray;->size()I

    move-result v0

    if-lez v0, :cond_2

    new-instance v1, Landroid/util/SparseLongArray;

    invoke-direct {v1, v0}, Landroid/util/SparseLongArray;-><init>(I)V

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    iget-object v3, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;->mSelectedIds:Landroid/util/SparseLongArray;

    invoke-virtual {v3, v2}, Landroid/util/SparseLongArray;->valueAt(I)J

    move-result-wide v3

    iget-object v5, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;->mSource:Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState$Source;

    iget-object v6, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;->mSelectedIds:Landroid/util/SparseLongArray;

    invoke-virtual {v6, v2}, Landroid/util/SparseLongArray;->keyAt(I)I

    move-result v6

    invoke-interface {v5, v3, v4, v6}, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState$Source;->getItemPos(JI)I

    move-result v5

    const/4 v6, -0x1

    if-le v5, v6, :cond_0

    invoke-virtual {v1, v5, v3, v4}, Landroid/util/SparseLongArray;->put(IJ)V

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    iput-object v1, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;->mSelectedIds:Landroid/util/SparseLongArray;

    :cond_2
    return-void
.end method

.method public setChecked(IJZ)V
    .locals 0

    if-eqz p4, :cond_0

    iget-object p4, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;->mSelectedIds:Landroid/util/SparseLongArray;

    invoke-virtual {p4, p1, p2, p3}, Landroid/util/SparseLongArray;->put(IJ)V

    goto :goto_0

    :cond_0
    iget-object p2, p0, Lcom/miui/gallery/adapter/PhotoPageAdapter$CheckState;->mSelectedIds:Landroid/util/SparseLongArray;

    invoke-virtual {p2, p1}, Landroid/util/SparseLongArray;->delete(I)V

    :goto_0
    return-void
.end method
