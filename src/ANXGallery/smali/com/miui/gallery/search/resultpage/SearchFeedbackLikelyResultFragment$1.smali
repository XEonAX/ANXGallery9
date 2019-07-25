.class Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$1;
.super Ljava/lang/Object;
.source "SearchFeedbackLikelyResultFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->onInflateView(Landroid/view/View;Landroid/os/Bundle;Landroid/net/Uri;)V
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

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$1;->this$0:Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    iget-object p2, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$1;->this$0:Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;

    const-string p4, "from_likely_image_result"

    invoke-virtual {p2, p1, p3, p4}, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->goToPhotoPage(Landroid/widget/AdapterView;ILjava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$1;->this$0:Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->getPageName()Ljava/lang/String;

    move-result-object p1

    const-string p2, "click_micro_thumb"

    int-to-long p3, p3

    invoke-static {p1, p2, p3, p4}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    return-void
.end method
