.class public Lcom/miui/gallery/net/resource/DownloadRequest;
.super Lcom/miui/gallery/net/BaseGalleryRequest;
.source "DownloadRequest.java"


# direct methods
.method public constructor <init>(J)V
    .locals 2

    const-string v0, "https://i.mi.com/gallery/public/resource/download"

    const/4 v1, 0x0

    invoke-direct {p0, v1, v0}, Lcom/miui/gallery/net/BaseGalleryRequest;-><init>(ILjava/lang/String;)V

    const-string v0, "id"

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/miui/gallery/net/resource/DownloadRequest;->addParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/net/base/BaseRequest;

    invoke-virtual {p0, v1}, Lcom/miui/gallery/net/resource/DownloadRequest;->setUseCache(Z)Lcom/miui/gallery/net/base/BaseRequest;

    return-void
.end method


# virtual methods
.method protected onRequestSuccess(Lorg/json/JSONObject;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/net/resource/DownloadInfo;

    invoke-direct {v0}, Lcom/miui/gallery/net/resource/DownloadInfo;-><init>()V

    const-string v1, "url"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/net/resource/DownloadInfo;->url:Ljava/lang/String;

    const-string v1, "sha1Base16"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, v0, Lcom/miui/gallery/net/resource/DownloadInfo;->sha1:Ljava/lang/String;

    const/4 p1, 0x1

    new-array p1, p1, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object v0, p1, v1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/net/resource/DownloadRequest;->deliverResponse([Ljava/lang/Object;)V

    return-void
.end method
