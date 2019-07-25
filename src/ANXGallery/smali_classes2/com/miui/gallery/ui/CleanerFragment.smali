.class public Lcom/miui/gallery/ui/CleanerFragment;
.super Lcom/miui/gallery/ui/BaseFragment;
.source "CleanerFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/CleanerFragment$ScanResultDiffCallback;,
        Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;,
        Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;,
        Lcom/miui/gallery/ui/CleanerFragment$ScanResultLayoutManager;
    }
.end annotation


# instance fields
.field private mActionLayout:Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;

.field private mAdapter:Lcom/miui/gallery/cleaner/ScanResultAdapter;

.field private mExitConfirmDialog:Landroid/app/Dialog;

.field private mExpandHeight:I

.field private mIsScanStarted:Z

.field private mProgressBar:Lcom/miui/gallery/ui/CleanerRotateProgressBar;

.field private mRecyclerView:Landroid/support/v7/widget/RecyclerView;

.field private mRetractHeight:I

.field private mScanLayout:Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;

.field private mScanObserver:Lcom/miui/gallery/cleaner/ScannerManager$ScanObserver;

.field private mScannerManager:Lcom/miui/gallery/cleaner/ScannerManager;

.field private mScreenHeight:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/BaseFragment;-><init>()V

    new-instance v0, Lcom/miui/gallery/ui/CleanerFragment$4;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/CleanerFragment$4;-><init>(Lcom/miui/gallery/ui/CleanerFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mScanObserver:Lcom/miui/gallery/cleaner/ScannerManager$ScanObserver;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/CleanerFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/CleanerFragment;->onExitCancel()V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/CleanerFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/CleanerFragment;->onExit()V

    return-void
.end method

.method static synthetic access$1100(Lcom/miui/gallery/ui/CleanerFragment;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mExpandHeight:I

    return p0
.end method

.method static synthetic access$1200(Lcom/miui/gallery/ui/CleanerFragment;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mRetractHeight:I

    return p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/ui/CleanerFragment;)Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mActionLayout:Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/ui/CleanerFragment;)Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mScanLayout:Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/ui/CleanerFragment;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mScreenHeight:I

    return p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/ui/CleanerFragment;)Lcom/miui/gallery/ui/CleanerRotateProgressBar;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mProgressBar:Lcom/miui/gallery/ui/CleanerRotateProgressBar;

    return-object p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/ui/CleanerFragment;)Lcom/miui/gallery/cleaner/ScannerManager;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mScannerManager:Lcom/miui/gallery/cleaner/ScannerManager;

    return-object p0
.end method

.method static synthetic access$900(Lcom/miui/gallery/ui/CleanerFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/CleanerFragment;->updateScanResult()V

    return-void
.end method

.method private initLayoutHeight(I)V
    .locals 2

    iput p1, p0, Lcom/miui/gallery/ui/CleanerFragment;->mScreenHeight:I

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CleanerFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0a000d

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1

    iget v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mScreenHeight:I

    mul-int v0, v0, p1

    div-int/lit8 v0, v0, 0x64

    iput v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mExpandHeight:I

    iget p1, p0, Lcom/miui/gallery/ui/CleanerFragment;->mScreenHeight:I

    iget v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mExpandHeight:I

    sub-int/2addr p1, v0

    iput p1, p0, Lcom/miui/gallery/ui/CleanerFragment;->mRetractHeight:I

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment;->mScanLayout:Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;

    iget v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mExpandHeight:I

    invoke-static {p1, v0}, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->access$200(Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment;->mActionLayout:Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;

    iget v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mExpandHeight:I

    iget v1, p0, Lcom/miui/gallery/ui/CleanerFragment;->mRetractHeight:I

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->setHeight(II)V

    return-void
.end method

.method private onExit()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mScannerManager:Lcom/miui/gallery/cleaner/ScannerManager;

    invoke-virtual {v0}, Lcom/miui/gallery/cleaner/ScannerManager;->resetScan()V

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->finish()V

    return-void
.end method

.method private onExitCancel()V
    .locals 2

    const-string v0, "cleaner"

    const-string v1, "cleaner_scan_exit_cancel"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private setLayoutByScanResult()V
    .locals 4

    iget-boolean v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mIsScanStarted:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mScannerManager:Lcom/miui/gallery/cleaner/ScannerManager;

    invoke-virtual {v0}, Lcom/miui/gallery/cleaner/ScannerManager;->isScanning()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mActionLayout:Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->show(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mScanLayout:Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->expand(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mProgressBar:Lcom/miui/gallery/ui/CleanerRotateProgressBar;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->showRingCircle(Z)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mScannerManager:Lcom/miui/gallery/cleaner/ScannerManager;

    invoke-virtual {v0}, Lcom/miui/gallery/cleaner/ScannerManager;->isScanResultEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mScanLayout:Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;

    const/4 v1, 0x1

    const-wide/16 v2, 0x12c

    invoke-virtual {v0, v1, v2, v3}, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->expand(ZJ)V

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mActionLayout:Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;

    invoke-virtual {v0, v1, v2, v3}, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->show(ZJ)V

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mProgressBar:Lcom/miui/gallery/ui/CleanerRotateProgressBar;

    invoke-virtual {v0, v2, v3}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->showEmptyAnim(J)V

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mActionLayout:Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;

    invoke-static {v0}, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->access$300(Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mScanLayout:Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->retract(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mProgressBar:Lcom/miui/gallery/ui/CleanerRotateProgressBar;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->hideRingCircle(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mActionLayout:Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->hide(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mProgressBar:Lcom/miui/gallery/ui/CleanerRotateProgressBar;

    iget-object v1, p0, Lcom/miui/gallery/ui/CleanerFragment;->mScannerManager:Lcom/miui/gallery/cleaner/ScannerManager;

    invoke-virtual {v1}, Lcom/miui/gallery/cleaner/ScannerManager;->getScanSize()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->setNumber(J)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/CleanerFragment;->updateScanResult()V

    :goto_0
    return-void
.end method

.method private updateScanResult()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mAdapter:Lcom/miui/gallery/cleaner/ScanResultAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/cleaner/ScanResultAdapter;->getDataList()Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/CleanerFragment;->mScannerManager:Lcom/miui/gallery/cleaner/ScannerManager;

    invoke-virtual {v1}, Lcom/miui/gallery/cleaner/ScannerManager;->getScanResults()Ljava/util/List;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/ui/CleanerFragment$ScanResultDiffCallback;

    invoke-direct {v2, p0, v0, v1}, Lcom/miui/gallery/ui/CleanerFragment$ScanResultDiffCallback;-><init>(Lcom/miui/gallery/ui/CleanerFragment;Ljava/util/List;Ljava/util/List;)V

    invoke-static {v2}, Landroid/support/v7/util/DiffUtil;->calculateDiff(Landroid/support/v7/util/DiffUtil$Callback;)Landroid/support/v7/util/DiffUtil$DiffResult;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/ui/CleanerFragment;->mAdapter:Lcom/miui/gallery/cleaner/ScanResultAdapter;

    invoke-virtual {v0, v2}, Landroid/support/v7/util/DiffUtil$DiffResult;->dispatchUpdatesTo(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mAdapter:Lcom/miui/gallery/cleaner/ScanResultAdapter;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cleaner/ScanResultAdapter;->updateDataList(Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public getPageName()Ljava/lang/String;
    .locals 1

    const-string v0, "cleaner"

    return-object v0
.end method

.method protected getThemeRes()I
    .locals 1

    const v0, 0x7f1100a0

    return v0
.end method

.method public onActivityAttachedToWindow()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0}, Lcom/miui/gallery/util/ScreenUtils;->getExactScreenHeight(Landroid/app/Activity;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/CleanerFragment;->initLayoutHeight(I)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/CleanerFragment;->setLayoutByScanResult()V

    return-void
.end method

.method public onBackPressed()Z
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mProgressBar:Lcom/miui/gallery/ui/CleanerRotateProgressBar;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->isRotating()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mScannerManager:Lcom/miui/gallery/cleaner/ScannerManager;

    invoke-virtual {v0}, Lcom/miui/gallery/cleaner/ScannerManager;->isScanning()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/CleanerFragment;->onExit()V

    return v1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mExitConfirmDialog:Landroid/app/Dialog;

    if-nez v0, :cond_1

    new-instance v0, Lmiui/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/miui/gallery/ui/CleanerFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {v0, v2}, Lmiui/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f10027c

    new-instance v3, Lcom/miui/gallery/ui/CleanerFragment$3;

    invoke-direct {v3, p0}, Lcom/miui/gallery/ui/CleanerFragment$3;-><init>(Lcom/miui/gallery/ui/CleanerFragment;)V

    invoke-virtual {v0, v2, v3}, Lmiui/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;

    move-result-object v0

    const/high16 v2, 0x1040000

    new-instance v3, Lcom/miui/gallery/ui/CleanerFragment$2;

    invoke-direct {v3, p0}, Lcom/miui/gallery/ui/CleanerFragment$2;-><init>(Lcom/miui/gallery/ui/CleanerFragment;)V

    invoke-virtual {v0, v2, v3}, Lmiui/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;

    move-result-object v0

    new-instance v2, Lcom/miui/gallery/ui/CleanerFragment$1;

    invoke-direct {v2, p0}, Lcom/miui/gallery/ui/CleanerFragment$1;-><init>(Lcom/miui/gallery/ui/CleanerFragment;)V

    invoke-virtual {v0, v2}, Lmiui/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Lmiui/app/AlertDialog$Builder;

    move-result-object v0

    const v2, 0x7f10027d

    invoke-virtual {v0, v2}, Lmiui/app/AlertDialog$Builder;->setTitle(I)Lmiui/app/AlertDialog$Builder;

    move-result-object v0

    const v2, 0x7f10027b

    invoke-virtual {v0, v2}, Lmiui/app/AlertDialog$Builder;->setMessage(I)Lmiui/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lmiui/app/AlertDialog$Builder;->create()Lmiui/app/AlertDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mExitConfirmDialog:Landroid/app/Dialog;

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mExitConfirmDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-object v4, p0, Lcom/miui/gallery/ui/CleanerFragment;->mScannerManager:Lcom/miui/gallery/cleaner/ScannerManager;

    invoke-virtual {v4}, Lcom/miui/gallery/cleaner/ScannerManager;->getStartTime()J

    move-result-wide v4

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x3e8

    div-long/2addr v2, v4

    long-to-int v2, v2

    const-string v3, "durationBeforeExit"

    int-to-float v2, v2

    sget-object v4, Lcom/miui/gallery/cleaner/ScannerManager;->TIME_COST_STAGE:[I

    invoke-static {v2, v4}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->formatValueStage(F[I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v3, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "cleaner"

    const-string v3, "cleaner_scan_exit"

    invoke-static {v2, v3, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return v1
.end method

.method public onDestroy()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseFragment;->onDestroy()V

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mExitConfirmDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mExitConfirmDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mExitConfirmDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    :cond_0
    return-void
.end method

.method public onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3

    const/4 p3, 0x0

    const v0, 0x7f0b0045

    invoke-virtual {p1, v0, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f090258

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/support/v7/widget/RecyclerView;

    iput-object p2, p0, Lcom/miui/gallery/ui/CleanerFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object p2, p0, Lcom/miui/gallery/ui/CleanerFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v0, Lcom/miui/gallery/ui/CleanerFragment$ScanResultLayoutManager;

    iget-object v1, p0, Lcom/miui/gallery/ui/CleanerFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/ui/CleanerFragment$ScanResultLayoutManager;-><init>(Lcom/miui/gallery/ui/CleanerFragment;Landroid/content/Context;)V

    invoke-virtual {p2, v0}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CleanerFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f070083

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v1, Lcom/miui/gallery/util/DividerItemDecoration;

    const/4 v2, 0x1

    invoke-direct {v1, p2, v2, v2}, Lcom/miui/gallery/util/DividerItemDecoration;-><init>(Landroid/graphics/drawable/Drawable;II)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    new-instance p2, Lcom/miui/gallery/cleaner/ScanResultAdapter;

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {p2, v0}, Lcom/miui/gallery/cleaner/ScanResultAdapter;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/CleanerFragment;->mAdapter:Lcom/miui/gallery/cleaner/ScanResultAdapter;

    iget-object p2, p0, Lcom/miui/gallery/ui/CleanerFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mAdapter:Lcom/miui/gallery/cleaner/ScanResultAdapter;

    invoke-virtual {p2, v0}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    new-instance p2, Lcom/miui/gallery/widget/recyclerview/CleanerItemAnimator;

    invoke-direct {p2}, Lcom/miui/gallery/widget/recyclerview/CleanerItemAnimator;-><init>()V

    invoke-virtual {p2, p3}, Landroid/support/v7/widget/SimpleItemAnimator;->setSupportsChangeAnimations(Z)V

    iget-object p3, p0, Lcom/miui/gallery/ui/CleanerFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {p3, p2}, Landroid/support/v7/widget/RecyclerView;->setItemAnimator(Landroid/support/v7/widget/RecyclerView$ItemAnimator;)V

    new-instance p2, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;

    const p3, 0x7f090012

    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    invoke-direct {p2, p0, p3}, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;-><init>(Lcom/miui/gallery/ui/CleanerFragment;Landroid/view/View;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/CleanerFragment;->mActionLayout:Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;

    new-instance p2, Lcom/miui/gallery/ui/CleanerRotateProgressBar;

    iget-object p3, p0, Lcom/miui/gallery/ui/CleanerFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {p2, p3}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/CleanerFragment;->mProgressBar:Lcom/miui/gallery/ui/CleanerRotateProgressBar;

    new-instance p2, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;

    iget-object p3, p0, Lcom/miui/gallery/ui/CleanerFragment;->mProgressBar:Lcom/miui/gallery/ui/CleanerRotateProgressBar;

    invoke-direct {p2, p0, p3}, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;-><init>(Lcom/miui/gallery/ui/CleanerFragment;Landroid/view/View;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/CleanerFragment;->mScanLayout:Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;

    iget-object p2, p0, Lcom/miui/gallery/ui/CleanerFragment;->mAdapter:Lcom/miui/gallery/cleaner/ScanResultAdapter;

    iget-object p3, p0, Lcom/miui/gallery/ui/CleanerFragment;->mScanLayout:Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;

    iget-object p3, p3, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->mView:Landroid/view/View;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/cleaner/ScanResultAdapter;->setHeader(Landroid/view/View;)V

    invoke-static {}, Lcom/miui/gallery/cleaner/ScannerManager;->getInstance()Lcom/miui/gallery/cleaner/ScannerManager;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/ui/CleanerFragment;->mScannerManager:Lcom/miui/gallery/cleaner/ScannerManager;

    return-object p1
.end method

.method public onStart()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseFragment;->onStart()V

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mScannerManager:Lcom/miui/gallery/cleaner/ScannerManager;

    iget-object v1, p0, Lcom/miui/gallery/ui/CleanerFragment;->mScanObserver:Lcom/miui/gallery/cleaner/ScannerManager$ScanObserver;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cleaner/ScannerManager;->registerObserver(Lcom/miui/gallery/cleaner/ScannerManager$ScanObserver;)V

    iget v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mScreenHeight:I

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0}, Lcom/miui/gallery/util/ScreenUtils;->getExactScreenHeight(Landroid/app/Activity;)I

    move-result v0

    iget v1, p0, Lcom/miui/gallery/ui/CleanerFragment;->mScreenHeight:I

    if-eq v0, v1, :cond_0

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/CleanerFragment;->initLayoutHeight(I)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mScannerManager:Lcom/miui/gallery/cleaner/ScannerManager;

    invoke-virtual {v0}, Lcom/miui/gallery/cleaner/ScannerManager;->isReset()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mScannerManager:Lcom/miui/gallery/cleaner/ScannerManager;

    invoke-virtual {v0}, Lcom/miui/gallery/cleaner/ScannerManager;->startScan()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mIsScanStarted:Z

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mIsScanStarted:Z

    iget v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mScreenHeight:I

    if-eqz v0, :cond_2

    invoke-direct {p0}, Lcom/miui/gallery/ui/CleanerFragment;->setLayoutByScanResult()V

    :cond_2
    :goto_0
    return-void
.end method

.method public onStop()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseFragment;->onStop()V

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment;->mScannerManager:Lcom/miui/gallery/cleaner/ScannerManager;

    iget-object v1, p0, Lcom/miui/gallery/ui/CleanerFragment;->mScanObserver:Lcom/miui/gallery/cleaner/ScannerManager$ScanObserver;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cleaner/ScannerManager;->unregisterObserver(Lcom/miui/gallery/cleaner/ScannerManager$ScanObserver;)V

    return-void
.end method
