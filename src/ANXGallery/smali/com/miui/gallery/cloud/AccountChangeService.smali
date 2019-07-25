.class public Lcom/miui/gallery/cloud/AccountChangeService;
.super Lcom/miui/gallery/service/IntentServiceBase;
.source "AccountChangeService.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/service/IntentServiceBase;-><init>()V

    return-void
.end method


# virtual methods
.method protected getNotification()Landroid/app/Notification;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/AccountChangeService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/NotificationHelper;->getEmptyNotification(Landroid/content/Context;)Landroid/app/Notification;

    move-result-object v0

    return-object v0
.end method

.method protected getNotificationId()I
    .locals 1

    const/16 v0, 0xa

    return v0
.end method

.method protected onHandleIntent(Landroid/content/Intent;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/miui/gallery/service/IntentServiceBase;->onHandleIntent(Landroid/content/Intent;)V

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "delete_account"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v0, "extra_account"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/accounts/Account;

    const-string v1, "extra_wipe_data"

    const/4 v2, 0x1

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v2, 0x2

    :cond_0
    const/4 p1, 0x0

    invoke-static {p1, v0, v2, p1}, Lcom/miui/gallery/cloud/DeleteAccount;->deleteAccountInTask(Landroid/app/Activity;Landroid/accounts/Account;ILcom/miui/gallery/cloud/DeleteAccount$DeleteAccountListener;)V

    goto :goto_0

    :cond_1
    const-string v1, "add_account"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "extra_account"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/accounts/Account;

    invoke-static {p0, p1}, Lcom/miui/gallery/cloud/AddAccount;->onAddAccount(Landroid/content/Context;Landroid/accounts/Account;)V

    :cond_2
    :goto_0
    return-void
.end method
