.class public Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;
.super Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;
.source "DoodleEditorView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView$DoodleCallback;,
        Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView$DoodleEntry;,
        Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView$TouchAction;,
        Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView$GesListener;
    }
.end annotation


# instance fields
.field private mActivationIndex:I

.field private mColor:I

.field private mCurrentDoodleItem:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

.field private mDoodleCallback:Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView$DoodleCallback;

.field private mDoodleNodeList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;",
            ">;"
        }
    .end annotation
.end field

.field private mGesListener:Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView$GesListener;

.field private mIsAddNew:Z

.field private mMatrix:Landroid/graphics/Matrix;

.field private mMatrixValues:[F

.field private mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

.field private mOperationUpdateListener:Lcom/miui/gallery/editor/photo/app/OperationUpdateListener;

.field private mPaintSize:F

.field private mRectFTemp:Landroid/graphics/RectF;

.field private mRevokedDoodleNodeList:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;-><init>(Landroid/content/Context;)V

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mRectFTemp:Landroid/graphics/RectF;

    const/16 p1, 0x9

    new-array p1, p1, [F

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mMatrixValues:[F

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mIsAddNew:Z

    new-instance p1, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView$GesListener;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView$GesListener;-><init>(Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView$1;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mGesListener:Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView$GesListener;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mDoodleNodeList:Ljava/util/ArrayList;

    new-instance p1, Ljava/util/LinkedList;

    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mRevokedDoodleNodeList:Ljava/util/LinkedList;

    sget-object p1, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->PATH:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mCurrentDoodleItem:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    const/high16 p1, -0x1000000

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mColor:I

    const/4 p1, -0x1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mActivationIndex:I

    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mMatrix:Landroid/graphics/Matrix;

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->init()V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;Landroid/view/MotionEvent;[F)V
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->convertPointToViewPortCoordinate(Landroid/view/MotionEvent;[F)V

    return-void
.end method

.method static synthetic access$1000(Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;Landroid/view/MotionEvent;[F)V
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->convertPointToViewPortCoordinate(Landroid/view/MotionEvent;[F)V

    return-void
.end method

.method static synthetic access$1100(Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;Landroid/view/MotionEvent;[F)V
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->convertPointToViewPortCoordinate(Landroid/view/MotionEvent;[F)V

    return-void
.end method

.method static synthetic access$1200(Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;)Landroid/graphics/RectF;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mRectFTemp:Landroid/graphics/RectF;

    return-object p0
.end method

.method static synthetic access$1300(Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;)Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    return-object p0
.end method

.method static synthetic access$1400(Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;[F)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->convertPointToViewPortCoordinate([F)V

    return-void
.end method

.method static synthetic access$1500(Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;Landroid/view/MotionEvent;[F)V
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->convertPointToViewPortCoordinate(Landroid/view/MotionEvent;[F)V

    return-void
.end method

.method static synthetic access$1600(Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;Landroid/view/MotionEvent;[F)V
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->convertPointToViewPortCoordinate(Landroid/view/MotionEvent;[F)V

    return-void
.end method

.method static synthetic access$1700(Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;[F)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->convertPointToViewPortCoordinate([F)V

    return-void
.end method

.method static synthetic access$1800(Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->configOperationPosition(Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;)V

    return-void
.end method

.method static synthetic access$1900(Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;)Ljava/util/LinkedList;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mRevokedDoodleNodeList:Ljava/util/LinkedList;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mIsAddNew:Z

    return p0
.end method

.method static synthetic access$2000(Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->notifyOperationUpdate()V

    return-void
.end method

.method static synthetic access$202(Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mIsAddNew:Z

    return p1
.end method

.method static synthetic access$2100(Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;)Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mCurrentDoodleItem:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    return-object p0
.end method

.method static synthetic access$2200(Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->addNewItem(Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;)V

    return-void
.end method

.method static synthetic access$2300(Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;)Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView$DoodleCallback;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mDoodleCallback:Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView$DoodleCallback;

    return-object p0
.end method

.method static synthetic access$2400(Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;)Landroid/graphics/Matrix;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mMatrix:Landroid/graphics/Matrix;

    return-object p0
.end method

.method static synthetic access$2500(Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;)Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    return-object p0
.end method

.method static synthetic access$2600(Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;Landroid/graphics/RectF;)I
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->getRectOverScrollStatus(Landroid/graphics/RectF;)I

    move-result p0

    return p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mActivationIndex:I

    return p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;)Ljava/util/ArrayList;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mDoodleNodeList:Ljava/util/ArrayList;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->deleteItem(Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;)V

    return-void
.end method

.method static synthetic access$600(Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->setActivation(I)V

    return-void
.end method

.method static synthetic access$700(Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;F)F
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->convertDistanceX(F)F

    move-result p0

    return p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;F)F
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->convertDistanceY(F)F

    move-result p0

    return p0
.end method

.method static synthetic access$900(Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;Landroid/view/MotionEvent;[F)V
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->convertPointToViewPortCoordinate(Landroid/view/MotionEvent;[F)V

    return-void
.end method

.method private addNewItem(Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mCanvasMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mMatrixValues:[F

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->getValues([F)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mMatrixValues:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mPaintSize:F

    div-float/2addr v1, v0

    invoke-virtual {p1, v1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->setPaintSize(F)V

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mColor:I

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->setPaintColor(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mDoodleNodeList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private configOperationDecoration(Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;)V
    .locals 12

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->getDoodleType()Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode$DoodleDrawableType;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode$DoodleDrawableType;->VECTOR:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode$DoodleDrawableType;

    if-ne v0, v1, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->getDoodleName()Ljava/lang/String;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->ARROW:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    const/4 v1, 0x0

    sget-object v2, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->DELETE:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    const/4 v3, 0x0

    sget-object v4, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->SCALE:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual/range {v0 .. v5}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->configActionPosition(Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Landroid/content/res/Resources;)V

    goto :goto_0

    :cond_0
    iget-object v6, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    sget-object v7, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->DELETE:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    const/4 v8, 0x0

    sget-object v9, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->SCALE:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    const/4 v10, 0x0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    invoke-virtual/range {v6 .. v11}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->configActionPosition(Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Landroid/content/res/Resources;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->DELETE:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    sget-object v2, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->ROTATE:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    sget-object v3, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->SCALE:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    const/4 v4, 0x0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual/range {v0 .. v5}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->configActionPosition(Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Landroid/content/res/Resources;)V

    :goto_0
    return-void
.end method

.method private configOperationPosition(Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;)V
    .locals 9

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->getUserLocationX()F

    move-result v0

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->getUserLocationY()F

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-virtual {p1, v2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->getStrokeRectF(Landroid/graphics/RectF;)V

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-virtual {v2, v0, v1}, Landroid/graphics/RectF;->offset(FF)V

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mRectFTemp:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v5, v2, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mCanvasMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->getRotateDegrees()F

    move-result v6

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->getRotateX()F

    move-result v2

    add-float v7, v2, v0

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->getRotateY()F

    move-result p1

    add-float v8, p1, v1

    invoke-virtual/range {v3 .. v8}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->configDecorationPositon(Landroid/graphics/RectF;Landroid/graphics/Matrix;FFF)V

    return-void
.end method

.method private deleteItem(Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;)V
    .locals 1

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mActivationIndex:I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mDoodleNodeList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->invalidate()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->disableChildHandleMode()V

    return-void
.end method

.method private init()V
    .locals 2

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mGesListener:Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView$GesListener;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->setFeatureGestureListener(Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$FeatureGesListener;)V

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;-><init>(Landroid/content/res/Resources;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    sget-object v1, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView$PaintType;->MEDIUM:Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView$PaintType;

    iget v1, v1, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView$PaintType;->paintSize:F

    mul-float v0, v0, v1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mPaintSize:F

    return-void
.end method

.method private notifyOperationUpdate()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mOperationUpdateListener:Lcom/miui/gallery/editor/photo/app/OperationUpdateListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mOperationUpdateListener:Lcom/miui/gallery/editor/photo/app/OperationUpdateListener;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/app/OperationUpdateListener;->onOperationUpdate()V

    :cond_0
    return-void
.end method

.method private setActivation(I)V
    .locals 1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mActivationIndex:I

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mActivationIndex:I

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mDoodleNodeList:Ljava/util/ArrayList;

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mActivationIndex:I

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->configOperationPosition(Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->configOperationDecoration(Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;)V

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->invalidate()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->enableChildHandleMode()V

    return-void
.end method


# virtual methods
.method public canRevert()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mRevokedDoodleNodeList:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public canRevoke()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mDoodleNodeList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public clearActivation()V
    .locals 1

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mActivationIndex:I

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->invalidate()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->disableChildHandleMode()V

    return-void
.end method

.method public doRevert()V
    .locals 2

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mActivationIndex:I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mDoodleNodeList:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mRevokedDoodleNodeList:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->invalidate()V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->notifyOperationUpdate()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->disableChildHandleMode()V

    return-void
.end method

.method public doRevoke()V
    .locals 3

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mActivationIndex:I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mRevokedDoodleNodeList:Ljava/util/LinkedList;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mDoodleNodeList:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mDoodleNodeList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->invalidate()V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->notifyOperationUpdate()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->disableChildHandleMode()V

    return-void
.end method

.method protected drawChild(Landroid/graphics/Canvas;)V
    .locals 2

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mCanvasMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/RectF;)Z

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mDoodleNodeList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mDoodleNodeList:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    invoke-virtual {v1, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->draw(Landroid/graphics/Canvas;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/RectF;)Z

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mActivationIndex:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->draw(Landroid/graphics/Canvas;)V

    :cond_1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method public export()Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView$DoodleEntry;
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->clearActivation()V

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView$DoodleEntry;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v1, v1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mDoodleNodeList:Ljava/util/ArrayList;

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView$DoodleEntry;-><init>(Landroid/graphics/RectF;Ljava/util/List;)V

    return-object v0
.end method

.method public isEmpty()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mDoodleNodeList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    return v0
.end method

.method protected onCanvasMatrixChange()V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mActivationIndex:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mDoodleNodeList:Ljava/util/ArrayList;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mActivationIndex:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->configOperationPosition(Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;)V

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->invalidate()V

    return-void
.end method

.method public setColor(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mColor:I

    return-void
.end method

.method public setCurrentDoodleItem(Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mCurrentDoodleItem:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    return-void
.end method

.method public setDoodleCallback(Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView$DoodleCallback;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mDoodleCallback:Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView$DoodleCallback;

    return-void
.end method

.method public setOperationUpdateListener(Lcom/miui/gallery/editor/photo/app/OperationUpdateListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mOperationUpdateListener:Lcom/miui/gallery/editor/photo/app/OperationUpdateListener;

    return-void
.end method

.method public setPaintSize(F)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEditorView;->mPaintSize:F

    return-void
.end method
