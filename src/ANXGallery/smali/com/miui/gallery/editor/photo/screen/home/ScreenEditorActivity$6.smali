.class Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$6;
.super Lcom/miui/gallery/threadpool/FutureHandler;
.source "ScreenEditorActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->deleteFile()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/threadpool/FutureHandler<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$6;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-direct {p0}, Lcom/miui/gallery/threadpool/FutureHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public onPostExecute(Lcom/miui/gallery/threadpool/Future;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/threadpool/Future<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p1}, Lcom/miui/gallery/threadpool/Future;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-interface {p1}, Lcom/miui/gallery/threadpool/Future;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Lcom/miui/gallery/ui/DeletionTask;

    invoke-direct {v0}, Lcom/miui/gallery/ui/DeletionTask;-><init>()V

    new-instance v1, Lcom/miui/gallery/ui/DeletionTask$Param;

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object p1, v3, v4

    const/16 p1, 0x39

    invoke-direct {v1, v3, v4, p1}, Lcom/miui/gallery/ui/DeletionTask$Param;-><init>([Ljava/lang/String;II)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$6;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$1000(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Landroid/app/Activity;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/DeletionTask;->showProgress(Landroid/app/Activity;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity$6;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->access$1100(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;)Lcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/DeletionTask;->setOnDeletionCompleteListener(Lcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;)V

    sget-object p1, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    new-array v2, v2, [Lcom/miui/gallery/ui/DeletionTask$Param;

    aput-object v1, v2, v4

    invoke-virtual {v0, p1, v2}, Lcom/miui/gallery/ui/DeletionTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    :cond_1
    return-void
.end method
