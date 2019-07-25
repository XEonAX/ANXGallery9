.class public Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;
.super Ljava/lang/Object;
.source "TransitionHelper.java"

# interfaces
.implements Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener$OnScaleListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$FakeTransitionalItem;,
        Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;,
        Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$Transition;,
        Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$DecorViewAware;
    }
.end annotation


# instance fields
.field private mAnchor:Lcom/miui/gallery/widget/recyclerview/transition/TransitionAnchor;

.field private mCurScale:F

.field private mDecoration:Lcom/miui/gallery/widget/recyclerview/transition/TransitionDecoration;

.field private mIsFastScale:Z

.field private mNeedLoadItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$DecorViewAware;",
            ">;"
        }
    .end annotation
.end field

.field private mScaleBeginFactor:F

.field private mState:I

.field private mTransitingFrom:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/support/v7/widget/RecyclerView;",
            ">;"
        }
    .end annotation
.end field

.field private mTransitingTo:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/support/v7/widget/RecyclerView;",
            ">;"
        }
    .end annotation
.end field

.field private mTransition:Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$Transition;

.field private mTransitionListener:Lcom/miui/gallery/widget/recyclerview/transition/TransitionListener;

.field private mViewScaleMapping:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/support/v7/widget/RecyclerView;",
            "Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/miui/gallery/widget/recyclerview/transition/TransitionListener;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mNeedLoadItems:Ljava/util/List;

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mCurScale:F

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mIsFastScale:Z

    iput v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mScaleBeginFactor:F

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mState:I

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mViewScaleMapping:Ljava/util/Map;

    iput-object p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mTransitionListener:Lcom/miui/gallery/widget/recyclerview/transition/TransitionListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;)Ljava/lang/ref/WeakReference;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mTransitingFrom:Ljava/lang/ref/WeakReference;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->stopTransitionInternal(Z)V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;)Lcom/miui/gallery/widget/recyclerview/transition/TransitionDecoration;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mDecoration:Lcom/miui/gallery/widget/recyclerview/transition/TransitionDecoration;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;)Ljava/lang/ref/WeakReference;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mTransitingTo:Ljava/lang/ref/WeakReference;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;)Lcom/miui/gallery/widget/recyclerview/transition/TransitionListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mTransitionListener:Lcom/miui/gallery/widget/recyclerview/transition/TransitionListener;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mState:I

    return p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;)Lcom/miui/gallery/widget/recyclerview/transition/TransitionAnchor;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mAnchor:Lcom/miui/gallery/widget/recyclerview/transition/TransitionAnchor;

    return-object p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView;IJJ)Z
    .locals 0

    invoke-direct/range {p0 .. p7}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->prepareTransition(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView;IJJ)Z

    move-result p0

    return p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->setState(I)V

    return-void
.end method

.method static synthetic access$900(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;FFI)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->startAutoTransition(FFI)V

    return-void
.end method

.method private static calculateDecorItems(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView;IJJ)Ljava/util/List;
    .locals 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v7/widget/RecyclerView;",
            "Landroid/support/v7/widget/RecyclerView;",
            "IJJ)",
            "Ljava/util/List<",
            "Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;",
            ">;"
        }
    .end annotation

    move-object/from16 v0, p0

    invoke-static/range {p0 .. p0}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->parseTransitionalItems(Landroid/support/v7/widget/RecyclerView;)Ljava/util/List;

    move-result-object v1

    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->parseTransitionalItems(Landroid/support/v7/widget/RecyclerView;)Ljava/util/List;

    move-result-object v2

    const/4 v3, 0x0

    if-eqz v1, :cond_12

    if-nez v2, :cond_0

    goto/16 :goto_e

    :cond_0
    move-wide/from16 v4, p3

    invoke-static {v1, v4, v5}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->findItem(Ljava/util/List;J)Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;

    move-result-object v4

    move-wide/from16 v5, p5

    invoke-static {v2, v5, v6}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->findItem(Ljava/util/List;J)Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;

    move-result-object v5

    if-eqz v4, :cond_11

    if-nez v5, :cond_1

    goto/16 :goto_d

    :cond_1
    const/4 v3, 0x2

    const/4 v6, 0x0

    move/from16 v7, p2

    if-ne v7, v3, :cond_2

    invoke-static {v4}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->access$1000(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;)I

    move-result v3

    invoke-static {v5}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->access$1000(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;)I

    move-result v7

    if-le v3, v7, :cond_2

    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    move-object v4, v3

    check-cast v4, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;

    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/List;

    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    move-object v5, v3

    check-cast v5, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;

    const-string v3, "TransitionHelper"

    const-string v7, "rematch the first item as anchor"

    invoke-static {v3, v7}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    invoke-static {v1}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->parseItemGap(Ljava/util/List;)F

    move-result v3

    invoke-static {v2}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->parseItemGap(Ljava/util/List;)F

    move-result v7

    new-instance v8, Landroid/util/LongSparseArray;

    invoke-direct {v8}, Landroid/util/LongSparseArray;-><init>()V

    new-instance v9, Landroid/util/LongSparseArray;

    invoke-direct {v9}, Landroid/util/LongSparseArray;-><init>()V

    new-instance v10, Ljava/util/LinkedList;

    invoke-direct {v10}, Ljava/util/LinkedList;-><init>()V

    invoke-static {v4}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->access$1000(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;)I

    move-result v11

    invoke-interface {v1, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/List;

    invoke-static {v5}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->access$1000(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;)I

    move-result v12

    invoke-interface {v2, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    invoke-static {v0, v11, v12, v3, v7}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->parseDecorItems(Landroid/support/v7/widget/RecyclerView;Ljava/util/List;Ljava/util/List;FF)Ljava/util/List;

    move-result-object v11

    invoke-interface {v10, v11}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    invoke-static {v4}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->access$1000(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;)I

    move-result v12

    int-to-long v12, v12

    invoke-virtual {v8, v12, v13, v11}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    invoke-static {v5}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->access$1000(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;)I

    move-result v12

    int-to-long v12, v12

    invoke-virtual {v9, v12, v13, v11}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    new-instance v11, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$FakeTransitionalItem;

    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    invoke-interface {v12, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;

    invoke-direct {v11, v12}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$FakeTransitionalItem;-><init>(Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;)V

    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12, v6}, Ljava/util/ArrayList;-><init>(I)V

    invoke-static {v4}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->access$1000(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;)I

    move-result v13

    add-int/lit8 v13, v13, -0x1

    :goto_0
    const/4 v14, 0x0

    const/4 v15, -0x1

    if-le v13, v15, :cond_4

    invoke-static {v5}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->access$1000(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;)I

    move-result v16

    invoke-static {v4}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->access$1000(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;)I

    move-result v17

    sub-int v17, v17, v13

    sub-int v6, v16, v17

    if-le v6, v15, :cond_3

    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/util/List;

    invoke-interface {v1, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/util/List;

    invoke-static {v0, v15, v14, v3, v7}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->parseDecorItems(Landroid/support/v7/widget/RecyclerView;Ljava/util/List;Ljava/util/List;FF)Ljava/util/List;

    move-result-object v14

    invoke-interface {v10, v14}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    move-object/from16 v18, v4

    move-object/from16 v19, v5

    int-to-long v4, v13

    invoke-virtual {v8, v4, v5, v14}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    int-to-long v4, v6

    invoke-virtual {v9, v4, v5, v14}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    goto :goto_1

    :cond_3
    move-object/from16 v18, v4

    move-object/from16 v19, v5

    invoke-virtual {v11}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$FakeTransitionalItem;->getTransitFrame()Landroid/graphics/RectF;

    move-result-object v4

    invoke-virtual {v11}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$FakeTransitionalItem;->getTransitFrame()Landroid/graphics/RectF;

    move-result-object v5

    invoke-virtual {v5}, Landroid/graphics/RectF;->height()F

    move-result v5

    neg-float v5, v5

    invoke-virtual {v4, v14, v5}, Landroid/graphics/RectF;->offset(FF)V

    invoke-interface {v12}, Ljava/util/List;->clear()V

    invoke-interface {v12, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {v1, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;

    invoke-static {v0, v4, v12, v3, v7}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->parseDecorItems(Landroid/support/v7/widget/RecyclerView;Ljava/util/List;Ljava/util/List;FF)Ljava/util/List;

    move-result-object v4

    invoke-interface {v10, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    new-instance v5, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$FakeTransitionalItem;

    invoke-direct {v5, v11}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$FakeTransitionalItem;-><init>(Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;)V

    int-to-long v14, v13

    invoke-virtual {v8, v14, v15, v4}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    move-object v11, v5

    :goto_1
    add-int/lit8 v13, v13, -0x1

    move-object/from16 v4, v18

    move-object/from16 v5, v19

    const/4 v6, 0x0

    goto :goto_0

    :cond_4
    move-object/from16 v18, v4

    move-object/from16 v19, v5

    new-instance v4, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$FakeTransitionalItem;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    const/4 v6, 0x0

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;

    invoke-direct {v4, v5}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$FakeTransitionalItem;-><init>(Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;)V

    invoke-static/range {v18 .. v18}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->access$1000(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;)I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    :goto_2
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v6

    if-ge v5, v6, :cond_6

    invoke-static/range {v19 .. v19}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->access$1000(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;)I

    move-result v6

    invoke-static/range {v18 .. v18}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->access$1000(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;)I

    move-result v11

    sub-int v11, v5, v11

    add-int/2addr v6, v11

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v11

    if-ge v6, v11, :cond_5

    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/List;

    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/List;

    invoke-static {v0, v11, v13, v3, v7}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->parseDecorItems(Landroid/support/v7/widget/RecyclerView;Ljava/util/List;Ljava/util/List;FF)Ljava/util/List;

    move-result-object v11

    invoke-interface {v10, v11}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    int-to-long v14, v5

    invoke-virtual {v8, v14, v15, v11}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    int-to-long v13, v6

    invoke-virtual {v9, v13, v14, v11}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    goto :goto_3

    :cond_5
    invoke-virtual {v4}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$FakeTransitionalItem;->getTransitFrame()Landroid/graphics/RectF;

    move-result-object v6

    invoke-virtual {v4}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$FakeTransitionalItem;->getTransitFrame()Landroid/graphics/RectF;

    move-result-object v11

    invoke-virtual {v11}, Landroid/graphics/RectF;->height()F

    move-result v11

    const/4 v13, 0x0

    invoke-virtual {v6, v13, v11}, Landroid/graphics/RectF;->offset(FF)V

    invoke-interface {v12}, Ljava/util/List;->clear()V

    invoke-interface {v12, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    invoke-static {v0, v6, v12, v3, v7}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->parseDecorItems(Landroid/support/v7/widget/RecyclerView;Ljava/util/List;Ljava/util/List;FF)Ljava/util/List;

    move-result-object v6

    invoke-interface {v10, v6}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    new-instance v11, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$FakeTransitionalItem;

    invoke-direct {v11, v4}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$FakeTransitionalItem;-><init>(Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;)V

    int-to-long v13, v5

    invoke-virtual {v8, v13, v14, v6}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    move-object v4, v11

    :goto_3
    add-int/lit8 v5, v5, 0x1

    const/4 v14, 0x0

    const/4 v15, -0x1

    goto :goto_2

    :cond_6
    new-instance v4, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$FakeTransitionalItem;

    const/4 v5, 0x0

    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    invoke-interface {v6, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;

    invoke-direct {v4, v6}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$FakeTransitionalItem;-><init>(Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;)V

    invoke-static/range {v19 .. v19}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->access$1000(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;)I

    move-result v5

    invoke-static/range {v18 .. v18}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->access$1000(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;)I

    move-result v6

    sub-int/2addr v5, v6

    add-int/lit8 v5, v5, -0x1

    const/4 v6, -0x1

    :goto_4
    if-le v5, v6, :cond_7

    invoke-virtual {v4}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$FakeTransitionalItem;->getTransitFrame()Landroid/graphics/RectF;

    move-result-object v11

    invoke-virtual {v4}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$FakeTransitionalItem;->getTransitFrame()Landroid/graphics/RectF;

    move-result-object v13

    invoke-virtual {v13}, Landroid/graphics/RectF;->height()F

    move-result v13

    neg-float v13, v13

    const/4 v14, 0x0

    invoke-virtual {v11, v14, v13}, Landroid/graphics/RectF;->offset(FF)V

    invoke-interface {v12}, Ljava/util/List;->clear()V

    invoke-interface {v12, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/List;

    invoke-static {v0, v12, v11, v3, v7}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->parseDecorItems(Landroid/support/v7/widget/RecyclerView;Ljava/util/List;Ljava/util/List;FF)Ljava/util/List;

    move-result-object v11

    invoke-interface {v10, v11}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    new-instance v13, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$FakeTransitionalItem;

    invoke-direct {v13, v4}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$FakeTransitionalItem;-><init>(Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;)V

    int-to-long v14, v5

    invoke-virtual {v9, v14, v15, v11}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    add-int/lit8 v5, v5, -0x1

    move-object v4, v13

    goto :goto_4

    :cond_7
    new-instance v4, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$FakeTransitionalItem;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    const/4 v6, 0x0

    invoke-interface {v5, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;

    invoke-direct {v4, v5}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$FakeTransitionalItem;-><init>(Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;)V

    invoke-static/range {v19 .. v19}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->access$1000(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;)I

    move-result v5

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v6

    invoke-static/range {v18 .. v18}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->access$1000(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;)I

    move-result v11

    sub-int/2addr v6, v11

    add-int/2addr v5, v6

    :goto_5
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v6

    if-ge v5, v6, :cond_8

    invoke-virtual {v4}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$FakeTransitionalItem;->getTransitFrame()Landroid/graphics/RectF;

    move-result-object v6

    invoke-virtual {v4}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$FakeTransitionalItem;->getTransitFrame()Landroid/graphics/RectF;

    move-result-object v11

    invoke-virtual {v11}, Landroid/graphics/RectF;->height()F

    move-result v11

    const/4 v13, 0x0

    invoke-virtual {v6, v13, v11}, Landroid/graphics/RectF;->offset(FF)V

    invoke-interface {v12}, Ljava/util/List;->clear()V

    invoke-interface {v12, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    invoke-static {v0, v12, v6, v3, v7}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->parseDecorItems(Landroid/support/v7/widget/RecyclerView;Ljava/util/List;Ljava/util/List;FF)Ljava/util/List;

    move-result-object v6

    invoke-interface {v10, v6}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    new-instance v11, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$FakeTransitionalItem;

    invoke-direct {v11, v4}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$FakeTransitionalItem;-><init>(Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;)V

    int-to-long v14, v5

    invoke-virtual {v9, v14, v15, v6}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    add-int/lit8 v5, v5, 0x1

    move-object v4, v11

    goto :goto_5

    :cond_8
    const/4 v3, 0x0

    :goto_6
    invoke-virtual/range {p0 .. p0}, Landroid/support/v7/widget/RecyclerView;->getItemDecorationCount()I

    move-result v4

    const/high16 v5, 0x3f800000    # 1.0f

    const/16 v6, 0xff

    if-ge v3, v4, :cond_c

    invoke-virtual {v0, v3}, Landroid/support/v7/widget/RecyclerView;->getItemDecorationAt(I)Landroid/support/v7/widget/RecyclerView$ItemDecoration;

    move-result-object v4

    if-nez v4, :cond_9

    goto/16 :goto_8

    :cond_9
    instance-of v7, v4, Lcom/miui/gallery/widget/recyclerview/transition/TransitionalView;

    if-eqz v7, :cond_b

    check-cast v4, Lcom/miui/gallery/widget/recyclerview/transition/TransitionalView;

    invoke-interface {v4}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionalView;->getTransitionalItems()Ljava/util/List;

    move-result-object v4

    if-eqz v4, :cond_b

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_7
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_b

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;

    new-instance v11, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;

    invoke-direct {v11, v0}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;-><init>(Landroid/view/View;)V

    invoke-interface {v7}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;->getTransitDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v12

    invoke-virtual {v11, v12}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->setDrawable(Landroid/graphics/drawable/Drawable;)Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;

    move-result-object v11

    invoke-interface {v7}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;->getTransitFrame()Landroid/graphics/RectF;

    move-result-object v12

    invoke-virtual {v11, v12}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->setFromFrame(Landroid/graphics/RectF;)Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;

    move-result-object v11

    invoke-interface {v7}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;->getTransitFrame()Landroid/graphics/RectF;

    move-result-object v12

    invoke-virtual {v11, v12}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->setToFrame(Landroid/graphics/RectF;)Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;

    move-result-object v11

    invoke-interface {v7}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;->getTransitScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object v12

    invoke-virtual {v11, v12}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->setScaleType(Landroid/widget/ImageView$ScaleType;)Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;

    move-result-object v11

    invoke-virtual {v11, v6}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->setFromAlpha(I)Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;

    move-result-object v11

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->setToAlpha(I)Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;

    move-result-object v11

    invoke-interface {v7}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;->getTransitFrame()Landroid/graphics/RectF;

    move-result-object v12

    invoke-static {v1, v12}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->parseItemDecorationBindGroupIndex(Ljava/util/List;Landroid/graphics/RectF;)I

    move-result v12

    int-to-long v13, v12

    invoke-virtual {v8, v13, v14}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/List;

    add-int/lit8 v12, v12, 0x1

    int-to-long v14, v12

    invoke-virtual {v8, v14, v15}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/util/List;

    if-eqz v13, :cond_a

    if-eqz v12, :cond_a

    invoke-interface {v7}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;->getTransitFrame()Landroid/graphics/RectF;

    move-result-object v7

    const/4 v14, 0x0

    invoke-interface {v12, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;

    iget-object v15, v15, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mToFrame:Landroid/graphics/RectF;

    iget v15, v15, Landroid/graphics/RectF;->top:F

    invoke-interface {v13, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v6, v16

    check-cast v6, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;

    iget-object v6, v6, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mToFrame:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v15, v6

    mul-float v15, v15, v5

    invoke-virtual {v7}, Landroid/graphics/RectF;->height()F

    move-result v6

    div-float/2addr v15, v6

    new-instance v6, Landroid/graphics/RectF;

    iget v5, v7, Landroid/graphics/RectF;->left:F

    invoke-interface {v13, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;

    iget-object v13, v13, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mToFrame:Landroid/graphics/RectF;

    iget v13, v13, Landroid/graphics/RectF;->bottom:F

    iget v14, v7, Landroid/graphics/RectF;->left:F

    invoke-virtual {v7}, Landroid/graphics/RectF;->width()F

    move-result v7

    mul-float v7, v7, v15

    add-float/2addr v14, v7

    const/4 v7, 0x0

    invoke-interface {v12, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;

    iget-object v7, v12, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mToFrame:Landroid/graphics/RectF;

    iget v7, v7, Landroid/graphics/RectF;->top:F

    invoke-direct {v6, v5, v13, v14, v7}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {v11, v6}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->setToFrame(Landroid/graphics/RectF;)Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;

    :cond_a
    invoke-virtual {v11}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->build()Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;

    move-result-object v5

    invoke-interface {v10, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const/high16 v5, 0x3f800000    # 1.0f

    const/16 v6, 0xff

    goto/16 :goto_7

    :cond_b
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_6

    :cond_c
    :goto_8
    const/4 v1, 0x0

    :goto_9
    invoke-virtual/range {p1 .. p1}, Landroid/support/v7/widget/RecyclerView;->getItemDecorationCount()I

    move-result v3

    if-ge v1, v3, :cond_10

    move-object/from16 v3, p1

    invoke-virtual {v3, v1}, Landroid/support/v7/widget/RecyclerView;->getItemDecorationAt(I)Landroid/support/v7/widget/RecyclerView$ItemDecoration;

    move-result-object v4

    if-nez v4, :cond_d

    goto/16 :goto_c

    :cond_d
    instance-of v5, v4, Lcom/miui/gallery/widget/recyclerview/transition/TransitionalView;

    if-eqz v5, :cond_f

    check-cast v4, Lcom/miui/gallery/widget/recyclerview/transition/TransitionalView;

    invoke-interface {v4}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionalView;->getTransitionalItems()Ljava/util/List;

    move-result-object v4

    if-eqz v4, :cond_f

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_a
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_f

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;

    new-instance v6, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;

    invoke-direct {v6, v0}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;-><init>(Landroid/view/View;)V

    invoke-interface {v5}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;->getTransitDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->setDrawable(Landroid/graphics/drawable/Drawable;)Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;

    move-result-object v6

    invoke-interface {v5}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;->getTransitFrame()Landroid/graphics/RectF;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->setFromFrame(Landroid/graphics/RectF;)Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;

    move-result-object v6

    invoke-interface {v5}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;->getTransitFrame()Landroid/graphics/RectF;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->setToFrame(Landroid/graphics/RectF;)Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;

    move-result-object v6

    invoke-interface {v5}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;->getTransitScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->setScaleType(Landroid/widget/ImageView$ScaleType;)Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->setFromAlpha(I)Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;

    move-result-object v6

    const/16 v7, 0xff

    invoke-virtual {v6, v7}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->setToAlpha(I)Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;

    move-result-object v6

    invoke-interface {v5}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;->getTransitFrame()Landroid/graphics/RectF;

    move-result-object v8

    invoke-static {v2, v8}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->parseItemDecorationBindGroupIndex(Ljava/util/List;Landroid/graphics/RectF;)I

    move-result v8

    int-to-long v11, v8

    invoke-virtual {v9, v11, v12}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/List;

    add-int/lit8 v8, v8, 0x1

    int-to-long v12, v8

    invoke-virtual {v9, v12, v13}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/List;

    if-eqz v11, :cond_e

    if-eqz v8, :cond_e

    invoke-interface {v5}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;->getTransitFrame()Landroid/graphics/RectF;

    move-result-object v5

    const/4 v12, 0x0

    invoke-interface {v8, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;

    iget-object v13, v13, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mFromFrame:Landroid/graphics/RectF;

    iget v13, v13, Landroid/graphics/RectF;->top:F

    invoke-interface {v11, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;

    iget-object v14, v14, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mFromFrame:Landroid/graphics/RectF;

    iget v14, v14, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v13, v14

    const/high16 v14, 0x3f800000    # 1.0f

    mul-float v13, v13, v14

    invoke-virtual {v5}, Landroid/graphics/RectF;->height()F

    move-result v15

    div-float/2addr v13, v15

    new-instance v15, Landroid/graphics/RectF;

    iget v7, v5, Landroid/graphics/RectF;->left:F

    invoke-interface {v11, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;

    iget-object v11, v11, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mFromFrame:Landroid/graphics/RectF;

    iget v11, v11, Landroid/graphics/RectF;->bottom:F

    iget v14, v5, Landroid/graphics/RectF;->left:F

    invoke-virtual {v5}, Landroid/graphics/RectF;->width()F

    move-result v5

    mul-float v5, v5, v13

    add-float/2addr v14, v5

    invoke-interface {v8, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;

    iget-object v5, v5, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mFromFrame:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->top:F

    invoke-direct {v15, v7, v11, v14, v5}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {v6, v15}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->setFromFrame(Landroid/graphics/RectF;)Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;

    goto :goto_b

    :cond_e
    const/4 v12, 0x0

    :goto_b
    invoke-virtual {v6}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->build()Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;

    move-result-object v5

    invoke-interface {v10, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_a

    :cond_f
    const/4 v12, 0x0

    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_9

    :cond_10
    :goto_c
    return-object v10

    :cond_11
    :goto_d
    const-string v0, "TransitionHelper"

    const-string v1, "find anchor error"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-object v3

    :cond_12
    :goto_e
    const-string v0, "TransitionHelper"

    const-string v1, "parse transitional items error"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-object v3
.end method

.method private cancelLoadTask()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mNeedLoadItems:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$DecorViewAware;

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/nostra13/universalimageloader/core/ImageLoader;->cancelDisplayTask(Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mNeedLoadItems:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    return-void
.end method

.method private clearTransitingViews()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mTransitingFrom:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mTransitingFrom:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->clear()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mTransitingTo:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mTransitingTo:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->clear()V

    :cond_1
    return-void
.end method

.method public static distance(Landroid/graphics/RectF;FF)D
    .locals 2

    if-nez p0, :cond_0

    const-wide/high16 p0, -0x4010000000000000L    # -1.0

    return-wide p0

    :cond_0
    invoke-virtual {p0}, Landroid/graphics/RectF;->centerX()F

    move-result v0

    sub-float/2addr p1, v0

    float-to-double v0, p1

    invoke-virtual {p0}, Landroid/graphics/RectF;->centerY()F

    move-result p0

    sub-float/2addr p2, p0

    float-to-double p0, p2

    invoke-static {v0, v1, p0, p1}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide p0

    return-wide p0
.end method

.method private doScale(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView;IF)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mCurScale:F

    mul-float v0, v0, p4

    iput v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mCurScale:F

    const/high16 p4, 0x3f800000    # 1.0f

    const/4 v0, 0x2

    if-ne p3, v0, :cond_0

    const/4 v0, 0x0

    iget v1, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mCurScale:F

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    invoke-static {p4, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mCurScale:F

    :cond_0
    const/4 v0, 0x1

    if-ne p3, v0, :cond_1

    const/high16 p3, 0x40000000    # 2.0f

    iget v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mCurScale:F

    invoke-static {p4, v0}, Ljava/lang/Math;->max(FF)F

    move-result p4

    invoke-static {p3, p4}, Ljava/lang/Math;->min(FF)F

    move-result p3

    iput p3, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mCurScale:F

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->translateProgress()F

    move-result p3

    iget-object p4, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mDecoration:Lcom/miui/gallery/widget/recyclerview/transition/TransitionDecoration;

    invoke-virtual {p4, p1, p3}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionDecoration;->updateProgress(Landroid/support/v7/widget/RecyclerView;F)V

    iget-object p4, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mTransitionListener:Lcom/miui/gallery/widget/recyclerview/transition/TransitionListener;

    invoke-interface {p4, p1, p2, p3}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionListener;->onTransitionUpdate(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView;F)V

    return-void
.end method

.method public static findClosestViewUnder(Landroid/support/v7/widget/RecyclerView;FF)Landroid/view/View;
    .locals 11

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->findViewUnder(Landroid/support/v7/widget/RecyclerView;FF)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    instance-of v1, v0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionalView;

    if-eqz v1, :cond_0

    return-object v0

    :cond_0
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object p0

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getChildCount()I

    move-result v0

    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    const-wide v2, 0x41dfffffffc00000L    # 2.147483647E9

    const/4 v4, 0x0

    move-wide v5, v2

    const/4 v2, 0x0

    :goto_0
    if-ge v4, v0, :cond_2

    invoke-virtual {p0, v4}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    instance-of v7, v3, Lcom/miui/gallery/widget/recyclerview/transition/TransitionalView;

    if-eqz v7, :cond_1

    invoke-static {v3, v1}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->getViewFrame(Landroid/view/View;Landroid/graphics/RectF;)V

    invoke-static {v1, p1, p2}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->distance(Landroid/graphics/RectF;FF)D

    move-result-wide v7

    const-wide/16 v9, 0x0

    cmpl-double v3, v7, v9

    if-lez v3, :cond_1

    cmpg-double v3, v7, v5

    if-gez v3, :cond_1

    move v2, v4

    move-wide v5, v7

    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_2
    invoke-virtual {p0, v2}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method private static findItem(Ljava/util/List;J)Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;",
            ">;>;J)",
            "Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;"
        }
    .end annotation

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_2

    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;

    invoke-virtual {v3}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->getTransitId()J

    move-result-wide v4

    cmp-long v6, v4, p1

    if-nez v6, :cond_0

    return-object v3

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    const/4 p0, 0x0

    return-object p0
.end method

.method public static findViewUnder(Landroid/support/v7/widget/RecyclerView;FF)Landroid/view/View;
    .locals 0

    invoke-virtual {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView;->findChildViewUnder(FF)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method private static getViewFrame(Landroid/view/View;Landroid/graphics/RectF;)V
    .locals 5

    invoke-virtual {p0}, Landroid/view/View;->getTranslationX()F

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    move-result v2

    int-to-float v2, v2

    add-float/2addr v2, v0

    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    move-result v3

    int-to-float v3, v3

    add-float/2addr v3, v1

    invoke-virtual {p0}, Landroid/view/View;->getRight()I

    move-result v4

    int-to-float v4, v4

    add-float/2addr v4, v0

    invoke-virtual {p0}, Landroid/view/View;->getBottom()I

    move-result p0

    int-to-float p0, p0

    add-float/2addr p0, v1

    invoke-virtual {p1, v2, v3, v4, p0}, Landroid/graphics/RectF;->set(FFFF)V

    return-void
.end method

.method private loadDrawable()V
    .locals 9

    const-string v0, "TransitionHelper"

    const-string v1, "need load count %d"

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mNeedLoadItems:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mNeedLoadItems:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$DecorViewAware;

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v2

    sget-object v1, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->FILE:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    invoke-static {v4}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$DecorViewAware;->access$1100(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$DecorViewAware;)Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;

    move-result-object v3

    iget-object v3, v3, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mLocalPath:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->wrap(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v1

    iget-object v5, v1, Lcom/miui/gallery/Config$ThumbConfig;->MICRO_THUMB_DISPLAY_IMAGE_OPTIONS_DEFAULT:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v1

    iget-object v6, v1, Lcom/miui/gallery/Config$ThumbConfig;->sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v2 .. v8}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingProgressListener;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private static needLoad(Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_0

    iget-object p0, p0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mLocalPath:Ljava/lang/String;

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static parseDecorItems(Landroid/support/v7/widget/RecyclerView;Ljava/util/List;Ljava/util/List;FF)Ljava/util/List;
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v7/widget/RecyclerView;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;",
            ">;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;",
            ">;FF)",
            "Ljava/util/List<",
            "Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;",
            ">;"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v7, v5

    const/4 v6, 0x0

    :goto_0
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v8

    const/high16 v9, 0x3f800000    # 1.0f

    const/16 v10, 0xff

    if-ge v6, v8, :cond_4

    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;

    invoke-interface/range {p2 .. p2}, Ljava/util/List;->size()I

    move-result v11

    if-ge v6, v11, :cond_0

    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;

    goto :goto_1

    :cond_0
    move-object v11, v5

    :goto_1
    if-eqz v11, :cond_1

    invoke-virtual {v11}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->getTransitFrame()Landroid/graphics/RectF;

    move-result-object v12

    goto :goto_2

    :cond_1
    move-object v12, v5

    :goto_2
    if-nez v12, :cond_2

    invoke-interface/range {p2 .. p2}, Ljava/util/List;->size()I

    move-result v12

    add-int/lit8 v12, v12, -0x1

    invoke-interface {v2, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;

    invoke-virtual {v13}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->getTransitFrame()Landroid/graphics/RectF;

    move-result-object v13

    invoke-virtual {v13}, Landroid/graphics/RectF;->width()F

    move-result v13

    mul-float v13, v13, v9

    invoke-interface {v1, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;

    invoke-virtual {v9}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->getTransitFrame()Landroid/graphics/RectF;

    move-result-object v9

    invoke-virtual {v9}, Landroid/graphics/RectF;->width()F

    move-result v9

    div-float/2addr v13, v9

    new-instance v9, Landroid/graphics/RectF;

    invoke-virtual {v8}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->getTransitFrame()Landroid/graphics/RectF;

    move-result-object v12

    invoke-direct {v9, v12}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    invoke-static {v9, v13}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->scaleFrame(Landroid/graphics/RectF;F)V

    iget v12, v7, Landroid/graphics/RectF;->right:F

    add-float v12, v12, p4

    iget v7, v7, Landroid/graphics/RectF;->top:F

    invoke-virtual {v9}, Landroid/graphics/RectF;->width()F

    move-result v14

    add-float/2addr v14, v12

    invoke-virtual {v9}, Landroid/graphics/RectF;->height()F

    move-result v15

    add-float/2addr v15, v7

    invoke-virtual {v9, v12, v7, v14, v15}, Landroid/graphics/RectF;->set(FFFF)V

    move-object v7, v9

    goto :goto_3

    :cond_2
    move-object v7, v12

    :goto_3
    invoke-virtual {v8, v11}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3

    const/16 v9, 0xff

    goto :goto_4

    :cond_3
    const/4 v9, 0x0

    :goto_4
    new-instance v11, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;

    invoke-direct {v11, v0}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;-><init>(Landroid/view/View;)V

    invoke-virtual {v8}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->getTransitPath()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->setLocalPath(Ljava/lang/String;)Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;

    move-result-object v11

    invoke-virtual {v8}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->getTransitDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v12

    invoke-virtual {v11, v12}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->setDrawable(Landroid/graphics/drawable/Drawable;)Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;

    move-result-object v11

    invoke-virtual {v8}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->getTransitFrame()Landroid/graphics/RectF;

    move-result-object v12

    invoke-virtual {v11, v12}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->setFromFrame(Landroid/graphics/RectF;)Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;

    move-result-object v11

    invoke-virtual {v8}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->getTransitScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object v8

    invoke-virtual {v11, v8}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->setScaleType(Landroid/widget/ImageView$ScaleType;)Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;

    move-result-object v8

    invoke-virtual {v8, v10}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->setFromAlpha(I)Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;

    move-result-object v8

    invoke-virtual {v8, v7}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->setToFrame(Landroid/graphics/RectF;)Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;

    move-result-object v8

    invoke-virtual {v8, v9}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->setToAlpha(I)Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;

    move-result-object v8

    invoke-virtual {v8}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->build()Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;

    move-result-object v8

    invoke-interface {v3, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_0

    :cond_4
    move-object v7, v5

    const/4 v6, 0x0

    :goto_5
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->size()I

    move-result v8

    if-ge v6, v8, :cond_9

    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v11

    if-ge v6, v11, :cond_5

    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;

    goto :goto_6

    :cond_5
    move-object v11, v5

    :goto_6
    invoke-virtual {v8, v11}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_6

    invoke-virtual {v11}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->getTransitFrame()Landroid/graphics/RectF;

    move-result-object v7

    goto/16 :goto_8

    :cond_6
    if-eqz v11, :cond_7

    invoke-virtual {v11}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->getTransitFrame()Landroid/graphics/RectF;

    move-result-object v11

    goto :goto_7

    :cond_7
    move-object v11, v5

    :goto_7
    if-nez v11, :cond_8

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v11

    add-int/lit8 v11, v11, -0x1

    invoke-interface {v1, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;

    invoke-virtual {v12}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->getTransitFrame()Landroid/graphics/RectF;

    move-result-object v12

    invoke-virtual {v12}, Landroid/graphics/RectF;->width()F

    move-result v12

    mul-float v12, v12, v9

    invoke-interface {v2, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;

    invoke-virtual {v11}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->getTransitFrame()Landroid/graphics/RectF;

    move-result-object v11

    invoke-virtual {v11}, Landroid/graphics/RectF;->width()F

    move-result v11

    div-float/2addr v12, v11

    new-instance v11, Landroid/graphics/RectF;

    invoke-virtual {v8}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->getTransitFrame()Landroid/graphics/RectF;

    move-result-object v13

    invoke-direct {v11, v13}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    invoke-static {v11, v12}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->scaleFrame(Landroid/graphics/RectF;F)V

    iget v12, v7, Landroid/graphics/RectF;->right:F

    add-float v12, v12, p3

    iget v7, v7, Landroid/graphics/RectF;->top:F

    invoke-virtual {v11}, Landroid/graphics/RectF;->width()F

    move-result v14

    add-float/2addr v14, v12

    invoke-virtual {v11}, Landroid/graphics/RectF;->height()F

    move-result v15

    add-float/2addr v15, v7

    invoke-virtual {v11, v12, v7, v14, v15}, Landroid/graphics/RectF;->set(FFFF)V

    :cond_8
    new-instance v7, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;

    invoke-direct {v7, v0}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;-><init>(Landroid/view/View;)V

    invoke-virtual {v8}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->getTransitPath()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v7, v12}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->setLocalPath(Ljava/lang/String;)Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;

    move-result-object v7

    invoke-virtual {v8}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->getTransitDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v12

    invoke-virtual {v7, v12}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->setDrawable(Landroid/graphics/drawable/Drawable;)Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;

    move-result-object v7

    invoke-virtual {v7, v11}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->setFromFrame(Landroid/graphics/RectF;)Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;

    move-result-object v7

    invoke-virtual {v8}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->getTransitScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object v12

    invoke-virtual {v7, v12}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->setScaleType(Landroid/widget/ImageView$ScaleType;)Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;

    move-result-object v7

    invoke-virtual {v7, v4}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->setFromAlpha(I)Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;

    move-result-object v7

    invoke-virtual {v8}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->getTransitFrame()Landroid/graphics/RectF;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->setToFrame(Landroid/graphics/RectF;)Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;

    move-result-object v7

    invoke-virtual {v7, v10}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->setToAlpha(I)Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;

    move-result-object v7

    invoke-virtual {v7}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem$Builder;->build()Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;

    move-result-object v7

    invoke-interface {v3, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object v7, v11

    :goto_8
    add-int/lit8 v6, v6, 0x1

    goto/16 :goto_5

    :cond_9
    return-object v3
.end method

.method private static parseItemDecorationBindGroupIndex(Ljava/util/List;Landroid/graphics/RectF;)I
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;",
            ">;>;",
            "Landroid/graphics/RectF;",
            ")I"
        }
    .end annotation

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    iget v1, p1, Landroid/graphics/RectF;->top:F

    float-to-int v1, v1

    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    float-to-int p1, p1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    add-int/lit8 v4, v0, -0x1

    if-ge v3, v4, :cond_2

    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;

    add-int/lit8 v6, v3, 0x1

    invoke-interface {p0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    invoke-interface {v7, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;

    invoke-virtual {v5}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->getTransitFrame()Landroid/graphics/RectF;

    move-result-object v5

    iget v5, v5, Landroid/graphics/RectF;->bottom:F

    float-to-int v5, v5

    invoke-virtual {v7}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->getTransitFrame()Landroid/graphics/RectF;

    move-result-object v7

    iget v7, v7, Landroid/graphics/RectF;->top:F

    float-to-int v7, v7

    if-gt v5, v1, :cond_0

    if-lt v7, p1, :cond_0

    return v3

    :cond_0
    if-le v5, v1, :cond_1

    goto :goto_1

    :cond_1
    move v3, v6

    goto :goto_0

    :cond_2
    :goto_1
    invoke-interface {p0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;

    invoke-virtual {p0}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->getTransitFrame()Landroid/graphics/RectF;

    move-result-object p0

    iget p0, p0, Landroid/graphics/RectF;->bottom:F

    float-to-int p0, p0

    if-gt p0, v1, :cond_3

    return v4

    :cond_3
    const/4 p0, -0x1

    return p0
.end method

.method private static parseItemGap(Ljava/util/List;)F
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;",
            ">;>;)F"
        }
    .end annotation

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;

    invoke-virtual {p0}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->getTransitFrame()Landroid/graphics/RectF;

    move-result-object p0

    iget p0, p0, Landroid/graphics/RectF;->left:F

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->getTransitFrame()Landroid/graphics/RectF;

    move-result-object v0

    iget v0, v0, Landroid/graphics/RectF;->right:F

    sub-float/2addr p0, v0

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method private static parseTransitionalItems(Landroid/support/v7/widget/RecyclerView;)Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v7/widget/RecyclerView;",
            ")",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;",
            ">;>;"
        }
    .end annotation

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object p0

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getChildCount()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_1

    invoke-virtual {p0, v3}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    instance-of v5, v4, Lcom/miui/gallery/widget/recyclerview/transition/TransitionalView;

    if-eqz v5, :cond_0

    check-cast v4, Lcom/miui/gallery/widget/recyclerview/transition/TransitionalView;

    invoke-interface {v4}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionalView;->getTransitionalItems()Ljava/util/List;

    move-result-object v4

    if-eqz v4, :cond_0

    invoke-interface {v0, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result p0

    const/4 v1, 0x0

    if-eqz p0, :cond_2

    return-object v1

    :cond_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p0

    new-array p0, p0, [Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;

    invoke-interface {v0, p0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;

    new-instance v0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$3;

    invoke-direct {v0}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$3;-><init>()V

    invoke-static {p0, v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    array-length v3, p0

    const/4 v4, -0x1

    move-object v4, v1

    const/4 v1, 0x0

    const/4 v5, -0x1

    const/4 v6, -0x1

    :goto_1
    if-ge v1, v3, :cond_5

    aget-object v7, p0, v1

    if-eqz v4, :cond_3

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;

    invoke-virtual {v8}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;->getTransitFrame()Landroid/graphics/RectF;

    move-result-object v8

    iget v8, v8, Landroid/graphics/RectF;->top:F

    invoke-interface {v7}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;->getTransitFrame()Landroid/graphics/RectF;

    move-result-object v9

    iget v9, v9, Landroid/graphics/RectF;->top:F

    cmpl-float v8, v8, v9

    if-eqz v8, :cond_4

    :cond_3
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v5, v5, 0x1

    const/4 v6, 0x0

    :cond_4
    new-instance v8, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;

    add-int/lit8 v9, v6, 0x1

    invoke-direct {v8, v7, v5, v6}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$ItemWrapper;-><init>(Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;II)V

    invoke-interface {v4, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    move v6, v9

    goto :goto_1

    :cond_5
    return-object v0
.end method

.method private prepareTransition(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView;IJJ)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mDecoration:Lcom/miui/gallery/widget/recyclerview/transition/TransitionDecoration;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionDecoration;

    invoke-direct {v0}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionDecoration;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mDecoration:Lcom/miui/gallery/widget/recyclerview/transition/TransitionDecoration;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mDecoration:Lcom/miui/gallery/widget/recyclerview/transition/TransitionDecoration;

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->cancelLoadTask()V

    invoke-static/range {p1 .. p7}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->calculateDecorItems(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView;IJJ)Ljava/util/List;

    move-result-object p2

    if-nez p2, :cond_1

    const/4 p1, 0x0

    return p1

    :cond_1
    iget-object p3, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mDecoration:Lcom/miui/gallery/widget/recyclerview/transition/TransitionDecoration;

    invoke-virtual {p3, p1, p2}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionDecoration;->updateItems(Landroid/support/v7/widget/RecyclerView;Ljava/util/List;)V

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_2
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;

    invoke-static {p2}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->needLoad(Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;)Z

    move-result p3

    if-eqz p3, :cond_2

    iget-object p3, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mNeedLoadItems:Ljava/util/List;

    new-instance p4, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$DecorViewAware;

    invoke-direct {p4, p2}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$DecorViewAware;-><init>(Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;)V

    invoke-interface {p3, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_3
    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->loadDrawable()V

    const/4 p1, 0x1

    return p1
.end method

.method private saveTransitingViews(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView;)V
    .locals 1

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mTransitingFrom:Ljava/lang/ref/WeakReference;

    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mTransitingTo:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method private static scaleFrame(Landroid/graphics/RectF;F)V
    .locals 1

    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_0

    iget v0, p0, Landroid/graphics/RectF;->left:F

    mul-float v0, v0, p1

    iput v0, p0, Landroid/graphics/RectF;->left:F

    iget v0, p0, Landroid/graphics/RectF;->top:F

    mul-float v0, v0, p1

    iput v0, p0, Landroid/graphics/RectF;->top:F

    iget v0, p0, Landroid/graphics/RectF;->right:F

    mul-float v0, v0, p1

    iput v0, p0, Landroid/graphics/RectF;->right:F

    iget v0, p0, Landroid/graphics/RectF;->bottom:F

    mul-float v0, v0, p1

    iput v0, p0, Landroid/graphics/RectF;->bottom:F

    :cond_0
    return-void
.end method

.method public static setRecycleChildVisibility(Landroid/support/v7/widget/RecyclerView;I)V
    .locals 2

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_0

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/RecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/view/View;->setVisibility(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private setState(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mState:I

    return-void
.end method

.method private startAutoTransition(FFI)V
    .locals 8

    const v0, 0x3dcccccd    # 0.1f

    cmpl-float v1, p1, v0

    if-lez v1, :cond_0

    new-instance v1, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    :goto_0
    move-object v6, v1

    goto :goto_1

    :cond_0
    new-instance v1, Lmiui/view/animation/CubicEaseInOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseInOutInterpolator;-><init>()V

    goto :goto_0

    :goto_1
    cmpl-float v0, p1, v0

    if-lez v0, :cond_1

    const/16 v0, 0x15e

    const/16 v7, 0x15e

    goto :goto_2

    :cond_1
    const/16 v0, 0x190

    const/16 v7, 0x190

    :goto_2
    new-instance v0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$Transition;

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mTransitingFrom:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Landroid/view/View;

    new-instance v4, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$1;

    invoke-direct {v4, p0}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$1;-><init>(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;)V

    move-object v2, v0

    move v5, p3

    invoke-direct/range {v2 .. v7}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$Transition;-><init>(Landroid/view/View;Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$Transition$OnUpdateListener;ILandroid/view/animation/Interpolator;I)V

    iput-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mTransition:Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$Transition;

    iget-object p3, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mTransition:Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$Transition;

    invoke-virtual {p3, p1, p2}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$Transition;->start(FF)V

    return-void
.end method

.method private stopTransition()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->stopTransitionInternal(Z)V

    return-void
.end method

.method private stopTransitionInternal(Z)V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mTransitingFrom:Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mTransitingFrom:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    goto :goto_0

    :cond_0
    move-object v0, v1

    :goto_0
    if-eqz v0, :cond_3

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mDecoration:Lcom/miui/gallery/widget/recyclerview/transition/TransitionDecoration;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mDecoration:Lcom/miui/gallery/widget/recyclerview/transition/TransitionDecoration;

    invoke-virtual {v2}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionDecoration;->getDecorItems()Ljava/util/List;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mDecoration:Lcom/miui/gallery/widget/recyclerview/transition/TransitionDecoration;

    invoke-virtual {v3, v0, v1}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionDecoration;->updateItems(Landroid/support/v7/widget/RecyclerView;Ljava/util/List;)V

    iget-object v3, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mDecoration:Lcom/miui/gallery/widget/recyclerview/transition/TransitionDecoration;

    invoke-virtual {v0, v3}, Landroid/support/v7/widget/RecyclerView;->removeItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    if-eqz v2, :cond_2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;

    iget-object v3, v2, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v3, :cond_1

    iget-object v3, v2, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getAlpha()I

    move-result v3

    const/16 v4, 0xff

    if-eq v3, v4, :cond_1

    iget-object v2, v2, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, v4}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mTransitionListener:Lcom/miui/gallery/widget/recyclerview/transition/TransitionListener;

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mTransitingFrom:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v7/widget/RecyclerView;

    iget-object v3, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mTransitingTo:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/RecyclerView;

    invoke-interface {v0, v2, v3, p1}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionListener;->onTransitionEnd(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView;Z)V

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mTransition:Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$Transition;

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mTransition:Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$Transition;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$Transition;->stop()V

    :cond_4
    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->cancelLoadTask()V

    iput-object v1, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mAnchor:Lcom/miui/gallery/widget/recyclerview/transition/TransitionAnchor;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mIsFastScale:Z

    const/high16 p1, 0x3f800000    # 1.0f

    iput p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mScaleBeginFactor:F

    const/4 p1, -0x1

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->setState(I)V

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->clearTransitingViews()V

    return-void
.end method

.method private translateProgress()F
    .locals 2

    iget v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mCurScale:F

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    return v0
.end method


# virtual methods
.method public bindTransition(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView;I)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mViewScaleMapping:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;

    invoke-direct {v0, p1, p0}, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;-><init>(Landroid/support/v7/widget/RecyclerView;Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener$OnScaleListener;)V

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mViewScaleMapping:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView;->removeOnItemTouchListener(Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;)V

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView;->addOnItemTouchListener(Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;)V

    invoke-virtual {v0, p2, p3}, Lcom/miui/gallery/widget/recyclerview/transition/ScaleTouchListener;->bindZoomView(Landroid/support/v7/widget/RecyclerView;I)V

    return-void
.end method

.method public onScale(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView;IF)Z
    .locals 15

    move-object v8, p0

    move/from16 v9, p3

    iget v0, v8, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mState:I

    const/4 v10, 0x0

    if-eqz v0, :cond_0

    const-string v0, "TransitionHelper"

    const-string v1, "onScale current state %s, does onScaleBegin hasn\'t called?"

    iget v2, v8, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mState:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return v10

    :cond_0
    iget-boolean v0, v8, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mIsFastScale:Z

    const/4 v11, 0x1

    xor-int/lit8 v12, v0, 0x1

    iget-object v0, v8, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mAnchor:Lcom/miui/gallery/widget/recyclerview/transition/TransitionAnchor;

    if-eqz v0, :cond_2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v13

    iget-object v0, v8, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mAnchor:Lcom/miui/gallery/widget/recyclerview/transition/TransitionAnchor;

    iget-wide v4, v0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionAnchor;->mFromAnchorId:J

    iget-object v0, v8, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mAnchor:Lcom/miui/gallery/widget/recyclerview/transition/TransitionAnchor;

    iget-wide v6, v0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionAnchor;->mToAnchorId:J

    move-object v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v3, p3

    invoke-direct/range {v0 .. v7}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->prepareTransition(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView;IJJ)Z

    move-result v0

    const-string v1, "TransitionHelper"

    const-string v2, "prepare transition cost %s"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, v13

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    if-nez v0, :cond_1

    const-string v0, "TransitionHelper"

    const-string v1, "prepare transition error"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, v10}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->stopTransitionInternal(Z)V

    return v10

    :cond_1
    const/4 v0, 0x0

    iput-object v0, v8, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mAnchor:Lcom/miui/gallery/widget/recyclerview/transition/TransitionAnchor;

    if-eqz v12, :cond_2

    iget v0, v8, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mScaleBeginFactor:F

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct {p0, v1, v2, v9, v0}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->doScale(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView;IF)V

    goto :goto_0

    :cond_2
    move-object/from16 v1, p1

    move-object/from16 v2, p2

    :goto_0
    if-eqz v12, :cond_3

    invoke-direct/range {p0 .. p4}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->doScale(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView;IF)V

    return v11

    :cond_3
    invoke-direct {p0, v11}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->setState(I)V

    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {p0, v0, v1, v9}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->startAutoTransition(FFI)V

    return v10
.end method

.method public onScaleBegin(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView;IFFF)Z
    .locals 8

    iget v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mState:I

    const/4 v1, 0x0

    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    const-string p1, "TransitionHelper"

    const-string p2, "current state %s doesn\'t support manual scale"

    iget p3, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mState:I

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-static {p1, p2, p3}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return v1

    :cond_0
    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mTransitionListener:Lcom/miui/gallery/widget/recyclerview/transition/TransitionListener;

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    move v6, p5

    move v7, p6

    invoke-interface/range {v2 .. v7}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionListener;->onTransitionPrepare(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView;IFF)Lcom/miui/gallery/widget/recyclerview/transition/TransitionAnchor;

    move-result-object p3

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->saveTransitingViews(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView;)V

    if-eqz p3, :cond_2

    invoke-virtual {p3}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionAnchor;->isValid()Z

    move-result p1

    if-eqz p1, :cond_2

    iput-object p3, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mAnchor:Lcom/miui/gallery/widget/recyclerview/transition/TransitionAnchor;

    invoke-direct {p0, v1}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->setState(I)V

    const/high16 p1, 0x3f800000    # 1.0f

    iput p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mCurScale:F

    iput p4, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mScaleBeginFactor:F

    sub-float/2addr p4, p1

    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    move-result p1

    const p2, 0x3d4ccccd    # 0.05f

    cmpl-float p1, p1, p2

    const/4 p2, 0x1

    if-lez p1, :cond_1

    const/4 v1, 0x1

    :cond_1
    iput-boolean v1, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mIsFastScale:Z

    return p2

    :cond_2
    invoke-direct {p0, v1}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->stopTransitionInternal(Z)V

    return v1
.end method

.method public onScaleEnd(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView;IF)V
    .locals 2

    iget p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mState:I

    if-eqz p1, :cond_0

    const-string p1, "TransitionHelper"

    const-string p2, "onScaleEnd current state %s, does onScaleBegin have been called?"

    iget p3, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mState:I

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-static {p1, p2, p3}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    :cond_0
    iget p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mCurScale:F

    mul-float p1, p1, p4

    iput p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mCurScale:F

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->translateProgress()F

    move-result p1

    const/4 p2, 0x0

    cmpl-float p4, p1, p2

    if-lez p4, :cond_1

    const/high16 p2, 0x3f800000    # 1.0f

    :cond_1
    iget-object p4, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mDecoration:Lcom/miui/gallery/widget/recyclerview/transition/TransitionDecoration;

    const v0, 0x3f7d70a4    # 0.99f

    const/4 v1, 0x1

    if-nez p4, :cond_3

    const-string p1, "TransitionHelper"

    const-string p3, "does prepareTransition have been called?"

    invoke-static {p1, p3}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    cmpl-float p1, p2, v0

    if-lez p1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    :goto_0
    invoke-direct {p0, v1}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->stopTransitionInternal(Z)V

    return-void

    :cond_3
    invoke-direct {p0, v1}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->setState(I)V

    cmpl-float p4, p2, v0

    if-lez p4, :cond_4

    goto :goto_1

    :cond_4
    if-ne p3, v1, :cond_5

    const/4 p3, 0x2

    goto :goto_1

    :cond_5
    const/4 p3, 0x1

    :goto_1
    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->startAutoTransition(FFI)V

    return-void
.end method

.method public startTransition(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView;IFF)V
    .locals 8

    iget v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mState:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->stopTransition()V

    :cond_0
    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mTransitionListener:Lcom/miui/gallery/widget/recyclerview/transition/TransitionListener;

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    invoke-interface/range {v2 .. v7}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionListener;->onTransitionPrepare(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView;IFF)Lcom/miui/gallery/widget/recyclerview/transition/TransitionAnchor;

    move-result-object p4

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->saveTransitingViews(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView;)V

    if-eqz p4, :cond_2

    invoke-virtual {p4}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionAnchor;->isValid()Z

    move-result p2

    if-nez p2, :cond_1

    goto :goto_0

    :cond_1
    iput-object p4, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->mAnchor:Lcom/miui/gallery/widget/recyclerview/transition/TransitionAnchor;

    new-instance p2, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$2;

    invoke-direct {p2, p0, p3}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$2;-><init>(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;I)V

    invoke-virtual {p1, p2}, Landroid/support/v7/widget/RecyclerView;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_2
    :goto_0
    const-string p1, "TransitionHelper"

    const-string p2, "invalid anchor %s"

    invoke-static {p1, p2, p4}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->stopTransitionInternal(Z)V

    return-void
.end method
