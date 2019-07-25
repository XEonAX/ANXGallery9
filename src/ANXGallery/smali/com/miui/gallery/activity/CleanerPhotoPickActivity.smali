.class public Lcom/miui/gallery/activity/CleanerPhotoPickActivity;
.super Lcom/miui/gallery/activity/BaseActivity;
.source "CleanerPhotoPickActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/activity/BaseActivity;-><init>()V

    return-void
.end method

.method private startFragmentByType(I)V
    .locals 3

    const/4 v0, 0x1

    const/4 v1, 0x0

    packed-switch p1, :pswitch_data_0

    return-void

    :pswitch_0
    invoke-virtual {p0}, Lcom/miui/gallery/activity/CleanerPhotoPickActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    const-string v2, "SimilarPhotoPickFragment"

    invoke-virtual {p1, v2}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object p1

    if-nez p1, :cond_0

    new-instance p1, Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    invoke-direct {p1}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment;-><init>()V

    const-string v2, "SimilarPhotoPickFragment"

    invoke-virtual {p0, p1, v2, v1, v0}, Lcom/miui/gallery/activity/CleanerPhotoPickActivity;->startFragment(Landroid/app/Fragment;Ljava/lang/String;ZZ)V

    goto :goto_0

    :pswitch_1
    invoke-virtual {p0}, Lcom/miui/gallery/activity/CleanerPhotoPickActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    const-string v2, "VideoResultPickFragment"

    invoke-virtual {p1, v2}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object p1

    if-nez p1, :cond_0

    new-instance p1, Lcom/miui/gallery/ui/VideoResultPickFragment;

    invoke-direct {p1}, Lcom/miui/gallery/ui/VideoResultPickFragment;-><init>()V

    const-string v2, "VideoResultPickFragment"

    invoke-virtual {p0, p1, v2, v1, v0}, Lcom/miui/gallery/activity/CleanerPhotoPickActivity;->startFragment(Landroid/app/Fragment;Ljava/lang/String;ZZ)V

    goto :goto_0

    :pswitch_2
    invoke-virtual {p0}, Lcom/miui/gallery/activity/CleanerPhotoPickActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    const-string v2, "ScreenshotPhotoPickFragment"

    invoke-virtual {p1, v2}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object p1

    if-nez p1, :cond_0

    new-instance p1, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;

    invoke-direct {p1}, Lcom/miui/gallery/ui/ScreenshotPhotoPickFragment;-><init>()V

    const-string v2, "ScreenshotPhotoPickFragment"

    invoke-virtual {p0, p1, v2, v1, v0}, Lcom/miui/gallery/activity/CleanerPhotoPickActivity;->startFragment(Landroid/app/Fragment;Ljava/lang/String;ZZ)V

    goto :goto_0

    :pswitch_3
    invoke-virtual {p0}, Lcom/miui/gallery/activity/CleanerPhotoPickActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    const-string v2, "SlimPhotoPickFragment"

    invoke-virtual {p1, v2}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object p1

    if-nez p1, :cond_0

    new-instance p1, Lcom/miui/gallery/ui/SlimPhotoPickFragment;

    invoke-direct {p1}, Lcom/miui/gallery/ui/SlimPhotoPickFragment;-><init>()V

    const-string v2, "SlimPhotoPickFragment"

    invoke-virtual {p0, p1, v2, v1, v0}, Lcom/miui/gallery/activity/CleanerPhotoPickActivity;->startFragment(Landroid/app/Fragment;Ljava/lang/String;ZZ)V

    :cond_0
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method protected getFragmentContainerId()I
    .locals 1

    const v0, 0x1020002

    return v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/miui/gallery/activity/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/activity/CleanerPhotoPickActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "extra_cleaner_photo_pick_type"

    const/4 v1, -0x1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/activity/CleanerPhotoPickActivity;->startFragmentByType(I)V

    iget-object p1, p0, Lcom/miui/gallery/activity/CleanerPhotoPickActivity;->mActionBar:Lmiui/app/ActionBar;

    const v0, 0x7f0b0046

    invoke-virtual {p1, v0}, Lmiui/app/ActionBar;->setCustomView(I)V

    iget-object p1, p0, Lcom/miui/gallery/activity/CleanerPhotoPickActivity;->mActionBar:Lmiui/app/ActionBar;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lmiui/app/ActionBar;->setDisplayShowCustomEnabled(Z)V

    return-void
.end method
