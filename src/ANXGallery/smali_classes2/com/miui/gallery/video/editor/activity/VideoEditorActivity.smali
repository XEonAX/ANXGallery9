.class public Lcom/miui/gallery/video/editor/activity/VideoEditorActivity;
.super Lcom/miui/gallery/activity/BaseActivity;
.source "VideoEditorActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/video/editor/activity/VideoEditorActivity$OnBackPressedListener;
    }
.end annotation


# instance fields
.field private mBrightnessManager:Lcom/miui/gallery/view/BrightnessManager;

.field private mOnBackPressedListener:Lcom/miui/gallery/video/editor/activity/VideoEditorActivity$OnBackPressedListener;

.field private mVideoEditorFragment:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/activity/BaseActivity;-><init>()V

    return-void
.end method

.method private initScreenBrightness()V
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/activity/VideoEditorActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_1

    const-string v1, "photo-brightness-manual"

    const/high16 v2, -0x40800000    # -1.0f

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getFloatExtra(Ljava/lang/String;F)F

    move-result v1

    const-string v3, "photo-brightness-auto"

    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->getFloatExtra(Ljava/lang/String;F)F

    move-result v0

    const/4 v2, 0x0

    cmpl-float v3, v1, v2

    if-gez v3, :cond_0

    cmpl-float v2, v0, v2

    if-ltz v2, :cond_1

    :cond_0
    new-instance v2, Lcom/miui/gallery/view/BrightnessManager;

    invoke-direct {v2, p0, v1, v0}, Lcom/miui/gallery/view/BrightnessManager;-><init>(Landroid/app/Activity;FF)V

    iput-object v2, p0, Lcom/miui/gallery/video/editor/activity/VideoEditorActivity;->mBrightnessManager:Lcom/miui/gallery/view/BrightnessManager;

    :cond_1
    return-void
.end method

.method private initView()V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/activity/VideoEditorActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x400

    invoke-virtual {v0, v1, v1}, Landroid/view/Window;->setFlags(II)V

    const v0, 0x7f0b0006

    invoke-virtual {p0, v0}, Lcom/miui/gallery/video/editor/activity/VideoEditorActivity;->setContentView(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/activity/VideoEditorActivity;->loadVideoEditorFragment()V

    return-void
.end method


# virtual methods
.method protected hasCustomContentView()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public loadVideoEditorFragment()V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/activity/VideoEditorActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-direct {v0}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/activity/VideoEditorActivity;->mVideoEditorFragment:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/activity/VideoEditorActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v0

    const v1, 0x7f09032a

    iget-object v2, p0, Lcom/miui/gallery/video/editor/activity/VideoEditorActivity;->mVideoEditorFragment:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-virtual {v0, v1, v2}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I

    :cond_0
    return-void
.end method

.method public onAttachFragment(Landroid/app/Fragment;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/activity/BaseActivity;->onAttachFragment(Landroid/app/Fragment;)V

    instance-of v0, p1, Lcom/miui/gallery/video/editor/ui/MenuFragment;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/activity/VideoEditorActivity;->mVideoEditorFragment:Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/video/editor/ui/VideoEditorFragment;->onAttachMenuFragment(Landroid/app/Fragment;)V

    :cond_0
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 1

    invoke-static {p0}, Lcom/android/internal/WindowCompat;->isNotch(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/activity/VideoEditorActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/SystemUiUtil;->extendToStatusBar(Landroid/view/View;)V

    :cond_0
    return-void
.end method

.method public onBackPressed()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/activity/VideoEditorActivity;->mOnBackPressedListener:Lcom/miui/gallery/video/editor/activity/VideoEditorActivity$OnBackPressedListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/activity/VideoEditorActivity;->mOnBackPressedListener:Lcom/miui/gallery/video/editor/activity/VideoEditorActivity$OnBackPressedListener;

    invoke-interface {v0}, Lcom/miui/gallery/video/editor/activity/VideoEditorActivity$OnBackPressedListener;->onBackPressed()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    invoke-super {p0}, Lcom/miui/gallery/activity/BaseActivity;->onBackPressed()V

    :cond_1
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 0

    const/4 p1, 0x0

    invoke-super {p0, p1}, Lcom/miui/gallery/activity/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/activity/VideoEditorActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-static {p1}, Lcom/android/internal/WindowCompat;->setCutoutModeShortEdges(Landroid/view/Window;)V

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/activity/VideoEditorActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/SystemUiUtil;->setDrawSystemBarBackground(Landroid/view/Window;)V

    invoke-static {p0}, Lcom/miui/gallery/video/editor/config/VideoEditorConfig;->init(Landroid/content/Context;)V

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/activity/VideoEditorActivity;->initView()V

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/activity/VideoEditorActivity;->initScreenBrightness()V

    return-void
.end method

.method protected onPause()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/activity/BaseActivity;->onPause()V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/activity/VideoEditorActivity;->mBrightnessManager:Lcom/miui/gallery/view/BrightnessManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/activity/VideoEditorActivity;->mBrightnessManager:Lcom/miui/gallery/view/BrightnessManager;

    invoke-virtual {v0}, Lcom/miui/gallery/view/BrightnessManager;->onPause()V

    :cond_0
    return-void
.end method

.method protected onResume()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/activity/BaseActivity;->onResume()V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/activity/VideoEditorActivity;->mBrightnessManager:Lcom/miui/gallery/view/BrightnessManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/activity/VideoEditorActivity;->mBrightnessManager:Lcom/miui/gallery/view/BrightnessManager;

    invoke-virtual {v0}, Lcom/miui/gallery/view/BrightnessManager;->onResume()V

    :cond_0
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/activity/BaseActivity;->onWindowFocusChanged(Z)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/activity/VideoEditorActivity;->mBrightnessManager:Lcom/miui/gallery/view/BrightnessManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/activity/VideoEditorActivity;->mBrightnessManager:Lcom/miui/gallery/view/BrightnessManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/view/BrightnessManager;->onWindowFocusChanged(Z)V

    :cond_0
    return-void
.end method

.method public setOnBackPressedListener(Lcom/miui/gallery/video/editor/activity/VideoEditorActivity$OnBackPressedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/activity/VideoEditorActivity;->mOnBackPressedListener:Lcom/miui/gallery/video/editor/activity/VideoEditorActivity$OnBackPressedListener;

    return-void
.end method
