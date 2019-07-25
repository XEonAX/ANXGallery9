.class public Lcom/miui/gallery/ui/IgnorePeoplePageFragment;
.super Lcom/miui/gallery/ui/BaseFragment;
.source "IgnorePeoplePageFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/IgnorePeoplePageFragment$IgnorePeoplePageLoaderCallback;
    }
.end annotation


# instance fields
.field private mAdapter:Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter;

.field private mEmptyView:Landroid/view/View;

.field private mEmptyViewStub:Landroid/view/ViewStub;

.field private mHandler:Landroid/os/Handler;

.field private mIgnorePeopleGridView:Landroid/widget/GridView;

.field private mIgnorePeoplePageLoaderCallback:Lcom/miui/gallery/ui/IgnorePeoplePageFragment$IgnorePeoplePageLoaderCallback;

.field private mPeopleToRecovery:Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

.field private mRecoveryDialog:Landroid/app/AlertDialog;

.field private mRecoveryListener:Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter$OnRecoveryButtonClickListener;

.field private mRenameOrMergeDialog:Landroid/app/AlertDialog;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/BaseFragment;-><init>()V

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mHandler:Landroid/os/Handler;

    new-instance v0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$1;-><init>(Lcom/miui/gallery/ui/IgnorePeoplePageFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mRecoveryListener:Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter$OnRecoveryButtonClickListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/IgnorePeoplePageFragment;)Landroid/app/AlertDialog;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mRecoveryDialog:Landroid/app/AlertDialog;

    return-object p0
.end method

.method static synthetic access$002(Lcom/miui/gallery/ui/IgnorePeoplePageFragment;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mRecoveryDialog:Landroid/app/AlertDialog;

    return-object p1
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/IgnorePeoplePageFragment;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/AlertDialog;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->recoveryPeople(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/AlertDialog;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/miui/gallery/ui/IgnorePeoplePageFragment;)Landroid/widget/GridView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mIgnorePeopleGridView:Landroid/widget/GridView;

    return-object p0
.end method

.method static synthetic access$1100(Lcom/miui/gallery/ui/IgnorePeoplePageFragment;)Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mAdapter:Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/IgnorePeoplePageFragment;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/ui/IgnorePeoplePageFragment;Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->doRecovery(Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$400(Lcom/miui/gallery/ui/IgnorePeoplePageFragment;Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->showMergeOrRenameDialog(Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$500(Lcom/miui/gallery/ui/IgnorePeoplePageFragment;Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mergeWhenRecovery(Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$600(Lcom/miui/gallery/ui/IgnorePeoplePageFragment;)Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mPeopleToRecovery:Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

    return-object p0
.end method

.method static synthetic access$602(Lcom/miui/gallery/ui/IgnorePeoplePageFragment;Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;)Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mPeopleToRecovery:Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

    return-object p1
.end method

.method static synthetic access$800(Lcom/miui/gallery/ui/IgnorePeoplePageFragment;)Landroid/view/View;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mEmptyView:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$802(Lcom/miui/gallery/ui/IgnorePeoplePageFragment;Landroid/view/View;)Landroid/view/View;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mEmptyView:Landroid/view/View;

    return-object p1
.end method

.method static synthetic access$900(Lcom/miui/gallery/ui/IgnorePeoplePageFragment;)Landroid/view/ViewStub;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mEmptyViewStub:Landroid/view/ViewStub;

    return-object p0
.end method

.method private doRecovery(Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;Ljava/lang/String;)V
    .locals 3

    invoke-virtual {p1}, Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;->getBucketId()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    invoke-static {p1}, Lcom/miui/gallery/provider/FaceManager;->getPeopleLocalFlagByLocalID(Ljava/lang/String;)I

    move-result p1

    const/16 v2, 0x8

    if-eq p1, v2, :cond_0

    const-string p1, "localFlag"

    const/16 v2, 0xe

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string p1, "visibilityType"

    const/4 v2, 0x4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    goto :goto_0

    :cond_0
    const-string p1, "visibilityType"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    :goto_0
    const-string p1, "peopleName"

    invoke-virtual {v1, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v1, v0}, Lcom/miui/gallery/provider/FaceManager;->safeUpdatePeopleFaceByIds(Landroid/content/ContentValues;Ljava/util/ArrayList;)V

    return-void
.end method

.method private mergeWhenRecovery(Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;Ljava/lang/String;)V
    .locals 10

    sget-object v0, Lcom/miui/gallery/cloud/peopleface/FaceDataManager;->PEOPLE_FACE_URI:Landroid/net/Uri;

    monitor-enter v0

    :try_start_0
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    invoke-virtual {p1}, Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;->getBucketId()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/miui/gallery/provider/FaceManager;->getPeopleLocalFlagByLocalID(Ljava/lang/String;)I

    move-result v2

    const/16 v3, 0x8

    const/4 v4, 0x1

    if-eq v2, v3, :cond_0

    const-string v2, "localFlag"

    const/16 v3, 0xe

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v2, "visibilityType"

    const/4 v3, 0x4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    goto :goto_0

    :cond_0
    const-string v2, "visibilityType"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    :goto_0
    const-string v2, "%s = ? and %s != ? "

    const/4 v3, 0x2

    new-array v5, v3, [Ljava/lang/Object;

    const-string v6, "_id"

    const/4 v7, 0x0

    aput-object v6, v5, v7

    const-string v6, "localFlag"

    aput-object v6, v5, v4

    invoke-static {v2, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    new-array v5, v3, [Ljava/lang/String;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;->getBucketId()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v5, v4

    invoke-static {v1, v2, v5}, Lcom/miui/gallery/cloud/peopleface/FaceDataManager;->safeUpdateFace(Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)J

    iget-object v1, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p1, v1, p2, v7}, Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;->rename(Landroid/content/Context;Ljava/lang/String;Z)Z

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private recoveryPeople(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/AlertDialog;)V
    .locals 8

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v7, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$2;

    move-object v1, v7

    move-object v2, p0

    move-object v3, p3

    move-object v4, p1

    move-object v5, p2

    move-object v6, p4

    invoke-direct/range {v1 .. v6}, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$2;-><init>(Lcom/miui/gallery/ui/IgnorePeoplePageFragment;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/AlertDialog;)V

    invoke-virtual {v0, v7}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    return-void
.end method

.method private setTitle()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    const v1, 0x7f100423

    invoke-virtual {p0, v1}, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lmiui/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method private showMergeOrRenameDialog(Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;Ljava/lang/String;)V
    .locals 2

    new-instance v0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$3;

    invoke-direct {v0, p0, p1, p2}, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$3;-><init>(Lcom/miui/gallery/ui/IgnorePeoplePageFragment;Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;Ljava/lang/String;)V

    new-instance v1, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$4;

    invoke-direct {v1, p0, p1, p2}, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$4;-><init>(Lcom/miui/gallery/ui/IgnorePeoplePageFragment;Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;Ljava/lang/String;)V

    new-instance p1, Landroid/app/AlertDialog$Builder;

    iget-object p2, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {p1, p2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const p2, 0x7f1005c3

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const p2, 0x7f1005c4

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const p2, 0x7f1005c2

    invoke-virtual {p1, p2, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const p2, 0x7f1005c5

    invoke-virtual {p1, p2, v1}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mRenameOrMergeDialog:Landroid/app/AlertDialog;

    iget-object p1, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mRenameOrMergeDialog:Landroid/app/AlertDialog;

    invoke-virtual {p1}, Landroid/app/AlertDialog;->show()V

    return-void
.end method


# virtual methods
.method public dismissDialog(Landroid/app/AlertDialog;)V
    .locals 1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/app/AlertDialog;->dismiss()V

    :cond_0
    return-void
.end method

.method public getPageName()Ljava/lang/String;
    .locals 1

    const-string v0, "ignore_people"

    return-object v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/BaseFragment;->onActivityCreated(Landroid/os/Bundle;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->setTitle()V

    new-instance p1, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$IgnorePeoplePageLoaderCallback;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$IgnorePeoplePageLoaderCallback;-><init>(Lcom/miui/gallery/ui/IgnorePeoplePageFragment;Lcom/miui/gallery/ui/IgnorePeoplePageFragment$1;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mIgnorePeoplePageLoaderCallback:Lcom/miui/gallery/ui/IgnorePeoplePageFragment$IgnorePeoplePageLoaderCallback;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object p1

    iget-object v1, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mIgnorePeoplePageLoaderCallback:Lcom/miui/gallery/ui/IgnorePeoplePageFragment$IgnorePeoplePageLoaderCallback;

    const/4 v2, 0x1

    invoke-virtual {p1, v2, v0, v1}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    const/16 v0, 0x27

    if-eq p1, v0, :cond_0

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/ui/BaseFragment;->onActivityResult(IILandroid/content/Intent;)V

    goto :goto_0

    :cond_0
    if-eqz p3, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mPeopleToRecovery:Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

    if-eqz p1, :cond_3

    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    const-string p2, "name"

    invoke-virtual {p1, p2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {p2, p1}, Lcom/miui/gallery/cloud/CreateGroupItem;->checkFileNameValid(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {p1, p2}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_1
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p2

    const-string p3, "is_repeat_name"

    invoke-virtual {p2, p3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_2

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object p2

    new-instance p3, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$5;

    invoke-direct {p3, p0, p1}, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$5;-><init>(Lcom/miui/gallery/ui/IgnorePeoplePageFragment;Ljava/lang/String;)V

    invoke-virtual {p2, p3}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    goto :goto_0

    :cond_2
    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object p2

    new-instance p3, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$6;

    invoke-direct {p3, p0, p1}, Lcom/miui/gallery/ui/IgnorePeoplePageFragment$6;-><init>(Lcom/miui/gallery/ui/IgnorePeoplePageFragment;Ljava/lang/String;)V

    invoke-virtual {p2, p3}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    :cond_3
    :goto_0
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/BaseFragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mIgnorePeopleGridView:Landroid/widget/GridView;

    invoke-virtual {v0}, Landroid/widget/GridView;->getFirstVisiblePosition()I

    move-result v0

    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x2

    if-ne p1, v1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mIgnorePeopleGridView:Landroid/widget/GridView;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0a0026

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/widget/GridView;->setNumColumns(I)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mIgnorePeopleGridView:Landroid/widget/GridView;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0a0025

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/widget/GridView;->setNumColumns(I)V

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mIgnorePeopleGridView:Landroid/widget/GridView;

    invoke-virtual {p1, v0}, Landroid/widget/GridView;->setSelection(I)V

    return-void
.end method

.method public onDestroy()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseFragment;->onDestroy()V

    iget-object v0, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mRecoveryDialog:Landroid/app/AlertDialog;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->dismissDialog(Landroid/app/AlertDialog;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mRenameOrMergeDialog:Landroid/app/AlertDialog;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->dismissDialog(Landroid/app/AlertDialog;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mAdapter:Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mAdapter:Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    :cond_0
    return-void
.end method

.method public onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0b0096

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f09014b

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/GridView;

    iput-object p2, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mIgnorePeopleGridView:Landroid/widget/GridView;

    new-instance p2, Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter;

    iget-object p3, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {p2, p3}, Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mAdapter:Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter;

    iget-object p2, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mAdapter:Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter;

    iget-object p3, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mRecoveryListener:Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter$OnRecoveryButtonClickListener;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter;->setRecoveryListener(Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter$OnRecoveryButtonClickListener;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mIgnorePeopleGridView:Landroid/widget/GridView;

    iget-object p3, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mAdapter:Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter;

    invoke-virtual {p2, p3}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    const p2, 0x7f0900fd

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/view/ViewStub;

    iput-object p2, p0, Lcom/miui/gallery/ui/IgnorePeoplePageFragment;->mEmptyViewStub:Landroid/view/ViewStub;

    return-object p1
.end method
