.class public Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;
.super Lcom/miui/gallery/editor/photo/screen/base/ScreenVirtualEditorView;
.source "ScreenDoodleView.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/screen/doodle/IScreenDoodleOperation;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$TouchAction;,
        Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;
    }
.end annotation


# instance fields
.field private mActivationIndex:I

.field private mColor:I

.field private mCurrentDoodleItem:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

.field private mCurrentMenuItemIndex:I

.field private mDoodleNodeList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;",
            ">;"
        }
    .end annotation
.end field

.field private mGesListener:Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$FeatureGesListener;

.field private mIsAddNew:Z

.field private mMatrix:Landroid/graphics/Matrix;

.field private mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

.field private mPaintType:Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem$PaintType;

.field private mRectFTemp:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/screen/base/ScreenVirtualEditorView;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;)V

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mRectFTemp:Landroid/graphics/RectF;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mIsAddNew:Z

    new-instance p1, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$GesListener;-><init>(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView$1;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mGesListener:Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$FeatureGesListener;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mDoodleNodeList:Ljava/util/ArrayList;

    sget-object p1, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->PATH:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mCurrentDoodleItem:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    const p1, -0x8bd9

    iput p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mColor:I

    sget-object p1, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem$PaintType;->MEDIUM:Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem$PaintType;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mPaintType:Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem$PaintType;

    const/4 p1, -0x1

    iput p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mActivationIndex:I

    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mMatrix:Landroid/graphics/Matrix;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mGesListener:Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$FeatureGesListener;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->setFeatureGestureListener(Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$FeatureGesListener;)V

    new-instance p1, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;-><init>(Landroid/content/res/Resources;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    return-object p0
.end method

.method static synthetic access$1100(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    return-object p0
.end method

.method static synthetic access$1200(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Landroid/graphics/RectF;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mRectFTemp:Landroid/graphics/RectF;

    return-object p0
.end method

.method static synthetic access$1300(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    return-object p0
.end method

.method static synthetic access$1400(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    return-object p0
.end method

.method static synthetic access$1500(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    return-object p0
.end method

.method static synthetic access$1600(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    return-object p0
.end method

.method static synthetic access$1700(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    return-object p0
.end method

.method static synthetic access$1800(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->configOperationPosition(Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;)V

    return-void
.end method

.method static synthetic access$1900(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->invalidate()V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mIsAddNew:Z

    return p0
.end method

.method static synthetic access$2000(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->invalidate()V

    return-void
.end method

.method static synthetic access$202(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mIsAddNew:Z

    return p1
.end method

.method static synthetic access$2100(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->invalidate()V

    return-void
.end method

.method static synthetic access$2200(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->invalidate()V

    return-void
.end method

.method static synthetic access$2300(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->invalidate()V

    return-void
.end method

.method static synthetic access$2400(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    return-object p0
.end method

.method static synthetic access$2500(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mCurrentDoodleItem:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    return-object p0
.end method

.method static synthetic access$2600(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->addNewItem(Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;)V

    return-void
.end method

.method static synthetic access$2700(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Landroid/graphics/Matrix;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mMatrix:Landroid/graphics/Matrix;

    return-object p0
.end method

.method static synthetic access$2800(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mActivationIndex:I

    return p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Ljava/util/ArrayList;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mDoodleNodeList:Ljava/util/ArrayList;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->deleteItem(Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;)V

    return-void
.end method

.method static synthetic access$600(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->setActivation(I)V

    return-void
.end method

.method static synthetic access$700(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    return-object p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    return-object p0
.end method

.method static synthetic access$900(Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    return-object p0
.end method

.method private addNewItem(Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;)V
    .locals 3

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->getBitmapGestureParamsHolder()Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->getMatrixValues()[F

    move-result-object v0

    const/4 v1, 0x0

    aget v0, v0, v1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mPaintType:Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem$PaintType;

    iget v1, v1, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem$PaintType;->paintSize:F

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    mul-float v1, v1, v2

    div-float/2addr v1, v0

    invoke-virtual {p1, v1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->setPaintSize(F)V

    iget v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mColor:I

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->setPaintColor(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mDoodleNodeList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->addDrawNode(Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;)V

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

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    const/4 v1, 0x0

    sget-object v2, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->DELETE:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    const/4 v3, 0x0

    sget-object v4, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->SCALE:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual/range {v0 .. v5}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->configActionPosition(Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Landroid/content/res/Resources;)V

    goto :goto_0

    :cond_0
    iget-object v6, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    sget-object v7, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->DELETE:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    const/4 v8, 0x0

    sget-object v9, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->SCALE:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    const/4 v10, 0x0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    invoke-virtual/range {v6 .. v11}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->configActionPosition(Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Landroid/content/res/Resources;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->DELETE:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    sget-object v2, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->ROTATE:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    sget-object v3, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->SCALE:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    const/4 v4, 0x0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->getResources()Landroid/content/res/Resources;

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

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-virtual {p1, v2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->getStrokeRectF(Landroid/graphics/RectF;)V

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-virtual {v2, v0, v1}, Landroid/graphics/RectF;->offset(FF)V

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->getBitmapGestureParamsHolder()Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    move-result-object v2

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

    iput v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mActivationIndex:I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mDoodleNodeList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->removeDrawNode(Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->invalidate()V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->disableChildHandleMode()V

    return-void
.end method

.method private setActivation(I)V
    .locals 1

    iput p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mActivationIndex:I

    iget p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mActivationIndex:I

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mDoodleNodeList:Ljava/util/ArrayList;

    iget v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mActivationIndex:I

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->configOperationPosition(Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->configOperationDecoration(Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;)V

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->invalidate()V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->enableChildHandleMode()V

    return-void
.end method


# virtual methods
.method public canvasMatrixChange()V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mActivationIndex:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mDoodleNodeList:Ljava/util/ArrayList;

    iget v1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mActivationIndex:I

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->configOperationPosition(Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;)V

    :cond_0
    return-void
.end method

.method public clearActivation()V
    .locals 1

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mActivationIndex:I

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->invalidate()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->disableChildHandleMode()V

    return-void
.end method

.method public drawOverlay(Landroid/graphics/Canvas;)V
    .locals 2

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->getBitmapGestureParamsHolder()Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    move-result-object v0

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/RectF;)Z

    iget v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mActivationIndex:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->draw(Landroid/graphics/Canvas;)V

    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method public getCurrentMenuItemIndex()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mCurrentMenuItemIndex:I

    return v0
.end method

.method public getPaintType()Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem$PaintType;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mPaintType:Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem$PaintType;

    return-object v0
.end method

.method public onChangeOperation(Z)V
    .locals 2

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mGesListener:Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$FeatureGesListener;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->setFeatureGestureListener(Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$FeatureGesListener;)V

    goto :goto_1

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mDoodleNodeList:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->setCanSelected(Z)V

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->clearActivation()V

    :goto_1
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    return-void
.end method

.method public setColor(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mColor:I

    return-void
.end method

.method public setCurrentDoodleItem(Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mCurrentDoodleItem:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    return-void
.end method

.method public setDoodleData(Lcom/miui/gallery/editor/photo/core/common/model/DoodleData;I)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleConfig;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleConfig;->getDoodleItem()Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->setCurrentDoodleItem(Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->clearActivation()V

    iput p2, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mCurrentMenuItemIndex:I

    return-void
.end method

.method public setPaintType(Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem$PaintType;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->mPaintType:Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem$PaintType;

    return-void
.end method
