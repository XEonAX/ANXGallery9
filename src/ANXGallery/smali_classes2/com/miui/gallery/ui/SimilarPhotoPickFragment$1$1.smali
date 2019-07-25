.class Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1$1;
.super Ljava/lang/Object;
.source "SimilarPhotoPickFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1$1;->this$1:Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDeleted(I[J)V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1$1;->this$1:Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1;

    iget-object v0, v0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1$1;->this$1:Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1;

    iget-object v0, v0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v1, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1$1;->this$1:Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1;

    iget-object v1, v1, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    const v2, 0x7f1002f6

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v1, v2, v3}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    if-lez p1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1$1;->this$1:Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1;

    iget-object v0, v0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0, v5}, Lcom/miui/gallery/util/SoundUtils;->playSoundForOperation(Landroid/content/Context;I)V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1$1;->this$1:Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1;

    iget-object v0, v0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment;->access$000(Lcom/miui/gallery/ui/SimilarPhotoPickFragment;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    move-result-object v0

    invoke-virtual {v0, v5}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setAllItemsCheckState(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1$1;->this$1:Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1;

    iget-object v0, v0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment;->access$100(Lcom/miui/gallery/ui/SimilarPhotoPickFragment;)Lmiui/widget/SlidingButton;

    move-result-object v0

    invoke-virtual {v0, v5}, Lmiui/widget/SlidingButton;->setChecked(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1$1;->this$1:Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1;

    iget-object v0, v0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment;->access$200(Lcom/miui/gallery/ui/SimilarPhotoPickFragment;)Lcom/miui/gallery/cleaner/SimilarScanner;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/miui/gallery/cleaner/SimilarScanner;->removeItems([J)V

    iget-object p2, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1$1;->this$1:Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1;

    iget-object p2, p2, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment;->access$300(Lcom/miui/gallery/ui/SimilarPhotoPickFragment;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1$1;->this$1:Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1;

    iget-object p2, p2, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment;->access$400(Lcom/miui/gallery/ui/SimilarPhotoPickFragment;)Ljava/util/List;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    if-gtz p2, :cond_2

    iget-object p2, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1$1;->this$1:Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1;

    iget-object p2, p2, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment;->access$200(Lcom/miui/gallery/ui/SimilarPhotoPickFragment;)Lcom/miui/gallery/cleaner/SimilarScanner;

    move-result-object p2

    invoke-virtual {p2}, Lcom/miui/gallery/cleaner/SimilarScanner;->isLoadingValid()Z

    move-result p2

    if-nez p2, :cond_2

    iget-object p2, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1$1;->this$1:Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1;

    iget-object p2, p2, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    iget-object p2, p2, Lcom/miui/gallery/ui/SimilarPhotoPickFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p2}, Lcom/miui/gallery/activity/BaseActivity;->finish()V

    :cond_2
    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    const-string v0, "deleteCount"

    int-to-float p1, p1

    sget-object v1, Lcom/miui/gallery/ui/SimilarPhotoPickFragment;->DELETE_COUNT_STAGE:[I

    invoke-static {p1, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->formatValueStage(F[I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "cleaner"

    const-string v0, "cleaner_similar_used"

    invoke-static {p1, v0, p2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method
