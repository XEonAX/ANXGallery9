.class public Lcom/miui/gallery/ui/BackupDetailFragment;
.super Lcom/miui/gallery/ui/PhotoListFragmentBase;
.source "BackupDetailFragment.java"

# interfaces
.implements Lcom/miui/gallery/cloud/syncstate/OnSyncStateChangeObserver;
.implements Lcom/miui/gallery/sdk/uploadstatus/UploadStatusProxy$UploadStatusChangedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;,
        Lcom/miui/gallery/ui/BackupDetailFragment$BackupLoaderCallBack;
    }
.end annotation


# instance fields
.field private mBackUpTitle:Lcom/miui/gallery/ui/BackupTitle;

.field private mBackupDetailAdapter:Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;

.field protected mLoaderCallback:Landroid/app/LoaderManager$LoaderCallbacks;

.field private mUploadedItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoListFragmentBase;-><init>()V

    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/BackupDetailFragment;->mUploadedItems:Ljava/util/List;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/BackupDetailFragment;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/BackupDetailFragment;->mUploadedItems:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/BackupDetailFragment;)Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/BackupDetailFragment;->mBackupDetailAdapter:Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;

    return-object p0
.end method

.method private getSyncStateDisplayOptions()I
    .locals 1

    const/16 v0, 0xc

    return v0
.end method

.method private refreshOnUploadStatusChanged(Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/ui/BackupDetailFragment$2;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/ui/BackupDetailFragment$2;-><init>(Lcom/miui/gallery/ui/BackupDetailFragment;Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;)V

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method


# virtual methods
.method protected getAdapter()Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/BackupDetailFragment;->mBackupDetailAdapter:Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;

    return-object v0
.end method

.method protected getGridViewOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;
    .locals 1

    new-instance v0, Lcom/miui/gallery/ui/BackupDetailFragment$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/BackupDetailFragment$3;-><init>(Lcom/miui/gallery/ui/BackupDetailFragment;)V

    return-object v0
.end method

.method protected getLayoutSource()I
    .locals 1

    const v0, 0x7f0b002e

    return v0
.end method

.method protected getLoaderCallback()Landroid/app/LoaderManager$LoaderCallbacks;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/BackupDetailFragment;->mLoaderCallback:Landroid/app/LoaderManager$LoaderCallbacks;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/ui/BackupDetailFragment$BackupLoaderCallBack;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/BackupDetailFragment$BackupLoaderCallBack;-><init>(Lcom/miui/gallery/ui/BackupDetailFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/BackupDetailFragment;->mLoaderCallback:Landroid/app/LoaderManager$LoaderCallbacks;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/BackupDetailFragment;->mLoaderCallback:Landroid/app/LoaderManager$LoaderCallbacks;

    return-object v0
.end method

.method public getPageName()Ljava/lang/String;
    .locals 1

    const-string v0, "backup_detail"

    return-object v0
.end method

.method protected getProjection()[Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/BackupDetailFragment;->mBackupDetailAdapter:Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;

    sget-object v0, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;->PROJECTION:[Ljava/lang/String;

    return-object v0
.end method

.method protected getSelection()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "alias_sync_state = 3 OR alias_sync_state = 2 OR (alias_sync_state = 0 AND _id IN ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ","

    iget-object v2, p0, Lcom/miui/gallery/ui/BackupDetailFragment;->mUploadedItems:Ljava/util/List;

    invoke-static {v1, v2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "))"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getSelectionArgs()[Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected getSupportOperationMask()I
    .locals 1

    const/16 v0, 0x400

    return v0
.end method

.method protected getUri()Landroid/net/Uri;
    .locals 1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Media;->URI_ALL:Landroid/net/Uri;

    return-object v0
.end method

.method protected mayDoAdditionalWork(Landroid/database/Cursor;)V
    .locals 0

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 15

    move-object v14, p0

    const/4 v0, -0x1

    move/from16 v1, p2

    if-ne v1, v0, :cond_1

    const/16 v0, 0x24

    move/from16 v1, p1

    if-eq v1, v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BackupDetailFragment;->getSelection()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ") AND ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "localGroupId"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-wide/16 v1, -0x3e8

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BackupDetailFragment;->getUri()Landroid/net/Uri;

    move-result-object v2

    const/4 v3, 0x0

    iget-object v0, v14, Lcom/miui/gallery/ui/BackupDetailFragment;->mBackupDetailAdapter:Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;->getSecretCount()I

    move-result v4

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BackupDetailFragment;->getSelectionArgs()[Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BackupDetailFragment;->getCurrentSortOrder()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    iget-wide v9, v14, Lcom/miui/gallery/ui/BackupDetailFragment;->mAlbumId:J

    iget-object v11, v14, Lcom/miui/gallery/ui/BackupDetailFragment;->mAlbumName:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BackupDetailFragment;->getSupportOperationMask()I

    move-result v12

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BackupDetailFragment;->getAdapter()Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->supportFoldBurstItems()Z

    move-result v0

    xor-int/lit8 v13, v0, 0x1

    move-object v0, p0

    invoke-static/range {v0 .. v13}, Lcom/miui/gallery/util/IntentUtil;->gotoPhotoPage(Lcom/miui/gallery/ui/BaseMediaFragment;Landroid/view/ViewGroup;Landroid/net/Uri;IILjava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/model/ImageLoadParams;JLjava/lang/String;IZ)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BackupDetailFragment;->getPageName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "click_micro_thumb"

    const-wide/16 v2, 0x0

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    :cond_1
    :goto_0
    return-void
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoListFragmentBase;->onAttach(Landroid/app/Activity;)V

    invoke-static {}, Lcom/miui/gallery/sdk/uploadstatus/SyncProxy;->getInstance()Lcom/miui/gallery/sdk/uploadstatus/SyncProxy;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/uploadstatus/SyncProxy;->getUploadStatusProxy()Lcom/miui/gallery/sdk/uploadstatus/UploadStatusProxy;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/miui/gallery/sdk/uploadstatus/UploadStatusProxy;->addUploadStatusChangedListener(Lcom/miui/gallery/sdk/uploadstatus/UploadStatusProxy$UploadStatusChangedListener;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoListFragmentBase;->onCreate(Landroid/os/Bundle;)V

    return-void
.end method

.method public onDetach()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoListFragmentBase;->onDetach()V

    invoke-static {}, Lcom/miui/gallery/sdk/uploadstatus/SyncProxy;->getInstance()Lcom/miui/gallery/sdk/uploadstatus/SyncProxy;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/sdk/uploadstatus/SyncProxy;->getUploadStatusProxy()Lcom/miui/gallery/sdk/uploadstatus/UploadStatusProxy;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/miui/gallery/sdk/uploadstatus/UploadStatusProxy;->removeUploadStatusChangedListener(Lcom/miui/gallery/sdk/uploadstatus/UploadStatusProxy$UploadStatusChangedListener;)V

    return-void
.end method

.method public onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/ui/PhotoListFragmentBase;->onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f090057

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/view/ViewGroup;

    iget-object p3, p0, Lcom/miui/gallery/ui/BackupDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {p3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p3

    const v0, 0x7f0b0031

    const/4 v1, 0x0

    invoke-virtual {p3, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p3

    check-cast p3, Lcom/miui/gallery/ui/BackupTitle;

    iput-object p3, p0, Lcom/miui/gallery/ui/BackupDetailFragment;->mBackUpTitle:Lcom/miui/gallery/ui/BackupTitle;

    iget-object p3, p0, Lcom/miui/gallery/ui/BackupDetailFragment;->mBackUpTitle:Lcom/miui/gallery/ui/BackupTitle;

    invoke-virtual {p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    new-instance p2, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;

    iget-object p3, p0, Lcom/miui/gallery/ui/BackupDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    sget-object v0, Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;->SCENE_ALWAYS:Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;

    invoke-direct {p0}, Lcom/miui/gallery/ui/BackupDetailFragment;->getSyncStateDisplayOptions()I

    move-result v1

    invoke-direct {p2, p3, v0, v1}, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;-><init>(Landroid/content/Context;Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;I)V

    iput-object p2, p0, Lcom/miui/gallery/ui/BackupDetailFragment;->mBackupDetailAdapter:Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;

    iget-object p2, p0, Lcom/miui/gallery/ui/BackupDetailFragment;->mBackupDetailAdapter:Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;

    sget-object p3, Lcom/miui/gallery/widget/SortByHeader$SortBy;->DATE:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;->setCurrentSortBy(Lcom/miui/gallery/widget/SortByHeader$SortBy;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/BackupDetailFragment;->mBackupDetailAdapter:Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;

    sget-object p3, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->NORMAL:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;->setAlbumType(Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/BackupDetailFragment;->mAlbumDetailGridView:Landroid/widget/GridView;

    iget-object p3, p0, Lcom/miui/gallery/ui/BackupDetailFragment;->mBackupDetailAdapter:Lcom/miui/gallery/ui/BackupDetailFragment$BackupDetailAdapter;

    invoke-virtual {p2, p3}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/BackupDetailFragment;->mAlbumDetailGridView:Landroid/widget/GridView;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BackupDetailFragment;->getGridViewOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/widget/GridView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    new-instance p2, Lcom/miui/gallery/ui/BackupDetailFragment$1;

    invoke-direct {p2, p0, p1}, Lcom/miui/gallery/ui/BackupDetailFragment$1;-><init>(Lcom/miui/gallery/ui/BackupDetailFragment;Landroid/view/View;)V

    invoke-virtual {p1, p2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-object p1
.end method

.method public onPause()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoListFragmentBase;->onPause()V

    invoke-static {}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->getInstance()Lcom/miui/gallery/cloud/syncstate/SyncStateManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/BackupDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0, v1, p0}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->unregisterSyncStateObserver(Landroid/content/Context;Lcom/miui/gallery/cloud/syncstate/OnSyncStateChangeObserver;)V

    return-void
.end method

.method public onResume()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoListFragmentBase;->onResume()V

    invoke-static {}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->getInstance()Lcom/miui/gallery/cloud/syncstate/SyncStateManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/BackupDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0, v1, p0}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->registerSyncStateObserver(Landroid/content/Context;Lcom/miui/gallery/cloud/syncstate/OnSyncStateChangeObserver;)V

    return-void
.end method

.method public onSyncStateChanged(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/BackupDetailFragment;->mBackUpTitle:Lcom/miui/gallery/ui/BackupTitle;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/BackupTitle;->refreshSyncState(Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;)V

    return-void
.end method

.method public onUploadStatusChanged(Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;)V
    .locals 2

    if-eqz p1, :cond_1

    iget-object v0, p1, Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;->mStatus:Lcom/miui/gallery/sdk/SyncStatus;

    sget-object v1, Lcom/miui/gallery/sdk/SyncStatus;->STATUS_SUCCESS:Lcom/miui/gallery/sdk/SyncStatus;

    if-ne v0, v1, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;->getItemType()Lcom/miui/gallery/sdk/uploadstatus/ItemType;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/sdk/uploadstatus/ItemType;->OWNER:Lcom/miui/gallery/sdk/uploadstatus/ItemType;

    if-eq v0, v1, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;->getItemType()Lcom/miui/gallery/sdk/uploadstatus/ItemType;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/sdk/uploadstatus/ItemType;->SHARER:Lcom/miui/gallery/sdk/uploadstatus/ItemType;

    if-ne v0, v1, :cond_1

    :cond_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/BackupDetailFragment;->refreshOnUploadStatusChanged(Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;)V

    :cond_1
    return-void
.end method
