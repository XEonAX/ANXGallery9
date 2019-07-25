.class Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$BitmapDelegator;
.super Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$Delegator;
.source "ColorPicker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BitmapDelegator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$Delegator<",
        "Landroid/graphics/drawable/BitmapDrawable;",
        ">;"
    }
.end annotation


# instance fields
.field private mBitmap:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>(Landroid/graphics/drawable/BitmapDrawable;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$Delegator;-><init>(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p1}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$BitmapDelegator;->mBitmap:Landroid/graphics/Bitmap;

    return-void
.end method


# virtual methods
.method findLevel(I)I
    .locals 3

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$BitmapDelegator;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$BitmapDelegator;->mBitmap:Landroid/graphics/Bitmap;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$BitmapDelegator;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    invoke-virtual {v1, v0, v2}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v1

    if-ne v1, p1, :cond_0

    int-to-float p1, v0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$BitmapDelegator;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr p1, v0

    invoke-static {}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->access$000()I

    move-result v0

    int-to-float v0, v0

    mul-float p1, p1, v0

    float-to-int p1, p1

    return p1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method getColor()I
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$BitmapDelegator;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-static {}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->access$000()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v0, v1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$BitmapDelegator;->mDrawable:Landroid/graphics/drawable/Drawable;

    check-cast v1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/BitmapDrawable;->getLevel()I

    move-result v1

    int-to-float v1, v1

    mul-float v0, v0, v1

    float-to-int v0, v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$BitmapDelegator;->mBitmap:Landroid/graphics/Bitmap;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker$BitmapDelegator;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    invoke-virtual {v1, v0, v2}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v0

    return v0
.end method
