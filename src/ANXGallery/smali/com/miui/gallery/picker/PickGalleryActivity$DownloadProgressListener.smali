.class Lcom/miui/gallery/picker/PickGalleryActivity$DownloadProgressListener;
.super Ljava/lang/Object;
.source "PickGalleryActivity.java"

# interfaces
.implements Lcom/miui/gallery/picker/uri/Downloader$DownloadListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/picker/PickGalleryActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DownloadProgressListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/picker/PickGalleryActivity;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/picker/PickGalleryActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/picker/PickGalleryActivity$DownloadProgressListener;->this$0:Lcom/miui/gallery/picker/PickGalleryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/picker/PickGalleryActivity;Lcom/miui/gallery/picker/PickGalleryActivity$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/picker/PickGalleryActivity$DownloadProgressListener;-><init>(Lcom/miui/gallery/picker/PickGalleryActivity;)V

    return-void
.end method

.method private parseDownloadResult(Ljava/util/List;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/picker/uri/Downloader$DownloadResult;",
            ">;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/picker/uri/Downloader$DownloadResult;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/picker/uri/Downloader$DownloadResult;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lcom/miui/gallery/picker/uri/Downloader$DownloadResult;->mPath:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    new-instance v1, Ljava/io/File;

    iget-object v2, v0, Lcom/miui/gallery/picker/uri/Downloader$DownloadResult;->mPath:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/picker/PickGalleryActivity$DownloadProgressListener;->this$0:Lcom/miui/gallery/picker/PickGalleryActivity;

    invoke-static {v2}, Lcom/miui/gallery/picker/PickGalleryActivity;->access$800(Lcom/miui/gallery/picker/PickGalleryActivity;)[Landroid/net/Uri;

    move-result-object v2

    iget-object v0, v0, Lcom/miui/gallery/picker/uri/Downloader$DownloadResult;->mTask:Lcom/miui/gallery/picker/uri/Downloader$DownloadTask;

    iget v0, v0, Lcom/miui/gallery/picker/uri/Downloader$DownloadTask;->mPosition:I

    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1

    aput-object v1, v2, v0

    goto :goto_0

    :cond_0
    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/picker/PickGalleryActivity$DownloadProgressListener;->this$0:Lcom/miui/gallery/picker/PickGalleryActivity;

    invoke-static {p1}, Lcom/miui/gallery/picker/PickGalleryActivity;->access$900(Lcom/miui/gallery/picker/PickGalleryActivity;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/picker/uri/Downloader$DownloadResult;

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity$DownloadProgressListener;->this$0:Lcom/miui/gallery/picker/PickGalleryActivity;

    invoke-static {v0}, Lcom/miui/gallery/picker/PickGalleryActivity;->access$900(Lcom/miui/gallery/picker/PickGalleryActivity;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object p2, p2, Lcom/miui/gallery/picker/uri/Downloader$DownloadResult;->mTask:Lcom/miui/gallery/picker/uri/Downloader$DownloadTask;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_2
    return-void
.end method


# virtual methods
.method public onCancelled(Ljava/util/List;Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/picker/uri/Downloader$DownloadResult;",
            ">;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/picker/uri/Downloader$DownloadResult;",
            ">;)V"
        }
    .end annotation

    const-string v0, "PickGalleryActivity"

    const-string v1, "download cancelled, success: %d, fails: %d"

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity$DownloadProgressListener;->this$0:Lcom/miui/gallery/picker/PickGalleryActivity;

    invoke-static {v0}, Lcom/miui/gallery/picker/PickGalleryActivity;->access$2000(Lcom/miui/gallery/picker/PickGalleryActivity;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity$DownloadProgressListener;->this$0:Lcom/miui/gallery/picker/PickGalleryActivity;

    invoke-static {v0}, Lcom/miui/gallery/picker/PickGalleryActivity;->access$2000(Lcom/miui/gallery/picker/PickGalleryActivity;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->dismissSafely()V

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity$DownloadProgressListener;->this$0:Lcom/miui/gallery/picker/PickGalleryActivity;

    invoke-static {v0, v1}, Lcom/miui/gallery/picker/PickGalleryActivity;->access$2002(Lcom/miui/gallery/picker/PickGalleryActivity;Lcom/miui/gallery/picker/uri/PrepareProgressDialog;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/picker/PickGalleryActivity$DownloadProgressListener;->parseDownloadResult(Ljava/util/List;Ljava/util/List;)V

    iget-object p1, p0, Lcom/miui/gallery/picker/PickGalleryActivity$DownloadProgressListener;->this$0:Lcom/miui/gallery/picker/PickGalleryActivity;

    invoke-static {p1}, Lcom/miui/gallery/picker/PickGalleryActivity;->access$1900(Lcom/miui/gallery/picker/PickGalleryActivity;)Lcom/miui/gallery/picker/uri/Downloader;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/picker/uri/Downloader;->destroy()V

    iget-object p1, p0, Lcom/miui/gallery/picker/PickGalleryActivity$DownloadProgressListener;->this$0:Lcom/miui/gallery/picker/PickGalleryActivity;

    invoke-static {p1, v1}, Lcom/miui/gallery/picker/PickGalleryActivity;->access$1902(Lcom/miui/gallery/picker/PickGalleryActivity;Lcom/miui/gallery/picker/uri/Downloader;)Lcom/miui/gallery/picker/uri/Downloader;

    return-void
.end method

.method public onEnd(Ljava/util/List;Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/picker/uri/Downloader$DownloadResult;",
            ">;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/picker/uri/Downloader$DownloadResult;",
            ">;)V"
        }
    .end annotation

    const-string v0, "PickGalleryActivity"

    const-string v1, "download end, success: %d, fails: %d"

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity$DownloadProgressListener;->this$0:Lcom/miui/gallery/picker/PickGalleryActivity;

    invoke-static {v0}, Lcom/miui/gallery/picker/PickGalleryActivity;->access$2000(Lcom/miui/gallery/picker/PickGalleryActivity;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity$DownloadProgressListener;->this$0:Lcom/miui/gallery/picker/PickGalleryActivity;

    invoke-static {v0}, Lcom/miui/gallery/picker/PickGalleryActivity;->access$2000(Lcom/miui/gallery/picker/PickGalleryActivity;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->dismissSafely()V

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity$DownloadProgressListener;->this$0:Lcom/miui/gallery/picker/PickGalleryActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/picker/PickGalleryActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const-string v2, "cancel_dialog"

    invoke-virtual {v0, v2}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_0

    instance-of v2, v0, Lcom/miui/gallery/picker/uri/DownloadCancelDialog;

    if-eqz v2, :cond_0

    check-cast v0, Lcom/miui/gallery/picker/uri/DownloadCancelDialog;

    invoke-virtual {v0}, Lcom/miui/gallery/picker/uri/DownloadCancelDialog;->dismissSafely()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity$DownloadProgressListener;->this$0:Lcom/miui/gallery/picker/PickGalleryActivity;

    invoke-static {v0, v1}, Lcom/miui/gallery/picker/PickGalleryActivity;->access$2002(Lcom/miui/gallery/picker/PickGalleryActivity;Lcom/miui/gallery/picker/uri/PrepareProgressDialog;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/picker/PickGalleryActivity$DownloadProgressListener;->parseDownloadResult(Ljava/util/List;Ljava/util/List;)V

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/picker/PickGalleryActivity$DownloadProgressListener;->this$0:Lcom/miui/gallery/picker/PickGalleryActivity;

    invoke-static {p1}, Lcom/miui/gallery/picker/PickGalleryActivity;->access$1000(Lcom/miui/gallery/picker/PickGalleryActivity;)V

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/picker/PickGalleryActivity$DownloadProgressListener;->this$0:Lcom/miui/gallery/picker/PickGalleryActivity;

    const/4 p2, 0x1

    invoke-static {p1, p2}, Lcom/miui/gallery/picker/PickGalleryActivity;->access$1100(Lcom/miui/gallery/picker/PickGalleryActivity;Z)V

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/picker/PickGalleryActivity$DownloadProgressListener;->this$0:Lcom/miui/gallery/picker/PickGalleryActivity;

    invoke-static {p1}, Lcom/miui/gallery/picker/PickGalleryActivity;->access$1900(Lcom/miui/gallery/picker/PickGalleryActivity;)Lcom/miui/gallery/picker/uri/Downloader;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/picker/uri/Downloader;->destroy()V

    iget-object p1, p0, Lcom/miui/gallery/picker/PickGalleryActivity$DownloadProgressListener;->this$0:Lcom/miui/gallery/picker/PickGalleryActivity;

    invoke-static {p1, v1}, Lcom/miui/gallery/picker/PickGalleryActivity;->access$1902(Lcom/miui/gallery/picker/PickGalleryActivity;Lcom/miui/gallery/picker/uri/Downloader;)Lcom/miui/gallery/picker/uri/Downloader;

    return-void
.end method

.method public onStart(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/picker/uri/Downloader$DownloadTask;",
            ">;)V"
        }
    .end annotation

    const-string v0, "PickGalleryActivity"

    const-string v1, "download start, %d"

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity$DownloadProgressListener;->this$0:Lcom/miui/gallery/picker/PickGalleryActivity;

    new-instance v1, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    invoke-direct {v1}, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;-><init>()V

    invoke-static {v0, v1}, Lcom/miui/gallery/picker/PickGalleryActivity;->access$2002(Lcom/miui/gallery/picker/PickGalleryActivity;Lcom/miui/gallery/picker/uri/PrepareProgressDialog;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity$DownloadProgressListener;->this$0:Lcom/miui/gallery/picker/PickGalleryActivity;

    invoke-static {v0}, Lcom/miui/gallery/picker/PickGalleryActivity;->access$2000(Lcom/miui/gallery/picker/PickGalleryActivity;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    move-result-object v0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->setMax(I)V

    iget-object p1, p0, Lcom/miui/gallery/picker/PickGalleryActivity$DownloadProgressListener;->this$0:Lcom/miui/gallery/picker/PickGalleryActivity;

    invoke-static {p1}, Lcom/miui/gallery/picker/PickGalleryActivity;->access$2000(Lcom/miui/gallery/picker/PickGalleryActivity;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->setStage(I)V

    iget-object p1, p0, Lcom/miui/gallery/picker/PickGalleryActivity$DownloadProgressListener;->this$0:Lcom/miui/gallery/picker/PickGalleryActivity;

    invoke-static {p1}, Lcom/miui/gallery/picker/PickGalleryActivity;->access$2000(Lcom/miui/gallery/picker/PickGalleryActivity;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity$DownloadProgressListener;->this$0:Lcom/miui/gallery/picker/PickGalleryActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/picker/PickGalleryActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const-string v1, "prepare_progress_dialog"

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method public onUpdate(Ljava/util/List;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/picker/uri/Downloader$DownloadResult;",
            ">;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/picker/uri/Downloader$DownloadResult;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/picker/PickGalleryActivity$DownloadProgressListener;->this$0:Lcom/miui/gallery/picker/PickGalleryActivity;

    invoke-static {v0}, Lcom/miui/gallery/picker/PickGalleryActivity;->access$2000(Lcom/miui/gallery/picker/PickGalleryActivity;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    move-result-object v0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    add-int/2addr p1, p2

    invoke-virtual {v0, p1}, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->updateProgress(I)V

    return-void
.end method
