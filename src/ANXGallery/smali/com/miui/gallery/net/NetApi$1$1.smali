.class Lcom/miui/gallery/net/NetApi$1$1;
.super Ljava/lang/Object;
.source "NetApi.java"

# interfaces
.implements Lcom/miui/gallery/net/base/ResponseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/net/NetApi$1;->subscribe(Lio/reactivex/ObservableEmitter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/net/NetApi$1;

.field final synthetic val$emitter:Lio/reactivex/ObservableEmitter;


# direct methods
.method constructor <init>(Lcom/miui/gallery/net/NetApi$1;Lio/reactivex/ObservableEmitter;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/net/NetApi$1$1;->this$0:Lcom/miui/gallery/net/NetApi$1;

    iput-object p2, p0, Lcom/miui/gallery/net/NetApi$1$1;->val$emitter:Lio/reactivex/ObservableEmitter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs onResponse([Ljava/lang/Object;)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/net/NetApi$1$1;->val$emitter:Lio/reactivex/ObservableEmitter;

    new-instance v1, Lcom/miui/gallery/util/OptionalResult;

    const/4 v2, 0x0

    aget-object p1, p1, v2

    invoke-direct {v1, p1}, Lcom/miui/gallery/util/OptionalResult;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Lio/reactivex/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    const-string p1, "NetApi"

    const-string v0, "%s onResponseSuccess"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/miui/gallery/net/NetApi$1$1;->this$0:Lcom/miui/gallery/net/NetApi$1;

    iget-object v3, v3, Lcom/miui/gallery/net/NetApi$1;->val$request:Lcom/miui/gallery/net/BaseGalleryRequest;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onResponseError(Lcom/miui/gallery/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/net/NetApi$1$1;->val$emitter:Lio/reactivex/ObservableEmitter;

    new-instance p2, Lcom/miui/gallery/util/OptionalResult;

    const/4 p3, 0x0

    invoke-direct {p2, p3}, Lcom/miui/gallery/util/OptionalResult;-><init>(Ljava/lang/Object;)V

    invoke-interface {p1, p2}, Lio/reactivex/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    const-string p1, "NetApi"

    const-string p2, "%s onResponseError"

    const/4 p3, 0x1

    new-array p3, p3, [Ljava/lang/Object;

    iget-object v0, p0, Lcom/miui/gallery/net/NetApi$1$1;->this$0:Lcom/miui/gallery/net/NetApi$1;

    iget-object v0, v0, Lcom/miui/gallery/net/NetApi$1;->val$request:Lcom/miui/gallery/net/BaseGalleryRequest;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    aput-object v0, p3, v1

    invoke-static {p2, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
