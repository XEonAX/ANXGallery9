.class public Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;
.super Lcom/miui/gallery/widget/GalleryDialogFragment;
.source "CardDownloadDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/card/ui/detail/CardDownloadDialog$CallBack;
    }
.end annotation


# instance fields
.field private mCallBack:Lcom/miui/gallery/card/ui/detail/CardDownloadDialog$CallBack;

.field private mLastBackPressedTime:J

.field private mProgressDialog:Lmiui/app/ProgressDialog;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;)Z
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;->backPress()Z

    move-result p0

    return p0
.end method

.method private backPress()Z
    .locals 7

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;->mLastBackPressedTime:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0xbb8

    cmp-long v6, v2, v4

    if-lez v6, :cond_0

    iput-wide v0, p0, Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;->mLastBackPressedTime:J

    invoke-virtual {p0}, Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f1006af

    invoke-virtual {p0, v1}, Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;->mCallBack:Lcom/miui/gallery/card/ui/detail/CardDownloadDialog$CallBack;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;->mCallBack:Lcom/miui/gallery/card/ui/detail/CardDownloadDialog$CallBack;

    invoke-interface {v0}, Lcom/miui/gallery/card/ui/detail/CardDownloadDialog$CallBack;->cancel()V

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;->dismissSafely()V

    :goto_0
    const/4 v0, 0x1

    return v0
.end method


# virtual methods
.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 2

    new-instance p1, Lmiui/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p1, v0}, Lmiui/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;->mProgressDialog:Lmiui/app/ProgressDialog;

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;->mProgressDialog:Lmiui/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f1006b5

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lmiui/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;->mProgressDialog:Lmiui/app/ProgressDialog;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lmiui/app/ProgressDialog;->setProgressStyle(I)V

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;->mProgressDialog:Lmiui/app/ProgressDialog;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lmiui/app/ProgressDialog;->setIndeterminate(Z)V

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;->mProgressDialog:Lmiui/app/ProgressDialog;

    const/16 v1, 0x64

    invoke-virtual {p1, v1}, Lmiui/app/ProgressDialog;->setMax(I)V

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;->mProgressDialog:Lmiui/app/ProgressDialog;

    invoke-virtual {p1, v0}, Lmiui/app/ProgressDialog;->setCanceledOnTouchOutside(Z)V

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;->mProgressDialog:Lmiui/app/ProgressDialog;

    new-instance v1, Lcom/miui/gallery/card/ui/detail/CardDownloadDialog$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/card/ui/detail/CardDownloadDialog$1;-><init>(Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;)V

    invoke-virtual {p1, v1}, Lmiui/app/ProgressDialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;->setCancelable(Z)V

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;->mProgressDialog:Lmiui/app/ProgressDialog;

    return-object p1
.end method

.method public onDestroyView()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onDestroyView()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;->mCallBack:Lcom/miui/gallery/card/ui/detail/CardDownloadDialog$CallBack;

    return-void
.end method

.method public setCallBack(Lcom/miui/gallery/card/ui/detail/CardDownloadDialog$CallBack;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;->mCallBack:Lcom/miui/gallery/card/ui/detail/CardDownloadDialog$CallBack;

    return-void
.end method

.method public show(Landroid/app/Activity;)V
    .locals 1

    invoke-virtual {p1}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    const-string v0, "CardDownloadDialog"

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method public updateProgress(F)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;->mProgressDialog:Lmiui/app/ProgressDialog;

    if-eqz v0, :cond_0

    const/high16 v0, 0x42c80000    # 100.0f

    mul-float p1, p1, v0

    float-to-int p1, p1

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;->mProgressDialog:Lmiui/app/ProgressDialog;

    invoke-virtual {v0, p1}, Lmiui/app/ProgressDialog;->setProgress(I)V

    :cond_0
    return-void
.end method
