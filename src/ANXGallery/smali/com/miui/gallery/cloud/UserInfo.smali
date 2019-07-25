.class public Lcom/miui/gallery/cloud/UserInfo;
.super Ljava/lang/Object;
.source "UserInfo.java"


# instance fields
.field private mAliasNick:Ljava/lang/String;

.field private final mId:Ljava/lang/String;

.field private mMiliaoIconUrl:Ljava/lang/String;

.field private mMiliaoNick:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iput-object p1, p0, Lcom/miui/gallery/cloud/UserInfo;->mId:Ljava/lang/String;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Bad id"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public getAliasNick()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/UserInfo;->mAliasNick:Ljava/lang/String;

    return-object v0
.end method

.method public getDisplayName()Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/UserInfo;->getReadableName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/cloud/UserInfo;->mId:Ljava/lang/String;

    :goto_0
    return-object v0
.end method

.method public getMiliaoIconUrl()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/UserInfo;->mMiliaoIconUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getMiliaoNick()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/UserInfo;->mMiliaoNick:Ljava/lang/String;

    return-object v0
.end method

.method public getReadableName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/UserInfo;->mMiliaoNick:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cloud/UserInfo;->mMiliaoNick:Ljava/lang/String;

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/cloud/UserInfo;->mAliasNick:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/cloud/UserInfo;->mAliasNick:Ljava/lang/String;

    return-object v0

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public getUserId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/UserInfo;->mId:Ljava/lang/String;

    return-object v0
.end method

.method public setAliasNick(Ljava/lang/String;)V
    .locals 0

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/cloud/UserInfo;->mAliasNick:Ljava/lang/String;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/cloud/UserInfo;->mAliasNick:Ljava/lang/String;

    :goto_0
    return-void
.end method

.method public setMiliaoIconUrl(Ljava/lang/String;)V
    .locals 0

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/cloud/UserInfo;->mMiliaoIconUrl:Ljava/lang/String;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/cloud/UserInfo;->mMiliaoIconUrl:Ljava/lang/String;

    :goto_0
    return-void
.end method

.method public setMiliaoNick(Ljava/lang/String;)V
    .locals 0

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/cloud/UserInfo;->mMiliaoNick:Ljava/lang/String;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/cloud/UserInfo;->mMiliaoNick:Ljava/lang/String;

    :goto_0
    return-void
.end method
