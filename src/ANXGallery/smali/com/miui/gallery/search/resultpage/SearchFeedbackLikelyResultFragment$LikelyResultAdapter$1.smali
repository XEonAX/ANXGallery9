.class Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$LikelyResultAdapter$1;
.super Ljava/lang/Object;
.source "SearchFeedbackLikelyResultFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$LikelyResultAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$LikelyResultAdapter;

.field final synthetic val$checkable:Lcom/miui/gallery/ui/CheckableView;

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$LikelyResultAdapter;ILcom/miui/gallery/ui/CheckableView;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$LikelyResultAdapter$1;->this$1:Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$LikelyResultAdapter;

    iput p2, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$LikelyResultAdapter$1;->val$position:I

    iput-object p3, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$LikelyResultAdapter$1;->val$checkable:Lcom/miui/gallery/ui/CheckableView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$LikelyResultAdapter$1;->this$1:Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$LikelyResultAdapter;

    iget-object p1, p1, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$LikelyResultAdapter;->this$0:Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;

    iget v0, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$LikelyResultAdapter$1;->val$position:I

    invoke-static {p1, v0}, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->access$100(Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;I)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$LikelyResultAdapter$1;->this$1:Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$LikelyResultAdapter;

    iget-object v0, v0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$LikelyResultAdapter;->this$0:Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;

    invoke-static {v0}, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->access$200(Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;)Landroid/util/LongSparseArray;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$LikelyResultAdapter$1;->this$1:Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$LikelyResultAdapter;

    iget-object v1, v1, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$LikelyResultAdapter;->this$0:Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;

    iget-object v1, v1, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    iget v2, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$LikelyResultAdapter$1;->val$position:I

    invoke-virtual {v1, v2}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getItemId(I)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Landroid/util/LongSparseArray;->delete(J)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$LikelyResultAdapter$1;->this$1:Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$LikelyResultAdapter;

    iget-object v0, v0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$LikelyResultAdapter;->this$0:Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;

    invoke-static {v0}, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->access$200(Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;)Landroid/util/LongSparseArray;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$LikelyResultAdapter$1;->this$1:Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$LikelyResultAdapter;

    iget-object v1, v1, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$LikelyResultAdapter;->this$0:Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;

    iget-object v1, v1, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    iget v2, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$LikelyResultAdapter$1;->val$position:I

    invoke-virtual {v1, v2}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getItemId(I)J

    move-result-wide v1

    iget v3, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$LikelyResultAdapter$1;->val$position:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$LikelyResultAdapter$1;->val$checkable:Lcom/miui/gallery/ui/CheckableView;

    xor-int/lit8 p1, p1, 0x1

    invoke-interface {v0, p1}, Lcom/miui/gallery/ui/CheckableView;->setChecked(Z)V

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$LikelyResultAdapter$1;->this$1:Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$LikelyResultAdapter;

    iget-object p1, p1, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$LikelyResultAdapter;->this$0:Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;

    invoke-static {p1}, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->access$300(Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;)V

    return-void
.end method
