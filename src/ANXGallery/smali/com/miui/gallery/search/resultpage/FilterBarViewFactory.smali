.class public Lcom/miui/gallery/search/resultpage/FilterBarViewFactory;
.super Lcom/miui/gallery/search/core/display/AbstractSuggestionViewFactory;
.source "FilterBarViewFactory.java"


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
.field private mFilterItemDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/miui/gallery/search/resultpage/FilterBarViewFactory;->sViewTypes:Ljava/util/Map;

    sget-object v0, Lcom/miui/gallery/search/resultpage/FilterBarViewFactory;->sViewTypes:Ljava/util/Map;

    const-string v1, "filter_item"

    const v2, 0x7f0b007f

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/search/resultpage/FilterBarViewFactory;->sViewTypes:Ljava/util/Map;

    const-string v1, "filter_item_no_icon"

    const v2, 0x7f0b0080

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

.method static synthetic access$000(Lcom/miui/gallery/search/resultpage/FilterBarViewFactory;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;I)Lcom/miui/gallery/search/core/suggestion/Suggestion;
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/search/resultpage/FilterBarViewFactory;->getItem(Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;I)Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object p0

    return-object p0
.end method

.method private getItem(Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;I)Lcom/miui/gallery/search/core/suggestion/Suggestion;
    .locals 0

    invoke-interface {p1, p2}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->moveToPosition(I)Z

    invoke-interface {p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getCurrent()Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public bindViewHolder(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/Suggestion;ILcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;Lcom/miui/gallery/search/core/display/OnActionClickListener;)V
    .locals 7

    move-object v0, p2

    check-cast v0, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-direct {p0, v0, p3}, Lcom/miui/gallery/search/resultpage/FilterBarViewFactory;->getItem(Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;I)Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    move-object v1, p0

    move-object v2, p1

    move-object v3, v0

    move v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-super/range {v1 .. v6}, Lcom/miui/gallery/search/core/display/AbstractSuggestionViewFactory;->bindViewHolder(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/Suggestion;ILcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;Lcom/miui/gallery/search/core/display/OnActionClickListener;)V

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/Suggestion;->getIntentActionURI()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-virtual {p4}, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;->getClickView()Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_1

    if-eqz p5, :cond_1

    invoke-virtual {p4}, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;->getClickView()Landroid/view/View;

    move-result-object p1

    new-instance p4, Lcom/miui/gallery/search/resultpage/FilterBarViewFactory$1;

    invoke-direct {p4, p0, p5, p2, p3}, Lcom/miui/gallery/search/resultpage/FilterBarViewFactory$1;-><init>(Lcom/miui/gallery/search/resultpage/FilterBarViewFactory;Lcom/miui/gallery/search/core/display/OnActionClickListener;Lcom/miui/gallery/search/core/suggestion/Suggestion;I)V

    invoke-virtual {p1, p4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_1
    return-void
.end method

.method protected getDisplayImageOptionsForViewType(Ljava/lang/String;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/FilterBarViewFactory;->mFilterItemDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-object p1
.end method

.method protected getLayoutIdForViewType(Ljava/lang/String;)I
    .locals 1

    sget-object v0, Lcom/miui/gallery/search/resultpage/FilterBarViewFactory;->sViewTypes:Ljava/util/Map;

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

    sget-object v0, Lcom/miui/gallery/search/resultpage/FilterBarViewFactory;->sViewTypes:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getViewType(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;I)Ljava/lang/String;
    .locals 0

    invoke-virtual {p1}, Lcom/miui/gallery/search/core/QueryInfo;->getSearchType()Lcom/miui/gallery/search/SearchConstants$SearchType;

    move-result-object p1

    sget-object p3, Lcom/miui/gallery/search/SearchConstants$SearchType;->SEARCH_TYPE_FILTER:Lcom/miui/gallery/search/SearchConstants$SearchType;

    if-eq p1, p3, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    invoke-interface {p2}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getSuggestionIcon()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_1

    const-string p1, "filter_item_no_icon"

    return-object p1

    :cond_1
    const-string p1, "filter_item"

    return-object p1
.end method

.method protected initDisplayImageOptions(Landroid/content/Context;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/search/core/display/AbstractSuggestionViewFactory;->initDisplayImageOptions(Landroid/content/Context;)V

    invoke-static {}, Lcom/miui/gallery/people/PeopleDisplayHelper;->getDefaultPeopleDisplayOptionsBuilder()Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/FilterBarViewFactory;->mFilterItemDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-void
.end method
