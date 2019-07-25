.class public abstract Lcom/miui/gallery/ui/AlbumDetailFragmentBase;
.super Lcom/miui/gallery/ui/PhotoListFragmentBase;
.source "AlbumDetailFragmentBase.java"

# interfaces
.implements Landroid/arch/lifecycle/DefaultLifecycleObserver;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/AlbumDetailFragmentBase$VoiceAssistantReceiver;,
        Lcom/miui/gallery/ui/AlbumDetailFragmentBase$AlbumScanTask;
    }
.end annotation


# static fields
.field private static final SELECTION_ONLY_LOCAL:Ljava/lang/String;


# instance fields
.field protected mAlbumDetailGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

.field protected mAlbumLocalPath:Ljava/lang/String;

.field private mChoiceModeListener:Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;

.field protected mDailyAlbumDate:I

.field private mDialog:Landroid/app/Dialog;

.field private mEnableAutoUploadPending:Z

.field protected mIsDailyAlbum:Z

.field protected mIsFavoritesAlbum:Z

.field protected mIsLocalAlbum:Z

.field protected mIsOtherShareAlbum:Z

.field protected mIsPanoAlbum:Z

.field protected mIsScreenshotAlbum:Z

.field private mIsShareAlbum:Z

.field protected mScreenshotAppName:Ljava/lang/String;

.field private mSharePending:Z

.field private mVoiceAssistantReceiver:Lcom/miui/gallery/ui/AlbumDetailFragmentBase$VoiceAssistantReceiver;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/miui/gallery/provider/InternalContract$Cloud;->ALIAS_LOCAL_MEDIA:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->SELECTION_ONLY_LOCAL:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoListFragmentBase;-><init>()V

    new-instance v0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$8;-><init>(Lcom/miui/gallery/ui/AlbumDetailFragmentBase;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mChoiceModeListener:Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/AlbumDetailFragmentBase;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->recordCopyMoveAction(Z)V

    return-void
.end method

.method static synthetic access$202(Lcom/miui/gallery/ui/AlbumDetailFragmentBase;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mEnableAutoUploadPending:Z

    return p1
.end method

.method static synthetic access$302(Lcom/miui/gallery/ui/AlbumDetailFragmentBase;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mSharePending:Z

    return p1
.end method

.method static synthetic access$500(Lcom/miui/gallery/ui/AlbumDetailFragmentBase;)Z
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->canAddSecret()Z

    move-result p0

    return p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/ui/AlbumDetailFragmentBase;)Ljava/util/ArrayList;
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->getBurstCheckedItemIds()Ljava/util/ArrayList;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/ui/AlbumDetailFragmentBase;Landroid/view/ActionMode;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->doDelete(Landroid/view/ActionMode;)V

    return-void
.end method

.method static synthetic access$800(Lcom/miui/gallery/ui/AlbumDetailFragmentBase;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->onSend(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private canAddSecret()Z
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->isOthersShareAlbum()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method private doAddPhotos([J)V
    .locals 10

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->isOthersShareAlbum()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const-string v0, "AlbumDetailFragmentBase"

    const-string v2, "Is other shared album, do copy operation for default"

    invoke-static {v0, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v3, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-wide v4, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumId:J

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v6, p1

    invoke-static/range {v3 .. v9}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->show(Landroid/app/Activity;J[JIZLcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;)V

    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->recordCopyMoveAction(Z)V

    goto :goto_0

    :cond_0
    invoke-static {p1}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->hasOtherShareMedia([J)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "AlbumDetailFragmentBase"

    const-string v2, "Contains other\'s share media, do copy operation for default"

    invoke-static {v0, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v3, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-wide v4, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumId:J

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v6, p1

    invoke-static/range {v3 .. v9}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->show(Landroid/app/Activity;J[JIZLcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;)V

    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->recordCopyMoveAction(Z)V

    goto :goto_0

    :cond_1
    new-instance v0, Lcom/miui/gallery/ui/CopyOrMoveDialog;

    invoke-direct {v0}, Lcom/miui/gallery/ui/CopyOrMoveDialog;-><init>()V

    new-instance v1, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$1;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$1;-><init>(Lcom/miui/gallery/ui/AlbumDetailFragmentBase;[J)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/CopyOrMoveDialog;->setOnOperationSelectedListener(Lcom/miui/gallery/ui/CopyOrMoveDialog$OnOperationSelectedListener;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    const-string v1, "CopyOrMoveDialog"

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/ui/CopyOrMoveDialog;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method private doDelete(Landroid/view/ActionMode;)V
    .locals 12

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->isOthersShareAlbum()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumDetailGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItemPositions()Landroid/util/SparseBooleanArray;

    move-result-object v0

    const/4 v2, 0x0

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/util/SparseBooleanArray;->size()I

    move-result v3

    if-lez v3, :cond_2

    move-object v4, v2

    const/4 v3, 0x0

    :goto_0
    invoke-virtual {v0}, Landroid/util/SparseBooleanArray;->size()I

    move-result v5

    if-ge v3, v5, :cond_3

    invoke-virtual {v0, v3}, Landroid/util/SparseBooleanArray;->valueAt(I)Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-virtual {v0, v3}, Landroid/util/SparseBooleanArray;->keyAt(I)I

    move-result v5

    if-nez v4, :cond_0

    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->getAdapter()Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    move-result-object v6

    invoke-virtual {v6, v5}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getBurstItemKeys(I)Ljava/util/ArrayList;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Long;

    invoke-virtual {p0, v5}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->getCreatorIdByPosition(I)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v4, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    move-object v4, v2

    :cond_3
    if-eqz v4, :cond_4

    invoke-static {v4}, Lcom/miui/gallery/provider/ShareMediaManager;->getOwnerSharedImageIds(Ljava/util/Map;)Ljava/util/ArrayList;

    move-result-object v3

    if-eqz v3, :cond_4

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_4

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [J

    const/4 v4, 0x0

    :goto_2
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    if-ge v4, v5, :cond_4

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    aput-wide v5, v2, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    :cond_4
    if-eqz v0, :cond_7

    invoke-virtual {v0}, Landroid/util/SparseBooleanArray;->size()I

    move-result v3

    if-lez v3, :cond_7

    if-eqz v2, :cond_5

    array-length v3, v2

    invoke-virtual {v0}, Landroid/util/SparseBooleanArray;->size()I

    move-result v0

    if-ge v3, v0, :cond_7

    :cond_5
    const/4 v0, 0x1

    const/4 v1, 0x1

    goto :goto_3

    :cond_6
    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->getBurstCheckedItemIds()Ljava/util/ArrayList;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->ListToArray(Ljava/util/List;)[J

    move-result-object v2

    :cond_7
    :goto_3
    move-object v11, v2

    if-eqz v11, :cond_8

    array-length v0, v11

    if-lez v0, :cond_8

    iget-object v3, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const-string v4, "AlbumDetailFragmentBaseDeleteMediaDialogFragment"

    new-instance v5, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$9;

    invoke-direct {v5, p0, p1}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$9;-><init>(Lcom/miui/gallery/ui/AlbumDetailFragmentBase;Landroid/view/ActionMode;)V

    iget-wide v6, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumId:J

    iget-object v8, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumName:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->getDupType()I

    move-result v9

    const/16 v10, 0x17

    invoke-static/range {v3 .. v11}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->delete(Landroid/app/Activity;Ljava/lang/String;Lcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;JLjava/lang/String;II[J)V

    goto :goto_4

    :cond_8
    if-eqz v1, :cond_9

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f100302

    invoke-virtual {p0, v1}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    :cond_9
    invoke-virtual {p1}, Landroid/view/ActionMode;->finish()V

    :goto_4
    return-void
.end method

.method private doShare()V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    new-instance v1, Lcom/miui/gallery/share/Path;

    iget-boolean v2, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mIsOtherShareAlbum:Z

    if-eqz v2, :cond_0

    iget-wide v2, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumId:J

    invoke-static {v2, v3}, Lcom/miui/gallery/provider/ShareAlbumManager;->getOriginalAlbumId(J)J

    move-result-wide v2

    goto :goto_0

    :cond_0
    iget-wide v2, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumId:J

    :goto_0
    iget-boolean v4, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mIsOtherShareAlbum:Z

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->getAdapter()Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    move-result-object v5

    invoke-virtual {v5}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->isBabyAlbum()Z

    move-result v5

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/miui/gallery/share/Path;-><init>(JZZ)V

    iget-boolean v2, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mIsOtherShareAlbum:Z

    if-eqz v2, :cond_1

    const/4 v2, 0x6

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    :goto_1
    invoke-static {v0, v1, v2}, Lcom/miui/gallery/share/UIHelper;->showAlbumShareInfo(Landroid/app/Activity;Lcom/miui/gallery/share/Path;I)V

    return-void
.end method

.method private getBurstCheckedItemIds()Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumDetailGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItemPositions()Landroid/util/SparseBooleanArray;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    :goto_0
    invoke-virtual {v0}, Landroid/util/SparseBooleanArray;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    invoke-virtual {v0, v2}, Landroid/util/SparseBooleanArray;->keyAt(I)I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->getAdapter()Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getBurstItemKeys(I)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-object v1
.end method

.method private static hasOtherShareMedia([J)Z
    .locals 5

    array-length v0, p0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    aget-wide v3, p0, v2

    invoke-static {v3, v4}, Lcom/miui/gallery/provider/ShareMediaManager;->isOtherShareMediaId(J)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return v1
.end method

.method private isOnlyShowLocal()Z
    .locals 1

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$LocalMode;->isOnlyShowLocalPhoto()Z

    move-result v0

    return v0
.end method

.method private onSend(Ljava/lang/String;Ljava/lang/String;)V
    .locals 25

    move-object/from16 v12, p0

    iget-object v0, v12, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumDetailGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItemPositions()Landroid/util/SparseBooleanArray;

    move-result-object v13

    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {v13}, Landroid/util/SparseBooleanArray;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v1, Ljava/util/ArrayList;

    invoke-virtual {v13}, Landroid/util/SparseBooleanArray;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    const v2, 0x7fffffff

    const/4 v3, 0x0

    const/4 v4, 0x0

    const v5, 0x7fffffff

    :goto_0
    invoke-virtual {v13}, Landroid/util/SparseBooleanArray;->size()I

    move-result v6

    if-ge v4, v6, :cond_1

    invoke-virtual {v13, v4}, Landroid/util/SparseBooleanArray;->keyAt(I)I

    move-result v6

    invoke-virtual {v13, v6}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->getAdapter()Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    move-result-object v7

    invoke-virtual {v7, v6}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getItemKey(I)J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    if-ge v6, v5, :cond_0

    move v5, v6

    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-nez v4, :cond_2

    return-void

    :cond_2
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    new-array v9, v4, [I

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    new-array v8, v4, [J

    const/4 v4, 0x0

    :goto_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v4, v6, :cond_3

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    aput v6, v9, v4

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    aput-wide v6, v8, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_3
    if-ne v5, v2, :cond_4

    goto :goto_2

    :cond_4
    move v3, v5

    :goto_2
    new-instance v7, Lcom/miui/gallery/model/ImageLoadParams;

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->getAdapter()Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getItemKey(I)J

    move-result-wide v15

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->getAdapter()Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getLocalPath(I)Ljava/lang/String;

    move-result-object v17

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v0

    iget-object v0, v0, Lcom/miui/gallery/Config$ThumbConfig;->sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->getAdapter()Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getItemDecodeRectF(I)Landroid/graphics/RectF;

    move-result-object v19

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->getAdapter()Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getMimeType(I)Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->getAdapter()Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getItemSecretKey(I)[B

    move-result-object v22

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->getAdapter()Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getFileLength(I)J

    move-result-wide v23

    move-object v14, v7

    move-object/from16 v18, v0

    move/from16 v20, v3

    invoke-direct/range {v14 .. v24}, Lcom/miui/gallery/model/ImageLoadParams;-><init>(JLjava/lang/String;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ILjava/lang/String;[BJ)V

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->getUri()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->getAdapter()Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getCount()I

    move-result v4

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->getSelection()Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->getSelectionArgs()[Ljava/lang/String;

    move-result-object v6

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->getCurrentSortOrder()Ljava/lang/String;

    move-result-object v10

    move-object/from16 v0, p0

    move v2, v3

    move v3, v4

    move-object v4, v5

    move-object v5, v6

    move-object v6, v10

    move-object/from16 v10, p1

    move-object/from16 v11, p2

    invoke-static/range {v0 .. v11}, Lcom/miui/gallery/util/IntentUtil;->gotoPreviewSelectPage(Lcom/miui/gallery/ui/BaseMediaFragment;Landroid/net/Uri;IILjava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/model/ImageLoadParams;[J[ILjava/lang/String;Ljava/lang/String;)V

    iget-object v0, v12, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumDetailGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->stopActionMode()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "count"

    invoke-virtual {v13}, Landroid/util/SparseBooleanArray;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "album_detail"

    const-string v2, "send"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method private pickPhotos()V
    .locals 3

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const-class v2, Lcom/miui/gallery/picker/PickGalleryActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "pick-upper-bound"

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v1, "pick-need-id"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const/4 v1, 0x7

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method private recordCopyMoveAction(Z)V
    .locals 2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "move"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "from"

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "organize_photos"

    const-string v1, "move_or_copy"

    invoke-static {p1, v1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method private scanAlbumFolderIfNeeded()V
    .locals 5

    iget-boolean v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mIsOtherShareAlbum:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->isVirtualAlbum()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumLocalPath:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumLocalPath:Ljava/lang/String;

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$AlbumScanTask;

    iget-wide v3, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumId:J

    invoke-direct {v2, v0, v3, v4}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$AlbumScanTask;-><init>(Ljava/lang/String;J)V

    invoke-virtual {v1, v2}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    :cond_0
    return-void
.end method

.method private showAlbumShareInfo()V
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->needEnableAutoUpload()Z

    move-result v0

    if-eqz v0, :cond_0

    const v0, 0x7f100075

    const v1, 0x7f100074

    const v2, 0x104000a

    new-instance v3, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$2;

    invoke-direct {v3, p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$2;-><init>(Lcom/miui/gallery/ui/AlbumDetailFragmentBase;)V

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->showDialog(IIILandroid/content/DialogInterface$OnClickListener;)V

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->doShare()V

    :goto_0
    return-void
.end method

.method private updateConfiguration(Landroid/content/res/Configuration;)V
    .locals 4

    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    const v0, 0x7f0602a9

    const/4 v1, 0x1

    const v2, 0x7f0602aa

    const/4 v3, 0x2

    if-ne p1, v3, :cond_2

    iget-boolean p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mIsScreenshotAlbum:Z

    if-eqz p1, :cond_0

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object p1

    iget v1, p1, Lcom/miui/gallery/Config$ThumbConfig;->sMicroThumbScreenshotColumnsLand:I

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumDetailGridView:Landroid/widget/GridView;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/GridView;->setVerticalSpacing(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumDetailGridView:Landroid/widget/GridView;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/GridView;->setHorizontalSpacing(I)V

    goto :goto_0

    :cond_0
    iget-boolean p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mIsPanoAlbum:Z

    if-eqz p1, :cond_1

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumDetailGridView:Landroid/widget/GridView;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/GridView;->setVerticalSpacing(I)V

    goto :goto_0

    :cond_1
    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object p1

    iget v1, p1, Lcom/miui/gallery/Config$ThumbConfig;->sMicroThumbColumnsLand:I

    goto :goto_0

    :cond_2
    iget-boolean p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mIsScreenshotAlbum:Z

    if-eqz p1, :cond_3

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object p1

    iget v1, p1, Lcom/miui/gallery/Config$ThumbConfig;->sMicroThumbScreenshotColumnsPortrait:I

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumDetailGridView:Landroid/widget/GridView;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/GridView;->setVerticalSpacing(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumDetailGridView:Landroid/widget/GridView;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/GridView;->setHorizontalSpacing(I)V

    goto :goto_0

    :cond_3
    iget-boolean p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mIsPanoAlbum:Z

    if-eqz p1, :cond_4

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumDetailGridView:Landroid/widget/GridView;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/GridView;->setVerticalSpacing(I)V

    goto :goto_0

    :cond_4
    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object p1

    iget v1, p1, Lcom/miui/gallery/Config$ThumbConfig;->sMicroThumbColumnsPortrait:I

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumDetailGridView:Landroid/widget/GridView;

    invoke-virtual {p1, v1}, Landroid/widget/GridView;->setNumColumns(I)V

    return-void
.end method


# virtual methods
.method protected consumePendingEvent()V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mEnableAutoUploadPending:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0}, Lcom/miui/gallery/util/SyncUtil;->existXiaomiAccount(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Landroid/content/ContentResolver;->getMasterSyncAutomatically()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->doChangeAutoUpload(Z)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mSharePending:Z

    if-eqz v0, :cond_2

    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->doShare()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const v1, 0x7f1006c3

    invoke-static {v0, v1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const v1, 0x7f100785

    invoke-static {v0, v1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    :cond_2
    :goto_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mEnableAutoUploadPending:Z

    iput-boolean v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mSharePending:Z

    return-void
.end method

.method protected disableAutoUpload()V
    .locals 7

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v5, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$7;

    invoke-direct {v5, p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$7;-><init>(Lcom/miui/gallery/ui/AlbumDetailFragmentBase;)V

    const v1, 0x7f10030b

    const v2, 0x7f10030c

    const v3, 0x104000a

    const/high16 v4, 0x1040000

    const/4 v6, 0x0

    invoke-static/range {v0 .. v6}, Lcom/miui/gallery/util/DialogUtil;->showInfoDialog(Landroid/content/Context;IIIILandroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog;

    return-void
.end method

.method protected doChangeAutoUpload(Z)Z
    .locals 5

    const/4 v0, 0x0

    if-nez p1, :cond_0

    iget-boolean v1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mIsShareAlbum:Z

    if-eqz v1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const v1, 0x7f100671

    invoke-static {p1, v1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    return v0

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v1}, Lcom/miui/account/AccountHelper;->getXiaomiAccount(Landroid/content/Context;)Landroid/accounts/Account;

    move-result-object v1

    if-eqz v1, :cond_4

    const/4 v2, 0x1

    if-eqz p1, :cond_2

    const-string v3, "com.miui.gallery.cloud.provider"

    invoke-static {v1, v3}, Landroid/content/ContentResolver;->getSyncAutomatically(Landroid/accounts/Account;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v1, v2}, Lcom/miui/gallery/util/SyncUtil;->setSyncAutomatically(Landroid/content/Context;Z)Z

    move-result v1

    if-nez v1, :cond_1

    return v0

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->getAdapter()Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->updateGalleryCloudSyncableState()V

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-wide v3, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumId:J

    invoke-static {v0, v3, v4, p1}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->doChangeAutoUpload(Landroid/content/Context;JZ)V

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    if-eqz p1, :cond_3

    const p1, 0x7f100078

    goto :goto_0

    :cond_3
    const p1, 0x7f100077

    :goto_0
    invoke-static {v0, p1}, Lcom/miui/gallery/util/ToastUtils;->makeTextLong(Landroid/content/Context;I)V

    return v2

    :cond_4
    return v0
.end method

.method protected doChangeShowInOtherAlbums(Z)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-wide v1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumId:J

    invoke-static {v0, v1, v2, p1}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->doChangeShowInOtherAlbums(Landroid/content/Context;JZ)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz p1, :cond_0

    const p1, 0x7f10067a

    goto :goto_0

    :cond_0
    const p1, 0x7f100679

    :goto_0
    invoke-static {v0, p1}, Lcom/miui/gallery/util/ToastUtils;->makeTextLong(Landroid/content/Context;I)V

    return-void
.end method

.method protected enableAutoUpload()V
    .locals 7

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v5, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$4;

    invoke-direct {v5, p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$4;-><init>(Lcom/miui/gallery/ui/AlbumDetailFragmentBase;)V

    const v1, 0x7f100336

    const v2, 0x7f100337

    const v3, 0x104000a

    const/high16 v4, 0x1040000

    const/4 v6, 0x0

    invoke-static/range {v0 .. v6}, Lcom/miui/gallery/util/DialogUtil;->showInfoDialog(Landroid/content/Context;IIIILandroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog;

    return-void
.end method

.method protected abstract getCreatorIdByPosition(I)Ljava/lang/String;
.end method

.method protected getDupType()I
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->isVideoAlbum()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->isPanoAlbum()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->isDailyAlbum()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->isFavoritesAlbum()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->getUri()Landroid/net/Uri;

    move-result-object v0

    const-string v1, "remove_duplicate_items"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x2

    return v0

    :cond_1
    return v2

    :cond_2
    :goto_0
    const/4 v0, 0x3

    return v0
.end method

.method protected getSelection()Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->isOthersShareAlbum()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->isVideoAlbum()Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "serverType = ? AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "alias_hidden = ? AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "localGroupId != ?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->isPanoAlbum()Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "title LIKE ? AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "alias_hidden = ?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->isDailyAlbum()Z

    move-result v1

    if-eqz v1, :cond_3

    const-string v1, "alias_create_date = ? AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "alias_hidden = ? AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "localGroupId != ?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_3
    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->isFavoritesAlbum()Z

    move-result v1

    if-eqz v1, :cond_4

    const-string v1, "alias_is_favorite = ? AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "alias_hidden = ? AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "localGroupId != ?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_4
    iget-boolean v1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mIsScreenshotAlbum:Z

    if-eqz v1, :cond_6

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mScreenshotAppName:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_5

    const-string v1, "location"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " = ? AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "title"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " like \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "Screenshot"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "%\' AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_5
    const-string v1, "localGroupId = ?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_6
    const-string v1, "localGroupId = ?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_0
    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->isOnlyShowLocal()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->isSecretAlbum()Z

    move-result v1

    if-nez v1, :cond_7

    sget-object v1, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->SELECTION_ONLY_LOCAL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_7
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getSelectionArgs()[Ljava/lang/String;
    .locals 7

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->isVideoAlbum()Z

    move-result v0

    const-wide/16 v1, -0x3e8

    const/4 v3, 0x3

    const/4 v4, 0x2

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eqz v0, :cond_0

    new-array v0, v3, [Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v5

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v4

    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->isPanoAlbum()Z

    move-result v0

    if-eqz v0, :cond_1

    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "PANO_.*"

    aput-object v1, v0, v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v5

    return-object v0

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->isOthersShareAlbum()Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x0

    return-object v0

    :cond_2
    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->isDailyAlbum()Z

    move-result v0

    if-eqz v0, :cond_3

    new-array v0, v3, [Ljava/lang/String;

    iget v3, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mDailyAlbumDate:I

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v5

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v4

    return-object v0

    :cond_3
    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->isFavoritesAlbum()Z

    move-result v0

    if-eqz v0, :cond_4

    new-array v0, v3, [Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v5

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v4

    return-object v0

    :cond_4
    iget-boolean v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mIsScreenshotAlbum:Z

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mScreenshotAppName:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_5

    new-array v0, v4, [Ljava/lang/String;

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mScreenshotAppName:Ljava/lang/String;

    aput-object v1, v0, v6

    iget-wide v1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumId:J

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v5

    return-object v0

    :cond_5
    new-array v0, v5, [Ljava/lang/String;

    iget-wide v1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumId:J

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v6

    return-object v0
.end method

.method protected getUri()Landroid/net/Uri;
    .locals 1

    sget-object v0, Lcom/miui/gallery/widget/SortByHeader$SortBy;->NONE:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->getUri(Lcom/miui/gallery/widget/SortByHeader$SortBy;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method protected getUri(Lcom/miui/gallery/widget/SortByHeader$SortBy;)Landroid/net/Uri;
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->isOthersShareAlbum()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object p1, Lcom/miui/gallery/provider/GalleryContract$Media;->URI_OTHER_ALBUM_MEDIA:Landroid/net/Uri;

    iget-wide v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumId:J

    invoke-static {p1, v0, v1}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object p1

    return-object p1

    :cond_0
    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Media;->URI_OWNER_ALBUM_MEDIA:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "remove_duplicate_items"

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->isVirtualAlbum()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/widget/SortByHeader$SortBy;->DATE:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    if-ne p1, v1, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->isSecretAlbum()Z

    move-result p1

    if-nez p1, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->isDailyAlbum()Z

    move-result p1

    if-nez p1, :cond_1

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p1

    const-string v0, "generate_headers"

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    :cond_1
    return-object v0
.end method

.method public isDailyAlbum()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mIsDailyAlbum:Z

    return v0
.end method

.method protected isFavoritesAlbum()Z
    .locals 5

    iget-wide v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumId:J

    const-wide/32 v2, 0x7ffffffa

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected isOthersShareAlbum()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mIsOtherShareAlbum:Z

    return v0
.end method

.method protected isPanoAlbum()Z
    .locals 5

    iget-wide v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumId:J

    const-wide/32 v2, 0x7ffffffd

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected isSecretAlbum()Z
    .locals 5

    iget-wide v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumId:J

    const-wide/16 v2, -0x3e8

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected isVideoAlbum()Z
    .locals 5

    iget-wide v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumId:J

    const-wide/32 v2, 0x7fffffff

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected isVirtualAlbum()Z
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->isVideoAlbum()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->isPanoAlbum()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->isSecretAlbum()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->isDailyAlbum()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->isFavoritesAlbum()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method protected moveToOtherAlbums()V
    .locals 3

    new-instance v0, Lmiui/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lmiui/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f1004df

    invoke-virtual {v0, v1}, Lmiui/app/AlertDialog$Builder;->setTitle(I)Lmiui/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f10047d

    invoke-virtual {v0, v1}, Lmiui/app/AlertDialog$Builder;->setMessage(I)Lmiui/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$6;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$6;-><init>(Lcom/miui/gallery/ui/AlbumDetailFragmentBase;)V

    const v2, 0x104000a

    invoke-virtual {v0, v2, v1}, Lmiui/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;

    move-result-object v0

    const/high16 v1, 0x1040000

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lmiui/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lmiui/app/AlertDialog$Builder;->show()Lmiui/app/AlertDialog;

    return-void
.end method

.method protected abstract needEnableAutoUpload()Z
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2

    const/4 v0, -0x1

    packed-switch p1, :pswitch_data_0

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/ui/PhotoListFragmentBase;->onActivityResult(IILandroid/content/Intent;)V

    goto :goto_2

    :pswitch_0
    if-ne p2, v0, :cond_3

    if-eqz p3, :cond_3

    const-string p1, "pick-result-data"

    invoke-virtual {p3, p1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p2

    new-array p2, p2, [J

    const/4 p3, 0x0

    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p3, v0, :cond_1

    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    aput-wide v0, p2, p3

    add-int/lit8 p3, p3, 0x1

    goto :goto_0

    :cond_1
    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->doAddPhotos([J)V

    goto :goto_2

    :cond_2
    :goto_1
    return-void

    :pswitch_1
    if-ne p2, v0, :cond_3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->finish()V

    :cond_3
    :goto_2
    return-void

    :pswitch_data_0
    .packed-switch 0x6
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoListFragmentBase;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->updateConfiguration(Landroid/content/res/Configuration;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumDetailGridView:Landroid/widget/GridView;

    invoke-virtual {p1}, Landroid/widget/GridView;->getFirstVisiblePosition()I

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumDetailGridView:Landroid/widget/GridView;

    invoke-virtual {v0, p1}, Landroid/widget/GridView;->setSelection(I)V

    return-void
.end method

.method public synthetic onCreate(Landroid/arch/lifecycle/LifecycleOwner;)V
    .locals 0

    invoke-static {p0, p1}, Landroid/arch/lifecycle/DefaultLifecycleObserver$-CC;->$default$onCreate(Landroid/arch/lifecycle/DefaultLifecycleObserver;Landroid/arch/lifecycle/LifecycleOwner;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoListFragmentBase;->onCreate(Landroid/os/Bundle;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/activity/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "album_local_path"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumLocalPath:Ljava/lang/String;

    invoke-static {}, Landroid/arch/lifecycle/ProcessLifecycleOwner;->get()Landroid/arch/lifecycle/LifecycleOwner;

    move-result-object p1

    invoke-interface {p1}, Landroid/arch/lifecycle/LifecycleOwner;->getLifecycle()Landroid/arch/lifecycle/Lifecycle;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/arch/lifecycle/Lifecycle;->addObserver(Landroid/arch/lifecycle/LifecycleObserver;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->scanAlbumFolderIfNeeded()V

    return-void
.end method

.method public onDestroy()V
    .locals 1

    invoke-static {}, Landroid/arch/lifecycle/ProcessLifecycleOwner;->get()Landroid/arch/lifecycle/LifecycleOwner;

    move-result-object v0

    invoke-interface {v0}, Landroid/arch/lifecycle/LifecycleOwner;->getLifecycle()Landroid/arch/lifecycle/Lifecycle;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/arch/lifecycle/Lifecycle;->removeObserver(Landroid/arch/lifecycle/LifecycleObserver;)V

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoListFragmentBase;->onDestroy()V

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    :cond_0
    return-void
.end method

.method public synthetic onDestroy(Landroid/arch/lifecycle/LifecycleOwner;)V
    .locals 0

    invoke-static {p0, p1}, Landroid/arch/lifecycle/DefaultLifecycleObserver$-CC;->$default$onDestroy(Landroid/arch/lifecycle/DefaultLifecycleObserver;Landroid/arch/lifecycle/LifecycleOwner;)V

    return-void
.end method

.method protected onEnableAutoUpload(Z)V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0}, Lcom/miui/gallery/util/SyncUtil;->existXiaomiAccount(Landroid/content/Context;)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v2, "cloud_guide_source"

    sget-object v3, Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;->AUTOBACKUP:Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    const-string v2, "autobackup_album_id"

    iget-wide v3, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumId:J

    invoke-virtual {v0, v2, v3, v4}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    iget-object v2, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v2, v0}, Lcom/miui/gallery/util/IntentUtil;->guideToLoginXiaomiAccount(Landroid/content/Context;Landroid/os/Bundle;)V

    iput-boolean v1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mEnableAutoUploadPending:Z

    iput-boolean p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mSharePending:Z

    goto :goto_0

    :cond_0
    invoke-static {}, Landroid/content/ContentResolver;->getMasterSyncAutomatically()Z

    move-result v0

    if-nez v0, :cond_1

    const v0, 0x7f1006f3

    const v1, 0x7f1006f1

    const v2, 0x7f1006f2

    new-instance v3, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$5;

    invoke-direct {v3, p0, p1}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$5;-><init>(Lcom/miui/gallery/ui/AlbumDetailFragmentBase;Z)V

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->showDialog(IIILandroid/content/DialogInterface$OnClickListener;)V

    goto :goto_0

    :cond_1
    invoke-virtual {p0, v1}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->doChangeAutoUpload(Z)Z

    move-result v0

    if-eqz v0, :cond_2

    if-eqz p1, :cond_2

    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->doShare()V

    :cond_2
    :goto_0
    return-void
.end method

.method protected abstract onEnterActionMode()V
.end method

.method public onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/ui/PhotoListFragmentBase;->onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p2}, Lcom/miui/gallery/activity/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object p2

    const-string p3, "album_name"

    invoke-virtual {p2, p3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumName:Ljava/lang/String;

    const-string p3, "album_id"

    const-wide/16 v0, -0x1

    invoke-virtual {p2, p3, v0, v1}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumId:J

    const-string p3, "other_share_album"

    const/4 v0, 0x0

    invoke-virtual {p2, p3, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p3

    iput-boolean p3, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mIsOtherShareAlbum:Z

    const-string p3, "is_local_album"

    invoke-virtual {p2, p3, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p3

    iput-boolean p3, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mIsLocalAlbum:Z

    const-string p3, "screenshot_album"

    invoke-virtual {p2, p3, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p3

    iput-boolean p3, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mIsScreenshotAlbum:Z

    const-string p3, "screenshot_app_name"

    invoke-virtual {p2, p3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mScreenshotAppName:Ljava/lang/String;

    iget-boolean p3, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mIsOtherShareAlbum:Z

    if-nez p3, :cond_1

    const-string p3, "owner_share_album"

    invoke-virtual {p2, p3, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p3

    if-eqz p3, :cond_0

    goto :goto_0

    :cond_0
    const/4 p3, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p3, 0x1

    :goto_1
    iput-boolean p3, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mIsShareAlbum:Z

    const-string p3, "pano_album"

    invoke-virtual {p2, p3, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p3

    iput-boolean p3, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mIsPanoAlbum:Z

    const-string p3, "daily_album"

    invoke-virtual {p2, p3, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p3

    iput-boolean p3, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mIsDailyAlbum:Z

    iget-boolean p3, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mIsDailyAlbum:Z

    if-eqz p3, :cond_2

    const-string p3, "daily_album_date"

    const/4 v1, -0x1

    invoke-virtual {p2, p3, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p3

    iput p3, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mDailyAlbumDate:I

    iget p3, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mDailyAlbumDate:I

    if-gtz p3, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->finish()V

    :cond_2
    const-string p3, "favorites_album"

    invoke-virtual {p2, p3, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p2

    iput-boolean p2, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mIsFavoritesAlbum:Z

    new-instance p2, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    iget-object p3, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumDetailGridView:Landroid/widget/GridView;

    invoke-direct {p2, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;-><init>(Landroid/widget/AbsListView;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumDetailGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumDetailGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    iget-object p3, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mEmptyView:Landroid/view/View;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setEmptyView(Landroid/view/View;)V

    iget-boolean p2, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mIsScreenshotAlbum:Z

    if-nez p2, :cond_3

    iget-boolean p2, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mIsPanoAlbum:Z

    if-eqz p2, :cond_4

    :cond_3
    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumDetailGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->disableScaleImageViewAniWhenInActionMode()V

    :cond_4
    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mEmptyView:Landroid/view/View;

    const/16 p3, 0x8

    invoke-virtual {p2, p3}, Landroid/view/View;->setVisibility(I)V

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumDetailGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->getGridViewOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;

    move-result-object p3

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumDetailGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    const/4 p3, 0x3

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setChoiceMode(I)V

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mAlbumDetailGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    iget-object p3, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mChoiceModeListener:Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setMultiChoiceModeListener(Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p2

    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->updateConfiguration(Landroid/content/res/Configuration;)V

    return-object p1
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 3

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0901be

    const/4 v2, 0x1

    if-eq v0, v1, :cond_1

    const v1, 0x7f0901d6

    if-eq v0, v1, :cond_0

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoListFragmentBase;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p1

    return p1

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->showAlbumShareInfo()V

    return v2

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->pickPhotos()V

    return v2
.end method

.method public onPause()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoListFragmentBase;->onPause()V

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mVoiceAssistantReceiver:Lcom/miui/gallery/ui/AlbumDetailFragmentBase$VoiceAssistantReceiver;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mVoiceAssistantReceiver:Lcom/miui/gallery/ui/AlbumDetailFragmentBase$VoiceAssistantReceiver;

    invoke-virtual {v0, v1}, Landroid/support/v4/content/LocalBroadcastManager;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mVoiceAssistantReceiver:Lcom/miui/gallery/ui/AlbumDetailFragmentBase$VoiceAssistantReceiver;

    :cond_0
    return-void
.end method

.method public synthetic onPause(Landroid/arch/lifecycle/LifecycleOwner;)V
    .locals 0

    invoke-static {p0, p1}, Landroid/arch/lifecycle/DefaultLifecycleObserver$-CC;->$default$onPause(Landroid/arch/lifecycle/DefaultLifecycleObserver;Landroid/arch/lifecycle/LifecycleOwner;)V

    return-void
.end method

.method public onResume()V
    .locals 4

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoListFragmentBase;->onResume()V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->consumePendingEvent()V

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mVoiceAssistantReceiver:Lcom/miui/gallery/ui/AlbumDetailFragmentBase$VoiceAssistantReceiver;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$VoiceAssistantReceiver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$VoiceAssistantReceiver;-><init>(Lcom/miui/gallery/ui/AlbumDetailFragmentBase;Lcom/miui/gallery/ui/AlbumDetailFragmentBase$1;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mVoiceAssistantReceiver:Lcom/miui/gallery/ui/AlbumDetailFragmentBase$VoiceAssistantReceiver;

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mVoiceAssistantReceiver:Lcom/miui/gallery/ui/AlbumDetailFragmentBase$VoiceAssistantReceiver;

    new-instance v2, Landroid/content/IntentFilter;

    const-string v3, "com.miui.gallery.action.VOICE_ASSISTANT_SELECT_SHARE"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/content/LocalBroadcastManager;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    :cond_0
    return-void
.end method

.method public onResume(Landroid/arch/lifecycle/LifecycleOwner;)V
    .locals 1

    invoke-static {}, Landroid/arch/lifecycle/ProcessLifecycleOwner;->get()Landroid/arch/lifecycle/LifecycleOwner;

    move-result-object v0

    if-ne p1, v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->getLifecycle()Landroid/arch/lifecycle/Lifecycle;

    move-result-object p1

    invoke-virtual {p1}, Landroid/arch/lifecycle/Lifecycle;->getCurrentState()Landroid/arch/lifecycle/Lifecycle$State;

    move-result-object p1

    sget-object v0, Landroid/arch/lifecycle/Lifecycle$State;->STARTED:Landroid/arch/lifecycle/Lifecycle$State;

    invoke-virtual {p1, v0}, Landroid/arch/lifecycle/Lifecycle$State;->isAtLeast(Landroid/arch/lifecycle/Lifecycle$State;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "AlbumDetailFragmentBase"

    const-string v0, "onProcessResumed"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->scanAlbumFolderIfNeeded()V

    :cond_0
    return-void
.end method

.method public synthetic onStart(Landroid/arch/lifecycle/LifecycleOwner;)V
    .locals 0

    invoke-static {p0, p1}, Landroid/arch/lifecycle/DefaultLifecycleObserver$-CC;->$default$onStart(Landroid/arch/lifecycle/DefaultLifecycleObserver;Landroid/arch/lifecycle/LifecycleOwner;)V

    return-void
.end method

.method public synthetic onStop(Landroid/arch/lifecycle/LifecycleOwner;)V
    .locals 0

    invoke-static {p0, p1}, Landroid/arch/lifecycle/DefaultLifecycleObserver$-CC;->$default$onStop(Landroid/arch/lifecycle/DefaultLifecycleObserver;Landroid/arch/lifecycle/LifecycleOwner;)V

    return-void
.end method

.method protected removeFromOtherAlbums()V
    .locals 3

    new-instance v0, Lmiui/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lmiui/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f1004e5

    invoke-virtual {v0, v1}, Lmiui/app/AlertDialog$Builder;->setTitle(I)Lmiui/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f1005e1

    invoke-virtual {v0, v1}, Lmiui/app/AlertDialog$Builder;->setMessage(I)Lmiui/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$3;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase$3;-><init>(Lcom/miui/gallery/ui/AlbumDetailFragmentBase;)V

    const v2, 0x104000a

    invoke-virtual {v0, v2, v1}, Lmiui/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;

    move-result-object v0

    const/high16 v1, 0x1040000

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lmiui/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lmiui/app/AlertDialog$Builder;->show()Lmiui/app/AlertDialog;

    return-void
.end method

.method protected showDialog(IIILandroid/content/DialogInterface$OnClickListener;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    :cond_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1, p3, p4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const/high16 p2, 0x1040000

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mDialog:Landroid/app/Dialog;

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->mDialog:Landroid/app/Dialog;

    invoke-virtual {p1}, Landroid/app/Dialog;->show()V

    return-void
.end method
