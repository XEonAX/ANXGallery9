.class Lcom/miui/gallery/ui/FacePageFragment$18;
.super Ljava/lang/Object;
.source "FacePageFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/FacePageFragment;->doDelete(Landroid/view/ActionMode;[J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/FacePageFragment;

.field final synthetic val$mode:Landroid/view/ActionMode;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/FacePageFragment;Landroid/view/ActionMode;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$18;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    iput-object p2, p0, Lcom/miui/gallery/ui/FacePageFragment$18;->val$mode:Landroid/view/ActionMode;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDeleted(I[J)V
    .locals 5

    iget-object p2, p0, Lcom/miui/gallery/ui/FacePageFragment$18;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    iget-object p2, p2, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    if-nez p2, :cond_0

    return-void

    :cond_0
    iget-object p2, p0, Lcom/miui/gallery/ui/FacePageFragment$18;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/FacePageFragment;->access$3100(Lcom/miui/gallery/ui/FacePageFragment;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    move-result-object p2

    invoke-virtual {p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItemIds()[J

    move-result-object p2

    invoke-static {p2}, Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;->ignoreFaces([J)V

    iget-object p2, p0, Lcom/miui/gallery/ui/FacePageFragment$18;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    iget-object p2, p2, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment$18;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    const v1, 0x7f1002f6

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/ui/FacePageFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    if-lez p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$18;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {p1, v4}, Lcom/miui/gallery/util/SoundUtils;->playSoundForOperation(Landroid/content/Context;I)V

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$18;->val$mode:Landroid/view/ActionMode;

    invoke-virtual {p1}, Landroid/view/ActionMode;->finish()V

    const-string p1, "face"

    const-string p2, "face_delete"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
