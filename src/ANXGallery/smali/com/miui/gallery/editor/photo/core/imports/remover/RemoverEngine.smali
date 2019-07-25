.class public Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverEngine;
.super Lcom/miui/gallery/editor/photo/core/RenderEngine;
.source "RemoverEngine.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/RenderEngine;-><init>()V

    return-void
.end method


# virtual methods
.method public release()V
    .locals 0

    invoke-static {}, Lcom/miui/gallery/editor/photo/app/remover/Inpaint;->release()V

    return-void
.end method

.method public render(Landroid/graphics/Bitmap;Lcom/miui/gallery/editor/photo/core/RenderData;)Landroid/graphics/Bitmap;
    .locals 12

    instance-of v0, p2, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderData;

    if-eqz v0, :cond_4

    check-cast p2, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderData;

    iget-object p2, p2, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderData;->mPaintData:Ljava/util/List;

    if-eqz p2, :cond_3

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    invoke-static {}, Lcom/miui/gallery/editor/photo/app/remover/Inpaint;->initialize()Z

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    sget-object v2, Landroid/graphics/Bitmap$Config;->ALPHA_8:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverPaintData;

    iget-object v2, v1, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverPaintData;->mCurves:Ljava/util/List;

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView;->export(Landroid/graphics/Bitmap;Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverPaintData;Ljava/util/List;)V

    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2}, Landroid/graphics/RectF;-><init>()V

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    iget-object v5, v1, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverPaintData;->mCurves:Ljava/util/List;

    invoke-static {v2, v3, v4, v1, v5}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverGestureView;->getMaskBounds(Landroid/graphics/RectF;IILcom/miui/gallery/editor/photo/core/imports/remover/RemoverPaintData;Ljava/util/List;)V

    invoke-virtual {v2}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    iget v3, v2, Landroid/graphics/RectF;->left:F

    float-to-int v7, v3

    iget v3, v2, Landroid/graphics/RectF;->top:F

    float-to-int v8, v3

    iget v3, v2, Landroid/graphics/RectF;->right:F

    float-to-int v9, v3

    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    float-to-int v10, v2

    iget-object v11, v1, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverPaintData;->mRemoverNNFData:Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverNNFData;

    move-object v3, p1

    move-object v4, v0

    invoke-static/range {v3 .. v11}, Lcom/miui/gallery/editor/photo/app/remover/Inpaint;->upsampleBmpData(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;IIIIIILcom/miui/gallery/editor/photo/core/imports/remover/RemoverNNFData;)V

    goto :goto_0

    :cond_2
    invoke-static {v0}, Lcom/miui/gallery/util/BaseBitmapUtils;->recycleSilently(Landroid/graphics/Bitmap;)V

    invoke-static {}, Lcom/miui/gallery/editor/photo/app/remover/Inpaint;->release()V

    return-object p1

    :cond_3
    :goto_1
    return-object p1

    :cond_4
    const/4 p1, 0x0

    return-object p1
.end method
