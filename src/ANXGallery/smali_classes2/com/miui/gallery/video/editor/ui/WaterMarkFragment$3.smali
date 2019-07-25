.class Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$3;
.super Ljava/lang/Object;
.source "WaterMarkFragment.java"

# interfaces
.implements Lcom/miui/gallery/net/base/ResponseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->loadResourceData()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$3;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs onResponse([Ljava/lang/Object;)V
    .locals 1

    const/4 v0, 0x0

    aget-object p1, p1, v0

    check-cast p1, Ljava/util/List;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$3;->this$0:Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;

    invoke-static {v0, p1}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;->access$100(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment;Ljava/util/List;)V

    return-void
.end method

.method public onResponseError(Lcom/miui/gallery/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0

    const-string p2, "WaterMarkFragment"

    const-string p3, "errorCode: %s"

    invoke-static {p2, p3, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance p2, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$3$1;

    invoke-direct {p2, p0, p1}, Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$3$1;-><init>(Lcom/miui/gallery/video/editor/ui/WaterMarkFragment$3;Lcom/miui/gallery/net/base/ErrorCode;)V

    invoke-static {p2}, Lcom/miui/gallery/threadpool/ThreadManager;->runOnMainThread(Ljava/lang/Runnable;)V

    return-void
.end method
