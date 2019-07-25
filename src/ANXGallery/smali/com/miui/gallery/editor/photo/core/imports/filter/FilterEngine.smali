.class public Lcom/miui/gallery/editor/photo/core/imports/filter/FilterEngine;
.super Lcom/miui/gallery/editor/photo/core/RenderEngine;
.source "FilterEngine.java"


# instance fields
.field private mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/RenderEngine;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterEngine;->mContext:Landroid/content/Context;

    return-void
.end method

.method private smartBeauty(Landroid/graphics/Bitmap;)V
    .locals 1

    invoke-static {}, Lcom/miui/arcsoftbeauty/ArcsoftBeautyJni;->idBeautyAvailable()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p1}, Lcom/miui/arcsoftbeauty/ArcsoftBeautyJni;->smartBeauty(Landroid/graphics/Bitmap;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public release()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/editor/photo/core/RenderEngine;->release()V

    invoke-static {}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;->isSkyEnable()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/xiaomi/skytransfer/SkyTranFilter;->getInstance()Lcom/xiaomi/skytransfer/SkyTranFilter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/skytransfer/SkyTranFilter;->release()V

    :cond_0
    return-void
.end method

.method public render(Landroid/graphics/Bitmap;Lcom/miui/gallery/editor/photo/core/Metadata;Ljava/lang/Object;)Landroid/graphics/Bitmap;
    .locals 1

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result p3

    if-eqz p3, :cond_0

    goto :goto_0

    :cond_0
    new-instance p3, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterEngine;->mContext:Landroid/content/Context;

    invoke-direct {p3, v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;-><init>(Landroid/content/Context;)V

    instance-of v0, p2, Lcom/miui/gallery/editor/photo/core/imports/filter/Renderable;

    if-eqz v0, :cond_1

    check-cast p2, Lcom/miui/gallery/editor/photo/core/imports/filter/Renderable;

    invoke-interface {p2}, Lcom/miui/gallery/editor/photo/core/imports/filter/Renderable;->instantiate()Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;

    move-result-object p2

    invoke-virtual {p3, p2}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->setFilter(Lcom/miui/filtersdk/filter/base/GPUImageFilter;)V

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/OpenGlUtils;->ensureBitmapSize(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->setImage(Landroid/graphics/Bitmap;)V

    const/4 p1, 0x1

    invoke-virtual {p3, p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->getBitmapWithFilterApplied(Z)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "expect to be Renderable,your type: "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public render(Landroid/graphics/Bitmap;Lcom/miui/gallery/editor/photo/core/RenderData;)Landroid/graphics/Bitmap;
    .locals 3

    if-eqz p1, :cond_6

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_1

    :cond_0
    instance-of v0, p2, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderData;

    if-eqz v0, :cond_5

    check-cast p2, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderData;

    invoke-virtual {p2}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderData;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    return-object p1

    :cond_1
    invoke-virtual {p2}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderData;->isSkyTransfer()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p2}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderData;->getTransferTempData()Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;

    move-result-object v0

    if-nez v0, :cond_2

    invoke-static {}, Lcom/xiaomi/skytransfer/SkyTranFilter;->getInstance()Lcom/xiaomi/skytransfer/SkyTranFilter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/skytransfer/SkyTranFilter;->getTransferTempData()Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderData;->setTransferTempData(Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;)V

    const-string v1, "FilterEngine"

    const-string v2, "preview"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    const-string v1, "FilterEngine"

    const-string v2, "origin"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    invoke-virtual {p2}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderData;->instantiateSky()Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;

    move-result-object p2

    invoke-static {}, Lcom/xiaomi/skytransfer/SkyTranFilter;->getInstance()Lcom/xiaomi/skytransfer/SkyTranFilter;

    move-result-object v1

    invoke-virtual {v1, p1, p2, v0}, Lcom/xiaomi/skytransfer/SkyTranFilter;->transferSkyForSave(Landroid/graphics/Bitmap;Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;)V

    return-object p1

    :cond_3
    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterEngine;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;-><init>(Landroid/content/Context;)V

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/OpenGlUtils;->ensureBitmapSize(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-virtual {p2}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderData;->isPortraitBeauty()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterEngine;->smartBeauty(Landroid/graphics/Bitmap;)V

    :cond_4
    invoke-virtual {p2}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterRenderData;->instantiate()Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;

    move-result-object p2

    invoke-virtual {v0, p2}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->setFilter(Lcom/miui/filtersdk/filter/base/GPUImageFilter;)V

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->setImage(Landroid/graphics/Bitmap;)V

    const/4 p1, 0x1

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/GPUImage;->getBitmapWithFilterApplied(Z)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1

    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "expect to be FilterRenderData,your type: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_6
    :goto_1
    const/4 p1, 0x0

    return-object p1
.end method
