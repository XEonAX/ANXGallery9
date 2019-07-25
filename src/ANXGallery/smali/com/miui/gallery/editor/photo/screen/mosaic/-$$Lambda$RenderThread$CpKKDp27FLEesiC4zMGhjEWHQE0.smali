.class public final synthetic Lcom/miui/gallery/editor/photo/screen/mosaic/-$$Lambda$RenderThread$CpKKDp27FLEesiC4zMGhjEWHQE0;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic f$0:Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread;

.field private final synthetic f$1:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicShaderHolder;


# direct methods
.method public synthetic constructor <init>(Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread;Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicShaderHolder;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/-$$Lambda$RenderThread$CpKKDp27FLEesiC4zMGhjEWHQE0;->f$0:Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/-$$Lambda$RenderThread$CpKKDp27FLEesiC4zMGhjEWHQE0;->f$1:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicShaderHolder;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/-$$Lambda$RenderThread$CpKKDp27FLEesiC4zMGhjEWHQE0;->f$0:Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/-$$Lambda$RenderThread$CpKKDp27FLEesiC4zMGhjEWHQE0;->f$1:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicShaderHolder;

    invoke-static {v0, v1}, Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread;->lambda$handleMessage$46(Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread;Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicShaderHolder;)V

    return-void
.end method
