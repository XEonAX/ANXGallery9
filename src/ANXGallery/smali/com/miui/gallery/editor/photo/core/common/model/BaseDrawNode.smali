.class public abstract Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;
.super Ljava/lang/Object;
.source "BaseDrawNode.java"


# instance fields
.field private mBitmapRect:Landroid/graphics/RectF;

.field private mTempMatrix:Landroid/graphics/Matrix;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract draw(Landroid/graphics/Canvas;)V
.end method

.method public draw(Landroid/graphics/Canvas;Landroid/graphics/RectF;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;->mBitmapRect:Landroid/graphics/RectF;

    if-eqz v0, :cond_0

    if-eqz p2, :cond_0

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;->mTempMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;->mBitmapRect:Landroid/graphics/RectF;

    sget-object v2, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v0, v1, p2, v2}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;->mTempMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, p2}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;->draw(Landroid/graphics/Canvas;)V

    :goto_0
    return-void
.end method

.method public setBitmapRect(Landroid/graphics/RectF;)V
    .locals 0

    if-nez p1, :cond_0

    return-void

    :cond_0
    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;->mBitmapRect:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;->mTempMatrix:Landroid/graphics/Matrix;

    return-void
.end method
