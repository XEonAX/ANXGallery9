.class public Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;
.super Landroid/app/Fragment;
.source "AuthenticatePrivacyPasswordFragment.java"


# instance fields
.field private mActivity:Landroid/app/Activity;

.field private mChooseLockSettingsHelper:Lcom/miui/privacy/LockSettingsHelper;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;->authenticatePrivacyPassword()V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;->setResult(I)V

    return-void
.end method

.method private authenticatePrivacyPassword()V
    .locals 10

    iget-object v0, p0, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;->mChooseLockSettingsHelper:Lcom/miui/privacy/LockSettingsHelper;

    invoke-virtual {v0}, Lcom/miui/privacy/LockSettingsHelper;->isPrivacyPasswordEnabled()Z

    move-result v0

    const v1, 0x7f1004c3

    const v2, 0x7f1000d6

    const/4 v3, 0x0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Secret;->isFirstUsePrivacyPassword()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;->mActivity:Landroid/app/Activity;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {v3}, Lcom/miui/gallery/preference/GalleryPreferences$Secret;->setIsFirstUsePrivacyPassword(Z)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v4

    const v3, 0x7f100648

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    const v3, 0x7f100647

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    new-instance v9, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment$2;

    invoke-direct {v9, p0}, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment$2;-><init>(Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;)V

    invoke-static/range {v4 .. v9}, Lcom/miui/gallery/ui/ConfirmDialog;->showConfirmDialog(Landroid/app/FragmentManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/ui/ConfirmDialog$ConfirmDialogInterface;)V

    goto :goto_0

    :cond_0
    const/16 v0, 0x1b

    invoke-static {p0, v0}, Lcom/miui/privacy/LockSettingsHelper;->startAuthenticatePasswordActivity(Landroid/app/Fragment;I)V

    goto :goto_0

    :cond_1
    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Secret;->isFirstUsePrivacyPassword()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;->mActivity:Landroid/app/Activity;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {v3}, Lcom/miui/gallery/preference/GalleryPreferences$Secret;->setIsFirstUsePrivacyPassword(Z)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v4

    const v3, 0x7f10064f

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    const v3, 0x7f10064d

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    new-instance v9, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment$3;

    invoke-direct {v9, p0}, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment$3;-><init>(Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;)V

    invoke-static/range {v4 .. v9}, Lcom/miui/gallery/ui/ConfirmDialog;->showConfirmDialog(Landroid/app/FragmentManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/ui/ConfirmDialog$ConfirmDialogInterface;)V

    goto :goto_0

    :cond_2
    const/16 v0, 0x1c

    invoke-static {p0, v0}, Lcom/miui/privacy/LockSettingsHelper;->startSetPrivacyPasswordActivity(Landroid/app/Fragment;I)V

    :cond_3
    :goto_0
    return-void
.end method

.method private setResult(I)V
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;->getParentFragment()Landroid/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_1

    const/16 v1, 0x24

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    if-eqz v2, :cond_0

    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    move-result-object v2

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    invoke-virtual {v0, v1, p1, v2}, Landroid/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/app/FragmentTransaction;->remove(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I

    return-void
.end method

.method private showPasswordUpdateDialog()V
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;->mActivity:Landroid/app/Activity;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v1}, Lcom/miui/gallery/preference/GalleryPreferences$Secret;->setIsFirstUsePrivacyPassword(Z)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v2

    iget-object v1, p0, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;->mChooseLockSettingsHelper:Lcom/miui/privacy/LockSettingsHelper;

    invoke-virtual {v1}, Lcom/miui/privacy/LockSettingsHelper;->isPrivacyPasswordEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    const v1, 0x7f10064a

    goto :goto_0

    :cond_0
    const v1, 0x7f10064c

    :goto_0
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    iget-object v1, p0, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;->mChooseLockSettingsHelper:Lcom/miui/privacy/LockSettingsHelper;

    invoke-virtual {v1}, Lcom/miui/privacy/LockSettingsHelper;->isPrivacyPasswordEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    const v1, 0x7f100649

    goto :goto_1

    :cond_1
    const v1, 0x7f10064b

    :goto_1
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    const v1, 0x7f1000d6

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    const v1, 0x7f1004c3

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    new-instance v7, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment$1;

    invoke-direct {v7, p0}, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment$1;-><init>(Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;)V

    invoke-static/range {v2 .. v7}, Lcom/miui/gallery/ui/ConfirmDialog;->showConfirmDialog(Landroid/app/FragmentManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/ui/ConfirmDialog$ConfirmDialogInterface;)V

    :cond_2
    return-void
.end method

.method public static startAuthenticatePrivacyPassword(Landroid/app/Fragment;)V
    .locals 2

    invoke-virtual {p0}, Landroid/app/Fragment;->getChildFragmentManager()Landroid/app/FragmentManager;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object p0

    new-instance v0, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;

    invoke-direct {v0}, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;-><init>()V

    const-string v1, "AuthenticatePrivacyPassword"

    invoke-virtual {p0, v0, v1}, Landroid/app/FragmentTransaction;->add(Landroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    invoke-virtual {p0}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I

    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    const/4 p3, 0x0

    const/4 v0, -0x1

    if-ne p2, v0, :cond_1

    const/16 p2, 0x23

    if-eq p1, p2, :cond_0

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;->setResult(I)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;->mChooseLockSettingsHelper:Lcom/miui/privacy/LockSettingsHelper;

    invoke-virtual {p1, p3}, Lcom/miui/privacy/LockSettingsHelper;->setPrivateGalleryEnabled(Z)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;->showPasswordUpdateDialog()V

    goto :goto_0

    :cond_1
    invoke-direct {p0, p3}, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;->setResult(I)V

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1b
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;->mActivity:Landroid/app/Activity;

    iget-object p1, p0, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;->mChooseLockSettingsHelper:Lcom/miui/privacy/LockSettingsHelper;

    if-nez p1, :cond_0

    new-instance p1, Lcom/miui/privacy/LockSettingsHelper;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/miui/privacy/LockSettingsHelper;-><init>(Landroid/app/Activity;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;->mChooseLockSettingsHelper:Lcom/miui/privacy/LockSettingsHelper;

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;->mChooseLockSettingsHelper:Lcom/miui/privacy/LockSettingsHelper;

    invoke-virtual {p1}, Lcom/miui/privacy/LockSettingsHelper;->isPrivateGalleryEnabled()Z

    move-result p1

    if-eqz p1, :cond_1

    const/16 p1, 0x23

    invoke-static {p0, p1}, Lcom/miui/privacy/LockSettingsHelper;->confirmPrivateGalleryPassword(Landroid/app/Fragment;I)V

    goto :goto_0

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;->authenticatePrivacyPassword()V

    :goto_0
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 0

    new-instance p1, Landroid/view/View;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    invoke-direct {p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    return-object p1
.end method

.method public onDestroy()V
    .locals 0

    invoke-super {p0}, Landroid/app/Fragment;->onDestroy()V

    return-void
.end method

.method public onStart()V
    .locals 0

    invoke-super {p0}, Landroid/app/Fragment;->onStart()V

    return-void
.end method
