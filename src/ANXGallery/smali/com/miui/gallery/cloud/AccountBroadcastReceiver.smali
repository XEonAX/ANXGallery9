.class public Lcom/miui/gallery/cloud/AccountBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "AccountBroadcastReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4

    const-string v0, "AccountBroadcastReceiver"

    const-string v1, "onReceive broadcast"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.accounts.LOGIN_ACCOUNTS_PRE_CHANGED"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, -0x1

    if-eqz v1, :cond_4

    const-string v0, "extra_account"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/accounts/Account;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/util/deviceprovider/ApplicationHelper;->getIntentProvider()Lcom/miui/gallery/util/deviceprovider/IntentProviderInterface;

    move-result-object v1

    invoke-interface {v1}, Lcom/miui/gallery/util/deviceprovider/IntentProviderInterface;->getXiaomiAccountType()Ljava/lang/String;

    move-result-object v1

    iget-object v3, v0, Landroid/accounts/Account;->type:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/miui/gallery/cloud/GalleryCloudUtils;->resetAccountCache()V

    if-nez v0, :cond_1

    return-void

    :cond_1
    invoke-static {}, Lcom/miui/gallery/request/HostManager;->clearCookies()V

    const-string v1, "extra_update_type"

    invoke-virtual {p2, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_2

    return-void

    :cond_2
    const-string v1, "extra_bundle"

    invoke-virtual {p2, v1}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p2

    if-eqz p2, :cond_3

    const-string v1, "extra_wipe_data"

    invoke-virtual {p2, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    const-string v1, "extra_wipe_data"

    invoke-virtual {p2, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    :cond_3
    new-instance p2, Landroid/content/Intent;

    const-class v1, Lcom/miui/gallery/cloud/AccountChangeService;

    invoke-direct {p2, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "delete_account"

    invoke-virtual {p2, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "extra_account"

    invoke-virtual {p2, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const-string v0, "extra_wipe_data"

    invoke-virtual {p2, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-static {p1, p2}, Lcom/miui/gallery/util/BackgroundServiceHelper;->startForegroundServiceIfNeed(Landroid/content/Context;Landroid/content/Intent;)V

    goto :goto_1

    :cond_4
    const-string v1, "android.accounts.LOGIN_ACCOUNTS_POST_CHANGED"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    const-string v0, "extra_account"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/accounts/Account;

    if-eqz v0, :cond_6

    invoke-static {}, Lcom/miui/gallery/util/deviceprovider/ApplicationHelper;->getIntentProvider()Lcom/miui/gallery/util/deviceprovider/IntentProviderInterface;

    move-result-object v1

    invoke-interface {v1}, Lcom/miui/gallery/util/deviceprovider/IntentProviderInterface;->getXiaomiAccountType()Ljava/lang/String;

    move-result-object v1

    iget-object v3, v0, Landroid/accounts/Account;->type:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    const/4 v1, 0x2

    const-string v3, "extra_update_type"

    invoke-virtual {p2, v3, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p2

    if-eq v1, p2, :cond_5

    goto :goto_0

    :cond_5
    new-instance p2, Landroid/content/Intent;

    const-class v1, Lcom/miui/gallery/cloud/AccountChangeService;

    invoke-direct {p2, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "add_account"

    invoke-virtual {p2, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "extra_account"

    invoke-virtual {p2, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    invoke-static {p1, p2}, Lcom/miui/gallery/util/BackgroundServiceHelper;->startForegroundServiceIfNeed(Landroid/content/Context;Landroid/content/Intent;)V

    goto :goto_1

    :cond_6
    :goto_0
    return-void

    :cond_7
    :goto_1
    return-void
.end method
