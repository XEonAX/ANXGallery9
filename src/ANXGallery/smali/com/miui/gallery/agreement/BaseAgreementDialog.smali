.class public abstract Lcom/miui/gallery/agreement/BaseAgreementDialog;
.super Landroid/app/Dialog;
.source "BaseAgreementDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/agreement/BaseAgreementDialog$BaseDividerDecoration;
    }
.end annotation


# instance fields
.field private mActionBtn:Landroid/widget/TextView;

.field private mAgreementListener:Lcom/miui/gallery/agreement/core/OnAgreementInvokedListener;

.field private mAllowQuit:Z

.field private mListView:Landroid/support/v7/widget/RecyclerView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Z)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/agreement/BaseAgreementDialog;->mAllowQuit:Z

    iput-boolean p2, p0, Lcom/miui/gallery/agreement/BaseAgreementDialog;->mAllowQuit:Z

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/agreement/BaseAgreementDialog;->setCancelable(Z)V

    return-void
.end method

.method private initView()V
    .locals 3

    sget v0, Lcom/miui/gallery/permission/R$id;->quit:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/agreement/BaseAgreementDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iget-boolean v1, p0, Lcom/miui/gallery/agreement/BaseAgreementDialog;->mAllowQuit:Z

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0

    :cond_0
    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :goto_0
    sget v0, Lcom/miui/gallery/permission/R$id;->summary:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/agreement/BaseAgreementDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/miui/gallery/agreement/BaseAgreementDialog;->getSummary()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    sget v0, Lcom/miui/gallery/permission/R$id;->list:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/agreement/BaseAgreementDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    iput-object v0, p0, Lcom/miui/gallery/agreement/BaseAgreementDialog;->mListView:Landroid/support/v7/widget/RecyclerView;

    sget v0, Lcom/miui/gallery/permission/R$id;->action:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/agreement/BaseAgreementDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/agreement/BaseAgreementDialog;->mActionBtn:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/miui/gallery/agreement/BaseAgreementDialog;->mActionBtn:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/miui/gallery/agreement/BaseAgreementDialog;->getButtonText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/miui/gallery/agreement/BaseAgreementDialog;->mActionBtn:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/miui/gallery/agreement/BaseAgreementDialog;->mListView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {p0}, Lcom/miui/gallery/agreement/BaseAgreementDialog;->getDividerDecoration()Landroid/support/v7/widget/RecyclerView$ItemDecoration;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    iget-object v0, p0, Lcom/miui/gallery/agreement/BaseAgreementDialog;->mListView:Landroid/support/v7/widget/RecyclerView;

    new-instance v1, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/miui/gallery/agreement/BaseAgreementDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    iget-object v0, p0, Lcom/miui/gallery/agreement/BaseAgreementDialog;->mListView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {p0}, Lcom/miui/gallery/agreement/BaseAgreementDialog;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    invoke-direct {p0}, Lcom/miui/gallery/agreement/BaseAgreementDialog;->loadAppInfo()V

    return-void
.end method

.method private loadAppInfo()V
    .locals 3

    sget v0, Lcom/miui/gallery/permission/R$id;->app_icon:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/agreement/BaseAgreementDialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/miui/gallery/agreement/BaseAgreementDialog;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    invoke-virtual {p0}, Lcom/miui/gallery/agreement/BaseAgreementDialog;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/pm/ApplicationInfo;->loadIcon(Landroid/content/pm/PackageManager;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method


# virtual methods
.method protected abstract getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;
.end method

.method protected getButtonText()Ljava/lang/CharSequence;
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/agreement/BaseAgreementDialog;->getContext()Landroid/content/Context;

    move-result-object v0

    sget v1, Lcom/miui/gallery/permission/R$string;->agreement_agree:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method protected getDividerDecoration()Landroid/support/v7/widget/RecyclerView$ItemDecoration;
    .locals 1

    new-instance v0, Lcom/miui/gallery/agreement/BaseAgreementDialog$BaseDividerDecoration;

    invoke-direct {v0}, Lcom/miui/gallery/agreement/BaseAgreementDialog$BaseDividerDecoration;-><init>()V

    return-object v0
.end method

.method protected abstract getSummary()Ljava/lang/CharSequence;
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/miui/gallery/permission/R$id;->quit:I

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/agreement/BaseAgreementDialog;->dismiss()V

    iget-object v0, p0, Lcom/miui/gallery/agreement/BaseAgreementDialog;->mAgreementListener:Lcom/miui/gallery/agreement/core/OnAgreementInvokedListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/agreement/BaseAgreementDialog;->mAgreementListener:Lcom/miui/gallery/agreement/core/OnAgreementInvokedListener;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/miui/gallery/agreement/core/OnAgreementInvokedListener;->onAgreementInvoked(Z)V

    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sget v1, Lcom/miui/gallery/permission/R$id;->action:I

    if-ne v0, v1, :cond_1

    invoke-virtual {p1}, Landroid/view/View;->isEnabled()Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/agreement/BaseAgreementDialog;->dismiss()V

    iget-object p1, p0, Lcom/miui/gallery/agreement/BaseAgreementDialog;->mAgreementListener:Lcom/miui/gallery/agreement/core/OnAgreementInvokedListener;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/agreement/BaseAgreementDialog;->mAgreementListener:Lcom/miui/gallery/agreement/core/OnAgreementInvokedListener;

    const/4 v0, 0x1

    invoke-interface {p1, v0}, Lcom/miui/gallery/agreement/core/OnAgreementInvokedListener;->onAgreementInvoked(Z)V

    :cond_1
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    sget p1, Lcom/miui/gallery/permission/R$layout;->user_agreement:I

    invoke-virtual {p0, p1}, Lcom/miui/gallery/agreement/BaseAgreementDialog;->setContentView(I)V

    invoke-direct {p0}, Lcom/miui/gallery/agreement/BaseAgreementDialog;->initView()V

    invoke-virtual {p0}, Lcom/miui/gallery/agreement/BaseAgreementDialog;->getWindow()Landroid/view/Window;

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

.method protected setActionButtonEnabled(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/agreement/BaseAgreementDialog;->mActionBtn:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setEnabled(Z)V

    return-void
.end method

.method public setOnAgreementListener(Lcom/miui/gallery/agreement/core/OnAgreementInvokedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/agreement/BaseAgreementDialog;->mAgreementListener:Lcom/miui/gallery/agreement/core/OnAgreementInvokedListener;

    return-void
.end method
