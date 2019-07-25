.class public Lcom/miui/gallery/ui/BurstPhotoFragment;
.super Lcom/miui/gallery/ui/PhotoPageFragmentBase;
.source "BurstPhotoFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;
    }
.end annotation


# instance fields
.field private mBurstChoiceManager:Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/BurstPhotoFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/BurstPhotoFragment;->onSaveBurstItemsCompleted()V

    return-void
.end method

.method private configViewLayout(Landroid/view/View;)V
    .locals 8

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BurstPhotoFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0902ae

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

    const v2, 0x7f090217

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/ui/PhotoChoiceTitle;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/PhotoChoiceTitle;->getExitButton()Landroid/widget/ImageView;

    move-result-object v3

    const/16 v4, 0x8

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    const v3, 0x7f09021a

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-static {}, Lcom/miui/gallery/BaseConfig$ScreenConfig;->getRealScreenHeight()I

    move-result v3

    invoke-static {}, Lcom/miui/gallery/BaseConfig$ScreenConfig;->getRealScreenWidth()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-static {}, Lcom/miui/gallery/BaseConfig$ScreenConfig;->getRealScreenHeight()I

    move-result v4

    invoke-static {}, Lcom/miui/gallery/BaseConfig$ScreenConfig;->getRealScreenWidth()I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v4

    const v5, 0x7f06006d

    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    const v6, 0x7f06005c

    invoke-virtual {v0, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v6

    sub-int v7, v3, v5

    sub-int/2addr v7, v6

    invoke-virtual {v2}, Lcom/miui/gallery/ui/PhotoChoiceTitle;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    iput v5, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iput v6, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v1, v5}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->setFixedSideSlipDistance(I)V

    const p1, 0x7f06038d

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    const v1, 0x7f06056e

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    const v2, 0x7f06056f

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    int-to-float v2, v7

    const/high16 v5, 0x3f800000    # 1.0f

    mul-float v2, v2, v5

    int-to-float v3, v3

    div-float/2addr v2, v3

    int-to-float p1, p1

    const/high16 v3, 0x40000000    # 2.0f

    mul-float p1, p1, v3

    int-to-float v3, v4

    div-float/2addr p1, v3

    sub-float p1, v5, p1

    int-to-float v0, v0

    mul-float v0, v0, v5

    int-to-float v1, v1

    div-float/2addr v0, v1

    iget-object v1, p0, Lcom/miui/gallery/ui/BurstPhotoFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v1, v2}, Lcom/miui/gallery/widget/ViewPager;->setHeightSlipRatio(F)V

    iget-object v1, p0, Lcom/miui/gallery/ui/BurstPhotoFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v1, p1}, Lcom/miui/gallery/widget/ViewPager;->setWidthSlipRatio(F)V

    iget-object p1, p0, Lcom/miui/gallery/ui/BurstPhotoFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/widget/ViewPager;->setMarginSlipRatio(F)V

    return-void
.end method

.method public static newInstance(Landroid/net/Uri;Landroid/os/Bundle;)Lcom/miui/gallery/ui/BurstPhotoFragment;
    .locals 1

    if-nez p1, :cond_0

    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    :cond_0
    if-eqz p0, :cond_1

    const-string v0, "photo_uri"

    invoke-virtual {p0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, v0, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    new-instance p0, Lcom/miui/gallery/ui/BurstPhotoFragment;

    invoke-direct {p0}, Lcom/miui/gallery/ui/BurstPhotoFragment;-><init>()V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/BurstPhotoFragment;->setArguments(Landroid/os/Bundle;)V

    return-object p0
.end method

.method private onSaveBurstItemsCompleted()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const/4 v1, -0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/activity/BaseActivity;->setResult(ILandroid/content/Intent;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->finish()V

    :cond_0
    return-void
.end method


# virtual methods
.method protected delayDoAfterTransit()V
    .locals 2

    new-instance v0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;-><init>(Lcom/miui/gallery/ui/BurstPhotoFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoFragment;->mBurstChoiceManager:Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoFragment;->mBurstChoiceManager:Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->setSlipped(Z)V

    return-void
.end method

.method protected getLayout(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/ui/BurstPhotoFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const v0, 0x7f0b0037

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public getPageName()Ljava/lang/String;
    .locals 1

    const-string v0, "burst"

    return-object v0
.end method

.method protected getPhotoAdapter()Lcom/miui/gallery/adapter/PhotoPageAdapter;
    .locals 7

    new-instance v6, Lcom/miui/gallery/adapter/BurstPhotoPageAdapter;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BurstPhotoFragment;->getInitCount()I

    move-result v1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BurstPhotoFragment;->getImageLoadParams()Lcom/miui/gallery/model/ImageLoadParams;

    move-result-object v2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BurstPhotoFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v3, "photo_init_position"

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/BurstPhotoFragment;->getEnterViewInfo(I)Lcom/miui/gallery/util/photoview/ItemViewInfo;

    move-result-object v3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BurstPhotoFragment;->getPhotoPageInteractionListener()Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageInteractionListener;

    move-result-object v5

    move-object v0, v6

    move-object v4, p0

    invoke-direct/range {v0 .. v5}, Lcom/miui/gallery/adapter/BurstPhotoPageAdapter;-><init>(ILcom/miui/gallery/model/ImageLoadParams;Lcom/miui/gallery/util/photoview/ItemViewInfo;Lcom/miui/gallery/adapter/PhotoPageAdapter$OnPreviewedListener;Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageInteractionListener;)V

    return-object v6
.end method

.method protected getTAG()Ljava/lang/String;
    .locals 1

    const-string v0, "BurstPhotoFragment"

    return-object v0
.end method

.method protected getThemeRes()I
    .locals 1

    const v0, 0x7f1100a9

    return v0
.end method

.method public onBackPressed()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoFragment;->mBurstChoiceManager:Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoFragment;->mBurstChoiceManager:Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->discard()V

    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method protected onDataSetLoaded(Lcom/miui/gallery/model/BaseDataSet;Z)V
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->onDataSetLoaded(Lcom/miui/gallery/model/BaseDataSet;Z)V

    iget-object p2, p0, Lcom/miui/gallery/ui/BurstPhotoFragment;->mBurstChoiceManager:Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/ui/BurstPhotoFragment;->mBurstChoiceManager:Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->onDataSetLoaded(Lcom/miui/gallery/model/BaseDataSet;)V

    :cond_0
    return-void
.end method

.method protected onItemChanged(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoFragment;->mBurstChoiceManager:Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoFragment;->mBurstChoiceManager:Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->onItemChanged(I)V

    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 0

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->onResume()V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BurstPhotoFragment;->onContentChanged()V

    return-void
.end method

.method protected onViewInflated(Landroid/view/View;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->onViewInflated(Landroid/view/View;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/BurstPhotoFragment;->configViewLayout(Landroid/view/View;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/BurstPhotoFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/activity/BaseActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-static {p1}, Lcom/android/internal/WindowCompat;->setCutoutModeShortEdges(Landroid/view/Window;)V

    return-void
.end method
