.class Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$CaptureTask;
.super Ljava/lang/Object;
.source "MosaicRender.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CaptureTask"
.end annotation


# instance fields
.field private final mMosaicUndoManager:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;

.field final synthetic this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$CaptureTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$CaptureTask;->mMosaicUndoManager:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$CaptureTask;->mMosaicUndoManager:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$CaptureTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$1000(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$CaptureTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$700(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicUndoManager;->capture(Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;)V

    return-void
.end method
