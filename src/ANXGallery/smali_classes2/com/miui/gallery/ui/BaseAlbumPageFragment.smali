.class public abstract Lcom/miui/gallery/ui/BaseAlbumPageFragment;
.super Lcom/miui/gallery/ui/BaseFragment;
.source "BaseAlbumPageFragment.java"


# instance fields
.field protected mAlbumConvertCallback:Lcom/miui/gallery/loader/CursorConvertCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/loader/CursorConvertCallback<",
            "Lcom/miui/gallery/model/AlbumList;",
            ">;"
        }
    .end annotation
.end field

.field protected mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

.field private mCompleteListener:Lcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;

.field protected mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

.field protected mSelectedAlbum:Lcom/miui/gallery/model/Album;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/BaseFragment;-><init>()V

    new-instance v0, Lcom/miui/gallery/loader/AlbumConvertCallback;

    invoke-direct {v0}, Lcom/miui/gallery/loader/AlbumConvertCallback;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mAlbumConvertCallback:Lcom/miui/gallery/loader/CursorConvertCallback;

    new-instance v0, Lcom/miui/gallery/ui/BaseAlbumPageFragment$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment$2;-><init>(Lcom/miui/gallery/ui/BaseAlbumPageFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mCompleteListener:Lcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/BaseAlbumPageFragment;)Lcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mCompleteListener:Lcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/BaseAlbumPageFragment;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->doChangeShowInOtherAlbums(Z)V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/BaseAlbumPageFragment;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->onEnableAutoUpload(Z)V

    return-void
.end method

.method private doChangeShowInOtherAlbums(Z)V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mSelectedAlbum:Lcom/miui/gallery/model/Album;

    invoke-virtual {v1}, Lcom/miui/gallery/model/Album;->getAlbumId()J

    move-result-wide v1

    invoke-static {v0, v1, v2, p1}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->doChangeShowInOtherAlbums(Landroid/content/Context;JZ)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->getActivity()Landroid/app/Activity;

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

.method private doChangeShowInPhotosTab(Z)V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mSelectedAlbum:Lcom/miui/gallery/model/Album;

    invoke-virtual {v1}, Lcom/miui/gallery/model/Album;->getAlbumId()J

    move-result-wide v1

    invoke-static {v0, v1, v2, p1}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->doChangeShowInPhotosTab(Landroid/content/Context;JZ)V

    return-void
.end method

.method private doDelete(Ljava/lang/String;)V
    .locals 10

    iget-object v0, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mSelectedAlbum:Lcom/miui/gallery/model/Album;

    invoke-virtual {v0}, Lcom/miui/gallery/model/Album;->getCount()I

    move-result v0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/util/SyncUtil;->existXiaomiAccount(Landroid/content/Context;)Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_0

    iget-object v4, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    iget-object v5, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mSelectedAlbum:Lcom/miui/gallery/model/Album;

    invoke-virtual {v5}, Lcom/miui/gallery/model/Album;->getAttributes()J

    move-result-wide v5

    iget-object v7, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mSelectedAlbum:Lcom/miui/gallery/model/Album;

    invoke-virtual {v7}, Lcom/miui/gallery/model/Album;->getServerId()Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mSelectedAlbum:Lcom/miui/gallery/model/Album;

    invoke-virtual {v8}, Lcom/miui/gallery/model/Album;->getAlbumId()J

    move-result-wide v8

    invoke-virtual/range {v4 .. v9}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->isAutoUploadedAlbum(JLjava/lang/String;J)Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$LocalMode;->isOnlyShowLocalPhoto()Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v4, 0x1

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-virtual {v5}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f1002f4

    const/4 v7, 0x3

    new-array v7, v7, [Ljava/lang/Object;

    if-eqz v1, :cond_1

    if-nez v4, :cond_1

    const v1, 0x7f1002f7

    invoke-virtual {p0, v1}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    :cond_1
    const-string v1, ""

    :goto_1
    aput-object v1, v7, v3

    aput-object p1, v7, v2

    const/4 p1, 0x2

    if-lez v0, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v8, 0x7f0e000a

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v2, v3

    invoke-virtual {v1, v8, v0, v2}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_2

    :cond_2
    const-string v0, ""

    :goto_2
    aput-object v0, v7, p1

    invoke-virtual {v5, v6, v7}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    new-instance v0, Lmiui/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lmiui/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    if-eqz v4, :cond_3

    const v1, 0x7f1002f8

    invoke-virtual {p0, v1}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v3, v1}, Lmiui/app/AlertDialog$Builder;->setCheckBox(ZLjava/lang/CharSequence;)Lmiui/app/AlertDialog$Builder;

    :cond_3
    const v1, 0x7f1002f2

    invoke-virtual {v0, v1}, Lmiui/app/AlertDialog$Builder;->setTitle(I)Lmiui/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Lmiui/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    const v0, 0x104000a

    new-instance v1, Lcom/miui/gallery/ui/BaseAlbumPageFragment$1;

    invoke-direct {v1, p0, v4}, Lcom/miui/gallery/ui/BaseAlbumPageFragment$1;-><init>(Lcom/miui/gallery/ui/BaseAlbumPageFragment;Z)V

    invoke-virtual {p1, v0, v1}, Lmiui/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    const/high16 v0, 0x1040000

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lmiui/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lmiui/app/AlertDialog$Builder;->show()Lmiui/app/AlertDialog;

    return-void
.end method

.method private doForceTop(Z)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mSelectedAlbum:Lcom/miui/gallery/model/Album;

    invoke-virtual {v0}, Lcom/miui/gallery/model/Album;->getAlbumId()J

    move-result-wide v0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2, v0, v1, p1}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->doForceTop(Landroid/content/Context;JZ)V

    return-void
.end method

.method private doHideOrUnhide(Z)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mSelectedAlbum:Lcom/miui/gallery/model/Album;

    invoke-virtual {v0}, Lcom/miui/gallery/model/Album;->getAlbumId()J

    move-result-wide v0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2, v0, v1, p1}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->doHideOrUnhide(Landroid/content/Context;JZ)V

    return-void
.end method

.method private doRename()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mSelectedAlbum:Lcom/miui/gallery/model/Album;

    invoke-virtual {v0}, Lcom/miui/gallery/model/Album;->getAlbumId()J

    move-result-wide v0

    iget-object v2, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mSelectedAlbum:Lcom/miui/gallery/model/Album;

    invoke-virtual {v2}, Lcom/miui/gallery/model/Album;->getAlbumName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/ui/AlbumRenameDialogFragment;->newInstance(JLjava/lang/String;Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$OnAlbumOperationDoneListener;)Lcom/miui/gallery/ui/AlbumRenameDialogFragment;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    const-string v2, "AlbumRenameDialogFragment"

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/ui/AlbumRenameDialogFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method private isManualRenameRestricted(Ljava/lang/String;)Z
    .locals 2

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    invoke-static {p1}, Lcom/miui/gallery/util/StorageUtils;->ensureCommonRelativePath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getAlbumByPath(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Album;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Album;->getAttributes()Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Album;->getAttributes()Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Attributes;->isManualRenameRestricted()Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method private moveToOtherAlbums()V
    .locals 7

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v5, Lcom/miui/gallery/ui/BaseAlbumPageFragment$4;

    invoke-direct {v5, p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment$4;-><init>(Lcom/miui/gallery/ui/BaseAlbumPageFragment;)V

    const v1, 0x7f10047d

    const v2, 0x7f1004df

    const v3, 0x104000a

    const/high16 v4, 0x1040000

    const/4 v6, 0x0

    invoke-static/range {v0 .. v6}, Lcom/miui/gallery/util/DialogUtil;->showInfoDialog(Landroid/content/Context;IIIILandroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog;

    return-void
.end method

.method private onEnableAutoUpload(Z)V
    .locals 3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    if-eqz p1, :cond_0

    const-string p1, "check_login_and_sync"

    const/4 v1, 0x2

    invoke-virtual {v0, p1, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    goto :goto_0

    :cond_0
    const-string p1, "check_login_and_sync"

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    :goto_0
    const-string p1, "cloud_guide_source"

    sget-object v1, Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;->AUTOBACKUP:Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;

    invoke-virtual {v0, p1, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    const-string p1, "autobackup_album_id"

    iget-object v1, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mSelectedAlbum:Lcom/miui/gallery/model/Album;

    invoke-virtual {v1}, Lcom/miui/gallery/model/Album;->getAlbumId()J

    move-result-wide v1

    invoke-virtual {v0, p1, v1, v2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    invoke-static {p0, v0}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->checkLoginAndSyncState(Landroid/app/Fragment;Landroid/os/Bundle;)V

    return-void
.end method

.method private removeFromOtherAlbums()V
    .locals 7

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v5, Lcom/miui/gallery/ui/BaseAlbumPageFragment$3;

    invoke-direct {v5, p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment$3;-><init>(Lcom/miui/gallery/ui/BaseAlbumPageFragment;)V

    const v1, 0x7f1005e1

    const v2, 0x7f1004e5

    const v3, 0x104000a

    const/high16 v4, 0x1040000

    const/4 v6, 0x0

    invoke-static/range {v0 .. v6}, Lcom/miui/gallery/util/DialogUtil;->showInfoDialog(Landroid/content/Context;IIIILandroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog;

    return-void
.end method

.method private showAlbumShareInfo()V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    iget-object v1, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mSelectedAlbum:Lcom/miui/gallery/model/Album;

    invoke-virtual {v1}, Lcom/miui/gallery/model/Album;->getAttributes()J

    move-result-wide v1

    iget-object v3, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mSelectedAlbum:Lcom/miui/gallery/model/Album;

    invoke-virtual {v3}, Lcom/miui/gallery/model/Album;->getServerId()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mSelectedAlbum:Lcom/miui/gallery/model/Album;

    invoke-virtual {v4}, Lcom/miui/gallery/model/Album;->getAlbumId()J

    move-result-wide v4

    invoke-virtual/range {v0 .. v5}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->isAutoUploadedAlbum(JLjava/lang/String;J)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f100075

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v3, 0x7f100074

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/high16 v4, 0x1040000

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v5, 0x104000a

    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    new-instance v6, Lcom/miui/gallery/ui/BaseAlbumPageFragment$7;

    invoke-direct {v6, p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment$7;-><init>(Lcom/miui/gallery/ui/BaseAlbumPageFragment;)V

    invoke-static/range {v1 .. v6}, Lcom/miui/gallery/ui/ConfirmDialog;->showConfirmDialog(Landroid/app/FragmentManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/ui/ConfirmDialog$ConfirmDialogInterface;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->share()V

    :goto_0
    return-void
.end method

.method private statAlbumOperation(Lcom/miui/gallery/model/Album;Ljava/lang/String;)V
    .locals 2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "path"

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getLocalPath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "album"

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method


# virtual methods
.method protected disableAutoUpload()V
    .locals 7

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v5, Lcom/miui/gallery/ui/BaseAlbumPageFragment$6;

    invoke-direct {v5, p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment$6;-><init>(Lcom/miui/gallery/ui/BaseAlbumPageFragment;)V

    const v1, 0x7f10030b

    const v2, 0x7f10030c

    const v3, 0x104000a

    const/high16 v4, 0x1040000

    const/4 v6, 0x0

    invoke-static/range {v0 .. v6}, Lcom/miui/gallery/util/DialogUtil;->showInfoDialog(Landroid/content/Context;IIIILandroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog;

    return-void
.end method

.method protected doChangeAutoUpload(Z)Z
    .locals 4

    const/4 v0, 0x0

    if-nez p1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    iget-object v2, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mSelectedAlbum:Lcom/miui/gallery/model/Album;

    invoke-virtual {v2}, Lcom/miui/gallery/model/Album;->getAlbumId()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->isShareAlbum(J)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    const v1, 0x7f100671

    invoke-static {p1, v1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    return v0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/account/AccountHelper;->getXiaomiAccount(Landroid/content/Context;)Landroid/accounts/Account;

    move-result-object v1

    if-eqz v1, :cond_4

    const/4 v2, 0x1

    if-eqz p1, :cond_2

    const-string v3, "com.miui.gallery.cloud.provider"

    invoke-static {v1, v3}, Landroid/content/ContentResolver;->getSyncAutomatically(Landroid/accounts/Account;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1, v2}, Lcom/miui/gallery/util/SyncUtil;->setSyncAutomatically(Landroid/content/Context;Z)Z

    move-result v1

    if-nez v1, :cond_1

    return v0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->updateGalleryCloudSyncableState()V

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mSelectedAlbum:Lcom/miui/gallery/model/Album;

    invoke-virtual {v0}, Lcom/miui/gallery/model/Album;->getAlbumId()J

    move-result-wide v0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-static {v3, v0, v1, p1}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->doChangeAutoUpload(Landroid/content/Context;JZ)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

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

.method protected enableAutoUpload()V
    .locals 7

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v5, Lcom/miui/gallery/ui/BaseAlbumPageFragment$5;

    invoke-direct {v5, p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment$5;-><init>(Lcom/miui/gallery/ui/BaseAlbumPageFragment;)V

    const v1, 0x7f100336

    const v2, 0x7f100337

    const v3, 0x104000a

    const/high16 v4, 0x1040000

    const/4 v6, 0x0

    invoke-static/range {v0 .. v6}, Lcom/miui/gallery/util/DialogUtil;->showInfoDialog(Landroid/content/Context;IIIILandroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog;

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    const/4 v0, -0x1

    if-ne p2, v0, :cond_3

    const/16 p2, 0x1d

    if-eq p1, p2, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mSelectedAlbum:Lcom/miui/gallery/model/Album;

    if-nez p1, :cond_1

    const-string p1, "BaseAlbumPageFragment"

    const-string p2, "The selected album entity is null!"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    const-string p1, "check_login_and_sync"

    invoke-virtual {p3, p1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    const/4 p2, 0x1

    if-ne p1, p2, :cond_2

    invoke-virtual {p0, p2}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->doChangeAutoUpload(Z)Z

    goto :goto_0

    :cond_2
    const/4 p3, 0x2

    if-ne p1, p3, :cond_3

    invoke-virtual {p0, p2}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->doChangeAutoUpload(Z)Z

    move-result p1

    if-eqz p1, :cond_3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->share()V

    :cond_3
    :goto_0
    return-void
.end method

.method public onContextItemSelected(Landroid/view/MenuItem;)Z
    .locals 2

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const/4 v1, 0x1

    sparse-switch p1, :sswitch_data_0

    return v0

    :sswitch_0
    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->doHideOrUnhide(Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mSelectedAlbum:Lcom/miui/gallery/model/Album;

    const-string v0, "unhide_album"

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->statAlbumOperation(Lcom/miui/gallery/model/Album;Ljava/lang/String;)V

    goto/16 :goto_0

    :sswitch_1
    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->doForceTop(Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mSelectedAlbum:Lcom/miui/gallery/model/Album;

    const-string v0, "unforce_top"

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->statAlbumOperation(Lcom/miui/gallery/model/Album;Ljava/lang/String;)V

    goto/16 :goto_0

    :sswitch_2
    invoke-direct {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->showAlbumShareInfo()V

    iget-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mSelectedAlbum:Lcom/miui/gallery/model/Album;

    const-string v0, "share_album"

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->statAlbumOperation(Lcom/miui/gallery/model/Album;Ljava/lang/String;)V

    goto/16 :goto_0

    :sswitch_3
    invoke-direct {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->doRename()V

    iget-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mSelectedAlbum:Lcom/miui/gallery/model/Album;

    const-string v0, "rename_album"

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->statAlbumOperation(Lcom/miui/gallery/model/Album;Ljava/lang/String;)V

    goto :goto_0

    :sswitch_4
    invoke-direct {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->removeFromOtherAlbums()V

    iget-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mSelectedAlbum:Lcom/miui/gallery/model/Album;

    const-string v0, "show_in_others_disable"

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->statAlbumOperation(Lcom/miui/gallery/model/Album;Ljava/lang/String;)V

    goto :goto_0

    :sswitch_5
    invoke-direct {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->moveToOtherAlbums()V

    iget-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mSelectedAlbum:Lcom/miui/gallery/model/Album;

    const-string v0, "show_in_others_enable"

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->statAlbumOperation(Lcom/miui/gallery/model/Album;Ljava/lang/String;)V

    goto :goto_0

    :sswitch_6
    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->doHideOrUnhide(Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mSelectedAlbum:Lcom/miui/gallery/model/Album;

    const-string v0, "hide_album"

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->statAlbumOperation(Lcom/miui/gallery/model/Album;Ljava/lang/String;)V

    goto :goto_0

    :sswitch_7
    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->doForceTop(Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mSelectedAlbum:Lcom/miui/gallery/model/Album;

    const-string v0, "force_top"

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->statAlbumOperation(Lcom/miui/gallery/model/Album;Ljava/lang/String;)V

    goto :goto_0

    :sswitch_8
    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->doChangeShowInPhotosTab(Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mSelectedAlbum:Lcom/miui/gallery/model/Album;

    const-string v0, "show_in_home_enable"

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->statAlbumOperation(Lcom/miui/gallery/model/Album;Ljava/lang/String;)V

    goto :goto_0

    :sswitch_9
    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->enableAutoUpload()V

    iget-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mSelectedAlbum:Lcom/miui/gallery/model/Album;

    const-string v0, "auto_upload_enable"

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->statAlbumOperation(Lcom/miui/gallery/model/Album;Ljava/lang/String;)V

    goto :goto_0

    :sswitch_a
    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->doChangeShowInPhotosTab(Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mSelectedAlbum:Lcom/miui/gallery/model/Album;

    const-string v0, "show_in_home_disable"

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->statAlbumOperation(Lcom/miui/gallery/model/Album;Ljava/lang/String;)V

    goto :goto_0

    :sswitch_b
    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->disableAutoUpload()V

    iget-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mSelectedAlbum:Lcom/miui/gallery/model/Album;

    const-string v0, "auto_upload_disable"

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->statAlbumOperation(Lcom/miui/gallery/model/Album;Ljava/lang/String;)V

    goto :goto_0

    :sswitch_c
    iget-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mSelectedAlbum:Lcom/miui/gallery/model/Album;

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getLocalizedAlbumName()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->doDelete(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mSelectedAlbum:Lcom/miui/gallery/model/Album;

    const-string v0, "delete_album"

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->statAlbumOperation(Lcom/miui/gallery/model/Album;Ljava/lang/String;)V

    :goto_0
    return v1

    nop

    :sswitch_data_0
    .sparse-switch
        0x7f0900c6 -> :sswitch_c
        0x7f0900d9 -> :sswitch_b
        0x7f0900da -> :sswitch_a
        0x7f0900fe -> :sswitch_9
        0x7f090100 -> :sswitch_8
        0x7f09013d -> :sswitch_7
        0x7f09015e -> :sswitch_6
        0x7f0901e3 -> :sswitch_5
        0x7f09025f -> :sswitch_4
        0x7f090262 -> :sswitch_3
        0x7f0902a0 -> :sswitch_2
        0x7f09031b -> :sswitch_1
        0x7f09031c -> :sswitch_0
    .end sparse-switch
.end method

.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 0

    if-nez p3, :cond_0

    return-void

    :cond_0
    check-cast p3, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView$RecyclerContextMenuInfo;

    iget p2, p3, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView$RecyclerContextMenuInfo;->position:I

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->setContextMenuItems(Landroid/view/ContextMenu;I)V

    return-void
.end method

.method public onStart()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseFragment;->onStart()V

    iget-object v0, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->updateGalleryCloudSyncableState()V

    iget-object v0, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->registerForContextMenu(Landroid/view/View;)V

    :cond_0
    return-void
.end method

.method public onStop()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseFragment;->onStop()V

    iget-object v0, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->unregisterForContextMenu(Landroid/view/View;)V

    :cond_0
    return-void
.end method

.method protected setContextMenuItems(Landroid/view/ContextMenu;I)V
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    iget-object v3, v0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {v3, v2}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->getItem(I)Lcom/miui/gallery/model/Album;

    move-result-object v3

    if-nez v3, :cond_0

    const-string v1, "BaseAlbumPageFragment"

    const-string v2, "album entity should not be null!!!"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-virtual {v3}, Lcom/miui/gallery/model/Album;->getAlbumType()Lcom/miui/gallery/model/Album$AlbumType;

    move-result-object v4

    sget-object v5, Lcom/miui/gallery/model/Album$AlbumType;->OTHER_ALBUMS:Lcom/miui/gallery/model/Album$AlbumType;

    if-ne v4, v5, :cond_1

    return-void

    :cond_1
    iput-object v3, v0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mSelectedAlbum:Lcom/miui/gallery/model/Album;

    iget-object v3, v0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v3}, Lcom/miui/gallery/activity/BaseActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v3

    const v4, 0x7f0c0001

    invoke-virtual {v3, v4, v1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    iget-object v3, v0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mSelectedAlbum:Lcom/miui/gallery/model/Album;

    invoke-virtual {v3}, Lcom/miui/gallery/model/Album;->getLocalizedAlbumName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Landroid/view/ContextMenu;->setHeaderTitle(Ljava/lang/CharSequence;)Landroid/view/ContextMenu;

    const v3, 0x7f09013d

    invoke-interface {v1, v3}, Landroid/view/ContextMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    const v4, 0x7f09031b

    invoke-interface {v1, v4}, Landroid/view/ContextMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v4

    const v5, 0x7f0900c6

    invoke-interface {v1, v5}, Landroid/view/ContextMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v5

    const v6, 0x7f0902a0

    invoke-interface {v1, v6}, Landroid/view/ContextMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v6

    const v7, 0x7f09025f

    invoke-interface {v1, v7}, Landroid/view/ContextMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v7

    const v8, 0x7f0901e3

    invoke-interface {v1, v8}, Landroid/view/ContextMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v8

    const v9, 0x7f0900fe

    invoke-interface {v1, v9}, Landroid/view/ContextMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v9

    const v10, 0x7f0900d9

    invoke-interface {v1, v10}, Landroid/view/ContextMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v10

    const v11, 0x7f090100

    invoke-interface {v1, v11}, Landroid/view/ContextMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v11

    const v12, 0x7f0900da

    invoke-interface {v1, v12}, Landroid/view/ContextMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v12

    const v13, 0x7f09015e

    invoke-interface {v1, v13}, Landroid/view/ContextMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v13

    const v14, 0x7f09031c

    invoke-interface {v1, v14}, Landroid/view/ContextMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v14

    const v15, 0x7f090262

    invoke-interface {v1, v15}, Landroid/view/ContextMenu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    iget-object v15, v0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {v15, v2}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->isForceTypeTime(I)Z

    move-result v15

    move-object/from16 v16, v8

    const/4 v8, 0x1

    if-eqz v15, :cond_2

    invoke-interface {v4, v8}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_0

    :cond_2
    invoke-interface {v3, v8}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :goto_0
    iget-object v3, v0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v3}, Lcom/miui/gallery/util/SyncUtil;->isGalleryCloudSyncable(Landroid/content/Context;)Z

    move-result v3

    iget-object v4, v0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {v4, v2}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->isSystemAlbum(I)Z

    move-result v4

    if-eqz v4, :cond_6

    iget-object v1, v0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {v1, v2}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->isScreenshotsAlbum(I)Z

    move-result v1

    if-eqz v1, :cond_13

    if-eqz v3, :cond_4

    iget-object v1, v0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {v1, v2}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->isAutoUploadedAlbum(I)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v10, v8}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_1

    :cond_3
    invoke-interface {v9, v8}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_4
    :goto_1
    iget-object v1, v0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {v1, v2}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->isShowedPhotosTabAlbum(I)Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v12, v8}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto/16 :goto_5

    :cond_5
    invoke-interface {v11, v8}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto/16 :goto_5

    :cond_6
    iget-object v4, v0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {v4, v2}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->isOtherShareAlbum(I)Z

    move-result v4

    if-eqz v4, :cond_9

    invoke-static {}, Lcom/miui/gallery/util/deviceprovider/ApplicationHelper;->supportShare()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-interface {v6, v8}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_7
    iget-object v1, v0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {v1, v2}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->isHiddenAlbum(I)Z

    move-result v1

    if-eqz v1, :cond_8

    invoke-interface {v14, v8}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto/16 :goto_5

    :cond_8
    invoke-interface {v13, v8}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto/16 :goto_5

    :cond_9
    iget-object v4, v0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {v4, v2}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->albumUnwriteable(I)Z

    move-result v4

    if-eqz v4, :cond_b

    iget-object v1, v0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {v1, v2}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->isHiddenAlbum(I)Z

    move-result v1

    if-eqz v1, :cond_a

    invoke-interface {v14, v8}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_5

    :cond_a
    invoke-interface {v13, v8}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_5

    :cond_b
    invoke-interface {v5, v8}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    invoke-static {}, Lcom/miui/gallery/util/deviceprovider/ApplicationHelper;->supportShare()Z

    move-result v4

    if-eqz v4, :cond_c

    invoke-interface {v6, v8}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_c
    iget-object v4, v0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {v4, v2}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->isBabyAlbum(I)Z

    move-result v4

    if-nez v4, :cond_10

    if-eqz v3, :cond_e

    iget-object v3, v0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {v3, v2}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->isAutoUploadedAlbum(I)Z

    move-result v3

    if-eqz v3, :cond_d

    invoke-interface {v10, v8}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_2

    :cond_d
    invoke-interface {v9, v8}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_e
    :goto_2
    iget-object v3, v0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {v3, v2}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->isHiddenAlbum(I)Z

    move-result v3

    if-eqz v3, :cond_f

    invoke-interface {v14, v8}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_3

    :cond_f
    invoke-interface {v13, v8}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :goto_3
    iget-object v3, v0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mSelectedAlbum:Lcom/miui/gallery/model/Album;

    invoke-virtual {v3}, Lcom/miui/gallery/model/Album;->getLocalPath()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->isManualRenameRestricted(Ljava/lang/String;)Z

    move-result v3

    xor-int/2addr v3, v8

    invoke-interface {v1, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_10
    iget-object v1, v0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {v1, v2}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->isOtherAlbum(I)Z

    move-result v1

    if-eqz v1, :cond_11

    invoke-interface {v7, v8}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_4

    :cond_11
    move-object/from16 v1, v16

    invoke-interface {v1, v8}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :goto_4
    iget-object v1, v0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {v1, v2}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->isShowedPhotosTabAlbum(I)Z

    move-result v1

    if-eqz v1, :cond_12

    invoke-interface {v12, v8}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_5

    :cond_12
    invoke-interface {v11, v8}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_13
    :goto_5
    return-void
.end method

.method protected share()V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mSelectedAlbum:Lcom/miui/gallery/model/Album;

    invoke-virtual {v0}, Lcom/miui/gallery/model/Album;->getAlbumId()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/ShareAlbumManager;->isOtherShareAlbumId(J)Z

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mSelectedAlbum:Lcom/miui/gallery/model/Album;

    invoke-virtual {v1}, Lcom/miui/gallery/model/Album;->getAlbumId()J

    move-result-wide v1

    if-eqz v0, :cond_0

    invoke-static {v1, v2}, Lcom/miui/gallery/provider/ShareAlbumManager;->getOriginalAlbumId(J)J

    move-result-wide v1

    :cond_0
    iget-object v3, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mSelectedAlbum:Lcom/miui/gallery/model/Album;

    invoke-virtual {v3}, Lcom/miui/gallery/model/Album;->getBabyInfo()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    xor-int/lit8 v3, v3, 0x1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    new-instance v5, Lcom/miui/gallery/share/Path;

    invoke-direct {v5, v1, v2, v0, v3}, Lcom/miui/gallery/share/Path;-><init>(JZZ)V

    if-eqz v0, :cond_1

    const/4 v0, 0x6

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    invoke-static {v4, v5, v0}, Lcom/miui/gallery/share/UIHelper;->showAlbumShareInfo(Landroid/app/Activity;Lcom/miui/gallery/share/Path;I)V

    return-void
.end method
