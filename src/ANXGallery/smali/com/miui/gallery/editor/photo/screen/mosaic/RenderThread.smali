.class Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread;
.super Landroid/os/HandlerThread;
.source "RenderThread.java"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread$RenderListener;,
        Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread$RenderShaderData;
    }
.end annotation


# instance fields
.field private mHandler:Landroid/os/Handler;

.field private mMainHandler:Landroid/os/Handler;

.field private mRenderListener:Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread$RenderListener;


# direct methods
.method constructor <init>()V
    .locals 2

    const-string v0, "mosaic_render_thread"

    invoke-direct {p0, v0}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread;->mMainHandler:Landroid/os/Handler;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread;->start()V

    new-instance v0, Landroid/os/Handler;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method public static synthetic lambda$handleMessage$46(Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread;Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicShaderHolder;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread;->mRenderListener:Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread$RenderListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread;->mRenderListener:Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread$RenderListener;

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread$RenderListener;->onShaderComplete(Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicShaderHolder;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .locals 2

    iget v0, p1, Landroid/os/Message;->what:I

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread$RenderShaderData;

    iget-object v0, p1, Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread$RenderShaderData;->mosaicEntity:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity;

    iget-object v1, p1, Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread$RenderShaderData;->current:Landroid/graphics/Bitmap;

    iget-object p1, p1, Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread$RenderShaderData;->bitmapMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1, p1}, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity;->generateShader(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;)Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicShaderHolder;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread;->mRenderListener:Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread$RenderListener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread;->mMainHandler:Landroid/os/Handler;

    new-instance v1, Lcom/miui/gallery/editor/photo/screen/mosaic/-$$Lambda$RenderThread$CpKKDp27FLEesiC4zMGhjEWHQE0;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/editor/photo/screen/mosaic/-$$Lambda$RenderThread$CpKKDp27FLEesiC4zMGhjEWHQE0;-><init>(Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread;Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicShaderHolder;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_1
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method sendGenerateShaderMsg(Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity;Landroid/graphics/Bitmap;Landroid/graphics/Matrix;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    new-instance v0, Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread$RenderShaderData;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread$RenderShaderData;-><init>()V

    iput-object p1, v0, Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread$RenderShaderData;->mosaicEntity:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity;

    iput-object p2, v0, Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread$RenderShaderData;->current:Landroid/graphics/Bitmap;

    iput-object p3, v0, Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread$RenderShaderData;->bitmapMatrix:Landroid/graphics/Matrix;

    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object p1

    iput v1, p1, Landroid/os/Message;->what:I

    iput-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread;->mHandler:Landroid/os/Handler;

    invoke-virtual {p2, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method setRenderListener(Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread$RenderListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread;->mRenderListener:Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread$RenderListener;

    return-void
.end method
