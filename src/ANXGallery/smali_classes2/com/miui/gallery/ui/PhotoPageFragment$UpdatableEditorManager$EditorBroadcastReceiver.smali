.class Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager$EditorBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "PhotoPageFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "EditorBroadcastReceiver"
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager$EditorBroadcastReceiver;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;Lcom/miui/gallery/ui/PhotoPageFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager$EditorBroadcastReceiver;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    if-eqz p2, :cond_2

    const-string p1, "com.miui.gallery.action.EDITOR_RETURN"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    const-string p1, "UpdatableEditorManager"

    const-string v0, "onEditorReturn"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager$EditorBroadcastReceiver;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager$EditorBroadcastReceiver;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;

    invoke-static {v0, p2}, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->access$6700(Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;Landroid/content/Intent;)Z

    move-result p2

    iput-boolean p2, p1, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->mResultHandled:Z

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager$EditorBroadcastReceiver;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;

    iget-boolean p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->mResultHandled:Z

    if-eqz p1, :cond_1

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nostra13/universalimageloader/core/ImageLoader;->resume()V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager$EditorBroadcastReceiver;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mPagerHelper:Lcom/miui/gallery/ui/PhotoPagerHelper;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager$EditorBroadcastReceiver;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mPagerHelper:Lcom/miui/gallery/ui/PhotoPagerHelper;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPagerHelper;->clearTrimMemoryFlag()V

    :cond_0
    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager$EditorBroadcastReceiver;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;

    invoke-static {p2}, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->access$6800(Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;)Ljava/lang/Runnable;

    move-result-object p2

    const-wide/16 v0, 0x7d0

    invoke-virtual {p1, p2, v0, v1}, Lcom/android/internal/CompatHandler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager$EditorBroadcastReceiver;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;->access$6900(Lcom/miui/gallery/ui/PhotoPageFragment$UpdatableEditorManager;)V

    :cond_2
    :goto_0
    return-void
.end method
