.class public Lcom/miui/gallery/activity/ExternalPhotoPageActivity;
.super Lcom/miui/gallery/activity/BaseActivity;
.source "ExternalPhotoPageActivity.java"

# interfaces
.implements Lcom/miui/gallery/util/BrightnessProvider;


# static fields
.field private static final REQUIRED_RUNTIME_PERMISSIONS:[Ljava/lang/String;


# instance fields
.field private mBrightnessManager:Lcom/miui/gallery/view/BrightnessManager;

.field private mSupportWindowAnim:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "android.permission.WRITE_EXTERNAL_STORAGE"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->REQUIRED_RUNTIME_PERMISSIONS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/activity/BaseActivity;-><init>()V

    return-void
.end method

.method private static getImageSize(Z)Lcom/nostra13/universalimageloader/core/assist/ImageSize;
    .locals 2

    if-eqz p0, :cond_0

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object p0

    iget-object p0, p0, Lcom/miui/gallery/Config$ThumbConfig;->sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    return-object p0

    :cond_0
    new-instance p0, Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    invoke-static {}, Lcom/miui/gallery/util/ScreenUtils;->getScreenWidth()I

    move-result v0

    invoke-static {}, Lcom/miui/gallery/util/ScreenUtils;->getScreenHeight()I

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/nostra13/universalimageloader/core/assist/ImageSize;-><init>(II)V

    return-object p0
.end method

.method private isCameraPreview()Z
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const-string v2, "from_MiuiCamera"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method public static preloadThumbnail(Ljava/lang/String;)V
    .locals 1

    invoke-static {}, Lcom/miui/gallery/util/ProcessingMediaHelper;->getInstance()Lcom/miui/gallery/util/ProcessingMediaHelper;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/miui/gallery/util/ProcessingMediaHelper;->isMediaInProcessing(Ljava/lang/String;)Z

    move-result v0

    invoke-static {p0, v0}, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->preloadThumbnail(Ljava/lang/String;Z)V

    return-void
.end method

.method public static preloadThumbnail(Ljava/lang/String;Z)V
    .locals 5

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-static {v0, v1}, Lcom/miui/gallery/permission/core/PermissionUtils;->checkPermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string p0, "ExternalPhotoPageActivity"

    const-string p1, "Can\'t access external storage, relate permission is ungranted"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-static {p1}, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->getImageSize(Z)Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    move-result-object v0

    new-instance v1, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    sget-object v2, Lcom/miui/gallery/Config$ThumbConfig;->THUMBNAIL_DISPLAY_IMAGE_OPTIONS_DEFAULT:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    invoke-virtual {v1, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cloneFrom(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->loadFromBigPhotoCache(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v3

    sget-object v4, Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;->EXACTLY:Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    invoke-virtual {v3, v4}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageScaleType(Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->delayCacheThumbnail(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheInMemory(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->highPriority(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-virtual {v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v1

    if-eqz p1, :cond_1

    invoke-static {v1}, Lcom/miui/gallery/Config$ThumbConfig;->appendBlurOptions(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v1

    :cond_1
    new-instance p1, Lcom/nostra13/universalimageloader/core/imageaware/NonViewAware;

    sget-object v2, Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;->FIT_INSIDE:Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;

    invoke-direct {p1, v0, v2}, Lcom/nostra13/universalimageloader/core/imageaware/NonViewAware;-><init>(Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;)V

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/ImageLoader;->resume()V

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    invoke-virtual {v0, p0, p1, v1}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    return-void
.end method

.method private prepareIfFromCamera()V
    .locals 17

    move-object/from16 v0, p0

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    if-eqz v1, :cond_4

    invoke-virtual {v1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    if-eqz v2, :cond_4

    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    if-nez v2, :cond_0

    goto/16 :goto_2

    :cond_0
    invoke-virtual {v1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    invoke-direct/range {p0 .. p0}, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->isCameraPreview()Z

    move-result v3

    if-nez v3, :cond_1

    return-void

    :cond_1
    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0a003c

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v3

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0a003b

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v4

    invoke-static {}, Lcom/miui/gallery/util/ScreenUtils;->getScreenWidth()I

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v3, :cond_2

    invoke-static {}, Lcom/miui/gallery/util/ScreenUtils;->getScreenHeight()I

    move-result v3

    sub-int/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    const/4 v4, 0x5

    if-gt v3, v4, :cond_2

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v3

    iget v3, v3, Landroid/content/res/Configuration;->orientation:I

    if-ne v3, v6, :cond_2

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->getWindow()Landroid/view/Window;

    move-result-object v3

    const/high16 v4, 0x7f110000

    invoke-virtual {v3, v4}, Landroid/view/Window;->setWindowAnimations(I)V

    iput-boolean v6, v0, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->mSupportWindowAnim:Z

    :cond_2
    invoke-virtual {v1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "photo_count"

    invoke-virtual {v1, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v5, "photo_init_position"

    const/4 v6, 0x0

    invoke-virtual {v1, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-static {v3}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v8

    invoke-static {v3}, Lcom/miui/gallery/util/MediaStoreUtils;->getMineTypeFromUri(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v14

    invoke-static {}, Lcom/miui/gallery/util/ProcessingMediaHelper;->getInstance()Lcom/miui/gallery/util/ProcessingMediaHelper;

    move-result-object v3

    invoke-virtual {v3, v4}, Lcom/miui/gallery/util/ProcessingMediaHelper;->isMediaInProcessing(Ljava/lang/String;)Z

    move-result v3

    invoke-static {v3}, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->getImageSize(Z)Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    move-result-object v11

    new-instance v3, Lcom/miui/gallery/model/ImageLoadParams;

    const/4 v12, 0x0

    const/4 v13, 0x0

    const-wide/16 v15, -0x1

    move-object v7, v3

    move-object v10, v4

    invoke-direct/range {v7 .. v16}, Lcom/miui/gallery/model/ImageLoadParams;-><init>(JLjava/lang/String;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ILjava/lang/String;J)V

    const-string v5, "photo_transition_data"

    invoke-virtual {v1, v5, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    invoke-static {v4}, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->preloadThumbnail(Ljava/lang/String;)V

    const-string v1, "camera-brightness-manual"

    const/4 v3, -0x1

    invoke-virtual {v2, v1, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    if-ne v1, v3, :cond_3

    const-string v1, "camera-brightness"

    :goto_0
    invoke-virtual {v2, v1, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    goto :goto_1

    :cond_3
    const-string v1, "camera-brightness-manual"

    goto :goto_0

    :goto_1
    const-string v3, "camera-brightness-auto"

    const/high16 v4, -0x40800000    # -1.0f

    invoke-virtual {v2, v3, v4}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;F)F

    move-result v2

    new-instance v3, Lcom/miui/gallery/view/BrightnessManager;

    const/high16 v4, 0x3f800000    # 1.0f

    int-to-float v1, v1

    mul-float v1, v1, v4

    const/high16 v4, 0x437f0000    # 255.0f

    div-float/2addr v1, v4

    invoke-direct {v3, v0, v1, v2}, Lcom/miui/gallery/view/BrightnessManager;-><init>(Landroid/app/Activity;FF)V

    iput-object v3, v0, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->mBrightnessManager:Lcom/miui/gallery/view/BrightnessManager;

    return-void

    :cond_4
    :goto_2
    return-void
.end method

.method private setScreenEffect(Z)V
    .locals 0

    invoke-static {p1}, Lcom/miui/display/DisplayFeatureHelper;->setScreenEffect(Z)V

    return-void
.end method

.method private startMainActivity()V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.MAIN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v1, 0x4000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method


# virtual methods
.method public finish()V
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->finishAndRemoveTask()V

    goto :goto_0

    :cond_0
    invoke-super {p0}, Lcom/miui/gallery/activity/BaseActivity;->finish()V

    :goto_0
    iget-boolean v0, p0, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->mSupportWindowAnim:Z

    if-eqz v0, :cond_1

    const v0, 0x7f010009

    const v1, 0x7f01000a

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->overridePendingTransition(II)V

    :cond_1
    return-void
.end method

.method public getAutoBrightness()F
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->mBrightnessManager:Lcom/miui/gallery/view/BrightnessManager;

    if-nez v0, :cond_0

    const/high16 v0, -0x40800000    # -1.0f

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->mBrightnessManager:Lcom/miui/gallery/view/BrightnessManager;

    invoke-virtual {v0}, Lcom/miui/gallery/view/BrightnessManager;->getAutoBrightness()F

    move-result v0

    :goto_0
    return v0
.end method

.method protected getFragmentContainerId()I
    .locals 1

    const v0, 0x1020002

    return v0
.end method

.method public getManualBrightness()F
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->mBrightnessManager:Lcom/miui/gallery/view/BrightnessManager;

    if-nez v0, :cond_0

    const/high16 v0, -0x40800000    # -1.0f

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->mBrightnessManager:Lcom/miui/gallery/view/BrightnessManager;

    invoke-virtual {v0}, Lcom/miui/gallery/view/BrightnessManager;->getManualBrightness()F

    move-result v0

    :goto_0
    return v0
.end method

.method public getRuntimePermissions()[Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->REQUIRED_RUNTIME_PERMISSIONS:[Ljava/lang/String;

    return-object v0
.end method

.method protected hasCustomContentView()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public onActivityReenter(ILandroid/content/Intent;)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const-string v1, "PhotoPageFragment"

    invoke-virtual {v0, v1}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/ui/PhotoPageFragment;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageFragment;->onActivityReenter(ILandroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/activity/BaseActivity;->onActivityResult(IILandroid/content/Intent;)V

    invoke-virtual {p0}, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentManager;->getBackStackEntryCount()I

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const-string v1, "PhotoPageFragment"

    invoke-virtual {v0, v1}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/ui/PhotoPageFragment;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2, p3}, Lcom/miui/gallery/ui/PhotoPageFragment;->onActivityResult(IILandroid/content/Intent;)V

    return-void

    :cond_0
    return-void
.end method

.method public onBackPressed()V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentManager;->getBackStackEntryCount()I

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const-string v1, "PhotoPageFragment"

    invoke-virtual {v0, v1}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/ui/PhotoPageFragment;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isVisible()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->onBackPressed()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-super {p0}, Lcom/miui/gallery/activity/BaseActivity;->onBackPressed()V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3

    invoke-direct {p0}, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->prepareIfFromCamera()V

    invoke-super {p0, p1}, Lcom/miui/gallery/activity/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    invoke-static {p0}, Lcom/miui/gallery/util/IntentUtil;->getCallingPackage(Landroid/app/Activity;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "photo"

    const-string v1, "external_view_photo"

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string p1, "Unknown"

    :cond_0
    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordStringPropertyEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method protected onPause()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/activity/BaseActivity;->onPause()V

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/ImageLoader;->pause()V

    iget-object v0, p0, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->mBrightnessManager:Lcom/miui/gallery/view/BrightnessManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->mBrightnessManager:Lcom/miui/gallery/view/BrightnessManager;

    invoke-virtual {v0}, Lcom/miui/gallery/view/BrightnessManager;->onPause()V

    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->setScreenEffect(Z)V

    return-void
.end method

.method public onPermissionsChecked([Ljava/lang/String;[I)V
    .locals 2

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/activity/BaseActivity;->onPermissionsChecked([Ljava/lang/String;[I)V

    invoke-virtual {p0}, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p2

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const-string v1, "PhotoPageFragment"

    invoke-virtual {v0, v1}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/ui/PhotoPageFragment;

    if-nez v0, :cond_1

    invoke-virtual {p1}, Landroid/content/Intent;->getType()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    const/4 v1, 0x0

    invoke-static {p2, v0, p1, v1}, Lcom/miui/gallery/ui/PhotoPageFragment;->newInstance(Landroid/net/Uri;Ljava/lang/String;Landroid/os/Bundle;I)Lcom/miui/gallery/ui/PhotoPageFragment;

    move-result-object p1

    const-string p2, "PhotoPageFragment"

    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v1, v0}, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->startFragment(Landroid/app/Fragment;Ljava/lang/String;ZZ)V

    :cond_1
    return-void

    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->finish()V

    invoke-direct {p0}, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->startMainActivity()V

    return-void
.end method

.method protected onResume()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/activity/BaseActivity;->onResume()V

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/ImageLoader;->resume()V

    iget-object v0, p0, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->mBrightnessManager:Lcom/miui/gallery/view/BrightnessManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->mBrightnessManager:Lcom/miui/gallery/view/BrightnessManager;

    invoke-virtual {v0}, Lcom/miui/gallery/view/BrightnessManager;->onResume()V

    :cond_0
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->setScreenEffect(Z)V

    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/activity/BaseActivity;->onWindowFocusChanged(Z)V

    iget-object v0, p0, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->mBrightnessManager:Lcom/miui/gallery/view/BrightnessManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;->mBrightnessManager:Lcom/miui/gallery/view/BrightnessManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/view/BrightnessManager;->onWindowFocusChanged(Z)V

    :cond_0
    return-void
.end method
