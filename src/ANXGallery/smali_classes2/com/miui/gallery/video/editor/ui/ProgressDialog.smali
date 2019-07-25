.class public Lcom/miui/gallery/video/editor/ui/ProgressDialog;
.super Lcom/miui/gallery/widget/GalleryDialogFragment;
.source "ProgressDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/video/editor/ui/ProgressDialog$ProgressDialogInterface;
    }
.end annotation


# instance fields
.field private mCancelImageButton:Landroid/widget/ImageButton;

.field private mMsgTextView:Landroid/widget/TextView;

.field private mProgressBar:Landroid/widget/ProgressBar;

.field private mProgressDialogInterface:Lcom/miui/gallery/video/editor/ui/ProgressDialog$ProgressDialogInterface;

.field private mTempMax:I

.field private mTempMsg:Ljava/lang/String;

.field private mTempMsgId:I

.field private mTempProgress:I

.field private mView:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->mTempMax:I

    iput v0, p0, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->mTempProgress:I

    iput v0, p0, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->mTempMsgId:I

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/video/editor/ui/ProgressDialog;)Lcom/miui/gallery/video/editor/ui/ProgressDialog$ProgressDialogInterface;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->mProgressDialogInterface:Lcom/miui/gallery/video/editor/ui/ProgressDialog$ProgressDialogInterface;

    return-object p0
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const v0, 0x7f0b017e

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->mView:Landroid/view/View;

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->mView:Landroid/view/View;

    const v0, 0x7f090336

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->mMsgTextView:Landroid/widget/TextView;

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->mView:Landroid/view/View;

    const v0, 0x7f090337

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ProgressBar;

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->mProgressBar:Landroid/widget/ProgressBar;

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->mView:Landroid/view/View;

    const v0, 0x7f090335

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageButton;

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->mCancelImageButton:Landroid/widget/ImageButton;

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->mProgressBar:Landroid/widget/ProgressBar;

    const/16 v0, 0x64

    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setMax(I)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->mCancelImageButton:Landroid/widget/ImageButton;

    new-instance v0, Lcom/miui/gallery/video/editor/ui/ProgressDialog$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/video/editor/ui/ProgressDialog$1;-><init>(Lcom/miui/gallery/video/editor/ui/ProgressDialog;)V

    invoke-virtual {p1, v0}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget p1, p0, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->mTempMax:I

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->mProgressBar:Landroid/widget/ProgressBar;

    iget v1, p0, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->mTempMax:I

    invoke-virtual {p1, v1}, Landroid/widget/ProgressBar;->setMax(I)V

    :cond_0
    iget p1, p0, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->mTempProgress:I

    if-eq p1, v0, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->mProgressBar:Landroid/widget/ProgressBar;

    iget v1, p0, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->mTempProgress:I

    invoke-virtual {p1, v1}, Landroid/widget/ProgressBar;->setProgress(I)V

    :cond_1
    iget p1, p0, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->mTempMsgId:I

    if-eq p1, v0, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->mMsgTextView:Landroid/widget/TextView;

    iget v0, p0, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->mTempMsgId:I

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(I)V

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->mTempMsg:Ljava/lang/String;

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->mMsgTextView:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->mTempMsg:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_3
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 3

    new-instance p1, Landroid/app/Dialog;

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f1100ce

    invoke-direct {p1, v0, v1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {v0}, Landroid/view/Display;->getWidth()I

    move-result v0

    const/4 v2, -0x2

    invoke-direct {v1, v0, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->mView:Landroid/view/View;

    invoke-virtual {p1, v0, v1}, Landroid/app/Dialog;->setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    invoke-virtual {p1, v0}, Landroid/app/Dialog;->setCancelable(Z)V

    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x50

    invoke-virtual {v0, v1}, Landroid/view/Window;->setGravity(I)V

    new-instance v0, Lcom/miui/gallery/video/editor/ui/ProgressDialog$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/video/editor/ui/ProgressDialog$2;-><init>(Lcom/miui/gallery/video/editor/ui/ProgressDialog;)V

    invoke-virtual {p1, v0}, Landroid/app/Dialog;->setOnKeyListener(Landroid/content/DialogInterface$OnKeyListener;)V

    return-object p1
.end method

.method public setCancleButtonEnable(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->mCancelImageButton:Landroid/widget/ImageButton;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->mCancelImageButton:Landroid/widget/ImageButton;

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/4 p1, 0x4

    :goto_0
    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setVisibility(I)V

    :cond_1
    return-void
.end method

.method public setMax(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->mProgressBar:Landroid/widget/ProgressBar;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0, p1}, Landroid/widget/ProgressBar;->setMax(I)V

    goto :goto_0

    :cond_0
    iput p1, p0, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->mTempMax:I

    :goto_0
    return-void
.end method

.method public setMsg(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->mMsgTextView:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->mMsgTextView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    :cond_0
    iput p1, p0, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->mTempMsgId:I

    :goto_0
    return-void
.end method

.method public setProgress(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->mProgressBar:Landroid/widget/ProgressBar;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0, p1}, Landroid/widget/ProgressBar;->setProgress(I)V

    goto :goto_0

    :cond_0
    iput p1, p0, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->mTempProgress:I

    :goto_0
    return-void
.end method

.method public setProgressDialogInterface(Lcom/miui/gallery/video/editor/ui/ProgressDialog$ProgressDialogInterface;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/ProgressDialog;->mProgressDialogInterface:Lcom/miui/gallery/video/editor/ui/ProgressDialog$ProgressDialogInterface;

    return-void
.end method
