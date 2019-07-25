.class public Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;
.super Landroid/app/Fragment;
.source "LoginAndSyncCheckFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# instance fields
.field private mCheckGallerySync:Z

.field private mCheckingType:I

.field private mDialog:Landroid/app/Dialog;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/app/Fragment;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->mCheckingType:I

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->setResult(I)V

    return-void
.end method

.method private checkGallerySync()V
    .locals 7

    const/4 v0, 0x3

    iput v0, p0, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->mCheckingType:I

    new-instance v5, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment$3;

    invoke-direct {v5, p0}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment$3;-><init>(Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;)V

    new-instance v6, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment$4;

    invoke-direct {v6, p0}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment$4;-><init>(Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;)V

    const v2, 0x7f1006f3

    const v3, 0x7f1006f0

    const v4, 0x7f1006f2

    move-object v1, p0

    invoke-direct/range {v1 .. v6}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->showDialog(IIILandroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;)V

    return-void
.end method

.method private checkLogin()V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/IntentUtil;->guideToLoginXiaomiAccount(Landroid/content/Context;Landroid/os/Bundle;)V

    const/4 v0, 0x1

    iput v0, p0, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->mCheckingType:I

    return-void
.end method

.method public static checkLoginAndSyncState(Landroid/app/Fragment;Landroid/os/Bundle;)V
    .locals 1

    invoke-virtual {p0}, Landroid/app/Fragment;->getChildFragmentManager()Landroid/app/FragmentManager;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object p0

    new-instance v0, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;

    invoke-direct {v0}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;-><init>()V

    invoke-virtual {v0, p1}, Landroid/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    const-string p1, "LoginAndSyncCheckFragment"

    invoke-virtual {p0, v0, p1}, Landroid/app/FragmentTransaction;->add(Landroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    invoke-virtual {p0}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I

    return-void
.end method

.method private checkSystemSync()V
    .locals 7

    const/4 v0, 0x2

    iput v0, p0, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->mCheckingType:I

    new-instance v5, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment$1;

    invoke-direct {v5, p0}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment$1;-><init>(Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;)V

    new-instance v6, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment$2;

    invoke-direct {v6, p0}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment$2;-><init>(Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;)V

    const v2, 0x7f1006f3

    const v3, 0x7f1006f1

    const v4, 0x7f1006f2

    move-object v1, p0

    invoke-direct/range {v1 .. v6}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->showDialog(IIILandroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;)V

    return-void
.end method

.method private doCheck()V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/SyncUtil;->existXiaomiAccount(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->checkLogin()V

    goto :goto_0

    :cond_0
    invoke-static {}, Landroid/content/ContentResolver;->getMasterSyncAutomatically()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->checkSystemSync()V

    goto :goto_0

    :cond_1
    iget-boolean v0, p0, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->mCheckGallerySync:Z

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/SyncUtil;->isGalleryCloudSyncable(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-direct {p0}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->checkGallerySync()V

    goto :goto_0

    :cond_2
    const/4 v0, -0x1

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->setResult(I)V

    :goto_0
    return-void
.end method

.method private setResult(I)V
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->getParentFragment()Landroid/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_1

    const/16 v1, 0x1d

    invoke-virtual {p0}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    if-eqz v2, :cond_0

    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    move-result-object v2

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    invoke-virtual {v0, v1, p1, v2}, Landroid/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/app/FragmentTransaction;->remove(Landroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I

    return-void
.end method

.method private showDialog(IIILandroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->mDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->mDialog:Landroid/app/Dialog;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    :cond_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1, p3, p4}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    const/high16 p2, 0x1040000

    invoke-virtual {p1, p2, p5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->mDialog:Landroid/app/Dialog;

    iget-object p1, p0, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->mDialog:Landroid/app/Dialog;

    invoke-virtual {p1, p0}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->mDialog:Landroid/app/Dialog;

    invoke-virtual {p1}, Landroid/app/Dialog;->show()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 2

    iget p1, p0, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->mCheckingType:I

    const/4 v0, 0x0

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    const v1, 0x7f100401

    invoke-static {p1, v1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->setResult(I)V

    goto :goto_0

    :pswitch_1
    invoke-virtual {p0}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    const v1, 0x7f1006c3

    invoke-static {p1, v1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->setResult(I)V

    goto :goto_1

    :goto_0
    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->setResult(I)V

    :goto_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const/4 p2, 0x0

    iput p2, p0, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->mCheckingType:I

    if-eqz p1, :cond_0

    const-string p3, "key_check_gallery_sync"

    invoke-virtual {p1, p3, p2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p2

    :cond_0
    iput-boolean p2, p0, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->mCheckGallerySync:Z

    new-instance p1, Landroid/view/View;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    invoke-direct {p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    return-object p1
.end method

.method public onDestroy()V
    .locals 2

    invoke-super {p0}, Landroid/app/Fragment;->onDestroy()V

    iget-object v0, p0, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->mDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->mDialog:Landroid/app/Dialog;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->mDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    :cond_0
    const-string v0, "LoginAndSyncCheckFragment"

    const-string v1, "onDestroy"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onStart()V
    .locals 3

    invoke-super {p0}, Landroid/app/Fragment;->onStart()V

    iget v0, p0, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->mCheckingType:I

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->setResult(I)V

    goto :goto_0

    :pswitch_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/SyncUtil;->isGalleryCloudSyncable(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v2, 0x7f100401

    invoke-static {v0, v2}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->setResult(I)V

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->doCheck()V

    goto :goto_0

    :pswitch_1
    invoke-static {}, Landroid/content/ContentResolver;->getMasterSyncAutomatically()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v2, 0x7f1006c3

    invoke-static {v0, v2}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->setResult(I)V

    goto :goto_0

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->doCheck()V

    goto :goto_0

    :pswitch_2
    invoke-virtual {p0}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/SyncUtil;->existXiaomiAccount(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v2, 0x7f100785

    invoke-static {v0, v2}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->setResult(I)V

    goto :goto_0

    :cond_2
    invoke-direct {p0}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->doCheck()V

    goto :goto_0

    :pswitch_3
    invoke-direct {p0}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->doCheck()V

    :goto_0
    const-string v0, "LoginAndSyncCheckFragment"

    const-string v1, "onStart isCheckPending %d"

    iget v2, p0, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->mCheckingType:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
