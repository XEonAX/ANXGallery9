.class public Lcom/miui/gallery/search/hint/SearchBarHintItem;
.super Lcom/miui/gallery/search/widget/bannerView/BaseBannerItemData;
.source "SearchBarHintItem.java"


# instance fields
.field private mHintText:Ljava/lang/String;

.field private mQueryText:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/4 v0, -0x1

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/search/hint/SearchBarHintItem;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/search/widget/bannerView/BaseBannerItemData;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/search/hint/SearchBarHintItem;->mHintText:Ljava/lang/String;

    iput-object p2, p0, Lcom/miui/gallery/search/hint/SearchBarHintItem;->mQueryText:Ljava/lang/String;

    invoke-virtual {p0, p3}, Lcom/miui/gallery/search/hint/SearchBarHintItem;->setDisplayDuration(I)V

    return-void
.end method


# virtual methods
.method public getHintText()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/hint/SearchBarHintItem;->mHintText:Ljava/lang/String;

    return-object v0
.end method

.method public getQueryText()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/hint/SearchBarHintItem;->mQueryText:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Lcom/miui/gallery/search/widget/bannerView/BaseBannerItemData;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ",hintText="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/search/hint/SearchBarHintItem;->mHintText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ",queryText="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/search/hint/SearchBarHintItem;->mQueryText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
