.class public Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;
.super Ljava/lang/Object;
.source "EditorOriginHandler.java"


# instance fields
.field private mBinder:Lcom/miui/gallery/editor/photo/origin/EditorOriginFunc;

.field private mContext:Landroid/content/Context;

.field private mHandlerMode:I

.field private mServiceConnection:Landroid/content/ServiceConnection;

.field private mSource:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/net/Uri;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler$1;-><init>(Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;->mServiceConnection:Landroid/content/ServiceConnection;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;->mSource:Landroid/net/Uri;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->isEditorProcess()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x2

    iput p1, p0, Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;->mHandlerMode:I

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;->useDoubleProcess()Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    iput p1, p0, Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;->mHandlerMode:I

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;->mHandlerMode:I

    :goto_0
    const-string p1, "EditorOriginHandler"

    const-string p2, "editor handler mode:%d"

    iget v0, p0, Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;->mHandlerMode:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method static synthetic access$002(Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;Lcom/miui/gallery/editor/photo/origin/EditorOriginFunc;)Lcom/miui/gallery/editor/photo/origin/EditorOriginFunc;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;->mBinder:Lcom/miui/gallery/editor/photo/origin/EditorOriginFunc;

    return-object p1
.end method

.method private bindEditorService()V
    .locals 4

    :try_start_0
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;->mContext:Landroid/content/Context;

    const-class v2, Lcom/miui/gallery/editor/photo/origin/EditorOriginHandlerService;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;->mServiceConnection:Landroid/content/ServiceConnection;

    const/16 v3, 0x81

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "EditorOriginHandler"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method private unbindEditorService()V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;->mServiceConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "EditorOriginHandler"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method private useDoubleProcess()Z
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-ge v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/utils/BigBitmapLoadUtils;->isBigMemoryApp(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public doExport(Lcom/miui/gallery/editor/photo/app/DraftManager;Landroid/net/Uri;)Z
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;->needTransProcess()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/DraftManager;->isPreviewSameWithOrigin()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/DraftManager;->getRenderDataList()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/DraftManager;->getBundle()Landroid/os/Bundle;

    move-result-object v1

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/DraftManager;->isWithWatermark()Z

    move-result p1

    invoke-virtual {p0, p2, v0, v1, p1}, Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;->doOriginHandler(Landroid/net/Uri;Ljava/util/List;Landroid/os/Bundle;Z)Z

    move-result p1

    goto :goto_1

    :cond_1
    :goto_0
    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/app/DraftManager;->export(Landroid/net/Uri;)Z

    move-result p1

    :goto_1
    return p1
.end method

.method public doOriginHandler(Landroid/net/Uri;Ljava/util/List;Landroid/os/Bundle;Z)Z
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/RenderData;",
            ">;",
            "Landroid/os/Bundle;",
            "Z)Z"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;->mBinder:Lcom/miui/gallery/editor/photo/origin/EditorOriginFunc;

    if-eqz v0, :cond_0

    :try_start_0
    const-string v0, "EditorOriginHandler"

    const-string v1, "doOriginHandler"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;->mBinder:Lcom/miui/gallery/editor/photo/origin/EditorOriginFunc;

    new-instance v7, Lcom/miui/gallery/editor/photo/origin/OriginRenderData;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;->mSource:Landroid/net/Uri;

    move-object v1, v7

    move-object v2, p2

    move-object v4, p1

    move-object v5, p3

    move v6, p4

    invoke-direct/range {v1 .. v6}, Lcom/miui/gallery/editor/photo/origin/OriginRenderData;-><init>(Ljava/util/List;Landroid/net/Uri;Landroid/net/Uri;Landroid/os/Bundle;Z)V

    invoke-interface {v0, v7}, Lcom/miui/gallery/editor/photo/origin/EditorOriginFunc;->handlerOrigin(Lcom/miui/gallery/editor/photo/origin/OriginRenderData;)Z

    move-result p1
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception p1

    const-string p2, "EditorOriginHandler"

    invoke-static {p2, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    const-string p1, "EditorOriginHandler"

    const-string p2, "doOriginHandler bind is null"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public isInMainProcess()Z
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;->mHandlerMode:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public needTransProcess()Z
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;->mHandlerMode:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public onDestroy()V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;->needTransProcess()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;->unbindEditorService()V

    :cond_0
    return-void
.end method

.method public onStart()V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;->needTransProcess()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/origin/EditorOriginHandler;->bindEditorService()V

    :cond_0
    return-void
.end method
