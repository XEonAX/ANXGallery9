.class Lcom/miui/gallery/ui/AddPhotosFragment$1;
.super Ljava/lang/Object;
.source "AddPhotosFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/CopyOrMoveDialog$OnOperationSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/AddPhotosFragment;->doAddPhotos([J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/AddPhotosFragment;

.field final synthetic val$ids:[J


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/AddPhotosFragment;[J)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/AddPhotosFragment$1;->this$0:Lcom/miui/gallery/ui/AddPhotosFragment;

    iput-object p2, p0, Lcom/miui/gallery/ui/AddPhotosFragment$1;->val$ids:[J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onOperationSelected(I)V
    .locals 9

    iget-object v0, p0, Lcom/miui/gallery/ui/AddPhotosFragment$1;->this$0:Lcom/miui/gallery/ui/AddPhotosFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/AddPhotosFragment;->getParentFragment()Landroid/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    if-eqz v1, :cond_0

    packed-switch p1, :pswitch_data_0

    invoke-virtual {v0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    iget-object p1, p0, Lcom/miui/gallery/ui/AddPhotosFragment$1;->this$0:Lcom/miui/gallery/ui/AddPhotosFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/AddPhotosFragment;->access$000(Lcom/miui/gallery/ui/AddPhotosFragment;)J

    move-result-wide v2

    iget-object v4, p0, Lcom/miui/gallery/ui/AddPhotosFragment$1;->val$ids:[J

    const/4 v5, 0x0

    const/4 v6, 0x1

    const/4 v7, 0x0

    invoke-static/range {v1 .. v7}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->show(Landroid/app/Activity;J[JIZLcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/AddPhotosFragment$1;->this$0:Lcom/miui/gallery/ui/AddPhotosFragment;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/miui/gallery/ui/AddPhotosFragment;->access$100(Lcom/miui/gallery/ui/AddPhotosFragment;Z)V

    goto :goto_0

    :pswitch_0
    invoke-virtual {v0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    iget-object p1, p0, Lcom/miui/gallery/ui/AddPhotosFragment$1;->this$0:Lcom/miui/gallery/ui/AddPhotosFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/AddPhotosFragment;->access$000(Lcom/miui/gallery/ui/AddPhotosFragment;)J

    move-result-wide v3

    iget-object v5, p0, Lcom/miui/gallery/ui/AddPhotosFragment$1;->val$ids:[J

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-static/range {v2 .. v8}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->show(Landroid/app/Activity;J[JIZLcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/AddPhotosFragment$1;->this$0:Lcom/miui/gallery/ui/AddPhotosFragment;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/miui/gallery/ui/AddPhotosFragment;->access$100(Lcom/miui/gallery/ui/AddPhotosFragment;Z)V

    :cond_0
    :goto_0
    :pswitch_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
