.class public Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;
.super Landroid/widget/GridView;
.source "StickyGridHeadersGridView.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;
.implements Landroid/widget/AdapterView$OnItemClickListener;
.implements Landroid/widget/AdapterView$OnItemLongClickListener;
.implements Landroid/widget/AdapterView$OnItemSelectedListener;
.implements Lcom/miui/gallery/util/photoview/ScrollableView;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$SavedState;,
        Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$RuntimePlatformSupportException;,
        Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$CheckForHeaderTap;,
        Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$WindowRunnable;,
        Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$PerformHeaderClick;,
        Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$CheckForHeaderLongPress;,
        Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$OnHeaderLongClickListener;,
        Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$OnHeaderClickListener;,
        Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$FixedViewInfo;
    }
.end annotation


# static fields
.field private static final ERROR_PLATFORM:Ljava/lang/String;

.field static final TAG:Ljava/lang/String;


# instance fields
.field protected mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

.field private mAreHeadersSticky:Z

.field private mClipToPaddingHasBeenSet:Z

.field private final mClippingRect:Landroid/graphics/Rect;

.field private mClippingToPadding:Z

.field private mCurrentHeaderId:J

.field protected mDataChanged:Z

.field private mDataSetObserver:Landroid/database/DataSetObserver;

.field private mFooterViewInfos:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$FixedViewInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mGestureDetector:Lcom/miui/gallery/view/GestureDetector;

.field mGestureListener:Lcom/miui/gallery/view/GestureDetector$OnGestureListener;

.field private mHeaderBottomPosition:I

.field mHeaderChildBeingPressed:Z

.field private mHeaderViewInfos:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$FixedViewInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mHeadersIgnorePadding:Z

.field private mHorizontalSpacing:I

.field private mMaskStickyHeaderRegion:Z

.field protected mMotionHeaderPosition:I

.field private mMotionY:F

.field private mOnHeaderClickListener:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$OnHeaderClickListener;

.field private mOnHeaderLongClickListener:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$OnHeaderLongClickListener;

.field private mOnItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

.field private mOnItemLongClickListener:Landroid/widget/AdapterView$OnItemLongClickListener;

.field private mOnItemSelectedListener:Landroid/widget/AdapterView$OnItemSelectedListener;

.field public mPendingCheckForLongPress:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$CheckForHeaderLongPress;

.field public mPendingCheckForTap:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$CheckForHeaderTap;

.field private mPerformHeaderClick:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$PerformHeaderClick;

.field private mPreScrollState:I

.field private mRealAdapter:Landroid/widget/ListAdapter;

.field private mRequestedNumColumns:I

.field private mScrollListener:Landroid/widget/AbsListView$OnScrollListener;

.field private mScrollState:I

.field private mStickiedHeader:Landroid/view/View;

.field private mStickyHeaderBackgroundAlpha:I

.field private mStickyHeaderBackgroundDrawable:Landroid/graphics/drawable/Drawable;

.field protected mTouchMode:I

.field private mTouchModeReset:Ljava/lang/Runnable;

.field private mTouchSlop:I

.field private mVerticalSpacing:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Error supporting platform "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->ERROR_PLATFORM:Ljava/lang/String;

    const-class v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/GridView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, 0x1

    iput-boolean p2, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAreHeadersSticky:Z

    new-instance p2, Landroid/graphics/Rect;

    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    iput-object p2, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mClippingRect:Landroid/graphics/Rect;

    const-wide/16 p2, -0x1

    iput-wide p2, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mCurrentHeaderId:J

    new-instance p2, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$1;

    invoke-direct {p2, p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$1;-><init>(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;)V

    iput-object p2, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mDataSetObserver:Landroid/database/DataSetObserver;

    const/4 p2, 0x0

    iput-boolean p2, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mMaskStickyHeaderRegion:Z

    const/16 p3, 0xfa

    iput p3, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mStickyHeaderBackgroundAlpha:I

    iput p2, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mPreScrollState:I

    iput p2, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mScrollState:I

    iput-boolean p2, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeaderChildBeingPressed:Z

    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object p3

    iput-object p3, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeaderViewInfos:Ljava/util/ArrayList;

    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object p3

    iput-object p3, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mFooterViewInfos:Ljava/util/ArrayList;

    new-instance p3, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$2;

    invoke-direct {p3, p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$2;-><init>(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;)V

    iput-object p3, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mGestureListener:Lcom/miui/gallery/view/GestureDetector$OnGestureListener;

    invoke-super {p0, p0}, Landroid/widget/GridView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    invoke-virtual {p0, p2}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->setVerticalFadingEdgeEnabled(Z)V

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result p1

    iput p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mTouchSlop:I

    return-void
.end method

.method static synthetic access$000(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;)V
    .locals 0

    invoke-direct {p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->reset()V

    return-void
.end method

.method static synthetic access$100(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;)I
    .locals 0

    iget p0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mPreScrollState:I

    return p0
.end method

.method static synthetic access$1000()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->ERROR_PLATFORM:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;)I
    .locals 0

    iget p0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mScrollState:I

    return p0
.end method

.method static synthetic access$402(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;Ljava/lang/Runnable;)Ljava/lang/Runnable;
    .locals 0

    iput-object p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mTouchModeReset:Ljava/lang/Runnable;

    return-object p1
.end method

.method static synthetic access$600(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;I)J
    .locals 0

    invoke-direct {p0, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->headerViewPositionToId(I)J

    move-result-wide p0

    return-wide p0
.end method

.method static synthetic access$700(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;)I
    .locals 0

    invoke-virtual {p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getWindowAttachCount()I

    move-result p0

    return p0
.end method

.method static synthetic access$800(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;)I
    .locals 0

    invoke-virtual {p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getWindowAttachCount()I

    move-result p0

    return p0
.end method

.method private findMotionHeader(F)I
    .locals 7

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mStickiedHeader:Landroid/view/View;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeaderBottomPosition:I

    int-to-float v0, v0

    cmpg-float v0, p1, v0

    if-gtz v0, :cond_0

    const/4 p1, -0x2

    return p1

    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getFirstVisiblePosition()I

    move-result v1

    :goto_0
    invoke-virtual {p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getLastVisiblePosition()I

    move-result v2

    if-gt v1, v2, :cond_2

    invoke-virtual {p0, v1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getItemIdAtPosition(I)J

    move-result-wide v2

    const-wide/16 v4, -0x1

    cmp-long v6, v2, v4

    if-nez v6, :cond_1

    invoke-virtual {p0, v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getBottom()I

    move-result v3

    invoke-virtual {v2}, Landroid/view/View;->getTop()I

    move-result v2

    int-to-float v3, v3

    cmpg-float v3, p1, v3

    if-gtz v3, :cond_1

    int-to-float v2, v2

    cmpl-float v2, p1, v2

    if-ltz v2, :cond_1

    return v0

    :cond_1
    invoke-virtual {p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getNumColumns()I

    move-result v2

    add-int/2addr v1, v2

    invoke-virtual {p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getNumColumns()I

    move-result v2

    add-int/2addr v0, v2

    goto :goto_0

    :cond_2
    const/4 p1, -0x1

    return p1
.end method

.method private getHeaderHeight()I
    .locals 1

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mStickiedHeader:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mStickiedHeader:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private headerViewPositionToId(I)J
    .locals 2

    const/4 v0, -0x2

    if-ne p1, v0, :cond_0

    iget-wide v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mCurrentHeaderId:J

    return-wide v0

    :cond_0
    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    invoke-virtual {p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getFirstVisiblePosition()I

    move-result v1

    add-int/2addr v1, p1

    invoke-virtual {v0, v1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;->getHeaderId(I)J

    move-result-wide v0

    return-wide v0
.end method

.method private measureHeader()V
    .locals 6

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mStickiedHeader:Landroid/view/View;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-boolean v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeadersIgnorePadding:Z

    const/high16 v1, 0x40000000    # 2.0f

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getWidth()I

    move-result v0

    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getPaddingLeft()I

    move-result v2

    sub-int/2addr v0, v2

    invoke-virtual {p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getPaddingRight()I

    move-result v2

    sub-int/2addr v0, v2

    invoke-static {v0, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    :goto_0
    iget-object v2, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mStickiedHeader:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    const/4 v3, 0x0

    if-eqz v2, :cond_2

    iget v4, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-lez v4, :cond_2

    iget v2, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-static {v2, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    goto :goto_1

    :cond_2
    invoke-static {v3, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    :goto_1
    iget-object v2, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mStickiedHeader:Landroid/view/View;

    invoke-static {v3, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    invoke-static {v3, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    invoke-virtual {v2, v4, v5}, Landroid/view/View;->measure(II)V

    iget-object v2, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mStickiedHeader:Landroid/view/View;

    invoke-virtual {v2, v0, v1}, Landroid/view/View;->measure(II)V

    iget-boolean v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeadersIgnorePadding:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mStickiedHeader:Landroid/view/View;

    invoke-virtual {p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getLeft()I

    move-result v1

    invoke-virtual {p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getRight()I

    move-result v2

    iget-object v4, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mStickiedHeader:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getMeasuredHeight()I

    move-result v4

    invoke-virtual {v0, v1, v3, v2, v4}, Landroid/view/View;->layout(IIII)V

    goto :goto_2

    :cond_3
    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mStickiedHeader:Landroid/view/View;

    invoke-virtual {p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getLeft()I

    move-result v1

    invoke-virtual {p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getPaddingLeft()I

    move-result v2

    add-int/2addr v1, v2

    invoke-virtual {p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getRight()I

    move-result v2

    invoke-virtual {p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getPaddingRight()I

    move-result v4

    sub-int/2addr v2, v4

    iget-object v4, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mStickiedHeader:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getMeasuredHeight()I

    move-result v4

    invoke-virtual {v0, v1, v3, v2, v4}, Landroid/view/View;->layout(IIII)V

    :goto_2
    return-void
.end method

.method private removeFixedViewInfo(Landroid/view/View;Ljava/util/ArrayList;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/util/ArrayList<",
            "Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$FixedViewInfo;",
            ">;)Z"
        }
    .end annotation

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    invoke-virtual {p2, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$FixedViewInfo;

    iget-object v3, v3, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$FixedViewInfo;->view:Landroid/view/View;

    if-ne v3, p1, :cond_0

    invoke-virtual {p2, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    invoke-virtual {p0, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->detachHeader(Landroid/view/View;)V

    const/4 p1, 0x1

    return p1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return v1
.end method

.method private reset()V
    .locals 2

    const/4 v0, 0x0

    iput v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeaderBottomPosition:I

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->swapStickiedHeader(Landroid/view/View;)V

    const-wide/high16 v0, -0x8000000000000000L

    iput-wide v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mCurrentHeaderId:J

    return-void
.end method

.method private scrollChanged(I)V
    .locals 17

    move-object/from16 v0, p0

    move/from16 v1, p1

    iget-object v2, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    if-eqz v2, :cond_14

    iget-object v2, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    invoke-virtual {v2}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;->getCount()I

    move-result v2

    if-eqz v2, :cond_14

    iget-boolean v2, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAreHeadersSticky:Z

    if-nez v2, :cond_0

    goto/16 :goto_9

    :cond_0
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    if-nez v3, :cond_1

    return-void

    :cond_1
    iget-object v3, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    invoke-virtual {v3, v1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;->getHeaderId(I)J

    move-result-wide v3

    iget-object v5, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeaderViewInfos:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    int-to-long v5, v5

    cmp-long v7, v3, v5

    const/4 v3, 0x0

    const-wide/16 v4, -0x1

    if-gez v7, :cond_2

    iput-wide v4, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mCurrentHeaderId:J

    iput-object v3, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mStickiedHeader:Landroid/view/View;

    return-void

    :cond_2
    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getNumColumns()I

    move-result v6

    sub-int v7, v1, v6

    if-gez v7, :cond_3

    move v7, v1

    :cond_3
    add-int v8, v1, v6

    iget-object v9, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    invoke-virtual {v9}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;->getCount()I

    move-result v9

    if-lt v8, v9, :cond_4

    move v8, v1

    :cond_4
    iget v9, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mVerticalSpacing:I

    if-nez v9, :cond_5

    iget-object v7, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    invoke-virtual {v7, v1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;->getHeaderId(I)J

    move-result-wide v7

    :goto_0
    move v9, v1

    goto :goto_2

    :cond_5
    iget v9, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mVerticalSpacing:I

    if-gez v9, :cond_7

    iget-object v7, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    invoke-virtual {v7, v1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;->getHeaderId(I)J

    invoke-virtual {v0, v6}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v7}, Landroid/view/View;->getTop()I

    move-result v7

    if-gtz v7, :cond_6

    iget-object v7, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    invoke-virtual {v7, v8}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;->getHeaderId(I)J

    move-result-wide v9

    move-wide v15, v9

    move v9, v8

    goto :goto_1

    :cond_6
    iget-object v7, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    invoke-virtual {v7, v1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;->getHeaderId(I)J

    move-result-wide v7

    goto :goto_0

    :cond_7
    invoke-virtual {v0, v2}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    invoke-virtual {v8}, Landroid/view/View;->getTop()I

    move-result v8

    if-lez v8, :cond_8

    iget v9, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mVerticalSpacing:I

    if-ge v8, v9, :cond_8

    iget-object v8, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    invoke-virtual {v8, v7}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;->getHeaderId(I)J

    move-result-wide v8

    move-wide v15, v8

    move v9, v7

    :goto_1
    move-wide v7, v15

    goto :goto_2

    :cond_8
    iget-object v7, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    invoke-virtual {v7, v1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;->getHeaderId(I)J

    move-result-wide v7

    goto :goto_0

    :goto_2
    iget-wide v10, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mCurrentHeaderId:J

    cmp-long v12, v10, v7

    if-eqz v12, :cond_9

    iget-object v10, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    iget-object v11, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mStickiedHeader:Landroid/view/View;

    invoke-virtual {v10, v9, v11, v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;->getHeaderView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v9

    invoke-direct {v0, v9}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->swapStickiedHeader(Landroid/view/View;)V

    invoke-direct/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->measureHeader()V

    iput-wide v7, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mCurrentHeaderId:J

    :cond_9
    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getChildCount()I

    move-result v7

    if-eqz v7, :cond_13

    const v8, 0x1869f

    move-object v8, v3

    const/4 v3, 0x0

    const v9, 0x1869f

    :goto_3
    if-ge v3, v7, :cond_d

    invoke-super {v0, v3}, Landroid/widget/GridView;->getChildAt(I)Landroid/view/View;

    move-result-object v10

    iget-boolean v11, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mClippingToPadding:Z

    if-eqz v11, :cond_a

    invoke-virtual {v10}, Landroid/view/View;->getTop()I

    move-result v11

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getPaddingTop()I

    move-result v12

    sub-int/2addr v11, v12

    goto :goto_4

    :cond_a
    invoke-virtual {v10}, Landroid/view/View;->getTop()I

    move-result v11

    :goto_4
    if-gez v11, :cond_b

    goto :goto_5

    :cond_b
    iget-object v12, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    invoke-virtual {v0, v10}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getPositionForView(Landroid/view/View;)I

    move-result v13

    invoke-virtual {v12, v13}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;->getItemId(I)J

    move-result-wide v12

    cmp-long v14, v12, v4

    if-nez v14, :cond_c

    if-ge v11, v9, :cond_c

    move-object v8, v10

    move v9, v11

    :cond_c
    :goto_5
    add-int/2addr v3, v6

    goto :goto_3

    :cond_d
    invoke-direct/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getHeaderHeight()I

    move-result v3

    if-eqz v8, :cond_12

    if-nez v1, :cond_e

    invoke-super {v0, v2}, Landroid/widget/GridView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v1

    if-lez v1, :cond_e

    iget-boolean v1, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mClippingToPadding:Z

    if-nez v1, :cond_e

    iput v2, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeaderBottomPosition:I

    goto :goto_8

    :cond_e
    iget-boolean v1, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mClippingToPadding:Z

    if-eqz v1, :cond_10

    invoke-virtual {v8}, Landroid/view/View;->getTop()I

    move-result v1

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getPaddingTop()I

    move-result v2

    add-int/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    iput v1, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeaderBottomPosition:I

    iget v1, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeaderBottomPosition:I

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getPaddingTop()I

    move-result v2

    if-ge v1, v2, :cond_f

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getPaddingTop()I

    move-result v1

    add-int/2addr v3, v1

    goto :goto_6

    :cond_f
    iget v3, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeaderBottomPosition:I

    :goto_6
    iput v3, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeaderBottomPosition:I

    goto :goto_8

    :cond_10
    invoke-virtual {v8}, Landroid/view/View;->getTop()I

    move-result v1

    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    move-result v1

    iput v1, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeaderBottomPosition:I

    iget v1, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeaderBottomPosition:I

    if-gez v1, :cond_11

    goto :goto_7

    :cond_11
    iget v3, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeaderBottomPosition:I

    :goto_7
    iput v3, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeaderBottomPosition:I

    goto :goto_8

    :cond_12
    iput v3, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeaderBottomPosition:I

    iget-boolean v1, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mClippingToPadding:Z

    if-eqz v1, :cond_13

    iget v1, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeaderBottomPosition:I

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getPaddingTop()I

    move-result v2

    add-int/2addr v1, v2

    iput v1, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeaderBottomPosition:I

    :cond_13
    :goto_8
    return-void

    :cond_14
    :goto_9
    return-void
.end method

.method private swapStickiedHeader(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mStickiedHeader:Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->detachHeader(Landroid/view/View;)V

    invoke-virtual {p0, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->attachHeader(Landroid/view/View;)V

    iput-object p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mStickiedHeader:Landroid/view/View;

    iget-object p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mStickiedHeader:Landroid/view/View;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mStickyHeaderBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mStickiedHeader:Landroid/view/View;

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mStickyHeaderBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mStickiedHeader:Landroid/view/View;

    const v0, 0x7f070281

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    :goto_0
    invoke-virtual {p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getStickyHeaderIsTranscluent()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mStickiedHeader:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mStickiedHeader:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iget v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mStickyHeaderBackgroundAlpha:I

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    :cond_1
    return-void
.end method

.method private transformEvent(Landroid/view/MotionEvent;I)Landroid/view/MotionEvent;
    .locals 1

    const/4 v0, -0x2

    if-ne p2, v0, :cond_0

    return-object p1

    :cond_0
    invoke-virtual {p0, p2}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getChildAt(I)Landroid/view/View;

    move-result-object p2

    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result p2

    neg-int p2, p2

    int-to-float p2, p2

    invoke-virtual {p1, v0, p2}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    return-object p1
.end method


# virtual methods
.method public addFooterView(Landroid/view/View;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->addFooterView(Landroid/view/View;Ljava/lang/Object;)V

    return-void
.end method

.method public addFooterView(Landroid/view/View;Ljava/lang/Object;)V
    .locals 3

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mFooterViewInfos:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    iget-object v2, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mFooterViewInfos:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$FixedViewInfo;

    iget-object v2, v2, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$FixedViewInfo;->view:Landroid/view/View;

    if-ne v2, p1, :cond_0

    return-void

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    new-instance v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$FixedViewInfo;

    invoke-direct {v0, p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$FixedViewInfo;-><init>(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;)V

    iput-object p1, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$FixedViewInfo;->view:Landroid/view/View;

    iput-object p2, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$FixedViewInfo;->data:Ljava/lang/Object;

    iget-object p2, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mFooterViewInfos:Ljava/util/ArrayList;

    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->attachHeader(Landroid/view/View;)V

    iget-object p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    iget-object p2, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mFooterViewInfos:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;->setFooter(Ljava/util/List;)V

    iget-object p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    invoke-virtual {p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;->notifyDataSetChanged()V

    :cond_2
    return-void
.end method

.method public addHeaderView(Landroid/view/View;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->addHeaderView(Landroid/view/View;Ljava/lang/Object;)V

    return-void
.end method

.method public addHeaderView(Landroid/view/View;Ljava/lang/Object;)V
    .locals 3

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeaderViewInfos:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    iget-object v2, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeaderViewInfos:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$FixedViewInfo;

    iget-object v2, v2, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$FixedViewInfo;->view:Landroid/view/View;

    if-ne v2, p1, :cond_0

    return-void

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    new-instance v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$FixedViewInfo;

    invoke-direct {v0, p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$FixedViewInfo;-><init>(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;)V

    iput-object p1, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$FixedViewInfo;->view:Landroid/view/View;

    iput-object p2, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$FixedViewInfo;->data:Ljava/lang/Object;

    iget-object p2, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeaderViewInfos:Ljava/util/ArrayList;

    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->attachHeader(Landroid/view/View;)V

    iget-object p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    iget-object p2, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeaderViewInfos:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;->setHeader(Ljava/util/List;)V

    iget-object p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    invoke-virtual {p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;->notifyDataSetChanged()V

    :cond_2
    return-void
.end method

.method attachHeader(Landroid/view/View;)V
    .locals 8

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->isAttachedToWindow()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    :try_start_0
    const-class v0, Landroid/view/View;

    const-string v1, "mAttachInfo"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    const-class v2, Landroid/view/View;

    const-string v3, "dispatchAttachedToWindow"

    const/4 v4, 0x2

    new-array v5, v4, [Ljava/lang/Class;

    const-string v6, "android.view.View$AttachInfo"

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    const/4 v7, 0x0

    aput-object v6, v5, v7

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v5, v1

    invoke-virtual {v2, v3, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    new-array v3, v4, [Ljava/lang/Object;

    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    aput-object v0, v3, v7

    const/16 v0, 0x8

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v3, v1

    invoke-virtual {v2, p1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    new-instance v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$RuntimePlatformSupportException;

    invoke-direct {v0, p0, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$RuntimePlatformSupportException;-><init>(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;Ljava/lang/Exception;)V

    throw v0

    :catch_1
    move-exception p1

    new-instance v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$RuntimePlatformSupportException;

    invoke-direct {v0, p0, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$RuntimePlatformSupportException;-><init>(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;Ljava/lang/Exception;)V

    throw v0

    :catch_2
    move-exception p1

    new-instance v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$RuntimePlatformSupportException;

    invoke-direct {v0, p0, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$RuntimePlatformSupportException;-><init>(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;Ljava/lang/Exception;)V

    throw v0

    :catch_3
    move-exception p1

    new-instance v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$RuntimePlatformSupportException;

    invoke-direct {v0, p0, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$RuntimePlatformSupportException;-><init>(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;Ljava/lang/Exception;)V

    throw v0

    :catch_4
    move-exception p1

    new-instance v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$RuntimePlatformSupportException;

    invoke-direct {v0, p0, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$RuntimePlatformSupportException;-><init>(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;Ljava/lang/Exception;)V

    throw v0

    :catch_5
    move-exception p1

    new-instance v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$RuntimePlatformSupportException;

    invoke-direct {v0, p0, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$RuntimePlatformSupportException;-><init>(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;Ljava/lang/Exception;)V

    throw v0

    :cond_1
    :goto_0
    return-void
.end method

.method detachHeader(Landroid/view/View;)V
    .locals 4

    if-nez p1, :cond_0

    return-void

    :cond_0
    :try_start_0
    const-class v0, Landroid/view/View;

    const-string v1, "dispatchDetachedFromWindow"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    new-array v1, v2, [Ljava/lang/Object;

    invoke-virtual {v0, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    new-instance v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$RuntimePlatformSupportException;

    invoke-direct {v0, p0, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$RuntimePlatformSupportException;-><init>(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;Ljava/lang/Exception;)V

    throw v0

    :catch_1
    move-exception p1

    new-instance v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$RuntimePlatformSupportException;

    invoke-direct {v0, p0, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$RuntimePlatformSupportException;-><init>(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;Ljava/lang/Exception;)V

    throw v0

    :catch_2
    move-exception p1

    new-instance v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$RuntimePlatformSupportException;

    invoke-direct {v0, p0, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$RuntimePlatformSupportException;-><init>(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;Ljava/lang/Exception;)V

    throw v0

    :catch_3
    move-exception p1

    new-instance v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$RuntimePlatformSupportException;

    invoke-direct {v0, p0, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$RuntimePlatformSupportException;-><init>(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;Ljava/lang/Exception;)V

    throw v0
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 20

    move-object/from16 v0, p0

    move-object/from16 v8, p1

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x8

    if-ge v1, v2, :cond_0

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getFirstVisiblePosition()I

    move-result v1

    invoke-direct {v0, v1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->scrollChanged(I)V

    :cond_0
    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getNumColumns()I

    move-result v1

    iget-object v2, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mStickiedHeader:Landroid/view/View;

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_1

    iget-boolean v2, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAreHeadersSticky:Z

    if-eqz v2, :cond_1

    iget-object v2, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mStickiedHeader:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v2

    if-nez v2, :cond_1

    const/4 v2, 0x1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_0
    invoke-direct/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getHeaderHeight()I

    move-result v9

    iget v5, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeaderBottomPosition:I

    sub-int/2addr v5, v9

    if-eqz v2, :cond_3

    iget-boolean v6, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mMaskStickyHeaderRegion:Z

    if-eqz v6, :cond_3

    iget-boolean v6, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeadersIgnorePadding:Z

    if-eqz v6, :cond_2

    iget-object v6, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mClippingRect:Landroid/graphics/Rect;

    iput v4, v6, Landroid/graphics/Rect;->left:I

    iget-object v6, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mClippingRect:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getWidth()I

    move-result v7

    iput v7, v6, Landroid/graphics/Rect;->right:I

    goto :goto_1

    :cond_2
    iget-object v6, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mClippingRect:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getPaddingLeft()I

    move-result v7

    iput v7, v6, Landroid/graphics/Rect;->left:I

    iget-object v6, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mClippingRect:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getWidth()I

    move-result v7

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getPaddingRight()I

    move-result v10

    sub-int/2addr v7, v10

    iput v7, v6, Landroid/graphics/Rect;->right:I

    :goto_1
    iget-object v6, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mClippingRect:Landroid/graphics/Rect;

    iget v7, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeaderBottomPosition:I

    iput v7, v6, Landroid/graphics/Rect;->top:I

    iget-object v6, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mClippingRect:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getHeight()I

    move-result v7

    iput v7, v6, Landroid/graphics/Rect;->bottom:I

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    iget-object v6, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mClippingRect:Landroid/graphics/Rect;

    invoke-virtual {v8, v6}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z

    :cond_3
    invoke-super/range {p0 .. p1}, Landroid/widget/GridView;->dispatchDraw(Landroid/graphics/Canvas;)V

    new-instance v6, Landroid/support/v4/util/ArrayMap;

    invoke-direct {v6}, Landroid/support/v4/util/ArrayMap;-><init>()V

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v7

    if-nez v7, :cond_4

    const/4 v7, -0x1

    goto :goto_2

    :cond_4
    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v7

    invoke-interface {v7}, Landroid/widget/ListAdapter;->getCount()I

    move-result v7

    :goto_2
    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getRealAdapter()Landroid/widget/ListAdapter;

    move-result-object v11

    if-nez v11, :cond_5

    const/4 v11, -0x1

    goto :goto_3

    :cond_5
    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getRealAdapter()Landroid/widget/ListAdapter;

    move-result-object v11

    invoke-interface {v11}, Landroid/widget/ListAdapter;->getCount()I

    move-result v11

    :goto_3
    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getFirstVisiblePosition()I

    move-result v12

    const/4 v13, 0x0

    :goto_4
    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getLastVisiblePosition()I

    move-result v14

    if-gt v12, v14, :cond_8

    invoke-virtual {v0, v12}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getItemIdAtPosition(I)J

    move-result-wide v14

    const-wide/16 v16, -0x1

    cmp-long v18, v14, v16

    if-nez v18, :cond_6

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    invoke-virtual {v6, v14, v15}, Landroid/support/v4/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_5

    :cond_6
    const-wide/16 v16, -0x4

    cmp-long v18, v14, v16

    if-nez v18, :cond_7

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    invoke-virtual {v6, v14, v15}, Landroid/support/v4/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_7
    :goto_5
    add-int/2addr v12, v1

    add-int/2addr v13, v1

    goto :goto_4

    :cond_8
    const/4 v1, 0x0

    :goto_6
    invoke-virtual {v6}, Landroid/support/v4/util/ArrayMap;->size()I

    move-result v12

    if-ge v1, v12, :cond_16

    invoke-virtual {v6, v1}, Landroid/support/v4/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/Integer;

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v12

    invoke-virtual {v0, v12}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v12

    :try_start_0
    invoke-virtual {v12}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/view/View;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v15, :cond_d

    invoke-virtual {v6, v1}, Landroid/support/v4/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Integer;

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getFirstVisiblePosition()I

    move-result v14

    add-int/2addr v14, v13

    sget-object v15, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->TAG:Ljava/lang/String;

    const-string v10, "view count [%d], adapter count[%d/%d], real adapter count[%d/%d]"

    const/4 v3, 0x5

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getChildCount()I

    move-result v16

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    aput-object v16, v3, v4

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    const/16 v17, 0x1

    aput-object v16, v3, v17

    const/16 v16, 0x2

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v18

    if-nez v18, :cond_9

    const/16 v18, -0x1

    goto :goto_7

    :cond_9
    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Landroid/widget/ListAdapter;->getCount()I

    move-result v18

    :goto_7
    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v3, v16

    const/16 v16, 0x3

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v3, v16

    const/16 v16, 0x4

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getRealAdapter()Landroid/widget/ListAdapter;

    move-result-object v18

    if-nez v18, :cond_a

    const/16 v18, -0x1

    goto :goto_8

    :cond_a
    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getRealAdapter()Landroid/widget/ListAdapter;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Landroid/widget/ListAdapter;->getCount()I

    move-result v18

    :goto_8
    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v3, v16

    invoke-static {v15, v10, v3}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    sget-object v3, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->TAG:Ljava/lang/String;

    const-string v10, "current[layout: %d|adapter: %d] item is %s"

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    invoke-virtual {v0, v14}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v14

    if-nez v14, :cond_b

    const-string v14, "null"

    goto :goto_9

    :cond_b
    const-string v14, "not null"

    :goto_9
    invoke-static {v3, v10, v13, v15, v14}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v12}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v10

    if-eqz v10, :cond_c

    invoke-virtual {v12}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v10

    goto :goto_a

    :cond_c
    const-string v10, "null"

    :goto_a
    new-instance v12, Ljava/util/HashMap;

    invoke-direct {v12}, Ljava/util/HashMap;-><init>()V

    const-string v13, "header_class/tag_class"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "/"

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v12, v13, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "error_track"

    const-string v10, "sticky_grid_headers_get_tag_npe"

    invoke-static {v3, v10, v12}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_b

    :cond_d
    const/16 v17, 0x1

    invoke-virtual {v15}, Landroid/view/View;->getVisibility()I

    move-result v3

    if-eqz v3, :cond_e

    :goto_b
    move/from16 v19, v5

    goto/16 :goto_12

    :cond_e
    invoke-virtual {v6, v1}, Landroid/support/v4/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    if-nez v3, :cond_10

    move-object v3, v12

    check-cast v3, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper$HeaderFillerView;

    invoke-virtual {v3}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper$HeaderFillerView;->getHeaderId()I

    move-result v3

    move/from16 v19, v5

    int-to-long v4, v3

    iget-wide v13, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mCurrentHeaderId:J

    cmp-long v3, v4, v13

    if-nez v3, :cond_f

    invoke-virtual {v12}, Landroid/view/View;->getTop()I

    move-result v3

    if-gez v3, :cond_f

    iget-boolean v3, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAreHeadersSticky:Z

    if-eqz v3, :cond_f

    const/4 v3, 0x1

    goto :goto_c

    :cond_f
    const/4 v3, 0x0

    :goto_c
    if-eqz v3, :cond_11

    goto/16 :goto_12

    :cond_10
    move/from16 v19, v5

    :cond_11
    iget-boolean v3, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeadersIgnorePadding:Z

    if-eqz v3, :cond_12

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getWidth()I

    move-result v3

    const/high16 v4, 0x40000000    # 2.0f

    invoke-static {v3, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    :goto_d
    const/4 v4, 0x0

    goto :goto_e

    :cond_12
    const/high16 v4, 0x40000000    # 2.0f

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getWidth()I

    move-result v3

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getPaddingLeft()I

    move-result v5

    sub-int/2addr v3, v5

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getPaddingRight()I

    move-result v5

    sub-int/2addr v3, v5

    invoke-static {v3, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    goto :goto_d

    :goto_e
    invoke-static {v4, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    invoke-static {v4, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v10

    invoke-static {v4, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v13

    invoke-virtual {v15, v10, v13}, Landroid/view/View;->measure(II)V

    invoke-virtual {v15, v3, v5}, Landroid/view/View;->measure(II)V

    iget-boolean v3, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeadersIgnorePadding:Z

    if-eqz v3, :cond_13

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getLeft()I

    move-result v3

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getRight()I

    move-result v5

    invoke-virtual {v12}, Landroid/view/View;->getHeight()I

    move-result v10

    invoke-virtual {v15, v3, v4, v5, v10}, Landroid/view/View;->layout(IIII)V

    goto :goto_f

    :cond_13
    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getLeft()I

    move-result v3

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getPaddingLeft()I

    move-result v5

    add-int/2addr v3, v5

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getRight()I

    move-result v5

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getPaddingRight()I

    move-result v10

    sub-int/2addr v5, v10

    invoke-virtual {v12}, Landroid/view/View;->getHeight()I

    move-result v10

    invoke-virtual {v15, v3, v4, v5, v10}, Landroid/view/View;->layout(IIII)V

    :goto_f
    iget-boolean v3, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeadersIgnorePadding:Z

    if-eqz v3, :cond_14

    iget-object v3, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mClippingRect:Landroid/graphics/Rect;

    iput v4, v3, Landroid/graphics/Rect;->left:I

    iget-object v3, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mClippingRect:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getWidth()I

    move-result v4

    iput v4, v3, Landroid/graphics/Rect;->right:I

    goto :goto_10

    :cond_14
    iget-object v3, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mClippingRect:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getPaddingLeft()I

    move-result v4

    iput v4, v3, Landroid/graphics/Rect;->left:I

    iget-object v3, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mClippingRect:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getWidth()I

    move-result v4

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getPaddingRight()I

    move-result v5

    sub-int/2addr v4, v5

    iput v4, v3, Landroid/graphics/Rect;->right:I

    :goto_10
    iget-object v3, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mClippingRect:Landroid/graphics/Rect;

    invoke-virtual {v12}, Landroid/view/View;->getBottom()I

    move-result v4

    iput v4, v3, Landroid/graphics/Rect;->bottom:I

    iget-object v3, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mClippingRect:Landroid/graphics/Rect;

    invoke-virtual {v12}, Landroid/view/View;->getTop()I

    move-result v4

    iput v4, v3, Landroid/graphics/Rect;->top:I

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    iget-object v3, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mClippingRect:Landroid/graphics/Rect;

    invoke-virtual {v8, v3}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z

    iget-boolean v3, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeadersIgnorePadding:Z

    if-eqz v3, :cond_15

    invoke-virtual {v12}, Landroid/view/View;->getTop()I

    move-result v3

    int-to-float v3, v3

    const/4 v4, 0x0

    invoke-virtual {v8, v4, v3}, Landroid/graphics/Canvas;->translate(FF)V

    goto :goto_11

    :cond_15
    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getPaddingLeft()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v12}, Landroid/view/View;->getTop()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v8, v3, v4}, Landroid/graphics/Canvas;->translate(FF)V

    :goto_11
    invoke-virtual {v15, v8}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    :goto_12
    add-int/lit8 v1, v1, 0x1

    move/from16 v5, v19

    const/4 v3, 0x1

    const/4 v4, 0x0

    goto/16 :goto_6

    :catch_0
    return-void

    :cond_16
    move/from16 v19, v5

    if-eqz v2, :cond_17

    iget-boolean v1, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mMaskStickyHeaderRegion:Z

    if-eqz v1, :cond_17

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    goto :goto_13

    :cond_17
    if-nez v2, :cond_18

    return-void

    :cond_18
    :goto_13
    iget-boolean v1, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeadersIgnorePadding:Z

    if-eqz v1, :cond_19

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getWidth()I

    move-result v1

    goto :goto_14

    :cond_19
    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getWidth()I

    move-result v1

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getPaddingLeft()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getPaddingRight()I

    move-result v2

    sub-int/2addr v1, v2

    :goto_14
    iget-object v2, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mStickiedHeader:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v2

    if-eq v2, v1, :cond_1d

    iget-boolean v1, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeadersIgnorePadding:Z

    if-eqz v1, :cond_1a

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getWidth()I

    move-result v1

    const/high16 v2, 0x40000000    # 2.0f

    invoke-static {v1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    goto :goto_15

    :cond_1a
    const/high16 v2, 0x40000000    # 2.0f

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getWidth()I

    move-result v1

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getPaddingLeft()I

    move-result v3

    sub-int/2addr v1, v3

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getPaddingRight()I

    move-result v3

    sub-int/2addr v1, v3

    invoke-static {v1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    :goto_15
    iget-object v3, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mStickiedHeader:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    if-eqz v3, :cond_1b

    iget v4, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-lez v4, :cond_1b

    iget v3, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-static {v3, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    move v3, v2

    const/4 v2, 0x0

    goto :goto_16

    :cond_1b
    const/4 v2, 0x0

    invoke-static {v2, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    :goto_16
    iget-object v4, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mStickiedHeader:Landroid/view/View;

    invoke-static {v2, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    invoke-static {v2, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    invoke-virtual {v4, v5, v6}, Landroid/view/View;->measure(II)V

    iget-object v4, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mStickiedHeader:Landroid/view/View;

    invoke-virtual {v4, v1, v3}, Landroid/view/View;->measure(II)V

    iget-boolean v1, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeadersIgnorePadding:Z

    if-eqz v1, :cond_1c

    iget-object v1, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mStickiedHeader:Landroid/view/View;

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getLeft()I

    move-result v3

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getRight()I

    move-result v4

    iget-object v5, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mStickiedHeader:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    move-result v5

    invoke-virtual {v1, v3, v2, v4, v5}, Landroid/view/View;->layout(IIII)V

    goto :goto_17

    :cond_1c
    iget-object v1, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mStickiedHeader:Landroid/view/View;

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getLeft()I

    move-result v3

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getPaddingLeft()I

    move-result v4

    add-int/2addr v3, v4

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getRight()I

    move-result v4

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getPaddingRight()I

    move-result v5

    sub-int/2addr v4, v5

    iget-object v5, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mStickiedHeader:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    move-result v5

    invoke-virtual {v1, v3, v2, v4, v5}, Landroid/view/View;->layout(IIII)V

    goto :goto_17

    :cond_1d
    const/4 v2, 0x0

    :goto_17
    iget-boolean v1, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeadersIgnorePadding:Z

    if-eqz v1, :cond_1e

    iget-object v1, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mClippingRect:Landroid/graphics/Rect;

    iput v2, v1, Landroid/graphics/Rect;->left:I

    iget-object v1, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mClippingRect:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getWidth()I

    move-result v2

    iput v2, v1, Landroid/graphics/Rect;->right:I

    goto :goto_18

    :cond_1e
    iget-object v1, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mClippingRect:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getPaddingLeft()I

    move-result v2

    iput v2, v1, Landroid/graphics/Rect;->left:I

    iget-object v1, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mClippingRect:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getWidth()I

    move-result v2

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getPaddingRight()I

    move-result v3

    sub-int/2addr v2, v3

    iput v2, v1, Landroid/graphics/Rect;->right:I

    :goto_18
    iget-object v1, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mClippingRect:Landroid/graphics/Rect;

    add-int v5, v19, v9

    iput v5, v1, Landroid/graphics/Rect;->bottom:I

    iget-boolean v1, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mClippingToPadding:Z

    if-eqz v1, :cond_1f

    iget-object v1, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mClippingRect:Landroid/graphics/Rect;

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getPaddingTop()I

    move-result v2

    iput v2, v1, Landroid/graphics/Rect;->top:I

    goto :goto_19

    :cond_1f
    iget-object v1, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mClippingRect:Landroid/graphics/Rect;

    const/4 v2, 0x0

    iput v2, v1, Landroid/graphics/Rect;->top:I

    :goto_19
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->save()I

    iget-object v1, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mClippingRect:Landroid/graphics/Rect;

    invoke-virtual {v8, v1}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z

    iget-boolean v1, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeadersIgnorePadding:Z

    if-eqz v1, :cond_20

    move/from16 v5, v19

    int-to-float v1, v5

    const/4 v2, 0x0

    invoke-virtual {v8, v2, v1}, Landroid/graphics/Canvas;->translate(FF)V

    goto :goto_1a

    :cond_20
    move/from16 v5, v19

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getPaddingLeft()I

    move-result v1

    int-to-float v1, v1

    int-to-float v2, v5

    invoke-virtual {v8, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    :goto_1a
    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getStickyHeaderIsTranscluent()Z

    move-result v1

    if-nez v1, :cond_21

    iget v1, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeaderBottomPosition:I

    if-eq v1, v9, :cond_21

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v1

    int-to-float v4, v1

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v1

    int-to-float v5, v1

    iget v1, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeaderBottomPosition:I

    mul-int/lit16 v1, v1, 0xff

    div-int v6, v1, v9

    const/16 v7, 0x1f

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Canvas;->saveLayerAlpha(FFFFII)I

    :cond_21
    iget-object v1, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mStickiedHeader:Landroid/view/View;

    invoke-virtual {v1, v8}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual/range {p0 .. p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getStickyHeaderIsTranscluent()Z

    move-result v1

    if-nez v1, :cond_22

    iget v1, v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeaderBottomPosition:I

    if-eq v1, v9, :cond_22

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    :cond_22
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method public getChildViewByItemIndex(I)Landroid/view/View;
    .locals 1

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    invoke-virtual {v0, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;->getItemPositionByItemIndex(I)I

    move-result p1

    invoke-super {p0}, Landroid/widget/GridView;->getFirstVisiblePosition()I

    move-result v0

    sub-int v0, p1, v0

    if-ltz v0, :cond_0

    invoke-super {p0}, Landroid/widget/GridView;->getLastVisiblePosition()I

    move-result v0

    if-gt p1, v0, :cond_0

    invoke-super {p0}, Landroid/widget/GridView;->getFirstVisiblePosition()I

    move-result v0

    sub-int/2addr p1, v0

    invoke-virtual {p0, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getGroupIndexByItemIndex(I)I
    .locals 1

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    invoke-virtual {v0, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;->getGroupIndexByItemIndex(I)I

    move-result p1

    return p1
.end method

.method public getGroupItemStartIndex(I)I
    .locals 1

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    invoke-virtual {v0, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;->getGroupItemStartIndex(I)I

    move-result p1

    return p1
.end method

.method public getGroupItemsCount(I)I
    .locals 1

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    invoke-virtual {v0, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;->getCountForHeader(I)I

    move-result p1

    return p1
.end method

.method public getHeaderAt(I)Landroid/view/View;
    .locals 1

    const/4 v0, -0x2

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mStickiedHeader:Landroid/view/View;

    return-object p1

    :cond_0
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getHeaderNum()I
    .locals 1

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    invoke-virtual {v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;->getHeaderNum()I

    move-result v0

    return v0
.end method

.method public getHeaderViewCount()I
    .locals 1

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeaderViewInfos:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItemIndexByItemPosition(I)I
    .locals 1

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    invoke-virtual {v0, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;->translatePosition(I)Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper$Position;

    move-result-object p1

    iget p1, p1, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper$Position;->mPosition:I

    return p1
.end method

.method public getRealAdapter()Landroid/widget/ListAdapter;
    .locals 1

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mRealAdapter:Landroid/widget/ListAdapter;

    return-object v0
.end method

.method public getRequestedNumColumns()I
    .locals 1

    iget v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mRequestedNumColumns:I

    return v0
.end method

.method public getStickiedHeader()Landroid/view/View;
    .locals 1

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mStickiedHeader:Landroid/view/View;

    return-object v0
.end method

.method public getStickyHeaderIsTranscluent()Z
    .locals 1

    iget-boolean v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mMaskStickyHeaderRegion:Z

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public notifyChanged()V
    .locals 1

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    invoke-virtual {v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;->notifyDataSetChanged()V

    return-void
.end method

.method protected onAttachedToWindow()V
    .locals 3

    invoke-super {p0}, Landroid/widget/GridView;->onAttachedToWindow()V

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeaderViewInfos:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$FixedViewInfo;

    iget-object v1, v1, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$FixedViewInfo;->view:Landroid/view/View;

    invoke-virtual {p0, v1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->attachHeader(Landroid/view/View;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mFooterViewInfos:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$FixedViewInfo;

    iget-object v1, v1, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$FixedViewInfo;->view:Landroid/view/View;

    invoke-virtual {p0, v1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->attachHeader(Landroid/view/View;)V

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mGestureDetector:Lcom/miui/gallery/view/GestureDetector;

    if-nez v0, :cond_2

    new-instance v0, Lcom/miui/gallery/view/GestureDetector;

    invoke-virtual {p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mGestureListener:Lcom/miui/gallery/view/GestureDetector$OnGestureListener;

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/view/GestureDetector;-><init>(Landroid/content/Context;Lcom/miui/gallery/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mGestureDetector:Lcom/miui/gallery/view/GestureDetector;

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mGestureDetector:Lcom/miui/gallery/view/GestureDetector;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/view/GestureDetector;->setIsDoubleTapEnabled(Z)V

    :cond_2
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    invoke-super {p0}, Landroid/widget/GridView;->onDetachedFromWindow()V

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeaderViewInfos:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$FixedViewInfo;

    iget-object v1, v1, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$FixedViewInfo;->view:Landroid/view/View;

    invoke-virtual {p0, v1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->detachHeader(Landroid/view/View;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mFooterViewInfos:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$FixedViewInfo;

    iget-object v1, v1, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$FixedViewInfo;->view:Landroid/view/View;

    invoke-virtual {p0, v1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->detachHeader(Landroid/view/View;)V

    goto :goto_1

    :cond_1
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    float-to-int v0, v0

    int-to-float v0, v0

    invoke-direct {p0, v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->findMotionHeader(F)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_2

    iget v1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mScrollState:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {p0, v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getHeaderAt(I)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-direct {p0, p1, v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->transformEvent(Landroid/view/MotionEvent;I)Landroid/view/MotionEvent;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_2

    sget-object p1, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->TAG:Ljava/lang/String;

    const-string v0, "header child handled event"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x1

    return p1

    :cond_2
    :goto_0
    invoke-super {p0, p1}, Landroid/widget/GridView;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    invoke-virtual {v0, p3}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;->translatePosition(I)Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper$Position;

    move-result-object p3

    iget v3, p3, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper$Position;->mPosition:I

    if-gez v3, :cond_0

    sget-object p1, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->TAG:Ljava/lang/String;

    const-string p2, "position is invalid, skip"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object p3, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mOnItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    if-eqz p3, :cond_1

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mOnItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    move-object v1, p1

    move-object v2, p2

    move-wide v4, p4

    invoke-interface/range {v0 .. v5}, Landroid/widget/AdapterView$OnItemClickListener;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    :cond_1
    return-void
.end method

.method public onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)Z"
        }
    .end annotation

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    invoke-virtual {v0, p3}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;->translatePosition(I)Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper$Position;

    move-result-object p3

    iget v3, p3, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper$Position;->mPosition:I

    if-gez v3, :cond_0

    sget-object p1, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->TAG:Ljava/lang/String;

    const-string p2, "position is invalid, skip"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x1

    return p1

    :cond_0
    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mOnItemLongClickListener:Landroid/widget/AdapterView$OnItemLongClickListener;

    move-object v1, p1

    move-object v2, p2

    move-wide v4, p4

    invoke-interface/range {v0 .. v5}, Landroid/widget/AdapterView$OnItemLongClickListener;->onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z

    move-result p1

    return p1
.end method

.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    invoke-virtual {v0, p3}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;->translatePosition(I)Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper$Position;

    move-result-object p3

    iget v3, p3, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper$Position;->mPosition:I

    if-gez v3, :cond_0

    sget-object p3, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->TAG:Ljava/lang/String;

    const-string v0, "position is invalid, skip"

    invoke-static {p3, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mOnItemSelectedListener:Landroid/widget/AdapterView$OnItemSelectedListener;

    move-object v1, p1

    move-object v2, p2

    move-wide v4, p4

    invoke-interface/range {v0 .. v5}, Landroid/widget/AdapterView$OnItemSelectedListener;->onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    return-void
.end method

.method protected onMeasure(II)V
    .locals 2

    invoke-direct {p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->measureHeader()V

    invoke-virtual {p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getNumColumns()I

    move-result v0

    invoke-super {p0, p1, p2}, Landroid/widget/GridView;->onMeasure(II)V

    invoke-virtual {p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getNumColumns()I

    move-result p1

    const/4 p2, -0x1

    if-ne v0, p2, :cond_0

    iget v1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mRequestedNumColumns:I

    if-ne p1, v1, :cond_1

    :cond_0
    if-eq v0, p2, :cond_2

    if-eq p1, v0, :cond_2

    :cond_1
    iget-object p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    invoke-virtual {p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;->onColumnChanged()V

    :cond_2
    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mOnItemSelectedListener:Landroid/widget/AdapterView$OnItemSelectedListener;

    invoke-interface {v0, p1}, Landroid/widget/AdapterView$OnItemSelectedListener;->onNothingSelected(Landroid/widget/AdapterView;)V

    return-void
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 1

    check-cast p1, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$SavedState;

    invoke-virtual {p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v0

    invoke-super {p0, v0}, Landroid/widget/GridView;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    iget-boolean p1, p1, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$SavedState;->areHeadersSticky:Z

    iput-boolean p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAreHeadersSticky:Z

    invoke-virtual {p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->requestLayout()V

    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .locals 2

    invoke-super {p0}, Landroid/widget/GridView;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v0

    new-instance v1, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$SavedState;

    invoke-direct {v1, v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$SavedState;-><init>(Landroid/os/Parcelable;)V

    iget-boolean v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAreHeadersSticky:Z

    iput-boolean v0, v1, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$SavedState;->areHeadersSticky:Z

    return-object v1
.end method

.method public onScroll(Landroid/widget/AbsListView;III)V
    .locals 2

    iget-object p4, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    if-eqz p4, :cond_0

    iget-object p4, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    if-eqz p4, :cond_0

    iget-object p4, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    invoke-virtual {p4, p2, p3}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;->translateVisibleInfo(II)Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper$VisibleInfo;

    move-result-object p3

    iget-object p4, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    iget v0, p3, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper$VisibleInfo;->mFirstPosition:I

    iget p3, p3, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper$VisibleInfo;->mVisibleCount:I

    iget-object v1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mRealAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v1}, Landroid/widget/ListAdapter;->getCount()I

    move-result v1

    invoke-interface {p4, p1, v0, p3, v1}, Landroid/widget/AbsListView$OnScrollListener;->onScroll(Landroid/widget/AbsListView;III)V

    :cond_0
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p3, 0x8

    if-lt p1, p3, :cond_1

    invoke-direct {p0, p2}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->scrollChanged(I)V

    :cond_1
    return-void
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 2

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    invoke-interface {v0, p1, p2}, Landroid/widget/AbsListView$OnScrollListener;->onScrollStateChanged(Landroid/widget/AbsListView;I)V

    :cond_0
    sget-object p1, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->TAG:Ljava/lang/String;

    const-string v0, "scrollState changed %s"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iput p2, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mScrollState:I

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 10

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    iget-boolean v1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeaderChildBeingPressed:Z

    iget-boolean v2, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeaderChildBeingPressed:Z

    const/4 v3, -0x2

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v2, :cond_3

    iget v2, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mMotionHeaderPosition:I

    invoke-virtual {p0, v2}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getHeaderAt(I)Landroid/view/View;

    move-result-object v2

    iget v6, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mMotionHeaderPosition:I

    if-ne v6, v3, :cond_0

    move-object v6, v2

    goto :goto_0

    :cond_0
    iget v6, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mMotionHeaderPosition:I

    invoke-virtual {p0, v6}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    :goto_0
    if-eq v0, v5, :cond_1

    const/4 v7, 0x3

    if-ne v0, v7, :cond_2

    :cond_1
    iput-boolean v4, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeaderChildBeingPressed:Z

    :cond_2
    if-eqz v2, :cond_3

    iget v7, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mMotionHeaderPosition:I

    invoke-direct {p0, p1, v7}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->transformEvent(Landroid/view/MotionEvent;I)Landroid/view/MotionEvent;

    move-result-object v7

    invoke-virtual {v2, v7}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    invoke-virtual {v2}, Landroid/view/View;->invalidate()V

    new-instance v7, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$3;

    invoke-direct {v7, p0, v6}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$3;-><init>(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;Landroid/view/View;)V

    invoke-static {}, Landroid/view/ViewConfiguration;->getPressedStateDuration()I

    move-result v8

    int-to-long v8, v8

    invoke-virtual {v2, v7, v8, v9}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    invoke-virtual {v6}, Landroid/view/View;->getTop()I

    move-result v2

    invoke-virtual {p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getWidth()I

    move-result v7

    invoke-virtual {v6}, Landroid/view/View;->getTop()I

    move-result v8

    invoke-virtual {v6}, Landroid/view/View;->getHeight()I

    move-result v6

    add-int/2addr v8, v6

    invoke-virtual {p0, v4, v2, v7, v8}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->invalidate(IIII)V

    :cond_3
    and-int/lit16 v0, v0, 0xff

    const/4 v2, -0x1

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_4

    :pswitch_0
    iget v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mMotionHeaderPosition:I

    if-eq v0, v2, :cond_17

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iget v1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mMotionY:F

    sub-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    iget v1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mTouchSlop:I

    int-to-float v1, v1

    cmpl-float v0, v0, v1

    if-lez v0, :cond_17

    iput v2, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mTouchMode:I

    iget v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mMotionHeaderPosition:I

    invoke-virtual {p0, v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getHeaderAt(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-virtual {v0, v4}, Landroid/view/View;->setPressed(Z)V

    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    :cond_4
    invoke-virtual {p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getHandler()Landroid/os/Handler;

    move-result-object v0

    if-eqz v0, :cond_5

    iget-object v1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mPendingCheckForLongPress:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$CheckForHeaderLongPress;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_5
    iput v2, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mMotionHeaderPosition:I

    goto/16 :goto_4

    :pswitch_1
    iget v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mTouchMode:I

    if-ne v0, v3, :cond_6

    iput v2, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mTouchMode:I

    return v5

    :cond_6
    iget v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mTouchMode:I

    if-eq v0, v2, :cond_17

    iget v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mMotionHeaderPosition:I

    if-ne v0, v2, :cond_7

    goto/16 :goto_4

    :cond_7
    iget v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mMotionHeaderPosition:I

    invoke-virtual {p0, v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getHeaderAt(I)Landroid/view/View;

    move-result-object v0

    sget-object v3, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->TAG:Ljava/lang/String;

    const-string v6, "wasHeaderChildBeingPressed %s"

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-static {v3, v6, v7}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    if-nez v1, :cond_11

    if-eqz v0, :cond_10

    iget v1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mTouchMode:I

    if-eqz v1, :cond_8

    invoke-virtual {v0, v4}, Landroid/view/View;->setPressed(Z)V

    :cond_8
    iget-object v1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mPerformHeaderClick:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$PerformHeaderClick;

    if-nez v1, :cond_9

    new-instance v1, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$PerformHeaderClick;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$PerformHeaderClick;-><init>(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$1;)V

    iput-object v1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mPerformHeaderClick:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$PerformHeaderClick;

    :cond_9
    iget-object v1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mPerformHeaderClick:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$PerformHeaderClick;

    iget v3, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mMotionHeaderPosition:I

    iput v3, v1, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$PerformHeaderClick;->mClickMotionPosition:I

    invoke-virtual {v1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$PerformHeaderClick;->rememberWindowAttachCount()V

    iget v3, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mTouchMode:I

    if-eqz v3, :cond_b

    iget v3, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mTouchMode:I

    if-ne v3, v5, :cond_a

    goto :goto_1

    :cond_a
    iget-boolean v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mDataChanged:Z

    if-nez v0, :cond_10

    invoke-virtual {v1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$PerformHeaderClick;->run()V

    goto :goto_3

    :cond_b
    :goto_1
    invoke-virtual {p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getHandler()Landroid/os/Handler;

    move-result-object v3

    if-eqz v3, :cond_d

    iget v4, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mTouchMode:I

    if-nez v4, :cond_c

    iget-object v4, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mPendingCheckForTap:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$CheckForHeaderTap;

    goto :goto_2

    :cond_c
    iget-object v4, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mPendingCheckForLongPress:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$CheckForHeaderLongPress;

    :goto_2
    invoke-virtual {v3, v4}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_d
    iget-boolean v3, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mDataChanged:Z

    if-nez v3, :cond_f

    iput v5, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mTouchMode:I

    invoke-virtual {v0, v5}, Landroid/view/View;->setPressed(Z)V

    invoke-virtual {p0, v5}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->setPressed(Z)V

    iget-object v3, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mTouchModeReset:Ljava/lang/Runnable;

    if-eqz v3, :cond_e

    iget-object v3, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mTouchModeReset:Ljava/lang/Runnable;

    invoke-virtual {p0, v3}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->removeCallbacks(Ljava/lang/Runnable;)Z

    :cond_e
    new-instance v3, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$4;

    invoke-direct {v3, p0, v0, v1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$4;-><init>(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;Landroid/view/View;Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$PerformHeaderClick;)V

    iput-object v3, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mTouchModeReset:Ljava/lang/Runnable;

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mTouchModeReset:Ljava/lang/Runnable;

    invoke-static {}, Landroid/view/ViewConfiguration;->getPressedStateDuration()I

    move-result v1

    int-to-long v3, v1

    invoke-virtual {p0, v0, v3, v4}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_3

    :cond_f
    iput v2, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mTouchMode:I

    :cond_10
    :goto_3
    iput v2, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mTouchMode:I

    goto :goto_4

    :cond_11
    iput v2, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mTouchMode:I

    return v5

    :pswitch_2
    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mPendingCheckForTap:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$CheckForHeaderTap;

    if-nez v0, :cond_12

    new-instance v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$CheckForHeaderTap;

    invoke-direct {v0, p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$CheckForHeaderTap;-><init>(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;)V

    iput-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mPendingCheckForTap:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$CheckForHeaderTap;

    :cond_12
    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mPendingCheckForTap:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$CheckForHeaderTap;

    invoke-static {}, Landroid/view/ViewConfiguration;->getTapTimeout()I

    move-result v1

    int-to-long v6, v1

    invoke-virtual {p0, v0, v6, v7}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->postDelayed(Ljava/lang/Runnable;J)Z

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    float-to-int v0, v0

    int-to-float v0, v0

    iput v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mMotionY:F

    invoke-direct {p0, v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->findMotionHeader(F)I

    move-result v0

    iput v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mMotionHeaderPosition:I

    iget v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mMotionHeaderPosition:I

    if-eq v0, v2, :cond_17

    iget v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mScrollState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_13

    goto :goto_4

    :cond_13
    iget v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mMotionHeaderPosition:I

    invoke-virtual {p0, v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getHeaderAt(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_16

    iget v1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mMotionHeaderPosition:I

    invoke-direct {p0, p1, v1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->transformEvent(Landroid/view/MotionEvent;I)Landroid/view/MotionEvent;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    if-eqz p1, :cond_14

    iput-boolean v5, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeaderChildBeingPressed:Z

    invoke-virtual {v0, v5}, Landroid/view/View;->setPressed(Z)V

    :cond_14
    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    iget p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mMotionHeaderPosition:I

    if-eq p1, v3, :cond_15

    iget p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mMotionHeaderPosition:I

    invoke-virtual {p0, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    :cond_15
    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result p1

    invoke-virtual {p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getWidth()I

    move-result v1

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v2

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    add-int/2addr v2, v0

    invoke-virtual {p0, v4, p1, v1, v2}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->invalidate(IIII)V

    :cond_16
    iput v4, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mTouchMode:I

    return v5

    :cond_17
    :goto_4
    iget v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mScrollState:I

    iput v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mPreScrollState:I

    invoke-super {p0, p1}, Landroid/widget/GridView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    iget-object v1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mGestureDetector:Lcom/miui/gallery/view/GestureDetector;

    invoke-virtual {v1, p1}, Lcom/miui/gallery/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    return v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public performHeaderClick(Landroid/view/View;J)Z
    .locals 2

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mOnHeaderClickListener:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$OnHeaderClickListener;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-virtual {p0, v1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->playSoundEffect(I)V

    const/4 v0, 0x1

    if-eqz p1, :cond_0

    invoke-virtual {p1, v0}, Landroid/view/View;->sendAccessibilityEvent(I)V

    :cond_0
    iget-object v1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mOnHeaderClickListener:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$OnHeaderClickListener;

    invoke-interface {v1, p0, p1, p2, p3}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$OnHeaderClickListener;->onHeaderClick(Landroid/widget/AdapterView;Landroid/view/View;J)V

    return v0

    :cond_1
    return v1
.end method

.method public removeFooterView(Landroid/view/View;)Z
    .locals 2

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mFooterViewInfos:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mFooterViewInfos:Ljava/util/ArrayList;

    invoke-direct {p0, p1, v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->removeFixedViewInfo(Landroid/view/View;Ljava/util/ArrayList;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mFooterViewInfos:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;->setFooter(Ljava/util/List;)V

    iget-object p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    invoke-virtual {p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;->notifyDataSetChanged()V

    const/4 v1, 0x1

    :cond_0
    return v1

    :cond_1
    return v1
.end method

.method public removeHeaderView(Landroid/view/View;)Z
    .locals 2

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeaderViewInfos:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeaderViewInfos:Ljava/util/ArrayList;

    invoke-direct {p0, p1, v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->removeFixedViewInfo(Landroid/view/View;Ljava/util/ArrayList;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeaderViewInfos:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;->setHeader(Ljava/util/List;)V

    iget-object p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    invoke-virtual {p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;->notifyDataSetChanged()V

    const/4 v1, 0x1

    :cond_0
    return v1

    :cond_1
    return v1
.end method

.method public bridge synthetic setAdapter(Landroid/widget/Adapter;)V
    .locals 0

    check-cast p1, Landroid/widget/ListAdapter;

    invoke-virtual {p0, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->setAdapter(Landroid/widget/ListAdapter;)V

    return-void
.end method

.method public setAdapter(Landroid/widget/ListAdapter;)V
    .locals 7

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mRealAdapter:Landroid/widget/ListAdapter;

    if-ne v0, p1, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mDataSetObserver:Landroid/database/DataSetObserver;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    iget-object v1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mDataSetObserver:Landroid/database/DataSetObserver;

    invoke-virtual {v0, v1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    :cond_1
    iget-boolean v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mClipToPaddingHasBeenSet:Z

    if-nez v0, :cond_2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mClippingToPadding:Z

    :cond_2
    iput-object p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mRealAdapter:Landroid/widget/ListAdapter;

    instance-of v0, p1, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapter;

    if-eqz v0, :cond_3

    check-cast p1, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapter;

    move-object v4, p1

    goto :goto_1

    :cond_3
    instance-of v0, p1, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;

    if-eqz v0, :cond_4

    new-instance v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;

    check-cast p1, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;

    invoke-direct {v0, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;-><init>(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;)V

    :goto_0
    move-object v4, v0

    goto :goto_1

    :cond_4
    new-instance v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersListAdapterWrapper;

    invoke-direct {v0, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersListAdapterWrapper;-><init>(Landroid/widget/ListAdapter;)V

    goto :goto_0

    :goto_1
    new-instance p1, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    invoke-virtual {p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v5, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeaderViewInfos:Ljava/util/ArrayList;

    iget-object v6, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mFooterViewInfos:Ljava/util/ArrayList;

    move-object v1, p1

    move-object v3, p0

    invoke-direct/range {v1 .. v6}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;-><init>(Landroid/content/Context;Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapter;Ljava/util/List;Ljava/util/List;)V

    iput-object p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    iget-object p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mDataSetObserver:Landroid/database/DataSetObserver;

    invoke-virtual {p1, v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    invoke-direct {p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->reset()V

    iget-object p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    invoke-super {p0, p1}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    return-void
.end method

.method public setAreHeadersSticky(Z)V
    .locals 1

    iget-boolean v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAreHeadersSticky:Z

    if-eq p1, v0, :cond_0

    iput-boolean p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAreHeadersSticky:Z

    invoke-virtual {p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->requestLayout()V

    :cond_0
    return-void
.end method

.method public setClipToPadding(Z)V
    .locals 0

    invoke-super {p0, p1}, Landroid/widget/GridView;->setClipToPadding(Z)V

    iput-boolean p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mClippingToPadding:Z

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mClipToPaddingHasBeenSet:Z

    return-void
.end method

.method public setHeadersIgnorePadding(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHeadersIgnorePadding:Z

    return-void
.end method

.method public setHorizontalSpacing(I)V
    .locals 0

    invoke-super {p0, p1}, Landroid/widget/GridView;->setHorizontalSpacing(I)V

    iput p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mHorizontalSpacing:I

    return-void
.end method

.method public setNumColumns(I)V
    .locals 0

    invoke-super {p0, p1}, Landroid/widget/GridView;->setNumColumns(I)V

    iput p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mRequestedNumColumns:I

    return-void
.end method

.method public setOnHeaderClickListener(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$OnHeaderClickListener;)V
    .locals 0

    iput-object p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mOnHeaderClickListener:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$OnHeaderClickListener;

    return-void
.end method

.method public setOnHeaderLongClickListener(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$OnHeaderLongClickListener;)V
    .locals 1

    invoke-virtual {p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->isLongClickable()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->setLongClickable(Z)V

    :cond_0
    iput-object p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mOnHeaderLongClickListener:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$OnHeaderLongClickListener;

    return-void
.end method

.method public setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V
    .locals 0

    iput-object p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mOnItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    new-instance p1, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$5;

    invoke-direct {p1, p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView$5;-><init>(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;)V

    invoke-super {p0, p1}, Landroid/widget/GridView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    return-void
.end method

.method public setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V
    .locals 0

    iput-object p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mOnItemLongClickListener:Landroid/widget/AdapterView$OnItemLongClickListener;

    invoke-super {p0, p0}, Landroid/widget/GridView;->setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V

    return-void
.end method

.method public setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mOnItemSelectedListener:Landroid/widget/AdapterView$OnItemSelectedListener;

    invoke-super {p0, p0}, Landroid/widget/GridView;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    return-void
.end method

.method public setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V
    .locals 0

    iput-object p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    return-void
.end method

.method public setStickyHeaderBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    iput-object p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mStickyHeaderBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    return-void
.end method

.method public setStickyHeaderIsTranscluent(I)V
    .locals 1

    if-ltz p1, :cond_0

    const/16 v0, 0xff

    if-gt p1, v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mMaskStickyHeaderRegion:Z

    iput p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mStickyHeaderBackgroundAlpha:I

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "The value of alpha out of range."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setStickyHeaderIsTranscluent(Z)V
    .locals 0

    xor-int/lit8 p1, p1, 0x1

    iput-boolean p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mMaskStickyHeaderRegion:Z

    return-void
.end method

.method public setVerticalSpacing(I)V
    .locals 0

    invoke-super {p0, p1}, Landroid/widget/GridView;->setVerticalSpacing(I)V

    iput p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mVerticalSpacing:I

    return-void
.end method

.method public viewToPosition(I)V
    .locals 2

    invoke-virtual {p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getLastVisiblePosition()I

    move-result v0

    invoke-virtual {p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getFirstVisiblePosition()I

    move-result v1

    sub-int/2addr v0, v1

    iget-object v1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->mAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;

    invoke-virtual {v1, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapterWrapper;->getItemPositionByItemIndex(I)I

    move-result p1

    div-int/lit8 v0, v0, 0x3

    sub-int/2addr p1, v0

    const/4 v0, 0x0

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->setSelection(I)V

    return-void
.end method
