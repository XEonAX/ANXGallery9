.class Lcom/miui/gallery/cloud/CloudUrlProvider$SharerImageUrlProvider;
.super Lcom/miui/gallery/cloud/CloudUrlProvider;
.source "CloudUrlProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cloud/CloudUrlProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SharerImageUrlProvider"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/cloud/CloudUrlProvider;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/cloud/CloudUrlProvider$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/cloud/CloudUrlProvider$SharerImageUrlProvider;-><init>()V

    return-void
.end method


# virtual methods
.method public getCommitSubUbiUrl(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    .locals 0

    invoke-static {p3}, Lcom/miui/gallery/cloud/HostManager$ShareImage;->getCommitSubUbiUrl(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getCommitUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-static {}, Lcom/miui/gallery/cloud/HostManager$ShareImage;->getCommitUrl()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getCopyUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-static {}, Lcom/miui/gallery/cloud/HostManager$ShareImage;->getCopyUrl()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getCreateSubUbiUrl(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    .locals 0

    invoke-static {p3}, Lcom/miui/gallery/cloud/HostManager$ShareImage;->getCreateSubUbiUrl(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getCreateUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-static {}, Lcom/miui/gallery/cloud/HostManager$ShareImage;->getCreateUrl()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getDeleteUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-static {}, Lcom/miui/gallery/cloud/HostManager$ShareImage;->getDeleteUrl()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getEditUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public getHideCopyUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public getHideMoveUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public getMoveUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-static {p2}, Lcom/miui/gallery/cloud/HostManager$ShareImage;->getMoveUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getRequestDownloadUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-static {}, Lcom/miui/gallery/cloud/HostManager$ShareImage;->getDownloadUrl()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getUnHideMoveUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public getUnhideCopyUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public getUpdateUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method
