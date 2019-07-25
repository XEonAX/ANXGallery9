.class Lcom/nexstreaming/app/common/nexasset/overlay/impl/BitmapOverlayAsset$1;
.super Ljava/lang/Object;
.source "BitmapOverlayAsset.java"

# interfaces
.implements Lcom/nexstreaming/app/common/nexasset/overlay/AwakeAsset;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nexstreaming/app/common/nexasset/overlay/impl/BitmapOverlayAsset;->onAwake(Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;Landroid/graphics/RectF;Ljava/lang/String;Ljava/util/Map;)Lcom/nexstreaming/app/common/nexasset/overlay/AwakeAsset;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/nexstreaming/app/common/nexasset/overlay/impl/BitmapOverlayAsset;

.field final synthetic val$bm:Landroid/graphics/Bitmap;

.field final synthetic val$bounds:Landroid/graphics/RectF;


# direct methods
.method constructor <init>(Lcom/nexstreaming/app/common/nexasset/overlay/impl/BitmapOverlayAsset;Landroid/graphics/RectF;Landroid/graphics/Bitmap;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/app/common/nexasset/overlay/impl/BitmapOverlayAsset$1;->this$0:Lcom/nexstreaming/app/common/nexasset/overlay/impl/BitmapOverlayAsset;

    iput-object p2, p0, Lcom/nexstreaming/app/common/nexasset/overlay/impl/BitmapOverlayAsset$1;->val$bounds:Landroid/graphics/RectF;

    iput-object p3, p0, Lcom/nexstreaming/app/common/nexasset/overlay/impl/BitmapOverlayAsset$1;->val$bm:Landroid/graphics/Bitmap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public needRendererReawakeOnEditResize()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public onAsleep(Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;)V
    .locals 0

    return-void
.end method

.method public onRefresh(Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;Landroid/graphics/RectF;Ljava/lang/String;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public onRender(Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;Lcom/nexstreaming/app/common/nexasset/overlay/OverlayMotion;II)V
    .locals 6

    iget-object p2, p0, Lcom/nexstreaming/app/common/nexasset/overlay/impl/BitmapOverlayAsset$1;->val$bounds:Landroid/graphics/RectF;

    iget p2, p2, Landroid/graphics/RectF;->left:F

    const/4 p3, 0x0

    cmpl-float p2, p2, p3

    if-nez p2, :cond_0

    iget-object p2, p0, Lcom/nexstreaming/app/common/nexasset/overlay/impl/BitmapOverlayAsset$1;->val$bounds:Landroid/graphics/RectF;

    iget p2, p2, Landroid/graphics/RectF;->top:F

    cmpl-float p2, p2, p3

    if-nez p2, :cond_0

    iget-object p2, p0, Lcom/nexstreaming/app/common/nexasset/overlay/impl/BitmapOverlayAsset$1;->val$bounds:Landroid/graphics/RectF;

    iget p2, p2, Landroid/graphics/RectF;->right:F

    cmpl-float p2, p2, p3

    if-nez p2, :cond_0

    iget-object p2, p0, Lcom/nexstreaming/app/common/nexasset/overlay/impl/BitmapOverlayAsset$1;->val$bounds:Landroid/graphics/RectF;

    iget p2, p2, Landroid/graphics/RectF;->bottom:F

    cmpl-float p2, p2, p3

    if-nez p2, :cond_0

    iget-object p2, p0, Lcom/nexstreaming/app/common/nexasset/overlay/impl/BitmapOverlayAsset$1;->val$bm:Landroid/graphics/Bitmap;

    invoke-virtual {p1, p2, p3, p3}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(Landroid/graphics/Bitmap;FF)V

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/nexstreaming/app/common/nexasset/overlay/impl/BitmapOverlayAsset$1;->val$bm:Landroid/graphics/Bitmap;

    iget-object p2, p0, Lcom/nexstreaming/app/common/nexasset/overlay/impl/BitmapOverlayAsset$1;->val$bounds:Landroid/graphics/RectF;

    iget v2, p2, Landroid/graphics/RectF;->left:F

    iget-object p2, p0, Lcom/nexstreaming/app/common/nexasset/overlay/impl/BitmapOverlayAsset$1;->val$bounds:Landroid/graphics/RectF;

    iget v3, p2, Landroid/graphics/RectF;->top:F

    iget-object p2, p0, Lcom/nexstreaming/app/common/nexasset/overlay/impl/BitmapOverlayAsset$1;->val$bounds:Landroid/graphics/RectF;

    iget v4, p2, Landroid/graphics/RectF;->right:F

    iget-object p2, p0, Lcom/nexstreaming/app/common/nexasset/overlay/impl/BitmapOverlayAsset$1;->val$bounds:Landroid/graphics/RectF;

    iget v5, p2, Landroid/graphics/RectF;->bottom:F

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(Landroid/graphics/Bitmap;FFFF)V

    :goto_0
    return-void
.end method
