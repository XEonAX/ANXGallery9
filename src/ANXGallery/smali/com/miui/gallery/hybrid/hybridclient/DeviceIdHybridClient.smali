.class public Lcom/miui/gallery/hybrid/hybridclient/DeviceIdHybridClient;
.super Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;
.source "DeviceIdHybridClient.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/hybrid/hybridclient/DeviceIdHybridClient$MiuiGalleryJSBridge;
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getJavascriptInterfaces()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/hybrid/hybridclient/HybridClient$JsInterfacePair;",
            ">;"
        }
    .end annotation

    invoke-super {p0}, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;->getJavascriptInterfaces()Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    :cond_0
    new-instance v1, Lcom/miui/gallery/hybrid/hybridclient/HybridClient$JsInterfacePair;

    const-string v2, "MiuiGalleryJSBridge"

    new-instance v3, Lcom/miui/gallery/hybrid/hybridclient/DeviceIdHybridClient$MiuiGalleryJSBridge;

    invoke-direct {v3, p0}, Lcom/miui/gallery/hybrid/hybridclient/DeviceIdHybridClient$MiuiGalleryJSBridge;-><init>(Lcom/miui/gallery/hybrid/hybridclient/DeviceIdHybridClient;)V

    invoke-direct {v1, v2, v3}, Lcom/miui/gallery/hybrid/hybridclient/HybridClient$JsInterfacePair;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method public getRuntimePermissions()[Ljava/lang/String;
    .locals 1

    const-string v0, "android.permission.READ_PHONE_STATE"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
