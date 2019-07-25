.class Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$2;
.super Ljava/lang/Object;
.source "SearchFeedbackLikelyResultFragment.java"

# interfaces
.implements Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$OnFeedbackCompleteListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->report()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$2;->this$0:Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(I)V
    .locals 1

    if-lez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$2;->this$0:Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;

    invoke-static {p1}, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->access$000(Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object p1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/activity/BaseActivity;->setResult(I)V

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$2;->this$0:Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->finish()V

    :cond_0
    return-void
.end method
