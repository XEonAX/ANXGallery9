.class Lcom/miui/gallery/search/suggestionpage/SearchSuggestionViewFactory$1;
.super Ljava/lang/Object;
.source "SearchSuggestionViewFactory.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/search/suggestionpage/SearchSuggestionViewFactory;->bindViewHolder(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/Suggestion;ILcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;Lcom/miui/gallery/search/core/display/OnActionClickListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/search/suggestionpage/SearchSuggestionViewFactory;

.field final synthetic val$childPosition:I

.field final synthetic val$listener:Lcom/miui/gallery/search/core/display/OnActionClickListener;

.field final synthetic val$suggestion:Lcom/miui/gallery/search/core/suggestion/Suggestion;


# direct methods
.method constructor <init>(Lcom/miui/gallery/search/suggestionpage/SearchSuggestionViewFactory;Lcom/miui/gallery/search/core/suggestion/Suggestion;Lcom/miui/gallery/search/core/display/OnActionClickListener;I)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/suggestionpage/SearchSuggestionViewFactory$1;->this$0:Lcom/miui/gallery/search/suggestionpage/SearchSuggestionViewFactory;

    iput-object p2, p0, Lcom/miui/gallery/search/suggestionpage/SearchSuggestionViewFactory$1;->val$suggestion:Lcom/miui/gallery/search/core/suggestion/Suggestion;

    iput-object p3, p0, Lcom/miui/gallery/search/suggestionpage/SearchSuggestionViewFactory$1;->val$listener:Lcom/miui/gallery/search/core/display/OnActionClickListener;

    iput p4, p0, Lcom/miui/gallery/search/suggestionpage/SearchSuggestionViewFactory$1;->val$childPosition:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 7

    const-string v0, "from_suggestion"

    iget-object v1, p0, Lcom/miui/gallery/search/suggestionpage/SearchSuggestionViewFactory$1;->val$suggestion:Lcom/miui/gallery/search/core/suggestion/Suggestion;

    check-cast v1, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;

    invoke-interface {v1}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getSectionType()Lcom/miui/gallery/search/SearchConstants$SectionType;

    move-result-object v1

    sget-object v2, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_GUIDE:Lcom/miui/gallery/search/SearchConstants$SectionType;

    if-ne v1, v2, :cond_0

    const-string v0, "from_guide"

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/search/suggestionpage/SearchSuggestionViewFactory$1;->val$suggestion:Lcom/miui/gallery/search/core/suggestion/Suggestion;

    check-cast v1, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;

    const/4 v2, 0x0

    const-string v3, "from"

    const-string v4, "sectionType"

    filled-new-array {v3, v4}, [Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    const/4 v0, 0x1

    invoke-interface {v1}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getSectionTypeString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v0

    invoke-static {v2, v3, v4}, Lcom/miui/gallery/search/statistics/SearchStatUtils;->buildSearchEventExtras(Landroid/os/Bundle;[Ljava/lang/String;[Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/search/suggestionpage/SearchSuggestionViewFactory$1;->val$listener:Lcom/miui/gallery/search/core/display/OnActionClickListener;

    iget-object v3, p0, Lcom/miui/gallery/search/suggestionpage/SearchSuggestionViewFactory$1;->this$0:Lcom/miui/gallery/search/suggestionpage/SearchSuggestionViewFactory;

    iget v4, p0, Lcom/miui/gallery/search/suggestionpage/SearchSuggestionViewFactory$1;->val$childPosition:I

    invoke-static {v3, v1, v4}, Lcom/miui/gallery/search/suggestionpage/SearchSuggestionViewFactory;->access$000(Lcom/miui/gallery/search/suggestionpage/SearchSuggestionViewFactory;Lcom/miui/gallery/search/core/suggestion/SuggestionSection;I)Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object v1

    invoke-interface {v2, p1, v5, v1, v0}, Lcom/miui/gallery/search/core/display/OnActionClickListener;->onClick(Landroid/view/View;ILjava/lang/Object;Landroid/os/Bundle;)V

    return-void
.end method
