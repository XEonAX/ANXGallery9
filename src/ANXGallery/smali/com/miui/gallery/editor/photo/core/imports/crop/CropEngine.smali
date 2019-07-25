.class public Lcom/miui/gallery/editor/photo/core/imports/crop/CropEngine;
.super Lcom/miui/gallery/editor/photo/core/RenderEngine;
.source "CropEngine.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/RenderEngine;-><init>()V

    return-void
.end method


# virtual methods
.method public render(Landroid/graphics/Bitmap;Lcom/miui/gallery/editor/photo/core/RenderData;)Landroid/graphics/Bitmap;
    .locals 0

    check-cast p2, Lcom/miui/gallery/editor/photo/core/imports/crop/CropStateData;

    iget-object p2, p2, Lcom/miui/gallery/editor/photo/core/imports/crop/CropStateData;->mEntry:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ParcelableCropEntry;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ParcelableCropEntry;->apply(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1
.end method
