.class public Lcom/miui/gallery/cloud/RequestMultiItem;
.super Lcom/miui/gallery/cloud/RequestItemBase;
.source "RequestMultiItem.java"


# instance fields
.field public multiRequestItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/cloud/RequestItemBase;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/ArrayList;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/cloud/RequestItemBase;",
            ">;I)V"
        }
    .end annotation

    invoke-direct {p0, p2}, Lcom/miui/gallery/cloud/RequestItemBase;-><init>(I)V

    iput-object p1, p0, Lcom/miui/gallery/cloud/RequestMultiItem;->multiRequestItems:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/RequestMultiItem;->init()V

    return-void
.end method


# virtual methods
.method public compareAndSetStatus(II)Z
    .locals 3

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/cloud/RequestItemBase;->compareAndSetStatus(II)Z

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/cloud/RequestMultiItem;->multiRequestItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/cloud/RequestItemBase;

    invoke-virtual {v2, p1, p2}, Lcom/miui/gallery/cloud/RequestItemBase;->compareAndSetStatus(II)Z

    goto :goto_0

    :cond_0
    return v0
.end method

.method public getItems()Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/cloud/RequestItemBase;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/cloud/RequestMultiItem;->multiRequestItems:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    return-object v0
.end method

.method public getRequestLimitAGroup()I
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public isInSameAlbum(Lcom/miui/gallery/cloud/RequestItemBase;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public setStatus(I)V
    .locals 2

    invoke-super {p0, p1}, Lcom/miui/gallery/cloud/RequestItemBase;->setStatus(I)V

    iget-object v0, p0, Lcom/miui/gallery/cloud/RequestMultiItem;->multiRequestItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/cloud/RequestItemBase;

    invoke-virtual {v1, p1}, Lcom/miui/gallery/cloud/RequestItemBase;->setStatus(I)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public supportMultiRequest()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
