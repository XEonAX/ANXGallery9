.class public Lcom/miui/gallery/search/suggestionpage/SearchSuggestionViewFactory;
.super Lcom/miui/gallery/search/core/display/AbstractSuggestionViewFactory;
.source "SearchSuggestionViewFactory.java"


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
.field private mItemDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

.field private mPeopleItemDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/miui/gallery/search/suggestionpage/SearchSuggestionViewFactory;->sViewTypes:Ljava/util/Map;

    sget-object v0, Lcom/miui/gallery/search/suggestionpage/SearchSuggestionViewFactory;->sViewTypes:Ljava/util/Map;

    const-string v1, "search_suggestion_people"

    const v2, 0x7f0b006a

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/search/suggestionpage/SearchSuggestionViewFactory;->sViewTypes:Ljava/util/Map;

    const-string v1, "search_suggestion_item"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/search/suggestionpage/SearchSuggestionViewFactory;->sViewTypes:Ljava/util/Map;

    const-string v1, "search_suggestion_no_result_header"

    const v2, 0x7f0b016b

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/search/suggestionpage/SearchSuggestionViewFactory;->sViewTypes:Ljava/util/Map;

    const-string v1, "search_suggestion_guide_item"

    const v2, 0x7f0b008c

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

.method static synthetic access$000(Lcom/miui/gallery/search/suggestionpage/SearchSuggestionViewFactory;Lcom/miui/gallery/search/core/suggestion/SuggestionSection;I)Lcom/miui/gallery/search/core/suggestion/Suggestion;
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/search/suggestionpage/SearchSuggestionViewFactory;->getItem(Lcom/miui/gallery/search/core/suggestion/SuggestionSection;I)Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object p0

    return-object p0
.end method

.method private findQueryTextSpan(Ljava/lang/String;Ljava/lang/String;)[I
    .locals 4

    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-ltz v0, :cond_2

    invoke-virtual {p1, p2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x1

    if-eq v1, v0, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\""

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-gez v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u201c"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    :cond_0
    if-ltz v1, :cond_1

    add-int/lit8 v0, v1, 0x1

    :cond_1
    const/4 p1, 0x2

    new-array p1, p1, [I

    const/4 v1, 0x0

    aput v0, p1, v1

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result p2

    add-int/2addr v0, p2

    aput v0, p1, v2

    return-object p1

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method

.method private getItem(Lcom/miui/gallery/search/core/suggestion/SuggestionSection;I)Lcom/miui/gallery/search/core/suggestion/Suggestion;
    .locals 1

    const/4 v0, -0x3

    if-ne p2, v0, :cond_0

    invoke-interface {p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->moveToMore()Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object p1

    return-object p1

    :cond_0
    if-ltz p2, :cond_1

    invoke-interface {p1, p2}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->moveToPosition(I)Z

    invoke-interface {p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getCurrent()Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object p1

    return-object p1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method


# virtual methods
.method public bindViewHolder(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/Suggestion;ILcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;Lcom/miui/gallery/search/core/display/OnActionClickListener;)V
    .locals 7

    move-object v0, p2

    check-cast v0, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;

    const/4 v1, -0x1

    if-ne p3, v1, :cond_1

    invoke-virtual {p4}, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;->getTitle()Landroid/widget/TextView;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p4}, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;->getTitle()Landroid/widget/TextView;

    move-result-object p1

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getSectionTitle()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void

    :cond_1
    invoke-direct {p0, v0, p3}, Lcom/miui/gallery/search/suggestionpage/SearchSuggestionViewFactory;->getItem(Lcom/miui/gallery/search/core/suggestion/SuggestionSection;I)Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object v6

    if-nez v6, :cond_2

    return-void

    :cond_2
    move-object v0, p0

    move-object v1, p1

    move-object v2, v6

    move v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-super/range {v0 .. v5}, Lcom/miui/gallery/search/core/display/AbstractSuggestionViewFactory;->bindViewHolder(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/Suggestion;ILcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;Lcom/miui/gallery/search/core/display/OnActionClickListener;)V

    const-string v0, "search_suggestion_guide_item"

    invoke-virtual {p4}, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;->getViewType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    const-string v0, "query"

    invoke-virtual {p1, v0}, Lcom/miui/gallery/search/core/QueryInfo;->getParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    invoke-virtual {p4}, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;->getTitle()Landroid/widget/TextView;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-interface {v6}, Lcom/miui/gallery/search/core/suggestion/Suggestion;->getSuggestionTitle()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    invoke-interface {v6}, Lcom/miui/gallery/search/core/suggestion/Suggestion;->getSuggestionTitle()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, "query"

    invoke-virtual {p1, v1}, Lcom/miui/gallery/search/core/QueryInfo;->getParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lcom/miui/gallery/search/suggestionpage/SearchSuggestionViewFactory;->findQueryTextSpan(Ljava/lang/String;Ljava/lang/String;)[I

    move-result-object p1

    if-eqz p1, :cond_3

    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-interface {v6}, Lcom/miui/gallery/search/core/suggestion/Suggestion;->getSuggestionTitle()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    new-instance v1, Landroid/text/style/ForegroundColorSpan;

    invoke-virtual {p0}, Lcom/miui/gallery/search/suggestionpage/SearchSuggestionViewFactory;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f050163

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-direct {v1, v2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    const/4 v2, 0x0

    aget v2, p1, v2

    const/4 v3, 0x1

    aget p1, p1, v3

    const/16 v3, 0x21

    invoke-virtual {v0, v1, v2, p1, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    invoke-virtual {p4}, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;->getTitle()Landroid/widget/TextView;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_3
    invoke-interface {v6}, Lcom/miui/gallery/search/core/suggestion/Suggestion;->getIntentActionURI()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_4

    invoke-virtual {p4}, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;->getClickView()Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_4

    if-eqz p5, :cond_4

    invoke-virtual {p4}, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;->getClickView()Landroid/view/View;

    move-result-object p1

    new-instance p4, Lcom/miui/gallery/search/suggestionpage/SearchSuggestionViewFactory$1;

    invoke-direct {p4, p0, p2, p5, p3}, Lcom/miui/gallery/search/suggestionpage/SearchSuggestionViewFactory$1;-><init>(Lcom/miui/gallery/search/suggestionpage/SearchSuggestionViewFactory;Lcom/miui/gallery/search/core/suggestion/Suggestion;Lcom/miui/gallery/search/core/display/OnActionClickListener;I)V

    invoke-virtual {p1, p4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_4
    return-void
.end method

.method protected getDisplayImageOptionsForViewType(Ljava/lang/String;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    .locals 1

    const-string v0, "search_suggestion_people"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "search_suggestion_guide_item"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/search/suggestionpage/SearchSuggestionViewFactory;->mItemDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-object p1

    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/search/suggestionpage/SearchSuggestionViewFactory;->mPeopleItemDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-object p1
.end method

.method protected getLayoutIdForViewType(Ljava/lang/String;)I
    .locals 1

    sget-object v0, Lcom/miui/gallery/search/suggestionpage/SearchSuggestionViewFactory;->sViewTypes:Ljava/util/Map;

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

    sget-object v0, Lcom/miui/gallery/search/suggestionpage/SearchSuggestionViewFactory;->sViewTypes:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getViewType(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;I)Ljava/lang/String;
    .locals 3

    invoke-virtual {p1}, Lcom/miui/gallery/search/core/QueryInfo;->getSearchType()Lcom/miui/gallery/search/SearchConstants$SearchType;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SearchType;->SEARCH_TYPE_SEARCH:Lcom/miui/gallery/search/SearchConstants$SearchType;

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/search/core/QueryInfo;->getSearchType()Lcom/miui/gallery/search/SearchConstants$SearchType;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/search/SearchConstants$SearchType;->SEARCH_TYPE_SUGGESTION:Lcom/miui/gallery/search/SearchConstants$SearchType;

    if-ne p1, v0, :cond_1

    :cond_0
    instance-of p1, p2, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;

    if-nez p1, :cond_2

    :cond_1
    return-object v2

    :cond_2
    check-cast p2, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;

    invoke-interface {p2}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getSectionType()Lcom/miui/gallery/search/SearchConstants$SectionType;

    move-result-object p1

    sget-object p2, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_NO_RESULT:Lcom/miui/gallery/search/SearchConstants$SectionType;

    if-ne p1, p2, :cond_3

    const/4 p2, -0x1

    if-ne p3, p2, :cond_3

    const-string p1, "search_suggestion_no_result_header"

    return-object p1

    :cond_3
    if-gez p3, :cond_5

    const/4 p2, -0x3

    if-ne p3, p2, :cond_4

    goto :goto_0

    :cond_4
    return-object v2

    :cond_5
    :goto_0
    sget-object p2, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_PEOPLE:Lcom/miui/gallery/search/SearchConstants$SectionType;

    if-ne p1, p2, :cond_6

    const-string p1, "search_suggestion_people"

    return-object p1

    :cond_6
    sget-object p2, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_GUIDE:Lcom/miui/gallery/search/SearchConstants$SectionType;

    if-ne p1, p2, :cond_7

    const-string p1, "search_suggestion_guide_item"

    return-object p1

    :cond_7
    const-string p1, "search_suggestion_item"

    return-object p1
.end method

.method protected initDisplayImageOptions(Landroid/content/Context;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/miui/gallery/search/core/display/AbstractSuggestionViewFactory;->initDisplayImageOptions(Landroid/content/Context;)V

    iget-object p1, p0, Lcom/miui/gallery/search/suggestionpage/SearchSuggestionViewFactory;->mDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    new-instance v0, Lcom/miui/gallery/util/face/PeopleItemBitmapDisplayer;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/miui/gallery/util/face/PeopleItemBitmapDisplayer;-><init>(Z)V

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->displayer(Lcom/nostra13/universalimageloader/core/display/BitmapDisplayer;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    const v0, 0x7f07024f

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showImageOnLoading(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showImageOnFail(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showImageForEmptyUri(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/search/suggestionpage/SearchSuggestionViewFactory;->mItemDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    invoke-static {}, Lcom/miui/gallery/people/PeopleDisplayHelper;->getDefaultPeopleDisplayOptionsBuilder()Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/search/suggestionpage/SearchSuggestionViewFactory;->mPeopleItemDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-void
.end method
