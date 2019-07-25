.class public Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;
.super Landroid/widget/BaseAdapter;
.source "NavigationSectionAdapter.java"

# interfaces
.implements Lcom/miui/gallery/search/navigationpage/SuggestionTagView$SuggestionTagViewAdapter;


# instance fields
.field protected mActionClickListener:Lcom/miui/gallery/search/core/display/OnActionClickListener;

.field protected mAppendMoreItemToItems:Z

.field protected mContext:Landroid/content/Context;

.field protected mFrom:Ljava/lang/String;

.field protected mInflater:Landroid/view/LayoutInflater;

.field protected mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionSection;

.field protected mViewFactory:Lcom/miui/gallery/search/core/display/SuggestionViewFactory;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/miui/gallery/search/core/display/SuggestionViewFactory;Lcom/miui/gallery/search/core/suggestion/SuggestionSection;Ljava/lang/String;Z)V
    .locals 0

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->mViewFactory:Lcom/miui/gallery/search/core/display/SuggestionViewFactory;

    iget-object p1, p0, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->mContext:Landroid/content/Context;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->mInflater:Landroid/view/LayoutInflater;

    iput-object p3, p0, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionSection;

    iput-object p4, p0, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->mFrom:Ljava/lang/String;

    iput-boolean p5, p0, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->mAppendMoreItemToItems:Z

    return-void
.end method

.method private getFixedMoreItemValue(ZLcom/miui/gallery/search/core/suggestion/SuggestionExtras;)Z
    .locals 1

    if-nez p2, :cond_0

    return p1

    :cond_0
    const-string v0, "fixed"

    invoke-interface {p2, v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;->getExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    :goto_0
    return p1
.end method


# virtual methods
.method public changeSectionData(Lcom/miui/gallery/search/core/suggestion/SuggestionSection;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionSection;

    if-ne p1, v0, :cond_0

    return-void

    :cond_0
    iput-object p1, p0, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionSection;

    invoke-virtual {p0}, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method public getCount()I
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->getItemCount()I

    move-result v0

    iget-boolean v1, p0, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->mAppendMoreItemToItems:Z

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->hasMoreItem()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    add-int/2addr v0, v1

    return v0
.end method

.method public getItem(I)Lcom/miui/gallery/search/core/suggestion/Suggestion;
    .locals 1

    const/4 v0, -0x3

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionSection;

    invoke-interface {p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->moveToMore()Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object p1

    return-object p1

    :cond_0
    if-ltz p1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionSection;

    invoke-interface {v0, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->moveToPosition(I)Z

    iget-object p1, p0, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionSection;

    invoke-interface {p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getCurrent()Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object p1

    return-object p1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->getItem(I)Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object p1

    return-object p1
.end method

.method protected getItemCount()I
    .locals 2

    invoke-static {}, Lcom/miui/gallery/search/SearchConfig;->get()Lcom/miui/gallery/search/SearchConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/search/SearchConfig;->getNavigationConfig()Lcom/miui/gallery/search/SearchConfig$NavigationConfig;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionSection;

    invoke-interface {v1}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getSectionType()Lcom/miui/gallery/search/SearchConstants$SectionType;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/search/SearchConfig$NavigationConfig;->getSectionMaxItemCount(Lcom/miui/gallery/search/SearchConstants$SectionType;)I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionSection;

    invoke-interface {v1}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getCount()I

    move-result v1

    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    return v0
.end method

.method public getItemId(I)J
    .locals 2

    int-to-long v0, p1

    return-wide v0
.end method

.method public getMoreItemView(Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->getItemCount()I

    move-result v0

    invoke-virtual {p0, v0, p1, p2}, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 8

    invoke-virtual {p0}, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->getItemCount()I

    move-result v0

    const/4 v1, -0x3

    if-ne p1, v0, :cond_0

    const/4 v5, -0x3

    goto :goto_0

    :cond_0
    move v5, p1

    :goto_0
    if-nez p2, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->mViewFactory:Lcom/miui/gallery/search/core/display/SuggestionViewFactory;

    iget-object p2, p0, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionSection;

    invoke-interface {p2}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getQueryInfo()Lcom/miui/gallery/search/core/QueryInfo;

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionSection;

    invoke-interface {p1, p2, v0, v5}, Lcom/miui/gallery/search/core/display/SuggestionViewFactory;->getViewType(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;I)Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->mViewFactory:Lcom/miui/gallery/search/core/display/SuggestionViewFactory;

    invoke-interface {p2, p3, p1}, Lcom/miui/gallery/search/core/display/SuggestionViewFactory;->createViewHolder(Landroid/view/ViewGroup;Ljava/lang/String;)Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;

    move-result-object p1

    iget-object p2, p1, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p2, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    goto :goto_1

    :cond_1
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;

    :goto_1
    if-gez v5, :cond_2

    if-ne v5, v1, :cond_3

    :cond_2
    invoke-virtual {p0, v5}, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->getItem(I)Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object p2

    invoke-interface {p2}, Lcom/miui/gallery/search/core/suggestion/Suggestion;->getIntentActionURI()Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_3

    invoke-virtual {p1}, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;->getClickView()Landroid/view/View;

    move-result-object p2

    if-eqz p2, :cond_3

    invoke-virtual {p1}, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;->getClickView()Landroid/view/View;

    move-result-object p2

    new-instance p3, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter$1;

    invoke-direct {p3, p0, v5}, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter$1;-><init>(Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;I)V

    invoke-virtual {p2, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_3
    iget-object v2, p0, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->mViewFactory:Lcom/miui/gallery/search/core/display/SuggestionViewFactory;

    iget-object p2, p0, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionSection;

    invoke-interface {p2}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getQueryInfo()Lcom/miui/gallery/search/core/QueryInfo;

    move-result-object v3

    iget-object v4, p0, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionSection;

    iget-object v7, p0, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->mActionClickListener:Lcom/miui/gallery/search/core/display/OnActionClickListener;

    move-object v6, p1

    invoke-interface/range {v2 .. v7}, Lcom/miui/gallery/search/core/display/SuggestionViewFactory;->bindViewHolder(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/Suggestion;ILcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;Lcom/miui/gallery/search/core/display/OnActionClickListener;)V

    iget-object p1, p1, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;->itemView:Landroid/view/View;

    return-object p1
.end method

.method public hasMoreItem()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionSection;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->moveToMore()Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isFixedMoreItem()Z
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->hasMoreItem()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionSection;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->moveToMore()Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object v0

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/Suggestion;->getSuggestionExtras()Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;

    move-result-object v0

    invoke-direct {p0, v1, v0}, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->getFixedMoreItemValue(ZLcom/miui/gallery/search/core/suggestion/SuggestionExtras;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public setActionClickListener(Lcom/miui/gallery/search/core/display/OnActionClickListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->mActionClickListener:Lcom/miui/gallery/search/core/display/OnActionClickListener;

    return-void
.end method
