.class Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1;
.super Ljava/lang/Object;
.source "SimilarPhotoPickFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/SimilarPhotoPickFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/SimilarPhotoPickFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 9

    iget-object p1, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment;->access$000(Lcom/miui/gallery/ui/SimilarPhotoPickFragment;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItemIds()[J

    move-result-object v8

    if-eqz v8, :cond_0

    array-length p1, v8

    if-lez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    iget-object v0, p1, Lcom/miui/gallery/ui/SimilarPhotoPickFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const-string v1, "SimilarPhotoPickFragmentDeleteMediaDialogFragment"

    new-instance v2, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1$1;

    invoke-direct {v2, p0}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1$1;-><init>(Lcom/miui/gallery/ui/SimilarPhotoPickFragment$1;)V

    const-wide/16 v3, -0x1

    const-string v5, ""

    const/4 v6, 0x0

    const/16 v7, 0x30

    invoke-static/range {v0 .. v8}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->delete(Landroid/app/Activity;Ljava/lang/String;Lcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;JLjava/lang/String;II[J)V

    :cond_0
    return-void
.end method
