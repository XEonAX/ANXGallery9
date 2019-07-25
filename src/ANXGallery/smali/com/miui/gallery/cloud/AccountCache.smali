.class public Lcom/miui/gallery/cloud/AccountCache;
.super Ljava/lang/Object;
.source "AccountCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/cloud/AccountCache$AccountInfo;
    }
.end annotation


# static fields
.field private static sAccountInfo:Lcom/miui/gallery/cloud/AccountCache$AccountInfo;


# direct methods
.method public static declared-synchronized getAccount()Landroid/accounts/Account;
    .locals 2

    const-class v0, Lcom/miui/gallery/cloud/AccountCache;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/cloud/AccountCache;->sAccountInfo:Lcom/miui/gallery/cloud/AccountCache$AccountInfo;

    if-eqz v1, :cond_0

    sget-object v1, Lcom/miui/gallery/cloud/AccountCache;->sAccountInfo:Lcom/miui/gallery/cloud/AccountCache$AccountInfo;

    iget-object v1, v1, Lcom/miui/gallery/cloud/AccountCache$AccountInfo;->mAccount:Landroid/accounts/Account;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :cond_0
    :try_start_1
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/account/AccountHelper;->getXiaomiAccount(Landroid/content/Context;)Landroid/accounts/Account;

    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static getAccountInfo()Lcom/miui/gallery/cloud/AccountCache$AccountInfo;
    .locals 2

    sget-object v0, Lcom/miui/gallery/cloud/AccountCache;->sAccountInfo:Lcom/miui/gallery/cloud/AccountCache$AccountInfo;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/cloud/AccountCache;->requestAccountInfo()Lcom/miui/gallery/cloud/AccountCache$AccountInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, v0, Lcom/miui/gallery/cloud/AccountCache$AccountInfo;->mAccount:Landroid/accounts/Account;

    iget-object v0, v0, Lcom/miui/gallery/cloud/AccountCache$AccountInfo;->mToken:Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;

    invoke-static {v1, v0}, Lcom/miui/gallery/cloud/AccountCache;->update(Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;)V

    :cond_0
    sget-object v0, Lcom/miui/gallery/cloud/AccountCache;->sAccountInfo:Lcom/miui/gallery/cloud/AccountCache$AccountInfo;

    return-object v0
.end method

.method private static requestAccountInfo()Lcom/miui/gallery/cloud/AccountCache$AccountInfo;
    .locals 3

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$CTA;->canConnectNetwork()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string v0, "AccountCache"

    const-string v2, "requestAccount: cta not allowed"

    invoke-static {v0, v2}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    :cond_0
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/account/AccountHelper;->getXiaomiAccount(Landroid/content/Context;)Landroid/accounts/Account;

    move-result-object v2

    if-nez v2, :cond_1

    const-string v0, "AccountCache"

    const-string v2, "requestAccount: get account failed"

    invoke-static {v0, v2}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    :cond_1
    invoke-static {v0, v2}, Lcom/miui/gallery/cloud/CloudUtils;->getExtToken(Landroid/content/Context;Landroid/accounts/Account;)Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;

    move-result-object v0

    if-nez v0, :cond_2

    const-string v0, "AccountCache"

    const-string v2, "requestAccount: get ext token failed"

    invoke-static {v0, v2}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    :cond_2
    new-instance v1, Lcom/miui/gallery/cloud/AccountCache$AccountInfo;

    invoke-direct {v1, v2, v0}, Lcom/miui/gallery/cloud/AccountCache$AccountInfo;-><init>(Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;)V

    return-object v1
.end method

.method public static declared-synchronized update(Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;)V
    .locals 2

    const-class v0, Lcom/miui/gallery/cloud/AccountCache;

    monitor-enter v0

    if-eqz p0, :cond_1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    :try_start_0
    new-instance v1, Lcom/miui/gallery/cloud/AccountCache$AccountInfo;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/cloud/AccountCache$AccountInfo;-><init>(Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;)V

    sput-object v1, Lcom/miui/gallery/cloud/AccountCache;->sAccountInfo:Lcom/miui/gallery/cloud/AccountCache$AccountInfo;

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x0

    sput-object p0, Lcom/miui/gallery/cloud/AccountCache;->sAccountInfo:Lcom/miui/gallery/cloud/AccountCache$AccountInfo;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method
