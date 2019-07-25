.class public Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;
.super Ljava/lang/Object;
.source "WatermarkDialog.java"

# interfaces
.implements Landroid/os/Parcelable;
.implements Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog$BitmapLoadingListener;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mActivation:Z

.field private mBgBitmap:Landroid/graphics/Bitmap;

.field private mBgPaint:Landroid/graphics/Paint;

.field private mBgPostRect:Landroid/graphics/RectF;

.field private mBitmapHeight:F

.field private mBitmapLoadingListener:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog$BitmapLoadingListener;

.field private mBitmapWidth:F

.field private mCurrentPieceIndex:I

.field private mDefaultLocationX:F

.field private mDefaultLocationY:F

.field private mDialogStatusData:Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;

.field private mIsCorrection:Z

.field private mIsFirstCount:Z

.field private mIsFromParcel:Z

.field private mMatrix:Landroid/graphics/Matrix;

.field private mOutLineRect:Landroid/graphics/RectF;

.field private mPaddingTop:I

.field private mResource:Landroid/content/res/Resources;

.field private mReverseColor:Z

.field private mRotateDegrees:F

.field private mScaleMultipleOrigin:F

.field private mTemRect:Landroid/graphics/RectF;

.field private mUserLocationX:F

.field private mUserLocationY:F

.field private mUserScaleMultiple:F

.field private mWatermarkInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;

.field private mWatermarkTextPieces:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;",
            ">;"
        }
    .end annotation
.end field

.field private mbgPostLoadingListener:Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog$2;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog$2;-><init>()V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mIsFirstCount:Z

    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mDefaultLocationX:F

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mDefaultLocationY:F

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog$1;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mbgPostLoadingListener:Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;

    return-void
.end method

.method public constructor <init>(Landroid/content/res/Resources;Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;F)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mIsFirstCount:Z

    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mDefaultLocationX:F

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mDefaultLocationY:F

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog$1;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mbgPostLoadingListener:Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mResource:Landroid/content/res/Resources;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;

    invoke-virtual {p0, p3}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->setScaleMultipleOrigin(F)V

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;-><init>()V

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableGenericUtils;->readObject(Landroid/os/Parcel;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mDialogStatusData:Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableGenericUtils;->readObject(Landroid/os/Parcel;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mScaleMultipleOrigin:F

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mDefaultLocationX:F

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mDefaultLocationY:F

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mIsFromParcel:Z

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mResource:Landroid/content/res/Resources;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->init()V

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->countLocation(ZF)V

    return-void
.end method

.method static synthetic access$002(Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mBgBitmap:Landroid/graphics/Bitmap;

    return-object p1
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;)Landroid/graphics/Paint;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mBgPaint:Landroid/graphics/Paint;

    return-object p0
.end method

.method static synthetic access$102(Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;Landroid/graphics/Paint;)Landroid/graphics/Paint;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mBgPaint:Landroid/graphics/Paint;

    return-object p1
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;)Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog$BitmapLoadingListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mBitmapLoadingListener:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog$BitmapLoadingListener;

    return-object p0
.end method

.method private canvasTranslate(Landroid/graphics/Canvas;ZZ)V
    .locals 3

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mDefaultLocationX:F

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mUserLocationX:F

    add-float/2addr v0, v1

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mDefaultLocationY:F

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mUserLocationY:F

    add-float/2addr v1, v2

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->getScaleMultiple()F

    move-result p2

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->getScaleMultiple()F

    move-result v1

    invoke-virtual {p1, p2, v1, v0, v0}, Landroid/graphics/Canvas;->scale(FFFF)V

    :cond_0
    if-eqz p3, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->getRotateDegrees()F

    move-result p2

    invoke-virtual {p1, p2, v0, v0}, Landroid/graphics/Canvas;->rotate(FFF)V

    :cond_1
    return-void
.end method

.method private getScaleMultiple()F
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mUserScaleMultiple:F

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mScaleMultipleOrigin:F

    mul-float v0, v0, v1

    return v0
.end method

.method private getTransRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)V
    .locals 4

    invoke-virtual {p2, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->getScaleMultiple()F

    move-result v1

    mul-float v0, v0, v1

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v1

    sub-float/2addr v0, v1

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v2

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->getScaleMultiple()F

    move-result v3

    mul-float v2, v2, v3

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result p1

    sub-float/2addr v2, p1

    div-float/2addr v2, v1

    neg-float p1, v0

    neg-float v0, v2

    invoke-virtual {p2, p1, v0}, Landroid/graphics/RectF;->inset(FF)V

    invoke-direct {p0, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->offsetRect(Landroid/graphics/RectF;)V

    return-void
.end method

.method private offsetRect(Landroid/graphics/RectF;)V
    .locals 3

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mDefaultLocationX:F

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mUserLocationX:F

    add-float/2addr v0, v1

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mDefaultLocationY:F

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mUserLocationY:F

    add-float/2addr v1, v2

    invoke-virtual {p1, v0, v1}, Landroid/graphics/RectF;->offset(FF)V

    return-void
.end method


# virtual methods
.method public appendUserLocationX(F)V
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mUserLocationX:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mUserLocationX:F

    return-void
.end method

.method public appendUserLocationY(F)V
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mUserLocationY:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mUserLocationY:F

    return-void
.end method

.method public contains(FF)Z
    .locals 10

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mTemRect:Landroid/graphics/RectF;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->getOutLineRect(Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->getRotateDegrees()F

    move-result v1

    neg-float v1, v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mTemRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerX()F

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mTemRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->centerY()F

    move-result v3

    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    const/4 v0, 0x2

    new-array v0, v0, [F

    const/4 v1, 0x0

    aput p1, v0, v1

    const/4 p1, 0x1

    aput p2, v0, p1

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p2, v0}, Landroid/graphics/Matrix;->mapPoints([F)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mTemRect:Landroid/graphics/RectF;

    aget v2, v0, v1

    aget v3, v0, p1

    invoke-virtual {p2, v2, v3}, Landroid/graphics/RectF;->contains(FF)Z

    move-result p2

    iput v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mCurrentPieceIndex:I

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkTextPieces:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-le v2, p1, :cond_2

    const/4 v2, -0x1

    iput v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mCurrentPieceIndex:I

    const v2, 0x7f7fffff    # Float.MAX_VALUE

    const/4 v2, 0x0

    const v3, 0x7f7fffff    # Float.MAX_VALUE

    :goto_0
    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkTextPieces:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v2, v4, :cond_2

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkTextPieces:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;

    invoke-virtual {v4}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->getOutlineRect()Landroid/graphics/RectF;

    move-result-object v4

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mTemRect:Landroid/graphics/RectF;

    invoke-direct {p0, v4, v5}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->getTransRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)V

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mTemRect:Landroid/graphics/RectF;

    aget v5, v0, v1

    aget v6, v0, p1

    invoke-virtual {v4, v5, v6}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v4

    if-eqz v4, :cond_0

    iput v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mCurrentPieceIndex:I

    goto :goto_1

    :cond_0
    aget v4, v0, v1

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mTemRect:Landroid/graphics/RectF;

    invoke-virtual {v5}, Landroid/graphics/RectF;->centerX()F

    move-result v5

    sub-float/2addr v4, v5

    float-to-double v4, v4

    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v4

    aget v8, v0, p1

    iget-object v9, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mTemRect:Landroid/graphics/RectF;

    invoke-virtual {v9}, Landroid/graphics/RectF;->centerY()F

    move-result v9

    sub-float/2addr v8, v9

    float-to-double v8, v8

    invoke-static {v8, v9, v6, v7}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v6

    add-double/2addr v4, v6

    double-to-float v4, v4

    cmpg-float v5, v4, v3

    if-gez v5, :cond_1

    iput v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mCurrentPieceIndex:I

    move v3, v4

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    return p2
.end method

.method public countLocation(ZF)V
    .locals 1

    iget-boolean p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mIsFirstCount:Z

    if-eqz p2, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkTextPieces:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;

    invoke-virtual {p2}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->configTextPaint()V

    invoke-virtual {p2}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->countTextInDialog()V

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mIsFirstCount:Z

    goto :goto_2

    :cond_1
    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkTextPieces:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_2
    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->configTextPaint()V

    if-eqz p1, :cond_2

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->countTextInDialog()V

    goto :goto_1

    :cond_3
    :goto_2
    return-void
.end method

.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 4

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->canvasTranslate(Landroid/graphics/Canvas;ZZ)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mBgBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;->bgPostRect:[F

    if-eqz v0, :cond_0

    new-instance v0, Landroid/graphics/PaintFlagsDrawFilter;

    const/4 v1, 0x0

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Landroid/graphics/PaintFlagsDrawFilter;-><init>(II)V

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->setDrawFilter(Landroid/graphics/DrawFilter;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mBgBitmap:Landroid/graphics/Bitmap;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mBgPostRect:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mBgPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkTextPieces:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;

    invoke-virtual {v1, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->draw(Landroid/graphics/Canvas;)V

    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method public getColor()I
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkTextPieces:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mCurrentPieceIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->getColor()I

    move-result v0

    return v0
.end method

.method public getDialogModel()Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getDialogStatusData(Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;)V
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->getUserLocationX()F

    move-result v0

    iput v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->itemPositionX:F

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->getUserLocationY()F

    move-result v0

    iput v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->itemPositionY:F

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->getUserScaleMultiple()F

    move-result v0

    iput v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->itemScale:F

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->getRotateDegrees()F

    move-result v0

    iput v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->itemDegree:F

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkTextPieces:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;

    iput-object v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textStatusDatas:[Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mReverseColor:Z

    iput-boolean v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->isReverseColor:Z

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textStatusDatas:[Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkTextPieces:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;

    new-instance v2, Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;

    invoke-direct {v2}, Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;-><init>()V

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->getColor()I

    move-result v3

    iput v3, v2, Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;->color:I

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->getTextTransparent()F

    move-result v3

    iput v3, v2, Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;->transparentProgress:F

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->getTextStyle()Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    move-result-object v3

    iput-object v3, v2, Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;->textStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->isBoldText()Z

    move-result v3

    iput-boolean v3, v2, Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;->textBold:Z

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->isShadow()Z

    move-result v3

    iput-boolean v3, v2, Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;->textShadow:Z

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->getTextAlignment()Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    move-result-object v3

    iput-object v3, v2, Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;->textAlignment:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->getText()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v2, Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;->text:Ljava/lang/String;

    iget-object v1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textStatusDatas:[Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public getOutLineRect(Landroid/graphics/RectF;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mOutLineRect:Landroid/graphics/RectF;

    invoke-direct {p0, v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->getTransRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)V

    return-void
.end method

.method public getRotateDegrees()F
    .locals 4

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mRotateDegrees:F

    const/4 v1, 0x0

    cmpg-float v2, v0, v1

    const/high16 v3, 0x43b40000    # 360.0f

    if-gez v2, :cond_0

    add-float/2addr v0, v3

    :cond_0
    rem-float/2addr v0, v3

    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mIsCorrection:Z

    cmpl-float v2, v0, v1

    const/4 v3, 0x1

    if-lez v2, :cond_1

    const/high16 v2, 0x40a00000    # 5.0f

    cmpg-float v2, v0, v2

    if-gez v2, :cond_1

    iput-boolean v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mIsCorrection:Z

    const/4 v0, 0x0

    :cond_1
    const v2, 0x43b18000    # 355.0f

    cmpl-float v2, v0, v2

    if-lez v2, :cond_2

    iput-boolean v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mIsCorrection:Z

    const/4 v0, 0x0

    :cond_2
    const/high16 v1, 0x42b40000    # 90.0f

    cmpl-float v2, v0, v1

    if-eqz v2, :cond_3

    const/high16 v2, 0x42aa0000    # 85.0f

    cmpl-float v2, v0, v2

    if-lez v2, :cond_3

    const/high16 v2, 0x42be0000    # 95.0f

    cmpg-float v2, v0, v2

    if-gez v2, :cond_3

    iput-boolean v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mIsCorrection:Z

    const/high16 v0, 0x42b40000    # 90.0f

    :cond_3
    const/high16 v1, 0x43340000    # 180.0f

    cmpl-float v2, v0, v1

    if-eqz v2, :cond_4

    const/high16 v2, 0x432f0000    # 175.0f

    cmpl-float v2, v0, v2

    if-lez v2, :cond_4

    const/high16 v2, 0x43390000    # 185.0f

    cmpg-float v2, v0, v2

    if-gez v2, :cond_4

    iput-boolean v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mIsCorrection:Z

    const/high16 v0, 0x43340000    # 180.0f

    :cond_4
    const/high16 v1, 0x43870000    # 270.0f

    cmpl-float v2, v0, v1

    if-eqz v2, :cond_5

    const v2, 0x43848000    # 265.0f

    cmpl-float v2, v0, v2

    if-lez v2, :cond_5

    const v2, 0x43898000    # 275.0f

    cmpg-float v2, v0, v2

    if-gez v2, :cond_5

    iput-boolean v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mIsCorrection:Z

    const/high16 v0, 0x43870000    # 270.0f

    :cond_5
    return v0
.end method

.method public getSampleName()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "watermark_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;

    iget-object v1, v1, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getText()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkTextPieces:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mCurrentPieceIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->getText()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTextAlignment()Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkTextPieces:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mCurrentPieceIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->getTextAlignment()Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    move-result-object v0

    return-object v0
.end method

.method public getTextStyle()Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkTextPieces:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mCurrentPieceIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->getTextStyle()Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    move-result-object v0

    return-object v0
.end method

.method public getTextTransparent()F
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkTextPieces:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mCurrentPieceIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->getTextTransparent()F

    move-result v0

    return v0
.end method

.method public getUserLocationX()F
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mUserLocationX:F

    return v0
.end method

.method public getUserLocationY()F
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mUserLocationY:F

    return v0
.end method

.method public getUserScaleMultiple()F
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mUserScaleMultiple:F

    return v0
.end method

.method public init()V
    .locals 12

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mResource:Landroid/content/res/Resources;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkTextPieces:Ljava/util/List;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;

    iget v0, v0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;->width:F

    invoke-static {v0}, Lcom/miui/gallery/util/ScreenUtils;->dpToPixel(F)F

    move-result v7

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;

    iget v0, v0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;->height:F

    invoke-static {v0}, Lcom/miui/gallery/util/ScreenUtils;->dpToPixel(F)F

    move-result v8

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;->textPieceList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;

    iget-object v10, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkTextPieces:Ljava/util/List;

    new-instance v11, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;

    iget v5, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mScaleMultipleOrigin:F

    move-object v0, v11

    move-object v1, v6

    move v3, v7

    move v4, v8

    invoke-direct/range {v0 .. v5}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;-><init>(Landroid/content/res/Resources;Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;FFF)V

    invoke-interface {v10, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;->bgPost:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mIsFromParcel:Z

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;

    iget-object v2, v2, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;->bgPost:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/core/ImageLoader;->loadImageSync(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mBgBitmap:Landroid/graphics/Bitmap;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mBgPaint:Landroid/graphics/Paint;

    goto :goto_1

    :cond_1
    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;

    iget-object v2, v2, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;->bgPost:Ljava/lang/String;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mbgPostLoadingListener:Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;

    invoke-virtual {v0, v2, v3}, Lcom/nostra13/universalimageloader/core/ImageLoader;->loadImage(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;)V

    :cond_2
    :goto_1
    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mUserLocationX:F

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mUserLocationY:F

    const/high16 v2, 0x3f800000    # 1.0f

    iput v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mUserScaleMultiple:F

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mRotateDegrees:F

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mIsCorrection:Z

    new-instance v2, Landroid/graphics/RectF;

    neg-float v3, v7

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v3, v4

    neg-float v5, v8

    div-float/2addr v5, v4

    div-float/2addr v7, v4

    div-float/2addr v8, v4

    invoke-direct {v2, v3, v5, v7, v8}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mOutLineRect:Landroid/graphics/RectF;

    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2}, Landroid/graphics/RectF;-><init>()V

    iput-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mTemRect:Landroid/graphics/RectF;

    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    iput-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mMatrix:Landroid/graphics/Matrix;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;

    iget-object v2, v2, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;->bgPostRect:[F

    if-eqz v2, :cond_3

    new-instance v2, Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;

    iget-object v4, v4, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;->bgPostRect:[F

    aget v4, v4, v0

    invoke-static {v4}, Lcom/miui/gallery/util/ScreenUtils;->dpToPixel(F)F

    move-result v4

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;

    iget-object v6, v6, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;->bgPostRect:[F

    aget v1, v6, v1

    invoke-static {v1}, Lcom/miui/gallery/util/ScreenUtils;->dpToPixel(F)F

    move-result v1

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;

    iget-object v6, v6, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;->bgPostRect:[F

    const/4 v7, 0x2

    aget v6, v6, v7

    invoke-static {v6}, Lcom/miui/gallery/util/ScreenUtils;->dpToPixel(F)F

    move-result v6

    iget-object v7, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;

    iget-object v7, v7, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;->bgPostRect:[F

    const/4 v8, 0x3

    aget v7, v7, v8

    invoke-static {v7}, Lcom/miui/gallery/util/ScreenUtils;->dpToPixel(F)F

    move-result v7

    invoke-direct {v2, v4, v1, v6, v7}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mBgPostRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mBgPostRect:Landroid/graphics/RectF;

    invoke-virtual {v1, v3, v5}, Landroid/graphics/RectF;->offset(FF)V

    :cond_3
    iget-boolean v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mIsFromParcel:Z

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mDialogStatusData:Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;

    invoke-virtual {p0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->setDialogWithStatusData(Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;)V

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mIsFromParcel:Z

    :cond_4
    return-void
.end method

.method public isActivation()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mActivation:Z

    return v0
.end method

.method public isBoldText()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkTextPieces:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mCurrentPieceIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->isBoldText()Z

    move-result v0

    return v0
.end method

.method public isDialogEnable()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isReverseColor()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mReverseColor:Z

    return v0
.end method

.method public isShadow()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkTextPieces:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mCurrentPieceIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->isShadow()Z

    move-result v0

    return v0
.end method

.method public isWatermark()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public refreshRotateDegree()V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->getRotateDegrees()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mRotateDegrees:F

    return-void
.end method

.method public reverseColor(I)V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mReverseColor:Z

    xor-int/lit8 v0, v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mReverseColor:Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkTextPieces:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;

    invoke-virtual {v1, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->setColor(I)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public setActivation(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mActivation:Z

    return-void
.end method

.method public setBitmapLoadingListener(Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog$BitmapLoadingListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mBitmapLoadingListener:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog$BitmapLoadingListener;

    return-void
.end method

.method public setBitmapSize(FF)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mBitmapWidth:F

    iput p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mBitmapHeight:F

    return-void
.end method

.method public setBoldText(Z)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkTextPieces:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mCurrentPieceIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->setBoldText(Z)V

    return-void
.end method

.method public setColor(I)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkTextPieces:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mCurrentPieceIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->setColor(I)V

    return-void
.end method

.method public setDialogModel(Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;Landroid/content/res/Resources;)V
    .locals 0

    return-void
.end method

.method public setDialogWithStatusData(Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;)V
    .locals 4

    iget-object v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textStatusDatas:[Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textStatusDatas:[Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;

    array-length v1, v1

    if-ge v0, v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkTextPieces:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkTextPieces:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;

    iget-object v2, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textStatusDatas:[Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;

    aget-object v2, v2, v0

    iget v3, v2, Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;->color:I

    invoke-virtual {v1, v3}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->setColor(I)V

    iget v3, v2, Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;->transparentProgress:F

    invoke-virtual {v1, v3}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->setTextTransparent(F)V

    iget-object v3, v2, Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;->textStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    invoke-virtual {v1, v3}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->setTextStyle(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;)V

    iget-boolean v3, v2, Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;->textBold:Z

    invoke-virtual {v1, v3}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->setBoldText(Z)V

    iget-boolean v3, v2, Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;->textShadow:Z

    invoke-virtual {v1, v3}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->setShadow(Z)V

    iget-object v3, v2, Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;->text:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    iget-object v3, v2, Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;->text:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->setText(Ljava/lang/String;)V

    :cond_0
    iget-object v2, v2, Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;->textAlignment:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    invoke-virtual {v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->setTextAlignment(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    iget v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;->color:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->setColor(I)V

    iget v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;->transparentProgress:F

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->setTextTransparent(F)V

    iget-object v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;->textStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->setTextStyle(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;)V

    iget-boolean v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;->textBold:Z

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->setBoldText(Z)V

    iget-boolean v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;->textShadow:Z

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->setShadow(Z)V

    iget-object v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/TextStatusData;->textAlignment:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->setTextAlignment(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;)V

    :cond_2
    iget v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->itemPositionX:F

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->setUserLocationX(F)V

    iget v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->itemPositionY:F

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->setUserLocationY(F)V

    iget v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->itemScale:F

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->setUserScaleMultiple(F)V

    iget v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->itemDegree:F

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->setRotateDegrees(F)V

    iget-boolean p1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->isReverseColor:Z

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mReverseColor:Z

    return-void
.end method

.method public setDisplaySize(FF)V
    .locals 4

    const/high16 v0, 0x40000000    # 2.0f

    div-float v1, p1, v0

    iput v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mDefaultLocationX:F

    div-float v1, p2, v0

    iput v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mDefaultLocationY:F

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;

    iget v1, v1, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;->offsetX:F

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-lez v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;

    iget v1, v1, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;->offsetX:F

    invoke-static {v1}, Lcom/miui/gallery/util/ScreenUtils;->dpToPixel(F)F

    move-result v1

    iput v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mDefaultLocationX:F

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mDefaultLocationX:F

    iget v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mBitmapWidth:F

    sub-float/2addr p1, v3

    div-float/2addr p1, v0

    add-float/2addr v1, p1

    iput v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mDefaultLocationX:F

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;

    iget v1, v1, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;->offsetX:F

    cmpg-float v1, v1, v2

    if-gez v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;

    iget v1, v1, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;->offsetX:F

    invoke-static {v1}, Lcom/miui/gallery/util/ScreenUtils;->dpToPixel(F)F

    move-result v1

    add-float/2addr v1, p1

    iput v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mDefaultLocationX:F

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mDefaultLocationX:F

    iget v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mBitmapWidth:F

    sub-float/2addr p1, v3

    div-float/2addr p1, v0

    sub-float/2addr v1, p1

    iput v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mDefaultLocationX:F

    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;

    iget p1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;->offsetY:F

    cmpl-float p1, p1, v2

    if-lez p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;

    iget p1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;->offsetY:F

    invoke-static {p1}, Lcom/miui/gallery/util/ScreenUtils;->dpToPixel(F)F

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mDefaultLocationY:F

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mDefaultLocationY:F

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mBitmapHeight:F

    sub-float/2addr p2, v1

    div-float/2addr p2, v0

    add-float/2addr p1, p2

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mDefaultLocationY:F

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mDefaultLocationY:F

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mPaddingTop:I

    div-int/lit8 p2, p2, 0x2

    int-to-float p2, p2

    add-float/2addr p1, p2

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mDefaultLocationY:F

    goto :goto_1

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;

    iget p1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;->offsetY:F

    cmpg-float p1, p1, v2

    if-gez p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;

    iget p1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;->offsetY:F

    invoke-static {p1}, Lcom/miui/gallery/util/ScreenUtils;->dpToPixel(F)F

    move-result p1

    add-float/2addr p1, p2

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mDefaultLocationY:F

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mDefaultLocationY:F

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mBitmapHeight:F

    sub-float/2addr p2, v1

    div-float/2addr p2, v0

    sub-float/2addr p1, p2

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mDefaultLocationY:F

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mDefaultLocationY:F

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mPaddingTop:I

    div-int/lit8 p2, p2, 0x2

    int-to-float p2, p2

    add-float/2addr p1, p2

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mDefaultLocationY:F

    :cond_3
    :goto_1
    return-void
.end method

.method public setDrawOutline(Z)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkTextPieces:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;

    invoke-virtual {v1, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->setDrawOutline(Z)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public setPaddingTop(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mPaddingTop:I

    return-void
.end method

.method public setRotateDegrees(F)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mRotateDegrees:F

    return-void
.end method

.method public setScaleMultipleOrigin(F)V
    .locals 1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mScaleMultipleOrigin:F

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mScaleMultipleOrigin:F

    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float p1, p1, v0

    if-lez p1, :cond_0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mScaleMultipleOrigin:F

    :cond_0
    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mScaleMultipleOrigin:F

    const v0, 0x3e99999a    # 0.3f

    cmpg-float p1, p1, v0

    if-gez p1, :cond_1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mScaleMultipleOrigin:F

    :cond_1
    return-void
.end method

.method public setShadow(Z)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkTextPieces:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mCurrentPieceIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->setShadow(Z)V

    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkTextPieces:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mCurrentPieceIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->setText(Ljava/lang/String;)V

    return-void
.end method

.method public setTextAlignment(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkTextPieces:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mCurrentPieceIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->setTextAlignment(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;)V

    return-void
.end method

.method public setTextStyle(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkTextPieces:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mCurrentPieceIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->setTextStyle(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;)V

    return-void
.end method

.method public setTextTransparent(F)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkTextPieces:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mCurrentPieceIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->setTextTransparent(F)V

    return-void
.end method

.method public setUserLocationX(F)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mUserLocationX:F

    return-void
.end method

.method public setUserLocationY(F)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mUserLocationY:F

    return-void
.end method

.method public setUserScaleMultiple(F)V
    .locals 1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mUserScaleMultiple:F

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mUserScaleMultiple:F

    const v0, 0x3e99999a    # 0.3f

    cmpg-float p1, p1, v0

    if-gez p1, :cond_0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mUserScaleMultiple:F

    :cond_0
    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mUserScaleMultiple:F

    const/high16 v0, 0x40a00000    # 5.0f

    cmpl-float p1, p1, v0

    if-lez p1, :cond_1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mUserScaleMultiple:F

    :cond_1
    return-void
.end method

.method public toggleMirror()V
    .locals 0

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;-><init>()V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->getDialogStatusData(Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;)V

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableGenericUtils;->writeObject(Landroid/os/Parcel;ILandroid/os/Parcelable;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mWatermarkInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableGenericUtils;->writeObject(Landroid/os/Parcel;ILandroid/os/Parcelable;)V

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mScaleMultipleOrigin:F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mDefaultLocationX:F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->mDefaultLocationY:F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    return-void
.end method
