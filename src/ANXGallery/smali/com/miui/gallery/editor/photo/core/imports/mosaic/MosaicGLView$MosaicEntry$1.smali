.class Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$MosaicEntry$1;
.super Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;
.source "MosaicGLView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$MosaicEntry;->apply(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$MosaicEntry;

.field final synthetic val$finalScale:F


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$MosaicEntry;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;F)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$MosaicEntry$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$MosaicEntry;

    iput p4, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$MosaicEntry$1;->val$finalScale:F

    invoke-direct {p0, p2, p3}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    return-void
.end method


# virtual methods
.method public onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V

    return-void
.end method

.method public onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V
    .locals 4

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V

    new-instance p1, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;

    invoke-direct {p1, p0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;-><init>(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)V

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->run()V

    const-string p1, "MosaicEntry"

    const-string p2, "MosaicEntry init finish begin apply operation item, size : %d"

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$MosaicEntry$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$MosaicEntry;

    invoke-static {p3}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$MosaicEntry;->access$1500(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$MosaicEntry;)Ljava/util/LinkedList;

    move-result-object p3

    invoke-virtual {p3}, Ljava/util/LinkedList;->size()I

    move-result p3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-static {p1, p2, p3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$MosaicEntry$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$MosaicEntry;

    invoke-static {p3}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$MosaicEntry;->access$1500(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$MosaicEntry;)Ljava/util/LinkedList;

    move-result-object p3

    invoke-virtual {p3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem;

    iget-object v1, v0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem;->mosaicGLEntity:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;

    new-instance v2, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$EnableEntityTask;

    iget v3, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$MosaicEntry$1;->val$finalScale:F

    invoke-direct {v2, p0, v1, v3}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$EnableEntityTask;-><init>(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;F)V

    invoke-virtual {v2}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$EnableEntityTask;->run()V

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicOperationItem;->paintingItems:Ljava/util/LinkedList;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$MosaicEntry$1;->drawMaskPaintingItems(Ljava/util/LinkedList;)V

    goto :goto_0

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-string p3, "MosaicEntry"

    const-string v2, "MosaicEntry apply operation item coast : %d"

    sub-long/2addr v0, p1

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-static {p3, v2, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    sget-object p1, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;->CUBE:[F

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$MosaicEntry$1;->mGLPosition:[F

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLView$MosaicEntry$1;->mGLPosition:[F

    array-length p3, p3

    const/4 v0, 0x0

    invoke-static {p1, v0, p2, v0, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    new-instance p1, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$DestroyBufferTask;

    invoke-direct {p1, p0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$DestroyBufferTask;-><init>(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)V

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$DestroyBufferTask;->run()V

    return-void
.end method

.method public onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V

    const-string p1, "MosaicEntry"

    const-string p2, "MosaicEntry onSurfaceCreated"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
