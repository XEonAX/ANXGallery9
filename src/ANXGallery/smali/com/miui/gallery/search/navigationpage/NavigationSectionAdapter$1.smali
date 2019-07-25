.class Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter$1;
.super Ljava/lang/Object;
.source "NavigationSectionAdapter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;

.field final synthetic val$convertPosition:I


# direct methods
.method constructor <init>(Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;I)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter$1;->this$0:Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;

    iput p2, p0, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter$1;->val$convertPosition:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter$1;->this$0:Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;

    iget-object v0, v0, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->mActionClickListener:Lcom/miui/gallery/search/core/display/OnActionClickListener;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    const-string v1, "from"

    const-string v2, "sectionType"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    iget-object v3, p0, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter$1;->this$0:Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;

    iget-object v3, v3, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->mFrom:Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const/4 v3, 0x1

    iget-object v5, p0, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter$1;->this$0:Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;

    iget-object v5, v5, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->mSection:Lcom/miui/gallery/search/core/suggestion/SuggestionSection;

    invoke-interface {v5}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getSectionTypeString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v3

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/search/statistics/SearchStatUtils;->buildSearchEventExtras(Landroid/os/Bundle;[Ljava/lang/String;[Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter$1;->this$0:Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;

    iget-object v1, v1, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->mActionClickListener:Lcom/miui/gallery/search/core/display/OnActionClickListener;

    iget-object v2, p0, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter$1;->this$0:Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;

    iget v3, p0, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter$1;->val$convertPosition:I

    invoke-virtual {v2, v3}, Lcom/miui/gallery/search/navigationpage/NavigationSectionAdapter;->getItem(I)Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object v2

    invoke-interface {v1, p1, v4, v2, v0}, Lcom/miui/gallery/search/core/display/OnActionClickListener;->onClick(Landroid/view/View;ILjava/lang/Object;Landroid/os/Bundle;)V

    return-void
.end method
