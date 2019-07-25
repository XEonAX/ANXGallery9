.class Lcom/miui/gallery/assistant/library/LibraryManager$4;
.super Ljava/lang/Object;
.source "LibraryManager.java"

# interfaces
.implements Lcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/assistant/library/LibraryManager;->downloadLibraryInternal(Lcom/miui/gallery/assistant/library/Library;ZLcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;)Lcom/miui/gallery/threadpool/Future;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/assistant/library/LibraryManager;

.field final synthetic val$library:Lcom/miui/gallery/assistant/library/Library;

.field final synthetic val$listener:Lcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;


# direct methods
.method constructor <init>(Lcom/miui/gallery/assistant/library/LibraryManager;Lcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;Lcom/miui/gallery/assistant/library/Library;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/assistant/library/LibraryManager$4;->this$0:Lcom/miui/gallery/assistant/library/LibraryManager;

    iput-object p2, p0, Lcom/miui/gallery/assistant/library/LibraryManager$4;->val$listener:Lcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;

    iput-object p3, p0, Lcom/miui/gallery/assistant/library/LibraryManager$4;->val$library:Lcom/miui/gallery/assistant/library/Library;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDownloadProgress(JI)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/assistant/library/LibraryManager$4;->val$listener:Lcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;

    invoke-interface {v0, p1, p2, p3}, Lcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;->onDownloadProgress(JI)V

    return-void
.end method

.method public onDownloadResult(JI)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/assistant/library/LibraryManager$4$1;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/miui/gallery/assistant/library/LibraryManager$4$1;-><init>(Lcom/miui/gallery/assistant/library/LibraryManager$4;JI)V

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    packed-switch p3, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object p1, p0, Lcom/miui/gallery/assistant/library/LibraryManager$4;->val$library:Lcom/miui/gallery/assistant/library/Library;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/assistant/library/LibraryManager$4;->val$library:Lcom/miui/gallery/assistant/library/Library;

    sget-object p2, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;->STATE_NOT_DOWNLOADED:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/assistant/library/Library;->setLibraryStatus(Lcom/miui/gallery/assistant/library/Library$LibraryStatus;)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/assistant/library/LibraryManager$4;->this$0:Lcom/miui/gallery/assistant/library/LibraryManager;

    iget-object p2, p0, Lcom/miui/gallery/assistant/library/LibraryManager$4;->val$library:Lcom/miui/gallery/assistant/library/Library;

    const-string p3, "fail"

    invoke-static {p1, p2, p3}, Lcom/miui/gallery/assistant/library/LibraryManager;->access$900(Lcom/miui/gallery/assistant/library/LibraryManager;Lcom/miui/gallery/assistant/library/Library;Ljava/lang/String;)V

    goto :goto_0

    :pswitch_1
    iget-object p1, p0, Lcom/miui/gallery/assistant/library/LibraryManager$4;->val$library:Lcom/miui/gallery/assistant/library/Library;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/assistant/library/LibraryManager$4;->val$library:Lcom/miui/gallery/assistant/library/Library;

    sget-object p2, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;->STATE_NOT_DOWNLOADED:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/assistant/library/Library;->setLibraryStatus(Lcom/miui/gallery/assistant/library/Library$LibraryStatus;)V

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/assistant/library/LibraryManager$4;->this$0:Lcom/miui/gallery/assistant/library/LibraryManager;

    iget-object p2, p0, Lcom/miui/gallery/assistant/library/LibraryManager$4;->val$library:Lcom/miui/gallery/assistant/library/Library;

    const-string p3, "cancel"

    invoke-static {p1, p2, p3}, Lcom/miui/gallery/assistant/library/LibraryManager;->access$900(Lcom/miui/gallery/assistant/library/LibraryManager;Lcom/miui/gallery/assistant/library/Library;Ljava/lang/String;)V

    goto :goto_0

    :pswitch_2
    iget-object p1, p0, Lcom/miui/gallery/assistant/library/LibraryManager$4;->val$library:Lcom/miui/gallery/assistant/library/Library;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/assistant/library/LibraryManager$4;->val$library:Lcom/miui/gallery/assistant/library/Library;

    sget-object p2, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;->STATE_AVAILABLE:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/assistant/library/Library;->setLibraryStatus(Lcom/miui/gallery/assistant/library/Library$LibraryStatus;)V

    :cond_2
    invoke-static {}, Lcom/miui/gallery/assistant/library/DeleteLibraryTask;->post()V

    iget-object p1, p0, Lcom/miui/gallery/assistant/library/LibraryManager$4;->this$0:Lcom/miui/gallery/assistant/library/LibraryManager;

    iget-object p2, p0, Lcom/miui/gallery/assistant/library/LibraryManager$4;->val$library:Lcom/miui/gallery/assistant/library/Library;

    const-string p3, "success"

    invoke-static {p1, p2, p3}, Lcom/miui/gallery/assistant/library/LibraryManager;->access$900(Lcom/miui/gallery/assistant/library/LibraryManager;Lcom/miui/gallery/assistant/library/Library;Ljava/lang/String;)V

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
