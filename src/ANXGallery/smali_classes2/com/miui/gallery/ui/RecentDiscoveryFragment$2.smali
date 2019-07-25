.class Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;
.super Ljava/lang/Object;
.source "RecentDiscoveryFragment.java"

# interfaces
.implements Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/RecentDiscoveryFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private mAddToAlbum:Landroid/view/MenuItem;

.field private mCreativity:Landroid/view/MenuItem;

.field private mDelete:Landroid/view/MenuItem;

.field private mMode:Landroid/view/ActionMode;

.field private mSend:Landroid/view/MenuItem;

.field final synthetic this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/RecentDiscoveryFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private isMenuItemVisible(Landroid/view/MenuItem;)Z
    .locals 0

    if-eqz p1, :cond_0

    invoke-interface {p1}, Landroid/view/MenuItem;->isVisible()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public static synthetic lambda$onActionItemClicked$15(Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;[JZ)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->mMode:Landroid/view/ActionMode;

    invoke-virtual {p1}, Landroid/view/ActionMode;->finish()V

    return-void
.end method

.method private updateMenuState()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItemCount()I

    move-result v0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->mDelete:Landroid/view/MenuItem;

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->isMenuItemVisible(Landroid/view/MenuItem;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->mDelete:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->mAddToAlbum:Landroid/view/MenuItem;

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->isMenuItemVisible(Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->mAddToAlbum:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->mCreativity:Landroid/view/MenuItem;

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->isMenuItemVisible(Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->mCreativity:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->mSend:Landroid/view/MenuItem;

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->isMenuItemVisible(Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->mSend:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->mDelete:Landroid/view/MenuItem;

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->isMenuItemVisible(Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->mDelete:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    :cond_4
    iget-object v0, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->mAddToAlbum:Landroid/view/MenuItem;

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->isMenuItemVisible(Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->mAddToAlbum:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    :cond_5
    iget-object v0, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->mCreativity:Landroid/view/MenuItem;

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->isMenuItemVisible(Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->mCreativity:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    :cond_6
    iget-object v0, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->mSend:Landroid/view/MenuItem;

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->isMenuItemVisible(Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->mSend:Landroid/view/MenuItem;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    :cond_7
    :goto_0
    return-void
.end method


# virtual methods
.method public onActionItemClicked(Landroid/view/ActionMode;Landroid/view/MenuItem;)Z
    .locals 21

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-interface/range {p2 .. p2}, Landroid/view/MenuItem;->getItemId()I

    move-result v2

    const v3, 0x7f090017

    const/4 v4, 0x0

    if-eq v2, v3, :cond_8

    const v3, 0x7f09001d

    if-eq v2, v3, :cond_2

    const v3, 0x7f090026

    if-eq v2, v3, :cond_1

    const v3, 0x7f0900c6

    if-eq v2, v3, :cond_0

    return v4

    :cond_0
    iget-object v2, v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-static {v2, v1}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->access$300(Lcom/miui/gallery/ui/RecentDiscoveryFragment;Landroid/view/ActionMode;)V

    const-string v1, "recent_album"

    const-string v2, "delete_photo"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    :cond_1
    iget-object v1, v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    iget-object v5, v1, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    new-instance v6, Lcom/miui/gallery/ui/-$$Lambda$RecentDiscoveryFragment$2$DF4ZlNEDGYk1N9logNmEMCaHz5s;

    invoke-direct {v6, v0}, Lcom/miui/gallery/ui/-$$Lambda$RecentDiscoveryFragment$2$DF4ZlNEDGYk1N9logNmEMCaHz5s;-><init>(Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;)V

    const/4 v7, 0x0

    const/4 v8, 0x1

    const/4 v9, 0x1

    iget-object v1, v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->isCheckedItemContainVideo()Z

    move-result v10

    iget-object v1, v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItemIds()[J

    move-result-object v11

    invoke-static/range {v5 .. v11}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->addToAlbum(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;IZZZ[J)V

    const-string v1, "recent_album"

    const-string v2, "add_to_album"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    :cond_2
    iget-object v2, v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    iget-object v2, v2, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {v2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItemPositions()Landroid/util/SparseBooleanArray;

    move-result-object v2

    new-instance v3, Ljava/util/ArrayList;

    invoke-virtual {v2}, Landroid/util/SparseBooleanArray;->size()I

    move-result v5

    invoke-direct {v3, v5}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v5, Ljava/util/ArrayList;

    invoke-virtual {v2}, Landroid/util/SparseBooleanArray;->size()I

    move-result v6

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(I)V

    const v6, 0x7fffffff

    const/4 v7, 0x0

    const v8, 0x7fffffff

    :goto_0
    invoke-virtual {v2}, Landroid/util/SparseBooleanArray;->size()I

    move-result v9

    if-ge v7, v9, :cond_4

    invoke-virtual {v2, v7}, Landroid/util/SparseBooleanArray;->keyAt(I)I

    move-result v9

    invoke-virtual {v2, v9}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v10

    if-eqz v10, :cond_3

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v3, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v10, v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-virtual {v10}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getAdapter()Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;

    move-result-object v10

    invoke-virtual {v10, v9}, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->getItemKey(I)J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    if-ge v9, v8, :cond_3

    move v8, v9

    :cond_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    :cond_4
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v2

    new-array v2, v2, [I

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v7

    new-array v7, v7, [J

    const/4 v9, 0x0

    :goto_1
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    if-ge v9, v10, :cond_5

    invoke-virtual {v3, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    aput v10, v2, v9

    invoke-virtual {v5, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Long;

    invoke-virtual {v10}, Ljava/lang/Long;->longValue()J

    move-result-wide v10

    aput-wide v10, v7, v9

    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    :cond_5
    if-ne v8, v6, :cond_6

    const/4 v8, 0x0

    :cond_6
    array-length v3, v2

    if-lez v3, :cond_7

    iget-object v3, v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-virtual {v3}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getAdapter()Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;

    move-result-object v3

    invoke-virtual {v3}, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->getCount()I

    move-result v3

    if-lez v3, :cond_7

    new-instance v3, Lcom/miui/gallery/model/ImageLoadParams;

    iget-object v5, v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-virtual {v5}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getAdapter()Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;

    move-result-object v5

    invoke-virtual {v5, v8}, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->getItemKey(I)J

    move-result-wide v11

    iget-object v5, v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-virtual {v5}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getAdapter()Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;

    move-result-object v5

    invoke-virtual {v5, v8}, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->getLocalPath(I)Ljava/lang/String;

    move-result-object v13

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v5

    iget-object v14, v5, Lcom/miui/gallery/Config$ThumbConfig;->sMicroRecentTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    iget-object v5, v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-virtual {v5}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getAdapter()Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;

    move-result-object v5

    invoke-virtual {v5, v8}, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->getItemDecodeRectF(I)Landroid/graphics/RectF;

    move-result-object v15

    iget-object v5, v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-virtual {v5}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getAdapter()Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;

    move-result-object v5

    invoke-virtual {v5, v8}, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->getMimeType(I)Ljava/lang/String;

    move-result-object v17

    iget-object v5, v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-virtual {v5}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getAdapter()Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;

    move-result-object v5

    invoke-virtual {v5, v8}, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->getItemSecretKey(I)[B

    move-result-object v18

    iget-object v5, v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-virtual {v5}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getAdapter()Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;

    move-result-object v5

    invoke-virtual {v5, v8}, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->getFileLength(I)J

    move-result-wide v19

    move-object v10, v3

    move/from16 v16, v8

    invoke-direct/range {v10 .. v20}, Lcom/miui/gallery/model/ImageLoadParams;-><init>(JLjava/lang/String;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ILjava/lang/String;[BJ)V

    iget-object v9, v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    iget-object v5, v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-virtual {v5}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getUri()Landroid/net/Uri;

    move-result-object v10

    iget-object v5, v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-virtual {v5}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getAdapter()Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;

    move-result-object v5

    invoke-virtual {v5}, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->getCount()I

    move-result v12

    iget-object v5, v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-virtual {v5}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getSelection()Ljava/lang/String;

    move-result-object v13

    iget-object v5, v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-virtual {v5}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getSelectionArgs()[Ljava/lang/String;

    move-result-object v14

    iget-object v5, v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-virtual {v5}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getSortOrder()Ljava/lang/String;

    move-result-object v15

    move v11, v8

    move-object/from16 v16, v3

    move-object/from16 v17, v7

    move-object/from16 v18, v2

    invoke-static/range {v9 .. v18}, Lcom/miui/gallery/util/IntentUtil;->gotoPreviewSelectPage(Lcom/miui/gallery/ui/BaseMediaFragment;Landroid/net/Uri;IILjava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/model/ImageLoadParams;[J[I)V

    :cond_7
    invoke-virtual/range {p1 .. p1}, Landroid/view/ActionMode;->finish()V

    const-string v1, "recent_album"

    const-string v2, "send"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :cond_8
    iget-object v2, v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    iget-object v2, v2, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    new-instance v3, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2$1;

    invoke-direct {v3, v0, v1}, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2$1;-><init>(Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;Landroid/view/ActionMode;)V

    iget-object v1, v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItems()Ljava/util/List;

    move-result-object v1

    invoke-static {v2, v3, v1}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->doProduceCreation(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;Ljava/util/List;)V

    :goto_2
    iget-object v1, v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItemPositions()Landroid/util/SparseBooleanArray;

    move-result-object v1

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    :goto_3
    invoke-virtual {v1}, Landroid/util/SparseBooleanArray;->size()I

    move-result v3

    if-ge v4, v3, :cond_a

    invoke-virtual {v1, v4}, Landroid/util/SparseBooleanArray;->keyAt(I)I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v5

    if-eqz v5, :cond_9

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_9
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    :cond_a
    iget-object v1, v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getAdapter()Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;

    move-result-object v1

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_b
    :goto_4
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v1, v3}, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->getDateModified(I)J

    move-result-wide v3

    iget-object v5, v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-static {v5}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->access$200(Lcom/miui/gallery/ui/RecentDiscoveryFragment;)J

    move-result-wide v5

    cmp-long v7, v3, v5

    if-gez v7, :cond_b

    iget-object v5, v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-static {v5, v3, v4}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->access$202(Lcom/miui/gallery/ui/RecentDiscoveryFragment;J)J

    goto :goto_4

    :cond_c
    const/4 v1, 0x1

    return v1
.end method

.method public onAllItemsCheckedStateChanged(Landroid/view/ActionMode;Z)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->updateMenuState()V

    return-void
.end method

.method public onCreateActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .locals 3

    iput-object p1, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->mMode:Landroid/view/ActionMode;

    iget-object v0, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0}, Lcom/miui/gallery/util/BuildUtil;->isMiuiSdkGte15(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    const v0, 0x7f0c000e

    goto :goto_0

    :cond_0
    const v0, 0x7f0c0005

    :goto_0
    invoke-virtual {p1}, Landroid/view/ActionMode;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object p1

    invoke-virtual {p1, v0, p2}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    const p1, 0x7f090026

    invoke-interface {p2, p1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->mAddToAlbum:Landroid/view/MenuItem;

    const p1, 0x7f090017

    invoke-interface {p2, p1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->mCreativity:Landroid/view/MenuItem;

    const p1, 0x7f0900c6

    invoke-interface {p2, p1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->mDelete:Landroid/view/MenuItem;

    iget-object p1, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->mCreativity:Landroid/view/MenuItem;

    const/4 v0, 0x1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->mCreativity:Landroid/view/MenuItem;

    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->mDelete:Landroid/view/MenuItem;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->mDelete:Landroid/view/MenuItem;

    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_2
    const p1, 0x7f09001d

    invoke-interface {p2, p1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->mSend:Landroid/view/MenuItem;

    const-string p1, "recent_album"

    const-string p2, "action_mode_create"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "best_image"

    const-string p2, "best_image_count"

    invoke-static {}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->getInstance()Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->getBestImageCount(Z)I

    move-result v1

    int-to-long v1, v1

    invoke-static {p1, p2, v1, v2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    return v0
.end method

.method public onDestroyActionMode(Landroid/view/ActionMode;)V
    .locals 0

    return-void
.end method

.method public onItemCheckedStateChanged(Landroid/view/ActionMode;IJZ)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;->updateMenuState()V

    return-void
.end method

.method public onPrepareActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method
