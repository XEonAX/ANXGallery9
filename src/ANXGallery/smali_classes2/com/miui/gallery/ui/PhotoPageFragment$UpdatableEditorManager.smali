.class abstract Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;
.super Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;
.source "PhotoPageFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "UpdatableEditorManager"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager$EditorBroadcastReceiver;
    }
.end annotation


# instance fields
.field private mEditorReceiver:Landroid/content/BroadcastReceiver;

.field private mOnLoadTimeOut:Ljava/lang/Runnable;

.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/ui/PhotoPageFragment$1;)V

    new-instance p1, Lcom/miui/gallery/ui/-$$Lambda$PhotoPageFragment$UpdatableEditorManager$8AnZfO2cbC8vZZbqFwUJYkTedFI;

    invoke-direct {p1, p0}, Lcom/miui/gallery/ui/-$$Lambda$PhotoPageFragment$UpdatableEditorManager$8AnZfO2cbC8vZZbqFwUJYkTedFI;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->mOnLoadTimeOut:Ljava/lang/Runnable;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/ui/PhotoPageFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;)V

    return-void
.end method

.method static synthetic access$6700(Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;Landroid/content/Intent;)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->handleEditorResult(Landroid/content/Intent;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$6800(Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;)Ljava/lang/Runnable;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->mOnLoadTimeOut:Ljava/lang/Runnable;

    return-object p0
.end method

.method static synthetic access$6900(Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->sendPreparedResult()V

    return-void
.end method

.method private handleEditorResult(Landroid/content/Intent;)Z
    .locals 2

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    if-nez p1, :cond_1

    return v0

    :cond_1
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    return v0

    :cond_2
    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->shouldInsertMediaStore()Z

    move-result v0

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->insertAndNotifyDataSet(Ljava/lang/String;ZZ)V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->setTargetPath(Ljava/lang/String;)V

    return v1
.end method

.method public static synthetic lambda$new$7(Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;)V
    .locals 2

    const-string v0, "UpdatableEditorManager"

    const-string v1, "editor return to photo, image loading time out."

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->sendPreparedResult()V

    return-void
.end method

.method private registerReceiver()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->mEditorReceiver:Landroid/content/BroadcastReceiver;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "com.miui.gallery.action.EDITOR_RETURN"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    :try_start_0
    const-string v1, "*/*"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addDataType(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/content/IntentFilter$MalformedMimeTypeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    const-string v2, "UpdatableEditorManager"

    invoke-static {v2, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    new-instance v1, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager$EditorBroadcastReceiver;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager$EditorBroadcastReceiver;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;Lcom/miui/gallery/ui/PhotoPageFragment$1;)V

    iput-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->mEditorReceiver:Landroid/content/BroadcastReceiver;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->mEditorReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Lcom/miui/gallery/activity/BaseActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void

    :cond_1
    :goto_1
    return-void
.end method

.method private sendPreparedResult()V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->mOnLoadTimeOut:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.miui.gallery.action.IMAGE_PREPARED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->getTargetPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v1, v0}, Lcom/miui/gallery/activity/BaseActivity;->sendBroadcast(Landroid/content/Intent;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->mTargetFilePath:Ljava/lang/String;

    return-void
.end method

.method private unregisterReceiver()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->mEditorReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->mEditorReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/activity/BaseActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "UpdatableEditorManager"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->mEditorReceiver:Landroid/content/BroadcastReceiver;

    return-void

    :cond_1
    :goto_1
    return-void
.end method


# virtual methods
.method protected abstract getTargetPackageName()Ljava/lang/String;
.end method

.method public onActivityResult(ILandroid/content/Intent;)V
    .locals 2

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;->onActivityResult(ILandroid/content/Intent;)V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->mOnLoadTimeOut:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->unregisterReceiver()V

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    iget-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->mResultHandled:Z

    if-nez p1, :cond_0

    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->handleEditorResult(Landroid/content/Intent;)Z

    :cond_0
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->mResultHandled:Z

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->mTargetFilePath:Ljava/lang/String;

    return-void
.end method

.method public onDestroy()V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->release()V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->unregisterReceiver()V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->mOnLoadTimeOut:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onImageLoadFinish(Ljava/lang/String;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;->onImageLoadFinish(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->mTargetFilePath:Ljava/lang/String;

    if-eqz v0, :cond_2

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->mTargetFilePath:Ljava/lang/String;

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_1

    const-string p1, "UpdatableEditorManager"

    const-string v0, "onImageLoadFinish"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->sendPreparedResult()V

    :cond_1
    return-void

    :cond_2
    :goto_0
    return-void
.end method

.method public onStartEditor()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$BaseEditorManager;->onStartEditor()V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->registerReceiver()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->mResultHandled:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->mTargetFilePath:Ljava/lang/String;

    return-void
.end method

.method protected abstract shouldInsertMediaStore()Z
.end method
