.class public Lcom/miui/gallery/search/core/suggestion/RankInfo;
.super Ljava/lang/Object;
.source "RankInfo.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private mName:Ljava/lang/String;

.field private mOrder:Ljava/lang/String;

.field private mStyle:Ljava/lang/String;

.field private mTitle:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/search/core/suggestion/RankInfo;->mTitle:Ljava/lang/String;

    iput-object p2, p0, Lcom/miui/gallery/search/core/suggestion/RankInfo;->mName:Ljava/lang/String;

    iput-object p3, p0, Lcom/miui/gallery/search/core/suggestion/RankInfo;->mStyle:Ljava/lang/String;

    iput-object p4, p0, Lcom/miui/gallery/search/core/suggestion/RankInfo;->mOrder:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    const/4 v0, 0x0

    if-eqz p1, :cond_2

    instance-of v1, p1, Lcom/miui/gallery/search/core/suggestion/RankInfo;

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    check-cast p1, Lcom/miui/gallery/search/core/suggestion/RankInfo;

    iget-object v1, p0, Lcom/miui/gallery/search/core/suggestion/RankInfo;->mName:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/miui/gallery/search/core/suggestion/RankInfo;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/search/core/suggestion/RankInfo;->mOrder:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/miui/gallery/search/core/suggestion/RankInfo;->getOrder()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/search/core/suggestion/RankInfo;->mStyle:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/miui/gallery/search/core/suggestion/RankInfo;->getStyle()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/search/core/suggestion/RankInfo;->mTitle:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/miui/gallery/search/core/suggestion/RankInfo;->getTitle()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 v0, 0x1

    :cond_1
    return v0

    :cond_2
    :goto_0
    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/RankInfo;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public getOrder()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/RankInfo;->mOrder:Ljava/lang/String;

    return-object v0
.end method

.method public getStyle()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/RankInfo;->mStyle:Ljava/lang/String;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/suggestion/RankInfo;->mTitle:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    const-string v0, "RankInfo: [name=%s, order=%s, title=%s, style=%s]"

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/miui/gallery/search/core/suggestion/RankInfo;->mName:Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget-object v2, p0, Lcom/miui/gallery/search/core/suggestion/RankInfo;->mOrder:Ljava/lang/String;

    const/4 v3, 0x1

    aput-object v2, v1, v3

    iget-object v2, p0, Lcom/miui/gallery/search/core/suggestion/RankInfo;->mTitle:Ljava/lang/String;

    const/4 v3, 0x2

    aput-object v2, v1, v3

    iget-object v2, p0, Lcom/miui/gallery/search/core/suggestion/RankInfo;->mStyle:Ljava/lang/String;

    const/4 v3, 0x3

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
