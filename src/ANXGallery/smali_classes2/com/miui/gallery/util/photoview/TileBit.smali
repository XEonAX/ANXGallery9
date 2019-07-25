.class public Lcom/miui/gallery/util/photoview/TileBit;
.super Ljava/lang/Object;
.source "TileBit.java"


# static fields
.field private static final sTileRect:Landroid/graphics/Rect;


# instance fields
.field private mBitmap:Landroid/graphics/Bitmap;

.field private mValidateHeight:I

.field private mValidateWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    sput-object v0, Lcom/miui/gallery/util/photoview/TileBit;->sTileRect:Landroid/graphics/Rect;

    return-void
.end method

.method public constructor <init>(Landroid/graphics/Bitmap;II)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/util/photoview/TileBit;->mBitmap:Landroid/graphics/Bitmap;

    iput p2, p0, Lcom/miui/gallery/util/photoview/TileBit;->mValidateWidth:I

    iput p3, p0, Lcom/miui/gallery/util/photoview/TileBit;->mValidateHeight:I

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;Landroid/graphics/RectF;Landroid/graphics/Paint;)V
    .locals 4

    sget-object v0, Lcom/miui/gallery/util/photoview/TileBit;->sTileRect:Landroid/graphics/Rect;

    invoke-virtual {p0}, Lcom/miui/gallery/util/photoview/TileBit;->getValidateWidth()I

    move-result v1

    invoke-virtual {p0}, Lcom/miui/gallery/util/photoview/TileBit;->getValidateHeight()I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/graphics/Rect;->set(IIII)V

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/TileBit;->mBitmap:Landroid/graphics/Bitmap;

    sget-object v1, Lcom/miui/gallery/util/photoview/TileBit;->sTileRect:Landroid/graphics/Rect;

    invoke-virtual {p1, v0, v1, p2, p3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    return-void
.end method

.method public getValidateHeight()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/util/photoview/TileBit;->mValidateHeight:I

    return v0
.end method

.method public getValidateWidth()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/util/photoview/TileBit;->mValidateWidth:I

    return v0
.end method

.method public isContentValidate()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/TileBit;->mBitmap:Landroid/graphics/Bitmap;

    invoke-static {v0}, Lcom/miui/gallery/util/BitmapUtils;->isValidate(Landroid/graphics/Bitmap;)Z

    move-result v0

    return v0
.end method

.method public recycle(Lcom/miui/gallery/util/photoview/BitmapRecycleCallback;)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/util/photoview/TileBit;->isContentValidate()Z

    move-result v0

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/photoview/TileBit;->mBitmap:Landroid/graphics/Bitmap;

    invoke-interface {p1, v0}, Lcom/miui/gallery/util/photoview/BitmapRecycleCallback;->recycle(Landroid/graphics/Bitmap;)V

    goto :goto_0

    :cond_0
    const-string p1, "TileBit"

    const-string v0, "recycle bitmap: %s"

    iget-object v1, p0, Lcom/miui/gallery/util/photoview/TileBit;->mBitmap:Landroid/graphics/Bitmap;

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/miui/gallery/util/photoview/TileBit;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    :cond_1
    :goto_0
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/util/photoview/TileBit;->mBitmap:Landroid/graphics/Bitmap;

    return-void
.end method
