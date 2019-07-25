.class public final Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;
.super Ljava/lang/Object;
.source "nexOverlayItem.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$HitPoint;,
        Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;,
        Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;,
        Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;,
        Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$a;
    }
.end annotation


# static fields
.field public static final AnchorPoint_LeftBottom:I = 0x6

.field public static final AnchorPoint_LeftMiddle:I = 0x3

.field public static final AnchorPoint_LeftTop:I = 0x0

.field public static final AnchorPoint_MiddleBottom:I = 0x7

.field public static final AnchorPoint_MiddleMiddle:I = 0x4

.field public static final AnchorPoint_MiddleTop:I = 0x1

.field public static final AnchorPoint_RightBottom:I = 0x8

.field public static final AnchorPoint_RightMiddle:I = 0x5

.field public static final AnchorPoint_RightTop:I = 0x2

.field private static final TAG:Ljava/lang/String; = "nexOverlayItem"

.field private static handleTouchZonePxSize:I = 0x24

.field private static iconSize:I = 0x18

.field public static final kOutLine_Pos_LeftBottom:I = 0x3

.field public static final kOutLine_Pos_LeftTop:I = 0x1

.field public static final kOutLine_Pos_RightBottom:I = 0x4

.field public static final kOutLine_Pos_RightTop:I = 0x2

.field private static marchingAnts_dashSize:I = 0xa

.field private static marchingAnts_width:I = 0x4

.field private static outLineIcon:[Landroid/graphics/Bitmap; = null

.field private static sLastId:I = 0x1

.field private static solidBlackBitmap:Landroid/graphics/Bitmap;

.field private static solidOutlen:Z

.field private static solidWhiteBitmap:Landroid/graphics/Bitmap;


# instance fields
.field private anchorPoint:I

.field private anchorPointX:I

.field private anchorPointY:I

.field private animateResourceId:I

.field private transient awakeAsset:Lcom/nexstreaming/app/common/nexasset/overlay/AwakeAsset;

.field bApplayLayerExpression:Z

.field private cacheMotion:Lcom/nexstreaming/app/common/nexasset/overlay/OverlayMotion;

.field private lastAnchorPoint:I

.field private lastLayerHeight:I

.field private lastLayerWidth:I

.field private mActiveAnimateList:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/nexstreaming/nexeditorsdk/nexAnimate;",
            ">;"
        }
    .end annotation
.end field

.field mAlpha:F

.field mAniList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexAnimate;",
            ">;"
        }
    .end annotation
.end field

.field private mAnimateLastAlpha:F

.field private mAnimateLastRotateDegreeX:F

.field private mAnimateLastRotateDegreeY:F

.field private mAnimateLastRotateDegreeZ:F

.field private mAnimateLastScaledX:F

.field private mAnimateLastScaledY:F

.field private mAnimateLastScaledZ:F

.field private mAnimateTranslateXpos:F

.field private mAnimateTranslateYpos:F

.field private mAnimateTranslateZpos:F

.field private mAudioOnOff:Z

.field private mBrightness:I

.field private mChromaKey:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;

.field private mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

.field private mContrast:I

.field mEndTime:I

.field private mFlipMode:I

.field private mId:I

.field private mLayerExpression:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

.field private mLayerExpressionDuration:I

.field private mMask:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;

.field private mMaskRect:Landroid/graphics/Rect;

.field private mOverLayFilter:Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;

.field private mOverLayImage:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

.field private mOverlayTitle:Z

.field mRotateDegreeX:F

.field mRotateDegreeY:F

.field mRotateDegreeZ:F

.field private mSaturation:I

.field mScaledX:F

.field mScaledY:F

.field mScaledZ:F

.field private mSpeedControl:I

.field mStartTime:I

.field private mTime:I

.field private mTrimEndDuration:I

.field private mTrimStartDuration:I

.field private mUpdated:Z

.field mVideoEngineId:I

.field private mVolume:I

.field mX:F

.field mY:F

.field mZ:F

.field private mZOrder:I

.field private relationCoordinates:Z

.field private scratchMatrix:Landroid/graphics/Matrix;

.field private scratchPoint:[F

.field private showItem:Z

.field private showOutLien:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;IIII)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mUpdated:Z

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->showItem:Z

    const/4 v1, 0x0

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mId:I

    const/4 v2, 0x0

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateXpos:F

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateYpos:F

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateZpos:F

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPoint:I

    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    iput-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mActiveAnimateList:Ljava/util/Set;

    const/high16 v3, 0x3f800000    # 1.0f

    iput v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAlpha:F

    iput v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mScaledX:F

    iput v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mScaledY:F

    iput v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mScaledZ:F

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeX:F

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeY:F

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeZ:F

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mBrightness:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mContrast:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mSaturation:I

    sget-object v2, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->NONE:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    const/16 v2, 0x3e8

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mLayerExpressionDuration:I

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMaskRect:Landroid/graphics/Rect;

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mTrimStartDuration:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mTrimEndDuration:I

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAudioOnOff:Z

    const/16 v2, 0x64

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mVolume:I

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mSpeedControl:I

    const/4 v2, 0x2

    new-array v2, v2, [F

    fill-array-data v2, :array_0

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->scratchPoint:[F

    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->scratchMatrix:Landroid/graphics/Matrix;

    sget-object v2, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->NONE:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mLayerExpression:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverlayTitle:Z

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->bApplayLayerExpression:Z

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mZOrder:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mFlipMode:I

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayFilter:Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;

    if-le p5, p4, :cond_0

    sget p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->sLastId:I

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mId:I

    sget p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->sLastId:I

    add-int/2addr p1, v0

    sput p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->sLastId:I

    int-to-float p1, p2

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mX:F

    int-to-float p1, p3

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mY:F

    iput p4, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mStartTime:I

    iput p5, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mEndTime:I

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->resetAnimate()V

    return-void

    :cond_0
    new-instance p1, Lcom/nexstreaming/nexeditorsdk/exception/InvalidRangeException;

    invoke-direct {p1, p4, p5}, Lcom/nexstreaming/nexeditorsdk/exception/InvalidRangeException;-><init>(II)V

    throw p1

    :array_0
    .array-data 4
        0x0
        0x0
    .end array-data
.end method

.method public constructor <init>(Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;IZFFII)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mUpdated:Z

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->showItem:Z

    const/4 v1, 0x0

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mId:I

    const/4 v2, 0x0

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateXpos:F

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateYpos:F

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateZpos:F

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPoint:I

    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    iput-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mActiveAnimateList:Ljava/util/Set;

    const/high16 v3, 0x3f800000    # 1.0f

    iput v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAlpha:F

    iput v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mScaledX:F

    iput v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mScaledY:F

    iput v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mScaledZ:F

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeX:F

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeY:F

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeZ:F

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mBrightness:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mContrast:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mSaturation:I

    sget-object v2, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->NONE:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    const/16 v2, 0x3e8

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mLayerExpressionDuration:I

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMaskRect:Landroid/graphics/Rect;

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mTrimStartDuration:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mTrimEndDuration:I

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAudioOnOff:Z

    const/16 v2, 0x64

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mVolume:I

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mSpeedControl:I

    const/4 v2, 0x2

    new-array v2, v2, [F

    fill-array-data v2, :array_0

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->scratchPoint:[F

    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->scratchMatrix:Landroid/graphics/Matrix;

    sget-object v2, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->NONE:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mLayerExpression:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverlayTitle:Z

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->bApplayLayerExpression:Z

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mZOrder:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mFlipMode:I

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayFilter:Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;

    if-le p7, p6, :cond_0

    sget p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->sLastId:I

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mId:I

    sget p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->sLastId:I

    add-int/2addr p1, v0

    sput p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->sLastId:I

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPoint:I

    iput-boolean p3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->relationCoordinates:Z

    iput p4, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mX:F

    iput p5, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mY:F

    iput p6, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mStartTime:I

    iput p7, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mEndTime:I

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->resetAnimate()V

    return-void

    :cond_0
    new-instance p1, Lcom/nexstreaming/nexeditorsdk/exception/InvalidRangeException;

    invoke-direct {p1, p6, p7}, Lcom/nexstreaming/nexeditorsdk/exception/InvalidRangeException;-><init>(II)V

    throw p1

    :array_0
    .array-data 4
        0x0
        0x0
    .end array-data
.end method

.method public constructor <init>(Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;IIII)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mUpdated:Z

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->showItem:Z

    const/4 v1, 0x0

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mId:I

    const/4 v2, 0x0

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateXpos:F

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateYpos:F

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateZpos:F

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPoint:I

    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    iput-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mActiveAnimateList:Ljava/util/Set;

    const/high16 v3, 0x3f800000    # 1.0f

    iput v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAlpha:F

    iput v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mScaledX:F

    iput v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mScaledY:F

    iput v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mScaledZ:F

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeX:F

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeY:F

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeZ:F

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mBrightness:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mContrast:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mSaturation:I

    sget-object v2, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->NONE:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    const/16 v2, 0x3e8

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mLayerExpressionDuration:I

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMaskRect:Landroid/graphics/Rect;

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mTrimStartDuration:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mTrimEndDuration:I

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAudioOnOff:Z

    const/16 v2, 0x64

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mVolume:I

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mSpeedControl:I

    const/4 v2, 0x2

    new-array v2, v2, [F

    fill-array-data v2, :array_0

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->scratchPoint:[F

    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->scratchMatrix:Landroid/graphics/Matrix;

    sget-object v2, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->NONE:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mLayerExpression:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverlayTitle:Z

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->bApplayLayerExpression:Z

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mZOrder:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mFlipMode:I

    sget v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->sLastId:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mId:I

    sget v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->sLastId:I

    add-int/2addr v1, v0

    sput v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->sLastId:I

    if-le p5, p4, :cond_0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayImage:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    int-to-float p1, p2

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mX:F

    int-to-float p1, p3

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mY:F

    iput p4, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mStartTime:I

    iput p5, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mEndTime:I

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->resetAnimate()V

    return-void

    :cond_0
    new-instance p1, Lcom/nexstreaming/nexeditorsdk/exception/InvalidRangeException;

    invoke-direct {p1, p4, p5}, Lcom/nexstreaming/nexeditorsdk/exception/InvalidRangeException;-><init>(II)V

    throw p1

    :array_0
    .array-data 4
        0x0
        0x0
    .end array-data
.end method

.method public constructor <init>(Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;IZFFII)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mUpdated:Z

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->showItem:Z

    const/4 v1, 0x0

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mId:I

    const/4 v2, 0x0

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateXpos:F

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateYpos:F

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateZpos:F

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPoint:I

    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    iput-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mActiveAnimateList:Ljava/util/Set;

    const/high16 v3, 0x3f800000    # 1.0f

    iput v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAlpha:F

    iput v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mScaledX:F

    iput v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mScaledY:F

    iput v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mScaledZ:F

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeX:F

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeY:F

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeZ:F

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mBrightness:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mContrast:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mSaturation:I

    sget-object v2, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->NONE:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    const/16 v2, 0x3e8

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mLayerExpressionDuration:I

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMaskRect:Landroid/graphics/Rect;

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mTrimStartDuration:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mTrimEndDuration:I

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAudioOnOff:Z

    const/16 v2, 0x64

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mVolume:I

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mSpeedControl:I

    const/4 v2, 0x2

    new-array v2, v2, [F

    fill-array-data v2, :array_0

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->scratchPoint:[F

    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->scratchMatrix:Landroid/graphics/Matrix;

    sget-object v2, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->NONE:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mLayerExpression:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverlayTitle:Z

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->bApplayLayerExpression:Z

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mZOrder:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mFlipMode:I

    sget v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->sLastId:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mId:I

    sget v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->sLastId:I

    add-int/2addr v1, v0

    sput v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->sLastId:I

    if-le p7, p6, :cond_0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayImage:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPoint:I

    iput-boolean p3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->relationCoordinates:Z

    iput p4, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mX:F

    iput p5, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mY:F

    iput p6, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mStartTime:I

    iput p7, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mEndTime:I

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->resetAnimate()V

    return-void

    :cond_0
    new-instance p1, Lcom/nexstreaming/nexeditorsdk/exception/InvalidRangeException;

    invoke-direct {p1, p6, p7}, Lcom/nexstreaming/nexeditorsdk/exception/InvalidRangeException;-><init>(II)V

    throw p1

    :array_0
    .array-data 4
        0x0
        0x0
    .end array-data
.end method

.method public constructor <init>(Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterText;IIII)V
    .locals 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mUpdated:Z

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->showItem:Z

    const/4 v1, 0x0

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mId:I

    const/4 v2, 0x0

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateXpos:F

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateYpos:F

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateZpos:F

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPoint:I

    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    iput-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mActiveAnimateList:Ljava/util/Set;

    const/high16 v3, 0x3f800000    # 1.0f

    iput v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAlpha:F

    iput v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mScaledX:F

    iput v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mScaledY:F

    iput v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mScaledZ:F

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeX:F

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeY:F

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeZ:F

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mBrightness:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mContrast:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mSaturation:I

    sget-object v2, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->NONE:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    const/16 v2, 0x3e8

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mLayerExpressionDuration:I

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMaskRect:Landroid/graphics/Rect;

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mTrimStartDuration:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mTrimEndDuration:I

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAudioOnOff:Z

    const/16 v2, 0x64

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mVolume:I

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mSpeedControl:I

    const/4 v2, 0x2

    new-array v2, v2, [F

    fill-array-data v2, :array_0

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->scratchPoint:[F

    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->scratchMatrix:Landroid/graphics/Matrix;

    sget-object v2, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->NONE:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mLayerExpression:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverlayTitle:Z

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->bApplayLayerExpression:Z

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mZOrder:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mFlipMode:I

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->sLastId:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mId:I

    sget v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->sLastId:I

    add-int/2addr v1, v0

    sput v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->sLastId:I

    if-le p5, p4, :cond_0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayImage:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    int-to-float p1, p2

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mX:F

    int-to-float p1, p3

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mY:F

    iput p4, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mStartTime:I

    iput p5, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mEndTime:I

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->resetAnimate()V

    return-void

    :cond_0
    new-instance p1, Lcom/nexstreaming/nexeditorsdk/exception/InvalidRangeException;

    invoke-direct {p1, p4, p5}, Lcom/nexstreaming/nexeditorsdk/exception/InvalidRangeException;-><init>(II)V

    throw p1

    nop

    :array_0
    .array-data 4
        0x0
        0x0
    .end array-data
.end method

.method public constructor <init>(Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterText;IZFFII)V
    .locals 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mUpdated:Z

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->showItem:Z

    const/4 v1, 0x0

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mId:I

    const/4 v2, 0x0

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateXpos:F

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateYpos:F

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateZpos:F

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPoint:I

    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    iput-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mActiveAnimateList:Ljava/util/Set;

    const/high16 v3, 0x3f800000    # 1.0f

    iput v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAlpha:F

    iput v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mScaledX:F

    iput v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mScaledY:F

    iput v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mScaledZ:F

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeX:F

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeY:F

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeZ:F

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mBrightness:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mContrast:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mSaturation:I

    sget-object v2, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->NONE:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    const/16 v2, 0x3e8

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mLayerExpressionDuration:I

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMaskRect:Landroid/graphics/Rect;

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mTrimStartDuration:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mTrimEndDuration:I

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAudioOnOff:Z

    const/16 v2, 0x64

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mVolume:I

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mSpeedControl:I

    const/4 v2, 0x2

    new-array v2, v2, [F

    fill-array-data v2, :array_0

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->scratchPoint:[F

    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->scratchMatrix:Landroid/graphics/Matrix;

    sget-object v2, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->NONE:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mLayerExpression:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverlayTitle:Z

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->bApplayLayerExpression:Z

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mZOrder:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mFlipMode:I

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->sLastId:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mId:I

    sget v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->sLastId:I

    add-int/2addr v1, v0

    sput v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->sLastId:I

    if-le p7, p6, :cond_0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayImage:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPoint:I

    iput-boolean p3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->relationCoordinates:Z

    iput p4, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mX:F

    iput p5, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mY:F

    iput p6, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mStartTime:I

    iput p7, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mEndTime:I

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->resetAnimate()V

    return-void

    :cond_0
    new-instance p1, Lcom/nexstreaming/nexeditorsdk/exception/InvalidRangeException;

    invoke-direct {p1, p6, p7}, Lcom/nexstreaming/nexeditorsdk/exception/InvalidRangeException;-><init>(II)V

    throw p1

    nop

    :array_0
    .array-data 4
        0x0
        0x0
    .end array-data
.end method

.method public constructor <init>(Ljava/lang/String;IIII)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mUpdated:Z

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->showItem:Z

    const/4 v1, 0x0

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mId:I

    const/4 v2, 0x0

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateXpos:F

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateYpos:F

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateZpos:F

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPoint:I

    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    iput-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mActiveAnimateList:Ljava/util/Set;

    const/high16 v3, 0x3f800000    # 1.0f

    iput v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAlpha:F

    iput v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mScaledX:F

    iput v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mScaledY:F

    iput v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mScaledZ:F

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeX:F

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeY:F

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeZ:F

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mBrightness:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mContrast:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mSaturation:I

    sget-object v2, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->NONE:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    const/16 v2, 0x3e8

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mLayerExpressionDuration:I

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMaskRect:Landroid/graphics/Rect;

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mTrimStartDuration:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mTrimEndDuration:I

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAudioOnOff:Z

    const/16 v2, 0x64

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mVolume:I

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mSpeedControl:I

    const/4 v2, 0x2

    new-array v2, v2, [F

    fill-array-data v2, :array_0

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->scratchPoint:[F

    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->scratchMatrix:Landroid/graphics/Matrix;

    sget-object v2, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->NONE:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mLayerExpression:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverlayTitle:Z

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->bApplayLayerExpression:Z

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mZOrder:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mFlipMode:I

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexOverlayPreset;->getOverlayPreset()Lcom/nexstreaming/nexeditorsdk/nexOverlayPreset;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-virtual {v1, p1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayPreset;->getOverlayImage(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    move-result-object v1

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayImage:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayImage:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    if-eqz v1, :cond_1

    if-le p5, p4, :cond_0

    sget p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->sLastId:I

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mId:I

    sget p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->sLastId:I

    add-int/2addr p1, v0

    sput p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->sLastId:I

    int-to-float p1, p2

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mX:F

    int-to-float p1, p3

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mY:F

    iput p4, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mStartTime:I

    iput p5, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mEndTime:I

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->resetAnimate()V

    return-void

    :cond_0
    new-instance p1, Lcom/nexstreaming/nexeditorsdk/exception/InvalidRangeException;

    invoke-direct {p1, p4, p5}, Lcom/nexstreaming/nexeditorsdk/exception/InvalidRangeException;-><init>(II)V

    throw p1

    :cond_1
    new-instance p2, Lcom/nexstreaming/nexeditorsdk/exception/nexSDKException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "Not found OverlayImage. id="

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/nexstreaming/nexeditorsdk/exception/nexSDKException;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_2
    new-instance p1, Lcom/nexstreaming/nexeditorsdk/exception/nexSDKException;

    const-string p2, "nexOverlayPreset is null"

    invoke-direct {p1, p2}, Lcom/nexstreaming/nexeditorsdk/exception/nexSDKException;-><init>(Ljava/lang/String;)V

    throw p1

    nop

    :array_0
    .array-data 4
        0x0
        0x0
    .end array-data
.end method

.method public constructor <init>(Ljava/lang/String;IZFFII)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mUpdated:Z

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->showItem:Z

    const/4 v1, 0x0

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mId:I

    const/4 v2, 0x0

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateXpos:F

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateYpos:F

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateZpos:F

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPoint:I

    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    iput-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mActiveAnimateList:Ljava/util/Set;

    const/high16 v3, 0x3f800000    # 1.0f

    iput v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAlpha:F

    iput v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mScaledX:F

    iput v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mScaledY:F

    iput v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mScaledZ:F

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeX:F

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeY:F

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeZ:F

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mBrightness:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mContrast:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mSaturation:I

    sget-object v2, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->NONE:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    const/16 v2, 0x3e8

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mLayerExpressionDuration:I

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMaskRect:Landroid/graphics/Rect;

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mTrimStartDuration:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mTrimEndDuration:I

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAudioOnOff:Z

    const/16 v2, 0x64

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mVolume:I

    iput v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mSpeedControl:I

    const/4 v2, 0x2

    new-array v2, v2, [F

    fill-array-data v2, :array_0

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->scratchPoint:[F

    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->scratchMatrix:Landroid/graphics/Matrix;

    sget-object v2, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->NONE:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mLayerExpression:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverlayTitle:Z

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->bApplayLayerExpression:Z

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mZOrder:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mFlipMode:I

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexOverlayPreset;->getOverlayPreset()Lcom/nexstreaming/nexeditorsdk/nexOverlayPreset;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-virtual {v1, p1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayPreset;->getOverlayImage(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    move-result-object v1

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayImage:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayImage:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    if-eqz v1, :cond_1

    if-le p7, p6, :cond_0

    sget p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->sLastId:I

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mId:I

    sget p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->sLastId:I

    add-int/2addr p1, v0

    sput p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->sLastId:I

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPoint:I

    iput-boolean p3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->relationCoordinates:Z

    iput p4, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mX:F

    iput p5, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mY:F

    iput p6, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mStartTime:I

    iput p7, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mEndTime:I

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->resetAnimate()V

    return-void

    :cond_0
    new-instance p1, Lcom/nexstreaming/nexeditorsdk/exception/InvalidRangeException;

    invoke-direct {p1, p6, p7}, Lcom/nexstreaming/nexeditorsdk/exception/InvalidRangeException;-><init>(II)V

    throw p1

    :cond_1
    new-instance p2, Lcom/nexstreaming/nexeditorsdk/exception/nexSDKException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "Not found OverlayImage. id="

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/nexstreaming/nexeditorsdk/exception/nexSDKException;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_2
    new-instance p1, Lcom/nexstreaming/nexeditorsdk/exception/nexSDKException;

    const-string p2, "nexOverlayPreset is null"

    invoke-direct {p1, p2}, Lcom/nexstreaming/nexeditorsdk/exception/nexSDKException;-><init>(Ljava/lang/String;)V

    throw p1

    nop

    :array_0
    .array-data 4
        0x0
        0x0
    .end array-data
.end method

.method static synthetic access$1000(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;Z)[I
    .locals 0

    invoke-direct {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getRealPositions(Z)[I

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1100(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;)Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;
    .locals 0

    iget-object p0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayImage:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    return-object p0
.end method

.method static synthetic access$1200(III)Landroid/graphics/Rect;
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getDrawBitmapPosition(III)Landroid/graphics/Rect;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1300(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;)Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;
    .locals 0

    iget-object p0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayFilter:Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;

    return-object p0
.end method

.method static synthetic access$1400(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;)Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;
    .locals 0

    iget-object p0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMask:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;

    return-object p0
.end method

.method static synthetic access$1500(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;)Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;
    .locals 0

    iget-object p0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mLayerExpression:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    return-object p0
.end method

.method public static clearOutLine()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->solidBlackBitmap:Landroid/graphics/Bitmap;

    sput-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->solidWhiteBitmap:Landroid/graphics/Bitmap;

    sput-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->outLineIcon:[Landroid/graphics/Bitmap;

    return-void
.end method

.method protected static clone(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;)Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;
    .locals 2

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->clone(Lcom/nexstreaming/nexeditorsdk/nexColorEffect;)Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    move-result-object v0

    iput-object v0, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayImage:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayImage:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    invoke-static {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->clone(Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;)Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    move-result-object p0

    iput-object p0, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayImage:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;
    :try_end_1
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    goto :goto_0

    :catch_1
    move-exception p0

    move-object v1, v0

    :goto_0
    invoke-virtual {p0}, Ljava/lang/CloneNotSupportedException;->printStackTrace()V

    :cond_0
    :goto_1
    return-object v1
.end method

.method private getAnchorPosition(Z)V
    .locals 1

    const/4 v0, 0x0

    if-nez p1, :cond_0

    invoke-direct {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->updateCoordinates(Z)Z

    move-result p1

    :cond_0
    if-eqz p1, :cond_1

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPoint:I

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->lastLayerWidth:I

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPointX:I

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->lastLayerHeight:I

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPointY:I

    goto :goto_0

    :pswitch_1
    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->lastLayerWidth:I

    div-int/lit8 p1, p1, 0x2

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPointX:I

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->lastLayerHeight:I

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPointY:I

    goto :goto_0

    :pswitch_2
    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPointX:I

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->lastLayerHeight:I

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPointY:I

    goto :goto_0

    :pswitch_3
    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->lastLayerWidth:I

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPointX:I

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->lastLayerHeight:I

    div-int/lit8 p1, p1, 0x2

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPointY:I

    goto :goto_0

    :pswitch_4
    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->lastLayerWidth:I

    div-int/lit8 p1, p1, 0x2

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPointX:I

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->lastLayerHeight:I

    div-int/lit8 p1, p1, 0x2

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPointY:I

    goto :goto_0

    :pswitch_5
    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPointX:I

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->lastLayerHeight:I

    div-int/lit8 p1, p1, 0x2

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPointY:I

    goto :goto_0

    :pswitch_6
    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->lastLayerWidth:I

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPointX:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPointY:I

    goto :goto_0

    :pswitch_7
    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->lastLayerWidth:I

    div-int/lit8 p1, p1, 0x2

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPointX:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPointY:I

    goto :goto_0

    :pswitch_8
    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPointX:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPointY:I

    :cond_1
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private getCombinedBrightness()I
    .locals 3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    if-nez v0, :cond_0

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mBrightness:I

    return v0

    :cond_0
    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mBrightness:I

    const/high16 v1, 0x437f0000    # 255.0f

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->getBrightness()F

    move-result v2

    mul-float v2, v2, v1

    float-to-int v1, v2

    add-int/2addr v0, v1

    return v0
.end method

.method private getCombinedContrast()I
    .locals 3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    if-nez v0, :cond_0

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mContrast:I

    return v0

    :cond_0
    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mContrast:I

    const/high16 v1, 0x437f0000    # 255.0f

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->getContrast()F

    move-result v2

    mul-float v2, v2, v1

    float-to-int v1, v2

    add-int/2addr v0, v1

    return v0
.end method

.method private getCombinedSaturation()I
    .locals 3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    if-nez v0, :cond_0

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mSaturation:I

    return v0

    :cond_0
    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mSaturation:I

    const/high16 v1, 0x437f0000    # 255.0f

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->getSaturation()F

    move-result v2

    mul-float v2, v2, v1

    float-to-int v1, v2

    add-int/2addr v0, v1

    return v0
.end method

.method private static getDrawBitmapPosition(III)Landroid/graphics/Rect;
    .locals 8

    new-instance v0, Landroid/graphics/Rect;

    neg-int v1, p1

    div-int/lit8 v2, v1, 0x2

    neg-int v3, p2

    div-int/lit8 v4, v3, 0x2

    div-int/lit8 v5, p1, 0x2

    div-int/lit8 v6, p2, 0x2

    invoke-direct {v0, v2, v4, v5, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    const/4 v7, 0x0

    packed-switch p0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-virtual {v0, v1, v3, v7, v7}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0

    :pswitch_1
    invoke-virtual {v0, v2, v3, v5, v7}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0

    :pswitch_2
    invoke-virtual {v0, v7, v3, p1, v7}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0

    :pswitch_3
    invoke-virtual {v0, v1, v4, v7, v6}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0

    :pswitch_4
    invoke-virtual {v0, v7, v4, p1, v6}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0

    :pswitch_5
    invoke-virtual {v0, v1, v7, v7, p2}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0

    :pswitch_6
    invoke-virtual {v0, v2, v7, v5, p2}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0

    :pswitch_7
    invoke-virtual {v0, v7, v7, p1, p2}, Landroid/graphics/Rect;->set(IIII)V

    :goto_0
    :pswitch_8
    return-object v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_8
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private getRealPositions(Z)[I
    .locals 6

    const/4 v0, 0x3

    new-array v0, v0, [I

    invoke-direct {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getAnchorPosition(Z)V

    iget-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->relationCoordinates:Z

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz p1, :cond_0

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPointX:I

    iget v4, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->lastLayerWidth:I

    int-to-float v4, v4

    iget v5, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mX:F

    mul-float v4, v4, v5

    float-to-int v4, v4

    add-int/2addr p1, v4

    aput p1, v0, v3

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPointY:I

    iget v4, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->lastLayerHeight:I

    int-to-float v4, v4

    iget v5, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mY:F

    mul-float v4, v4, v5

    float-to-int v4, v4

    add-int/2addr p1, v4

    aput p1, v0, v2

    aput v3, v0, v1

    goto :goto_0

    :cond_0
    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPointX:I

    iget v4, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mX:F

    float-to-int v4, v4

    add-int/2addr p1, v4

    aput p1, v0, v3

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPointY:I

    iget v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mY:F

    float-to-int v3, v3

    add-int/2addr p1, v3

    aput p1, v0, v2

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mZ:F

    float-to-int p1, p1

    aput p1, v0, v1

    :goto_0
    return-object v0
.end method

.method private getRelativeScale(II)F
    .locals 2

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectProfile()Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;

    move-result-object p2

    invoke-virtual {p2}, Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;->getWidth()I

    move-result p2

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectProfile()Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;->getHeight()I

    move-result v0

    const/high16 v1, 0x3f800000    # 1.0f

    if-le p2, p1, :cond_0

    int-to-float p1, p1

    int-to-float p2, p2

    div-float/2addr p1, p2

    goto :goto_0

    :cond_0
    const/high16 p1, 0x3f800000    # 1.0f

    :goto_0
    if-le v0, v0, :cond_1

    int-to-float p2, v0

    div-float v1, p2, p2

    :cond_1
    cmpl-float p2, v1, p1

    if-lez p2, :cond_2

    return p1

    :cond_2
    return v1
.end method

.method private getTintColor()I
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->getTintColor()I

    move-result v0

    return v0
.end method

.method private static renderOutLine(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;)V
    .locals 18

    move-object/from16 v0, p0

    move-object/from16 v6, p1

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->solidBlackBitmap:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_9

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->solidWhiteBitmap:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_9

    iget v1, v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mTime:I

    invoke-virtual {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getBoundInfo(I)Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;

    move-result-object v7

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->i()V

    invoke-static {v7}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->access$1700(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;)F

    move-result v0

    invoke-static {v7}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->access$1800(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;)F

    move-result v1

    invoke-virtual {v6, v0, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(FF)V

    invoke-static {v7}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->access$1900(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;)F

    move-result v0

    invoke-static {v7}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->access$2000(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;)F

    move-result v1

    invoke-virtual {v6, v0, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->b(FF)V

    invoke-static {v7}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->access$2100(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;)F

    move-result v0

    const/4 v8, 0x0

    const/high16 v9, 0x3f800000    # 1.0f

    invoke-virtual {v6, v0, v8, v8, v9}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(FFFF)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->i()V

    invoke-static {v7}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->access$1900(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;)F

    move-result v0

    div-float v0, v9, v0

    invoke-static {v7}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->access$2000(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;)F

    move-result v1

    div-float v1, v9, v1

    invoke-virtual {v6, v0, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->b(FF)V

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v7, v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->getDrawBound(Landroid/graphics/Rect;)V

    iget v1, v0, Landroid/graphics/Rect;->left:I

    int-to-float v1, v1

    invoke-static {v7}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->access$1900(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;)F

    move-result v2

    mul-float v10, v1, v2

    iget v1, v0, Landroid/graphics/Rect;->right:I

    int-to-float v1, v1

    invoke-static {v7}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->access$1900(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;)F

    move-result v2

    mul-float v11, v1, v2

    iget v1, v0, Landroid/graphics/Rect;->top:I

    int-to-float v1, v1

    invoke-static {v7}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->access$2000(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;)F

    move-result v2

    mul-float v12, v1, v2

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    int-to-float v0, v0

    invoke-static {v7}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->access$2000(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;)F

    move-result v1

    mul-float v13, v0, v1

    sget-boolean v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->solidOutlen:Z

    if-eqz v0, :cond_0

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->solidWhiteBitmap:Landroid/graphics/Bitmap;

    sget v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->marchingAnts_width:I

    int-to-float v0, v0

    add-float v4, v10, v0

    move-object/from16 v0, p1

    move v2, v10

    move v3, v12

    move v5, v13

    invoke-virtual/range {v0 .. v5}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(Landroid/graphics/Bitmap;FFFF)V

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->solidWhiteBitmap:Landroid/graphics/Bitmap;

    sget v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->marchingAnts_width:I

    int-to-float v0, v0

    sub-float v2, v11, v0

    move-object/from16 v0, p1

    move v4, v11

    invoke-virtual/range {v0 .. v5}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(Landroid/graphics/Bitmap;FFFF)V

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->solidWhiteBitmap:Landroid/graphics/Bitmap;

    sget v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->marchingAnts_width:I

    int-to-float v0, v0

    add-float v5, v12, v0

    move-object/from16 v0, p1

    move v2, v10

    invoke-virtual/range {v0 .. v5}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(Landroid/graphics/Bitmap;FFFF)V

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->solidWhiteBitmap:Landroid/graphics/Bitmap;

    sget v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->marchingAnts_width:I

    int-to-float v0, v0

    sub-float v3, v13, v0

    move-object/from16 v0, p1

    move v5, v13

    invoke-virtual/range {v0 .. v5}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(Landroid/graphics/Bitmap;FFFF)V

    goto/16 :goto_4

    :cond_0
    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->solidBlackBitmap:Landroid/graphics/Bitmap;

    sget v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->marchingAnts_width:I

    int-to-float v0, v0

    add-float v4, v10, v0

    move-object/from16 v0, p1

    move v2, v10

    move v3, v12

    move v5, v13

    invoke-virtual/range {v0 .. v5}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(Landroid/graphics/Bitmap;FFFF)V

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->solidBlackBitmap:Landroid/graphics/Bitmap;

    sget v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->marchingAnts_width:I

    int-to-float v0, v0

    sub-float v2, v11, v0

    move-object/from16 v0, p1

    move v4, v11

    invoke-virtual/range {v0 .. v5}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(Landroid/graphics/Bitmap;FFFF)V

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->solidBlackBitmap:Landroid/graphics/Bitmap;

    sget v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->marchingAnts_width:I

    int-to-float v0, v0

    add-float v5, v12, v0

    move-object/from16 v0, p1

    move v2, v10

    invoke-virtual/range {v0 .. v5}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(Landroid/graphics/Bitmap;FFFF)V

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->solidBlackBitmap:Landroid/graphics/Bitmap;

    sget v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->marchingAnts_width:I

    int-to-float v0, v0

    sub-float v3, v13, v0

    move-object/from16 v0, p1

    move v5, v13

    invoke-virtual/range {v0 .. v5}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(Landroid/graphics/Bitmap;FFFF)V

    sget v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->marchingAnts_dashSize:I

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    mul-float v14, v0, v1

    sget v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->marchingAnts_dashSize:I

    mul-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    sub-float v0, v10, v0

    move v15, v0

    :goto_0
    cmpg-float v0, v15, v11

    if-gez v0, :cond_3

    add-float v0, v15, v14

    invoke-static {v10, v0}, Ljava/lang/Math;->max(FF)F

    move-result v16

    sget v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->marchingAnts_dashSize:I

    int-to-float v0, v0

    add-float v0, v16, v0

    invoke-static {v11, v0}, Ljava/lang/Math;->min(FF)F

    move-result v17

    cmpg-float v0, v17, v10

    if-ltz v0, :cond_2

    cmpl-float v0, v16, v11

    if-lez v0, :cond_1

    goto :goto_1

    :cond_1
    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->solidWhiteBitmap:Landroid/graphics/Bitmap;

    sget v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->marchingAnts_width:I

    int-to-float v0, v0

    add-float v5, v12, v0

    move-object/from16 v0, p1

    move/from16 v2, v16

    move v3, v12

    move/from16 v4, v17

    invoke-virtual/range {v0 .. v5}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(Landroid/graphics/Bitmap;FFFF)V

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->solidWhiteBitmap:Landroid/graphics/Bitmap;

    sget v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->marchingAnts_width:I

    int-to-float v0, v0

    sub-float v3, v13, v0

    move-object/from16 v0, p1

    move v5, v13

    invoke-virtual/range {v0 .. v5}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(Landroid/graphics/Bitmap;FFFF)V

    :cond_2
    :goto_1
    sget v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->marchingAnts_dashSize:I

    mul-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    add-float/2addr v15, v0

    goto :goto_0

    :cond_3
    sget v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->marchingAnts_dashSize:I

    mul-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    sub-float v0, v12, v0

    move v15, v0

    :goto_2
    cmpg-float v0, v15, v13

    if-gez v0, :cond_6

    add-float v0, v15, v14

    invoke-static {v12, v0}, Ljava/lang/Math;->max(FF)F

    move-result v16

    sget v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->marchingAnts_dashSize:I

    int-to-float v0, v0

    add-float v0, v16, v0

    invoke-static {v13, v0}, Ljava/lang/Math;->min(FF)F

    move-result v17

    cmpg-float v0, v17, v12

    if-ltz v0, :cond_5

    cmpl-float v0, v16, v13

    if-lez v0, :cond_4

    goto :goto_3

    :cond_4
    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->solidWhiteBitmap:Landroid/graphics/Bitmap;

    sget v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->marchingAnts_width:I

    int-to-float v0, v0

    add-float v4, v10, v0

    move-object/from16 v0, p1

    move v2, v10

    move/from16 v3, v16

    move/from16 v5, v17

    invoke-virtual/range {v0 .. v5}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(Landroid/graphics/Bitmap;FFFF)V

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->solidWhiteBitmap:Landroid/graphics/Bitmap;

    sget v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->marchingAnts_width:I

    int-to-float v0, v0

    sub-float v2, v11, v0

    move-object/from16 v0, p1

    move v4, v11

    invoke-virtual/range {v0 .. v5}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(Landroid/graphics/Bitmap;FFFF)V

    :cond_5
    :goto_3
    sget v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->marchingAnts_dashSize:I

    mul-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    add-float/2addr v15, v0

    goto :goto_2

    :cond_6
    :goto_4
    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->j()V

    const/4 v0, 0x0

    :goto_5
    const/4 v1, 0x4

    if-ge v0, v1, :cond_8

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->outLineIcon:[Landroid/graphics/Bitmap;

    aget-object v1, v1, v0

    if-eqz v1, :cond_7

    add-int/lit8 v1, v0, 0x1

    packed-switch v1, :pswitch_data_0

    const/4 v1, 0x0

    const/4 v2, 0x0

    goto :goto_8

    :pswitch_0
    move v1, v11

    goto :goto_6

    :pswitch_1
    move v1, v10

    :goto_6
    move v2, v13

    goto :goto_8

    :pswitch_2
    move v1, v11

    goto :goto_7

    :pswitch_3
    move v1, v10

    :goto_7
    move v2, v12

    :goto_8
    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->i()V

    invoke-static {v7}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->access$1900(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;)F

    move-result v3

    div-float v3, v9, v3

    invoke-static {v7}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->access$2000(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;)F

    move-result v4

    div-float v4, v9, v4

    invoke-virtual {v6, v3, v4}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->b(FF)V

    sget-object v3, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->outLineIcon:[Landroid/graphics/Bitmap;

    aget-object v3, v3, v0

    invoke-virtual {v6, v3, v1, v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(Landroid/graphics/Bitmap;FF)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->j()V

    :cond_7
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    :cond_8
    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->j()V

    :cond_9
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private runAnimate(Lcom/nexstreaming/nexeditorsdk/nexAnimate;I)V
    .locals 4

    instance-of v0, p1, Lcom/nexstreaming/nexeditorsdk/nexAnimate$AnimateImages;

    if-eqz v0, :cond_0

    invoke-virtual {p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->getImageResourceId(I)I

    move-result p1

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->animateResourceId:I

    const-string p1, "nexOverlayItem"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getId()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "]["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, "]AnimateImages=("

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->animateResourceId:I

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, ")"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    :cond_0
    instance-of v0, p1, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Move;

    const/4 v1, 0x3

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mLayerExpression:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->getID()I

    move-result v0

    if-nez v0, :cond_5

    invoke-virtual {p1, p2, v3}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->getTranslatePosition(II)F

    move-result v0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateXpos:F

    invoke-virtual {p1, p2, v2}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->getTranslatePosition(II)F

    move-result v0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateYpos:F

    invoke-virtual {p1, p2, v1}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->getTranslatePosition(II)F

    move-result p1

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateZpos:F

    const-string p1, "nexOverlayItem"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getId()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "]["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, "]Move to=("

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateXpos:F

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p2, ","

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateYpos:F

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p2, ","

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateZpos:F

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p2, ")"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    :cond_1
    instance-of v0, p1, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Alpha;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mLayerExpression:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->getID()I

    move-result v0

    if-nez v0, :cond_5

    invoke-virtual {p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->getAlpha(I)F

    move-result p1

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateLastAlpha:F

    const-string p1, "nexOverlayItem"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getId()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "]["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, "]Alpha =("

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateLastAlpha:F

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p2, ")"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    :cond_2
    instance-of v0, p1, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Rotate;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mLayerExpression:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->getID()I

    move-result v0

    if-nez v0, :cond_5

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeX:F

    invoke-virtual {p1, p2, v0, v3}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->getAngleDegree(IFI)F

    move-result v0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateLastRotateDegreeX:F

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeY:F

    invoke-virtual {p1, p2, v0, v2}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->getAngleDegree(IFI)F

    move-result v0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateLastRotateDegreeY:F

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeZ:F

    invoke-virtual {p1, p2, v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->getAngleDegree(IFI)F

    move-result p1

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateLastRotateDegreeZ:F

    const-string p1, "nexOverlayItem"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getId()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "]["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, "]Rotate =("

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateLastRotateDegreeX:F

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p2, ","

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateLastRotateDegreeY:F

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p2, ","

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateLastRotateDegreeZ:F

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p2, ")"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    :cond_3
    instance-of v0, p1, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mLayerExpression:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->getID()I

    move-result v0

    if-nez v0, :cond_5

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mScaledX:F

    invoke-virtual {p1, p2, v0, v3}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->getScaledRatio(IFI)F

    move-result v0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateLastScaledX:F

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mScaledY:F

    invoke-virtual {p1, p2, v0, v2}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->getScaledRatio(IFI)F

    move-result v0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateLastScaledY:F

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mScaledY:F

    invoke-virtual {p1, p2, v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->getScaledRatio(IFI)F

    move-result p1

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateLastScaledZ:F

    const-string p1, "nexOverlayItem"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getId()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "]["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, "]Scale =("

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateLastScaledX:F

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p2, ","

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateLastScaledY:F

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p2, ","

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateLastScaledZ:F

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p2, ")"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    :cond_4
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mLayerExpression:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;->getID()I

    move-result v0

    if-nez v0, :cond_5

    invoke-virtual {p1, p2, p0}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->onFreeTypeAnimate(ILcom/nexstreaming/nexeditorsdk/nexOverlayItem;)Z

    move-result v0

    if-eqz v0, :cond_5

    iget v0, p1, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mdX:I

    int-to-float v0, v0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateXpos:F

    iget v0, p1, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mdY:I

    int-to-float v0, v0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateYpos:F

    iget v0, p1, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mdZ:I

    int-to-float v0, v0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateZpos:F

    iget v0, p1, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mAlpha:F

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateLastAlpha:F

    iget v0, p1, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mRotateDegreeX:F

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateLastRotateDegreeX:F

    iget v0, p1, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mRotateDegreeY:F

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateLastRotateDegreeY:F

    iget v0, p1, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mRotateDegreeZ:F

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateLastRotateDegreeZ:F

    iget v0, p1, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mScaledX:F

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateLastScaledX:F

    iget v0, p1, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mScaledY:F

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateLastScaledY:F

    iget p1, p1, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mScaledZ:F

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateLastScaledZ:F

    const-string p1, "nexOverlayItem"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getId()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "]["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, "]FreeType =("

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateXpos:F

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p2, ","

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateYpos:F

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p2, ","

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateZpos:F

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p2, ")"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_5
    :goto_0
    return-void
.end method

.method public static setOutLine()V
    .locals 3

    const/4 v0, 0x0

    sput-boolean v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->solidOutlen:Z

    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    const/16 v1, 0x10

    invoke-static {v1, v1, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    sput-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->solidBlackBitmap:Landroid/graphics/Bitmap;

    new-instance v0, Landroid/graphics/Canvas;

    sget-object v2, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->solidBlackBitmap:Landroid/graphics/Bitmap;

    invoke-direct {v0, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    const/high16 v2, -0x1000000

    invoke-virtual {v0, v2}, Landroid/graphics/Canvas;->drawColor(I)V

    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v1, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    sput-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->solidWhiteBitmap:Landroid/graphics/Bitmap;

    new-instance v0, Landroid/graphics/Canvas;

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->solidWhiteBitmap:Landroid/graphics/Bitmap;

    invoke-direct {v0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->drawColor(I)V

    const/4 v0, 0x4

    new-array v0, v0, [Landroid/graphics/Bitmap;

    sput-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->outLineIcon:[Landroid/graphics/Bitmap;

    return-void
.end method

.method public static setOutLineIcon(Landroid/content/Context;II)Z
    .locals 2

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->outLineIcon:[Landroid/graphics/Bitmap;

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    if-lez p1, :cond_2

    const/4 v0, 0x4

    if-le p1, v0, :cond_0

    goto :goto_1

    :cond_0
    const/4 v0, 0x1

    if-nez p2, :cond_1

    sget-object p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->outLineIcon:[Landroid/graphics/Bitmap;

    sub-int/2addr p1, v0

    const/4 p2, 0x0

    aput-object p2, p0, p1

    goto :goto_0

    :cond_1
    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->outLineIcon:[Landroid/graphics/Bitmap;

    sub-int/2addr p1, v0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-static {p0, p2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object p0

    aput-object p0, v1, p1

    :goto_0
    return v0

    :cond_2
    :goto_1
    return v1

    :cond_3
    return v1
.end method

.method public static setOutlineType(Z)V
    .locals 0

    sput-boolean p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->solidOutlen:Z

    return-void
.end method

.method private speedControlTab(I)I
    .locals 3

    const/16 v0, 0xa

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    const/4 v1, 0x0

    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_1

    aget v2, v0, v1

    if-lt v2, p1, :cond_0

    aget p1, v0, v1

    goto :goto_1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/16 p1, 0x190

    :goto_1
    return p1

    :array_0
    .array-data 4
        0xd
        0x19
        0x32
        0x4b
        0x64
        0x7d
        0x96
        0xaf
        0xc8
        0x190
    .end array-data
.end method

.method private updateCoordinates(Z)Z
    .locals 4

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->lastAnchorPoint:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPoint:I

    const/4 v2, 0x1

    if-eq v0, v1, :cond_1

    if-nez p1, :cond_0

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPoint:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->lastAnchorPoint:I

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->lastLayerWidth:I

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectProfile()Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;

    move-result-object v3

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;->getWidth()I

    move-result v3

    if-eq v1, v3, :cond_3

    if-nez p1, :cond_2

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectProfile()Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->lastLayerWidth:I

    :cond_2
    const/4 v0, 0x1

    :cond_3
    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->lastLayerHeight:I

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectProfile()Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;

    move-result-object v3

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;->getHeight()I

    move-result v3

    if-eq v1, v3, :cond_5

    if-nez p1, :cond_4

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectProfile()Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;->getHeight()I

    move-result p1

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->lastLayerHeight:I

    :cond_4
    const/4 v0, 0x1

    :cond_5
    return v0
.end method


# virtual methods
.method public addAnimate(Lcom/nexstreaming/nexeditorsdk/nexAnimate;)V
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAniList:Ljava/util/List;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAniList:Ljava/util/List;

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAniList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mUpdated:Z

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAniList:Ljava/util/List;

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$a;-><init>(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$1;)V

    invoke-static {p1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    return-void
.end method

.method public clearAnimate()V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAniList:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAniList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mUpdated:Z

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->resetAnimate()V

    :cond_0
    return-void
.end method

.method public clearCache()V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-void
.end method

.method public clearTrim()V
    .locals 1

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->isVideo()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mTrimStartDuration:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mTrimEndDuration:I

    return-void

    :cond_0
    new-instance v0, Lcom/nexstreaming/nexeditorsdk/exception/ClipIsNotVideoException;

    invoke-direct {v0}, Lcom/nexstreaming/nexeditorsdk/exception/ClipIsNotVideoException;-><init>()V

    throw v0
.end method

.method public flipHorizontal(Z)V
    .locals 0

    if-eqz p1, :cond_0

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mFlipMode:I

    or-int/lit8 p1, p1, 0x2

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mFlipMode:I

    goto :goto_0

    :cond_0
    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mFlipMode:I

    and-int/lit8 p1, p1, -0x3

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mFlipMode:I

    :goto_0
    return-void
.end method

.method public flipVertical(Z)V
    .locals 0

    if-eqz p1, :cond_0

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mFlipMode:I

    or-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mFlipMode:I

    goto :goto_0

    :cond_0
    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mFlipMode:I

    and-int/lit8 p1, p1, -0x2

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mFlipMode:I

    :goto_0
    return-void
.end method

.method public getAlpha()F
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAlpha:F

    return v0
.end method

.method public getAnchor()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPoint:I

    return v0
.end method

.method public getAnimateEndTime()I
    .locals 4

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAniList:Ljava/util/List;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAniList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nexstreaming/nexeditorsdk/nexAnimate;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->getEndTime()I

    move-result v3

    if-ge v1, v3, :cond_1

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->getEndTime()I

    move-result v1

    goto :goto_0

    :cond_2
    return v1
.end method

.method public getAudioOnOff()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAudioOnOff:Z

    return v0
.end method

.method public getBoundInfo(I)Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;
    .locals 2

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;-><init>(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;ILcom/nexstreaming/nexeditorsdk/nexOverlayItem$1;)V

    return-object v0
.end method

.method public getBrightness()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mBrightness:I

    return v0
.end method

.method public getChromaKey()Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mChromaKey:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;

    if-nez v0, :cond_0

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;

    invoke-direct {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mChromaKey:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mChromaKey:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;

    return-object v0
.end method

.method public getContrast()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mContrast:I

    return v0
.end method

.method public getEnableShow()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->showItem:Z

    return v0
.end method

.method public getEndTime()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mEndTime:I

    return v0
.end method

.method public getEndTrimTime()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mTrimEndDuration:I

    return v0
.end method

.method public getId()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mId:I

    return v0
.end method

.method public getLayerExpression()Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mLayerExpression:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    return-object v0
.end method

.method public getLayerExpressionDuration()I
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mLayerExpressionDuration:I

    return v0
.end method

.method public getLayerExpressiontParam()Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->bApplayLayerExpression:Z

    return v0
.end method

.method public getMask()Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMask:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;

    if-nez v0, :cond_0

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;

    invoke-direct {v0, p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;-><init>(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;)V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMask:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMask:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;

    return-object v0
.end method

.method getOverlayImage()Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayImage:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    return-object v0
.end method

.method getOverlayTitle()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverlayTitle:Z

    return v0
.end method

.method public getPositionX()I
    .locals 2

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getRealPositions(Z)[I

    move-result-object v1

    aget v0, v1, v0

    return v0
.end method

.method public getPositionY()I
    .locals 2

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getRealPositions(Z)[I

    move-result-object v0

    const/4 v1, 0x1

    aget v0, v0, v1

    return v0
.end method

.method public getRelationCoordinates()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->relationCoordinates:Z

    return v0
.end method

.method public getRotate()I
    .locals 1

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getRotateZ()I

    move-result v0

    return v0
.end method

.method public getRotateX()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeX:F

    float-to-int v0, v0

    return v0
.end method

.method public getRotateY()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeY:F

    float-to-int v0, v0

    return v0
.end method

.method public getRotateZ()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeZ:F

    float-to-int v0, v0

    return v0
.end method

.method public getSaturation()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mSaturation:I

    return v0
.end method

.method public getScaledX()F
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mScaledX:F

    return v0
.end method

.method public getScaledY()F
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mScaledY:F

    return v0
.end method

.method public getScaledZ()F
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mScaledZ:F

    return v0
.end method

.method public getSpeedControl()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mSpeedControl:I

    return v0
.end method

.method public getStartTime()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mStartTime:I

    return v0
.end method

.method public getStartTrimTime()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mTrimStartDuration:I

    return v0
.end method

.method public getVolume()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mVolume:I

    return v0
.end method

.method public getZOrder()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mZOrder:I

    return v0
.end method

.method public isFlipHorizontal()Z
    .locals 2

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mFlipMode:I

    const/4 v1, 0x2

    and-int/2addr v0, v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isFlipVertical()Z
    .locals 2

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mFlipMode:I

    const/4 v1, 0x1

    and-int/2addr v0, v1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public isPointInOverlayItem(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$HitPoint;)Z
    .locals 12

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->scratchPoint:[F

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->scratchMatrix:Landroid/graphics/Matrix;

    iget v2, p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$HitPoint;->mTime:I

    invoke-virtual {p0, v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getBoundInfo(I)Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;

    move-result-object v2

    invoke-virtual {v1}, Landroid/graphics/Matrix;->reset()V

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectProfile()Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;

    move-result-object v3

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;->getWidth()I

    move-result v3

    int-to-float v3, v3

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectProfile()Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;

    move-result-object v4

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;->getHeight()I

    move-result v4

    int-to-float v4, v4

    iget v5, p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$HitPoint;->mViewWidth:F

    div-float/2addr v3, v5

    iget v5, p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$HitPoint;->mViewHeight:F

    div-float/2addr v4, v5

    invoke-virtual {v1, v3, v4}, Landroid/graphics/Matrix;->postScale(FF)Z

    invoke-static {v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->access$1700(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;)F

    move-result v3

    neg-float v3, v3

    invoke-static {v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->access$1800(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;)F

    move-result v4

    neg-float v4, v4

    invoke-virtual {v1, v3, v4}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    invoke-static {v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->access$1900(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;)F

    move-result v3

    const/high16 v4, 0x3f800000    # 1.0f

    div-float v3, v4, v3

    invoke-static {v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->access$2000(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;)F

    move-result v5

    div-float/2addr v4, v5

    invoke-virtual {v1, v3, v4}, Landroid/graphics/Matrix;->postScale(FF)Z

    invoke-static {v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->access$2100(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;)F

    move-result v3

    neg-float v3, v3

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4, v4}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    iget v3, p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$HitPoint;->mViewX:F

    const/4 v4, 0x0

    aput v3, v0, v4

    iget v3, p1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$HitPoint;->mViewY:F

    const/4 v5, 0x1

    aput v3, v0, v5

    invoke-virtual {v1, v0}, Landroid/graphics/Matrix;->mapPoints([F)V

    aget v1, v0, v4

    aget v0, v0, v5

    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v2, v3}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->getDrawBound(Landroid/graphics/Rect;)V

    iget v6, v3, Landroid/graphics/Rect;->left:I

    int-to-float v6, v6

    invoke-static {v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->access$1900(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;)F

    move-result v7

    mul-float v6, v6, v7

    iget v7, v3, Landroid/graphics/Rect;->right:I

    int-to-float v7, v7

    invoke-static {v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->access$1900(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;)F

    move-result v8

    mul-float v7, v7, v8

    iget v8, v3, Landroid/graphics/Rect;->top:I

    int-to-float v8, v8

    invoke-static {v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->access$2000(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;)F

    move-result v9

    mul-float v8, v8, v9

    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    int-to-float v3, v3

    invoke-static {v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;->access$2000(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$BoundInfo;)F

    move-result v2

    mul-float v3, v3, v2

    const-string v2, "nexOverlayItem"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "new pos("

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v10, ","

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v10, ") , Rect("

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v10, ","

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v10, ","

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v10, ","

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v10, ") , handleRadius="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/high16 v10, 0x42100000    # 36.0f

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v2, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sub-float v2, v6, v10

    cmpl-float v9, v1, v2

    if-ltz v9, :cond_0

    add-float v9, v6, v10

    cmpg-float v9, v1, v9

    if-gtz v9, :cond_0

    sub-float v9, v8, v10

    cmpl-float v9, v0, v9

    if-ltz v9, :cond_0

    add-float v9, v8, v10

    cmpg-float v9, v0, v9

    if-gtz v9, :cond_0

    invoke-static {p1, v5}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$HitPoint;->access$2202(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$HitPoint;I)I

    goto :goto_0

    :cond_0
    sub-float v9, v7, v10

    cmpl-float v11, v1, v9

    if-ltz v11, :cond_1

    add-float v11, v7, v10

    cmpg-float v11, v1, v11

    if-gtz v11, :cond_1

    sub-float v11, v8, v10

    cmpl-float v11, v0, v11

    if-ltz v11, :cond_1

    add-float v11, v8, v10

    cmpg-float v11, v0, v11

    if-gtz v11, :cond_1

    const/4 v0, 0x2

    invoke-static {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$HitPoint;->access$2202(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$HitPoint;I)I

    goto :goto_0

    :cond_1
    cmpl-float v2, v1, v2

    if-ltz v2, :cond_2

    add-float v2, v6, v10

    cmpg-float v2, v1, v2

    if-gtz v2, :cond_2

    sub-float v2, v3, v10

    cmpl-float v2, v0, v2

    if-ltz v2, :cond_2

    add-float v2, v3, v10

    cmpg-float v2, v0, v2

    if-gtz v2, :cond_2

    const/4 v0, 0x3

    invoke-static {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$HitPoint;->access$2202(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$HitPoint;I)I

    goto :goto_0

    :cond_2
    cmpl-float v2, v1, v9

    if-ltz v2, :cond_3

    add-float v2, v7, v10

    cmpg-float v2, v1, v2

    if-gtz v2, :cond_3

    sub-float v2, v3, v10

    cmpl-float v2, v0, v2

    if-ltz v2, :cond_3

    add-float/2addr v10, v3

    cmpg-float v2, v0, v10

    if-gtz v2, :cond_3

    const/4 v0, 0x4

    invoke-static {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$HitPoint;->access$2202(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$HitPoint;I)I

    goto :goto_0

    :cond_3
    cmpl-float v2, v1, v6

    if-ltz v2, :cond_4

    cmpg-float v1, v1, v7

    if-gtz v1, :cond_4

    cmpl-float v1, v0, v8

    if-ltz v1, :cond_4

    cmpg-float v0, v0, v3

    if-gtz v0, :cond_4

    invoke-static {p1, v4}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$HitPoint;->access$2202(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$HitPoint;I)I

    :goto_0
    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getId()I

    move-result v0

    invoke-static {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$HitPoint;->access$2302(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$HitPoint;I)I

    return v5

    :cond_4
    invoke-static {p1, v4}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$HitPoint;->access$2302(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$HitPoint;I)I

    invoke-static {p1, v4}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$HitPoint;->access$2202(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$HitPoint;I)I

    return v4
.end method

.method isVideo()Z
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayImage:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayImage:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->isVideo()Z

    move-result v0

    return v0
.end method

.method public movePosition(FF)V
    .locals 0

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mX:F

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mY:F

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mUpdated:Z

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->resetAnimate()V

    return-void
.end method

.method onRender(Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;)V
    .locals 3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayFilter:Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayFilter:Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->isUpdated()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->awakeAsset:Lcom/nexstreaming/app/common/nexasset/overlay/AwakeAsset;

    if-eqz v0, :cond_0

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayFilter:Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;

    invoke-virtual {v1, v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->getBound(Landroid/graphics/Rect;)V

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->awakeAsset:Lcom/nexstreaming/app/common/nexasset/overlay/AwakeAsset;

    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2, v0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayFilter:Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->getEncodedEffectOptions()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, p1, v2, v0}, Lcom/nexstreaming/app/common/nexasset/overlay/AwakeAsset;->onRefresh(Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;Landroid/graphics/RectF;Ljava/lang/String;)Z

    :cond_0
    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->a()Lcom/nexstreaming/kminternal/kinemaster/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->b()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->renderOverlay(Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;Landroid/content/Context;)V

    return-void
.end method

.method onRenderAsleep(Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;)V
    .locals 1

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->a()Lcom/nexstreaming/kminternal/kinemaster/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->b()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->renderOverlay(Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;Landroid/content/Context;)V

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->awakeAsset:Lcom/nexstreaming/app/common/nexasset/overlay/AwakeAsset;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->awakeAsset:Lcom/nexstreaming/app/common/nexasset/overlay/AwakeAsset;

    invoke-interface {v0, p1}, Lcom/nexstreaming/app/common/nexasset/overlay/AwakeAsset;->onAsleep(Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->awakeAsset:Lcom/nexstreaming/app/common/nexasset/overlay/AwakeAsset;

    :cond_0
    return-void
.end method

.method onRenderAwake(Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;)V
    .locals 4

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayFilter:Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayFilter:Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->getOverlayAssetFilter()Lcom/nexstreaming/app/common/nexasset/overlay/OverlayAsset;

    move-result-object v0

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayFilter:Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;

    invoke-virtual {v3, v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->getBound(Landroid/graphics/Rect;)V

    new-instance v3, Landroid/graphics/RectF;

    invoke-direct {v3, v2}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayFilter:Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->getEncodedEffectOptions()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, p1, v3, v2, v1}, Lcom/nexstreaming/app/common/nexasset/overlay/OverlayAsset;->onAwake(Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;Landroid/graphics/RectF;Ljava/lang/String;Ljava/util/Map;)Lcom/nexstreaming/app/common/nexasset/overlay/AwakeAsset;

    move-result-object p1

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->awakeAsset:Lcom/nexstreaming/app/common/nexasset/overlay/AwakeAsset;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    goto :goto_0

    :catch_1
    move-exception p1

    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayImage:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayImage:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->isAssetManager()Z

    move-result v0

    if-eqz v0, :cond_1

    :try_start_1
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayImage:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->getOverlayAssetBitmap()Lcom/nexstreaming/app/common/nexasset/overlay/OverlayAsset;

    move-result-object v0

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayImage:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    invoke-virtual {v3, v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->getBound(Landroid/graphics/Rect;)V

    new-instance v3, Landroid/graphics/RectF;

    invoke-direct {v3, v2}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    invoke-interface {v0, p1, v3, v1, v1}, Lcom/nexstreaming/app/common/nexasset/overlay/OverlayAsset;->onAwake(Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;Landroid/graphics/RectF;Ljava/lang/String;Ljava/util/Map;)Lcom/nexstreaming/app/common/nexasset/overlay/AwakeAsset;

    move-result-object p1

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->awakeAsset:Lcom/nexstreaming/app/common/nexasset/overlay/AwakeAsset;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_1

    :catch_2
    move-exception p1

    invoke-virtual {p1}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    goto :goto_1

    :catch_3
    move-exception p1

    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    :cond_1
    :goto_1
    return-void
.end method

.method renderOverlay(Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;Landroid/content/Context;)V
    .locals 18

    move-object/from16 v1, p0

    move-object/from16 v10, p1

    iget-boolean v0, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->showItem:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a()F

    move-result v0

    float-to-int v0, v0

    iput v0, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->lastLayerWidth:I

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->b()F

    move-result v0

    float-to-int v0, v0

    iput v0, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->lastLayerHeight:I

    iget-boolean v0, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->relationCoordinates:Z

    const/high16 v8, 0x3f800000    # 1.0f

    if-eqz v0, :cond_1

    iget v0, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->lastLayerWidth:I

    iget v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->lastLayerHeight:I

    invoke-direct {v1, v0, v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getRelativeScale(II)F

    move-result v0

    move v9, v0

    goto :goto_0

    :cond_1
    const/high16 v9, 0x3f800000    # 1.0f

    :goto_0
    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->g()I

    move-result v0

    invoke-virtual {v1, v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->setTime(I)V

    const/4 v0, 0x1

    invoke-direct {v1, v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getRealPositions(Z)[I

    move-result-object v2

    const/4 v11, 0x0

    aget v12, v2, v11

    aget v13, v2, v0

    const/4 v3, 0x2

    aget v14, v2, v3

    iput v11, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->animateResourceId:I

    iget-object v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAniList:Ljava/util/List;

    if-eqz v2, :cond_6

    iget-object v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAniList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/nexstreaming/nexeditorsdk/nexAnimate;

    iget v4, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mTime:I

    iget v5, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mStartTime:I

    sub-int/2addr v4, v5

    iget-object v5, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mActiveAnimateList:Ljava/util/Set;

    invoke-interface {v5, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    iget v6, v3, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mStartTime:I

    if-gt v6, v4, :cond_5

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->getEndTime()I

    move-result v6

    if-le v6, v4, :cond_5

    if-nez v5, :cond_4

    iget-object v5, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mActiveAnimateList:Ljava/util/Set;

    invoke-interface {v5, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget v5, v3, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mStartTime:I

    sub-int v5, v4, v5

    const/16 v6, 0x21

    if-ge v5, v6, :cond_3

    invoke-direct {v1, v3, v11}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->runAnimate(Lcom/nexstreaming/nexeditorsdk/nexAnimate;I)V

    goto :goto_1

    :cond_3
    invoke-direct {v1, v3, v4}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->runAnimate(Lcom/nexstreaming/nexeditorsdk/nexAnimate;I)V

    goto :goto_1

    :cond_4
    invoke-direct {v1, v3, v4}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->runAnimate(Lcom/nexstreaming/nexeditorsdk/nexAnimate;I)V

    goto :goto_1

    :cond_5
    if-eqz v5, :cond_2

    iget-object v4, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mActiveAnimateList:Ljava/util/Set;

    invoke-interface {v4, v3}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->getEndTime()I

    move-result v4

    invoke-direct {v1, v3, v4}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->runAnimate(Lcom/nexstreaming/nexeditorsdk/nexAnimate;I)V

    goto :goto_1

    :cond_6
    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->i()V

    iget-object v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMask:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;

    if-eqz v2, :cond_8

    iget-object v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMask:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;

    invoke-static {v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->access$000(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;)Z

    move-result v2

    if-eqz v2, :cond_8

    iget-object v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMask:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;

    invoke-static {v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->access$100(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;)Z

    move-result v2

    if-nez v2, :cond_8

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->h()V

    sget-object v2, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$RenderTarget;->Mask:Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$RenderTarget;

    invoke-virtual {v10, v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$RenderTarget;)V

    iget-object v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMask:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;

    iget-object v3, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMaskRect:Landroid/graphics/Rect;

    invoke-virtual {v2, v3}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->getPosition(Landroid/graphics/Rect;)V

    iget-object v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMask:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->getMaskImage()Landroid/graphics/Bitmap;

    move-result-object v2

    if-eqz v2, :cond_7

    iget-object v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMask:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->getMaskImage()Landroid/graphics/Bitmap;

    move-result-object v3

    iget-object v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMaskRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    int-to-float v4, v2

    iget-object v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMaskRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    int-to-float v5, v2

    iget-object v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMaskRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->right:I

    int-to-float v6, v2

    iget-object v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMaskRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    int-to-float v7, v2

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(Landroid/graphics/Bitmap;FFFF)V

    goto :goto_2

    :cond_7
    const/4 v3, -0x1

    iget-object v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMaskRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    int-to-float v4, v2

    iget-object v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMaskRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    int-to-float v5, v2

    iget-object v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMaskRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->right:I

    int-to-float v6, v2

    iget-object v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMaskRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    int-to-float v7, v2

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(IFFFF)V

    :goto_2
    invoke-virtual {v10, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(Z)V

    sget-object v2, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$RenderTarget;->Normal:Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$RenderTarget;

    invoke-virtual {v10, v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$RenderTarget;)V

    :cond_8
    int-to-float v2, v12

    int-to-float v3, v13

    invoke-virtual {v10, v2, v3}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(FF)V

    iget v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateXpos:F

    iget v3, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateYpos:F

    invoke-virtual {v10, v2, v3}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(FF)V

    iget v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateLastScaledX:F

    mul-float v2, v2, v9

    iget v3, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateLastScaledY:F

    mul-float v3, v3, v9

    invoke-virtual {v10, v2, v3}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->b(FF)V

    iget v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateLastRotateDegreeX:F

    const/4 v3, 0x0

    invoke-virtual {v10, v2, v8, v3, v3}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(FFFF)V

    iget v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateLastRotateDegreeY:F

    invoke-virtual {v10, v2, v3, v8, v3}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(FFFF)V

    iget v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateLastRotateDegreeZ:F

    invoke-virtual {v10, v2, v3, v3, v8}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(FFFF)V

    iget-boolean v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->showOutLien:Z

    if-eqz v2, :cond_9

    invoke-virtual {v10, v8}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(F)V

    goto :goto_3

    :cond_9
    iget v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateLastAlpha:F

    invoke-virtual {v10, v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(F)V

    :goto_3
    iget-object v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMask:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;

    if-eqz v2, :cond_b

    iget-object v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMask:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;

    invoke-static {v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->access$000(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;)Z

    move-result v2

    if-eqz v2, :cond_b

    iget-object v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMask:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;

    invoke-static {v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->access$100(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;)Z

    move-result v2

    if-eqz v2, :cond_b

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->h()V

    sget-object v2, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$RenderTarget;->Mask:Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$RenderTarget;

    invoke-virtual {v10, v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$RenderTarget;)V

    iget-object v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMask:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;

    iget-object v3, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMaskRect:Landroid/graphics/Rect;

    invoke-virtual {v2, v3}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->getPosition(Landroid/graphics/Rect;)V

    iget-object v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMask:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->getMaskImage()Landroid/graphics/Bitmap;

    move-result-object v2

    if-eqz v2, :cond_a

    iget-object v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMask:Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$Mask;->getMaskImage()Landroid/graphics/Bitmap;

    move-result-object v3

    iget-object v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMaskRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    int-to-float v4, v2

    iget-object v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMaskRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    int-to-float v5, v2

    iget-object v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMaskRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->right:I

    int-to-float v6, v2

    iget-object v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMaskRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    int-to-float v7, v2

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(Landroid/graphics/Bitmap;FFFF)V

    goto :goto_4

    :cond_a
    const/4 v3, -0x1

    iget-object v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMaskRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    int-to-float v4, v2

    iget-object v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMaskRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    int-to-float v5, v2

    iget-object v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMaskRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->right:I

    int-to-float v6, v2

    iget-object v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mMaskRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    int-to-float v7, v2

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v7}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(IFFFF)V

    :goto_4
    invoke-virtual {v10, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(Z)V

    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$RenderTarget;->Normal:Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$RenderTarget;

    invoke-virtual {v10, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$RenderTarget;)V

    :cond_b
    iget-object v0, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->awakeAsset:Lcom/nexstreaming/app/common/nexasset/overlay/AwakeAsset;

    if-eqz v0, :cond_c

    iget-object v0, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->awakeAsset:Lcom/nexstreaming/app/common/nexasset/overlay/AwakeAsset;

    iget-object v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->cacheMotion:Lcom/nexstreaming/app/common/nexasset/overlay/OverlayMotion;

    iget v3, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mStartTime:I

    iget v4, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mEndTime:I

    invoke-interface {v0, v10, v2, v3, v4}, Lcom/nexstreaming/app/common/nexasset/overlay/AwakeAsset;->onRender(Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;Lcom/nexstreaming/app/common/nexasset/overlay/OverlayMotion;II)V

    goto/16 :goto_8

    :cond_c
    iget-object v0, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayImage:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    if-eqz v0, :cond_17

    iget-object v0, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayImage:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->isVideo()Z

    move-result v0

    const/4 v15, 0x0

    const/high16 v16, 0x437f0000    # 255.0f

    if-eqz v0, :cond_e

    invoke-virtual/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getChromaKey()Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->getChromaKeyEnabled()Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-virtual/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getChromaKey()Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->getChromaKeyEnabled()Z

    move-result v0

    invoke-virtual {v10, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->b(Z)V

    invoke-virtual/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getChromaKey()Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->getChromaKeyMaskEnabled()Z

    move-result v0

    invoke-virtual {v10, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->c(Z)V

    invoke-virtual/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getChromaKey()Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;

    move-result-object v0

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->access$200(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;)I

    move-result v3

    invoke-virtual/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getChromaKey()Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;

    move-result-object v0

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->access$300(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;)F

    move-result v4

    invoke-virtual/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getChromaKey()Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;

    move-result-object v0

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->access$400(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;)F

    move-result v5

    invoke-virtual/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getChromaKey()Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;

    move-result-object v0

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->access$500(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;)F

    move-result v6

    invoke-virtual/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getChromaKey()Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;

    move-result-object v0

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->access$600(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;)F

    move-result v7

    invoke-virtual/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getChromaKey()Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;

    move-result-object v0

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->access$700(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;)F

    move-result v8

    invoke-virtual/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getChromaKey()Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;

    move-result-object v0

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->access$800(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;)F

    move-result v9

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v9}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(IFFFFFF)V

    :cond_d
    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/EditorGlobal;->a()Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    move-result-object v0

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->o()Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$RenderMode;

    move-result-object v2

    iget v2, v2, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$RenderMode;->id:I

    iget v3, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mVideoEngineId:I

    invoke-virtual {v0, v2, v3}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->b(II)I

    move-result v3

    invoke-direct/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getCombinedBrightness()I

    move-result v0

    int-to-float v0, v0

    div-float v0, v0, v16

    invoke-direct/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getCombinedContrast()I

    move-result v2

    int-to-float v2, v2

    div-float v2, v2, v16

    invoke-direct/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getCombinedSaturation()I

    move-result v4

    int-to-float v4, v4

    div-float v4, v4, v16

    invoke-direct/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getTintColor()I

    move-result v5

    invoke-static {v0, v2, v4, v5}, Lcom/nexstreaming/app/common/thememath/a;->a(FFFI)Landroid/graphics/ColorMatrix;

    move-result-object v0

    invoke-virtual {v10, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(Landroid/graphics/ColorMatrix;)V

    const/4 v4, 0x0

    const/4 v5, 0x0

    iget-object v0, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayImage:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->getVideoClipInfo()Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;->getWidth()I

    move-result v0

    int-to-float v6, v0

    iget-object v0, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayImage:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->getVideoClipInfo()Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;->getHeight()I

    move-result v0

    int-to-float v7, v0

    iget v8, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mFlipMode:I

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v8}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(IFFFFI)V

    invoke-virtual {v10, v11}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->b(Z)V

    invoke-virtual {v10, v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(Landroid/graphics/Bitmap;)V

    goto/16 :goto_8

    :cond_e
    invoke-static {}, Lcom/nexstreaming/kminternal/nexvideoeditor/b;->a()Lcom/nexstreaming/kminternal/nexvideoeditor/b;

    move-result-object v0

    iget v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->animateResourceId:I

    if-nez v2, :cond_f

    iget-object v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayImage:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    iget v2, v2, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mResourceId:I

    :cond_f
    if-nez v2, :cond_12

    iget-object v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayImage:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->getUserBitmapID()Ljava/lang/String;

    move-result-object v2

    iget-object v3, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayImage:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    iget-boolean v3, v3, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mUpdate:Z

    if-eqz v3, :cond_10

    iget-object v3, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayImage:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    iput-boolean v11, v3, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->mUpdate:Z

    invoke-virtual {v0, v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/b;->b(Ljava/lang/Object;)V

    goto :goto_5

    :cond_10
    invoke-virtual {v0, v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/b;->a(Ljava/lang/Object;)Landroid/graphics/Bitmap;

    move-result-object v15

    :goto_5
    if-nez v15, :cond_11

    iget-object v3, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayImage:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->getUserBitmap()Landroid/graphics/Bitmap;

    move-result-object v3

    if-eqz v3, :cond_15

    :try_start_0
    invoke-virtual {v0, v2, v3}, Lcom/nexstreaming/kminternal/nexvideoeditor/b;->a(Ljava/lang/Object;Landroid/graphics/Bitmap;)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_7

    :catch_0
    move-exception v0

    move-object v4, v0

    const-string v0, "nexOverlayItem"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "exception: message="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/NullPointerException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_7

    :cond_11
    move-object v3, v15

    goto :goto_7

    :cond_12
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayImage:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->getUserBitmapID()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/nexstreaming/kminternal/nexvideoeditor/b;->a(Ljava/lang/Object;)Landroid/graphics/Bitmap;

    move-result-object v4

    if-nez v4, :cond_14

    invoke-virtual/range {p2 .. p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-static {v4, v2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v2

    if-eqz v2, :cond_13

    :try_start_1
    invoke-virtual {v0, v3, v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/b;->a(Ljava/lang/Object;Landroid/graphics/Bitmap;)V
    :try_end_1
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_6

    :catch_1
    move-exception v0

    move-object v4, v0

    const-string v0, "nexOverlayItem"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "exception: message="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/NullPointerException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_13
    :goto_6
    move-object/from16 v17, v3

    move-object v3, v2

    move-object/from16 v2, v17

    goto :goto_7

    :cond_14
    move-object v2, v3

    move-object v3, v4

    :cond_15
    :goto_7
    if-eqz v3, :cond_17

    const-string v0, "nexOverlayItem"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "renderOverlay bitmap id = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", wid = "

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", hei = "

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", X="

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", Y="

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", Z="

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", ScaledX="

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateLastScaledX:F

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, ", Alpha="

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateLastAlpha:F

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, ", Rx="

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateLastRotateDegreeX:F

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, ", Ry="

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateLastRotateDegreeY:F

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, ", Rz="

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateLastRotateDegreeZ:F

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, ", flip="

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mFlipMode:I

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", baseScale="

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, ", cts="

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->g()I

    move-result v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getCombinedBrightness()I

    move-result v0

    int-to-float v0, v0

    div-float v0, v0, v16

    invoke-direct/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getCombinedContrast()I

    move-result v2

    int-to-float v2, v2

    div-float v2, v2, v16

    invoke-direct/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getCombinedSaturation()I

    move-result v4

    int-to-float v4, v4

    div-float v4, v4, v16

    invoke-direct/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getTintColor()I

    move-result v5

    invoke-static {v0, v2, v4, v5}, Lcom/nexstreaming/app/common/thememath/a;->a(FFFI)Landroid/graphics/ColorMatrix;

    move-result-object v0

    invoke-virtual {v10, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(Landroid/graphics/ColorMatrix;)V

    iget-object v0, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayImage:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    if-eqz v0, :cond_16

    iget-object v0, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayImage:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->getAnchorPoint()I

    move-result v0

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    invoke-static {v0, v2, v4}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->getDrawBitmapPosition(III)Landroid/graphics/Rect;

    move-result-object v0

    iget v2, v0, Landroid/graphics/Rect;->left:I

    int-to-float v4, v2

    iget v2, v0, Landroid/graphics/Rect;->top:I

    int-to-float v5, v2

    iget v2, v0, Landroid/graphics/Rect;->right:I

    int-to-float v6, v2

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    int-to-float v7, v0

    iget v8, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mFlipMode:I

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v8}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(Landroid/graphics/Bitmap;FFFFI)V

    goto :goto_8

    :cond_16
    iget v0, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mFlipMode:I

    invoke-virtual {v10, v3, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->b(Landroid/graphics/Bitmap;I)V

    :cond_17
    :goto_8
    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->j()V

    iget-boolean v0, v1, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->showOutLien:Z

    if-eqz v0, :cond_18

    invoke-static/range {p0 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->renderOutLine(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;)V

    :cond_18
    return-void
.end method

.method resetAnimate()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateXpos:F

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateYpos:F

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateTranslateZpos:F

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAlpha:F

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateLastAlpha:F

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeX:F

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateLastRotateDegreeX:F

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeY:F

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateLastRotateDegreeY:F

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeZ:F

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateLastRotateDegreeZ:F

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mScaledX:F

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateLastScaledX:F

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mScaledY:F

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateLastScaledY:F

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mScaledZ:F

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAnimateLastScaledZ:F

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mActiveAnimateList:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    return-void
.end method

.method public setAlpha(F)V
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAlpha:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mUpdated:Z

    :cond_0
    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAlpha:F

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->resetAnimate()V

    return-void
.end method

.method public setAnchor(I)V
    .locals 0

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPoint:I

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mUpdated:Z

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->resetAnimate()V

    return-void
.end method

.method public setAudioOnOff(Z)V
    .locals 1

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->isVideo()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAudioOnOff:Z

    if-eq v0, p1, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mUpdated:Z

    :cond_0
    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mAudioOnOff:Z

    return-void

    :cond_1
    new-instance p1, Lcom/nexstreaming/nexeditorsdk/exception/ClipIsNotVideoException;

    invoke-direct {p1}, Lcom/nexstreaming/nexeditorsdk/exception/ClipIsNotVideoException;-><init>()V

    throw p1
.end method

.method public setBrightness(I)Z
    .locals 2

    const/16 v0, -0xff

    if-lt p1, v0, :cond_2

    const/16 v0, 0xff

    if-le p1, v0, :cond_0

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mBrightness:I

    const/4 v1, 0x1

    if-eq v0, p1, :cond_1

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mUpdated:Z

    :cond_1
    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mBrightness:I

    return v1

    :cond_2
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public setColorEffect(Lcom/nexstreaming/nexeditorsdk/nexColorEffect;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mColorEffect:Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    return-void
.end method

.method public setContrast(I)Z
    .locals 2

    const/16 v0, -0xff

    if-lt p1, v0, :cond_2

    const/16 v0, 0xff

    if-le p1, v0, :cond_0

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mContrast:I

    const/4 v1, 0x1

    if-eq v0, p1, :cond_1

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mUpdated:Z

    :cond_1
    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mContrast:I

    return v1

    :cond_2
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public setEnableShow(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->showItem:Z

    return-void
.end method

.method public setLayerExpression(Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mLayerExpression:Lcom/nexstreaming/nexeditorsdk/nexOverlayKineMasterExpression;

    return-void
.end method

.method public setLayerExpressionDuration(I)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mLayerExpressionDuration:I

    return-void
.end method

.method public setLayerExpressionParam(Z)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->bApplayLayerExpression:Z

    if-eq v0, p1, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mUpdated:Z

    :cond_0
    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->bApplayLayerExpression:Z

    return-void
.end method

.method setOverlayTitle(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverlayTitle:Z

    return-void
.end method

.method public setPosition(II)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->updateCoordinates(Z)Z

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->relationCoordinates:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPointX:I

    sub-int/2addr p1, v0

    int-to-float p1, p1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->lastLayerWidth:I

    int-to-float v0, v0

    div-float/2addr p1, v0

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mX:F

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPointY:I

    sub-int/2addr p2, p1

    int-to-float p1, p2

    iget p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->lastLayerHeight:I

    int-to-float p2, p2

    div-float/2addr p1, p2

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mY:F

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPointX:I

    sub-int/2addr p1, v0

    int-to-float p1, p1

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mX:F

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->anchorPointY:I

    sub-int/2addr p2, p1

    int-to-float p1, p2

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mY:F

    :goto_0
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mUpdated:Z

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->resetAnimate()V

    return-void
.end method

.method public setRelationCoordinates(Z)V
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->relationCoordinates:Z

    if-eq v0, p1, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mUpdated:Z

    :cond_0
    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->relationCoordinates:Z

    return-void
.end method

.method public setRotate(F)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->setRotate(FFF)V

    return-void
.end method

.method public setRotate(FFF)V
    .locals 0

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeX:F

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeY:F

    iput p3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeZ:F

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mUpdated:Z

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->resetAnimate()V

    return-void
.end method

.method public setRotate(I)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->setRotate(III)V

    return-void
.end method

.method public setRotate(III)V
    .locals 0

    int-to-float p1, p1

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeX:F

    int-to-float p1, p2

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeY:F

    int-to-float p1, p3

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mRotateDegreeZ:F

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mUpdated:Z

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->resetAnimate()V

    return-void
.end method

.method public setSaturation(I)Z
    .locals 2

    const/16 v0, -0xff

    if-lt p1, v0, :cond_2

    const/16 v0, 0xff

    if-le p1, v0, :cond_0

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mSaturation:I

    const/4 v1, 0x1

    if-eq v0, p1, :cond_1

    iput-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mUpdated:Z

    :cond_1
    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mSaturation:I

    return v1

    :cond_2
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public setScale(FF)V
    .locals 1

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, p1, p2, v0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->setScale(FFF)V

    return-void
.end method

.method public setScale(FFF)V
    .locals 0

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mScaledX:F

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mScaledY:F

    iput p3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mScaledZ:F

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mUpdated:Z

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->resetAnimate()V

    return-void
.end method

.method public setSpeedControl(I)V
    .locals 1

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->isVideo()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->speedControlTab(I)I

    move-result p1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mSpeedControl:I

    if-eq v0, p1, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mUpdated:Z

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mSpeedControl:I

    :cond_0
    return-void

    :cond_1
    new-instance p1, Lcom/nexstreaming/nexeditorsdk/exception/ClipIsNotVideoException;

    invoke-direct {p1}, Lcom/nexstreaming/nexeditorsdk/exception/ClipIsNotVideoException;-><init>()V

    throw p1
.end method

.method setTime(I)V
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mTime:I

    if-le v0, p1, :cond_0

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->resetAnimate()V

    :cond_0
    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mTime:I

    return-void
.end method

.method public setTimePosition(II)V
    .locals 1

    if-le p2, p1, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mUpdated:Z

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mStartTime:I

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mEndTime:I

    return-void

    :cond_0
    new-instance v0, Lcom/nexstreaming/nexeditorsdk/exception/InvalidRangeException;

    invoke-direct {v0, p1, p2}, Lcom/nexstreaming/nexeditorsdk/exception/InvalidRangeException;-><init>(II)V

    throw v0
.end method

.method public setTrim(II)V
    .locals 1

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->isVideo()Z

    move-result v0

    if-eqz v0, :cond_2

    if-le p2, p1, :cond_1

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mTrimStartDuration:I

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mOverLayImage:Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage;->getVideoClipInfo()Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexOverlayImage$VideoClipInfo;->getTotalTime()I

    move-result p1

    sub-int/2addr p1, p2

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mTrimEndDuration:I

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mUpdated:Z

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mTrimEndDuration:I

    if-ltz p1, :cond_0

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mTrimStartDuration:I

    if-ltz p1, :cond_0

    return-void

    :cond_0
    new-instance p1, Lcom/nexstreaming/nexeditorsdk/exception/InvalidRangeException;

    iget p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mTrimStartDuration:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mTrimEndDuration:I

    invoke-direct {p1, p2, v0}, Lcom/nexstreaming/nexeditorsdk/exception/InvalidRangeException;-><init>(II)V

    throw p1

    :cond_1
    new-instance v0, Lcom/nexstreaming/nexeditorsdk/exception/InvalidRangeException;

    invoke-direct {v0, p1, p2}, Lcom/nexstreaming/nexeditorsdk/exception/InvalidRangeException;-><init>(II)V

    throw v0

    :cond_2
    new-instance p1, Lcom/nexstreaming/nexeditorsdk/exception/ClipIsNotVideoException;

    invoke-direct {p1}, Lcom/nexstreaming/nexeditorsdk/exception/ClipIsNotVideoException;-><init>()V

    throw p1
.end method

.method public setVolume(I)V
    .locals 1

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->isVideo()Z

    move-result v0

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mVolume:I

    if-eq v0, p1, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mUpdated:Z

    :cond_0
    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mVolume:I

    return-void

    :cond_1
    new-instance p1, Lcom/nexstreaming/nexeditorsdk/exception/ClipIsNotVideoException;

    invoke-direct {p1}, Lcom/nexstreaming/nexeditorsdk/exception/ClipIsNotVideoException;-><init>()V

    throw p1
.end method

.method public setZOrder(I)V
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mZOrder:I

    if-eq v0, p1, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mUpdated:Z

    :cond_0
    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mZOrder:I

    return-void
.end method

.method public showOutline(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->showOutLien:Z

    return-void
.end method

.method updated(Z)Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mUpdated:Z

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;->mUpdated:Z

    return v0
.end method
