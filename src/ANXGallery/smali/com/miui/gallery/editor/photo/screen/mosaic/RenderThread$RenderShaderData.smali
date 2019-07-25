.class Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread$RenderShaderData;
.super Ljava/lang/Object;
.source "RenderThread.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/screen/mosaic/RenderThread;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "RenderShaderData"
.end annotation


# instance fields
.field bitmapMatrix:Landroid/graphics/Matrix;

.field current:Landroid/graphics/Bitmap;

.field mosaicEntity:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity;


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
