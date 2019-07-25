.class public Lcom/miui/gallery/ui/PhotoSlimFragment;
.super Lcom/miui/gallery/ui/BaseFragment;
.source "PhotoSlimFragment.java"

# interfaces
.implements Lcom/miui/gallery/cleaner/slim/SlimController$SpaceSlimObserver;


# instance fields
.field private mActionButton:Landroid/widget/Button;

.field private mActionButtonClickListener:Landroid/view/View$OnClickListener;

.field private mActionDescription:Landroid/widget/TextView;

.field private mActionTitle:Landroid/widget/TextView;

.field private mExitConfirmDialog:Lmiui/app/AlertDialog;

.field private mProgressBar:Lcom/miui/gallery/ui/SlimRotateProgressBar;

.field private mSlimController:Lcom/miui/gallery/cleaner/slim/SlimController;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/BaseFragment;-><init>()V

    new-instance v0, Lcom/miui/gallery/ui/PhotoSlimFragment$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoSlimFragment$2;-><init>(Lcom/miui/gallery/ui/PhotoSlimFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mActionButtonClickListener:Landroid/view/View$OnClickListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/PhotoSlimFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoSlimFragment;->showFinishState()V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/PhotoSlimFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoSlimFragment;->onExitCancel()V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/PhotoSlimFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoSlimFragment;->onExit()V

    return-void
.end method

.method private onExit()V
    .locals 1

    invoke-static {}, Lcom/miui/gallery/cleaner/slim/SlimController;->getInstance()Lcom/miui/gallery/cleaner/slim/SlimController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cleaner/slim/SlimController;->stop()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->finish()V

    return-void
.end method

.method private onExitCancel()V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/cleaner/slim/SlimController;->getInstance()Lcom/miui/gallery/cleaner/slim/SlimController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cleaner/slim/SlimController;->resume()V

    const-string v0, "cleaner"

    const-string v1, "slim_exit_cancel"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private remainTime(I)Ljava/lang/String;
    .locals 6

    div-int/lit8 v0, p1, 0x3c

    rem-int/lit8 p1, p1, 0x3c

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-lez v0, :cond_0

    if-lez p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoSlimFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f100683

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v5, v2

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v5, v1

    invoke-virtual {v3, v4, v5}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    if-lez p1, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoSlimFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v3, 0x7f100684

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v1, v2

    invoke-virtual {v0, v3, v1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoSlimFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v3, 0x7f100682

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v1, v2

    invoke-virtual {p1, v3, v1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method private showExitConfirmDialog()V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mExitConfirmDialog:Lmiui/app/AlertDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mExitConfirmDialog:Lmiui/app/AlertDialog;

    invoke-virtual {v0}, Lmiui/app/AlertDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mSlimController:Lcom/miui/gallery/cleaner/slim/SlimController;

    invoke-static {}, Lcom/miui/gallery/cleaner/slim/SlimController;->getInstance()Lcom/miui/gallery/cleaner/slim/SlimController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cleaner/slim/SlimController;->getRemainCount()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mExitConfirmDialog:Lmiui/app/AlertDialog;

    if-nez v1, :cond_1

    new-instance v1, Lmiui/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {v1, v2}, Lmiui/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f100689

    new-instance v3, Lcom/miui/gallery/ui/PhotoSlimFragment$5;

    invoke-direct {v3, p0}, Lcom/miui/gallery/ui/PhotoSlimFragment$5;-><init>(Lcom/miui/gallery/ui/PhotoSlimFragment;)V

    invoke-virtual {v1, v2, v3}, Lmiui/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;

    move-result-object v1

    const/high16 v2, 0x1040000

    new-instance v3, Lcom/miui/gallery/ui/PhotoSlimFragment$4;

    invoke-direct {v3, p0}, Lcom/miui/gallery/ui/PhotoSlimFragment$4;-><init>(Lcom/miui/gallery/ui/PhotoSlimFragment;)V

    invoke-virtual {v1, v2, v3}, Lmiui/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f10068a

    invoke-virtual {v1, v2}, Lmiui/app/AlertDialog$Builder;->setTitle(I)Lmiui/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/ui/PhotoSlimFragment$3;

    invoke-direct {v2, p0}, Lcom/miui/gallery/ui/PhotoSlimFragment$3;-><init>(Lcom/miui/gallery/ui/PhotoSlimFragment;)V

    invoke-virtual {v1, v2}, Lmiui/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Lmiui/app/AlertDialog$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lmiui/app/AlertDialog$Builder;->create()Lmiui/app/AlertDialog;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mExitConfirmDialog:Lmiui/app/AlertDialog;

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mExitConfirmDialog:Lmiui/app/AlertDialog;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoSlimFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0e0048

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v0, v4}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lmiui/app/AlertDialog;->setMessage(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mExitConfirmDialog:Lmiui/app/AlertDialog;

    invoke-virtual {v0}, Lmiui/app/AlertDialog;->show()V

    return-void
.end method

.method private showFinishState()V
    .locals 7

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoSlimFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mSlimController:Lcom/miui/gallery/cleaner/slim/SlimController;

    invoke-virtual {v0}, Lcom/miui/gallery/cleaner/slim/SlimController;->getSlimCount()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mActionDescription:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoSlimFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0e0047

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v0, v4}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mActionTitle:Landroid/widget/TextView;

    const v1, 0x7f100681

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mActionButton:Landroid/widget/Button;

    const v1, 0x7f100680

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setText(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mActionButton:Landroid/widget/Button;

    const v1, 0x7f070046

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setBackgroundResource(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mActionButton:Landroid/widget/Button;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v1}, Lcom/miui/gallery/activity/BaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f050048

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTextColor(Landroid/content/res/ColorStateList;)V

    return-void
.end method


# virtual methods
.method public getPageName()Ljava/lang/String;
    .locals 1

    const-string v0, "photo_slim"

    return-object v0
.end method

.method protected getThemeRes()I
    .locals 1

    const v0, 0x7f1100a0

    return v0
.end method

.method public onBackPressed()Z
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mSlimController:Lcom/miui/gallery/cleaner/slim/SlimController;

    invoke-virtual {v0}, Lcom/miui/gallery/cleaner/slim/SlimController;->isSlimming()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoSlimFragment;->onExit()V

    return v1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mSlimController:Lcom/miui/gallery/cleaner/slim/SlimController;

    invoke-virtual {v0}, Lcom/miui/gallery/cleaner/slim/SlimController;->pause()V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoSlimFragment;->showExitConfirmDialog()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mSlimController:Lcom/miui/gallery/cleaner/slim/SlimController;

    invoke-virtual {v4}, Lcom/miui/gallery/cleaner/slim/SlimController;->getStartTime()J

    move-result-wide v4

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x3e8

    div-long/2addr v2, v4

    long-to-int v2, v2

    const-string v3, "durationBeforeExit"

    int-to-float v2, v2

    sget-object v4, Lcom/miui/gallery/cleaner/slim/SlimController;->TIME_COST_STAGE:[I

    invoke-static {v2, v4}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->formatValueStage(F[I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "cleaner"

    const-string v3, "slim_exit"

    invoke-static {v2, v3, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return v1
.end method

.method public onDestroy()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseFragment;->onDestroy()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mExitConfirmDialog:Lmiui/app/AlertDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mExitConfirmDialog:Lmiui/app/AlertDialog;

    invoke-virtual {v0}, Lmiui/app/AlertDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mExitConfirmDialog:Lmiui/app/AlertDialog;

    invoke-virtual {v0}, Lmiui/app/AlertDialog;->dismiss()V

    :cond_0
    return-void
.end method

.method public onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3

    const/4 p3, 0x0

    const v0, 0x7f0b010e

    invoke-virtual {p1, v0, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f0902fa

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mActionTitle:Landroid/widget/TextView;

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mActionTitle:Landroid/widget/TextView;

    const v0, 0x7f10068b

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(I)V

    const p2, 0x7f0900d0

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mActionDescription:Landroid/widget/TextView;

    const p2, 0x7f090004

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/Button;

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mActionButton:Landroid/widget/Button;

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mActionButton:Landroid/widget/Button;

    const v0, 0x7f10068d

    invoke-virtual {p2, v0}, Landroid/widget/Button;->setText(I)V

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mActionButton:Landroid/widget/Button;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mActionButtonClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p2, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p2, 0x7f090233

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/ui/SlimRotateProgressBar;

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mProgressBar:Lcom/miui/gallery/ui/SlimRotateProgressBar;

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mProgressBar:Lcom/miui/gallery/ui/SlimRotateProgressBar;

    const v0, 0x7f10068c

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/PhotoSlimFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/miui/gallery/ui/SlimRotateProgressBar;->setDescription(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mProgressBar:Lcom/miui/gallery/ui/SlimRotateProgressBar;

    const-wide/16 v0, 0x0

    const/4 v2, 0x0

    invoke-virtual {p2, v0, v1, p3, v2}, Lcom/miui/gallery/ui/SlimRotateProgressBar;->setNumber(JZLjava/lang/Runnable;)V

    invoke-static {}, Lcom/miui/gallery/cleaner/slim/SlimController;->getInstance()Lcom/miui/gallery/cleaner/slim/SlimController;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mSlimController:Lcom/miui/gallery/cleaner/slim/SlimController;

    return-object p1
.end method

.method public onSlimPaused()V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mSlimController:Lcom/miui/gallery/cleaner/slim/SlimController;

    invoke-static {}, Lcom/miui/gallery/cleaner/slim/SlimController;->getInstance()Lcom/miui/gallery/cleaner/slim/SlimController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cleaner/slim/SlimController;->getRemainCount()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mActionDescription:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoSlimFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const v4, 0x7f0e0049

    invoke-virtual {v2, v4, v0, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mProgressBar:Lcom/miui/gallery/ui/SlimRotateProgressBar;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/SlimRotateProgressBar;->pause()V

    return-void
.end method

.method public onSlimProgress(JJI)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoSlimFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mSlimController:Lcom/miui/gallery/cleaner/slim/SlimController;

    invoke-virtual {p1}, Lcom/miui/gallery/cleaner/slim/SlimController;->isSlimPaused()Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_1

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mActionTitle:Landroid/widget/TextView;

    add-int/lit8 p2, p5, 0x1

    int-to-float p2, p2

    const v0, 0x3e4ccccd    # 0.2f

    mul-float p2, p2, v0

    float-to-double v0, p2

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int p2, v0

    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/PhotoSlimFragment;->remainTime(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 p1, 0x1

    if-lt p5, p1, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mProgressBar:Lcom/miui/gallery/ui/SlimRotateProgressBar;

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p2, p3, p4, v1, v0}, Lcom/miui/gallery/ui/SlimRotateProgressBar;->setNumber(JZLjava/lang/Runnable;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mActionDescription:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoSlimFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const p4, 0x7f0e0049

    new-array p1, p1, [Ljava/lang/Object;

    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, p1, v1

    invoke-virtual {p3, p4, p5, p1}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_1
    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mProgressBar:Lcom/miui/gallery/ui/SlimRotateProgressBar;

    new-instance p5, Lcom/miui/gallery/ui/PhotoSlimFragment$1;

    invoke-direct {p5, p0}, Lcom/miui/gallery/ui/PhotoSlimFragment$1;-><init>(Lcom/miui/gallery/ui/PhotoSlimFragment;)V

    invoke-virtual {p2, p3, p4, p1, p5}, Lcom/miui/gallery/ui/SlimRotateProgressBar;->setNumber(JZLjava/lang/Runnable;)V

    :goto_0
    return-void

    :cond_2
    :goto_1
    return-void
.end method

.method public onSlimResumed()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mProgressBar:Lcom/miui/gallery/ui/SlimRotateProgressBar;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/SlimRotateProgressBar;->resume()V

    return-void
.end method

.method public onStart()V
    .locals 7

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseFragment;->onStart()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mSlimController:Lcom/miui/gallery/cleaner/slim/SlimController;

    invoke-virtual {v0}, Lcom/miui/gallery/cleaner/slim/SlimController;->isSlimStarted()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->finish()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mSlimController:Lcom/miui/gallery/cleaner/slim/SlimController;

    invoke-virtual {v0, p0}, Lcom/miui/gallery/cleaner/slim/SlimController;->registerObserver(Lcom/miui/gallery/cleaner/slim/SlimController$SpaceSlimObserver;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mSlimController:Lcom/miui/gallery/cleaner/slim/SlimController;

    invoke-virtual {v0}, Lcom/miui/gallery/cleaner/slim/SlimController;->isSlimming()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mSlimController:Lcom/miui/gallery/cleaner/slim/SlimController;

    invoke-virtual {v0}, Lcom/miui/gallery/cleaner/slim/SlimController;->getReleaseSize()J

    move-result-wide v4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mProgressBar:Lcom/miui/gallery/ui/SlimRotateProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v4, v5, v1}, Lcom/miui/gallery/ui/SlimRotateProgressBar;->setNumber(JZ)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mSlimController:Lcom/miui/gallery/cleaner/slim/SlimController;

    invoke-virtual {v0}, Lcom/miui/gallery/cleaner/slim/SlimController;->isSlimPaused()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoSlimFragment;->showExitConfirmDialog()V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoSlimFragment;->onSlimPaused()V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mSlimController:Lcom/miui/gallery/cleaner/slim/SlimController;

    invoke-virtual {v0}, Lcom/miui/gallery/cleaner/slim/SlimController;->getRemainCount()I

    move-result v6

    const-wide/16 v2, -0x1

    move-object v1, p0

    invoke-virtual/range {v1 .. v6}, Lcom/miui/gallery/ui/PhotoSlimFragment;->onSlimProgress(JJI)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mProgressBar:Lcom/miui/gallery/ui/SlimRotateProgressBar;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mSlimController:Lcom/miui/gallery/cleaner/slim/SlimController;

    invoke-virtual {v1}, Lcom/miui/gallery/cleaner/slim/SlimController;->getReleaseSize()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/ui/SlimRotateProgressBar;->setNumber(J)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoSlimFragment;->showFinishState()V

    :goto_0
    return-void
.end method

.method public onStop()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseFragment;->onStop()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoSlimFragment;->mSlimController:Lcom/miui/gallery/cleaner/slim/SlimController;

    invoke-virtual {v0, p0}, Lcom/miui/gallery/cleaner/slim/SlimController;->unregisterObserver(Lcom/miui/gallery/cleaner/slim/SlimController$SpaceSlimObserver;)V

    return-void
.end method
