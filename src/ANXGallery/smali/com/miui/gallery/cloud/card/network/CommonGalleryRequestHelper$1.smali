.class Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper$1;
.super Ljava/lang/Object;
.source "CommonGalleryRequestHelper.java"

# interfaces
.implements Lcom/miui/gallery/net/base/ResponseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;->execute(Lcom/miui/gallery/cloud/card/network/ResponseCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;

.field final synthetic val$responseCallback:Lcom/miui/gallery/cloud/card/network/ResponseCallback;


# direct methods
.method constructor <init>(Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;Lcom/miui/gallery/cloud/card/network/ResponseCallback;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper$1;->this$0:Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;

    iput-object p2, p0, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper$1;->val$responseCallback:Lcom/miui/gallery/cloud/card/network/ResponseCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs onResponse([Ljava/lang/Object;)V
    .locals 1

    const/4 v0, 0x0

    aget-object p1, p1, v0

    iget-object v0, p0, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper$1;->val$responseCallback:Lcom/miui/gallery/cloud/card/network/ResponseCallback;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper$1;->val$responseCallback:Lcom/miui/gallery/cloud/card/network/ResponseCallback;

    invoke-interface {v0, p1}, Lcom/miui/gallery/cloud/card/network/ResponseCallback;->onResponse(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public onResponseError(Lcom/miui/gallery/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper$1;->val$responseCallback:Lcom/miui/gallery/cloud/card/network/ResponseCallback;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper$1;->val$responseCallback:Lcom/miui/gallery/cloud/card/network/ResponseCallback;

    invoke-interface {v0, p1, p2, p3}, Lcom/miui/gallery/cloud/card/network/ResponseCallback;->onResponseError(Lcom/miui/gallery/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method
