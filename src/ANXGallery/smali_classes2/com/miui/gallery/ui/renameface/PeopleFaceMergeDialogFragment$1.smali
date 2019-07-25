.class Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$1;
.super Ljava/lang/Object;
.source "PeopleFaceMergeDialogFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/renameface/FolderItemsLoader$LoaderUpdatedItems;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;->initPagerLoader(Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$1;->this$0:Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLoaderUpdatedItems()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$1;->this$0:Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$1;->this$0:Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;->access$300(Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;)Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PeoplePagerAdapter;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$1;->this$0:Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;->access$200(Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment;)Lcom/miui/gallery/ui/renameface/FolderItemsLoader;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/ui/renameface/FolderItemsLoader;->unblockGetItems()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/renameface/PeopleFaceMergeDialogFragment$PeoplePagerAdapter;->updateItems(Ljava/util/ArrayList;)V

    :cond_0
    return-void
.end method
