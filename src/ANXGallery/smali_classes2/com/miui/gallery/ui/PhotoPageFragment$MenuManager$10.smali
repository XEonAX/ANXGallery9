.class Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$10;
.super Ljava/lang/Object;
.source "PhotoPageFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->doDelete(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;

.field final synthetic val$current:Lcom/miui/gallery/model/BaseDataItem;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$10;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$10;->val$current:Lcom/miui/gallery/model/BaseDataItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDeleted(I[J)V
    .locals 2

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$10;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;

    iget-object p2, p2, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p2, p2, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    if-nez p2, :cond_0

    return-void

    :cond_0
    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$10;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;

    iget-object p2, p2, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {p2}, Lcom/miui/gallery/ui/PhotoPageFragment;->onContentChanged()V

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$10;->val$current:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataItem;->getSpecialTypeFlags()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/miui/extraphoto/sdk/ExtraPhotoSDK;->sendDeletePhotoStatic(J)V

    if-lez p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$10;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/miui/gallery/util/SoundUtils;->playSoundForOperation(Landroid/content/Context;I)V

    goto :goto_0

    :cond_1
    const/16 p2, -0x70

    if-ne p1, p2, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager$10;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/DocumentProviderUtils;->startExtSDCardPermissionActivityForResult(Landroid/app/Activity;)V

    :cond_2
    :goto_0
    return-void
.end method
