.class public Lcom/miui/gallery/ui/PhotoDetailFragment;
.super Lcom/miui/gallery/ui/BaseFragment;
.source "PhotoDetailFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/PhotoDetailFragment$FlashState;,
        Lcom/miui/gallery/ui/PhotoDetailFragment$DetailLoader;,
        Lcom/miui/gallery/ui/PhotoDetailFragment$DetailLoaderCallBack;
    }
.end annotation


# instance fields
.field private mAddressFuture:Lcom/miui/gallery/threadpool/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/threadpool/Future<",
            "Landroid/location/Address;",
            ">;"
        }
    .end annotation
.end field

.field private mClickListener:Landroid/view/View$OnClickListener;

.field private mContentContainer:Landroid/view/View;

.field private mDetailInfo:Lcom/miui/gallery/model/PhotoDetailInfo;

.field private mFileInfoItem:Landroid/view/View;

.field private mFileInfoSub:Landroid/widget/TextView;

.field private mFileInfoTitle:Landroid/widget/TextView;

.field private mItem:Lcom/miui/gallery/model/BaseDataItem;

.field private mLoaderCallBack:Lcom/miui/gallery/ui/PhotoDetailFragment$DetailLoaderCallBack;

.field private mLocation:Landroid/widget/TextView;

.field private mLocationItem:Landroid/view/View;

.field private mNeedConfirmPassword:Z

.field private mParamsItem:Landroid/view/View;

.field private mPath:Landroid/widget/TextView;

.field private mPathItem:Landroid/view/View;

.field private mProgress:Landroid/widget/ProgressBar;

.field private mScreenshotPackageInfo:Landroid/widget/TextView;

.field private mScreenshotPackageItem:Landroid/view/View;

.field private mTakenParamsSub:Landroid/widget/TextView;

.field private mTakenParamsThird:Landroid/widget/TextView;

.field private mTakenParamsTitle:Landroid/widget/TextView;

.field private mTimeItem:Landroid/view/View;

.field private mTimeSub:Landroid/widget/TextView;

.field private mTimeTitle:Landroid/widget/TextView;

.field private mTipNoDownload:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/BaseFragment;-><init>()V

    new-instance v0, Lcom/miui/gallery/ui/PhotoDetailFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoDetailFragment$1;-><init>(Lcom/miui/gallery/ui/PhotoDetailFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mClickListener:Landroid/view/View$OnClickListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/PhotoDetailFragment;)Lcom/miui/gallery/model/PhotoDetailInfo;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mDetailInfo:Lcom/miui/gallery/model/PhotoDetailInfo;

    return-object p0
.end method

.method static synthetic access$002(Lcom/miui/gallery/ui/PhotoDetailFragment;Lcom/miui/gallery/model/PhotoDetailInfo;)Lcom/miui/gallery/model/PhotoDetailInfo;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mDetailInfo:Lcom/miui/gallery/model/PhotoDetailInfo;

    return-object p1
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/PhotoDetailFragment;)Landroid/widget/TextView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mLocation:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/ui/PhotoDetailFragment;)Lcom/miui/gallery/model/BaseDataItem;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mItem:Lcom/miui/gallery/model/BaseDataItem;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/ui/PhotoDetailFragment;Lcom/miui/gallery/model/PhotoDetailInfo;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoDetailFragment;->bindDetail(Lcom/miui/gallery/model/PhotoDetailInfo;)V

    return-void
.end method

.method private bindDetail(Lcom/miui/gallery/model/PhotoDetailInfo;)V
    .locals 1

    :try_start_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoDetailFragment;->bindTime(Lcom/miui/gallery/model/PhotoDetailInfo;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoDetailFragment;->bindFileInfo(Lcom/miui/gallery/model/PhotoDetailInfo;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoDetailFragment;->bindNotDownloadTip(Lcom/miui/gallery/model/PhotoDetailInfo;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoDetailFragment;->bindTakenParams(Lcom/miui/gallery/model/PhotoDetailInfo;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoDetailFragment;->bindPath(Lcom/miui/gallery/model/PhotoDetailInfo;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoDetailFragment;->bindLocation(Lcom/miui/gallery/model/PhotoDetailInfo;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoDetailFragment;->bindScreenshotPackageInfo(Lcom/miui/gallery/model/PhotoDetailInfo;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mContentContainer:Landroid/view/View;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mProgress:Landroid/widget/ProgressBar;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/ProgressBar;->setVisibility(I)V

    return-void
.end method

.method private bindFileInfo(Lcom/miui/gallery/model/PhotoDetailInfo;)V
    .locals 8

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Lcom/miui/gallery/model/PhotoDetailInfo;->getDetail(I)Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mFileInfoTitle:Landroid/widget/TextView;

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v4, 0x3

    invoke-virtual {p1, v4}, Lcom/miui/gallery/model/PhotoDetailInfo;->getDetail(I)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_1

    iget-object v5, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    check-cast v4, Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    invoke-static {v5, v6, v7}, Lcom/miui/gallery/util/FormatUtil;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "    "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    const/4 v4, 0x4

    invoke-virtual {p1, v4}, Lcom/miui/gallery/model/PhotoDetailInfo;->getDetail(I)Ljava/lang/Object;

    move-result-object v4

    const/4 v5, 0x5

    invoke-virtual {p1, v5}, Lcom/miui/gallery/model/PhotoDetailInfo;->getDetail(I)Ljava/lang/Object;

    move-result-object v5

    const/16 v6, 0xa

    invoke-virtual {p1, v6}, Lcom/miui/gallery/model/PhotoDetailInfo;->getDetail(I)Ljava/lang/Object;

    move-result-object v6

    if-eqz v4, :cond_2

    if-eqz v5, :cond_2

    invoke-direct {p0, v4, v5, v6}, Lcom/miui/gallery/ui/PhotoDetailFragment;->genPixels(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "    "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_2
    const/4 v4, 0x7

    invoke-virtual {p1, v4}, Lcom/miui/gallery/model/PhotoDetailInfo;->getDetail(I)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_3

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-static {v4, p1}, Lcom/miui/gallery/util/FormatUtil;->formatDuration(Landroid/content/Context;I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_3
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result p1

    if-lez p1, :cond_4

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mFileInfoSub:Landroid/widget/TextView;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mFileInfoSub:Landroid/widget/TextView;

    invoke-direct {p0, p1, v2}, Lcom/miui/gallery/ui/PhotoDetailFragment;->setItemVisible(Landroid/view/View;Z)V

    const/4 v0, 0x1

    goto :goto_1

    :cond_4
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mFileInfoSub:Landroid/widget/TextView;

    invoke-direct {p0, p1, v1}, Lcom/miui/gallery/ui/PhotoDetailFragment;->setItemVisible(Landroid/view/View;Z)V

    :goto_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mFileInfoItem:Landroid/view/View;

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/PhotoDetailFragment;->setItemVisible(Landroid/view/View;Z)V

    return-void
.end method

.method private bindLocation(Lcom/miui/gallery/model/PhotoDetailInfo;)V
    .locals 4

    const/4 v0, 0x6

    invoke-virtual {p1, v0}, Lcom/miui/gallery/model/PhotoDetailInfo;->getDetail(I)Ljava/lang/Object;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    check-cast p1, [D

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoDetailFragment;->genLocation([D)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mLocation:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mLocationItem:Landroid/view/View;

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/miui/gallery/ui/PhotoDetailFragment;->setItemVisible(Landroid/view/View;Z)V

    aget-wide v0, p1, v0

    aget-wide v2, p1, v2

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/miui/gallery/ui/PhotoDetailFragment;->requestAddress(DD)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mLocationItem:Landroid/view/View;

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/PhotoDetailFragment;->setItemVisible(Landroid/view/View;Z)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mLocationItem:Landroid/view/View;

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/PhotoDetailFragment;->setItemVisible(Landroid/view/View;Z)V

    :goto_0
    return-void
.end method

.method private bindNotDownloadTip(Lcom/miui/gallery/model/PhotoDetailInfo;)V
    .locals 1

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Lcom/miui/gallery/model/PhotoDetailInfo;->getDetail(I)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mTipNoDownload:Landroid/widget/TextView;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mTipNoDownload:Landroid/widget/TextView;

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/PhotoDetailFragment;->setItemVisible(Landroid/view/View;Z)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mTipNoDownload:Landroid/widget/TextView;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/PhotoDetailFragment;->setItemVisible(Landroid/view/View;Z)V

    :goto_0
    return-void
.end method

.method private bindPath(Lcom/miui/gallery/model/PhotoDetailInfo;)V
    .locals 2

    const/16 v0, 0xc9

    invoke-virtual {p1, v0}, Lcom/miui/gallery/model/PhotoDetailInfo;->getDetail(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mPath:Landroid/widget/TextView;

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mPathItem:Landroid/view/View;

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/ui/PhotoDetailFragment;->setItemVisible(Landroid/view/View;Z)V

    const/16 v0, 0x6d

    invoke-virtual {p1, v0}, Lcom/miui/gallery/model/PhotoDetailInfo;->getDetail(I)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mClickListener:Landroid/view/View$OnClickListener;

    const v0, 0x7f0500b6

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mPathItem:Landroid/view/View;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/PhotoDetailFragment;->setItemVisible(Landroid/view/View;Z)V

    :cond_1
    const/4 p1, 0x0

    const v0, 0x7f0500b9

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mPath:Landroid/widget/TextView;

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mPath:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoDetailFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    return-void
.end method

.method private bindScreenshotPackageInfo(Lcom/miui/gallery/model/PhotoDetailInfo;)V
    .locals 7

    const/16 v0, 0x9

    invoke-virtual {p1, v0}, Lcom/miui/gallery/model/PhotoDetailInfo;->getDetail(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mItem:Lcom/miui/gallery/model/BaseDataItem;

    if-eqz v1, :cond_1

    const/4 v1, 0x2

    invoke-virtual {p1, v1}, Lcom/miui/gallery/model/PhotoDetailInfo;->getDetail(I)Ljava/lang/Object;

    move-result-object p1

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v1}, Lcom/miui/gallery/model/BaseDataItem;->getLocalGroupId()J

    move-result-wide v3

    const-wide/16 v5, 0x2

    cmp-long v1, v3, v5

    if-nez v1, :cond_0

    if-eqz p1, :cond_0

    check-cast p1, Ljava/lang/String;

    const-string v1, "Screenshot"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mScreenshotPackageInfo:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mScreenshotPackageItem:Landroid/view/View;

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/PhotoDetailFragment;->setItemVisible(Landroid/view/View;Z)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mScreenshotPackageItem:Landroid/view/View;

    invoke-direct {p0, p1, v2}, Lcom/miui/gallery/ui/PhotoDetailFragment;->setItemVisible(Landroid/view/View;Z)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mScreenshotPackageItem:Landroid/view/View;

    invoke-direct {p0, p1, v2}, Lcom/miui/gallery/ui/PhotoDetailFragment;->setItemVisible(Landroid/view/View;Z)V

    :goto_0
    return-void
.end method

.method private bindTakenParams(Lcom/miui/gallery/model/PhotoDetailInfo;)V
    .locals 5

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v1, 0x65

    invoke-virtual {p1, v1}, Lcom/miui/gallery/model/PhotoDetailInfo;->getDetail(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    :cond_0
    const/16 v1, 0x64

    invoke-virtual {p1, v1}, Lcom/miui/gallery/model/PhotoDetailInfo;->getDetail(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_1

    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    const/4 v2, 0x0

    if-lez v1, :cond_9

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mTakenParamsTitle:Landroid/widget/TextView;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    const/16 v1, 0x69

    invoke-virtual {p1, v1}, Lcom/miui/gallery/model/PhotoDetailInfo;->getDetail(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_2

    check-cast v1, Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/PhotoDetailFragment;->genAperture(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "    "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_2
    const/16 v1, 0x6b

    invoke-virtual {p1, v1}, Lcom/miui/gallery/model/PhotoDetailInfo;->getDetail(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_3

    check-cast v1, Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/PhotoDetailFragment;->genExposureTime(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "    "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_3
    const/16 v1, 0x6c

    invoke-virtual {p1, v1}, Lcom/miui/gallery/model/PhotoDetailInfo;->getDetail(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_4

    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/PhotoDetailFragment;->genISO(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_4
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    const/4 v3, 0x1

    if-lez v1, :cond_5

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mTakenParamsSub:Landroid/widget/TextView;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mTakenParamsSub:Landroid/widget/TextView;

    invoke-direct {p0, v1, v3}, Lcom/miui/gallery/ui/PhotoDetailFragment;->setItemVisible(Landroid/view/View;Z)V

    goto :goto_0

    :cond_5
    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mTakenParamsSub:Landroid/widget/TextView;

    invoke-direct {p0, v1, v2}, Lcom/miui/gallery/ui/PhotoDetailFragment;->setItemVisible(Landroid/view/View;Z)V

    :goto_0
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->setLength(I)V

    const/16 v1, 0x67

    invoke-virtual {p1, v1}, Lcom/miui/gallery/model/PhotoDetailInfo;->getDetail(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_6

    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/PhotoDetailFragment;->genFocalLength(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "    "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_6
    const/16 v1, 0x66

    invoke-virtual {p1, v1}, Lcom/miui/gallery/model/PhotoDetailInfo;->getDetail(I)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_7

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoDetailFragment;->genFlashFired(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_7
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result p1

    if-lez p1, :cond_8

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mTakenParamsThird:Landroid/widget/TextView;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mTakenParamsThird:Landroid/widget/TextView;

    invoke-direct {p0, p1, v3}, Lcom/miui/gallery/ui/PhotoDetailFragment;->setItemVisible(Landroid/view/View;Z)V

    goto :goto_1

    :cond_8
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mTakenParamsThird:Landroid/widget/TextView;

    invoke-direct {p0, p1, v2}, Lcom/miui/gallery/ui/PhotoDetailFragment;->setItemVisible(Landroid/view/View;Z)V

    :goto_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mParamsItem:Landroid/view/View;

    invoke-direct {p0, p1, v3}, Lcom/miui/gallery/ui/PhotoDetailFragment;->setItemVisible(Landroid/view/View;Z)V

    return-void

    :cond_9
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mParamsItem:Landroid/view/View;

    invoke-direct {p0, p1, v2}, Lcom/miui/gallery/ui/PhotoDetailFragment;->setItemVisible(Landroid/view/View;Z)V

    return-void
.end method

.method private bindTime(Lcom/miui/gallery/model/PhotoDetailInfo;)V
    .locals 5

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/model/PhotoDetailInfo;->getDetail(I)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_0

    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    const/16 p1, 0x380

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mTimeTitle:Landroid/widget/TextView;

    invoke-static {v1, v2, p1}, Lmiui/date/DateUtils;->formatDateTime(JI)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v3, 0x400

    invoke-static {v1, v2, v3}, Lmiui/date/DateUtils;->formatDateTime(JI)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v3, 0x2c

    const-string v4, "    "

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1, v2, v3}, Lmiui/date/DateUtils;->formatDateTime(JI)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mTimeSub:Landroid/widget/TextView;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mTimeItem:Landroid/view/View;

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/PhotoDetailFragment;->setItemVisible(Landroid/view/View;Z)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mTimeItem:Landroid/view/View;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/PhotoDetailFragment;->setItemVisible(Landroid/view/View;Z)V

    :goto_0
    return-void
.end method

.method private cancelAddressRequest()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mAddressFuture:Lcom/miui/gallery/threadpool/Future;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mAddressFuture:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/Future;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mAddressFuture:Lcom/miui/gallery/threadpool/Future;

    :cond_0
    return-void
.end method

.method private finishActivity(I)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoDetailFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/app/Activity;->setResult(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoDetailFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method private genAperture(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    const-string v0, "0+?$"

    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "."

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "0"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "f/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private genExposureTime(Ljava/lang/String;)Ljava/lang/String;
    .locals 10

    :try_start_0
    invoke-static {p1}, Ljava/lang/Double;->valueOf(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    cmpg-double v4, v0, v2

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-gez v4, :cond_0

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "1/%d"

    new-array v6, v6, [Ljava/lang/Object;

    div-double/2addr v2, v0

    invoke-static {v2, v3}, Ljava/lang/Math;->round(D)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, v6, v5

    invoke-static {v4, v7, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    :cond_0
    double-to-int v4, v0

    int-to-double v7, v4

    invoke-static {v7, v8}, Ljava/lang/Double;->isNaN(D)Z

    const/4 v9, 0x0

    sub-double/2addr v0, v7

    :try_start_1
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "\'\'"

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    const-wide v7, 0x3f1a36e2eb1c432dL    # 1.0E-4

    cmpl-double p1, v0, v7

    if-lez p1, :cond_1

    :try_start_2
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, " 1/%d"

    new-array v6, v6, [Ljava/lang/Object;

    div-double/2addr v2, v0

    invoke-static {v2, v3}, Ljava/lang/Math;->round(D)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, v6, v5

    invoke-static {v7, v8, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    move-object p1, v4

    goto :goto_1

    :cond_1
    move-object v0, v4

    :goto_0
    move-object p1, v0

    goto :goto_2

    :catch_1
    move-exception v0

    :goto_1
    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->printStackTrace()V

    :goto_2
    return-object p1
.end method

.method private genFlashFired(I)Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/ui/PhotoDetailFragment$FlashState;

    invoke-direct {v1, p1}, Lcom/miui/gallery/ui/PhotoDetailFragment$FlashState;-><init>(I)V

    invoke-virtual {v1}, Lcom/miui/gallery/ui/PhotoDetailFragment$FlashState;->isFlashFired()Z

    move-result p1

    if-eqz p1, :cond_0

    const p1, 0x7f1003fd

    goto :goto_0

    :cond_0
    const p1, 0x7f1003fc

    :goto_0
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private genFocalLength(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, "mm"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private genISO(Ljava/lang/Object;)Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ISO"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private genLocation([D)Ljava/lang/String;
    .locals 6

    const/4 v0, 0x0

    aget-wide v1, p1, v0

    const/4 v3, 0x1

    aget-wide v4, p1, v3

    invoke-static {v1, v2, v4, v5}, Lcom/miui/gallery/data/LocationUtil;->isValidateCoordinate(DD)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    aget-wide v4, p1, v0

    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    const-string v0, ", "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-wide v2, p1, v3

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method private genPixels(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;
    .locals 1

    if-eqz p3, :cond_1

    :try_start_0
    check-cast p3, Ljava/lang/String;

    invoke-static {p3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p3

    invoke-static {p3}, Lcom/miui/gallery/util/ExifUtil;->exifOrientationToDegrees(I)I

    move-result p3

    const/16 v0, 0x5a

    if-eq p3, v0, :cond_0

    const/16 v0, 0x10e

    if-ne p3, v0, :cond_1

    :cond_0
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, "x"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, "px"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p3

    :catch_0
    move-exception p3

    const-string v0, "PhotoDetailFragment"

    invoke-static {v0, p3}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, "x"

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, "px"

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private isNeedConfirmPassword()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->isSecret()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mNeedConfirmPassword:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private requestAddress(DD)V
    .locals 8

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoDetailFragment;->cancelAddressRequest()V

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$CTA;->canConnectNetwork()Z

    move-result v0

    if-nez v0, :cond_0

    const-string p1, "PhotoDetailFragment"

    const-string p2, "Abort request address task due to lack of CTA network connection permission"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getNetworkPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v7, Lcom/miui/gallery/ui/PhotoDetailFragment$2;

    move-object v1, v7

    move-object v2, p0

    move-wide v3, p1

    move-wide v5, p3

    invoke-direct/range {v1 .. v6}, Lcom/miui/gallery/ui/PhotoDetailFragment$2;-><init>(Lcom/miui/gallery/ui/PhotoDetailFragment;DD)V

    new-instance p1, Lcom/miui/gallery/ui/PhotoDetailFragment$3;

    invoke-direct {p1, p0}, Lcom/miui/gallery/ui/PhotoDetailFragment$3;-><init>(Lcom/miui/gallery/ui/PhotoDetailFragment;)V

    invoke-virtual {v0, v7, p1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/threadpool/FutureListener;)Lcom/miui/gallery/threadpool/Future;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mAddressFuture:Lcom/miui/gallery/threadpool/Future;

    return-void
.end method

.method private setItemVisible(Landroid/view/View;Z)V
    .locals 0

    if-eqz p2, :cond_0

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_0
    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    :goto_0
    return-void
.end method

.method private setRootViewClickable(Landroid/view/View;)V
    .locals 3

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    instance-of v2, v0, Landroid/view/View;

    if-eqz v2, :cond_1

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    goto :goto_0

    :cond_1
    invoke-virtual {p1, v1}, Landroid/view/View;->setClickable(Z)V

    :goto_0
    return-void
.end method


# virtual methods
.method public getPageName()Ljava/lang/String;
    .locals 1

    const-string v0, "photo_info"

    return-object v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/BaseFragment;->onActivityCreated(Landroid/os/Bundle;)V

    new-instance p1, Lcom/miui/gallery/ui/PhotoDetailFragment$DetailLoaderCallBack;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lcom/miui/gallery/ui/PhotoDetailFragment$DetailLoaderCallBack;-><init>(Lcom/miui/gallery/ui/PhotoDetailFragment;Lcom/miui/gallery/ui/PhotoDetailFragment$1;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mLoaderCallBack:Lcom/miui/gallery/ui/PhotoDetailFragment$DetailLoaderCallBack;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoDetailFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object p1

    const-string v0, "PhotoDetailFragment"

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoDetailFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mLoaderCallBack:Lcom/miui/gallery/ui/PhotoDetailFragment$DetailLoaderCallBack;

    invoke-virtual {p1, v0, v1, v2}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->isSecret()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/activity/BaseActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/16 v0, 0x2000

    invoke-virtual {p1, v0}, Landroid/view/Window;->addFlags(I)V

    :cond_0
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    const/16 v0, 0x1b

    if-eq p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, -0x1

    if-eq p2, v0, :cond_1

    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/PhotoDetailFragment;->finishActivity(I)V

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mNeedConfirmPassword:Z

    :goto_0
    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/ui/BaseFragment;->onActivityResult(IILandroid/content/Intent;)V

    return-void
.end method

.method public onBackPressed()Z
    .locals 1

    const/4 v0, -0x1

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoDetailFragment;->finishActivity(I)V

    const/4 v0, 0x0

    return v0
.end method

.method public onDestroy()V
    .locals 0

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseFragment;->onDestroy()V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoDetailFragment;->cancelAddressRequest()V

    return-void
.end method

.method public onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    iget-object p3, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p3}, Lcom/miui/gallery/activity/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object p3

    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p3

    if-eqz p3, :cond_0

    const-string v0, "photo_detail_target"

    invoke-virtual {p3, v0}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object p3

    check-cast p3, Lcom/miui/gallery/model/BaseDataItem;

    iput-object p3, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mItem:Lcom/miui/gallery/model/BaseDataItem;

    if-nez p3, :cond_1

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoDetailFragment;->finish()V

    :cond_1
    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/PhotoDetailFragment;->setRootViewClickable(Landroid/view/View;)V

    const p3, 0x7f0b00ef

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f0902ef

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mTimeItem:Landroid/view/View;

    const p2, 0x7f0902f1

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mTimeTitle:Landroid/widget/TextView;

    const p2, 0x7f0902f0

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mTimeSub:Landroid/widget/TextView;

    const p2, 0x7f090125

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mFileInfoItem:Landroid/view/View;

    const p2, 0x7f090127

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mFileInfoTitle:Landroid/widget/TextView;

    const p2, 0x7f0902f6

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mTipNoDownload:Landroid/widget/TextView;

    const p2, 0x7f090126

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mFileInfoSub:Landroid/widget/TextView;

    const p2, 0x7f09020d

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mParamsItem:Landroid/view/View;

    const p2, 0x7f090210

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mTakenParamsTitle:Landroid/widget/TextView;

    const p2, 0x7f09020e

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mTakenParamsSub:Landroid/widget/TextView;

    const p2, 0x7f09020f

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mTakenParamsThird:Landroid/widget/TextView;

    const p2, 0x7f090212

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mPathItem:Landroid/view/View;

    const p2, 0x7f090213

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mPath:Landroid/widget/TextView;

    const p2, 0x7f0901b8

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mLocationItem:Landroid/view/View;

    const p2, 0x7f0901b9

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mLocation:Landroid/widget/TextView;

    const p2, 0x7f0900af

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mContentContainer:Landroid/view/View;

    const p2, 0x7f090232

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ProgressBar;

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mProgress:Landroid/widget/ProgressBar;

    const p2, 0x7f090281

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mScreenshotPackageItem:Landroid/view/View;

    const p2, 0x7f090282

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mScreenshotPackageInfo:Landroid/widget/TextView;

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mLocation:Landroid/widget/TextView;

    iget-object p3, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object p1
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x102002c

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoDetailFragment;->finish()V

    const/4 p1, 0x1

    return p1

    :cond_0
    invoke-super {p0, p1}, Lcom/miui/gallery/ui/BaseFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method public onResume()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseFragment;->onResume()V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoDetailFragment;->isNeedConfirmPassword()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mNeedConfirmPassword:Z

    const/16 v0, 0x1b

    invoke-static {p0, v0}, Lcom/miui/privacy/LockSettingsHelper;->startAuthenticatePasswordActivity(Landroid/app/Fragment;I)V

    :cond_0
    return-void
.end method

.method public onStop()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoDetailFragment;->mNeedConfirmPassword:Z

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseFragment;->onStop()V

    return-void
.end method

.method protected useImageLoader()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
