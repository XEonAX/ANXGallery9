.class public Lcom/miui/gallery/collage/widget/CollageStitchingLayout;
.super Landroid/view/ViewGroup;
.source "CollageStitchingLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/collage/widget/CollageStitchingLayout$BitmapPositionHolder;,
        Lcom/miui/gallery/collage/widget/CollageStitchingLayout$LayoutParams;,
        Lcom/miui/gallery/collage/widget/CollageStitchingLayout$RenderData;,
        Lcom/miui/gallery/collage/widget/CollageStitchingLayout$ItemDragHelper;,
        Lcom/miui/gallery/collage/widget/CollageStitchingLayout$DragGestureListener;,
        Lcom/miui/gallery/collage/widget/CollageStitchingLayout$GestureListener;
    }
.end annotation


# instance fields
.field private final PROPERTY_NAME_ALPHA:Ljava/lang/String;

.field private final PROPERTY_NAME_MATRIX:Ljava/lang/String;

.field private final PROPERTY_NAME_RECT:Ljava/lang/String;

.field private mActiveLineWidth:I

.field private mActiveLineWidthWhite:I

.field private mActiveView:Lcom/miui/gallery/collage/widget/CollageImageView;

.field private mBackGroundColor:I

.field private mBackgroundPaint:Landroid/graphics/Paint;

.field private mBitmapPositionHolder:Lcom/miui/gallery/collage/widget/CollageStitchingLayout$BitmapPositionHolder;

.field private mBitmaps:[Landroid/graphics/Bitmap;

.field private mCanvasRect:Landroid/graphics/RectF;

.field private mControlListener:Lcom/miui/gallery/collage/widget/ControlPopupWindow$ControlListener;

.field private mControlPopupWindow:Lcom/miui/gallery/collage/widget/ControlPopupWindow;

.field private mDisplayRect:Landroid/graphics/Rect;

.field private mDragModeDetector:Landroid/view/GestureDetector;

.field private mEnableDragMode:Z

.field private mGestureDetector:Landroid/view/GestureDetector;

.field private mImageViewMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/graphics/Bitmap;",
            "Lcom/miui/gallery/collage/widget/CollageImageView;",
            ">;"
        }
    .end annotation
.end field

.field private mItemDragHelper:Lcom/miui/gallery/collage/widget/CollageStitchingLayout$ItemDragHelper;

.field private mMaxScrollY:I

.field private mMinScrollY:I

.field private mPath:Landroid/graphics/Path;

.field private mPathPaint:Landroid/graphics/Paint;

.field private mRectF:Landroid/graphics/RectF;

.field private mReplaceImageListener:Lcom/miui/gallery/collage/CollageActivity$ReplaceImageListener;

.field private mScrollAnimator:Landroid/animation/ValueAnimator;

.field private mScrollAnimatorUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

.field private mScrollSpeed:F

.field private mScroller:Landroid/widget/OverScroller;

.field private mStitchingModel:Lcom/miui/gallery/collage/core/stitching/StitchingModel;

.field private mStrokeColor:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    const-string p1, "property_name_alpha"

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->PROPERTY_NAME_ALPHA:Ljava/lang/String;

    const-string p1, "property_name_matrix"

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->PROPERTY_NAME_MATRIX:Ljava/lang/String;

    const-string p1, "property_name_rect"

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->PROPERTY_NAME_RECT:Ljava/lang/String;

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mScrollSpeed:F

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mEnableDragMode:Z

    new-instance p1, Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mBackgroundPaint:Landroid/graphics/Paint;

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mActiveView:Lcom/miui/gallery/collage/widget/CollageImageView;

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mImageViewMap:Ljava/util/Map;

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mRectF:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mCanvasRect:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mDisplayRect:Landroid/graphics/Rect;

    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mPath:Landroid/graphics/Path;

    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mPathPaint:Landroid/graphics/Paint;

    new-instance p1, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$2;

    invoke-direct {p1, p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$2;-><init>(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;)V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mScrollAnimatorUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    new-instance p1, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$5;

    invoke-direct {p1, p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$5;-><init>(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;)V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mControlListener:Lcom/miui/gallery/collage/widget/ControlPopupWindow$ControlListener;

    invoke-direct {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const-string p1, "property_name_alpha"

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->PROPERTY_NAME_ALPHA:Ljava/lang/String;

    const-string p1, "property_name_matrix"

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->PROPERTY_NAME_MATRIX:Ljava/lang/String;

    const-string p1, "property_name_rect"

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->PROPERTY_NAME_RECT:Ljava/lang/String;

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mScrollSpeed:F

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mEnableDragMode:Z

    new-instance p1, Landroid/graphics/Paint;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mBackgroundPaint:Landroid/graphics/Paint;

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mActiveView:Lcom/miui/gallery/collage/widget/CollageImageView;

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mImageViewMap:Ljava/util/Map;

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mRectF:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mCanvasRect:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mDisplayRect:Landroid/graphics/Rect;

    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mPath:Landroid/graphics/Path;

    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mPathPaint:Landroid/graphics/Paint;

    new-instance p1, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$2;

    invoke-direct {p1, p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$2;-><init>(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;)V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mScrollAnimatorUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    new-instance p1, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$5;

    invoke-direct {p1, p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$5;-><init>(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;)V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mControlListener:Lcom/miui/gallery/collage/widget/ControlPopupWindow$ControlListener;

    invoke-direct {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const-string p1, "property_name_alpha"

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->PROPERTY_NAME_ALPHA:Ljava/lang/String;

    const-string p1, "property_name_matrix"

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->PROPERTY_NAME_MATRIX:Ljava/lang/String;

    const-string p1, "property_name_rect"

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->PROPERTY_NAME_RECT:Ljava/lang/String;

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mScrollSpeed:F

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mEnableDragMode:Z

    new-instance p1, Landroid/graphics/Paint;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mBackgroundPaint:Landroid/graphics/Paint;

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mActiveView:Lcom/miui/gallery/collage/widget/CollageImageView;

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mImageViewMap:Ljava/util/Map;

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mRectF:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mCanvasRect:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mDisplayRect:Landroid/graphics/Rect;

    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mPath:Landroid/graphics/Path;

    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mPathPaint:Landroid/graphics/Paint;

    new-instance p1, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$2;

    invoke-direct {p1, p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$2;-><init>(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;)V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mScrollAnimatorUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    new-instance p1, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$5;

    invoke-direct {p1, p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$5;-><init>(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;)V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mControlListener:Lcom/miui/gallery/collage/widget/ControlPopupWindow$ControlListener;

    invoke-direct {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->init()V

    return-void
.end method

.method static synthetic access$1000(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;Lcom/miui/gallery/collage/widget/CollageImageView;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->setActiveView(Lcom/miui/gallery/collage/widget/CollageImageView;)V

    return-void
.end method

.method static synthetic access$1100(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;F)I
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->appendScroll(F)I

    move-result p0

    return p0
.end method

.method static synthetic access$1200(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;F)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->notifyZoomOut(F)V

    return-void
.end method

.method static synthetic access$1300(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->startContinueScroll()V

    return-void
.end method

.method static synthetic access$1400(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;F)Lcom/miui/gallery/collage/widget/CollageImageView;
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->findTargetView(F)Lcom/miui/gallery/collage/widget/CollageImageView;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1500(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mMinScrollY:I

    return p0
.end method

.method static synthetic access$1600(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mMaxScrollY:I

    return p0
.end method

.method static synthetic access$1700(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;F)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->computeScrollSpeed(F)V

    return-void
.end method

.method static synthetic access$1800(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;Landroid/graphics/RectF;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getChildRect(Landroid/graphics/RectF;Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$1900(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;Landroid/graphics/RectF;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->convertCoordinateToParent(Landroid/graphics/RectF;)V

    return-void
.end method

.method static synthetic access$2000(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;)Landroid/graphics/RectF;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mRectF:Landroid/graphics/RectF;

    return-object p0
.end method

.method static synthetic access$2100(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;II)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->swipeViewIndex(II)V

    return-void
.end method

.method static synthetic access$2200(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->scrollToMin()V

    return-void
.end method

.method static synthetic access$2300(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;)Lcom/miui/gallery/collage/CollageActivity$ReplaceImageListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mReplaceImageListener:Lcom/miui/gallery/collage/CollageActivity$ReplaceImageListener;

    return-object p0
.end method

.method static synthetic access$2400(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;)Lcom/miui/gallery/collage/widget/CollageImageView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mActiveView:Lcom/miui/gallery/collage/widget/CollageImageView;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;F)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->notifyZoomIn(F)V

    return-void
.end method

.method static synthetic access$400(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->cancelContinueScroll()V

    return-void
.end method

.method static synthetic access$500(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;)Lcom/miui/gallery/collage/widget/CollageStitchingLayout$ItemDragHelper;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mItemDragHelper:Lcom/miui/gallery/collage/widget/CollageStitchingLayout$ItemDragHelper;

    return-object p0
.end method

.method static synthetic access$602(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mEnableDragMode:Z

    return p1
.end method

.method static synthetic access$700(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;)Landroid/widget/OverScroller;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mScroller:Landroid/widget/OverScroller;

    return-object p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;)F
    .locals 0

    iget p0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mScrollSpeed:F

    return p0
.end method

.method static synthetic access$802(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;F)F
    .locals 0

    iput p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mScrollSpeed:F

    return p1
.end method

.method static synthetic access$900(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;FF)Lcom/miui/gallery/collage/widget/CollageImageView;
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->findSingleView(FF)Lcom/miui/gallery/collage/widget/CollageImageView;

    move-result-object p0

    return-object p0
.end method

.method private appendScroll(F)I
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getScrollY()I

    move-result v0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    add-int/2addr v0, p1

    iget p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mMaxScrollY:I

    if-le v0, p1, :cond_0

    iget v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mMaxScrollY:I

    goto :goto_0

    :cond_0
    iget p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mMinScrollY:I

    if-ge v0, p1, :cond_1

    iget v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mMinScrollY:I

    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getScrollY()I

    move-result p1

    sub-int p1, v0, p1

    if-eqz p1, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getScrollX()I

    move-result v1

    invoke-virtual {p0, v1, v0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->scrollTo(II)V

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->invalidate()V

    :cond_2
    return p1
.end method

.method private cancelContinueScroll()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mScrollAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mScrollAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mScrollAnimator:Landroid/animation/ValueAnimator;

    :cond_0
    return-void
.end method

.method private computeScrollSpeed(F)V
    .locals 4

    const/4 v0, 0x0

    cmpg-float v1, p1, v0

    if-gez v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    const/high16 v2, 0x42c80000    # 100.0f

    cmpg-float v3, p1, v2

    if-gez v3, :cond_1

    iput v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mScrollSpeed:F

    return-void

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mDisplayRect:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-float v0, v0

    cmpl-float v0, p1, v0

    if-lez v0, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mDisplayRect:Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result p1

    int-to-float p1, p1

    :cond_2
    const/high16 v0, 0x40a00000    # 5.0f

    const/high16 v3, 0x42820000    # 65.0f

    sub-float/2addr p1, v2

    mul-float p1, p1, v3

    iget-object v2, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mDisplayRect:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v2

    add-int/lit8 v2, v2, -0x64

    int-to-float v2, v2

    div-float/2addr p1, v2

    add-float/2addr p1, v0

    iput p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mScrollSpeed:F

    if-eqz v1, :cond_3

    iget p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mScrollSpeed:F

    neg-float p1, p1

    iput p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mScrollSpeed:F

    :cond_3
    return-void
.end method

.method private convertCoordinateToParent(Landroid/graphics/RectF;)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getScrollY()I

    move-result v0

    neg-int v0, v0

    int-to-float v0, v0

    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Landroid/graphics/RectF;->offset(FF)V

    return-void
.end method

.method private doZoomInAnimator()V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    const-wide/16 v1, 0x12c

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    return-void
.end method

.method private doZoomOutAnimator(F)V
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->setPivotY(F)V

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const v0, 0x3f19999a    # 0.6f

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    const-wide/16 v0, 0x12c

    invoke-virtual {p1, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    return-void
.end method

.method private findSingleView(FF)Lcom/miui/gallery/collage/widget/CollageImageView;
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    invoke-virtual {p0, v1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/collage/widget/CollageImageView;

    iget-object v3, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mRectF:Landroid/graphics/RectF;

    invoke-direct {p0, v3, v2}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getChildRect(Landroid/graphics/RectF;Landroid/view/View;)V

    iget-object v3, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mRectF:Landroid/graphics/RectF;

    invoke-direct {p0, v3}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->convertCoordinateToParent(Landroid/graphics/RectF;)V

    iget-object v3, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mRectF:Landroid/graphics/RectF;

    invoke-virtual {v3, p1, p2}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v3

    if-eqz v3, :cond_0

    return-object v2

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method private findTargetView(F)Lcom/miui/gallery/collage/widget/CollageImageView;
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    invoke-virtual {p0, v1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/collage/widget/CollageImageView;

    iget-object v3, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mRectF:Landroid/graphics/RectF;

    invoke-direct {p0, v3, v2}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getChildRect(Landroid/graphics/RectF;Landroid/view/View;)V

    iget-object v3, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mRectF:Landroid/graphics/RectF;

    invoke-direct {p0, v3}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->convertCoordinateToParent(Landroid/graphics/RectF;)V

    iget-object v3, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mRectF:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->top:F

    cmpl-float v3, p1, v3

    if-lez v3, :cond_0

    iget-object v3, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mRectF:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->bottom:F

    cmpg-float v3, p1, v3

    if-gtz v3, :cond_0

    return-object v2

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method private getChildRect(Landroid/graphics/RectF;Landroid/view/View;)V
    .locals 3

    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$LayoutParams;

    iget v0, p2, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$LayoutParams;->left:I

    int-to-float v0, v0

    iget v1, p2, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$LayoutParams;->top:I

    int-to-float v1, v1

    iget v2, p2, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$LayoutParams;->right:I

    int-to-float v2, v2

    iget p2, p2, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$LayoutParams;->bottom:I

    int-to-float p2, p2

    invoke-virtual {p1, v0, v1, v2, p2}, Landroid/graphics/RectF;->set(FFFF)V

    return-void
.end method

.method private init()V
    .locals 6

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->setClipChildren(Z)V

    new-instance v1, Landroid/view/GestureDetector;

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getContext()Landroid/content/Context;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$GestureListener;

    const/4 v4, 0x0

    invoke-direct {v3, p0, v4}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$GestureListener;-><init>(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;Lcom/miui/gallery/collage/widget/CollageStitchingLayout$1;)V

    invoke-direct {v1, v2, v3}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mGestureDetector:Landroid/view/GestureDetector;

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mGestureDetector:Landroid/view/GestureDetector;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/view/GestureDetector;->setIsLongpressEnabled(Z)V

    new-instance v1, Landroid/view/GestureDetector;

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getContext()Landroid/content/Context;

    move-result-object v3

    new-instance v5, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$DragGestureListener;

    invoke-direct {v5, p0, v4}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$DragGestureListener;-><init>(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;Lcom/miui/gallery/collage/widget/CollageStitchingLayout$1;)V

    invoke-direct {v1, v3, v5}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mDragModeDetector:Landroid/view/GestureDetector;

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mDragModeDetector:Landroid/view/GestureDetector;

    invoke-virtual {v1, v0}, Landroid/view/GestureDetector;->setIsLongpressEnabled(Z)V

    new-instance v1, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$ItemDragHelper;

    invoke-direct {v1, p0, v4}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$ItemDragHelper;-><init>(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;Lcom/miui/gallery/collage/widget/CollageStitchingLayout$1;)V

    iput-object v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mItemDragHelper:Lcom/miui/gallery/collage/widget/CollageStitchingLayout$ItemDragHelper;

    const/4 v1, -0x1

    iput v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mBackGroundColor:I

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mBackgroundPaint:Landroid/graphics/Paint;

    iget v3, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mBackGroundColor:I

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mBackgroundPaint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    new-instance v1, Landroid/widget/OverScroller;

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/widget/OverScroller;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mScroller:Landroid/widget/OverScroller;

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v3, 0x7f05006b

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    iput v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mStrokeColor:I

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v3, 0x7f0600d1

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mActiveLineWidth:I

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v3, 0x7f0600d2

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mActiveLineWidthWhite:I

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mPathPaint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mPathPaint:Landroid/graphics/Paint;

    iget v3, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mActiveLineWidth:I

    int-to-float v3, v3

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mActiveLineWidth:I

    rem-int/lit8 v1, v1, 0x2

    if-eqz v1, :cond_0

    iget v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mActiveLineWidth:I

    add-int/2addr v1, v2

    iput v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mActiveLineWidth:I

    :cond_0
    iget v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mActiveLineWidthWhite:I

    rem-int/lit8 v1, v1, 0x2

    if-eqz v1, :cond_1

    iget v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mActiveLineWidthWhite:I

    add-int/2addr v1, v2

    iput v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mActiveLineWidthWhite:I

    :cond_1
    new-instance v1, Lcom/miui/gallery/collage/widget/ControlPopupWindow;

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/miui/gallery/collage/widget/ControlPopupWindow;-><init>(Landroid/content/Context;Z)V

    iput-object v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mControlPopupWindow:Lcom/miui/gallery/collage/widget/ControlPopupWindow;

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mControlPopupWindow:Lcom/miui/gallery/collage/widget/ControlPopupWindow;

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mControlListener:Lcom/miui/gallery/collage/widget/ControlPopupWindow$ControlListener;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/collage/widget/ControlPopupWindow;->setControlListener(Lcom/miui/gallery/collage/widget/ControlPopupWindow$ControlListener;)V

    return-void
.end method

.method private notifyZoomIn(F)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->doZoomInAnimator()V

    return-void
.end method

.method private notifyZoomOut(F)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->doZoomOutAnimator(F)V

    return-void
.end method

.method private refreshScrollLimit()V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getTop()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mMinScrollY:I

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getBottom()I

    move-result v0

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getTop()I

    move-result v1

    sub-int/2addr v0, v1

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mDisplayRect:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v1

    if-le v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getBottom()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mDisplayRect:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v1

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mMaxScrollY:I

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mMaxScrollY:I

    :goto_0
    return-void
.end method

.method private scrollToMin()V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getScrollX()I

    move-result v0

    iget v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mMinScrollY:I

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->scrollTo(II)V

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->invalidate()V

    return-void
.end method

.method private setActiveView(Lcom/miui/gallery/collage/widget/CollageImageView;)V
    .locals 3

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mActiveView:Lcom/miui/gallery/collage/widget/CollageImageView;

    if-eq p1, v0, :cond_0

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mActiveView:Lcom/miui/gallery/collage/widget/CollageImageView;

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mControlPopupWindow:Lcom/miui/gallery/collage/widget/ControlPopupWindow;

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mActiveView:Lcom/miui/gallery/collage/widget/CollageImageView;

    const/4 v2, 0x1

    invoke-virtual {p1, v0, v1, v2}, Lcom/miui/gallery/collage/widget/ControlPopupWindow;->showAtLocation(Landroid/view/View;Landroid/view/View;Z)V

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->dismissControlWindow()V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mActiveView:Lcom/miui/gallery/collage/widget/CollageImageView;

    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->invalidate()V

    return-void
.end method

.method private setChildMask(Landroid/graphics/drawable/Drawable;)V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    invoke-virtual {p0, v1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/collage/widget/CollageImageView;

    invoke-virtual {v2, p1}, Lcom/miui/gallery/collage/widget/CollageImageView;->setMask(Landroid/graphics/drawable/Drawable;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private setChildRadius(I)V
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    invoke-virtual {p0, v1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/collage/widget/CollageImageView;

    int-to-float v3, p1

    invoke-virtual {v2, v3}, Lcom/miui/gallery/collage/widget/CollageImageView;->setRadius(F)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private startContinueScroll()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mScrollAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mScrollAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_0
    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mScrollAnimator:Landroid/animation/ValueAnimator;

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mScrollAnimator:Landroid/animation/ValueAnimator;

    const-wide/16 v1, 0x3e8

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mScrollAnimator:Landroid/animation/ValueAnimator;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mScrollAnimator:Landroid/animation/ValueAnimator;

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mScrollAnimatorUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mScrollAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private swipeArrays(II)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mBitmaps:[Landroid/graphics/Bitmap;

    aget-object v0, v0, p1

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mBitmaps:[Landroid/graphics/Bitmap;

    iget-object v2, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mBitmaps:[Landroid/graphics/Bitmap;

    aget-object v2, v2, p2

    aput-object v2, v1, p1

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mBitmaps:[Landroid/graphics/Bitmap;

    aput-object v0, p1, p2

    return-void
.end method

.method private swipeViewIndex(II)V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mEnableDragMode:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-static {p0}, Landroid/transition/TransitionManager;->beginDelayedTransition(Landroid/view/ViewGroup;)V

    invoke-direct {p0, v0, p1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->swipeArrays(II)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, p2}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->removeView(Landroid/view/View;)V

    invoke-virtual {p0, v1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->removeView(Landroid/view/View;)V

    invoke-virtual {p0, v1, v0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->addView(Landroid/view/View;I)V

    invoke-virtual {p0, p2, p1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->addView(Landroid/view/View;I)V

    return-void
.end method


# virtual methods
.method public computeScroll()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mScroller:Landroid/widget/OverScroller;

    invoke-virtual {v0}, Landroid/widget/OverScroller;->computeScrollOffset()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mScroller:Landroid/widget/OverScroller;

    invoke-virtual {v0}, Landroid/widget/OverScroller;->getCurrX()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mScroller:Landroid/widget/OverScroller;

    invoke-virtual {v1}, Landroid/widget/OverScroller;->getCurrY()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->scrollTo(II)V

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->invalidate()V

    :cond_0
    return-void
.end method

.method public dismissControlWindow()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mControlPopupWindow:Lcom/miui/gallery/collage/widget/ControlPopupWindow;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mControlPopupWindow:Lcom/miui/gallery/collage/widget/ControlPopupWindow;

    invoke-virtual {v0}, Lcom/miui/gallery/collage/widget/ControlPopupWindow;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mControlPopupWindow:Lcom/miui/gallery/collage/widget/ControlPopupWindow;

    invoke-virtual {v0}, Lcom/miui/gallery/collage/widget/ControlPopupWindow;->dismiss()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mActiveView:Lcom/miui/gallery/collage/widget/CollageImageView;

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mActiveView:Lcom/miui/gallery/collage/widget/CollageImageView;

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->invalidate()V

    :cond_1
    return-void
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mCanvasRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mBackgroundPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    invoke-super {p0, p1}, Landroid/view/ViewGroup;->dispatchDraw(Landroid/graphics/Canvas;)V

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mActiveView:Lcom/miui/gallery/collage/widget/CollageImageView;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getScrollY()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mActiveView:Lcom/miui/gallery/collage/widget/CollageImageView;

    invoke-virtual {v1}, Lcom/miui/gallery/collage/widget/CollageImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$LayoutParams;

    iget-object v2, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mRectF:Landroid/graphics/RectF;

    iget v3, v1, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$LayoutParams;->left:I

    int-to-float v3, v3

    iget v4, v1, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$LayoutParams;->top:I

    int-to-float v4, v4

    iget v5, v1, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$LayoutParams;->right:I

    int-to-float v5, v5

    iget v1, v1, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$LayoutParams;->bottom:I

    int-to-float v1, v1

    invoke-virtual {v2, v3, v4, v5, v1}, Landroid/graphics/RectF;->set(FFFF)V

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mRectF:Landroid/graphics/RectF;

    neg-int v2, v0

    int-to-float v2, v2

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Landroid/graphics/RectF;->offset(FF)V

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mRectF:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mDisplayRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    iget-object v4, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mDisplayRect:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->top:I

    int-to-float v4, v4

    iget-object v5, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mDisplayRect:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->right:I

    int-to-float v5, v5

    iget-object v6, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mDisplayRect:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    int-to-float v6, v6

    invoke-virtual {v1, v2, v4, v5, v6}, Landroid/graphics/RectF;->intersect(FFFF)Z

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mRectF:Landroid/graphics/RectF;

    int-to-float v0, v0

    invoke-virtual {v1, v3, v0}, Landroid/graphics/RectF;->offset(FF)V

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mPath:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mPath:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mRectF:Landroid/graphics/RectF;

    sget-object v2, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->addRect(Landroid/graphics/RectF;Landroid/graphics/Path$Direction;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mRectF:Landroid/graphics/RectF;

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/RectF;)Z

    iget v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mActiveLineWidth:I

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mPathPaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mActiveLineWidthWhite:I

    add-int/2addr v2, v0

    int-to-float v2, v2

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mPathPaint:Landroid/graphics/Paint;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mPath:Landroid/graphics/Path;

    iget-object v2, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mPathPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mPathPaint:Landroid/graphics/Paint;

    int-to-float v0, v0

    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mPathPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mStrokeColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mPath:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mPathPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mItemDragHelper:Lcom/miui/gallery/collage/widget/CollageStitchingLayout$ItemDragHelper;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$ItemDragHelper;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method protected drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z
    .locals 0

    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    move-result p1

    return p1
.end method

.method public generateRenderData()Lcom/miui/gallery/collage/widget/CollageStitchingLayout$RenderData;
    .locals 5

    new-instance v0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$RenderData;

    invoke-direct {v0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$RenderData;-><init>()V

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getChildCount()I

    move-result v1

    new-array v2, v1, [Lcom/miui/gallery/collage/render/CollageRender$BitmapRenderData;

    iput-object v2, v0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$RenderData;->bitmapRenderDatas:[Lcom/miui/gallery/collage/render/CollageRender$BitmapRenderData;

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    invoke-virtual {p0, v2}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/collage/widget/CollageImageView;

    iget-object v4, v0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$RenderData;->bitmapRenderDatas:[Lcom/miui/gallery/collage/render/CollageRender$BitmapRenderData;

    invoke-virtual {v3}, Lcom/miui/gallery/collage/widget/CollageImageView;->generateBitmapRenderData()Lcom/miui/gallery/collage/render/CollageRender$BitmapRenderData;

    move-result-object v3

    aput-object v3, v4, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mStitchingModel:Lcom/miui/gallery/collage/core/stitching/StitchingModel;

    iput-object v1, v0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$RenderData;->stitchingModel:Lcom/miui/gallery/collage/core/stitching/StitchingModel;

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getWidth()I

    move-result v1

    iput v1, v0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$RenderData;->viewWidth:I

    return-object v0
.end method

.method public notifyBitmapReplace(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    .locals 2

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mBitmaps:[Landroid/graphics/Bitmap;

    array-length v1, v1

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mBitmaps:[Landroid/graphics/Bitmap;

    aget-object v1, v1, v0

    if-ne v1, p1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mBitmaps:[Landroid/graphics/Bitmap;

    aput-object p2, v1, v0

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mImageViewMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/collage/widget/CollageImageView;

    invoke-virtual {v0, p2}, Lcom/miui/gallery/collage/widget/CollageImageView;->setBitmap(Landroid/graphics/Bitmap;)V

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mImageViewMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mImageViewMap:Ljava/util/Map;

    invoke-interface {p1, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->requestLayout()V

    new-instance p1, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$3;

    invoke-direct {p1, p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$3;-><init>(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;)V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 5

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    iget-object p3, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mDisplayRect:Landroid/graphics/Rect;

    sub-int/2addr p4, p2

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p1

    const/4 p2, 0x0

    invoke-virtual {p3, p2, p2, p4, p1}, Landroid/graphics/Rect;->set(IIII)V

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mBitmapPositionHolder:Lcom/miui/gallery/collage/widget/CollageStitchingLayout$BitmapPositionHolder;

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getChildCount()I

    move-result p1

    iget-object p3, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mBitmapPositionHolder:Lcom/miui/gallery/collage/widget/CollageStitchingLayout$BitmapPositionHolder;

    iget p3, p3, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$BitmapPositionHolder;->bitmapWidth:I

    iget-object p4, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mBitmapPositionHolder:Lcom/miui/gallery/collage/widget/CollageStitchingLayout$BitmapPositionHolder;

    iget p4, p4, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$BitmapPositionHolder;->horizontalOffset:I

    iget-object p5, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mBitmapPositionHolder:Lcom/miui/gallery/collage/widget/CollageStitchingLayout$BitmapPositionHolder;

    iget p5, p5, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$BitmapPositionHolder;->verticalOffset:I

    if-lez p4, :cond_1

    add-int/lit8 v0, p5, 0x0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    if-ge p2, p1, :cond_2

    invoke-virtual {p0, p2}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$LayoutParams;

    iget-object v3, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mBitmapPositionHolder:Lcom/miui/gallery/collage/widget/CollageStitchingLayout$BitmapPositionHolder;

    iget-object v3, v3, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$BitmapPositionHolder;->bitmapHeights:[I

    aget v3, v3, p2

    add-int/2addr v3, v0

    add-int v4, p3, p4

    invoke-virtual {v1, p4, v0, v4, v3}, Landroid/view/View;->layout(IIII)V

    invoke-virtual {v2, p4, v0, v4, v3}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$LayoutParams;->set(IIII)V

    add-int v0, v3, p5

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_2
    invoke-direct {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->refreshScrollLimit()V

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mItemDragHelper:Lcom/miui/gallery/collage/widget/CollageStitchingLayout$ItemDragHelper;

    iget-object p1, p1, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$ItemDragHelper;->mCollageImageView:Lcom/miui/gallery/collage/widget/CollageImageView;

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mRectF:Landroid/graphics/RectF;

    iget-object p2, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mItemDragHelper:Lcom/miui/gallery/collage/widget/CollageStitchingLayout$ItemDragHelper;

    iget-object p2, p2, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$ItemDragHelper;->mCollageImageView:Lcom/miui/gallery/collage/widget/CollageImageView;

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getChildRect(Landroid/graphics/RectF;Landroid/view/View;)V

    :cond_3
    return-void
.end method

.method protected onMeasure(II)V
    .locals 4

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    iget-object p2, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mStitchingModel:Lcom/miui/gallery/collage/core/stitching/StitchingModel;

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mBitmapPositionHolder:Lcom/miui/gallery/collage/widget/CollageStitchingLayout$BitmapPositionHolder;

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mStitchingModel:Lcom/miui/gallery/collage/core/stitching/StitchingModel;

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mBitmapPositionHolder:Lcom/miui/gallery/collage/widget/CollageStitchingLayout$BitmapPositionHolder;

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mBitmaps:[Landroid/graphics/Bitmap;

    invoke-virtual {p2, p1, v0, v1}, Lcom/miui/gallery/collage/core/stitching/StitchingModel;->countHeight(ILcom/miui/gallery/collage/widget/CollageStitchingLayout$BitmapPositionHolder;[Landroid/graphics/Bitmap;)V

    iget-object p2, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mBitmapPositionHolder:Lcom/miui/gallery/collage/widget/CollageStitchingLayout$BitmapPositionHolder;

    iget p2, p2, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$BitmapPositionHolder;->height:I

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mCanvasRect:Landroid/graphics/RectF;

    int-to-float v1, p1

    int-to-float v2, p2

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v3, v1, v2}, Landroid/graphics/RectF;->set(FFFF)V

    const/high16 v0, 0x40000000    # 2.0f

    invoke-static {p1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    invoke-static {p2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->onMeasure(II)V

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x3

    const/4 v2, 0x1

    if-eq v0, v1, :cond_1

    packed-switch v0, :pswitch_data_0

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    iget-boolean v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mEnableDragMode:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mDragModeDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    goto :goto_0

    :pswitch_0
    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mDragModeDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    :cond_0
    :goto_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :pswitch_1
    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mDragModeDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    const/4 p1, 0x1

    :goto_1
    if-eqz p1, :cond_2

    iget-boolean p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mEnableDragMode:Z

    if-eqz p1, :cond_2

    new-instance p1, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$1;-><init>(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;)V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->post(Ljava/lang/Runnable;)Z

    :cond_2
    return v2

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public setBitmaps([Landroid/graphics/Bitmap;)V
    .locals 5

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->removeAllViews()V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mBitmaps:[Landroid/graphics/Bitmap;

    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-object v2, p1, v1

    new-instance v3, Lcom/miui/gallery/collage/widget/CollageImageView;

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/miui/gallery/collage/widget/CollageImageView;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v2}, Lcom/miui/gallery/collage/widget/CollageImageView;->setBitmap(Landroid/graphics/Bitmap;)V

    iget v4, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mBackGroundColor:I

    invoke-virtual {v3, v4}, Lcom/miui/gallery/collage/widget/CollageImageView;->setBackgroundColor(I)V

    new-instance v4, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$LayoutParams;

    invoke-direct {v4}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$LayoutParams;-><init>()V

    invoke-virtual {p0, v3, v4}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v4, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mImageViewMap:Ljava/util/Map;

    invoke-interface {v4, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    new-instance p1, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$BitmapPositionHolder;

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mBitmaps:[Landroid/graphics/Bitmap;

    array-length v0, v0

    invoke-direct {p1, v0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$BitmapPositionHolder;-><init>(I)V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mBitmapPositionHolder:Lcom/miui/gallery/collage/widget/CollageStitchingLayout$BitmapPositionHolder;

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->requestLayout()V

    return-void
.end method

.method public setReplaceImageListener(Lcom/miui/gallery/collage/CollageActivity$ReplaceImageListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mReplaceImageListener:Lcom/miui/gallery/collage/CollageActivity$ReplaceImageListener;

    return-void
.end method

.method public setStitchingModel(Lcom/miui/gallery/collage/core/stitching/StitchingModel;)V
    .locals 3

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->mStitchingModel:Lcom/miui/gallery/collage/core/stitching/StitchingModel;

    iget v0, p1, Lcom/miui/gallery/collage/core/stitching/StitchingModel;->radius:I

    invoke-direct {p0, v0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->setChildRadius(I)V

    iget-object v0, p1, Lcom/miui/gallery/collage/core/stitching/StitchingModel;->mask:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p1, Lcom/miui/gallery/collage/core/stitching/StitchingModel;->relativePath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v2, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p1, Lcom/miui/gallery/collage/core/stitching/StitchingModel;->mask:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/collage/CollageUtils;->getDrawableByAssets(Landroid/content/res/Resources;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->setChildMask(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->setChildMask(Landroid/graphics/drawable/Drawable;)V

    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->requestLayout()V

    new-instance p1, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$4;

    invoke-direct {p1, p0}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout$4;-><init>(Lcom/miui/gallery/collage/widget/CollageStitchingLayout;)V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/collage/widget/CollageStitchingLayout;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
