.class Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;
.super Ljava/lang/Object;
.source "StickerEditorView.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Cache;,
        Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$Mutator;,
        Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$ModifyListener;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mDrawBounds:Landroid/graphics/RectF;

.field private mImageBounds:Landroid/graphics/RectF;

.field private mInvert:Landroid/graphics/Matrix;

.field private mListener:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$ModifyListener;

.field private mMatrix:Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

.field private mMatrixValue:[F

.field private mPaint:Landroid/graphics/Paint;

.field private mPathName:Ljava/lang/String;

.field private mRotate:Landroid/graphics/Matrix;

.field private mSticker:Landroid/graphics/Bitmap;

.field public mStickerCateName:Ljava/lang/String;

.field public mStickerId:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$1;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(Landroid/graphics/Bitmap;Ljava/lang/String;JLjava/lang/String;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mMatrix:Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mInvert:Landroid/graphics/Matrix;

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mRotate:Landroid/graphics/Matrix;

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mPaint:Landroid/graphics/Paint;

    const/16 v0, 0x9

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mMatrixValue:[F

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mSticker:Landroid/graphics/Bitmap;

    iput-wide p3, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mStickerId:J

    iput-object p5, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mStickerCateName:Ljava/lang/String;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mPathName:Ljava/lang/String;

    new-instance p2, Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p3

    int-to-float p3, p3

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p1

    int-to-float p1, p1

    const/4 p4, 0x0

    invoke-direct {p2, p4, p4, p3, p1}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mImageBounds:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/RectF;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mImageBounds:Landroid/graphics/RectF;

    invoke-direct {p1, p2}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mDrawBounds:Landroid/graphics/RectF;

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mMatrix:Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mInvert:Landroid/graphics/Matrix;

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mRotate:Landroid/graphics/Matrix;

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mPaint:Landroid/graphics/Paint;

    const/16 v0, 0x9

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mMatrixValue:[F

    const-class v0, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mMatrix:Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mPathName:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->initForParcelable()V

    return-void
.end method

.method static synthetic access$002(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$ModifyListener;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$ModifyListener;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mListener:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$ModifyListener;

    return-object p1
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;)Landroid/graphics/Matrix;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mRotate:Landroid/graphics/Matrix;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;[F)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->contains([F)Z

    move-result p0

    return p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mirror()V

    return-void
.end method

.method static synthetic access$400(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;Landroid/graphics/Matrix;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->rotate(Landroid/graphics/Matrix;)V

    return-void
.end method

.method static synthetic access$500(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;F)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->scale(F)V

    return-void
.end method

.method static synthetic access$600(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;FF)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->translate(FF)V

    return-void
.end method

.method static synthetic access$700(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;)Landroid/graphics/RectF;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mDrawBounds:Landroid/graphics/RectF;

    return-object p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;)Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mMatrix:Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

    return-object p0
.end method

.method static synthetic access$900(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;)Landroid/graphics/RectF;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mImageBounds:Landroid/graphics/RectF;

    return-object p0
.end method

.method private contains([F)Z
    .locals 7

    const/4 v0, 0x0

    aget v1, p1, v0

    const/4 v2, 0x1

    aget v3, p1, v2

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mInvert:Landroid/graphics/Matrix;

    invoke-virtual {v4, p1}, Landroid/graphics/Matrix;->mapPoints([F)V

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mImageBounds:Landroid/graphics/RectF;

    aget v5, p1, v0

    aget v6, p1, v2

    invoke-virtual {v4, v5, v6}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v4

    aput v1, p1, v0

    aput v3, p1, v2

    return v4
.end method

.method private mirror()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mMatrix:Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mImageBounds:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerX()F

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mImageBounds:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerY()F

    move-result v2

    const/high16 v3, -0x40800000    # -1.0f

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-virtual {v0, v3, v4, v1, v2}, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;->preScale(FFFF)Z

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->postModify()V

    return-void
.end method

.method private postModify()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mMatrix:Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mDrawBounds:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mImageBounds:Landroid/graphics/RectF;

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mMatrix:Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mInvert:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;->invert(Landroid/graphics/Matrix;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mListener:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$ModifyListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mListener:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$ModifyListener;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode$ModifyListener;->onModified()V

    :cond_0
    return-void
.end method

.method private rotate(Landroid/graphics/Matrix;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mRotate:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mMatrix:Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mDrawBounds:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerX()F

    move-result v1

    neg-float v1, v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mDrawBounds:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerY()F

    move-result v2

    neg-float v2, v2

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;->postTranslate(FF)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mMatrix:Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;->postConcat(Landroid/graphics/Matrix;)Z

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mMatrix:Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mDrawBounds:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mDrawBounds:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerY()F

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;->postTranslate(FF)Z

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->postModify()V

    return-void
.end method

.method private scale(F)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mMatrix:Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mDrawBounds:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerX()F

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mDrawBounds:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerY()F

    move-result v2

    invoke-virtual {v0, p1, p1, v1, v2}, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;->postScale(FFFF)Z

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->postModify()V

    return-void
.end method

.method private translate(FF)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mMatrix:Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;->postTranslate(FF)Z

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->postModify()V

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method draw(Landroid/graphics/Canvas;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mSticker:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mMatrix:Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    return-void
.end method

.method init(Landroid/graphics/Matrix;Landroid/graphics/Bitmap;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mMatrixValue:[F

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->getValues([F)V

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p1

    int-to-float p1, p1

    invoke-static {}, Lcom/miui/gallery/util/ScreenUtils;->getScreenWidth()I

    move-result p2

    int-to-float p2, p2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mMatrixValue:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    cmpg-float v1, p1, p2

    if-gez v1, :cond_0

    div-float/2addr p1, p2

    mul-float v0, v0, p1

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mMatrix:Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

    const/4 p2, 0x0

    invoke-virtual {p1, v0, v0, p2, p2}, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;->postScale(FFFF)Z

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->postModify()V

    return-void
.end method

.method public initForParcelable()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mPathName:Ljava/lang/String;

    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mSticker:Landroid/graphics/Bitmap;

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mMatrix:Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerNode;->mPathName:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return-void
.end method
