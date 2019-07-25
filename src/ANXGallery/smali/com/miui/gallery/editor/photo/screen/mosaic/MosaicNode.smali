.class public abstract Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicNode;
.super Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;
.source "MosaicNode.java"


# instance fields
.field protected mEndPoint:Landroid/graphics/PointF;

.field private mIsInit:Z

.field protected mStartPoint:Landroid/graphics/PointF;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;-><init>()V

    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicNode;->mStartPoint:Landroid/graphics/PointF;

    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicNode;->mEndPoint:Landroid/graphics/PointF;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicNode;->mIsInit:Z

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicNode;->init()V

    return-void
.end method


# virtual methods
.method protected abstract init()V
.end method

.method protected abstract onReceivePosition(FFZ)V
.end method

.method public receivePosition(FF)V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicNode;->mIsInit:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicNode;->mStartPoint:Landroid/graphics/PointF;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/PointF;->set(FF)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicNode;->mIsInit:Z

    invoke-virtual {p0, p1, p2, v0}, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicNode;->onReceivePosition(FFZ)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicNode;->mEndPoint:Landroid/graphics/PointF;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/PointF;->set(FF)V

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicNode;->onReceivePosition(FFZ)V

    :goto_0
    return-void
.end method

.method public abstract setPaintSize(F)V
.end method

.method public abstract setShader(Landroid/graphics/Shader;)V
.end method
