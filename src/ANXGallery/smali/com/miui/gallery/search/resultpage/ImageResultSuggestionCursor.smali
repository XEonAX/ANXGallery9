.class Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;
.super Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;
.source "ImageResultSuggestionCursor.java"

# interfaces
.implements Lcom/miui/gallery/search/resultpage/ExpandableGroupList;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor<",
        "Lcom/miui/gallery/search/core/suggestion/SuggestionSection;",
        ">;",
        "Lcom/miui/gallery/search/resultpage/ExpandableGroupList<",
        "Lcom/miui/gallery/search/core/suggestion/SuggestionSection;",
        "Lcom/miui/gallery/search/core/suggestion/Suggestion;",
        ">;"
    }
.end annotation


# instance fields
.field private mGroupCollapsedItemArray:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "[",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mGroupExpandStateArray:Landroid/util/SparseBooleanArray;

.field private mSupportExpand:Z


# direct methods
.method public constructor <init>(Lcom/miui/gallery/search/core/QueryInfo;Ljava/util/List;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/search/core/QueryInfo;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/search/core/suggestion/SuggestionSection;",
            ">;Z)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;-><init>(Lcom/miui/gallery/search/core/QueryInfo;Ljava/util/List;)V

    iput-boolean p3, p0, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->mSupportExpand:Z

    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery/search/core/QueryInfo;Ljava/util/List;ZLandroid/util/SparseBooleanArray;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/search/core/QueryInfo;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/search/core/suggestion/SuggestionSection;",
            ">;Z",
            "Landroid/util/SparseBooleanArray;",
            ")V"
        }
    .end annotation

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;-><init>(Lcom/miui/gallery/search/core/QueryInfo;Ljava/util/List;Z)V

    invoke-direct {p0, p2, p4}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->initGroupCollapsedItemArray(Ljava/util/List;Landroid/util/SparseBooleanArray;)V

    return-void
.end method

.method private initGroupCollapsedItemArray(Ljava/util/List;Landroid/util/SparseBooleanArray;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/search/core/suggestion/SuggestionSection;",
            ">;",
            "Landroid/util/SparseBooleanArray;",
            ")V"
        }
    .end annotation

    new-instance v0, Landroid/util/SparseBooleanArray;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Landroid/util/SparseBooleanArray;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->mGroupExpandStateArray:Landroid/util/SparseBooleanArray;

    new-instance v0, Landroid/util/SparseArray;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Landroid/util/SparseArray;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->mGroupCollapsedItemArray:Landroid/util/SparseArray;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_4

    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;

    if-eqz p2, :cond_0

    invoke-interface {v3}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getSectionExtras()Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;

    move-result-object v4

    const-string v5, "create_date"

    invoke-interface {v4, v5}, Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;->getExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iget-object v5, p0, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->mGroupExpandStateArray:Landroid/util/SparseBooleanArray;

    invoke-virtual {p2, v4, v1}, Landroid/util/SparseBooleanArray;->get(IZ)Z

    move-result v4

    invoke-virtual {v5, v2, v4}, Landroid/util/SparseBooleanArray;->put(IZ)V

    :cond_0
    const-string v4, "item_collapse_visibility"

    invoke-interface {v3, v4}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    const/4 v5, 0x0

    :goto_1
    invoke-interface {v3}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getCount()I

    move-result v6

    if-ge v5, v6, :cond_2

    invoke-interface {v3, v5}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->moveToPosition(I)Z

    if-ltz v4, :cond_1

    const-string v6, "visible"

    invoke-interface {v3, v4}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_2
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    new-array v3, v3, [Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/Integer;

    :cond_3
    iget-object v4, p0, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->mGroupCollapsedItemArray:Landroid/util/SparseArray;

    invoke-virtual {v4, v2, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_4
    return-void
.end method


# virtual methods
.method public getChildrenCount(I)I
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->getGroupExpandState(I)Z

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->getChildrenCount(IZ)I

    move-result p1

    return p1
.end method

.method public getChildrenCount(IZ)I
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->checkGroupPosition(I)V

    iget-boolean v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->mSupportExpand:Z

    if-eqz v0, :cond_1

    if-eqz p2, :cond_0

    goto :goto_0

    :cond_0
    iget-object p2, p0, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->mGroupCollapsedItemArray:Landroid/util/SparseArray;

    invoke-virtual {p2, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/Integer;

    array-length p1, p1

    return p1

    :cond_1
    :goto_0
    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->getGroup(I)Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;

    invoke-interface {p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getCount()I

    move-result p1

    return p1
.end method

.method public getGroupCreateDate(I)I
    .locals 1

    const-string v0, "create_date"

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->getGroupExtra(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v0, "create_date"

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->getGroupExtra(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    goto :goto_0

    :cond_0
    const/4 p1, -0x1

    :goto_0
    return p1
.end method

.method public getGroupCreateTime(I)J
    .locals 2

    const-string v0, "create_time"

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->getGroupExtra(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v0, "create_time"

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->getGroupExtra(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    goto :goto_0

    :cond_0
    const-wide/16 v0, -0x1

    :goto_0
    return-wide v0
.end method

.method public getGroupExpandState(I)Z
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->checkGroupPosition(I)V

    iget-boolean v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->mSupportExpand:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->mGroupExpandStateArray:Landroid/util/SparseBooleanArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method getGroupExpandStateArray()Landroid/util/SparseBooleanArray;
    .locals 4

    new-instance v0, Landroid/util/SparseBooleanArray;

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->getGroupCount()I

    move-result v1

    invoke-direct {v0, v1}, Landroid/util/SparseBooleanArray;-><init>(I)V

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->getGroupCount()I

    move-result v2

    if-ge v1, v2, :cond_0

    invoke-virtual {p0, v1}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->getGroupCreateDate(I)I

    move-result v2

    invoke-virtual {p0, v1}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->getGroupExpandState(I)Z

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/util/SparseBooleanArray;->put(IZ)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method protected getGroupExtra(ILjava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->getGroup(I)Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;

    invoke-interface {p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getSectionExtras()Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;

    move-result-object p1

    invoke-interface {p1, p2}, Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;->getExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getGroupRankValue(I)Ljava/lang/String;
    .locals 1

    const-string v0, "rank_value"

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->getGroupExtra(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getGroupTitle(I)Ljava/lang/String;
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->mSupportExpand:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->getGroupExpandState(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "expand_title"

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->getGroupExtra(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const-string v0, "title"

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->getGroupExtra(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getImageIds()Ljava/lang/String;
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->getGroupCount()I

    move-result v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->getGroupCount()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_2

    iget-boolean v3, p0, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->mSupportExpand:Z

    if-eqz v3, :cond_1

    invoke-virtual {p0, v2}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->getGroupExpandState(I)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_1

    :cond_0
    const-string v3, "collapse_visible_ids"

    invoke-virtual {p0, v2, v3}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->getGroupExtra(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_1
    :goto_1
    const-string v3, "all_ids"

    invoke-virtual {p0, v2, v3}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->getGroupExtra(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_3

    const-string v0, ","

    invoke-static {v0, v1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_3
    const/4 v0, 0x0

    return-object v0
.end method

.method protected onMoveGroup(II)Z
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->mSupportExpand:Z

    if-eqz v0, :cond_1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->getGroupExpandState(I)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->getGroup(I)Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;

    iget-object v1, p0, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->mGroupCollapsedItemArray:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/Integer;

    aget-object p1, p1, p2

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-interface {v0, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->moveToPosition(I)Z

    move-result p1

    return p1

    :cond_1
    :goto_0
    invoke-super {p0, p1, p2}, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->onMoveGroup(II)Z

    move-result p1

    return p1
.end method
