.class Lcom/miui/gallery/picker/uri/UriGenerator$8;
.super Ljava/lang/Object;
.source "UriGenerator.java"

# interfaces
.implements Lcom/miui/gallery/picker/uri/Downloader$DownloadListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/picker/uri/UriGenerator;->startDownload()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/picker/uri/UriGenerator;


# direct methods
.method constructor <init>(Lcom/miui/gallery/picker/uri/UriGenerator;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/picker/uri/UriGenerator$8;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

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

    iget-object v2, p0, Lcom/miui/gallery/picker/uri/UriGenerator$8;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {v2}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$1300(Lcom/miui/gallery/picker/uri/UriGenerator;)[Landroid/net/Uri;

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
    iget-object p1, p0, Lcom/miui/gallery/picker/uri/UriGenerator$8;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {p1}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$1400(Lcom/miui/gallery/picker/uri/UriGenerator;)Ljava/util/ArrayList;

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

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator$8;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {v0}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$1400(Lcom/miui/gallery/picker/uri/UriGenerator;)Ljava/util/ArrayList;

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

    const-string v0, "UriGenerator"

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

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator$8;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {v0}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$700(Lcom/miui/gallery/picker/uri/UriGenerator;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator$8;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {v0}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$700(Lcom/miui/gallery/picker/uri/UriGenerator;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator$8;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {v0}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$700(Lcom/miui/gallery/picker/uri/UriGenerator;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->dismissAllowingStateLoss()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator$8;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {v0, v1}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$702(Lcom/miui/gallery/picker/uri/UriGenerator;Lcom/miui/gallery/picker/uri/PrepareProgressDialog;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/picker/uri/UriGenerator$8;->parseDownloadResult(Ljava/util/List;Ljava/util/List;)V

    iget-object p1, p0, Lcom/miui/gallery/picker/uri/UriGenerator$8;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {p1}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$500(Lcom/miui/gallery/picker/uri/UriGenerator;)Lcom/miui/gallery/picker/uri/Downloader;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/picker/uri/Downloader;->destroy()V

    iget-object p1, p0, Lcom/miui/gallery/picker/uri/UriGenerator$8;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {p1, v1}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$502(Lcom/miui/gallery/picker/uri/UriGenerator;Lcom/miui/gallery/picker/uri/Downloader;)Lcom/miui/gallery/picker/uri/Downloader;

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

    const-string v0, "UriGenerator"

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

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator$8;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {v0}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$700(Lcom/miui/gallery/picker/uri/UriGenerator;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator$8;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {v0}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$700(Lcom/miui/gallery/picker/uri/UriGenerator;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator$8;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {v0}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$700(Lcom/miui/gallery/picker/uri/UriGenerator;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->dismissAllowingStateLoss()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator$8;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {v0}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$600(Lcom/miui/gallery/picker/uri/UriGenerator;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const-string v2, "cancel_dialog"

    invoke-virtual {v0, v2}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_1

    instance-of v2, v0, Lcom/miui/gallery/picker/uri/DownloadCancelDialog;

    if-eqz v2, :cond_1

    check-cast v0, Lcom/miui/gallery/picker/uri/DownloadCancelDialog;

    invoke-virtual {v0}, Lcom/miui/gallery/picker/uri/DownloadCancelDialog;->dismiss()V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator$8;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {v0, v1}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$702(Lcom/miui/gallery/picker/uri/UriGenerator;Lcom/miui/gallery/picker/uri/PrepareProgressDialog;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    :cond_2
    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/picker/uri/UriGenerator$8;->parseDownloadResult(Ljava/util/List;Ljava/util/List;)V

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/picker/uri/UriGenerator$8;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {p1, v1}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$1200(Lcom/miui/gallery/picker/uri/UriGenerator;Ljava/util/List;)V

    goto :goto_0

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/picker/uri/UriGenerator$8;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    const/4 p2, 0x1

    invoke-static {p1, p2}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$300(Lcom/miui/gallery/picker/uri/UriGenerator;Z)V

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/picker/uri/UriGenerator$8;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {p1}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$500(Lcom/miui/gallery/picker/uri/UriGenerator;)Lcom/miui/gallery/picker/uri/Downloader;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/picker/uri/Downloader;->destroy()V

    iget-object p1, p0, Lcom/miui/gallery/picker/uri/UriGenerator$8;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {p1, v1}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$502(Lcom/miui/gallery/picker/uri/UriGenerator;Lcom/miui/gallery/picker/uri/Downloader;)Lcom/miui/gallery/picker/uri/Downloader;

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

    const-string v0, "UriGenerator"

    const-string v1, "download start, %d"

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator$8;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {v0}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$600(Lcom/miui/gallery/picker/uri/UriGenerator;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/picker/uri/UriGenerator$8;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    new-instance v2, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    invoke-direct {v2}, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;-><init>()V

    invoke-static {v1, v2}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$702(Lcom/miui/gallery/picker/uri/UriGenerator;Lcom/miui/gallery/picker/uri/PrepareProgressDialog;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    iget-object v1, p0, Lcom/miui/gallery/picker/uri/UriGenerator$8;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {v1}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$700(Lcom/miui/gallery/picker/uri/UriGenerator;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    move-result-object v1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    invoke-virtual {v1, p1}, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->setMax(I)V

    iget-object p1, p0, Lcom/miui/gallery/picker/uri/UriGenerator$8;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {p1}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$700(Lcom/miui/gallery/picker/uri/UriGenerator;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    move-result-object p1

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->setStage(I)V

    iget-object p1, p0, Lcom/miui/gallery/picker/uri/UriGenerator$8;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {p1}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$700(Lcom/miui/gallery/picker/uri/UriGenerator;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    move-result-object p1

    iget-object v1, p0, Lcom/miui/gallery/picker/uri/UriGenerator$8;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {v1}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$1100(Lcom/miui/gallery/picker/uri/UriGenerator;)Landroid/content/DialogInterface$OnCancelListener;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->setCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    iget-object p1, p0, Lcom/miui/gallery/picker/uri/UriGenerator$8;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {p1}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$700(Lcom/miui/gallery/picker/uri/UriGenerator;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    move-result-object p1

    invoke-virtual {v0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const-string v1, "prepare_progress_dialog"

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    :cond_0
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

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator$8;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {v0}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$700(Lcom/miui/gallery/picker/uri/UriGenerator;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    move-result-object v0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    add-int/2addr p1, p2

    invoke-virtual {v0, p1}, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->updateProgress(I)V

    return-void
.end method
