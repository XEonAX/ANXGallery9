.class public Lcom/miui/gallery/ui/JumpDialogFragment;
.super Lcom/miui/gallery/widget/GalleryDialogFragment;
.source "JumpDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/JumpDialogFragment$PeopleJumpHelper;,
        Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;,
        Lcom/miui/gallery/ui/JumpDialogFragment$HandleIntentCallback;
    }
.end annotation


# instance fields
.field private mDelayVisibleRunnable:Ljava/lang/Runnable;

.field private mHandleIntentCallback:Lcom/miui/gallery/ui/JumpDialogFragment$HandleIntentCallback;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;-><init>()V

    new-instance v0, Lcom/miui/gallery/ui/JumpDialogFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/JumpDialogFragment$1;-><init>(Lcom/miui/gallery/ui/JumpDialogFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/JumpDialogFragment;->mHandleIntentCallback:Lcom/miui/gallery/ui/JumpDialogFragment$HandleIntentCallback;

    new-instance v0, Lcom/miui/gallery/ui/JumpDialogFragment$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/JumpDialogFragment$2;-><init>(Lcom/miui/gallery/ui/JumpDialogFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/JumpDialogFragment;->mDelayVisibleRunnable:Ljava/lang/Runnable;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/JumpDialogFragment;Landroid/app/Dialog;F)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/JumpDialogFragment;->setDialogAlpha(Landroid/app/Dialog;F)V

    return-void
.end method

.method public static enterPrivateAlbum(Landroid/app/Activity;)V
    .locals 4

    new-instance v0, Lcom/miui/gallery/ui/JumpDialogFragment;

    invoke-direct {v0}, Lcom/miui/gallery/ui/JumpDialogFragment;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "pageType"

    const/4 v3, 0x2

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/JumpDialogFragment;->setArguments(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p0

    const-string v1, "JumpDialogFragment"

    invoke-virtual {v0, p0, v1}, Lcom/miui/gallery/ui/JumpDialogFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method private setDialogAlpha(Landroid/app/Dialog;F)V
    .locals 1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    iput p2, v0, Landroid/view/WindowManager$LayoutParams;->alpha:F

    invoke-virtual {p1}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method public static showAlbumPage(Landroid/app/Activity;Landroid/net/Uri;)V
    .locals 3

    new-instance v0, Lcom/miui/gallery/ui/JumpDialogFragment;

    invoke-direct {v0}, Lcom/miui/gallery/ui/JumpDialogFragment;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "uri"

    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string p1, "pageType"

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/JumpDialogFragment;->setArguments(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p0

    const-string p1, "JumpDialogFragment"

    invoke-virtual {v0, p0, p1}, Lcom/miui/gallery/ui/JumpDialogFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method public static showPeoplePage(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 3

    new-instance v0, Lcom/miui/gallery/ui/JumpDialogFragment;

    invoke-direct {v0}, Lcom/miui/gallery/ui/JumpDialogFragment;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "serverId"

    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "pageType"

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/JumpDialogFragment;->setArguments(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p0

    const-string p1, "JumpDialogFragment"

    invoke-virtual {v0, p0, p1}, Lcom/miui/gallery/ui/JumpDialogFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onActivityCreated(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/JumpDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "pageType"

    const/4 v1, -0x1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result p1

    packed-switch p1, :pswitch_data_0

    const-string v0, "JumpDialogFragment"

    const-string v1, "Invalid page type %d"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/JumpDialogFragment;->dismiss()V

    goto :goto_0

    :pswitch_0
    const-string p1, "JumpDialogFragment"

    const-string v0, "Jump secret album"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    const-string v0, "cloud_guide_source"

    sget-object v1, Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;->SECRET:Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    invoke-static {p0, p1}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->checkLoginAndSyncState(Landroid/app/Fragment;Landroid/os/Bundle;)V

    goto :goto_0

    :pswitch_1
    const-string p1, "JumpDialogFragment"

    const-string v0, "Jump to people page, people serverId = %s"

    invoke-virtual {p0}, Lcom/miui/gallery/ui/JumpDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "serverId"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance p1, Lcom/miui/gallery/ui/JumpDialogFragment$PeopleJumpHelper;

    invoke-direct {p1, p0, p0}, Lcom/miui/gallery/ui/JumpDialogFragment$PeopleJumpHelper;-><init>(Lcom/miui/gallery/ui/JumpDialogFragment;Landroid/app/Fragment;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/JumpDialogFragment;->mHandleIntentCallback:Lcom/miui/gallery/ui/JumpDialogFragment$HandleIntentCallback;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/JumpDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "serverId"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/ui/JumpDialogFragment$PeopleJumpHelper;->startLoading(Lcom/miui/gallery/ui/JumpDialogFragment$HandleIntentCallback;Ljava/lang/String;)V

    goto :goto_0

    :pswitch_2
    const-string p1, "JumpDialogFragment"

    const-string v0, "Jump to album page, album serverId = %s"

    invoke-virtual {p0}, Lcom/miui/gallery/ui/JumpDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "serverId"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance p1, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;

    invoke-direct {p1, p0, p0}, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;-><init>(Lcom/miui/gallery/ui/JumpDialogFragment;Landroid/app/Fragment;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/JumpDialogFragment;->mHandleIntentCallback:Lcom/miui/gallery/ui/JumpDialogFragment$HandleIntentCallback;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/JumpDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "uri"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/net/Uri;

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->startLoading(Lcom/miui/gallery/ui/JumpDialogFragment$HandleIntentCallback;Landroid/net/Uri;)V

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, -0x1

    if-ne p2, v1, :cond_2

    const/16 v1, 0x1d

    if-eq p1, v1, :cond_1

    const/16 v1, 0x24

    if-eq p1, v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/JumpDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/util/IntentUtil;->enterPrivateAlbum(Landroid/content/Context;)V

    iget-object v1, p0, Lcom/miui/gallery/ui/JumpDialogFragment;->mHandleIntentCallback:Lcom/miui/gallery/ui/JumpDialogFragment$HandleIntentCallback;

    invoke-interface {v1, v0}, Lcom/miui/gallery/ui/JumpDialogFragment$HandleIntentCallback;->onHandleIntent(Landroid/content/Intent;)V

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/ui/JumpDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/account/AccountHelper;->getXiaomiAccount(Landroid/content/Context;)Landroid/accounts/Account;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-static {p0}, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;->startAuthenticatePrivacyPassword(Landroid/app/Fragment;)V

    goto :goto_0

    :cond_2
    iget-object v1, p0, Lcom/miui/gallery/ui/JumpDialogFragment;->mHandleIntentCallback:Lcom/miui/gallery/ui/JumpDialogFragment$HandleIntentCallback;

    invoke-interface {v1, v0}, Lcom/miui/gallery/ui/JumpDialogFragment$HandleIntentCallback;->onHandleIntent(Landroid/content/Intent;)V

    :cond_3
    :goto_0
    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onActivityResult(IILandroid/content/Intent;)V

    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/ui/JumpDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    const-string v0, ""

    invoke-virtual {p0}, Lcom/miui/gallery/ui/JumpDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const v2, 0x7f10044b

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {p1, v0, v1, v3, v2}, Lmiui/app/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZZ)Lmiui/app/ProgressDialog;

    move-result-object p1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/JumpDialogFragment;->setDialogAlpha(Landroid/app/Dialog;F)V

    invoke-virtual {p0, v2}, Lcom/miui/gallery/ui/JumpDialogFragment;->setCancelable(Z)V

    return-object p1
.end method

.method public onStart()V
    .locals 4

    invoke-super {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onStart()V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/JumpDialogFragment;->mDelayVisibleRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/JumpDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x10e0002

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/internal/CompatHandler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public onStop()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onStop()V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/JumpDialogFragment;->mDelayVisibleRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void
.end method
