.class public Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;
.super Ljava/lang/Object;
.source "SkyTransferTempData.java"


# instance fields
.field public mCountDownLatch:Ljava/util/concurrent/CountDownLatch;

.field public mMaskData:[B

.field public mSegHeight:I

.field public mSegWidth:I

.field public mSkyMode:I


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x2

    iput v0, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;->mSkyMode:I

    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;->mCountDownLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;->mSegWidth:I

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;->mSegHeight:I

    iget p1, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;->mSegWidth:I

    iget v0, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;->mSegHeight:I

    mul-int p1, p1, v0

    new-array p1, p1, [B

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;->mMaskData:[B

    return-void
.end method
