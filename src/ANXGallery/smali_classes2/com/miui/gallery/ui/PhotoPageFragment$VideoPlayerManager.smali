.class Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;
.super Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;
.source "PhotoPageFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/PhotoPagerHelper$OnPlayVideoListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "VideoPlayerManager"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$PlayerBroadcastReceiver;
    }
.end annotation


# instance fields
.field private mPlayerReceiver:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$PlayerBroadcastReceiver;

.field private mPlayerResultHandled:Z

.field private mSlowMotionCallback:Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager$Callback;

.field private mSuperSlowMotionCallback:Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager$Callback;

.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;)V
    .locals 3

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/ui/PhotoPageFragment$1;)V

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$1;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->mSlowMotionCallback:Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager$Callback;

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$2;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->mSuperSlowMotionCallback:Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager$Callback;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mPagerHelper:Lcom/miui/gallery/ui/PhotoPagerHelper;

    invoke-virtual {p1, p0}, Lcom/miui/gallery/ui/PhotoPagerHelper;->setOnPlayVideoListener(Lcom/miui/gallery/ui/PhotoPagerHelper$OnPlayVideoListener;)V

    invoke-static {}, Lcom/miui/gallery/util/IntentUtil;->isSupportNewVideoPlayer()Z

    move-result p1

    if-eqz p1, :cond_0

    const-wide/16 v0, 0x4

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->mSlowMotionCallback:Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager$Callback;

    const/4 v2, 0x2

    invoke-virtual {p2, v0, v1, p1, v2}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->addTypeCallback(JLcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager$Callback;I)V

    const-wide/16 v0, 0x8

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->mSlowMotionCallback:Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager$Callback;

    invoke-virtual {p2, v0, v1, p1, v2}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->addTypeCallback(JLcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager$Callback;I)V

    const-wide/16 v0, 0x10

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->mSuperSlowMotionCallback:Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager$Callback;

    invoke-virtual {p2, v0, v1, p1, v2}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->addTypeCallback(JLcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager$Callback;I)V

    :cond_0
    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;Lcom/miui/gallery/ui/PhotoPageFragment$1;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;)V

    return-void
.end method

.method static synthetic access$7800(Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;Lcom/miui/gallery/model/BaseDataItem;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->playVideo(Lcom/miui/gallery/model/BaseDataItem;I)V

    return-void
.end method

.method static synthetic access$7900(Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;Lcom/miui/gallery/model/BaseDataItem;Landroid/net/Uri;ZI)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->playVideo(Lcom/miui/gallery/model/BaseDataItem;Landroid/net/Uri;ZI)V

    return-void
.end method

.method static synthetic access$8100(Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->setActivityVisible(Z)V

    return-void
.end method

.method static synthetic access$8200(Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->setActionBarVisibleImmediately(Z)V

    return-void
.end method

.method static synthetic access$8302(Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->mPlayerResultHandled:Z

    return p1
.end method

.method private getItemMimeType(Lcom/miui/gallery/model/BaseDataItem;)Ljava/lang/String;
    .locals 2

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getPathDisplayBetter()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string p1, "*/*"

    return-object p1

    :cond_1
    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getMimeType()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-static {v0}, Lcom/miui/gallery/util/FileMimeUtil;->getMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :cond_2
    return-object p1
.end method

.method private getItemUri(Lcom/miui/gallery/model/BaseDataItem;)Landroid/net/Uri;
    .locals 1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getPathDisplayBetter()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string p1, ""

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    return-object p1

    :cond_1
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p1

    return-object p1
.end method

.method private playVideo(Lcom/miui/gallery/model/BaseDataItem;I)V
    .locals 4

    if-eqz p1, :cond_3

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    invoke-static {}, Lcom/miui/gallery/projection/ConnectController;->getInstance()Lcom/miui/gallery/projection/ConnectController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/projection/ConnectController;->getCurConnectedDevice()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->isSecret()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p2, p2, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {p2, p1}, Lcom/miui/gallery/ui/ProjectVideoFragment;->showProjectVideoFragment(Lcom/miui/gallery/activity/BaseActivity;Lcom/miui/gallery/model/BaseDataItem;)V

    goto :goto_0

    :cond_1
    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->isSecret()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getSecretKey()[B

    move-result-object v1

    if-eqz v1, :cond_2

    new-instance v1, Lcom/miui/gallery/ui/ProcessTask;

    new-instance v2, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$3;

    invoke-direct {v2, p0, v0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$3;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;Landroid/net/Uri;Lcom/miui/gallery/model/BaseDataItem;)V

    new-instance v3, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$4;

    invoke-direct {v3, p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$4;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;Lcom/miui/gallery/model/BaseDataItem;I)V

    invoke-direct {v1, v2, v3}, Lcom/miui/gallery/ui/ProcessTask;-><init>(Lcom/miui/gallery/ui/ProcessTask$ProcessCallback;Lcom/miui/gallery/ui/ProcessTask$OnCompleteListener;)V

    const/4 p1, 0x1

    invoke-virtual {v1, p1}, Lcom/miui/gallery/ui/ProcessTask;->setCancelable(Z)V

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p2, p2, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v2}, Lcom/miui/gallery/activity/BaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f1002ef

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, p2, v2}, Lcom/miui/gallery/ui/ProcessTask;->showProgress(Landroid/app/Activity;Ljava/lang/String;)V

    sget-object p2, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    new-array p1, p1, [Landroid/net/Uri;

    const/4 v2, 0x0

    aput-object v0, p1, v2

    invoke-virtual {v1, p2, p1}, Lcom/miui/gallery/ui/ProcessTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    :cond_2
    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->isSecret()Z

    move-result v1

    invoke-direct {p0, p1, v0, v1, p2}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->playVideo(Lcom/miui/gallery/model/BaseDataItem;Landroid/net/Uri;ZI)V

    :goto_0
    return-void

    :cond_3
    :goto_1
    return-void
.end method

.method private playVideo(Lcom/miui/gallery/model/BaseDataItem;Landroid/net/Uri;ZI)V
    .locals 10

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const-string v2, "StartActivityWhenLocked"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    const/4 v6, 0x1

    goto :goto_0

    :cond_0
    const/4 v6, 0x0

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getRequestedOrientation()I

    move-result v7

    new-instance v9, Landroid/os/Bundle;

    invoke-direct {v9}, Landroid/os/Bundle;-><init>()V

    invoke-static {}, Lcom/miui/gallery/util/IntentUtil;->isSupportNewVideoPlayer()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0, p1, v9, p4}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->prepareParams(Lcom/miui/gallery/model/BaseDataItem;Landroid/os/Bundle;I)V

    :cond_1
    iget-object p4, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v2, p4, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getMimeType()Ljava/lang/String;

    move-result-object v4

    move-object v3, p2

    move v5, v0

    move v8, p3

    invoke-static/range {v2 .. v9}, Lcom/miui/gallery/util/IntentUtil;->playVideo(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;ZZIZLandroid/os/Bundle;)Z

    move-result p2

    if-eqz p2, :cond_2

    if-eqz v0, :cond_2

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->registerPlayerReceiver()V

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->onStartEditor()V

    iput-boolean v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->mPlayerResultHandled:Z

    :cond_2
    new-instance p2, Landroid/util/ArrayMap;

    invoke-direct {p2}, Landroid/util/ArrayMap;-><init>()V

    const-string p4, "path"

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/StorageUtils;->getRelativePath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p2, p4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p4, "duration"

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getDuration()I

    move-result p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p2, p4, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "timestamp"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p4

    invoke-interface {p2, p1, p4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "isSecret"

    invoke-static {p3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p3

    invoke-interface {p2, p1, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "external_intent"

    const-string p3, "play_video"

    invoke-static {p1, p3, p2}, Lcom/miui/gallery/util/GalleryStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method private prepareParams(Lcom/miui/gallery/model/BaseDataItem;Landroid/os/Bundle;I)V
    .locals 8

    if-eqz p2, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2500(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;

    move-result-object v0

    if-nez v0, :cond_0

    goto/16 :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    add-int/lit8 v2, v0, -0x1

    invoke-virtual {v1, v2}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataItem(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    add-int/lit8 v3, v0, 0x1

    invoke-virtual {v2, v3}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataItem(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v2

    const/4 v3, 0x2

    new-array v4, v3, [Landroid/net/Uri;

    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->getItemUri(Lcom/miui/gallery/model/BaseDataItem;)Landroid/net/Uri;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v4, v6

    invoke-direct {p0, v2}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->getItemUri(Lcom/miui/gallery/model/BaseDataItem;)Landroid/net/Uri;

    move-result-object v5

    const/4 v7, 0x1

    aput-object v5, v4, v7

    new-array v3, v3, [Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->getItemMimeType(Lcom/miui/gallery/model/BaseDataItem;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v3, v6

    invoke-direct {p0, v2}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->getItemMimeType(Lcom/miui/gallery/model/BaseDataItem;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v3, v7

    const-string v1, "title"

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p1, v2}, Lcom/miui/gallery/model/BaseDataItem;->getViewTitle(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "subtitle"

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p1, v2}, Lcom/miui/gallery/model/BaseDataItem;->getViewSubTitle(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "location"

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getLocation()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "uri_list"

    invoke-virtual {p2, p1, v4}, Landroid/os/Bundle;->putParcelableArray(Ljava/lang/String;[Landroid/os/Parcelable;)V

    const-string p1, "mime_type_list"

    invoke-virtual {p2, p1, v3}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    const-string p1, "seek_time"

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2500(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->getSeekTime()J

    move-result-wide v1

    invoke-virtual {p2, p1, v1, v2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string p1, "action_bar_visible"

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$1200(Lcom/miui/gallery/ui/PhotoPageFragment;)Z

    move-result v1

    invoke-virtual {p2, p1, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getItemViewInfo(I)Lcom/miui/gallery/util/photoview/ItemViewInfo;

    move-result-object p1

    if-eqz p1, :cond_1

    const-string v0, "item_x"

    invoke-virtual {p1}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getX()I

    move-result v1

    invoke-virtual {p2, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "item_y"

    invoke-virtual {p1}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getY()I

    move-result v1

    invoke-virtual {p2, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "item_width"

    invoke-virtual {p1}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getWidth()I

    move-result v1

    invoke-virtual {p2, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "item_height"

    invoke-virtual {p1}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getHeight()I

    move-result p1

    invoke-virtual {p2, v0, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    :cond_1
    const-string p1, "mode"

    invoke-virtual {p2, p1, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    return-void

    :cond_2
    :goto_0
    return-void
.end method

.method private registerPlayerReceiver()V
    .locals 3

    const-string v0, "VideoPlayerManager"

    const-string v1, "registerPlayerReceiver"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->mPlayerReceiver:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$PlayerBroadcastReceiver;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$PlayerBroadcastReceiver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$PlayerBroadcastReceiver;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;Lcom/miui/gallery/ui/PhotoPageFragment$1;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->mPlayerReceiver:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$PlayerBroadcastReceiver;

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "com.miui.gallery.action.VIDEO_PLAYER_STARTED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "com.miui.gallery.action.VIDEO_PLAYER_RETURN"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->mPlayerReceiver:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$PlayerBroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Lcom/miui/gallery/activity/BaseActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    :cond_0
    return-void
.end method

.method private setActionBarVisibleImmediately(Z)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2000(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;

    move-result-object v0

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2000(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->showMaskImmediately()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2000(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->hideMaskImmediately()V

    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$1500(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$ThemeManager;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    if-eqz p1, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$1500(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$ThemeManager;

    move-result-object v0

    invoke-virtual {v0, v1, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$ThemeManager;->setLightTheme(ZZ)V

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$1500(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$ThemeManager;

    move-result-object v0

    invoke-virtual {v0, v1, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$ThemeManager;->setDarkTheme(ZZ)V

    :cond_3
    :goto_1
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    invoke-static {v0, v1}, Lcom/miui/gallery/compat/app/ActionBarCompat;->setShowHideAnimationEnabled(Landroid/app/ActionBar;Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$200(Lcom/miui/gallery/ui/PhotoPageFragment;Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->getActionBar()Lmiui/app/ActionBar;

    move-result-object p1

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/miui/gallery/compat/app/ActionBarCompat;->setShowHideAnimationEnabled(Landroid/app/ActionBar;Z)V

    :cond_4
    return-void
.end method

.method private setActivityVisible(Z)V
    .locals 3

    const-string v0, "VideoPlayerManager"

    const-string v1, "setActivityVisible %b"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const v1, 0x1020002

    invoke-virtual {v0, v1}, Lcom/miui/gallery/activity/BaseActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_2

    if-eqz p1, :cond_1

    const/4 p1, 0x0

    goto :goto_0

    :cond_1
    const/4 p1, 0x4

    :goto_0
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    :cond_2
    return-void
.end method

.method private unregisterPlayerReceiver()V
    .locals 2

    const-string v0, "VideoPlayerManager"

    const-string v1, "unregisterPlayerReceiver"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->mPlayerReceiver:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$PlayerBroadcastReceiver;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->mPlayerReceiver:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$PlayerBroadcastReceiver;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/activity/BaseActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->mPlayerReceiver:Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager$PlayerBroadcastReceiver;

    :cond_0
    return-void
.end method


# virtual methods
.method protected getTargetPackageName()Ljava/lang/String;
    .locals 1

    const-string v0, "com.miui.video"

    return-object v0
.end method

.method public onActivityResult(ILandroid/content/Intent;)V
    .locals 5

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->onActivityResult(ILandroid/content/Intent;)V

    const-string v0, "VideoPlayerManager"

    const-string v1, "onActivityResult"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->unregisterPlayerReceiver()V

    if-nez p2, :cond_0

    return-void

    :cond_0
    const-string v0, "request_finish"

    const/4 v1, 0x0

    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->finish()V

    goto :goto_0

    :cond_1
    invoke-direct {p0, v2}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->setActivityVisible(Z)V

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->mPlayerResultHandled:Z

    if-nez v0, :cond_3

    const-string v0, "relative_index"

    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    if-eqz v0, :cond_2

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v3, v3, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    if-eqz v3, :cond_3

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v3, v3, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v4, v4, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v4}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v4

    add-int/2addr v4, v0

    invoke-virtual {v3, v4, v1}, Lcom/miui/gallery/widget/ViewPager;->setCurrentItem(IZ)V

    goto :goto_0

    :cond_2
    const-string v0, "seek_time"

    const-wide/16 v3, -0x1

    invoke-virtual {p2, v0, v3, v4}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2500(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;

    move-result-object v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2500(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;

    move-result-object v0

    invoke-virtual {v0, v3, v4, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->seekTo(JZ)V

    :cond_3
    :goto_0
    iput-boolean v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->mPlayerResultHandled:Z

    const/4 v0, -0x1

    if-ne p1, v0, :cond_4

    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    if-eqz p1, :cond_4

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_4

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p2, v2}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$200(Lcom/miui/gallery/ui/PhotoPageFragment;Z)V

    invoke-virtual {p0, p1, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->insertAndNotifyDataSet(Ljava/lang/String;Z)V

    :cond_4
    return-void
.end method

.method public onDestroy()V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->release()V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->unregisterPlayerReceiver()V

    return-void
.end method

.method public onPlayVideo(Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->playVideo(Lcom/miui/gallery/model/BaseDataItem;I)V

    return-void
.end method

.method public onResume()V
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->setActivityVisible(Z)V

    return-void
.end method

.method public prepareFinish(Landroid/content/Context;)V
    .locals 2

    if-nez p1, :cond_0

    return-void

    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.miui.video.ACTION_GALLERY_PREPARED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.miui.video"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    return-void
.end method

.method protected shouldInsertMediaStore()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
