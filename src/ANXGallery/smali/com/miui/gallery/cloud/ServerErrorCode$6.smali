.class final Lcom/miui/gallery/cloud/ServerErrorCode$6;
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

    const-string v0, "special error, album not exist: %s"

    if-nez p1, :cond_0

    const-string p1, ""

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_0
    invoke-static {p3, v0, p1}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    if-eqz p2, :cond_7

    instance-of p1, p2, Lcom/miui/gallery/cloud/RequestCloudItem;

    if-nez p1, :cond_1

    goto :goto_2

    :cond_1
    check-cast p2, Lcom/miui/gallery/cloud/RequestCloudItem;

    iget-object p1, p2, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->isItemType()Z

    move-result p2

    if-nez p2, :cond_2

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getLocalFlag()I

    move-result p2

    const/4 p3, 0x2

    if-ne p2, p3, :cond_2

    return-void

    :cond_2
    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->isShareItem()Z

    move-result p2

    if-eqz p2, :cond_3

    return-void

    :cond_3
    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->isItemType()Z

    move-result p2

    if-eqz p2, :cond_6

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getLocalFlag()I

    move-result p2

    const/4 p3, 0x6

    if-eq p2, p3, :cond_4

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getLocalFlag()I

    move-result p2

    const/16 p3, 0x9

    if-eq p2, p3, :cond_4

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getLocalFlag()I

    move-result p2

    const/16 p3, 0x8

    if-eq p2, p3, :cond_4

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getLocalFlag()I

    move-result p2

    const/4 p3, 0x5

    if-ne p2, p3, :cond_6

    :cond_4
    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getLocalGroupId()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/miui/gallery/cloud/ServerErrorCode;->access$000(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_5

    goto :goto_1

    :cond_5
    const-string p2, "ServerErrorCode"

    const-string p3, "this album is need to recreate later %d"

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getLocalGroupId()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, p3, v0}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getLocalGroupId()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/cloud/CreateGroupItem;->recreateGroup(Ljava/lang/String;)V

    :cond_6
    :goto_1
    return-void

    :cond_7
    :goto_2
    return-void
.end method
