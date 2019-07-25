.class public Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;
.super Lcom/miui/gallery/widget/GalleryDialogFragment;
.source "AddRemoveSecretDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment$AddRemoveTask;
    }
.end annotation


# instance fields
.field private mAlbumId:J

.field private mHasVideo:Z

.field private mListener:Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;

.field private mMediaIds:[J

.field private mMediaUris:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field

.field private mOperationType:I

.field private mProgressDialog:Lmiui/app/ProgressDialog;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;)Lmiui/app/ProgressDialog;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->startAddOrRemoveSecretTask()V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;)Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->mListener:Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->mOperationType:I

    return p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->mHasVideo:Z

    return p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;)[J
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->mMediaIds:[J

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;)Ljava/util/ArrayList;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->mMediaUris:Ljava/util/ArrayList;

    return-object p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;)J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->mAlbumId:J

    return-wide v0
.end method

.method public static add(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;ZLjava/util/ArrayList;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;",
            "Z",
            "Ljava/util/ArrayList<",
            "Landroid/net/Uri;",
            ">;)V"
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;

    invoke-direct {v0}, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "arg_operation_type"

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v2, "arg_media_uris"

    invoke-virtual {v1, v2, p3}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    const-string p3, "arg_has_video"

    invoke-virtual {v1, p3, p2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->setArguments(Landroid/os/Bundle;)V

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->setOnCompleteListener(Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p0

    const-string p1, "AddRemoveSecretDialogFragment"

    invoke-virtual {v0, p0, p1}, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method public static varargs add(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;Z[J)V
    .locals 4

    new-instance v0, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;

    invoke-direct {v0}, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "arg_operation_type"

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v2, "arg_media_ids"

    invoke-virtual {v1, v2, p3}, Landroid/os/Bundle;->putLongArray(Ljava/lang/String;[J)V

    const-string p3, "arg_has_video"

    invoke-virtual {v1, p3, p2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->setArguments(Landroid/os/Bundle;)V

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->setOnCompleteListener(Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p0

    const-string p1, "AddRemoveSecretDialogFragment"

    invoke-virtual {v0, p0, p1}, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method private addOrRemoveSecret()V
    .locals 3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "key_check_gallery_sync"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v1, "cloud_guide_source"

    sget-object v2, Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;->SECRET:Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    invoke-static {p0, v0}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->checkLoginAndSyncState(Landroid/app/Fragment;Landroid/os/Bundle;)V

    return-void
.end method

.method private checkPrivateGalleryEnabled()V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/account/AccountHelper;->getXiaomiAccount(Landroid/content/Context;)Landroid/accounts/Account;

    move-result-object v0

    if-eqz v0, :cond_2

    const-string v1, "com.miui.gallery.cloud.provider"

    invoke-static {v0, v1}, Landroid/content/ContentResolver;->getSyncAutomatically(Landroid/accounts/Account;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0, v1}, Lcom/miui/gallery/util/SyncUtil;->setSyncAutomatically(Landroid/content/Context;Z)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Lcom/miui/privacy/LockSettingsHelper;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/miui/privacy/LockSettingsHelper;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0}, Lcom/miui/privacy/LockSettingsHelper;->isPrivacyPasswordEnabled()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {v1}, Lcom/miui/gallery/preference/GalleryPreferences$Secret;->setIsFirstAddSecret(Z)V

    invoke-static {v1}, Lcom/miui/gallery/preference/GalleryPreferences$Secret;->setFirstAddSecretVideo(Z)V

    const/16 v0, 0x1c

    invoke-static {p0, v0}, Lcom/miui/privacy/LockSettingsHelper;->startSetPrivacyPasswordActivity(Landroid/app/Fragment;I)V

    goto :goto_0

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->doAddOrRemoveSecret()V

    :cond_2
    :goto_0
    return-void
.end method

.method private doAddOrRemoveSecret()V
    .locals 7

    iget v0, p0, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->mOperationType:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->mMediaIds:[J

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Lcom/miui/gallery/util/CheckDownloadOriginHelper;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v3

    iget-wide v4, p0, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->mAlbumId:J

    iget-object v6, p0, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->mMediaIds:[J

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Lcom/miui/gallery/util/CheckDownloadOriginHelper;-><init>(Landroid/content/Context;Landroid/app/FragmentManager;J[J)V

    new-instance v1, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment$1;-><init>(Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/util/CheckDownloadOriginHelper;->setListener(Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckDownloadOriginListener;)V

    invoke-virtual {v0}, Lcom/miui/gallery/util/CheckDownloadOriginHelper;->start()V

    return-void

    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->startAddOrRemoveSecretTask()V

    return-void
.end method

.method public static varargs remove(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;J[J)V
    .locals 4

    new-instance v0, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;

    invoke-direct {v0}, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "arg_operation_type"

    const/4 v3, 0x2

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v2, "arg_media_ids"

    invoke-virtual {v1, v2, p4}, Landroid/os/Bundle;->putLongArray(Ljava/lang/String;[J)V

    const-string p4, "arg_album_id"

    invoke-virtual {v1, p4, p2, p3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->setArguments(Landroid/os/Bundle;)V

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->setOnCompleteListener(Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p0

    const-string p1, "AddRemoveSecretDialogFragment"

    invoke-virtual {v0, p0, p1}, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method private startAddOrRemoveSecretTask()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    invoke-virtual {v0}, Lmiui/app/ProgressDialog;->show()V

    new-instance v0, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment$AddRemoveTask;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment$AddRemoveTask;-><init>(Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;)V

    sget-object v1, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment$AddRemoveTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Void;

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment$AddRemoveTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onActivityCreated(Landroid/os/Bundle;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->addOrRemoveSecret()V

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0

    const/4 p3, -0x1

    if-ne p2, p3, :cond_0

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-direct {p0}, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->checkPrivateGalleryEnabled()V

    goto :goto_0

    :pswitch_1
    invoke-direct {p0}, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->doAddOrRemoveSecret()V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->mListener:Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->mListener:Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;

    const/4 p2, 0x0

    invoke-interface {p1, p2}, Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;->onComplete([J)V

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->dismissAllowingStateLoss()V

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1c
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "arg_operation_type"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->mOperationType:I

    iget p1, p0, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->mOperationType:I

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-ne p1, v1, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v1, "arg_media_ids"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getLongArray(Ljava/lang/String;)[J

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->mMediaIds:[J

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v1, "arg_media_uris"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->mMediaUris:Ljava/util/ArrayList;

    iget-object p1, p0, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->mMediaIds:[J

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->mMediaUris:Ljava/util/ArrayList;

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "ids or uris can\'t be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v1, "arg_has_video"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, p0, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->mHasVideo:Z

    goto :goto_1

    :cond_2
    iget p1, p0, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->mOperationType:I

    const/4 v1, 0x2

    if-ne p1, v1, :cond_5

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v1, "arg_album_id"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v1

    iput-wide v1, p0, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->mAlbumId:J

    iget-wide v1, p0, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->mAlbumId:J

    const-wide/16 v3, 0x0

    cmp-long p1, v1, v3

    if-lez p1, :cond_4

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v1, "arg_media_ids"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getLongArray(Ljava/lang/String;)[J

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->mMediaIds:[J

    iget-object p1, p0, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->mMediaIds:[J

    if-eqz p1, :cond_3

    :goto_1
    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->setCancelable(Z)V

    return-void

    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "ids can\'t be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "albumId must > 0"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "unsupport operation"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    const-string v0, ""

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const v2, 0x7f100019

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-static {p1, v0, v1, v2, v3}, Lmiui/app/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZZ)Lmiui/app/ProgressDialog;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    iget-object p1, p0, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    return-object p1
.end method

.method public setOnCompleteListener(Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->mListener:Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;

    return-void
.end method
