.class public Lcom/miui/gallery/search/navigationpage/NavigationPageViewFactory;
.super Lcom/miui/gallery/search/core/display/AbstractSuggestionViewFactory;
.source "NavigationPageViewFactory.java"


# static fields
.field private static sViewTypes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mPeopleItemDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

.field private mRecommendItemDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/miui/gallery/search/navigationpage/NavigationPageViewFactory;->sViewTypes:Ljava/util/Map;

    sget-object v0, Lcom/miui/gallery/search/navigationpage/NavigationPageViewFactory;->sViewTypes:Ljava/util/Map;

    const-string v1, "navigation_section_header"

    const v2, 0x7f0b00ca

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/search/navigationpage/NavigationPageViewFactory;->sViewTypes:Ljava/util/Map;

    const-string v1, "navigation_recommend"

    const v2, 0x7f0b00c9

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/search/navigationpage/NavigationPageViewFactory;->sViewTypes:Ljava/util/Map;

    const-string v1, "navigation_recommend_item"

    const v2, 0x7f0b00c8

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/search/navigationpage/NavigationPageViewFactory;->sViewTypes:Ljava/util/Map;

    const-string v1, "navigation_people"

    const v2, 0x7f0b00c7

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/search/navigationpage/NavigationPageViewFactory;->sViewTypes:Ljava/util/Map;

    const-string v1, "navigation_people_item"

    const v2, 0x7f0b00c5

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/search/navigationpage/NavigationPageViewFactory;->sViewTypes:Ljava/util/Map;

    const-string v1, "navigation_people_more_item"

    const v2, 0x7f0b00c6

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/search/navigationpage/NavigationPageViewFactory;->sViewTypes:Ljava/util/Map;

    const-string v1, "navigation_tag"

    const v2, 0x7f0b00cc

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/search/navigationpage/NavigationPageViewFactory;->sViewTypes:Ljava/util/Map;

    const-string v1, "navigation_tag_item"

    const v2, 0x7f0b00cb

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/search/navigationpage/NavigationPageViewFactory;->sViewTypes:Ljava/util/Map;

    const-string v1, "navigation_location_item"

    const v2, 0x7f0b00c4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/search/navigationpage/NavigationPageViewFactory;->sViewTypes:Ljava/util/Map;

    const-string v1, "navigation_section_content"

    const v2, 0x7f0b00c2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/search/navigationpage/NavigationPageViewFactory;->sViewTypes:Ljava/util/Map;

    const-string v1, "navigation_warning_header"

    const v2, 0x7f0b00cd

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/search/core/display/AbstractSuggestionViewFactory;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public bindViewHolder(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/Suggestion;ILcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;Lcom/miui/gallery/search/core/display/OnActionClickListener;)V
    .locals 7

    move-object v0, p2

    check-cast v0, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;

    packed-switch p3, :pswitch_data_0

    invoke-super/range {p0 .. p5}, Lcom/miui/gallery/search/core/display/AbstractSuggestionViewFactory;->bindViewHolder(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/Suggestion;ILcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;Lcom/miui/gallery/search/core/display/OnActionClickListener;)V

    goto/16 :goto_0

    :pswitch_0
    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getSectionType()Lcom/miui/gallery/search/SearchConstants$SectionType;

    move-result-object p1

    sget-object p2, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_WARNING:Lcom/miui/gallery/search/SearchConstants$SectionType;

    if-ne p1, p2, :cond_1

    invoke-virtual {p4}, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;->getTitle()Landroid/widget/TextView;

    move-result-object p1

    if-eqz p1, :cond_5

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->moveToFirst()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p4}, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;->getTitle()Landroid/widget/TextView;

    move-result-object p1

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getSuggestionTitle()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    :cond_0
    invoke-virtual {p4}, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;->getTitle()Landroid/widget/TextView;

    move-result-object p1

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getSectionTitle()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_0

    :cond_1
    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getSectionType()Lcom/miui/gallery/search/SearchConstants$SectionType;

    move-result-object p1

    sget-object p2, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_HISTORY:Lcom/miui/gallery/search/SearchConstants$SectionType;

    if-ne p1, p2, :cond_2

    invoke-virtual {p4}, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;->getSubTitle()Landroid/widget/TextView;

    move-result-object p1

    if-eqz p1, :cond_2

    if-eqz p5, :cond_2

    invoke-virtual {p4}, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;->getSubTitle()Landroid/widget/TextView;

    move-result-object p1

    new-instance p2, Lcom/miui/gallery/search/navigationpage/NavigationPageViewFactory$1;

    invoke-direct {p2, p0, p5}, Lcom/miui/gallery/search/navigationpage/NavigationPageViewFactory$1;-><init>(Lcom/miui/gallery/search/navigationpage/NavigationPageViewFactory;Lcom/miui/gallery/search/core/display/OnActionClickListener;)V

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_2
    invoke-virtual {p4}, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;->getTitle()Landroid/widget/TextView;

    move-result-object p1

    if-eqz p1, :cond_3

    invoke-virtual {p4}, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;->getTitle()Landroid/widget/TextView;

    move-result-object p1

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getSectionTitle()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_3
    invoke-virtual {p4}, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;->getSubTitle()Landroid/widget/TextView;

    move-result-object p1

    if-eqz p1, :cond_5

    invoke-virtual {p4}, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;->getSubTitle()Landroid/widget/TextView;

    move-result-object p1

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getSectionSubTitle()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    :pswitch_1
    iget-object p1, p4, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;->itemView:Landroid/view/View;

    check-cast p1, Lcom/miui/gallery/search/navigationpage/NavigationSectionContentView;

    invoke-interface {p1}, Lcom/miui/gallery/search/navigationpage/NavigationSectionContentView;->getContentAdapter()Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;

    move-result-object p1

    if-eqz p1, :cond_4

    invoke-virtual {p1, v0}, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->changeSectionData(Lcom/miui/gallery/search/core/suggestion/SuggestionSection;)V

    goto :goto_0

    :cond_4
    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/navigationpage/NavigationPageViewFactory;->createContentAdapter(Lcom/miui/gallery/search/core/suggestion/SuggestionSection;)Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;

    move-result-object p1

    invoke-virtual {p1, p5}, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->setActionClickListener(Lcom/miui/gallery/search/core/display/OnActionClickListener;)V

    iget-object p2, p4, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;->itemView:Landroid/view/View;

    check-cast p2, Lcom/miui/gallery/search/navigationpage/NavigationSectionContentView;

    invoke-interface {p2, p1}, Lcom/miui/gallery/search/navigationpage/NavigationSectionContentView;->setContentAdapter(Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;)V

    goto :goto_0

    :pswitch_2
    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->moveToMore()Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object v3

    move-object v1, p0

    move-object v2, p1

    move v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-super/range {v1 .. v6}, Lcom/miui/gallery/search/core/display/AbstractSuggestionViewFactory;->bindViewHolder(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/Suggestion;ILcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;Lcom/miui/gallery/search/core/display/OnActionClickListener;)V

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getSectionType()Lcom/miui/gallery/search/SearchConstants$SectionType;

    move-result-object p1

    sget-object p2, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_PEOPLE:Lcom/miui/gallery/search/SearchConstants$SectionType;

    if-ne p1, p2, :cond_5

    invoke-static {}, Lcom/miui/gallery/search/SearchConfig;->get()Lcom/miui/gallery/search/SearchConfig;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/search/SearchConfig;->getNavigationConfig()Lcom/miui/gallery/search/SearchConfig$NavigationConfig;

    move-result-object p1

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getSectionType()Lcom/miui/gallery/search/SearchConstants$SectionType;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/search/SearchConfig$NavigationConfig;->getSectionMaxItemCount(Lcom/miui/gallery/search/SearchConstants$SectionType;)I

    move-result p1

    invoke-interface {v0, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->moveToPosition(I)Z

    move-result p1

    if-eqz p1, :cond_5

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getIntentActionURI()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_5

    invoke-virtual {p4}, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;->getIconView()Landroid/widget/ImageView;

    move-result-object p1

    if-eqz p1, :cond_5

    invoke-virtual {p4}, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;->getIconView()Landroid/widget/ImageView;

    move-result-object p1

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getSuggestionIcon()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p4}, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;->getViewType()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p0, p3}, Lcom/miui/gallery/search/navigationpage/NavigationPageViewFactory;->getDisplayImageOptionsForViewType(Ljava/lang/String;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p3

    invoke-virtual {p0, p1, p2, p3}, Lcom/miui/gallery/search/navigationpage/NavigationPageViewFactory;->bindIcon(Landroid/widget/ImageView;Ljava/lang/String;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    :cond_5
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch -0x3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected createContentAdapter(Lcom/miui/gallery/search/core/suggestion/SuggestionSection;)Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;
    .locals 7

    invoke-interface {p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getSectionType()Lcom/miui/gallery/search/SearchConstants$SectionType;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_HISTORY:Lcom/miui/gallery/search/SearchConstants$SectionType;

    if-ne v0, v1, :cond_0

    const-string v0, "from_navigation_history"

    :goto_0
    move-object v5, v0

    goto :goto_1

    :cond_0
    const-string v0, "from_navigation"

    goto :goto_0

    :goto_1
    invoke-interface {p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getSectionType()Lcom/miui/gallery/search/SearchConstants$SectionType;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_PEOPLE:Lcom/miui/gallery/search/SearchConstants$SectionType;

    if-eq v0, v1, :cond_2

    invoke-interface {p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getSectionType()Lcom/miui/gallery/search/SearchConstants$SectionType;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_FEATURE:Lcom/miui/gallery/search/SearchConstants$SectionType;

    if-ne v0, v1, :cond_1

    goto :goto_2

    :cond_1
    const/4 v0, 0x0

    const/4 v6, 0x0

    goto :goto_3

    :cond_2
    :goto_2
    const/4 v0, 0x1

    const/4 v6, 0x1

    :goto_3
    new-instance v0, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;

    invoke-virtual {p0}, Lcom/miui/gallery/search/navigationpage/NavigationPageViewFactory;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {}, Lcom/miui/gallery/search/core/context/SearchContext;->getInstance()Lcom/miui/gallery/search/core/context/SearchContext;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/search/core/context/SearchContext;->getSuggestionViewFactory()Lcom/miui/gallery/search/core/display/SuggestionViewFactory;

    move-result-object v3

    move-object v1, v0

    move-object v4, p1

    invoke-direct/range {v1 .. v6}, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;-><init>(Landroid/content/Context;Lcom/miui/gallery/search/core/display/SuggestionViewFactory;Lcom/miui/gallery/search/core/suggestion/SuggestionSection;Ljava/lang/String;Z)V

    return-object v0
.end method

.method protected getDisplayImageOptionsForViewType(Ljava/lang/String;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    .locals 1

    if-nez p1, :cond_0

    const-string p1, "Error"

    const-string v0, "empty view type"

    invoke-static {p1, v0}, Lcom/miui/gallery/search/utils/SearchLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    invoke-super {p0, p1}, Lcom/miui/gallery/search/core/display/AbstractSuggestionViewFactory;->getDisplayImageOptionsForViewType(Ljava/lang/String;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p1

    return-object p1

    :cond_0
    const-string v0, "navigation_recommend_item"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/search/navigationpage/NavigationPageViewFactory;->mRecommendItemDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-object p1

    :cond_1
    const-string v0, "navigation_people_item"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    const-string v0, "navigation_people_more_item"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_0

    :cond_2
    invoke-super {p0, p1}, Lcom/miui/gallery/search/core/display/AbstractSuggestionViewFactory;->getDisplayImageOptionsForViewType(Ljava/lang/String;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p1

    return-object p1

    :cond_3
    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/search/navigationpage/NavigationPageViewFactory;->mPeopleItemDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-object p1
.end method

.method protected getLayoutIdForViewType(Ljava/lang/String;)I
    .locals 1

    sget-object v0, Lcom/miui/gallery/search/navigationpage/NavigationPageViewFactory;->sViewTypes:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    return p1
.end method

.method public getSuggestionViewTypes()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/search/navigationpage/NavigationPageViewFactory;->sViewTypes:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getViewType(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;I)Ljava/lang/String;
    .locals 2

    invoke-virtual {p1}, Lcom/miui/gallery/search/core/QueryInfo;->getSearchType()Lcom/miui/gallery/search/SearchConstants$SearchType;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/search/SearchConstants$SearchType;->SEARCH_TYPE_NAVIGATION:Lcom/miui/gallery/search/SearchConstants$SearchType;

    const/4 v1, 0x0

    if-ne p1, v0, :cond_3

    instance-of p1, p2, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    check-cast p2, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;

    invoke-interface {p2}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getSectionType()Lcom/miui/gallery/search/SearchConstants$SectionType;

    move-result-object p1

    packed-switch p3, :pswitch_data_0

    if-ltz p3, :cond_2

    invoke-static {}, Lcom/miui/gallery/search/SearchConfig;->get()Lcom/miui/gallery/search/SearchConfig;

    move-result-object p2

    invoke-virtual {p2}, Lcom/miui/gallery/search/SearchConfig;->getNavigationConfig()Lcom/miui/gallery/search/SearchConfig$NavigationConfig;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/miui/gallery/search/SearchConfig$NavigationConfig;->useBatchContent(Lcom/miui/gallery/search/SearchConstants$SectionType;)Z

    move-result p2

    if-eqz p2, :cond_2

    sget-object p2, Lcom/miui/gallery/search/navigationpage/NavigationPageViewFactory$2;->$SwitchMap$com$miui$gallery$search$SearchConstants$SectionType:[I

    invoke-virtual {p1}, Lcom/miui/gallery/search/SearchConstants$SectionType;->ordinal()I

    move-result p1

    aget p1, p2, p1

    packed-switch p1, :pswitch_data_1

    const-string p1, "navigation_tag_item"

    return-object p1

    :pswitch_0
    sget-object p2, Lcom/miui/gallery/search/navigationpage/NavigationPageViewFactory$2;->$SwitchMap$com$miui$gallery$search$SearchConstants$SectionType:[I

    invoke-virtual {p1}, Lcom/miui/gallery/search/SearchConstants$SectionType;->ordinal()I

    move-result p1

    aget p1, p2, p1

    const/4 p2, 0x1

    if-eq p1, p2, :cond_1

    const-string p1, "navigation_section_header"

    return-object p1

    :cond_1
    const-string p1, "navigation_warning_header"

    return-object p1

    :pswitch_1
    sget-object p2, Lcom/miui/gallery/search/navigationpage/NavigationPageViewFactory$2;->$SwitchMap$com$miui$gallery$search$SearchConstants$SectionType:[I

    invoke-virtual {p1}, Lcom/miui/gallery/search/SearchConstants$SectionType;->ordinal()I

    move-result p1

    aget p1, p2, p1

    packed-switch p1, :pswitch_data_2

    const-string p1, "navigation_section_content"

    return-object p1

    :pswitch_2
    const-string p1, "navigation_tag"

    return-object p1

    :pswitch_3
    const-string p1, "navigation_people"

    return-object p1

    :pswitch_4
    const-string p1, "navigation_recommend"

    return-object p1

    :pswitch_5
    sget-object p2, Lcom/miui/gallery/search/navigationpage/NavigationPageViewFactory$2;->$SwitchMap$com$miui$gallery$search$SearchConstants$SectionType:[I

    invoke-virtual {p1}, Lcom/miui/gallery/search/SearchConstants$SectionType;->ordinal()I

    move-result p1

    aget p1, p2, p1

    packed-switch p1, :pswitch_data_3

    const-string p1, "navigation_tag_item"

    return-object p1

    :pswitch_6
    const-string p1, "navigation_people_more_item"

    return-object p1

    :pswitch_7
    const-string p1, "navigation_recommend_item"

    return-object p1

    :pswitch_8
    const-string p1, "navigation_location_item"

    return-object p1

    :pswitch_9
    const-string p1, "navigation_people_item"

    return-object p1

    :pswitch_a
    const-string p1, "navigation_recommend_item"

    return-object p1

    :cond_2
    return-object v1

    :cond_3
    :goto_0
    return-object v1

    :pswitch_data_0
    .packed-switch -0x3
        :pswitch_5
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x2
        :pswitch_a
        :pswitch_9
        :pswitch_8
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x2
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_2
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x2
        :pswitch_7
        :pswitch_6
    .end packed-switch
.end method

.method protected initDisplayImageOptions(Landroid/content/Context;)V
    .locals 6

    invoke-super {p0, p1}, Lcom/miui/gallery/search/core/display/AbstractSuggestionViewFactory;->initDisplayImageOptions(Landroid/content/Context;)V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f06042f

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/search/navigationpage/NavigationPageViewFactory;->mDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    new-instance v1, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer;

    const/4 v2, 0x4

    new-array v2, v2, [I

    const/4 v3, 0x0

    aput p1, v2, v3

    const/4 v4, 0x1

    aput v3, v2, v4

    const/4 v5, 0x2

    aput v3, v2, v5

    const/4 v3, 0x3

    aput p1, v2, v3

    invoke-direct {v1, v2}, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer;-><init>([I)V

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->displayer(Lcom/nostra13/universalimageloader/core/display/BitmapDisplayer;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/search/navigationpage/NavigationPageViewFactory;->mRecommendItemDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    iget-object p1, p0, Lcom/miui/gallery/search/navigationpage/NavigationPageViewFactory;->mDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    const v0, 0x7f0700d7

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showImageOnLoading(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showImageOnFail(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showImageForEmptyUri(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    new-instance v0, Lcom/miui/gallery/util/face/PeopleItemBitmapDisplayer;

    invoke-direct {v0, v4}, Lcom/miui/gallery/util/face/PeopleItemBitmapDisplayer;-><init>(Z)V

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->displayer(Lcom/nostra13/universalimageloader/core/display/BitmapDisplayer;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1, v4}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->usingRegionDecoderFace(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/search/navigationpage/NavigationPageViewFactory;->mPeopleItemDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-void
.end method
