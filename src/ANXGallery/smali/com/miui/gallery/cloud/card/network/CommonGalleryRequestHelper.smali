.class public Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;
.super Ljava/lang/Object;
.source "CommonGalleryRequestHelper.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private mBaseGalleryRequest:Lcom/miui/gallery/cloud/card/network/CommonGalleryRequest;

.field private mDataType:Ljava/lang/reflect/Type;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/cloud/card/network/RequestArguments;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/cloud/card/network/RequestArguments<",
            "TE;>;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getGenericInterfaces()[Ljava/lang/reflect/Type;

    move-result-object v0

    array-length v1, v0

    if-lez v1, :cond_1

    const/4 v1, 0x0

    aget-object v2, v0, v1

    instance-of v2, v2, Ljava/lang/reflect/ParameterizedType;

    if-eqz v2, :cond_1

    aget-object v0, v0, v1

    check-cast v0, Ljava/lang/reflect/ParameterizedType;

    invoke-interface {v0}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v0

    aget-object v0, v0, v1

    instance-of v1, v0, Ljava/lang/Class;

    if-eqz v1, :cond_0

    iput-object v0, p0, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;->mDataType:Ljava/lang/reflect/Type;

    new-instance v0, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequest;

    invoke-interface {p1}, Lcom/miui/gallery/cloud/card/network/RequestArguments;->getMethod()I

    move-result v1

    invoke-interface {p1}, Lcom/miui/gallery/cloud/card/network/RequestArguments;->getUrl()Ljava/lang/String;

    move-result-object p1

    iget-object v2, p0, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;->mDataType:Ljava/lang/reflect/Type;

    invoke-direct {v0, v1, p1, v2}, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequest;-><init>(ILjava/lang/String;Ljava/lang/reflect/Type;)V

    iput-object v0, p0, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;->mBaseGalleryRequest:Lcom/miui/gallery/cloud/card/network/CommonGalleryRequest;

    return-void

    :cond_0
    new-instance p1, Lcom/miui/gallery/cloud/card/exception/TypeNotFoundException;

    invoke-direct {p1}, Lcom/miui/gallery/cloud/card/exception/TypeNotFoundException;-><init>()V

    throw p1

    :cond_1
    new-instance p1, Lcom/miui/gallery/cloud/card/exception/TypeNotFoundException;

    invoke-direct {p1}, Lcom/miui/gallery/cloud/card/exception/TypeNotFoundException;-><init>()V

    throw p1

    :cond_2
    new-instance p1, Lcom/miui/gallery/cloud/card/exception/RequestArgumentsNullException;

    invoke-direct {p1}, Lcom/miui/gallery/cloud/card/exception/RequestArgumentsNullException;-><init>()V

    throw p1
.end method


# virtual methods
.method public final addParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;->mBaseGalleryRequest:Lcom/miui/gallery/cloud/card/network/CommonGalleryRequest;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequest;->addParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/net/base/BaseRequest;

    return-object p0
.end method

.method public final execute(Lcom/miui/gallery/cloud/card/network/ResponseCallback;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/cloud/card/network/ResponseCallback<",
            "TE;>;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;->mBaseGalleryRequest:Lcom/miui/gallery/cloud/card/network/CommonGalleryRequest;

    new-instance v1, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper$1;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper$1;-><init>(Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;Lcom/miui/gallery/cloud/card/network/ResponseCallback;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequest;->setOnResponseListener(Lcom/miui/gallery/net/base/ResponseListener;)Lcom/miui/gallery/net/base/BaseRequest;

    iget-object p1, p0, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;->mBaseGalleryRequest:Lcom/miui/gallery/cloud/card/network/CommonGalleryRequest;

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequest;->execute()V

    return-void
.end method

.method public final executeSync()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/miui/gallery/net/base/RequestError;,
            Lcom/miui/gallery/cloud/card/exception/NoResultException;
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;->mBaseGalleryRequest:Lcom/miui/gallery/cloud/card/network/CommonGalleryRequest;

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequest;->executeSync()[Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    array-length v1, v0

    if-lez v1, :cond_0

    const/4 v1, 0x0

    aget-object v0, v0, v1

    return-object v0

    :cond_0
    new-instance v0, Lcom/miui/gallery/cloud/card/exception/NoResultException;

    invoke-direct {v0}, Lcom/miui/gallery/cloud/card/exception/NoResultException;-><init>()V

    throw v0
.end method

.method public final setUseCache(Z)Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;->mBaseGalleryRequest:Lcom/miui/gallery/cloud/card/network/CommonGalleryRequest;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequest;->setUseCache(Z)Lcom/miui/gallery/net/base/BaseRequest;

    return-object p0
.end method
