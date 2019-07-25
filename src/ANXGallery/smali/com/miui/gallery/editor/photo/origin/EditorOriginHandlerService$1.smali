.class Lcom/miui/gallery/editor/photo/origin/EditorOriginHandlerService$1;
.super Lcom/miui/gallery/editor/photo/origin/EditorOriginFunc$Stub;
.source "EditorOriginHandlerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/origin/EditorOriginHandlerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/origin/EditorOriginHandlerService;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/origin/EditorOriginHandlerService;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/origin/EditorOriginHandlerService$1;->this$0:Lcom/miui/gallery/editor/photo/origin/EditorOriginHandlerService;

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/origin/EditorOriginFunc$Stub;-><init>()V

    return-void
.end method


# virtual methods
.method public handlerOrigin(Lcom/miui/gallery/editor/photo/origin/OriginRenderData;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    const-string v0, "EditorOriginHandlerService"

    const-string v1, "handlerOrigin start"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/miui/gallery/editor/photo/app/DraftManager;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/origin/EditorOriginHandlerService$1;->this$0:Lcom/miui/gallery/editor/photo/origin/EditorOriginHandlerService;

    iget-object v2, p1, Lcom/miui/gallery/editor/photo/origin/OriginRenderData;->mSource:Landroid/net/Uri;

    iget-object v3, p1, Lcom/miui/gallery/editor/photo/origin/OriginRenderData;->mBundle:Landroid/os/Bundle;

    iget-boolean v4, p1, Lcom/miui/gallery/editor/photo/origin/OriginRenderData;->mWithWatermark:Z

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/miui/gallery/editor/photo/app/DraftManager;-><init>(Landroid/content/Context;Landroid/net/Uri;Landroid/os/Bundle;Z)V

    iget-object v1, p1, Lcom/miui/gallery/editor/photo/origin/OriginRenderData;->mRenderDataList:Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/app/DraftManager;->setRenderDataList(Ljava/util/List;)V

    iget-object p1, p1, Lcom/miui/gallery/editor/photo/origin/OriginRenderData;->mOut:Landroid/net/Uri;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/app/DraftManager;->export(Landroid/net/Uri;)Z

    move-result p1

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->release()V

    const-string v0, "EditorOriginHandlerService"

    const-string v1, "handlerOrigin end"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return p1
.end method
