.class Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$LikelyResultAdapter;
.super Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;
.source "SearchFeedbackLikelyResultFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LikelyResultAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$LikelyResultAdapter;->this$0:Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;

    invoke-direct {p0, p2}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    instance-of p3, p2, Lcom/miui/gallery/ui/CheckableView;

    if-eqz p3, :cond_0

    move-object p3, p2

    check-cast p3, Lcom/miui/gallery/ui/CheckableView;

    const/4 v0, 0x1

    invoke-interface {p3, v0}, Lcom/miui/gallery/ui/CheckableView;->setCheckable(Z)V

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$LikelyResultAdapter;->this$0:Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;

    invoke-static {v0, p1}, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->access$100(Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;I)Z

    move-result v0

    invoke-interface {p3, v0}, Lcom/miui/gallery/ui/CheckableView;->setChecked(Z)V

    new-instance v0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$LikelyResultAdapter$1;

    invoke-direct {v0, p0, p1, p3}, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$LikelyResultAdapter$1;-><init>(Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$LikelyResultAdapter;ILcom/miui/gallery/ui/CheckableView;)V

    invoke-interface {p3, v0}, Lcom/miui/gallery/ui/CheckableView;->setCheckableListener(Landroid/view/View$OnClickListener;)V

    :cond_0
    return-object p2
.end method
