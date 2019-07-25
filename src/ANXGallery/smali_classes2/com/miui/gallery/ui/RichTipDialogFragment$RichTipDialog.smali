.class Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;
.super Landroid/app/Dialog;
.source "RichTipDialogFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/RichTipDialogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RichTipDialog"
.end annotation


# instance fields
.field private mContent:Landroid/view/View;

.field private mContentContainer:Landroid/widget/FrameLayout;

.field private mPositiveBtn:Landroid/widget/Button;

.field private mPositiveButtonText:Ljava/lang/CharSequence;

.field private mPositiveClickListener:Landroid/view/View$OnClickListener;

.field private mSubTitle:Landroid/widget/TextView;

.field private mSubTitleText:Ljava/lang/CharSequence;

.field private mTitle:Landroid/widget/TextView;

.field private mTitleText:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method private initValue()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->mTitleText:Ljava/lang/CharSequence;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->mTitleText:Ljava/lang/CharSequence;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->setTitle(Ljava/lang/CharSequence;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->mSubTitleText:Ljava/lang/CharSequence;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->mSubTitleText:Ljava/lang/CharSequence;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->setSubTitle(Ljava/lang/CharSequence;)V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->mPositiveButtonText:Ljava/lang/CharSequence;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->mPositiveButtonText:Ljava/lang/CharSequence;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->setPositiveButton(Ljava/lang/CharSequence;)V

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->mContent:Landroid/view/View;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->mContent:Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->setContentView(Landroid/view/View;)V

    :cond_3
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f090224

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->mPositiveClickListener:Landroid/view/View$OnClickListener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->mPositiveClickListener:Landroid/view/View$OnClickListener;

    invoke-interface {v0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    :cond_1
    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b0128

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->setContentView(I)V

    const p1, 0x7f0902fa

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->mTitle:Landroid/widget/TextView;

    const p1, 0x7f0902c1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->mSubTitle:Landroid/widget/TextView;

    const p1, 0x7f0900ae

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout;

    iput-object p1, p0, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->mContentContainer:Landroid/widget/FrameLayout;

    const p1, 0x7f090224

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iput-object p1, p0, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->mPositiveBtn:Landroid/widget/Button;

    iget-object p1, p0, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->mPositiveBtn:Landroid/widget/Button;

    invoke-virtual {p1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->initValue()V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    const/16 v1, 0x50

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    const/4 v1, -0x1

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    const/4 v1, -0x2

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    invoke-virtual {p1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    return-void
.end method

.method public setContentView(Landroid/view/View;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->mContent:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->mContentContainer:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->mContentContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->removeAllViews()V

    iget-object v0, p0, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->mContentContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v0, p1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    :cond_0
    return-void
.end method

.method public setPositiveButton(Ljava/lang/CharSequence;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->mPositiveButtonText:Ljava/lang/CharSequence;

    iget-object v0, p0, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->mPositiveBtn:Landroid/widget/Button;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->mPositiveBtn:Landroid/widget/Button;

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method public setPositiveButtonOnClickListener(Landroid/view/View$OnClickListener;)Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->mPositiveClickListener:Landroid/view/View$OnClickListener;

    return-object p0
.end method

.method public setSubTitle(Ljava/lang/CharSequence;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->mSubTitleText:Ljava/lang/CharSequence;

    iget-object v0, p0, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->mSubTitle:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->mSubTitle:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->mTitleText:Ljava/lang/CharSequence;

    iget-object v0, p0, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->mTitle:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->mTitle:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method
