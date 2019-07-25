.class Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$DrawMaskTask;
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
    name = "DrawMaskTask"
.end annotation


# instance fields
.field private final mGLRectF:Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;

.field private final mIsFirst:Z

.field final synthetic this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;Z)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$DrawMaskTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$DrawMaskTask;->mGLRectF:Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;

    iput-boolean p3, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$DrawMaskTask;->mIsFirst:Z

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$DrawMaskTask;->mIsFirst:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$DrawMaskTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$1400(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$DrawMaskTask;->mGLRectF:Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->set(Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$DrawMaskTask;->mGLRectF:Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$DrawMaskTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$1500(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)[F

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->getVertex([F)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$DrawMaskTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$DrawMaskTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$1500(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)[F

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$1600(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;[F)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$DrawMaskTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$DrawMaskTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$1400(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$DrawMaskTask;->mGLRectF:Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$1700(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$DrawMaskTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$1400(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$DrawMaskTask;->mGLRectF:Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;->set(Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF;)V

    :goto_0
    return-void
.end method
