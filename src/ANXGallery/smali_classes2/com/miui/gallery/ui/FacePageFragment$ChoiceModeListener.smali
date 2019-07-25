.class Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;
.super Ljava/lang/Object;
.source "FacePageFragment.java"

# interfaces
.implements Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/FacePageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ChoiceModeListener"
.end annotation


# instance fields
.field private mMode:Landroid/view/ActionMode;

.field private mRemoveFromFaceAlbumListener:Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceAlbumHandlerListener;

.field final synthetic this$0:Lcom/miui/gallery/ui/FacePageFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/FacePageFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener$2;

    invoke-direct {p1, p0}, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener$2;-><init>(Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->mRemoveFromFaceAlbumListener:Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceAlbumHandlerListener;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/FacePageFragment;Lcom/miui/gallery/ui/FacePageFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;-><init>(Lcom/miui/gallery/ui/FacePageFragment;)V

    return-void
.end method

.method static synthetic access$3500(Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;)Landroid/view/ActionMode;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->mMode:Landroid/view/ActionMode;

    return-object p0
.end method

.method private enableOrDisableMenuItem(Z)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->mMode:Landroid/view/ActionMode;

    invoke-virtual {v0}, Landroid/view/ActionMode;->getMenu()Landroid/view/Menu;

    move-result-object v0

    const v1, 0x7f090019

    invoke-interface {v0, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, p1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    const v1, 0x7f090009

    invoke-interface {v0, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, p1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    const v1, 0x7f090017

    invoke-interface {v0, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1, p1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    const v1, 0x7f09001d

    invoke-interface {v0, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    return-void
.end method

.method private getSelectedPhotoIds()[J
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/FacePageFragment;->access$3100(Lcom/miui/gallery/ui/FacePageFragment;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItemPositions()Landroid/util/SparseBooleanArray;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    invoke-virtual {v0}, Landroid/util/SparseBooleanArray;->size()I

    move-result v4

    if-ge v3, v4, :cond_1

    invoke-virtual {v0, v3}, Landroid/util/SparseBooleanArray;->keyAt(I)I

    move-result v4

    invoke-virtual {v0, v4}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v5

    if-eqz v5, :cond_0

    iget-object v5, p0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {v5}, Lcom/miui/gallery/ui/FacePageFragment;->access$000(Lcom/miui/gallery/ui/FacePageFragment;)Lcom/miui/gallery/adapter/FacePageAdapter;

    move-result-object v5

    invoke-virtual {v5, v4}, Lcom/miui/gallery/adapter/FacePageAdapter;->getItemPhotoId(I)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [J

    :goto_1
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    aput-wide v3, v0, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    return-object v0
.end method


# virtual methods
.method public onActionItemClicked(Landroid/view/ActionMode;Landroid/view/MenuItem;)Z
    .locals 19

    move-object/from16 v0, p0

    invoke-interface/range {p2 .. p2}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    const v2, 0x7f090009

    if-eq v1, v2, :cond_7

    const v2, 0x7f090017

    if-eq v1, v2, :cond_6

    const v2, 0x7f090019

    if-eq v1, v2, :cond_5

    const v2, 0x7f09001d

    const/4 v3, 0x0

    if-eq v1, v2, :cond_0

    return v3

    :cond_0
    iget-object v1, v0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/FacePageFragment;->access$3100(Lcom/miui/gallery/ui/FacePageFragment;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItemPositions()Landroid/util/SparseBooleanArray;

    move-result-object v1

    new-instance v2, Ljava/util/ArrayList;

    invoke-virtual {v1}, Landroid/util/SparseBooleanArray;->size()I

    move-result v4

    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v4, Ljava/util/ArrayList;

    invoke-virtual {v1}, Landroid/util/SparseBooleanArray;->size()I

    move-result v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    const v5, 0x7fffffff

    const/4 v6, 0x0

    const v7, 0x7fffffff

    :goto_0
    invoke-virtual {v1}, Landroid/util/SparseBooleanArray;->size()I

    move-result v8

    if-ge v6, v8, :cond_2

    invoke-virtual {v1, v6}, Landroid/util/SparseBooleanArray;->keyAt(I)I

    move-result v8

    invoke-virtual {v1, v8}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v2, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v9, v0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {v9}, Lcom/miui/gallery/ui/FacePageFragment;->access$000(Lcom/miui/gallery/ui/FacePageFragment;)Lcom/miui/gallery/adapter/FacePageAdapter;

    move-result-object v9

    invoke-virtual {v9, v8}, Lcom/miui/gallery/adapter/FacePageAdapter;->getItemKey(I)J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    if-ge v8, v7, :cond_1

    move v7, v8

    :cond_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :cond_2
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [I

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v6

    new-array v6, v6, [J

    const/4 v8, 0x0

    :goto_1
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v9

    if-ge v8, v9, :cond_3

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    aput v9, v1, v8

    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Long;

    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    move-result-wide v9

    aput-wide v9, v6, v8

    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    :cond_3
    if-ne v7, v5, :cond_4

    goto :goto_2

    :cond_4
    move v3, v7

    :goto_2
    new-instance v2, Lcom/miui/gallery/model/ImageLoadParams;

    iget-object v4, v0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {v4}, Lcom/miui/gallery/ui/FacePageFragment;->access$000(Lcom/miui/gallery/ui/FacePageFragment;)Lcom/miui/gallery/adapter/FacePageAdapter;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/miui/gallery/adapter/FacePageAdapter;->getItemKey(I)J

    move-result-wide v10

    iget-object v4, v0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {v4}, Lcom/miui/gallery/ui/FacePageFragment;->access$000(Lcom/miui/gallery/ui/FacePageFragment;)Lcom/miui/gallery/adapter/FacePageAdapter;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/miui/gallery/adapter/FacePageAdapter;->getLocalPath(I)Ljava/lang/String;

    move-result-object v12

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v4

    iget-object v13, v4, Lcom/miui/gallery/Config$ThumbConfig;->sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    iget-object v4, v0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {v4}, Lcom/miui/gallery/ui/FacePageFragment;->access$000(Lcom/miui/gallery/ui/FacePageFragment;)Lcom/miui/gallery/adapter/FacePageAdapter;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/miui/gallery/adapter/FacePageAdapter;->getItemDecodeRectF(I)Landroid/graphics/RectF;

    move-result-object v14

    iget-object v4, v0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {v4}, Lcom/miui/gallery/ui/FacePageFragment;->access$000(Lcom/miui/gallery/ui/FacePageFragment;)Lcom/miui/gallery/adapter/FacePageAdapter;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/miui/gallery/adapter/FacePageAdapter;->getMimeType(I)Ljava/lang/String;

    move-result-object v16

    iget-object v4, v0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {v4}, Lcom/miui/gallery/ui/FacePageFragment;->access$000(Lcom/miui/gallery/ui/FacePageFragment;)Lcom/miui/gallery/adapter/FacePageAdapter;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/miui/gallery/adapter/FacePageAdapter;->getFileLength(I)J

    move-result-wide v17

    move-object v9, v2

    move v15, v3

    invoke-direct/range {v9 .. v18}, Lcom/miui/gallery/model/ImageLoadParams;-><init>(JLjava/lang/String;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ILjava/lang/String;J)V

    iget-object v8, v0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    sget-object v9, Lcom/miui/gallery/provider/GalleryContract$PeopleFace;->ONE_PERSON_URI:Landroid/net/Uri;

    iget-object v4, v0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {v4}, Lcom/miui/gallery/ui/FacePageFragment;->access$000(Lcom/miui/gallery/ui/FacePageFragment;)Lcom/miui/gallery/adapter/FacePageAdapter;

    move-result-object v4

    invoke-virtual {v4}, Lcom/miui/gallery/adapter/FacePageAdapter;->getCount()I

    move-result v11

    const/4 v12, 0x0

    iget-object v4, v0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {v4}, Lcom/miui/gallery/ui/FacePageFragment;->access$100(Lcom/miui/gallery/ui/FacePageFragment;)[Ljava/lang/String;

    move-result-object v13

    iget-object v4, v0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {v4}, Lcom/miui/gallery/ui/FacePageFragment;->access$200(Lcom/miui/gallery/ui/FacePageFragment;)Ljava/lang/String;

    move-result-object v14

    move v10, v3

    move-object v15, v2

    move-object/from16 v16, v6

    move-object/from16 v17, v1

    invoke-static/range {v8 .. v17}, Lcom/miui/gallery/util/IntentUtil;->gotoPreviewSelectPage(Lcom/miui/gallery/ui/BaseMediaFragment;Landroid/net/Uri;IILjava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/model/ImageLoadParams;[J[I)V

    invoke-virtual/range {p1 .. p1}, Landroid/view/ActionMode;->finish()V

    const-string v1, "face"

    const-string v2, "face_send"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    :cond_5
    iget-object v1, v0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    iget-object v2, v0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->mRemoveFromFaceAlbumListener:Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceAlbumHandlerListener;

    invoke-static {v1, v2}, Lcom/miui/gallery/ui/FacePageFragment;->access$3200(Lcom/miui/gallery/ui/FacePageFragment;Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceAlbumHandlerListener;)V

    goto :goto_3

    :cond_6
    iget-object v1, v0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    new-instance v2, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener$1;

    move-object/from16 v3, p1

    invoke-direct {v2, v0, v3}, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener$1;-><init>(Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;Landroid/view/ActionMode;)V

    iget-object v3, v0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {v3}, Lcom/miui/gallery/ui/FacePageFragment;->access$3100(Lcom/miui/gallery/ui/FacePageFragment;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    move-result-object v3

    invoke-virtual {v3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItems()Ljava/util/List;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->doProduceCreation(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;Ljava/util/List;)V

    const-string v1, "face"

    const-string v2, "produce"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    :cond_7
    iget-object v1, v0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    iget-object v2, v0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->mMode:Landroid/view/ActionMode;

    invoke-direct/range {p0 .. p0}, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->getSelectedPhotoIds()[J

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/ui/FacePageFragment;->access$3300(Lcom/miui/gallery/ui/FacePageFragment;Landroid/view/ActionMode;[J)V

    :goto_3
    const/4 v1, 0x1

    return v1
.end method

.method public onAllItemsCheckedStateChanged(Landroid/view/ActionMode;Z)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/FacePageFragment;->access$3100(Lcom/miui/gallery/ui/FacePageFragment;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItemCount()I

    move-result p1

    if-lez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->enableOrDisableMenuItem(Z)V

    return-void
.end method

.method public onCreateActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->mMode:Landroid/view/ActionMode;

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0}, Lcom/miui/gallery/util/BuildUtil;->isMiuiSdkGte15(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    const v0, 0x7f0c000d

    goto :goto_0

    :cond_0
    const v0, 0x7f0c0004

    :goto_0
    invoke-virtual {p1}, Landroid/view/ActionMode;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object p1

    invoke-virtual {p1, v0, p2}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->enableOrDisableMenuItem(Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    const/16 p2, 0x8

    invoke-static {p1, p2}, Lcom/miui/gallery/ui/FacePageFragment;->access$3000(Lcom/miui/gallery/ui/FacePageFragment;I)V

    const/4 p1, 0x1

    return p1
.end method

.method public onDestroyActionMode(Landroid/view/ActionMode;)V
    .locals 1

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->mMode:Landroid/view/ActionMode;

    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/miui/gallery/ui/FacePageFragment;->access$3000(Lcom/miui/gallery/ui/FacePageFragment;I)V

    return-void
.end method

.method public onItemCheckedStateChanged(Landroid/view/ActionMode;IJZ)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/FacePageFragment;->access$3100(Lcom/miui/gallery/ui/FacePageFragment;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItemCount()I

    move-result p1

    if-lez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->enableOrDisableMenuItem(Z)V

    return-void
.end method

.method public onPrepareActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;->this$0:Lcom/miui/gallery/ui/FacePageFragment;

    const/16 p2, 0x8

    invoke-static {p1, p2}, Lcom/miui/gallery/ui/FacePageFragment;->access$3000(Lcom/miui/gallery/ui/FacePageFragment;I)V

    const/4 p1, 0x0

    return p1
.end method
