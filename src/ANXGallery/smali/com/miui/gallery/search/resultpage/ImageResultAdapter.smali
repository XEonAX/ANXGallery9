.class public Lcom/miui/gallery/search/resultpage/ImageResultAdapter;
.super Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;
.source "ImageResultAdapter.java"

# interfaces
.implements Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/search/resultpage/ImageResultAdapter$OnHeaderItemClickedListener;
    }
.end annotation


# instance fields
.field private mHeaderClickListener:Lcom/miui/gallery/search/resultpage/ImageResultAdapter$OnHeaderItemClickedListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/search/resultpage/ImageResultAdapter;)Lcom/miui/gallery/search/resultpage/ImageResultAdapter$OnHeaderItemClickedListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/resultpage/ImageResultAdapter;->mHeaderClickListener:Lcom/miui/gallery/search/resultpage/ImageResultAdapter$OnHeaderItemClickedListener;

    return-object p0
.end method


# virtual methods
.method public getCountForHeader(I)I
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/ImageResultAdapter;->getResultCursor()Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/ImageResultAdapter;->getResultCursor()Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->getChildrenCount(I)I

    move-result p1

    :goto_0
    return p1
.end method

.method public getDividerView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public getGroupCreateDate(I)I
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/ImageResultAdapter;->getResultCursor()Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->getGroupCreateDate(I)I

    move-result p1

    return p1
.end method

.method public getGroupCreateTime(I)J
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/ImageResultAdapter;->getResultCursor()Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->getGroupCreateTime(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getGroupRankValue(I)Ljava/lang/String;
    .locals 6

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/ImageResultAdapter;->getResultCursor()Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->getGroupRankValue(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/resultpage/ImageResultAdapter;->getGroupCreateTime(I)J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-lez v5, :cond_0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/resultpage/ImageResultAdapter;->getGroupCreateTime(I)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GalleryDateUtils;->formatRelativeDate(J)Ljava/lang/String;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public getGroupTitle(I)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/ImageResultAdapter;->getResultCursor()Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->getGroupTitle(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getHeaderView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 8

    const/4 v0, 0x0

    if-nez p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/search/resultpage/ImageResultAdapter;->mContext:Landroid/content/Context;

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v1, 0x7f0b0141

    invoke-virtual {p2, v1, p3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    :cond_0
    move-object v1, p2

    check-cast v1, Lcom/miui/gallery/search/resultpage/ImageResultHeaderItem;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/resultpage/ImageResultAdapter;->getGroupRankValue(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/resultpage/ImageResultAdapter;->getGroupTitle(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/resultpage/ImageResultAdapter;->getGroupCreateTime(I)J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long p3, v4, v6

    if-ltz p3, :cond_1

    const/4 v0, 0x1

    const/4 v4, 0x1

    goto :goto_0

    :cond_1
    const/4 v4, 0x0

    :goto_0
    const v5, 0x7f070032

    new-instance v6, Lcom/miui/gallery/search/resultpage/ImageResultAdapter$1;

    invoke-direct {v6, p0, p1}, Lcom/miui/gallery/search/resultpage/ImageResultAdapter$1;-><init>(Lcom/miui/gallery/search/resultpage/ImageResultAdapter;I)V

    invoke-virtual/range {v1 .. v6}, Lcom/miui/gallery/search/resultpage/ImageResultHeaderItem;->bindData(Ljava/lang/String;Ljava/lang/String;ZILandroid/view/View$OnClickListener;)V

    return-object p2
.end method

.method public getNumHeaders()I
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/ImageResultAdapter;->getResultCursor()Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/ImageResultAdapter;->getResultCursor()Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->getGroupCount()I

    move-result v0

    :goto_0
    return v0
.end method

.method public setHeaderClickListener(Lcom/miui/gallery/search/resultpage/ImageResultAdapter$OnHeaderItemClickedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/ImageResultAdapter;->mHeaderClickListener:Lcom/miui/gallery/search/resultpage/ImageResultAdapter$OnHeaderItemClickedListener;

    return-void
.end method

.method public shouldDrawDivider()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
