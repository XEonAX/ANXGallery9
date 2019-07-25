.class public Lcom/miui/gallery/cloud/MiCloudStatusInfoReceiver;
.super Landroid/content/BroadcastReceiver;
.source "MiCloudStatusInfoReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method public static handleSpaceFull(Landroid/content/Context;Landroid/accounts/Account;)V
    .locals 3

    const-string v0, "account"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/accounts/AccountManager;

    const-string v0, "extra_micloud_status_info_quota"

    invoke-virtual {p0, p1, v0}, Landroid/accounts/AccountManager;->getUserData(Landroid/accounts/Account;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Lmiui/cloud/sync/MiCloudStatusInfo;

    iget-object p1, p1, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-direct {v0, p1}, Lmiui/cloud/sync/MiCloudStatusInfo;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Lmiui/cloud/sync/MiCloudStatusInfo;->parseQuotaString(Ljava/lang/String;)V

    invoke-virtual {v0}, Lmiui/cloud/sync/MiCloudStatusInfo;->getQuotaInfo()Lmiui/cloud/sync/MiCloudStatusInfo$QuotaInfo;

    move-result-object p0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lmiui/cloud/sync/MiCloudStatusInfo$QuotaInfo;->getTotal()J

    move-result-wide v0

    invoke-virtual {p0}, Lmiui/cloud/sync/MiCloudStatusInfo$QuotaInfo;->getUsed()J

    move-result-wide p0

    sub-long/2addr v0, p0

    const-wide/32 p0, 0x1400000

    cmp-long v2, v0, p0

    if-ltz v2, :cond_0

    invoke-static {}, Lcom/miui/gallery/cloud/SpaceFullHandler;->removeOwnerSpaceFull()V

    :cond_0
    return-void
.end method

.method private handleSpaceFullIfNeeded(Landroid/content/Context;)V
    .locals 1

    invoke-static {}, Lcom/miui/gallery/cloud/SpaceFullHandler;->isOwnerSpaceFull()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {p1}, Lcom/miui/account/AccountHelper;->getXiaomiAccount(Landroid/content/Context;)Landroid/accounts/Account;

    move-result-object v0

    if-nez v0, :cond_1

    return-void

    :cond_1
    invoke-static {p1, v0}, Lcom/miui/gallery/cloud/MiCloudStatusInfoReceiver;->handleSpaceFull(Landroid/content/Context;Landroid/accounts/Account;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p2

    const-string v0, "com.xiaomi.action.MICLOUD_STATUS_INFO_CHANGED"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/MiCloudStatusInfoReceiver;->handleSpaceFullIfNeeded(Landroid/content/Context;)V

    :cond_0
    return-void
.end method
