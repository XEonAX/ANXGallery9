.class Lcom/miui/gallery/search/resultpage/SearchResultFragment$1;
.super Lcom/miui/gallery/search/core/display/DefaultActionClickListener;
.source "SearchResultFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/search/resultpage/SearchResultFragment;->genFeedbackTaskModeActionClickListener()Lcom/miui/gallery/search/core/display/OnActionClickListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/search/resultpage/SearchResultFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/search/resultpage/SearchResultFragment;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment$1;->this$0:Lcom/miui/gallery/search/resultpage/SearchResultFragment;

    invoke-direct {p0, p2}, Lcom/miui/gallery/search/core/display/DefaultActionClickListener;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected handleUri(Landroid/app/Activity;Landroid/net/Uri;Landroid/os/Bundle;)V
    .locals 2

    invoke-virtual {p2}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p2

    const-string v0, "inFeedbackTaskMode"

    iget-object v1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment$1;->this$0:Lcom/miui/gallery/search/resultpage/SearchResultFragment;

    iget-boolean v1, v1, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mInFeedbackTaskMode:Z

    invoke-static {v1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p2

    invoke-virtual {p2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p2

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/search/core/display/DefaultActionClickListener;->handleUri(Landroid/app/Activity;Landroid/net/Uri;Landroid/os/Bundle;)V

    return-void
.end method
