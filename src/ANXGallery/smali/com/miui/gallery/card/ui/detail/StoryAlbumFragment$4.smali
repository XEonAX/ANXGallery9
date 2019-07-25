.class Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;
.super Ljava/lang/Object;
.source "StoryAlbumFragment.java"

# interfaces
.implements Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private mRemove:Landroid/view/MenuItem;

.field private mShare:Landroid/view/MenuItem;

.field final synthetic this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private gotoPreviewSelectPage(Ljava/util/ArrayList;Ljava/util/ArrayList;I)V
    .locals 17
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;I)V"
        }
    .end annotation

    move-object/from16 v0, p0

    move/from16 v11, p3

    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-nez v1, :cond_0

    return-void

    :cond_0
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v12, v1, [I

    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v13, v1, [J

    const/4 v1, 0x0

    :goto_0
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    move-object/from16 v2, p1

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    aput v3, v12, v1

    move-object/from16 v3, p2

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    aput-wide v4, v13, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    new-instance v14, Lcom/miui/gallery/model/ImageLoadParams;

    iget-object v1, v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$400(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;

    move-result-object v1

    invoke-virtual {v1, v11}, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->getItemKey(I)J

    move-result-wide v2

    iget-object v1, v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$400(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;

    move-result-object v1

    invoke-virtual {v1, v11}, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->getLocalPath(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v1

    iget-object v5, v1, Lcom/miui/gallery/Config$ThumbConfig;->sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    iget-object v1, v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$400(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;

    move-result-object v1

    invoke-virtual {v1, v11}, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->getItemDecodeRectF(I)Landroid/graphics/RectF;

    move-result-object v6

    iget-object v1, v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$400(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;

    move-result-object v1

    invoke-virtual {v1, v11}, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->getMimeType(I)Ljava/lang/String;

    move-result-object v8

    iget-object v1, v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$400(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;

    move-result-object v1

    invoke-virtual {v1, v11}, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->getFileLength(I)J

    move-result-wide v9

    move-object v1, v14

    move/from16 v7, p3

    invoke-direct/range {v1 .. v10}, Lcom/miui/gallery/model/ImageLoadParams;-><init>(JLjava/lang/String;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ILjava/lang/String;J)V

    iget-object v1, v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    iget-object v2, v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v2}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$2300(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Landroid/net/Uri;

    move-result-object v2

    iget-object v3, v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v3}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$400(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;

    move-result-object v3

    invoke-virtual {v3}, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->getItemCount()I

    move-result v4

    iget-object v3, v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v3}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$600(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Ljava/lang/String;

    move-result-object v5

    iget-object v3, v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v3}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$700(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)[Ljava/lang/String;

    move-result-object v6

    iget-object v3, v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v3}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$800(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Ljava/lang/String;

    move-result-object v7

    const/4 v15, 0x0

    const/16 v16, 0x0

    move/from16 v3, p3

    move-object v8, v14

    move-object v9, v13

    move-object v10, v12

    move-object v11, v15

    move-object/from16 v12, v16

    invoke-static/range {v1 .. v12}, Lcom/miui/gallery/util/IntentUtil;->gotoPreviewSelectPage(Lcom/miui/gallery/ui/BaseMediaFragment;Landroid/net/Uri;IILjava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/model/ImageLoadParams;[J[ILjava/lang/String;Ljava/lang/String;)V

    iget-object v1, v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$3400(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->stopActionMode()V

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "scenarioId"

    iget-object v3, v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v3}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$3700(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/Card;

    move-result-object v3

    invoke-virtual {v3}, Lcom/miui/gallery/card/Card;->getScenarioId()I

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "assistant"

    const-string v3, "assistant_card_share_photos"

    invoke-static {v2, v3, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method private removeItemByIds(Ljava/util/ArrayList;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    new-instance v1, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4$2;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4$2;-><init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;Ljava/util/ArrayList;)V

    new-instance v2, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4$3;

    invoke-direct {v2, p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4$3;-><init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;)V

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$3800(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v0

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    const v3, 0x7f1006b8

    invoke-virtual {p1, v3}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    const v4, 0x7f1006b6

    invoke-virtual {p1, v4}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    const v5, 0x7f1006b7

    invoke-virtual {p1, v5}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/high16 v6, 0x1040000

    invoke-static/range {v0 .. v6}, Lcom/miui/gallery/util/DialogUtil;->showConfirmAlertWithCancel(Landroid/content/Context;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;Ljava/lang/String;Ljava/lang/CharSequence;Ljava/lang/String;I)Landroid/app/AlertDialog;

    return-void
.end method

.method private updateMenuState()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$3400(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->getCheckedItemCount()I

    move-result v0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->mShare:Landroid/view/MenuItem;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->mRemove:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->mShare:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->mRemove:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    :goto_0
    return-void
.end method


# virtual methods
.method public onActionItemClicked(Landroid/view/ActionMode;Landroid/view/MenuItem;)Z
    .locals 10

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$3400(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->getCheckedItemPositions()Landroid/util/SparseBooleanArray;

    move-result-object p1

    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {p1}, Landroid/util/SparseBooleanArray;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v1, Ljava/util/ArrayList;

    invoke-virtual {p1}, Landroid/util/SparseBooleanArray;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v2, Ljava/util/ArrayList;

    invoke-virtual {p1}, Landroid/util/SparseBooleanArray;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    const v3, 0x7fffffff

    const/4 v4, 0x0

    const/4 v5, 0x0

    const v6, 0x7fffffff

    :goto_0
    invoke-virtual {p1}, Landroid/util/SparseBooleanArray;->size()I

    move-result v7

    if-ge v5, v7, :cond_1

    invoke-virtual {p1, v5}, Landroid/util/SparseBooleanArray;->keyAt(I)I

    move-result v7

    invoke-virtual {p1, v7}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v8

    if-eqz v8, :cond_0

    iget-object v8, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v8}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$300(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$StoryAlbumAdapterWrapper;

    move-result-object v8

    invoke-virtual {v8, v7}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$StoryAlbumAdapterWrapper;->getWrappedAdapterPosition(I)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v8, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v8}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$400(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;

    move-result-object v8

    invoke-virtual {v8, v7}, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->getSha1(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v1, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v8, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v8}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$400(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;

    move-result-object v8

    invoke-virtual {v8, v7}, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->getItemKey(I)J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    if-ge v7, v6, :cond_0

    move v6, v7

    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_1
    if-ne v6, v3, :cond_2

    const/4 v6, 0x0

    :cond_2
    invoke-interface {p2}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const p2, 0x7f090018

    if-eq p1, p2, :cond_4

    const p2, 0x7f090022

    if-eq p1, p2, :cond_3

    return v4

    :cond_3
    invoke-direct {p0, v0, v2, v6}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->gotoPreviewSelectPage(Ljava/util/ArrayList;Ljava/util/ArrayList;I)V

    goto :goto_1

    :cond_4
    invoke-direct {p0, v1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->removeItemByIds(Ljava/util/ArrayList;)V

    :goto_1
    const/4 p1, 0x1

    return p1
.end method

.method public onAllItemsCheckedStateChanged(Landroid/view/ActionMode;Z)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->updateMenuState()V

    return-void
.end method

.method public onCreateActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {v0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$2700(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/BuildUtil;->isMiuiSdkGte15(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    const v0, 0x7f0c0011

    goto :goto_0

    :cond_0
    const v0, 0x7f0c000b

    :goto_0
    invoke-virtual {p1}, Landroid/view/ActionMode;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object p1

    invoke-virtual {p1, v0, p2}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    const p1, 0x7f090018

    invoke-interface {p2, p1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->mRemove:Landroid/view/MenuItem;

    const p1, 0x7f090022

    invoke-interface {p2, p1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->mShare:Landroid/view/MenuItem;

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->updateMenuState()V

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    const/4 p2, 0x1

    invoke-static {p1, p2}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$2802(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;Z)Z

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$2900(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object p1

    new-instance v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4$1;-><init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;)V

    invoke-virtual {p1, v0}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$3200(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->access$3300(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;)V

    return p2
.end method

.method public onDestroyActionMode(Landroid/view/ActionMode;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$2802(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;Z)Z

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$2900(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object p1

    new-instance v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4$4;

    invoke-direct {v0, p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4$4;-><init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;)V

    invoke-virtual {p1, v0}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->this$0:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-static {p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->access$3200(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->access$3300(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;)V

    return-void
.end method

.method public onItemCheckedStateChanged(Landroid/view/ActionMode;IJZ)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;->updateMenuState()V

    return-void
.end method

.method public onPrepareActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method
