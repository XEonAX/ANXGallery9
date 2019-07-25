.class public Lcom/miui/gallery/ui/MonthView;
.super Landroid/view/View;
.source "MonthView.java"

# interfaces
.implements Lcom/miui/gallery/widget/recyclerview/transition/TransitionalView;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/MonthView$ItemView;,
        Lcom/miui/gallery/ui/MonthView$MonthItem;,
        Lcom/miui/gallery/ui/MonthView$MonthTransitionItem;
    }
.end annotation


# static fields
.field private static sTempRect:Landroid/graphics/Rect;


# instance fields
.field private mChildren:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/miui/gallery/ui/MonthView$ItemView;",
            ">;"
        }
    .end annotation
.end field

.field private mDetachedChildren:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/miui/gallery/ui/MonthView$ItemView;",
            ">;"
        }
    .end annotation
.end field

.field private mDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

.field private mItemHorizontalSpace:I

.field private mItemVerticalSpace:I

.field private mSpanCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    sput-object v0, Lcom/miui/gallery/ui/MonthView;->sTempRect:Landroid/graphics/Rect;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/MonthView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/ui/MonthView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p1, Ljava/util/LinkedList;

    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/ui/MonthView;->mChildren:Ljava/util/LinkedList;

    new-instance p1, Ljava/util/LinkedList;

    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/ui/MonthView;->mDetachedChildren:Ljava/util/LinkedList;

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/ui/MonthView;->mItemHorizontalSpace:I

    iput p1, p0, Lcom/miui/gallery/ui/MonthView;->mItemVerticalSpace:I

    const/16 p1, 0xa

    iput p1, p0, Lcom/miui/gallery/ui/MonthView;->mSpanCount:I

    return-void
.end method

.method private calculateItemSize(I)F
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/MonthView;->getPaddingStart()I

    move-result v0

    sub-int/2addr p1, v0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/MonthView;->getPaddingEnd()I

    move-result v0

    sub-int/2addr p1, v0

    int-to-float p1, p1

    iget v0, p0, Lcom/miui/gallery/ui/MonthView;->mItemHorizontalSpace:I

    int-to-float v0, v0

    const/high16 v1, 0x3f800000    # 1.0f

    mul-float v0, v0, v1

    iget v1, p0, Lcom/miui/gallery/ui/MonthView;->mSpanCount:I

    add-int/lit8 v1, v1, -0x1

    int-to-float v1, v1

    mul-float v0, v0, v1

    sub-float/2addr p1, v0

    iget v0, p0, Lcom/miui/gallery/ui/MonthView;->mSpanCount:I

    int-to-float v0, v0

    div-float/2addr p1, v0

    return p1
.end method

.method private calculateLineNum(I)I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/ui/MonthView;->mSpanCount:I

    add-int/2addr p1, v0

    add-int/lit8 p1, p1, -0x1

    iget v0, p0, Lcom/miui/gallery/ui/MonthView;->mSpanCount:I

    div-int/2addr p1, v0

    return p1
.end method

.method private detachItemView(Lcom/miui/gallery/ui/MonthView$ItemView;)V
    .locals 1

    invoke-virtual {p1}, Lcom/miui/gallery/ui/MonthView$ItemView;->detach()V

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthView;->mDetachedChildren:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private drawChildren(Landroid/graphics/Canvas;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthView;->mChildren:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/ui/MonthView$ItemView;

    invoke-virtual {v1, p1}, Lcom/miui/gallery/ui/MonthView$ItemView;->onDraw(Landroid/graphics/Canvas;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private getDisplayImageOptions(Lcom/miui/gallery/ui/MonthView$MonthItem;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthView;->mDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    if-nez v0, :cond_0

    new-instance v0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v1

    iget-object v1, v1, Lcom/miui/gallery/Config$ThumbConfig;->MICRO_THUMB_DISPLAY_IMAGE_OPTIONS_DEFAULT:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cloneFrom(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->preferSyncLoadFromMicroCache(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/MonthView;->mDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    :cond_0
    invoke-static {p1}, Lcom/miui/gallery/ui/MonthView$MonthItem;->access$000(Lcom/miui/gallery/ui/MonthView$MonthItem;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthView;->mDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerFileLength(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-static {p1}, Lcom/miui/gallery/ui/MonthView$MonthItem;->access$000(Lcom/miui/gallery/ui/MonthView$MonthItem;)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->fileLength(J)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/MonthView;->mDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-virtual {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p1

    return-object p1
.end method

.method private isLayoutRTL()Z
    .locals 2

    invoke-static {p0}, Landroid/support/v4/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method private layoutChildren()V
    .locals 11

    iget v0, p0, Lcom/miui/gallery/ui/MonthView;->mSpanCount:I

    if-lez v0, :cond_3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/MonthView;->getWidth()I

    move-result v0

    if-lez v0, :cond_3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/MonthView;->getWidth()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/MonthView;->calculateItemSize(I)F

    move-result v0

    const/4 v1, -0x1

    iget-object v2, p0, Lcom/miui/gallery/ui/MonthView;->mChildren:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/miui/gallery/ui/MonthView$ItemView;

    add-int/lit8 v1, v1, 0x1

    iget v6, p0, Lcom/miui/gallery/ui/MonthView;->mSpanCount:I

    if-ne v1, v6, :cond_0

    add-int/lit8 v4, v4, 0x1

    const/4 v1, 0x0

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/ui/MonthView;->isLayoutRTL()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/MonthView;->getWidth()I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {p0}, Lcom/miui/gallery/ui/MonthView;->getPaddingStart()I

    move-result v7

    int-to-float v7, v7

    iget v8, p0, Lcom/miui/gallery/ui/MonthView;->mItemHorizontalSpace:I

    int-to-float v8, v8

    add-float/2addr v8, v0

    int-to-float v9, v1

    mul-float v8, v8, v9

    add-float/2addr v7, v8

    add-float/2addr v7, v0

    sub-float/2addr v6, v7

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/ui/MonthView;->getPaddingStart()I

    move-result v6

    int-to-float v6, v6

    iget v7, p0, Lcom/miui/gallery/ui/MonthView;->mItemHorizontalSpace:I

    int-to-float v7, v7

    add-float/2addr v7, v0

    int-to-float v8, v1

    mul-float v7, v7, v8

    add-float/2addr v6, v7

    :goto_1
    invoke-virtual {p0}, Lcom/miui/gallery/ui/MonthView;->getPaddingTop()I

    move-result v7

    int-to-float v7, v7

    iget v8, p0, Lcom/miui/gallery/ui/MonthView;->mItemVerticalSpace:I

    int-to-float v8, v8

    add-float/2addr v8, v0

    int-to-float v9, v4

    mul-float v8, v8, v9

    add-float/2addr v7, v8

    invoke-static {v5}, Lcom/miui/gallery/ui/MonthView$ItemView;->access$600(Lcom/miui/gallery/ui/MonthView$ItemView;)Landroid/graphics/RectF;

    move-result-object v8

    if-nez v8, :cond_2

    new-instance v8, Landroid/graphics/RectF;

    invoke-direct {v8}, Landroid/graphics/RectF;-><init>()V

    goto :goto_2

    :cond_2
    invoke-static {v5}, Lcom/miui/gallery/ui/MonthView$ItemView;->access$600(Lcom/miui/gallery/ui/MonthView$ItemView;)Landroid/graphics/RectF;

    move-result-object v8

    :goto_2
    add-float v9, v6, v0

    add-float v10, v7, v0

    invoke-virtual {v8, v6, v7, v9, v10}, Landroid/graphics/RectF;->set(FFFF)V

    invoke-virtual {v5, v8}, Lcom/miui/gallery/ui/MonthView$ItemView;->setFrame(Landroid/graphics/RectF;)Lcom/miui/gallery/ui/MonthView$ItemView;

    goto :goto_0

    :cond_3
    return-void
.end method

.method private obtainItemView()Lcom/miui/gallery/ui/MonthView$ItemView;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthView;->mDetachedChildren:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthView;->mDetachedChildren:Ljava/util/LinkedList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/ui/MonthView$ItemView;

    invoke-virtual {v0, p0}, Lcom/miui/gallery/ui/MonthView$ItemView;->bindView(Landroid/view/View;)Lcom/miui/gallery/ui/MonthView$ItemView;

    return-object v0

    :cond_0
    new-instance v0, Lcom/miui/gallery/ui/MonthView$ItemView;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/MonthView$ItemView;-><init>(Landroid/view/View;)V

    return-object v0
.end method

.method private parseMatchItem(Lcom/miui/gallery/ui/MonthView$MonthItem;)Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;
    .locals 8

    new-instance v7, Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;

    invoke-static {p1}, Lcom/miui/gallery/ui/MonthView$MonthItem;->access$200(Lcom/miui/gallery/ui/MonthView$MonthItem;)I

    move-result v1

    invoke-static {p1}, Lcom/miui/gallery/ui/MonthView$MonthItem;->access$500(Lcom/miui/gallery/ui/MonthView$MonthItem;)J

    move-result-wide v2

    const-string v4, ""

    invoke-static {p1}, Lcom/miui/gallery/ui/MonthView$MonthItem;->access$700(Lcom/miui/gallery/ui/MonthView$MonthItem;)J

    move-result-wide v5

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;-><init>(IJLjava/lang/String;J)V

    return-object v7
.end method

.method private requestLayoutIfNecessary()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthView;->mChildren:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/MonthView;->isLaidOut()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/MonthView;->requestLayout()V

    :cond_0
    return-void
.end method


# virtual methods
.method public bindData(Ljava/util/List;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/ui/MonthView$MonthItem;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/MonthView;->calculateLineNum(I)I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/ui/MonthView;->mChildren:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/MonthView;->calculateLineNum(I)I

    move-result v1

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/ui/MonthView;->mChildren:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    :goto_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    if-ge v1, v3, :cond_1

    iget-object v3, p0, Lcom/miui/gallery/ui/MonthView;->mChildren:Ljava/util/LinkedList;

    invoke-direct {p0}, Lcom/miui/gallery/ui/MonthView;->obtainItemView()Lcom/miui/gallery/ui/MonthView$ItemView;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/ui/MonthView;->mChildren:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    :goto_2
    if-ge v3, v1, :cond_2

    iget-object v4, p0, Lcom/miui/gallery/ui/MonthView;->mChildren:Ljava/util/LinkedList;

    invoke-virtual {v4}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/ui/MonthView$ItemView;

    invoke-direct {p0, v4}, Lcom/miui/gallery/ui/MonthView;->detachItemView(Lcom/miui/gallery/ui/MonthView$ItemView;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_2
    if-eqz v0, :cond_3

    const-string v0, "MonthView"

    const-string v1, "relayout items"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/MonthView;->requestLayoutIfNecessary()V

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/ui/MonthView;->mChildren:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Lcom/miui/gallery/ui/MonthView$ItemView;

    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/ui/MonthView$MonthItem;

    invoke-static {v6}, Lcom/miui/gallery/ui/MonthView$ItemView;->access$100(Lcom/miui/gallery/ui/MonthView$ItemView;)Lcom/miui/gallery/ui/MonthView$MonthItem;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/miui/gallery/ui/MonthView$MonthItem;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    invoke-virtual {v6, v1}, Lcom/miui/gallery/ui/MonthView$ItemView;->setData(Lcom/miui/gallery/ui/MonthView$MonthItem;)Lcom/miui/gallery/ui/MonthView$ItemView;

    const-string v3, "MonthView"

    const-string v4, "bind data %d"

    invoke-static {v1}, Lcom/miui/gallery/ui/MonthView$MonthItem;->access$200(Lcom/miui/gallery/ui/MonthView$MonthItem;)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {v1}, Lcom/miui/gallery/ui/MonthView$MonthItem;->access$300(Lcom/miui/gallery/ui/MonthView$MonthItem;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1}, Lcom/miui/gallery/ui/MonthView$MonthItem;->access$400(Lcom/miui/gallery/ui/MonthView$MonthItem;)Landroid/net/Uri;

    move-result-object v4

    sget-object v5, Lcom/miui/gallery/sdk/download/DownloadType;->MICRO:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/MonthView;->getDisplayImageOptions(Lcom/miui/gallery/ui/MonthView$MonthItem;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v7

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v1

    iget-object v8, v1, Lcom/miui/gallery/Config$ThumbConfig;->sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    invoke-static/range {v3 .. v8}, Lcom/miui/gallery/util/BindImageHelper;->bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;)V

    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    :cond_5
    return-void
.end method

.method public findClosestMatchItemUnder(FF)Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;
    .locals 10

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthView;->mChildren:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const-wide v1, 0x41dfffffffc00000L    # 2.147483647E9

    const/4 v3, 0x0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/ui/MonthView$ItemView;

    invoke-static {v4}, Lcom/miui/gallery/ui/MonthView$ItemView;->access$600(Lcom/miui/gallery/ui/MonthView$ItemView;)Landroid/graphics/RectF;

    move-result-object v5

    invoke-static {v5, p1, p2}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->distance(Landroid/graphics/RectF;FF)D

    move-result-wide v5

    const-wide/16 v7, 0x0

    cmpl-double v9, v5, v7

    if-lez v9, :cond_0

    cmpg-double v7, v5, v1

    if-gez v7, :cond_0

    move-object v3, v4

    move-wide v1, v5

    goto :goto_0

    :cond_1
    invoke-static {v3}, Lcom/miui/gallery/ui/MonthView$ItemView;->access$100(Lcom/miui/gallery/ui/MonthView$ItemView;)Lcom/miui/gallery/ui/MonthView$MonthItem;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/MonthView;->parseMatchItem(Lcom/miui/gallery/ui/MonthView$MonthItem;)Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;

    move-result-object p1

    return-object p1
.end method

.method public findMatchItemUnder(FF)Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthView;->mChildren:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/ui/MonthView$ItemView;

    invoke-static {v1}, Lcom/miui/gallery/ui/MonthView$ItemView;->access$600(Lcom/miui/gallery/ui/MonthView$ItemView;)Landroid/graphics/RectF;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-static {v1}, Lcom/miui/gallery/ui/MonthView$ItemView;->access$600(Lcom/miui/gallery/ui/MonthView$ItemView;)Landroid/graphics/RectF;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-static {v1}, Lcom/miui/gallery/ui/MonthView$ItemView;->access$100(Lcom/miui/gallery/ui/MonthView$ItemView;)Lcom/miui/gallery/ui/MonthView$MonthItem;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/MonthView;->parseMatchItem(Lcom/miui/gallery/ui/MonthView$MonthItem;)Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;

    move-result-object p1

    return-object p1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public getItemFrame(J)Landroid/graphics/Rect;
    .locals 6

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/ui/MonthView;->mChildren:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/ui/MonthView$ItemView;

    invoke-static {v2}, Lcom/miui/gallery/ui/MonthView$ItemView;->access$100(Lcom/miui/gallery/ui/MonthView$ItemView;)Lcom/miui/gallery/ui/MonthView$MonthItem;

    move-result-object v3

    invoke-static {v3}, Lcom/miui/gallery/ui/MonthView$MonthItem;->access$500(Lcom/miui/gallery/ui/MonthView$MonthItem;)J

    move-result-wide v3

    cmp-long v5, v3, p1

    if-nez v5, :cond_0

    invoke-static {v2}, Lcom/miui/gallery/ui/MonthView$ItemView;->access$600(Lcom/miui/gallery/ui/MonthView$ItemView;)Landroid/graphics/RectF;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-static {v2}, Lcom/miui/gallery/ui/MonthView$ItemView;->access$600(Lcom/miui/gallery/ui/MonthView$ItemView;)Landroid/graphics/RectF;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/graphics/RectF;->round(Landroid/graphics/Rect;)V

    :cond_1
    return-object v0
.end method

.method public getTransitionalItems()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/miui/gallery/ui/MonthView;->mChildren:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iget-object v1, p0, Lcom/miui/gallery/ui/MonthView;->mChildren:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/ui/MonthView$ItemView;

    new-instance v3, Lcom/miui/gallery/ui/MonthView$MonthTransitionItem;

    invoke-direct {v3, p0, v2}, Lcom/miui/gallery/ui/MonthView$MonthTransitionItem;-><init>(Lcom/miui/gallery/ui/MonthView;Lcom/miui/gallery/ui/MonthView$ItemView;)V

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/MonthView;->drawChildren(Landroid/graphics/Canvas;)V

    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/MonthView;->layoutChildren()V

    return-void
.end method

.method protected onMeasure(II)V
    .locals 5

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthView;->mChildren:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    if-ltz v0, :cond_0

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/MonthView;->calculateItemSize(I)F

    move-result p2

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthView;->mChildren:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/MonthView;->calculateLineNum(I)I

    move-result v0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/MonthView;->getPaddingTop()I

    move-result v2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/MonthView;->getPaddingBottom()I

    move-result v3

    add-int/2addr v2, v3

    iget v3, p0, Lcom/miui/gallery/ui/MonthView;->mItemVerticalSpace:I

    add-int/lit8 v4, v0, -0x1

    mul-int v3, v3, v4

    add-int/2addr v2, v3

    int-to-float v2, v2

    int-to-float v0, v0

    mul-float p2, p2, v0

    add-float/2addr v2, p2

    float-to-int p2, v2

    invoke-static {p1, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    invoke-static {p2, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    return-void

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "the width of month view must be exactly"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setItemHorizontalSpace(I)V
    .locals 1

    iget v0, p0, Lcom/miui/gallery/ui/MonthView;->mItemHorizontalSpace:I

    if-eq v0, p1, :cond_0

    iput p1, p0, Lcom/miui/gallery/ui/MonthView;->mItemHorizontalSpace:I

    invoke-direct {p0}, Lcom/miui/gallery/ui/MonthView;->requestLayoutIfNecessary()V

    :cond_0
    return-void
.end method

.method public setItemVerticalSpace(I)V
    .locals 1

    iget v0, p0, Lcom/miui/gallery/ui/MonthView;->mItemVerticalSpace:I

    if-eq v0, p1, :cond_0

    iput p1, p0, Lcom/miui/gallery/ui/MonthView;->mItemVerticalSpace:I

    invoke-direct {p0}, Lcom/miui/gallery/ui/MonthView;->requestLayoutIfNecessary()V

    :cond_0
    return-void
.end method

.method public setSpanCount(I)V
    .locals 1

    iget v0, p0, Lcom/miui/gallery/ui/MonthView;->mSpanCount:I

    if-eq v0, p1, :cond_0

    iput p1, p0, Lcom/miui/gallery/ui/MonthView;->mSpanCount:I

    invoke-direct {p0}, Lcom/miui/gallery/ui/MonthView;->requestLayoutIfNecessary()V

    :cond_0
    return-void
.end method
