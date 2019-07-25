.class Lcom/miui/gallery/ui/VideoResultPickFragment$3;
.super Ljava/lang/Object;
.source "VideoResultPickFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/VideoResultPickFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/VideoResultPickFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/VideoResultPickFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/VideoResultPickFragment$3;->this$0:Lcom/miui/gallery/ui/VideoResultPickFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 9

    iget-object p1, p0, Lcom/miui/gallery/ui/VideoResultPickFragment$3;->this$0:Lcom/miui/gallery/ui/VideoResultPickFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/VideoResultPickFragment;->access$200(Lcom/miui/gallery/ui/VideoResultPickFragment;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItemIds()[J

    move-result-object v8

    if-eqz v8, :cond_0

    array-length p1, v8

    if-lez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/VideoResultPickFragment$3;->this$0:Lcom/miui/gallery/ui/VideoResultPickFragment;

    iget-object v0, p1, Lcom/miui/gallery/ui/VideoResultPickFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const-string v1, "VideoResultPickFragmentDeleteMediaDialogFragment"

    new-instance v2, Lcom/miui/gallery/ui/VideoResultPickFragment$3$1;

    invoke-direct {v2, p0}, Lcom/miui/gallery/ui/VideoResultPickFragment$3$1;-><init>(Lcom/miui/gallery/ui/VideoResultPickFragment$3;)V

    const-wide/16 v3, -0x1

    const-string v5, ""

    const/4 v6, 0x0

    const/16 v7, 0x2f

    invoke-static/range {v0 .. v8}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->delete(Landroid/app/Activity;Ljava/lang/String;Lcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;JLjava/lang/String;II[J)V

    :cond_0
    return-void
.end method
