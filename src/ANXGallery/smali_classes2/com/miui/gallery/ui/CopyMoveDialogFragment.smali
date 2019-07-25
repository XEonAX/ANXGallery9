.class public Lcom/miui/gallery/ui/CopyMoveDialogFragment;
.super Lcom/miui/gallery/widget/GalleryDialogFragment;
.source "CopyMoveDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;
    }
.end annotation


# instance fields
.field private mActivity:Landroid/app/Activity;

.field private mAlbumId:J

.field private mDeleteOrigin:Z

.field private mDupType:I

.field private mListener:Lcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;

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

.field private mOperateSync:Z

.field private mProgressDialog:Lmiui/app/ProgressDialog;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)Lmiui/app/ProgressDialog;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->doCopyMove()V

    return-void
.end method

.method static synthetic access$1000(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)Ljava/util/ArrayList;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->mMediaUris:Ljava/util/ArrayList;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->cancelAndFinish()V

    return-void
.end method

.method static synthetic access$300(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)Lcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->mListener:Lcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->mDeleteOrigin:Z

    return p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)[J
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->mMediaIds:[J

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)Landroid/app/Activity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->mActivity:Landroid/app/Activity;

    return-object p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->mDupType:I

    return p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->mAlbumId:J

    return-wide v0
.end method

.method static synthetic access$900(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->mOperateSync:Z

    return p0
.end method

.method private cancelAndFinish()V
    .locals 3

    const-string v0, "CopyMoveDialogFragment"

    const-string v1, "cancelAndFinish"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->mListener:Lcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->mListener:Lcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;

    const/4 v1, 0x0

    iget-boolean v2, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->mDeleteOrigin:Z

    invoke-interface {v0, v1, v2}, Lcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;->onComplete([JZ)V

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->dismissAllowingStateLoss()V

    return-void
.end method

.method private doCheckOrigin()V
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->mMediaIds:[J

    if-nez v0, :cond_0

    const-string v0, "CopyMoveDialogFragment"

    const-string v1, "media ids is null"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->doCopyMove()V

    return-void

    :cond_0
    new-instance v0, Lcom/miui/gallery/util/CheckDownloadOriginHelper;

    iget-object v3, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->mActivity:Landroid/app/Activity;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v4

    iget-wide v5, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->mAlbumId:J

    iget-object v7, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->mMediaIds:[J

    move-object v2, v0

    invoke-direct/range {v2 .. v7}, Lcom/miui/gallery/util/CheckDownloadOriginHelper;-><init>(Landroid/content/Context;Landroid/app/FragmentManager;J[J)V

    new-instance v1, Lcom/miui/gallery/ui/CopyMoveDialogFragment$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment$1;-><init>(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/util/CheckDownloadOriginHelper;->setListener(Lcom/miui/gallery/util/CheckDownloadOriginHelper$CheckDownloadOriginListener;)V

    invoke-virtual {v0}, Lcom/miui/gallery/util/CheckDownloadOriginHelper;->start()V

    return-void
.end method

.method private doCopyMove()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->mActivity:Landroid/app/Activity;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "CopyMoveDialogFragment"

    const-string v1, "doCopyMove"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    invoke-virtual {v0}, Lmiui/app/ProgressDialog;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "CopyMoveDialogFragment"

    const-string v2, "show dialog ignore %s"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    new-instance v0, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;-><init>(Lcom/miui/gallery/ui/CopyMoveDialogFragment;)V

    sget-object v1, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Void;

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/ui/CopyMoveDialogFragment$CopyMoveTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    :cond_0
    return-void
.end method

.method public static show(Landroid/app/Activity;JLjava/util/ArrayList;ZLcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "J",
            "Ljava/util/ArrayList<",
            "Landroid/net/Uri;",
            ">;Z",
            "Lcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;",
            ")V"
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-direct {v0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "arg_album_id"

    invoke-virtual {v1, v2, p1, p2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string p1, "arg_media_uris"

    invoke-virtual {v1, p1, p3}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    const-string p1, "arg_delete_origin"

    invoke-virtual {v1, p1, p4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->setArguments(Landroid/os/Bundle;)V

    invoke-virtual {v0, p5}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->setOnCompleteListener(Lcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p0

    const-string p1, "CopyMoveDialogFragment"

    invoke-virtual {v0, p0, p1}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method public static show(Landroid/app/Activity;J[JIZLcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;)V
    .locals 8

    const/4 v7, 0x0

    move-object v0, p0

    move-wide v1, p1

    move-object v3, p3

    move v4, p4

    move v5, p5

    move-object v6, p6

    invoke-static/range {v0 .. v7}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->show(Landroid/app/Activity;J[JIZLcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;Z)V

    return-void
.end method

.method public static show(Landroid/app/Activity;J[JIZLcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;Z)V
    .locals 3

    new-instance v0, Lcom/miui/gallery/ui/CopyMoveDialogFragment;

    invoke-direct {v0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "arg_album_id"

    invoke-virtual {v1, v2, p1, p2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string p1, "arg_media_ids"

    invoke-virtual {v1, p1, p3}, Landroid/os/Bundle;->putLongArray(Ljava/lang/String;[J)V

    const-string p1, "arg_delete_origin"

    invoke-virtual {v1, p1, p5}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string p1, "arg_dup_type"

    invoke-virtual {v1, p1, p4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p1, "arg_operate_sync"

    invoke-virtual {v1, p1, p7}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->setArguments(Landroid/os/Bundle;)V

    invoke-virtual {v0, p6}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->setOnCompleteListener(Lcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p0

    const-string p1, "CopyMoveDialogFragment"

    invoke-virtual {v0, p0, p1}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onActivityCreated(Landroid/os/Bundle;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->doCheckOrigin()V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "arg_album_id"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->mAlbumId:J

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "arg_media_ids"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getLongArray(Ljava/lang/String;)[J

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->mMediaIds:[J

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "arg_dup_type"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->mDupType:I

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "arg_delete_origin"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->mDeleteOrigin:Z

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "arg_operate_sync"

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->mOperateSync:Z

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "arg_media_uris"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->mMediaUris:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->mActivity:Landroid/app/Activity;

    invoke-virtual {p0, v1}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->setCancelable(Z)V

    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 4

    iget-object p1, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->mActivity:Landroid/app/Activity;

    const-string v0, ""

    iget-object v1, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->mActivity:Landroid/app/Activity;

    const v2, 0x7f100019

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-static {p1, v0, v1, v2, v3}, Lmiui/app/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZZ)Lmiui/app/ProgressDialog;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    iget-object p1, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    return-object p1
.end method

.method public setOnCompleteListener(Lcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->mListener:Lcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;

    return-void
.end method
