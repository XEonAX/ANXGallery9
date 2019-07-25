.class Lcom/miui/gallery/settingssync/GallerySettingsSyncAdapter$GallerySettingUploadRequest;
.super Lcom/miui/gallery/net/BaseGalleryRequest;
.source "GallerySettingsSyncAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/settingssync/GallerySettingsSyncAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "GallerySettingUploadRequest"
.end annotation


# direct methods
.method constructor <init>(Lorg/json/JSONObject;)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/cloud/HostManager$Setting;->getSyncUrl()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x3ea

    invoke-direct {p0, v1, v0}, Lcom/miui/gallery/net/BaseGalleryRequest;-><init>(ILjava/lang/String;)V

    const-string v0, "data"

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/miui/gallery/settingssync/GallerySettingsSyncAdapter$GallerySettingUploadRequest;->addParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/net/base/BaseRequest;

    return-void
.end method


# virtual methods
.method public onRequestError(Lcom/miui/gallery/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    sget-object v0, Lcom/miui/gallery/net/base/ErrorCode;->BODY_EMPTY:Lcom/miui/gallery/net/base/ErrorCode;

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    new-array p2, p1, [Ljava/lang/Object;

    const/4 p3, 0x0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    aput-object p1, p2, p3

    invoke-virtual {p0, p2}, Lcom/miui/gallery/settingssync/GallerySettingsSyncAdapter$GallerySettingUploadRequest;->deliverResponse([Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/miui/gallery/settingssync/GallerySettingsSyncAdapter$GallerySettingUploadRequest;->deliverError(Lcom/miui/gallery/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method protected onRequestSuccess(Lorg/json/JSONObject;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "GallerySettingsSyncAdapter"

    const-string v1, "No data is expected here, what are you [%s]"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const/4 p1, 0x1

    new-array v0, p1, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/settingssync/GallerySettingsSyncAdapter$GallerySettingUploadRequest;->deliverResponse([Ljava/lang/Object;)V

    return-void
.end method
