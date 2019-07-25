.class public Lcom/miui/gallery/ui/CloudSpaceStatusFragment;
.super Lcom/miui/gallery/ui/BaseFragment;
.source "CloudSpaceStatusFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter;,
        Lcom/miui/gallery/ui/CloudSpaceStatusFragment$DataItem;,
        Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;,
        Lcom/miui/gallery/ui/CloudSpaceStatusFragment$SpaceStatusLoader;,
        Lcom/miui/gallery/ui/CloudSpaceStatusFragment$SpaceStatusLoaderCallBack;
    }
.end annotation


# instance fields
.field private mApdater:Landroid/widget/BaseAdapter;

.field private mDataList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/ui/CloudSpaceStatusFragment$DataItem;",
            ">;"
        }
    .end annotation
.end field

.field private mListView:Landroid/widget/ListView;

.field private mProgress:Lcom/miui/gallery/widget/ColorRingProgress;

.field private mStorageDetail:Landroid/widget/TextView;

.field private mStorageFrame:Landroid/view/View;

.field private mUsedPercent:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/BaseFragment;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment;->mDataList:Ljava/util/List;

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/CloudSpaceStatusFragment;Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/CloudSpaceStatusFragment;->refresh(Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;)V

    return-void
.end method

.method private refresh(Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;)V
    .locals 10

    const-string v0, "CloudSpaceStatusFragment"

    const-string v1, "refresh %s"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    if-eqz p1, :cond_2

    iget-wide v0, p1, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;->mTotalCloudSpace:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz v4, :cond_0

    iget-wide v2, p1, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;->mLeftCloudSpace:J

    iget-wide v4, p1, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;->mTotalCloudSpace:J

    cmp-long v6, v2, v4

    if-gtz v6, :cond_0

    iget-wide v2, p1, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;->mLeftCloudSpace:J

    long-to-float v2, v2

    const/high16 v3, 0x3f800000    # 1.0f

    mul-float v2, v2, v3

    iget-wide v4, p1, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;->mTotalCloudSpace:J

    long-to-float v4, v4

    div-float/2addr v2, v4

    sub-float v2, v3, v2

    invoke-static {v3, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment;->mProgress:Lcom/miui/gallery/widget/ColorRingProgress;

    invoke-virtual {v3, v2}, Lcom/miui/gallery/widget/ColorRingProgress;->setProgress(F)V

    iget-object v3, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment;->mUsedPercent:Landroid/widget/TextView;

    const-string v4, "%d"

    new-array v5, v1, [Ljava/lang/Object;

    const/high16 v6, 0x42c80000    # 100.0f

    mul-float v2, v2, v6

    float-to-int v2, v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v5, v0

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    iget-object v2, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-wide v3, p1, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;->mLeftCloudSpace:J

    invoke-static {v2, v3, v4}, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil;->getQuantityStringWithUnit(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-wide v4, p1, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;->mTotalCloudSpace:J

    invoke-static {v3, v4, v5}, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil;->getQuantityStringWithUnit(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment;->mStorageDetail:Landroid/widget/TextView;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " | "

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CloudSpaceStatusFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment;->mDataList:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->clear()V

    new-instance v3, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$DataItem;

    const/4 v4, 0x0

    invoke-direct {v3, v4}, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$DataItem;-><init>(Lcom/miui/gallery/ui/CloudSpaceStatusFragment$1;)V

    const v5, 0x7f1002a4

    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v3, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$DataItem;->mTitle:Ljava/lang/String;

    iget-object v5, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-wide v6, p1, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;->mSyncedPhotoSize:J

    invoke-static {v5, v6, v7}, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil;->getQuantityStringWithUnit(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v3, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$DataItem;->mAppendTitle:Ljava/lang/String;

    const v5, 0x7f0e0015

    iget v6, p1, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;->mSyncedPhotoCount:I

    new-array v7, v1, [Ljava/lang/Object;

    iget v8, p1, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;->mSyncedPhotoCount:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v0

    invoke-virtual {v2, v5, v6, v7}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v3, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$DataItem;->mValue:Ljava/lang/String;

    new-instance v5, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$DataItem;

    invoke-direct {v5, v4}, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$DataItem;-><init>(Lcom/miui/gallery/ui/CloudSpaceStatusFragment$1;)V

    const v6, 0x7f1002a7

    invoke-virtual {v2, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$DataItem;->mTitle:Ljava/lang/String;

    iget-object v6, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-wide v7, p1, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;->mSyncedVideoSize:J

    invoke-static {v6, v7, v8}, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil;->getQuantityStringWithUnit(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$DataItem;->mAppendTitle:Ljava/lang/String;

    const v6, 0x7f0e0016

    iget v7, p1, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;->mSyncedVideoCount:I

    new-array v8, v1, [Ljava/lang/Object;

    iget v9, p1, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;->mSyncedVideoCount:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v0

    invoke-virtual {v2, v6, v7, v8}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v5, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$DataItem;->mValue:Ljava/lang/String;

    new-instance v0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$DataItem;

    invoke-direct {v0, v4}, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$DataItem;-><init>(Lcom/miui/gallery/ui/CloudSpaceStatusFragment$1;)V

    const v4, 0x7f1002a0

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$DataItem;->mTitle:Ljava/lang/String;

    iget-boolean p1, p1, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$CloudStatusData;->mIsSpaceLow:Z

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment;->mProgress:Lcom/miui/gallery/widget/ColorRingProgress;

    const v4, 0x7f05014f

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {p1, v2}, Lcom/miui/gallery/widget/ColorRingProgress;->setBackgroundColor(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment;->mStorageFrame:Landroid/view/View;

    const v2, 0x7f050159

    invoke-virtual {p1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment;->mProgress:Lcom/miui/gallery/widget/ColorRingProgress;

    const v4, 0x7f05014e

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {p1, v2}, Lcom/miui/gallery/widget/ColorRingProgress;->setBackgroundColor(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment;->mStorageFrame:Landroid/view/View;

    const v2, 0x7f050158

    invoke-virtual {p1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    :goto_0
    new-instance p1, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$1;-><init>(Lcom/miui/gallery/ui/CloudSpaceStatusFragment;)V

    iput-object p1, v0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$DataItem;->mClickListener:Landroid/view/View$OnClickListener;

    iput-boolean v1, v0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$DataItem;->mIsShowArrow:Z

    iget-object p1, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment;->mDataList:Ljava/util/List;

    invoke-interface {p1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object p1, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment;->mDataList:Ljava/util/List;

    invoke-interface {p1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object p1, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment;->mDataList:Ljava/util/List;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object p1, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment;->mApdater:Landroid/widget/BaseAdapter;

    invoke-virtual {p1}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    :cond_2
    return-void
.end method


# virtual methods
.method public getPageName()Ljava/lang/String;
    .locals 1

    const-string v0, "cloud_space_status"

    return-object v0
.end method

.method protected getThemeRes()I
    .locals 1

    const v0, 0x7f1100a0

    return v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/BaseFragment;->onActivityCreated(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CloudSpaceStatusFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object p1

    new-instance v0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$SpaceStatusLoaderCallBack;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$SpaceStatusLoaderCallBack;-><init>(Lcom/miui/gallery/ui/CloudSpaceStatusFragment;Lcom/miui/gallery/ui/CloudSpaceStatusFragment$1;)V

    const/4 v2, 0x1

    invoke-virtual {p1, v2, v1, v0}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    const-string p1, "Sync"

    const-string v0, "sync_cloud_space_status"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/BaseFragment;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/CloudSpaceStatusFragment;->setHasOptionsMenu(Z)V

    return-void
.end method

.method public onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0b004d

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f0902bc

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment;->mStorageFrame:Landroid/view/View;

    const p2, 0x7f09031e

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/widget/ColorRingProgress;

    iput-object p2, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment;->mProgress:Lcom/miui/gallery/widget/ColorRingProgress;

    const p2, 0x7f09031d

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment;->mUsedPercent:Landroid/widget/TextView;

    const p2, 0x7f0902bb

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment;->mStorageDetail:Landroid/widget/TextView;

    const p2, 0x7f0901ac

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ListView;

    iput-object p2, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment;->mListView:Landroid/widget/ListView;

    new-instance p2, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter;

    iget-object p3, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment;->mDataList:Ljava/util/List;

    invoke-direct {p2, p0, p3}, Lcom/miui/gallery/ui/CloudSpaceStatusFragment$StatusAdapter;-><init>(Lcom/miui/gallery/ui/CloudSpaceStatusFragment;Ljava/util/List;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment;->mApdater:Landroid/widget/BaseAdapter;

    iget-object p2, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment;->mListView:Landroid/widget/ListView;

    iget-object p3, p0, Lcom/miui/gallery/ui/CloudSpaceStatusFragment;->mApdater:Landroid/widget/BaseAdapter;

    invoke-virtual {p2, p3}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    return-object p1
.end method
