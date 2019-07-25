.class public abstract Lcom/miui/gallery/ui/MicroThumbGridItem;
.super Landroid/widget/RelativeLayout;
.source "MicroThumbGridItem.java"

# interfaces
.implements Lcom/miui/gallery/ui/CheckableView;
.implements Lcom/miui/gallery/widget/editwrapper/PickAnimationHelper$BackgroundImageViewable;
.implements Lcom/miui/gallery/widget/editwrapper/PickAnimationHelper$ShowNumberWhenPicking;
.implements Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;
.implements Lcom/miui/gallery/widget/recyclerview/transition/TransitionalView;


# instance fields
.field private mBottomIndicatorContainer:Landroid/view/View;

.field private mCheckBox:Landroid/widget/CheckBox;

.field private mCheckBoxContainer:Landroid/view/View;

.field private mFavoriteIndicator:Landroid/view/View;

.field protected mImageAware:Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

.field protected mImageSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

.field protected mImageView:Landroid/widget/ImageView;

.field private mIsSimilarBestImage:Z

.field private mItemId:J

.field private mItemPath:Ljava/lang/String;

.field private mItemStub:Landroid/view/ViewStub;

.field private mLastSyncId:J

.field private mMask:Landroid/widget/ImageView;

.field private mPickingNumberIndicator:Landroid/widget/TextView;

.field private mSimilarBestMark:Landroid/widget/ImageView;

.field private mSyncIndicator:Landroid/widget/ImageView;

.field private mSyncState:I

.field private mTopIndicatorContainer:Landroid/view/View;

.field private mTypeIndicator:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const p1, 0x7fffffff

    iput p1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mSyncState:I

    const-wide/16 p1, -0x1

    iput-wide p1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mLastSyncId:J

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mItemPath:Ljava/lang/String;

    return-void
.end method

.method private checkStubInflate()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mItemStub:Landroid/view/ViewStub;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mItemStub:Landroid/view/ViewStub;

    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object v0

    const v1, 0x7f0901bc

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mMask:Landroid/widget/ImageView;

    const v1, 0x1020001

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/CheckBox;

    iput-object v1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mCheckBox:Landroid/widget/CheckBox;

    const v1, 0x7f090085

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mCheckBoxContainer:Landroid/view/View;

    const v1, 0x7f0902c7

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mSyncIndicator:Landroid/widget/ImageView;

    const v1, 0x7f090304

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mTopIndicatorContainer:Landroid/view/View;

    const v1, 0x7f09021f

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mPickingNumberIndicator:Landroid/widget/TextView;

    const v1, 0x7f0902a8

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mSimilarBestMark:Landroid/widget/ImageView;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mItemStub:Landroid/view/ViewStub;

    return-void
.end method

.method private static displaySyncableState(I)Z
    .locals 0

    and-int/lit8 p0, p0, 0x2

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static displaySyncedState(I)Z
    .locals 0

    and-int/lit8 p0, p0, 0x8

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static displaySyncingState(I)Z
    .locals 0

    and-int/lit8 p0, p0, 0x4

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static displayUnSyncableState(I)Z
    .locals 1

    const/4 v0, 0x1

    and-int/2addr p0, v0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private isInCheckMode()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mCheckBoxContainer:Landroid/view/View;

    if-nez v0, :cond_0

    const/16 v0, 0x8

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mCheckBoxContainer:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    :goto_0
    if-nez v0, :cond_1

    const/4 v0, 0x1

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    :goto_1
    return v0
.end method

.method private needRefreshSyncIndicator(JII)Z
    .locals 3

    iget-wide v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mLastSyncId:J

    cmp-long v2, v0, p1

    const/4 p1, 0x1

    if-eqz v2, :cond_0

    const p2, 0x7fffffff

    iput p2, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mSyncState:I

    return p1

    :cond_0
    iget p2, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mSyncState:I

    if-eq p2, p3, :cond_1

    return p1

    :cond_1
    iget-object p2, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mSyncIndicator:Landroid/widget/ImageView;

    if-nez p2, :cond_2

    const/16 p2, 0x8

    goto :goto_0

    :cond_2
    iget-object p2, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mSyncIndicator:Landroid/widget/ImageView;

    invoke-virtual {p2}, Landroid/widget/ImageView;->getVisibility()I

    move-result p2

    :goto_0
    invoke-direct {p0, p3, p4}, Lcom/miui/gallery/ui/MicroThumbGridItem;->needShowSyncIndicator(II)Z

    move-result p3

    const/4 p4, 0x0

    if-eqz p3, :cond_4

    if-eqz p2, :cond_3

    goto :goto_1

    :cond_3
    const/4 p1, 0x0

    goto :goto_1

    :cond_4
    if-nez p2, :cond_3

    :goto_1
    return p1
.end method

.method private needShowSyncIndicator(II)Z
    .locals 0

    packed-switch p1, :pswitch_data_0

    const/4 p1, 0x0

    return p1

    :pswitch_0
    invoke-static {p2}, Lcom/miui/gallery/ui/MicroThumbGridItem;->displayUnSyncableState(I)Z

    move-result p1

    return p1

    :pswitch_1
    invoke-static {p2}, Lcom/miui/gallery/ui/MicroThumbGridItem;->displaySyncableState(I)Z

    move-result p1

    return p1

    :pswitch_2
    invoke-static {p2}, Lcom/miui/gallery/ui/MicroThumbGridItem;->displaySyncingState(I)Z

    move-result p1

    return p1

    :pswitch_3
    invoke-static {p2}, Lcom/miui/gallery/ui/MicroThumbGridItem;->displaySyncedState(I)Z

    move-result p1

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private needShowSyncIndicator(Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;)Z
    .locals 2

    sget-object v0, Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;->SCENE_ALWAYS:Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;

    const/4 v1, 0x1

    if-ne p1, v0, :cond_0

    return v1

    :cond_0
    sget-object v0, Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;->SCENE_IN_CHECK_MODE:Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;

    if-ne p1, v0, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/ui/MicroThumbGridItem;->isInCheckMode()Z

    move-result p1

    if-eqz p1, :cond_1

    return v1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method private setSyncIndicatorVisibility(I)V
    .locals 1

    if-nez p1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/MicroThumbGridItem;->checkStubInflate()V

    iget-object p1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mSyncIndicator:Landroid/widget/ImageView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mSyncIndicator:Landroid/widget/ImageView;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mSyncIndicator:Landroid/widget/ImageView;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/MicroThumbGridItem;->updateTopIndicatorBg()V

    return-void
.end method

.method private setTypeIndicatorVisibility(I)V
    .locals 1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mTypeIndicator:Landroid/widget/TextView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mTypeIndicator:Landroid/widget/TextView;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mTypeIndicator:Landroid/widget/TextView;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/MicroThumbGridItem;->updateBottomIndicatorBg()V

    return-void
.end method

.method private updateSyncIndicator(IILandroid/view/animation/Animation;Landroid/view/animation/Animation;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mSyncIndicator:Landroid/widget/ImageView;

    if-nez v0, :cond_0

    if-eqz p2, :cond_1

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/ui/MicroThumbGridItem;->checkStubInflate()V

    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mSyncIndicator:Landroid/widget/ImageView;

    invoke-virtual {v0, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    :cond_1
    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/MicroThumbGridItem;->setSyncIndicatorVisibility(I)V

    if-eqz p3, :cond_2

    invoke-direct {p0}, Lcom/miui/gallery/ui/MicroThumbGridItem;->checkStubInflate()V

    iget-object p1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mSyncIndicator:Landroid/widget/ImageView;

    invoke-virtual {p1, p3}, Landroid/widget/ImageView;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mSyncIndicator:Landroid/widget/ImageView;

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mSyncIndicator:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->clearAnimation()V

    :cond_3
    :goto_0
    if-eqz p4, :cond_4

    invoke-direct {p0}, Lcom/miui/gallery/ui/MicroThumbGridItem;->checkStubInflate()V

    iget-object p1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mTopIndicatorContainer:Landroid/view/View;

    invoke-virtual {p1, p4}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_1

    :cond_4
    iget-object p1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mTopIndicatorContainer:Landroid/view/View;

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mTopIndicatorContainer:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->clearAnimation()V

    :cond_5
    :goto_1
    return-void
.end method


# virtual methods
.method public bindFavoriteIndicator(Z)V
    .locals 0

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/MicroThumbGridItem;->isInCheckMode()Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/16 p1, 0x8

    :goto_0
    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/MicroThumbGridItem;->updateFavoriteIndicatorVisibility(I)V

    return-void
.end method

.method public bindImage(JLjava/lang/String;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V
    .locals 6

    iput-wide p1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mItemId:J

    iput-object p3, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mItemPath:Ljava/lang/String;

    iget-object v3, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mImageView:Landroid/widget/ImageView;

    iget-object v5, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mImageSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    move-object v0, p3

    move-object v1, p4

    move-object v2, p5

    move-object v4, p6

    invoke-static/range {v0 .. v5}, Lcom/miui/gallery/util/BindImageHelper;->bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;)V

    return-void
.end method

.method public bindImage(JLjava/lang/String;Landroid/net/Uri;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V
    .locals 7

    sget-object v5, Lcom/miui/gallery/sdk/download/DownloadType;->MICRO:Lcom/miui/gallery/sdk/download/DownloadType;

    move-object v0, p0

    move-wide v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v6, p5

    invoke-virtual/range {v0 .. v6}, Lcom/miui/gallery/ui/MicroThumbGridItem;->bindImage(JLjava/lang/String;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    return-void
.end method

.method public bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V
    .locals 7

    const-wide/16 v1, -0x1

    move-object v0, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    invoke-virtual/range {v0 .. v6}, Lcom/miui/gallery/ui/MicroThumbGridItem;->bindImage(JLjava/lang/String;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    return-void
.end method

.method public bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V
    .locals 7

    sget-object v5, Lcom/miui/gallery/sdk/download/DownloadType;->MICRO:Lcom/miui/gallery/sdk/download/DownloadType;

    const-wide/16 v1, -0x1

    move-object v0, p0

    move-object v3, p1

    move-object v4, p2

    move-object v6, p3

    invoke-virtual/range {v0 .. v6}, Lcom/miui/gallery/ui/MicroThumbGridItem;->bindImage(JLjava/lang/String;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    return-void
.end method

.method public bindIndicator(Ljava/lang/String;JJ)V
    .locals 3

    invoke-static {p1}, Lcom/miui/gallery/util/FileMimeUtil;->isGifFromMimeType(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const-string p1, "GIF"

    const/4 p2, 0x0

    goto :goto_0

    :cond_0
    invoke-static {p1}, Lcom/miui/gallery/util/FileMimeUtil;->isVideoFromMimeType(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-static {p4, p5}, Lcom/miui/gallery/util/SpecialTypeMediaUtils;->tryGetHFRIndicatorResId(J)I

    move-result p1

    if-eqz p1, :cond_1

    const-string p2, ""

    move-object v2, p2

    move p2, p1

    move-object p1, v2

    goto :goto_0

    :cond_1
    invoke-static {p2, p3}, Lcom/miui/gallery/util/FormatUtil;->formatVideoDuration(J)Ljava/lang/String;

    move-result-object p1

    const p2, 0x7f0702d8

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Lcom/miui/gallery/ui/MicroThumbGridItem;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1, p4, p5}, Lcom/miui/gallery/util/SpecialTypeMediaUtils;->isRefocusSupported(Landroid/content/Context;J)Z

    move-result p1

    if-eqz p1, :cond_3

    const-string p1, ""

    const p2, 0x7f0702d7

    goto :goto_0

    :cond_3
    invoke-virtual {p0}, Lcom/miui/gallery/ui/MicroThumbGridItem;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1, p4, p5}, Lcom/miui/gallery/util/SpecialTypeMediaUtils;->isMotionPhoto(Landroid/content/Context;J)Z

    move-result p1

    if-eqz p1, :cond_4

    const-string p1, ""

    const p2, 0x7f0702d5

    goto :goto_0

    :cond_4
    invoke-static {p4, p5}, Lcom/miui/gallery/util/SpecialTypeMediaUtils;->isBurstPhoto(J)Z

    move-result p1

    if-eqz p1, :cond_5

    const-string p1, ""

    const p2, 0x7f0702d1

    goto :goto_0

    :cond_5
    const/16 p1, 0x8

    const/4 p2, 0x0

    move-object p1, p2

    const/4 p2, 0x0

    const/16 v1, 0x8

    :goto_0
    invoke-virtual {p0, v1, p1, p2}, Lcom/miui/gallery/ui/MicroThumbGridItem;->updateTypeIndicator(ILjava/lang/String;I)V

    return-void
.end method

.method public bindSyncIndicator(JILcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;)V
    .locals 6

    const/4 v5, 0x7

    move-object v0, p0

    move-wide v1, p1

    move v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/miui/gallery/ui/MicroThumbGridItem;->bindSyncIndicator(JILcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;I)V

    return-void
.end method

.method public bindSyncIndicator(JILcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;I)V
    .locals 6

    invoke-direct {p0, p4}, Lcom/miui/gallery/ui/MicroThumbGridItem;->needShowSyncIndicator(Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;)Z

    move-result p4

    const/16 v0, 0x8

    if-nez p4, :cond_1

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/MicroThumbGridItem;->setSyncIndicatorVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mSyncIndicator:Landroid/widget/ImageView;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mSyncIndicator:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getAnimation()Landroid/view/animation/Animation;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mSyncIndicator:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->clearAnimation()V

    :cond_0
    return-void

    :cond_1
    invoke-direct {p0, p1, p2, p3, p5}, Lcom/miui/gallery/ui/MicroThumbGridItem;->needRefreshSyncIndicator(JII)Z

    move-result p4

    if-nez p4, :cond_2

    return-void

    :cond_2
    const p4, 0x7fffffff

    const v1, 0x7f070210

    const v2, 0x7f07020f

    const/4 v3, 0x0

    const/4 v4, 0x0

    if-eq p3, p4, :cond_6

    packed-switch p3, :pswitch_data_0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "unknow status: "

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_0
    invoke-static {p5}, Lcom/miui/gallery/ui/MicroThumbGridItem;->displayUnSyncableState(I)Z

    move-result p4

    if-eqz p4, :cond_3

    const v1, 0x7f070211

    goto :goto_0

    :pswitch_1
    invoke-static {p5}, Lcom/miui/gallery/ui/MicroThumbGridItem;->displaySyncableState(I)Z

    move-result p4

    if-eqz p4, :cond_3

    :goto_0
    move-object p4, v4

    goto :goto_3

    :pswitch_2
    invoke-static {p5}, Lcom/miui/gallery/ui/MicroThumbGridItem;->displaySyncingState(I)Z

    move-result p4

    if-eqz p4, :cond_3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/MicroThumbGridItem;->getContext()Landroid/content/Context;

    move-result-object p4

    const p5, 0x7f01000e

    invoke-static {p4, p5}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object p4

    move-object v5, v4

    move-object v4, p4

    move-object p4, v5

    goto :goto_3

    :cond_3
    :goto_1
    move-object p4, v4

    const/4 v1, 0x0

    :goto_2
    const/16 v3, 0x8

    goto :goto_3

    :pswitch_3
    invoke-static {p5}, Lcom/miui/gallery/ui/MicroThumbGridItem;->displaySyncedState(I)Z

    move-result p4

    if-eqz p4, :cond_4

    move-object p4, v4

    const v1, 0x7f07020f

    goto :goto_3

    :cond_4
    iget p4, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mSyncState:I

    const/4 v1, 0x2

    if-eq p4, v1, :cond_5

    goto :goto_1

    :cond_5
    invoke-static {p5}, Lcom/miui/gallery/ui/MicroThumbGridItem;->displaySyncingState(I)Z

    move-result p4

    if-eqz p4, :cond_6

    invoke-virtual {p0}, Lcom/miui/gallery/ui/MicroThumbGridItem;->getContext()Landroid/content/Context;

    move-result-object p4

    const p5, 0x7f01000d

    invoke-static {p4, p5}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v4

    invoke-virtual {p0}, Lcom/miui/gallery/ui/MicroThumbGridItem;->getContext()Landroid/content/Context;

    move-result-object p4

    invoke-static {p4, p5}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object p4

    const v1, 0x7f07020f

    goto :goto_2

    :cond_6
    move-object p4, v4

    const/4 v1, 0x0

    :goto_3
    iput-wide p1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mLastSyncId:J

    iput p3, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mSyncState:I

    invoke-direct {p0, v3, v1, v4, p4}, Lcom/miui/gallery/ui/MicroThumbGridItem;->updateSyncIndicator(IILandroid/view/animation/Animation;Landroid/view/animation/Animation;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getBackgroundImageView()Landroid/widget/ImageView;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mImageView:Landroid/widget/ImageView;

    return-object v0
.end method

.method public getBackgroundMask()Landroid/widget/ImageView;
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/MicroThumbGridItem;->checkStubInflate()V

    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mMask:Landroid/widget/ImageView;

    return-object v0
.end method

.method public getCheckBox()Landroid/widget/CheckBox;
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/MicroThumbGridItem;->checkStubInflate()V

    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mCheckBox:Landroid/widget/CheckBox;

    return-object v0
.end method

.method public getShowNumberTextView()Landroid/widget/TextView;
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/MicroThumbGridItem;->checkStubInflate()V

    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mPickingNumberIndicator:Landroid/widget/TextView;

    return-object v0
.end method

.method public getTransitDrawable()Landroid/graphics/drawable/Drawable;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mImageView:Landroid/widget/ImageView;

    invoke-static {v0}, Lcom/miui/gallery/util/BindImageHelper;->isViewBindDrawable(Landroid/widget/ImageView;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/MicroThumbGridItem;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable(Landroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    :cond_1
    return-object v0
.end method

.method public getTransitFrame()Landroid/graphics/RectF;
    .locals 5

    new-instance v0, Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/MicroThumbGridItem;->getLeft()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/MicroThumbGridItem;->getTop()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/MicroThumbGridItem;->getRight()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/MicroThumbGridItem;->getBottom()I

    move-result v4

    int-to-float v4, v4

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    return-object v0
.end method

.method public getTransitId()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mItemId:J

    return-wide v0
.end method

.method public getTransitPath()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mItemPath:Ljava/lang/String;

    return-object v0
.end method

.method public getTransitScaleType()Landroid/widget/ImageView$ScaleType;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mImageView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object v0

    return-object v0
.end method

.method public getTransitionalItems()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iget-wide v1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mItemId:J

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-lez v5, :cond_0

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    return-object v0
.end method

.method public isChecked()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mCheckBox:Landroid/widget/CheckBox;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mCheckBox:Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    return v0
.end method

.method protected isSquareItem()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method protected onFinishInflate()V
    .locals 2

    invoke-super {p0}, Landroid/widget/RelativeLayout;->onFinishInflate()V

    const v0, 0x7f09018b

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/MicroThumbGridItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewStub;

    iput-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mItemStub:Landroid/view/ViewStub;

    const v0, 0x7f0901dd

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/MicroThumbGridItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mImageView:Landroid/widget/ImageView;

    const v0, 0x7f090319

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/MicroThumbGridItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mTypeIndicator:Landroid/widget/TextView;

    const v0, 0x7f090121

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/MicroThumbGridItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mFavoriteIndicator:Landroid/view/View;

    const v0, 0x7f090068

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/MicroThumbGridItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mBottomIndicatorContainer:Landroid/view/View;

    new-instance v0, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    iget-object v1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mImageView:Landroid/widget/ImageView;

    invoke-direct {v0, v1}, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;-><init>(Landroid/widget/ImageView;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mImageAware:Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v0

    iget-object v0, v0, Lcom/miui/gallery/Config$ThumbConfig;->sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    iput-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mImageSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    return-void
.end method

.method protected onMeasure(II)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/MicroThumbGridItem;->isSquareItem()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-super {p0, p1, p1}, Landroid/widget/RelativeLayout;->onMeasure(II)V

    goto :goto_0

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/widget/RelativeLayout;->onMeasure(II)V

    :goto_0
    return-void
.end method

.method public setCheckable(Z)V
    .locals 2

    if-eqz p1, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/ui/MicroThumbGridItem;->checkStubInflate()V

    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mCheckBoxContainer:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mFavoriteIndicator:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v1, 0x1

    :cond_0
    invoke-virtual {p0, v1}, Lcom/miui/gallery/ui/MicroThumbGridItem;->bindFavoriteIndicator(Z)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mCheckBoxContainer:Landroid/view/View;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mCheckBoxContainer:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_2
    :goto_0
    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/MicroThumbGridItem;->setSimilarMarkEnable(Z)V

    return-void
.end method

.method public setCheckableListener(Landroid/view/View$OnClickListener;)V
    .locals 1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mCheckBoxContainer:Landroid/view/View;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mCheckBoxContainer:Landroid/view/View;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/ui/MicroThumbGridItem;->checkStubInflate()V

    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mCheckBoxContainer:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public setChecked(Z)V
    .locals 1

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/MicroThumbGridItem;->checkStubInflate()V

    iget-object p1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mCheckBox:Landroid/widget/CheckBox;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/CheckBox;->setChecked(Z)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mCheckBox:Landroid/widget/CheckBox;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mCheckBox:Landroid/widget/CheckBox;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/CheckBox;->setChecked(Z)V

    :cond_1
    :goto_0
    return-void
.end method

.method public setImageForeground(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mImageView:Landroid/widget/ImageView;

    instance-of v0, v0, Lcom/miui/gallery/widget/ForegroundImageView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mImageView:Landroid/widget/ImageView;

    check-cast v0, Lcom/miui/gallery/widget/ForegroundImageView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/ForegroundImageView;->setForegroundResource(I)V

    :cond_0
    return-void
.end method

.method public setImageSize(Lcom/nostra13/universalimageloader/core/assist/ImageSize;)V
    .locals 0

    if-eqz p1, :cond_0

    iput-object p1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mImageSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    :cond_0
    return-void
.end method

.method public setIsSimilarBestImage(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mIsSimilarBestImage:Z

    iget-object p1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mCheckBoxContainer:Landroid/view/View;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mCheckBoxContainer:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/MicroThumbGridItem;->setSimilarMarkEnable(Z)V

    :cond_0
    return-void
.end method

.method public setSimilarMarkEnable(Z)V
    .locals 1

    if-eqz p1, :cond_0

    iget-boolean p1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mIsSimilarBestImage:Z

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/MicroThumbGridItem;->checkStubInflate()V

    iget-object p1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mSimilarBestMark:Landroid/widget/ImageView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mSimilarBestMark:Landroid/widget/ImageView;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mSimilarBestMark:Landroid/widget/ImageView;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    :cond_1
    :goto_0
    return-void
.end method

.method public toggle()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/MicroThumbGridItem;->checkStubInflate()V

    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mCheckBox:Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->toggle()V

    return-void
.end method

.method protected updateBottomIndicatorBg()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mTypeIndicator:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mTypeIndicator:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mFavoriteIndicator:Landroid/view/View;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mFavoriteIndicator:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_2

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mBottomIndicatorContainer:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mBottomIndicatorContainer:Landroid/view/View;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mBottomIndicatorContainer:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_3
    :goto_0
    return-void
.end method

.method protected updateFavoriteIndicatorVisibility(I)V
    .locals 1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mFavoriteIndicator:Landroid/view/View;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mFavoriteIndicator:Landroid/view/View;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mFavoriteIndicator:Landroid/view/View;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/MicroThumbGridItem;->updateBottomIndicatorBg()V

    return-void
.end method

.method protected updateTopIndicatorBg()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mSyncIndicator:Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mSyncIndicator:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mSyncIndicator:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/MicroThumbGridItem;->checkStubInflate()V

    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mTopIndicatorContainer:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mTopIndicatorContainer:Landroid/view/View;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mTopIndicatorContainer:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    :goto_0
    return-void
.end method

.method protected updateTypeIndicator(ILjava/lang/String;I)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mTypeIndicator:Landroid/widget/TextView;

    if-nez v0, :cond_0

    return-void

    :cond_0
    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mTypeIndicator:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-ne p1, v0, :cond_1

    return-void

    :cond_1
    invoke-static {p2}, Lcom/google/common/base/Strings;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mTypeIndicator:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mTypeIndicator:Landroid/widget/TextView;

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_2
    const/4 p2, 0x0

    if-eqz p3, :cond_3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/MicroThumbGridItem;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p3

    goto :goto_0

    :cond_3
    move-object p3, p2

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mTypeIndicator:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getCompoundDrawablesRelative()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    if-eq v0, p3, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/ui/MicroThumbGridItem;->mTypeIndicator:Landroid/widget/TextView;

    invoke-virtual {v0, p3, p2, p2, p2}, Landroid/widget/TextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    :cond_4
    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/MicroThumbGridItem;->setTypeIndicatorVisibility(I)V

    return-void
.end method
