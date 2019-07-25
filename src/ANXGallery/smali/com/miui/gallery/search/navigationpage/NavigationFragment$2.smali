.class Lcom/miui/gallery/search/navigationpage/NavigationFragment$2;
.super Lcom/miui/gallery/search/core/resultprocessor/SectionedResultProcessor;
.source "NavigationFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/search/navigationpage/NavigationFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/search/navigationpage/NavigationFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/search/navigationpage/NavigationFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/navigationpage/NavigationFragment$2;->this$0:Lcom/miui/gallery/search/navigationpage/NavigationFragment;

    invoke-direct {p0}, Lcom/miui/gallery/search/core/resultprocessor/SectionedResultProcessor;-><init>()V

    return-void
.end method


# virtual methods
.method protected getIndependentSection(Ljava/util/HashSet;Lcom/miui/gallery/search/core/suggestion/SuggestionSection;)Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/miui/gallery/search/core/suggestion/SuggestionSection;",
            ")",
            "Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;"
        }
    .end annotation

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/search/core/resultprocessor/SectionedResultProcessor;->getIndependentSection(Ljava/util/HashSet;Lcom/miui/gallery/search/core/suggestion/SuggestionSection;)Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;

    move-result-object p1

    sget-object p2, Lcom/miui/gallery/search/navigationpage/NavigationFragment$5;->$SwitchMap$com$miui$gallery$search$SearchConstants$SectionType:[I

    invoke-virtual {p1}, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->getSectionType()Lcom/miui/gallery/search/SearchConstants$SectionType;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/search/SearchConstants$SectionType;->ordinal()I

    move-result v0

    aget p2, p2, v0

    packed-switch p2, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-virtual {p1}, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->moveToMore()Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object p2

    if-nez p2, :cond_0

    invoke-static {}, Lcom/miui/gallery/search/SearchConfig;->get()Lcom/miui/gallery/search/SearchConfig;

    move-result-object p2

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1}, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->getSectionType()Lcom/miui/gallery/search/SearchConstants$SectionType;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p2, v0, v1, v2}, Lcom/miui/gallery/search/SearchConfig;->getDefaultMoreItem(Landroid/content/Context;Lcom/miui/gallery/search/SearchConstants$SectionType;Z)Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;->setSectionMoreItem(Lcom/miui/gallery/search/core/suggestion/Suggestion;)V

    :cond_0
    :goto_0
    return-object p1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
