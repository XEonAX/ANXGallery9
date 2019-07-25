.class final Lcom/miui/gallery/cloud/ServerErrorCode$7;
.super Ljava/lang/Object;
.source "ServerErrorCode.java"

# interfaces
.implements Lcom/miui/gallery/cloud/ServerErrorCode$GalleryErrorHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cloud/ServerErrorCode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Lorg/json/JSONObject;Lcom/miui/gallery/cloud/RequestItemBase;Lcom/miui/gallery/cloud/SpaceFullHandler$SpaceFullListener;)V
    .locals 1

    const-string p3, "ServerErrorCode"

    const-string v0, "special error, album not empty %s"

    if-nez p1, :cond_0

    const-string p1, ""

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_0
    invoke-static {p3, v0, p1}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    if-eqz p2, :cond_4

    instance-of p1, p2, Lcom/miui/gallery/cloud/RequestCloudItem;

    if-nez p1, :cond_1

    goto :goto_2

    :cond_1
    check-cast p2, Lcom/miui/gallery/cloud/RequestCloudItem;

    iget-object p1, p2, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->isItemType()Z

    move-result p2

    if-nez p2, :cond_3

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getLocalFlag()I

    move-result p2

    const/4 p3, 0x2

    if-ne p2, p3, :cond_3

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/miui/gallery/cloud/ServerErrorCode;->access$100(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_2

    goto :goto_1

    :cond_2
    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/cloud/ServerErrorCode;->access$200(Ljava/lang/String;)V

    :cond_3
    :goto_1
    return-void

    :cond_4
    :goto_2
    return-void
.end method
