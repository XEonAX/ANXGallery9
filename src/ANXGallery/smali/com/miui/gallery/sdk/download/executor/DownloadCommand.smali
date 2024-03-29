.class public Lcom/miui/gallery/sdk/download/executor/DownloadCommand;
.super Ljava/lang/Object;
.source "DownloadCommand.java"

# interfaces
.implements Lcom/miui/gallery/sdk/download/executor/queue/Command;


# instance fields
.field private mAccount:Landroid/accounts/Account;

.field private mItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;


# direct methods
.method public constructor <init>(Landroid/accounts/Account;Lcom/miui/gallery/sdk/download/assist/DownloadItem;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;->mAccount:Landroid/accounts/Account;

    iput-object p2, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;->mItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery/sdk/download/executor/DownloadCommand;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;->getAccount()Landroid/accounts/Account;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;->mAccount:Landroid/accounts/Account;

    new-instance v0, Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    iget-object p1, p1, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;->mItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-direct {v0, p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;-><init>(Lcom/miui/gallery/sdk/download/assist/DownloadItem;)V

    iput-object v0, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;->mItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    return-void
.end method

.method public static checkValid(Lcom/miui/gallery/sdk/download/executor/DownloadCommand;)Z
    .locals 4

    invoke-static {}, Lcom/miui/gallery/cloud/AccountCache;->getAccount()Landroid/accounts/Account;

    move-result-object v0

    if-eqz v0, :cond_0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;->getAccount()Landroid/accounts/Account;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/accounts/Account;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;->getItem()Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    move-result-object p0

    if-eqz p0, :cond_1

    new-instance v0, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    sget-object v1, Lcom/miui/gallery/error/core/ErrorCode;->NO_ACCOUNT:Lcom/miui/gallery/error/core/ErrorCode;

    const-string v2, "illegal account"

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, v3}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-static {p0, v0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->callbackError(Lcom/miui/gallery/sdk/download/assist/DownloadItem;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V

    :cond_1
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 1

    if-eqz p1, :cond_0

    instance-of v0, p1, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;->getKey()Ljava/lang/String;

    move-result-object v0

    check-cast p1, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;->getKey()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public getAccount()Landroid/accounts/Account;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;->mAccount:Landroid/accounts/Account;

    return-object v0
.end method

.method public getItem()Lcom/miui/gallery/sdk/download/assist/DownloadItem;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;->mItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    return-object v0
.end method

.method public getKey()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;->mItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {v0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getKey()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPriority()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;->mItem:Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    invoke-virtual {v0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getPriority()I

    move-result v0

    return v0
.end method

.method public hashCode()I
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/executor/DownloadCommand;->getKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method
