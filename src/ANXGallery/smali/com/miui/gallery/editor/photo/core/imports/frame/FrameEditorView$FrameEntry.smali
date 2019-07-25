.class public Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;
.super Ljava/lang/Object;
.source "FrameEditorView.java"

# interfaces
.implements Landroid/os/Parcelable;
.implements Lcom/miui/gallery/editor/photo/core/common/model/IPositionChangeData;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FrameEntry"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mBackgroundRect:Landroid/graphics/RectF;

.field private mBitmapMatrix:Landroid/graphics/Matrix;

.field private mBitmapPaint:Landroid/graphics/Paint;

.field private mBitmapRect:Landroid/graphics/RectF;

.field private mRatio:F

.field private mScaleProgress:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry$1;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(FF)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mBackgroundRect:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mBitmapRect:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mBitmapMatrix:Landroid/graphics/Matrix;

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mBitmapPaint:Landroid/graphics/Paint;

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mRatio:F

    iput p2, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mScaleProgress:F

    return-void
.end method

.method constructor <init>(Landroid/os/Parcel;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mBackgroundRect:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mBitmapRect:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mBitmapMatrix:Landroid/graphics/Matrix;

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mRatio:F

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mScaleProgress:F

    return-void
.end method


# virtual methods
.method protected apply(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 7

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mBitmapRect:Landroid/graphics/RectF;

    int-to-float v3, v0

    int-to-float v4, v1

    const/4 v5, 0x0

    invoke-virtual {v2, v5, v5, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mRatio:F

    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float v1, v1, v2

    if-lez v1, :cond_0

    int-to-float v1, v0

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mRatio:F

    div-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    goto :goto_0

    :cond_0
    int-to-float v1, v0

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mRatio:F

    mul-float v1, v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    move v6, v1

    move v1, v0

    move v0, v6

    :goto_0
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mBackgroundRect:Landroid/graphics/RectF;

    int-to-float v0, v0

    int-to-float v1, v1

    invoke-virtual {v3, v5, v5, v0, v1}, Landroid/graphics/RectF;->set(FFFF)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mBitmapMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mBitmapRect:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mBackgroundRect:Landroid/graphics/RectF;

    sget-object v4, Landroid/graphics/Matrix$ScaleToFit;->CENTER:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v0, v1, v3, v4}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mBitmapMatrix:Landroid/graphics/Matrix;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mScaleProgress:F

    iget v3, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mScaleProgress:F

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mBackgroundRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->centerX()F

    move-result v4

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mBackgroundRect:Landroid/graphics/RectF;

    invoke-virtual {v5}, Landroid/graphics/RectF;->centerY()F

    move-result v5

    invoke-virtual {v0, v1, v3, v4, v5}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->drawColor(I)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mBitmapMatrix:Landroid/graphics/Matrix;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1, v1, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    return-object v2
.end method

.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public refreshTargetAreaPosition(Landroid/graphics/RectF;Landroid/graphics/RectF;)V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v0, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    float-to-int v0, v0

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mRatio:F

    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float v1, v1, v2

    if-lez v1, :cond_0

    int-to-float v1, v0

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mRatio:F

    div-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    goto :goto_0

    :cond_0
    int-to-float v1, v0

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mRatio:F

    mul-float v1, v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    move v5, v1

    move v1, v0

    move v0, v5

    :goto_0
    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mBackgroundRect:Landroid/graphics/RectF;

    int-to-float v0, v0

    int-to-float v1, v1

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v3, v0, v1}, Landroid/graphics/RectF;->set(FFFF)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mBitmapMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mBitmapRect:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mBackgroundRect:Landroid/graphics/RectF;

    sget-object v3, Landroid/graphics/Matrix$ScaleToFit;->CENTER:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mBitmapMatrix:Landroid/graphics/Matrix;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mScaleProgress:F

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mScaleProgress:F

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mBackgroundRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->centerX()F

    move-result v3

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mBackgroundRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->centerY()F

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mBitmapMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mBackgroundRect:Landroid/graphics/RectF;

    invoke-virtual {p1, p2}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mRatio:F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/frame/FrameEditorView$FrameEntry;->mScaleProgress:F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    return-void
.end method
