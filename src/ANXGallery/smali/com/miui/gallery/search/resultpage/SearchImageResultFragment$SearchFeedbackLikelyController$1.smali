.class Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController$1;
.super Ljava/lang/Object;
.source "SearchImageResultFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;->showLikelyBar()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;


# direct methods
.method constructor <init>(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController$1;->this$1:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    sget-object p1, Lcom/miui/gallery/provider/GalleryContract$Search;->URI_LIKELY_RESULT_PAGE:Landroid/net/Uri;

    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p1

    const-string v0, "title"

    iget-object v1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController$1;->this$1:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;

    iget-object v1, v1, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    iget-object v1, v1, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mQueryText:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    const-string v0, "tagName"

    iget-object v1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController$1;->this$1:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;

    iget-object v1, v1, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    iget-object v1, v1, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mQueryText:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    new-instance v0, Landroid/os/Bundle;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/os/Bundle;-><init>(I)V

    const-string v1, "start_activity_for_result"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v1, "request_code"

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "from"

    const-string v2, "from_image_result"

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController$1;->this$1:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;

    iget-object v1, v1, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    invoke-static {v1}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->access$200(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v1

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    invoke-static {v1, p1, v0}, Lcom/miui/gallery/util/ActionURIHandler;->handleUri(Landroid/app/Activity;Landroid/net/Uri;Landroid/os/Bundle;)V

    return-void
.end method
