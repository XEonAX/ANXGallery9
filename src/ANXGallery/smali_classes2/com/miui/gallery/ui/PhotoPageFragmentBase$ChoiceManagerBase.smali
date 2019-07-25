.class abstract Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;
.super Ljava/lang/Object;
.source "PhotoPageFragmentBase.java"

# interfaces
.implements Lcom/miui/gallery/adapter/PhotoPageAdapter$MultiChoiceModeListener;
.implements Lcom/miui/gallery/ui/ChooserFragment$OnIntentSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageFragmentBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x400
    name = "ChoiceManagerBase"
.end annotation


# instance fields
.field protected mChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

.field protected mShareClassName:Ljava/lang/String;

.field protected mSharePackageName:Ljava/lang/String;

.field protected mSharePendingIntent:Landroid/content/Intent;

.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragmentBase;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$1000(Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;Ljava/util/ArrayList;Z)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->doShare(Ljava/util/ArrayList;Z)V

    return-void
.end method

.method static synthetic access$1300(Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->getShareDisplayLabel(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$900(Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/List;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 0

    invoke-direct/range {p0 .. p7}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->doPrepareFiles(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/List;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    return-void
.end method

.method private doPrepareFiles(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/List;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;",
            ">;",
            "Ljava/util/ArrayList<",
            "Landroid/net/Uri;",
            ">;",
            "Ljava/util/ArrayList<",
            "Landroid/net/Uri;",
            ">;",
            "Ljava/util/List<",
            "[B>;",
            "Ljava/util/ArrayList<",
            "Landroid/net/Uri;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    new-instance v6, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1;

    move-object v0, v6

    move-object v1, p0

    move-object v2, p6

    move-object v3, p4

    move-object v4, p5

    move-object v5, p7

    invoke-direct/range {v0 .. v5}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$1;-><init>(Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/List;Ljava/util/ArrayList;)V

    invoke-static/range {p1 .. p7}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->newInstance(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/List;Ljava/util/ArrayList;Ljava/util/ArrayList;)Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    move-result-object p1

    invoke-virtual {p1, v6}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->setOnDownloadListener(Lcom/miui/gallery/ui/ShareFilePrepareFragment$OnPrepareListener;)V

    new-instance p2, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$2;

    invoke-direct {p2, p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$2;-><init>(Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;)V

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    new-instance p2, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$3;

    invoke-direct {p2, p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$3;-><init>(Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;)V

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->setErrorListener(Lcom/miui/gallery/ui/ShareFilePrepareFragment$OnErrorListener;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-object p2, p2, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p2}, Lcom/miui/gallery/activity/BaseActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p2

    const-string p3, "DownloadFragment"

    invoke-virtual {p1, p2, p3}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method private doShare(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/net/Uri;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->doShare(Ljava/util/ArrayList;Z)V

    return-void
.end method

.method private doShare(Ljava/util/ArrayList;Z)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/net/Uri;",
            ">;Z)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->mSharePendingIntent:Landroid/content/Intent;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x1

    if-nez p2, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-virtual {p2}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getActivity()Landroid/app/Activity;

    move-result-object p2

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->mSharePendingIntent:Landroid/content/Intent;

    invoke-static {p2, v2}, Lcom/miui/gallery/provider/GalleryOpenProvider;->needReturnContentUri(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result p2

    if-eqz p2, :cond_3

    :cond_1
    const/4 p2, 0x0

    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge p2, v2, :cond_3

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/miui/gallery/provider/GalleryOpenProvider;->translateToContent(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {p1, p2, v2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->mSharePackageName:Ljava/lang/String;

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-object v3, v3, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->mSharePackageName:Ljava/lang/String;

    invoke-virtual {v3, v4, v2, v1}, Lcom/miui/gallery/activity/BaseActivity;->grantUriPermission(Ljava/lang/String;Landroid/net/Uri;I)V

    :cond_2
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_3
    const-string p2, "PhotoPageFragmentBase"

    const-string v2, "prepare to share: %s"

    invoke-static {p2, v2, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-lez p2, :cond_6

    if-le p2, v1, :cond_4

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->mSharePendingIntent:Landroid/content/Intent;

    const-string v0, "android.intent.extra.STREAM"

    invoke-virtual {p2, v0, p1}, Landroid/content/Intent;->putParcelableArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    goto :goto_1

    :cond_4
    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->mSharePendingIntent:Landroid/content/Intent;

    const-string v2, "android.intent.action.SEND"

    invoke-virtual {p2, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->mSharePendingIntent:Landroid/content/Intent;

    const-string v2, "android.intent.extra.STREAM"

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/Parcelable;

    invoke-virtual {p2, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    :goto_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->mSharePendingIntent:Landroid/content/Intent;

    const/high16 p2, 0x10000000

    invoke-virtual {p1, p2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->mSharePendingIntent:Landroid/content/Intent;

    const/high16 p2, 0x8080000

    invoke-virtual {p1, p2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->mSharePendingIntent:Landroid/content/Intent;

    invoke-virtual {p1, p2, v1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->startActivityForResult(Landroid/content/Intent;I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->access$1100(Lcom/miui/gallery/ui/PhotoPageFragmentBase;)Ljava/lang/Runnable;

    move-result-object p1

    if-nez p1, :cond_5

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    new-instance p2, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$4;

    invoke-direct {p2, p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$4;-><init>(Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;)V

    invoke-static {p1, p2}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->access$1102(Lcom/miui/gallery/ui/PhotoPageFragmentBase;Ljava/lang/Runnable;)Ljava/lang/Runnable;

    :cond_5
    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-static {p2}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->access$1100(Lcom/miui/gallery/ui/PhotoPageFragmentBase;)Ljava/lang/Runnable;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/android/internal/CompatHandler;->hasCallbacksCompat(Ljava/lang/Runnable;)Z

    move-result p1

    if-nez p1, :cond_6

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-static {p1, v1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->access$1202(Lcom/miui/gallery/ui/PhotoPageFragmentBase;Z)Z

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-static {p2}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->access$1100(Lcom/miui/gallery/ui/PhotoPageFragmentBase;)Ljava/lang/Runnable;

    move-result-object p2

    const-wide/16 v0, 0x1f4

    invoke-virtual {p1, p2, v0, v1}, Lcom/android/internal/CompatHandler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_6
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->mSharePendingIntent:Landroid/content/Intent;

    return-void
.end method

.method private getShareDisplayLabel(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v1}, Lcom/miui/gallery/activity/BaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "%s_%s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    const/4 p1, 0x1

    aput-object p2, v4, p1

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "string"

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v2}, Lcom/miui/gallery/activity/BaseActivity;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, p1, p2, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, p1

    :catch_0
    :cond_0
    return-object v0
.end method


# virtual methods
.method protected configTargetIntentBySelected(ILandroid/content/Intent;)V
    .locals 4

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-gt p1, v1, :cond_2

    const-string v1, "android.intent.action.SEND"

    invoke-virtual {p2, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const/4 v1, 0x0

    if-lez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->mChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    invoke-virtual {v1}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->getSelectItems()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataItem(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v1

    :cond_0
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lcom/miui/gallery/model/BaseDataItem;->isVideo()Z

    move-result p1

    if-eqz p1, :cond_1

    const-string p1, "video/*"

    goto :goto_0

    :cond_1
    const-string p1, "image/*"

    :goto_0
    invoke-virtual {p2, p1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_4

    :cond_2
    const-string v2, "android.intent.action.SEND_MULTIPLE"

    invoke-virtual {p2, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->mChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    invoke-virtual {v3}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->getSelectItems()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {v2, v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataItem(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->isVideo()Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "video/*"

    goto :goto_1

    :cond_3
    const-string v0, "image/*"

    :goto_1
    if-ge v1, p1, :cond_6

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->mChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    invoke-virtual {v3}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->getSelectItems()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataItem(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v2

    if-eqz v2, :cond_4

    invoke-virtual {v2}, Lcom/miui/gallery/model/BaseDataItem;->isVideo()Z

    move-result v2

    if-eqz v2, :cond_4

    const-string v2, "video/*"

    goto :goto_2

    :cond_4
    const-string v2, "image/*"

    :goto_2
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string v0, "*/*"

    goto :goto_3

    :cond_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_6
    :goto_3
    invoke-virtual {p2, v0}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    :goto_4
    return-void
.end method

.method protected abstract getChoiceTitle()Landroid/widget/TextView;
.end method

.method protected abstract getContainerId()I
.end method

.method public final onAllItemsCheckedStateChanged(Z)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->updateSelectMode()V

    return-void
.end method

.method public final onIntentSelected(Landroid/content/Intent;)V
    .locals 31

    move-object/from16 v8, p0

    move-object/from16 v0, p1

    if-eqz v0, :cond_1c

    iget-object v1, v8, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->mChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    if-nez v1, :cond_0

    goto/16 :goto_a

    :cond_0
    iget-object v1, v8, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->mSharePendingIntent:Landroid/content/Intent;

    if-eqz v1, :cond_1

    const-string v0, "PhotoPageFragmentBase"

    const-string v1, "already preparing for a pending intent, skip this"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v1

    if-eqz v1, :cond_2

    const-string v1, "fast_share"

    const-string v2, "app_selected"

    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordStringPropertyEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    iget-object v1, v8, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->mChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    invoke-virtual {v1}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->getSelectItems()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_1b

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    const/16 v3, 0x1f4

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-le v2, v3, :cond_3

    iget-object v0, v8, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v1, v8, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v1}, Lcom/miui/gallery/activity/BaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f10065f

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v5, v4

    invoke-virtual {v1, v2, v5}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void

    :cond_3
    iput-object v0, v8, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->mSharePendingIntent:Landroid/content/Intent;

    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v8, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->mSharePackageName:Ljava/lang/String;

    invoke-virtual/range {p1 .. p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v8, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->mShareClassName:Ljava/lang/String;

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    iget-object v12, v8, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->mChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    invoke-virtual {v12}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->getOriginItems()Ljava/util/List;

    move-result-object v12

    iget-object v13, v8, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->mChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    invoke-virtual {v13}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->getRenderItems()Ljava/util/List;

    move-result-object v13

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    :goto_0
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v19

    if-eqz v19, :cond_13

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Ljava/lang/Integer;

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iget-object v5, v8, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-object v5, v5, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    invoke-virtual {v5, v4}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataItem(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v5

    move-object/from16 v20, v14

    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    if-eqz v5, :cond_4

    invoke-virtual {v5}, Lcom/miui/gallery/model/BaseDataItem;->isBurstItem()Z

    move-result v19

    if-eqz v19, :cond_4

    move-object/from16 v21, v2

    iget-object v2, v8, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->mSharePackageName:Ljava/lang/String;

    move-object/from16 v22, v1

    const-string v1, "com.android.bluetooth"

    invoke-static {v2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-virtual {v5}, Lcom/miui/gallery/model/BaseDataItem;->getBurstGroup()Ljava/util/List;

    move-result-object v1

    invoke-interface {v14, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {v5}, Lcom/miui/gallery/model/BaseDataItem;->getBurstGroup()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_6

    iget-object v1, v8, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->mSharePendingIntent:Landroid/content/Intent;

    const-string v2, "android.intent.action.SEND_MULTIPLE"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_1

    :cond_4
    move-object/from16 v22, v1

    move-object/from16 v21, v2

    :cond_5
    invoke-interface {v14, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_6
    :goto_1
    invoke-interface {v14}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_12

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/model/BaseDataItem;

    if-eqz v2, :cond_10

    iget-object v5, v8, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-virtual {v5, v2}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->isProcessingMedia(Lcom/miui/gallery/model/BaseDataItem;)Z

    move-result v5

    if-eqz v5, :cond_7

    add-int/lit8 v15, v15, 0x1

    goto :goto_2

    :cond_7
    invoke-virtual {v2}, Lcom/miui/gallery/model/BaseDataItem;->getSecretKey()[B

    move-result-object v5

    invoke-virtual {v2}, Lcom/miui/gallery/model/BaseDataItem;->isSecret()Z

    move-result v14

    invoke-virtual {v2}, Lcom/miui/gallery/model/BaseDataItem;->getKey()J

    move-result-wide v24

    move-object/from16 v29, v1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v12, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b

    invoke-virtual {v2}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_a

    invoke-virtual {v2}, Lcom/miui/gallery/model/BaseDataItem;->getDownloadUri()Landroid/net/Uri;

    move-result-object v1

    if-eqz v1, :cond_8

    invoke-interface {v11, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_8
    move-object/from16 v30, v12

    :cond_9
    :goto_3
    const/16 v16, 0x1

    goto :goto_4

    :cond_a
    new-instance v1, Ljava/io/File;

    move-object/from16 v30, v12

    invoke-virtual {v2}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v1, v12}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1

    if-nez v14, :cond_9

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :cond_b
    move-object/from16 v30, v12

    invoke-virtual {v2}, Lcom/miui/gallery/model/BaseDataItem;->getContentUriForExternal()Landroid/net/Uri;

    move-result-object v1

    if-nez v1, :cond_c

    invoke-virtual {v2}, Lcom/miui/gallery/model/BaseDataItem;->getDownloadUri()Landroid/net/Uri;

    move-result-object v1

    if-eqz v1, :cond_d

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_4

    :cond_c
    if-nez v14, :cond_d

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_d
    :goto_4
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-interface {v13, v12}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_e

    if-eqz v1, :cond_e

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/16 v17, 0x1

    :cond_e
    if-eqz v14, :cond_f

    invoke-virtual {v7, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v9, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_f
    invoke-virtual {v2}, Lcom/miui/gallery/model/BaseDataItem;->getSpecialTypeFlags()J

    move-result-wide v1

    invoke-static {v1, v2}, Lcom/miui/extraphoto/sdk/ExtraPhotoSDK;->sendSharePhotoStatic(J)V

    invoke-static {}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->getInstance()Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;

    move-result-object v23

    const/16 v26, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x0

    invoke-virtual/range {v23 .. v28}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->isBestImage(JZZLjava/util/List;)Z

    move-result v1

    if-eqz v1, :cond_11

    add-int/lit8 v18, v18, 0x1

    goto :goto_5

    :cond_10
    move-object/from16 v29, v1

    move-object/from16 v30, v12

    :cond_11
    :goto_5
    move-object/from16 v1, v29

    move-object/from16 v12, v30

    goto/16 :goto_2

    :cond_12
    move-object/from16 v14, v20

    move-object/from16 v2, v21

    move-object/from16 v1, v22

    const/4 v4, 0x0

    const/4 v5, 0x1

    goto/16 :goto_0

    :cond_13
    move-object/from16 v22, v1

    move-object/from16 v21, v2

    if-lez v15, :cond_14

    iget-object v1, v8, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v2, v8, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v4, 0x7f0e0046

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    const/4 v13, 0x0

    aput-object v12, v5, v13

    invoke-virtual {v2, v4, v15, v5}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "count"

    invoke-static {v15}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "fast_share"

    const-string v4, "processing_media_checked"

    invoke-static {v2, v4, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_14
    if-eqz v16, :cond_15

    const-string v1, "fast_share"

    const-string v2, "origin_checked"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    :cond_15
    if-eqz v17, :cond_16

    const-string v1, "fast_share"

    const-string v2, "render_checked"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    :cond_16
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "count"

    invoke-interface/range {v22 .. v22}, Ljava/util/List;->size()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "best_image_count"

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "fast_share"

    const-string v4, "send"

    invoke-static {v2, v4, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    invoke-static {v6}, Lcom/miui/gallery/ui/PhotoPagerSamplingStatHelper;->onImageShared(Ljava/util/ArrayList;)V

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-gtz v1, :cond_18

    invoke-virtual/range {v21 .. v21}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-gtz v1, :cond_18

    invoke-interface {v11}, Ljava/util/List;->size()I

    move-result v1

    if-gtz v1, :cond_18

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-gtz v1, :cond_18

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_17

    goto :goto_6

    :cond_17
    invoke-direct {v8, v6}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->doShare(Ljava/util/ArrayList;)V

    goto :goto_9

    :cond_18
    :goto_6
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_7
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_19

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/model/BaseDataItem;

    new-instance v4, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;

    invoke-virtual {v1}, Lcom/miui/gallery/model/BaseDataItem;->getDownloadUri()Landroid/net/Uri;

    move-result-object v5

    sget-object v12, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-virtual {v1}, Lcom/miui/gallery/model/BaseDataItem;->getSize()J

    move-result-wide v13

    invoke-direct {v4, v5, v12, v13, v14}, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;-><init>(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;J)V

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_7

    :cond_19
    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/model/BaseDataItem;

    new-instance v4, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;

    invoke-virtual {v1}, Lcom/miui/gallery/model/BaseDataItem;->getDownloadUri()Landroid/net/Uri;

    move-result-object v5

    sget-object v11, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN_FORCE:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-virtual {v1}, Lcom/miui/gallery/model/BaseDataItem;->getSize()J

    move-result-wide v12

    invoke-direct {v4, v5, v11, v12, v13}, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;-><init>(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;J)V

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_8

    :cond_1a
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    move-object v4, v7

    move-object v5, v9

    move-object v7, v10

    invoke-direct/range {v0 .. v7}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->doPrepareFiles(Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/List;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    goto :goto_9

    :cond_1b
    iget-object v0, v8, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v1, v8, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lmiui/R$string;->select_item:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    :goto_9
    return-void

    :cond_1c
    :goto_a
    return-void
.end method

.method public final onItemCheckedStateChanged(IJZ)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->updateSelectMode()V

    return-void
.end method

.method protected onShared()V
    .locals 0

    return-void
.end method

.method protected onVisibilityChanged(Z)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getChildFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const-string v1, "ChooserFragment"

    invoke-virtual {v0, v1}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_0

    check-cast v0, Lcom/miui/gallery/ui/ChooserFragment;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/ChooserFragment;->onVisibilityChanged(Z)V

    :cond_0
    return-void
.end method

.method protected setUpChooserFragment(IZ)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getChildFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const-string v1, "ChooserFragment"

    invoke-virtual {v0, v1}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getChildFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.SEND"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v2, "image/*"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {v1, p1, p2}, Lcom/miui/gallery/ui/ChooserFragment;->newInstance(Landroid/content/Intent;IZ)Lcom/miui/gallery/ui/ChooserFragment;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/miui/gallery/ui/ChooserFragment;->setOnIntentSelectedListener(Lcom/miui/gallery/ui/ChooserFragment$OnIntentSelectedListener;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->getContainerId()I

    move-result p2

    const-string v1, "ChooserFragment"

    invoke-virtual {v0, p2, p1, v1}, Landroid/app/FragmentTransaction;->add(ILandroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    invoke-virtual {v0}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I

    goto :goto_0

    :cond_0
    check-cast v0, Lcom/miui/gallery/ui/ChooserFragment;

    invoke-virtual {v0, p0}, Lcom/miui/gallery/ui/ChooserFragment;->setOnIntentSelectedListener(Lcom/miui/gallery/ui/ChooserFragment$OnIntentSelectedListener;)V

    :goto_0
    return-void
.end method

.method protected updateSelectMode()V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->mChoiceMode:Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter$ChoiceMode;->getSelectItems()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->getChoiceTitle()Landroid/widget/TextView;

    move-result-object v1

    if-eqz v1, :cond_1

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->getChoiceTitle()Landroid/widget/TextView;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f1002e9

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->getChoiceTitle()Landroid/widget/TextView;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0e0019

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v0, v4}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_1
    :goto_0
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->configTargetIntentBySelected(ILandroid/content/Intent;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getChildFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const-string v2, "ChooserFragment"

    invoke-virtual {v0, v2}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_2

    check-cast v0, Lcom/miui/gallery/ui/ChooserFragment;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/ChooserFragment;->requery(Landroid/content/Intent;)V

    :cond_2
    return-void
.end method
