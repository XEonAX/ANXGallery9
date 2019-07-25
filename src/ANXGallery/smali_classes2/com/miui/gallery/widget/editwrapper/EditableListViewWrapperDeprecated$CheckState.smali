.class Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;
.super Ljava/lang/Object;
.source "EditableListViewWrapperDeprecated.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CheckState"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Source;,
        Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Status;,
        Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Mode;
    }
.end annotation


# instance fields
.field protected mCheckMode:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Mode;

.field protected mCheckState:Landroid/util/SparseBooleanArray;

.field protected mIndex:J

.field private mReverseIndex:J

.field protected mReverseModeSelectedIdIndex:Landroid/util/LongSparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LongSparseArray<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field protected mSource:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Source;

.field protected mStatus:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Status;

.field protected mUserSelectedIdIndex:Landroid/util/LongSparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LongSparseArray<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/util/LongSparseArray;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/util/LongSparseArray;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mUserSelectedIdIndex:Landroid/util/LongSparseArray;

    new-instance v0, Landroid/util/LongSparseArray;

    invoke-direct {v0, v1}, Landroid/util/LongSparseArray;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mReverseModeSelectedIdIndex:Landroid/util/LongSparseArray;

    sget-object v0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Mode;->NORMAL:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Mode;

    iput-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mCheckMode:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Mode;

    new-instance v0, Landroid/util/SparseBooleanArray;

    invoke-direct {v0, v1}, Landroid/util/SparseBooleanArray;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mCheckState:Landroid/util/SparseBooleanArray;

    sget-object v0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Status;->CLEAN:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Status;

    iput-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mStatus:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Status;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mIndex:J

    iput-wide v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mReverseIndex:J

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;-><init>()V

    return-void
.end method

.method private getSortedKeysByIndex([J[J)[J
    .locals 2

    array-length v0, p1

    array-length v1, p2

    if-eq v0, v1, :cond_0

    return-object p1

    :cond_0
    const/4 v0, 0x0

    array-length v1, p1

    add-int/lit8 v1, v1, -0x1

    invoke-static {p1, p2, v0, v1}, Lcom/miui/gallery/util/SyncSortUtil;->sort([J[JII)V

    return-object p1
.end method

.method private getSortedPositionsByIndex([I[J)[I
    .locals 2

    array-length v0, p1

    array-length v1, p2

    if-eq v0, v1, :cond_0

    return-object p1

    :cond_0
    const/4 v0, 0x0

    array-length v1, p1

    add-int/lit8 v1, v1, -0x1

    invoke-static {p1, p2, v0, v1}, Lcom/miui/gallery/util/SyncSortUtil;->sort([I[JII)V

    return-object p1
.end method


# virtual methods
.method public bind(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Source;)V
    .locals 0

    if-nez p1, :cond_0

    return-void

    :cond_0
    iput-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mSource:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Source;

    return-void
.end method

.method public clear()V
    .locals 2

    sget-object v0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Mode;->NORMAL:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Mode;

    iput-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mCheckMode:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Mode;

    sget-object v0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Status;->CLEAN:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Status;

    iput-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mStatus:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Status;

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mCheckState:Landroid/util/SparseBooleanArray;

    invoke-virtual {v0}, Landroid/util/SparseBooleanArray;->clear()V

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mUserSelectedIdIndex:Landroid/util/LongSparseArray;

    invoke-virtual {v0}, Landroid/util/LongSparseArray;->clear()V

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mReverseModeSelectedIdIndex:Landroid/util/LongSparseArray;

    invoke-virtual {v0}, Landroid/util/LongSparseArray;->clear()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mIndex:J

    iput-wide v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mReverseIndex:J

    return-void
.end method

.method public getCheckState(I)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mStatus:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Status;

    sget-object v1, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Status;->CLEAN:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Status;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mCheckState:Landroid/util/SparseBooleanArray;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/util/SparseBooleanArray;->get(IZ)Z

    move-result p1

    return p1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mSource:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Source;

    invoke-interface {v0, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Source;->getItemId(I)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->getCheckState(J)Z

    move-result p1

    return p1
.end method

.method public getCheckState(J)Z
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mCheckMode:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Mode;

    sget-object v1, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Mode;->REVERSE:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Mode;

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mUserSelectedIdIndex:Landroid/util/LongSparseArray;

    invoke-virtual {v0, p1, p2}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_1

    :goto_0
    const/4 v2, 0x1

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mUserSelectedIdIndex:Landroid/util/LongSparseArray;

    invoke-virtual {v0, p1, p2}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_1

    goto :goto_0

    :cond_1
    :goto_1
    return v2
.end method

.method public getCheckedItemIds()[J
    .locals 9

    invoke-virtual {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->getCount()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    new-array v0, v1, [J

    return-object v0

    :cond_0
    iget-object v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mCheckMode:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Mode;

    sget-object v3, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Mode;->NORMAL:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Mode;

    if-ne v2, v3, :cond_2

    iget-object v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mUserSelectedIdIndex:Landroid/util/LongSparseArray;

    invoke-virtual {v2}, Landroid/util/LongSparseArray;->size()I

    move-result v2

    new-array v2, v2, [J

    iget-object v3, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mUserSelectedIdIndex:Landroid/util/LongSparseArray;

    invoke-virtual {v3}, Landroid/util/LongSparseArray;->size()I

    move-result v3

    new-array v3, v3, [J

    const/4 v4, 0x0

    :goto_0
    iget-object v5, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mUserSelectedIdIndex:Landroid/util/LongSparseArray;

    invoke-virtual {v5}, Landroid/util/LongSparseArray;->size()I

    move-result v5

    if-ge v1, v5, :cond_1

    if-ge v4, v0, :cond_1

    add-int/lit8 v5, v4, 0x1

    iget-object v6, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mUserSelectedIdIndex:Landroid/util/LongSparseArray;

    invoke-virtual {v6, v1}, Landroid/util/LongSparseArray;->keyAt(I)J

    move-result-wide v6

    aput-wide v6, v2, v4

    iget-object v6, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mUserSelectedIdIndex:Landroid/util/LongSparseArray;

    invoke-virtual {v6, v1}, Landroid/util/LongSparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    aput-wide v6, v3, v4

    add-int/lit8 v1, v1, 0x1

    move v4, v5

    goto :goto_0

    :cond_1
    invoke-direct {p0, v2, v3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->getSortedKeysByIndex([J[J)[J

    move-result-object v0

    return-object v0

    :cond_2
    new-array v2, v0, [J

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_1
    iget-object v5, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mSource:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Source;

    invoke-interface {v5}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Source;->getCount()I

    move-result v5

    if-ge v3, v5, :cond_4

    iget-object v5, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mSource:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Source;

    invoke-interface {v5, v3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Source;->getItemId(I)J

    move-result-wide v5

    iget-object v7, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mUserSelectedIdIndex:Landroid/util/LongSparseArray;

    invoke-virtual {v7, v5, v6}, Landroid/util/LongSparseArray;->indexOfKey(J)I

    move-result v7

    if-gez v7, :cond_3

    iget-object v7, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mReverseModeSelectedIdIndex:Landroid/util/LongSparseArray;

    invoke-virtual {v7, v5, v6}, Landroid/util/LongSparseArray;->indexOfKey(J)I

    move-result v7

    if-gez v7, :cond_3

    add-int/lit8 v7, v4, 0x1

    aput-wide v5, v2, v4

    move v4, v7

    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_4
    iget-object v3, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mReverseModeSelectedIdIndex:Landroid/util/LongSparseArray;

    invoke-virtual {v3}, Landroid/util/LongSparseArray;->size()I

    move-result v3

    if-lez v3, :cond_6

    iget-object v3, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mReverseModeSelectedIdIndex:Landroid/util/LongSparseArray;

    invoke-virtual {v3}, Landroid/util/LongSparseArray;->size()I

    move-result v3

    new-array v3, v3, [J

    iget-object v5, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mReverseModeSelectedIdIndex:Landroid/util/LongSparseArray;

    invoke-virtual {v5}, Landroid/util/LongSparseArray;->size()I

    move-result v5

    new-array v5, v5, [J

    const/4 v6, 0x0

    :goto_2
    iget-object v7, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mReverseModeSelectedIdIndex:Landroid/util/LongSparseArray;

    invoke-virtual {v7}, Landroid/util/LongSparseArray;->size()I

    move-result v7

    if-ge v6, v7, :cond_5

    iget-object v7, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mReverseModeSelectedIdIndex:Landroid/util/LongSparseArray;

    invoke-virtual {v7, v6}, Landroid/util/LongSparseArray;->keyAt(I)J

    move-result-wide v7

    aput-wide v7, v3, v6

    iget-object v7, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mReverseModeSelectedIdIndex:Landroid/util/LongSparseArray;

    invoke-virtual {v7, v6}, Landroid/util/LongSparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Long;

    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    aput-wide v7, v5, v6

    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    :cond_5
    invoke-direct {p0, v3, v5}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->getSortedKeysByIndex([J[J)[J

    move-result-object v3

    :goto_3
    array-length v5, v3

    if-ge v1, v5, :cond_6

    if-ge v4, v0, :cond_6

    add-int/lit8 v5, v4, 0x1

    aget-wide v6, v3, v1

    aput-wide v6, v2, v4

    add-int/lit8 v1, v1, 0x1

    move v4, v5

    goto :goto_3

    :cond_6
    return-object v2
.end method

.method public getCheckedItemOrderedPositions()[I
    .locals 12

    invoke-virtual {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->getCount()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    new-array v0, v1, [I

    return-object v0

    :cond_0
    iget-object v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mCheckMode:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Mode;

    sget-object v3, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Mode;->NORMAL:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Mode;

    if-ne v2, v3, :cond_3

    iget-object v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mUserSelectedIdIndex:Landroid/util/LongSparseArray;

    invoke-virtual {v2}, Landroid/util/LongSparseArray;->size()I

    move-result v2

    new-array v2, v2, [I

    iget-object v3, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mUserSelectedIdIndex:Landroid/util/LongSparseArray;

    invoke-virtual {v3}, Landroid/util/LongSparseArray;->size()I

    move-result v3

    new-array v3, v3, [J

    const/4 v4, 0x0

    :goto_0
    iget-object v5, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mSource:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Source;

    invoke-interface {v5}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Source;->getCount()I

    move-result v5

    if-ge v1, v5, :cond_2

    if-ge v4, v0, :cond_2

    iget-object v5, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mSource:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Source;

    invoke-interface {v5, v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Source;->getItemId(I)J

    move-result-wide v5

    iget-object v7, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mUserSelectedIdIndex:Landroid/util/LongSparseArray;

    invoke-virtual {v7, v5, v6}, Landroid/util/LongSparseArray;->indexOfKey(J)I

    move-result v7

    if-ltz v7, :cond_1

    add-int/lit8 v7, v4, 0x1

    aput v1, v2, v4

    iget-object v8, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mUserSelectedIdIndex:Landroid/util/LongSparseArray;

    invoke-virtual {v8, v5, v6}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    aput-wide v5, v3, v4

    move v4, v7

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    invoke-direct {p0, v2, v3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->getSortedPositionsByIndex([I[J)[I

    move-result-object v0

    return-object v0

    :cond_3
    new-array v2, v0, [I

    iget-object v3, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mReverseModeSelectedIdIndex:Landroid/util/LongSparseArray;

    invoke-virtual {v3}, Landroid/util/LongSparseArray;->size()I

    move-result v3

    new-array v3, v3, [I

    iget-object v4, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mReverseModeSelectedIdIndex:Landroid/util/LongSparseArray;

    invoke-virtual {v4}, Landroid/util/LongSparseArray;->size()I

    move-result v4

    new-array v4, v4, [J

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    :goto_1
    iget-object v8, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mSource:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Source;

    invoke-interface {v8}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Source;->getCount()I

    move-result v8

    if-ge v5, v8, :cond_6

    iget-object v8, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mSource:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Source;

    invoke-interface {v8, v5}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Source;->getItemId(I)J

    move-result-wide v8

    iget-object v10, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mUserSelectedIdIndex:Landroid/util/LongSparseArray;

    invoke-virtual {v10, v8, v9}, Landroid/util/LongSparseArray;->indexOfKey(J)I

    move-result v10

    if-gez v10, :cond_4

    iget-object v10, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mReverseModeSelectedIdIndex:Landroid/util/LongSparseArray;

    invoke-virtual {v10, v8, v9}, Landroid/util/LongSparseArray;->indexOfKey(J)I

    move-result v10

    if-gez v10, :cond_4

    add-int/lit8 v10, v6, 0x1

    aput v5, v2, v6

    move v6, v10

    :cond_4
    iget-object v10, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mReverseModeSelectedIdIndex:Landroid/util/LongSparseArray;

    invoke-virtual {v10}, Landroid/util/LongSparseArray;->size()I

    move-result v10

    if-ltz v10, :cond_5

    iget-object v10, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mReverseModeSelectedIdIndex:Landroid/util/LongSparseArray;

    invoke-virtual {v10, v8, v9}, Landroid/util/LongSparseArray;->indexOfKey(J)I

    move-result v10

    if-ltz v10, :cond_5

    add-int/lit8 v10, v7, 0x1

    aput v5, v3, v7

    iget-object v11, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mReverseModeSelectedIdIndex:Landroid/util/LongSparseArray;

    invoke-virtual {v11, v8, v9}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Long;

    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    aput-wide v8, v4, v7

    move v7, v10

    :cond_5
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_6
    iget-object v5, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mReverseModeSelectedIdIndex:Landroid/util/LongSparseArray;

    invoke-virtual {v5}, Landroid/util/LongSparseArray;->size()I

    move-result v5

    if-lez v5, :cond_7

    invoke-direct {p0, v3, v4}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->getSortedPositionsByIndex([I[J)[I

    move-result-object v3

    :goto_2
    array-length v4, v3

    if-ge v1, v4, :cond_7

    if-ge v6, v0, :cond_7

    add-int/lit8 v4, v6, 0x1

    aget v5, v3, v1

    aput v5, v2, v6

    add-int/lit8 v1, v1, 0x1

    move v6, v4

    goto :goto_2

    :cond_7
    return-object v2
.end method

.method public getCheckedItemPositions()Landroid/util/SparseBooleanArray;
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mStatus:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Status;

    sget-object v1, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Status;->DIRTY:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Status;

    if-ne v0, v1, :cond_4

    new-instance v0, Landroid/util/SparseBooleanArray;

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mSource:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Source;

    invoke-interface {v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Source;->getCount()I

    move-result v1

    invoke-direct {v0, v1}, Landroid/util/SparseBooleanArray;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mCheckState:Landroid/util/SparseBooleanArray;

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    iget-object v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mSource:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Source;

    invoke-interface {v2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Source;->getCount()I

    move-result v2

    if-ge v1, v2, :cond_3

    iget-object v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mSource:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Source;

    invoke-interface {v2, v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Source;->getItemId(I)J

    move-result-wide v2

    iget-object v4, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mCheckMode:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Mode;

    sget-object v5, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Mode;->NORMAL:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Mode;

    if-ne v4, v5, :cond_0

    iget-object v4, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mUserSelectedIdIndex:Landroid/util/LongSparseArray;

    invoke-virtual {v4, v2, v3}, Landroid/util/LongSparseArray;->indexOfKey(J)I

    move-result v4

    if-gez v4, :cond_1

    :cond_0
    iget-object v4, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mCheckMode:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Mode;

    sget-object v5, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Mode;->REVERSE:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Mode;

    if-ne v4, v5, :cond_2

    iget-object v4, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mUserSelectedIdIndex:Landroid/util/LongSparseArray;

    invoke-virtual {v4, v2, v3}, Landroid/util/LongSparseArray;->indexOfKey(J)I

    move-result v2

    if-gez v2, :cond_2

    :cond_1
    const/4 v2, 0x1

    goto :goto_1

    :cond_2
    const/4 v2, 0x0

    :goto_1
    iget-object v3, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mCheckState:Landroid/util/SparseBooleanArray;

    invoke-virtual {v3, v1, v2}, Landroid/util/SparseBooleanArray;->append(IZ)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    sget-object v0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Status;->CLEAN:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Status;

    iput-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mStatus:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Status;

    :cond_4
    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mCheckState:Landroid/util/SparseBooleanArray;

    invoke-virtual {v0}, Landroid/util/SparseBooleanArray;->clone()Landroid/util/SparseBooleanArray;

    move-result-object v0

    return-object v0
.end method

.method public getCount()I
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mCheckMode:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Mode;

    sget-object v1, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Mode;->NORMAL:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Mode;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mUserSelectedIdIndex:Landroid/util/LongSparseArray;

    invoke-virtual {v0}, Landroid/util/LongSparseArray;->size()I

    move-result v0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mSource:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Source;

    invoke-interface {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Source;->getCount()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mUserSelectedIdIndex:Landroid/util/LongSparseArray;

    invoke-virtual {v1}, Landroid/util/LongSparseArray;->size()I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method public handleDataChanged()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mCheckState:Landroid/util/SparseBooleanArray;

    invoke-virtual {v0}, Landroid/util/SparseBooleanArray;->clear()V

    sget-object v0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Status;->DIRTY:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Status;

    iput-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mStatus:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Status;

    return-void
.end method

.method public setAllChecked(Z)V
    .locals 2

    sget-object v0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Status;->CLEAN:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Status;

    iput-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mStatus:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Status;

    if-eqz p1, :cond_0

    sget-object v0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Mode;->REVERSE:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Mode;

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Mode;->NORMAL:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Mode;

    :goto_0
    iput-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mCheckMode:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Mode;

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mUserSelectedIdIndex:Landroid/util/LongSparseArray;

    invoke-virtual {v0}, Landroid/util/LongSparseArray;->clear()V

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mReverseModeSelectedIdIndex:Landroid/util/LongSparseArray;

    invoke-virtual {v0}, Landroid/util/LongSparseArray;->clear()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mIndex:J

    iput-wide v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mReverseIndex:J

    const/4 v0, 0x0

    :goto_1
    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mSource:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Source;

    invoke-interface {v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Source;->getCount()I

    move-result v1

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mCheckState:Landroid/util/SparseBooleanArray;

    invoke-virtual {v1, v0, p1}, Landroid/util/SparseBooleanArray;->append(IZ)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    return-void
.end method

.method public setCheckState(IZ)V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mStatus:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Status;

    sget-object v1, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Status;->CLEAN:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Status;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mCheckState:Landroid/util/SparseBooleanArray;

    invoke-virtual {v0, p1, p2}, Landroid/util/SparseBooleanArray;->put(IZ)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mSource:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Source;

    invoke-interface {v0, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Source;->getItemId(I)J

    move-result-wide v0

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mCheckMode:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Mode;

    sget-object v2, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Mode;->NORMAL:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Mode;

    const-wide/16 v3, 0x1

    if-ne p1, v2, :cond_2

    if-eqz p2, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mUserSelectedIdIndex:Landroid/util/LongSparseArray;

    iget-wide v5, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mIndex:J

    add-long/2addr v3, v5

    iput-wide v3, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mIndex:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-virtual {p1, v0, v1, p2}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mUserSelectedIdIndex:Landroid/util/LongSparseArray;

    invoke-virtual {p1, v0, v1}, Landroid/util/LongSparseArray;->remove(J)V

    goto :goto_0

    :cond_2
    if-eqz p2, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mUserSelectedIdIndex:Landroid/util/LongSparseArray;

    invoke-virtual {p1, v0, v1}, Landroid/util/LongSparseArray;->remove(J)V

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mReverseModeSelectedIdIndex:Landroid/util/LongSparseArray;

    iget-wide v5, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mReverseIndex:J

    add-long/2addr v3, v5

    iput-wide v3, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mReverseIndex:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-virtual {p1, v0, v1, p2}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    goto :goto_0

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mUserSelectedIdIndex:Landroid/util/LongSparseArray;

    iget-wide v5, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mIndex:J

    add-long/2addr v3, v5

    iput-wide v3, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mIndex:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-virtual {p1, v0, v1, p2}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->mReverseModeSelectedIdIndex:Landroid/util/LongSparseArray;

    invoke-virtual {p1, v0, v1}, Landroid/util/LongSparseArray;->remove(J)V

    :goto_0
    return-void
.end method
