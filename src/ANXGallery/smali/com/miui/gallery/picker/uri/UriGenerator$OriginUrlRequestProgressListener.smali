.class Lcom/miui/gallery/picker/uri/UriGenerator$OriginUrlRequestProgressListener;
.super Ljava/lang/Object;
.source "UriGenerator.java"

# interfaces
.implements Lcom/miui/gallery/picker/uri/OriginUrlRequestor$ProgressListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/picker/uri/UriGenerator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "OriginUrlRequestProgressListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/picker/uri/UriGenerator;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/picker/uri/UriGenerator;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/picker/uri/UriGenerator$OriginUrlRequestProgressListener;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/picker/uri/UriGenerator;Lcom/miui/gallery/picker/uri/UriGenerator$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/picker/uri/UriGenerator$OriginUrlRequestProgressListener;-><init>(Lcom/miui/gallery/picker/uri/UriGenerator;)V

    return-void
.end method

.method private finish()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator$OriginUrlRequestProgressListener;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {v0}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$1500(Lcom/miui/gallery/picker/uri/UriGenerator;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator$OriginUrlRequestProgressListener;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {v0}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$1500(Lcom/miui/gallery/picker/uri/UriGenerator;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator$OriginUrlRequestProgressListener;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {v0}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$1500(Lcom/miui/gallery/picker/uri/UriGenerator;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->dismissAllowingStateLoss()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator$OriginUrlRequestProgressListener;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {v0, v1}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$1502(Lcom/miui/gallery/picker/uri/UriGenerator;Lcom/miui/gallery/picker/uri/PrepareProgressDialog;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator$OriginUrlRequestProgressListener;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {v0}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$1800(Lcom/miui/gallery/picker/uri/UriGenerator;)Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator$OriginUrlRequestProgressListener;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {v0}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$1800(Lcom/miui/gallery/picker/uri/UriGenerator;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator$OriginUrlRequestProgressListener;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {v0}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$800(Lcom/miui/gallery/picker/uri/UriGenerator;)Lcom/miui/gallery/picker/uri/OriginUrlRequestor;

    move-result-object v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator$OriginUrlRequestProgressListener;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {v0}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$800(Lcom/miui/gallery/picker/uri/UriGenerator;)Lcom/miui/gallery/picker/uri/OriginUrlRequestor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/picker/uri/OriginUrlRequestor;->destroy()V

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator$OriginUrlRequestProgressListener;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {v0, v1}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$802(Lcom/miui/gallery/picker/uri/UriGenerator;Lcom/miui/gallery/picker/uri/OriginUrlRequestor;)Lcom/miui/gallery/picker/uri/OriginUrlRequestor;

    :cond_3
    return-void
.end method


# virtual methods
.method public onCancelled()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/picker/uri/UriGenerator$OriginUrlRequestProgressListener;->finish()V

    return-void
.end method

.method public onEnd(Ljava/util/ArrayList;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginInfo;",
            ">;Z)V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/miui/gallery/picker/uri/UriGenerator$OriginUrlRequestProgressListener;->finish()V

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_0

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/picker/uri/UriGenerator$OriginUrlRequestProgressListener;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {p2, p1}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$1200(Lcom/miui/gallery/picker/uri/UriGenerator;Ljava/util/List;)V

    goto :goto_0

    :cond_0
    const-string p1, "UriGenerator"

    const-string p2, "selected images OriginInfo generate error"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object p1

    const p2, 0x7f10059a

    invoke-static {p1, p2}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    iget-object p1, p0, Lcom/miui/gallery/picker/uri/UriGenerator$OriginUrlRequestProgressListener;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {p1}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$1700(Lcom/miui/gallery/picker/uri/UriGenerator;)Lcom/miui/gallery/picker/uri/UriGenerator$UriGenerateListener;

    move-result-object p1

    invoke-interface {p1}, Lcom/miui/gallery/picker/uri/UriGenerator$UriGenerateListener;->onFail()V

    :goto_0
    return-void
.end method

.method public onStart(I)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator$OriginUrlRequestProgressListener;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {v0}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$600(Lcom/miui/gallery/picker/uri/UriGenerator;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/picker/uri/UriGenerator$OriginUrlRequestProgressListener;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    new-instance v2, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    invoke-direct {v2}, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;-><init>()V

    invoke-static {v1, v2}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$1502(Lcom/miui/gallery/picker/uri/UriGenerator;Lcom/miui/gallery/picker/uri/PrepareProgressDialog;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    iget-object v1, p0, Lcom/miui/gallery/picker/uri/UriGenerator$OriginUrlRequestProgressListener;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {v1}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$1500(Lcom/miui/gallery/picker/uri/UriGenerator;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->setMax(I)V

    iget-object p1, p0, Lcom/miui/gallery/picker/uri/UriGenerator$OriginUrlRequestProgressListener;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {p1}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$1500(Lcom/miui/gallery/picker/uri/UriGenerator;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    move-result-object p1

    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->setStage(I)V

    iget-object p1, p0, Lcom/miui/gallery/picker/uri/UriGenerator$OriginUrlRequestProgressListener;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {p1}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$1500(Lcom/miui/gallery/picker/uri/UriGenerator;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    move-result-object p1

    iget-object v1, p0, Lcom/miui/gallery/picker/uri/UriGenerator$OriginUrlRequestProgressListener;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {v1}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$1600(Lcom/miui/gallery/picker/uri/UriGenerator;)Landroid/content/DialogInterface$OnCancelListener;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->setCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    iget-object p1, p0, Lcom/miui/gallery/picker/uri/UriGenerator$OriginUrlRequestProgressListener;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {p1}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$1500(Lcom/miui/gallery/picker/uri/UriGenerator;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    move-result-object p1

    invoke-virtual {v0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const-string v1, "prepare_progress_dialog"

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onUpdate(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator$OriginUrlRequestProgressListener;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {v0}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$1500(Lcom/miui/gallery/picker/uri/UriGenerator;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/UriGenerator$OriginUrlRequestProgressListener;->this$0:Lcom/miui/gallery/picker/uri/UriGenerator;

    invoke-static {v0}, Lcom/miui/gallery/picker/uri/UriGenerator;->access$1500(Lcom/miui/gallery/picker/uri/UriGenerator;)Lcom/miui/gallery/picker/uri/PrepareProgressDialog;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->updateProgress(I)V

    :cond_0
    return-void
.end method
