.class public Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;
.super Lcom/miui/gallery/widget/GalleryDialogFragment;
.source "MovieSavingFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$OnSavingFinishListener;
    }
.end annotation


# instance fields
.field private mLastBackPressedTime:J

.field private mOnSavingFinishListener:Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$OnSavingFinishListener;

.field private mProgressDialog:Lmiui/app/ProgressDialog;

.field private mShareCallback:Lcom/miui/gallery/movie/ui/listener/IShareDataCallback;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;-><init>()V

    return-void
.end method

.method private backPress()Z
    .locals 7

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;->mLastBackPressedTime:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0xbb8

    cmp-long v6, v2, v4

    if-lez v6, :cond_0

    iput-wide v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;->mLastBackPressedTime:J

    invoke-virtual {p0}, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f10049c

    invoke-virtual {p0, v1}, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;->mShareCallback:Lcom/miui/gallery/movie/ui/listener/IShareDataCallback;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;->mShareCallback:Lcom/miui/gallery/movie/ui/listener/IShareDataCallback;

    invoke-interface {v0}, Lcom/miui/gallery/movie/ui/listener/IShareDataCallback;->cancelExport()V

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;->dismissSafely()V

    :goto_0
    const/4 v0, 0x1

    return v0
.end method

.method private doSaving(Landroid/content/Context;Landroid/app/FragmentManager;Lcom/miui/gallery/movie/core/MovieManager;Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$OnSavingFinishListener;)V
    .locals 8

    invoke-static {}, Lcom/miui/gallery/movie/utils/MovieStorage;->getTempFilePath()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$1;

    move-object v0, v7

    move-object v1, p0

    move-object v2, p2

    move-object v3, v6

    move-object v4, p1

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$1;-><init>(Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;Landroid/app/FragmentManager;Ljava/lang/String;Landroid/content/Context;Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$OnSavingFinishListener;)V

    invoke-virtual {p3, v6, v7}, Lcom/miui/gallery/movie/core/MovieManager;->export(Ljava/lang/String;Lcom/miui/gallery/movie/core/MovieManager$EncodeStateInterface;)V

    return-void
.end method

.method public static synthetic lambda$onCreateDialog$134(Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 0

    const/4 p1, 0x4

    if-ne p2, p1, :cond_0

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result p1

    if-nez p1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;->backPress()Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public static synthetic lambda$show$135(Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;Landroid/content/Context;ZZLjava/lang/String;)V
    .locals 2

    const/4 v0, 0x0

    if-eqz p2, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;->mOnSavingFinishListener:Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$OnSavingFinishListener;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;->mOnSavingFinishListener:Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$OnSavingFinishListener;

    invoke-interface {v1, p2, p3, p4}, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$OnSavingFinishListener;->onFinish(ZZLjava/lang/String;)V

    :cond_0
    const p3, 0x7f10049d

    invoke-static {p1, p3, v0}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;II)V

    goto :goto_0

    :cond_1
    if-nez p3, :cond_2

    const p3, 0x7f10049b

    invoke-static {p1, p3, v0}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;II)V

    :cond_2
    :goto_0
    if-eqz p2, :cond_3

    const-string p1, "0"

    goto :goto_1

    :cond_3
    const-string p1, "-1"

    :goto_1
    invoke-static {p1}, Lcom/miui/gallery/movie/utils/MovieStatUtils;->statSaveResult(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic lambda$showAndShare$136(Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;Landroid/content/Context;ZZLjava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    const p2, 0x7f10049d

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;II)V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;->mShareCallback:Lcom/miui/gallery/movie/ui/listener/IShareDataCallback;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;->mShareCallback:Lcom/miui/gallery/movie/ui/listener/IShareDataCallback;

    invoke-interface {p1, p4}, Lcom/miui/gallery/movie/ui/listener/IShareDataCallback;->handleShareEvent(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    if-nez p3, :cond_1

    const p2, 0x7f10049b

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;II)V

    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public onAttach(Landroid/content/Context;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onAttach(Landroid/content/Context;)V

    instance-of v0, p1, Lcom/miui/gallery/movie/ui/listener/IShareDataCallback;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/miui/gallery/movie/ui/listener/IShareDataCallback;

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;->mShareCallback:Lcom/miui/gallery/movie/ui/listener/IShareDataCallback;

    :cond_0
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 2

    new-instance p1, Lmiui/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p1, v0}, Lmiui/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f10049e

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lmiui/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lmiui/app/ProgressDialog;->setProgressStyle(I)V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lmiui/app/ProgressDialog;->setIndeterminate(Z)V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    const/16 v1, 0x64

    invoke-virtual {p1, v1}, Lmiui/app/ProgressDialog;->setMax(I)V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    invoke-virtual {p1, v0}, Lmiui/app/ProgressDialog;->setCanceledOnTouchOutside(Z)V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    new-instance v1, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieSavingFragment$-3REKdT7vGHK06w04lDptjkRfBc;

    invoke-direct {v1, p0}, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieSavingFragment$-3REKdT7vGHK06w04lDptjkRfBc;-><init>(Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;)V

    invoke-virtual {p1, v1}, Lmiui/app/ProgressDialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;->setCancelable(Z)V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    return-object p1
.end method

.method public onDetach()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onDetach()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;->mShareCallback:Lcom/miui/gallery/movie/ui/listener/IShareDataCallback;

    iput-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;->mOnSavingFinishListener:Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$OnSavingFinishListener;

    return-void
.end method

.method public setProgress(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;->mProgressDialog:Lmiui/app/ProgressDialog;

    invoke-virtual {v0, p1}, Lmiui/app/ProgressDialog;->setProgress(I)V

    return-void
.end method

.method public show(Landroid/app/Activity;Lcom/miui/gallery/movie/core/MovieManager;Lcom/miui/gallery/movie/entity/MovieInfo;ZLcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$OnSavingFinishListener;)V
    .locals 0

    invoke-static {p4, p3}, Lcom/miui/gallery/movie/utils/MovieStatUtils;->statSaveClick(ZLcom/miui/gallery/movie/entity/MovieInfo;)V

    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object p3

    iput-object p5, p0, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;->mOnSavingFinishListener:Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$OnSavingFinishListener;

    invoke-virtual {p1}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    new-instance p4, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieSavingFragment$PjE4X_hs50Ics74osEV1E6mU2Fo;

    invoke-direct {p4, p0, p3}, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieSavingFragment$PjE4X_hs50Ics74osEV1E6mU2Fo;-><init>(Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;Landroid/content/Context;)V

    invoke-direct {p0, p3, p1, p2, p4}, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;->doSaving(Landroid/content/Context;Landroid/app/FragmentManager;Lcom/miui/gallery/movie/core/MovieManager;Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$OnSavingFinishListener;)V

    return-void
.end method

.method public showAndShare(Landroid/app/Activity;Lcom/miui/gallery/movie/core/MovieManager;Lcom/miui/gallery/movie/entity/MovieInfo;)V
    .locals 1

    invoke-static {p3}, Lcom/miui/gallery/movie/utils/MovieStatUtils;->statShareClick(Lcom/miui/gallery/movie/entity/MovieInfo;)V

    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object p3

    invoke-virtual {p1}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    new-instance v0, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieSavingFragment$3dmsRSSnwR1o0kxLuCTEpeohHiw;

    invoke-direct {v0, p0, p3}, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieSavingFragment$3dmsRSSnwR1o0kxLuCTEpeohHiw;-><init>(Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;Landroid/content/Context;)V

    invoke-direct {p0, p3, p1, p2, v0}, Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment;->doSaving(Landroid/content/Context;Landroid/app/FragmentManager;Lcom/miui/gallery/movie/core/MovieManager;Lcom/miui/gallery/movie/ui/fragment/MovieSavingFragment$OnSavingFinishListener;)V

    return-void
.end method
