.class public Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;
.super Lcom/miui/gallery/editor/photo/screen/base/ScreenVirtualEditorView;
.source "ScreenTextView.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/screen/text/IScreenTextOperation;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$GesListener;,
        Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$TouchAction;,
        Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$StatusListener;,
        Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$ConfigListener;
    }
.end annotation


# instance fields
.field private mAuxiliaryPaint:Landroid/graphics/Paint;

.field private mBubbleText:Ljava/lang/String;

.field private mCanvasOffsetY:F

.field private mCurrentDialogConfigIndex:I

.field private mCurrentMenuItemIndex:I

.field private mCurrentTargetOffsetY:F

.field private mFragmentManager:Landroid/app/FragmentManager;

.field private mGesListener:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$GesListener;

.field private mITextDialogConfigs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;",
            ">;"
        }
    .end annotation
.end field

.field private mIsTextChanged:Z

.field private mLocation:[I

.field private mOffsetAnimator:Landroid/animation/ObjectAnimator;

.field private mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

.field private mOriginScale:F

.field private mRectFTemp:Landroid/graphics/RectF;

.field private mRectTemp:Landroid/graphics/Rect;

.field private mRevokeText:Ljava/lang/String;

.field private mStatusListener:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$StatusListener;

.field private mTextConfigDataArray:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;",
            ">;"
        }
    .end annotation
.end field

.field private mTextDrawNode:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextDrawNode;

.field private mTextEditDialog:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

.field private mTextWatcher:Landroid/text/TextWatcher;

.field private mUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;)V
    .locals 2

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/screen/base/ScreenVirtualEditorView;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;)V

    new-instance p1, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$StatusListener;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$StatusListener;-><init>(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$1;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mStatusListener:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$StatusListener;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mITextDialogConfigs:Ljava/util/List;

    new-instance p1, Landroid/util/SparseArray;

    invoke-direct {p1}, Landroid/util/SparseArray;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mTextConfigDataArray:Landroid/util/SparseArray;

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentMenuItemIndex:I

    const/4 p1, -0x1

    iput p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentDialogConfigIndex:I

    new-instance p1, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {p1, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mAuxiliaryPaint:Landroid/graphics/Paint;

    new-instance p1, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$GesListener;

    invoke-direct {p1, p0, v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$GesListener;-><init>(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$1;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mGesListener:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$GesListener;

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mRectFTemp:Landroid/graphics/RectF;

    const/high16 p1, 0x3f800000    # 1.0f

    iput p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mOriginScale:F

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCanvasOffsetY:F

    iput p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentTargetOffsetY:F

    const/4 p1, 0x2

    new-array p1, p1, [I

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mLocation:[I

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mRectTemp:Landroid/graphics/Rect;

    new-instance p1, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$1;-><init>(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mTextWatcher:Landroid/text/TextWatcher;

    new-instance p1, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$2;

    invoke-direct {p1, p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$2;-><init>(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    return-void
.end method

.method static synthetic access$1000(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->setItemBold(Z)V

    return-void
.end method

.method static synthetic access$1100(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->setItemTypeface(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;)V

    return-void
.end method

.method static synthetic access$1200(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->invalidate()V

    return-void
.end method

.method static synthetic access$1300(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    return-object p0
.end method

.method static synthetic access$1400(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;FF)I
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->findItemByEvent(FF)I

    move-result p0

    return p0
.end method

.method static synthetic access$1500(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mITextDialogConfigs:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$1600(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentDialogConfigIndex:I

    return p0
.end method

.method static synthetic access$1700(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;FF)Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$TouchAction;
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->findTouchAction(FF)Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$TouchAction;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1800(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    return-object p0
.end method

.method static synthetic access$1900(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;ZZ)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->countAndInvalidate(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;ZZ)V

    return-void
.end method

.method static synthetic access$2000(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->updateOperationDrawable(Z)V

    return-void
.end method

.method static synthetic access$2100(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->invalidate()V

    return-void
.end method

.method static synthetic access$2200(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->invalidate()V

    return-void
.end method

.method static synthetic access$2300(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->clearActivation(Z)V

    return-void
.end method

.method static synthetic access$2400(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    return-object p0
.end method

.method static synthetic access$2500(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    return-object p0
.end method

.method static synthetic access$2600(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    return-object p0
.end method

.method static synthetic access$2700(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    return-object p0
.end method

.method static synthetic access$2800(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;)Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    return-object p0
.end method

.method static synthetic access$2900(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->configOperationPosition(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;)V

    return-void
.end method

.method static synthetic access$300(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;)Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$StatusListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mStatusListener:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$StatusListener;

    return-object p0
.end method

.method static synthetic access$3000(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;)I
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->findActivationIndex()I

    move-result p0

    return p0
.end method

.method static synthetic access$3100(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->invalidate()V

    return-void
.end method

.method static synthetic access$3200(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;)Landroid/graphics/RectF;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mRectFTemp:Landroid/graphics/RectF;

    return-object p0
.end method

.method static synthetic access$3300(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    return-object p0
.end method

.method static synthetic access$3400(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    return-object p0
.end method

.method static synthetic access$3500(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    return-object p0
.end method

.method static synthetic access$3600(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    return-object p0
.end method

.method static synthetic access$3700(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    return-object p0
.end method

.method static synthetic access$3800(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->invalidate()V

    return-void
.end method

.method static synthetic access$3900(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->invalidate()V

    return-void
.end method

.method static synthetic access$400(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mIsTextChanged:Z

    return p0
.end method

.method static synthetic access$402(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mIsTextChanged:Z

    return p1
.end method

.method static synthetic access$500(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->setItemTextColor(I)V

    return-void
.end method

.method static synthetic access$700(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;F)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->setItemTransparent(F)V

    return-void
.end method

.method static synthetic access$800(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->setItemShadow(Z)V

    return-void
.end method

.method static synthetic access$900(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->setItemTextAlignment(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;)V

    return-void
.end method

.method private addNewDrawNode()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextDrawNode;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextDrawNode;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mTextDrawNode:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextDrawNode;

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->updateDrawNode()V

    return-void
.end method

.method private addNewItem(Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;)V
    .locals 4

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;->isWatermark()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->getBitmapGestureParamsHolder()Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    move-result-object v1

    iget-object v1, v1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->getBitmapGestureParamsHolder()Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    move-result-object v2

    iget-object v2, v2, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    div-float/2addr v1, v2

    const v2, 0x3f733333    # 0.95f

    div-float/2addr v1, v2

    new-instance v2, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;->getWatermarkInfo()Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;

    move-result-object p1

    invoke-direct {v2, v3, p1, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;-><init>(Landroid/content/res/Resources;Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;F)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->getBitmapGestureParamsHolder()Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    move-result-object p1

    iget-object p1, p1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result p1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->getBitmapGestureParamsHolder()Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    move-result-object v1

    iget-object v1, v1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    invoke-virtual {v2, p1, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->setBitmapSize(FF)V

    new-instance p1, Lcom/miui/gallery/editor/photo/screen/text/-$$Lambda$ScreenTextView$Hgz42kLiaSD9pGfYBwPIVheGEsU;

    invoke-direct {p1, p0}, Lcom/miui/gallery/editor/photo/screen/text/-$$Lambda$ScreenTextView$Hgz42kLiaSD9pGfYBwPIVheGEsU;-><init>(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;)V

    invoke-virtual {v2, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->setBitmapLoadingListener(Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog$BitmapLoadingListener;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->getPaddingTop()I

    move-result p1

    invoke-virtual {v2, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkDialog;->setPaddingTop(I)V

    goto :goto_1

    :cond_1
    :goto_0
    new-instance v2, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mContext:Landroid/content/Context;

    invoke-direct {v2, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->getBitmapGestureParamsHolder()Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->getMatrixValues()[F

    move-result-object p1

    aget p1, p1, v0

    const/high16 v1, 0x3f800000    # 1.0f

    div-float/2addr v1, p1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->getBitmapGestureParamsHolder()Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    move-result-object p1

    iget-object p1, p1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result p1

    mul-float v1, v1, p1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->getBitmapGestureParamsHolder()Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    move-result-object p1

    iget-object p1, p1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result p1

    div-float/2addr v1, p1

    iput v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mOriginScale:F

    iget p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mOriginScale:F

    const v1, 0x3e99999a    # 0.3f

    cmpg-float p1, p1, v1

    if-gez p1, :cond_2

    iput v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mOriginScale:F

    :cond_2
    iget p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mOriginScale:F

    invoke-interface {v2, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setScaleMultipleOrigin(F)V

    :goto_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mBubbleText:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mBubbleText:Ljava/lang/String;

    invoke-interface {v2, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setText(Ljava/lang/String;)V

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mITextDialogConfigs:Ljava/util/List;

    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const/4 p1, 0x0

    invoke-interface {v2, p1, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setDisplaySize(FF)V

    const/4 p1, 0x1

    invoke-direct {p0, v2, v0, p1}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->countAndInvalidate(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;ZZ)V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->setLastItemActivation()V

    return-void
.end method

.method private clearActivation(Z)V
    .locals 4

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mITextDialogConfigs:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mITextDialogConfigs:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {v2}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getText()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mITextDialogConfigs:Ljava/util/List;

    add-int/lit8 v3, v1, -0x1

    invoke-interface {v2, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->clear()V

    move v1, v3

    goto :goto_1

    :cond_0
    invoke-interface {v2, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setDrawOutline(Z)V

    invoke-interface {v2, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setActivation(Z)V

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentDialogConfigIndex:I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->disableChildHandleMode()V

    if-eqz p1, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->invalidate()V

    :cond_2
    return-void
.end method

.method private configOperationDecoration(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;)V
    .locals 12

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->isWatermark()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    sget-object v2, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->EDIT:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    const/4 v3, 0x0

    sget-object v4, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->SCALE:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->isReverseColor()Z

    move-result p1

    if-eqz p1, :cond_0

    sget-object p1, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->REVERSE_BLACK:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    :goto_0
    move-object v5, p1

    goto :goto_1

    :cond_0
    sget-object p1, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->REVERSE_WHITE:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    goto :goto_0

    :goto_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual/range {v1 .. v6}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->configActionPosition(Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Landroid/content/res/Resources;)V

    goto :goto_2

    :cond_1
    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->isDialogEnable()Z

    move-result p1

    if-nez p1, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->EDIT:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    const/4 v2, 0x0

    sget-object v3, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->SCALE:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    const/4 v4, 0x0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual/range {v0 .. v5}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->configActionPosition(Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Landroid/content/res/Resources;)V

    goto :goto_2

    :cond_2
    iget-object v6, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    sget-object v7, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->EDIT:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    const/4 v8, 0x0

    sget-object v9, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->SCALE:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    sget-object v10, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->MIRROR:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    invoke-virtual/range {v6 .. v11}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->configActionPosition(Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Landroid/content/res/Resources;)V

    :goto_2
    return-void
.end method

.method private configOperationPosition(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;)V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-interface {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getOutLineRect(Landroid/graphics/RectF;)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->getBitmapGestureParamsHolder()Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    move-result-object v0

    iget-object v3, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mCanvasMatrix:Landroid/graphics/Matrix;

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getRotateDegrees()F

    move-result v4

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/graphics/RectF;->centerX()F

    move-result v5

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/graphics/RectF;->centerY()F

    move-result v6

    invoke-virtual/range {v1 .. v6}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->configDecorationPositon(Landroid/graphics/RectF;Landroid/graphics/Matrix;FFF)V

    return-void
.end method

.method private countAndInvalidate(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;ZZ)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->getBitmapGestureParamsHolder()Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    move-result-object v0

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    invoke-interface {p1, p3, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->countLocation(ZF)V

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-interface {p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getOutLineRect(Landroid/graphics/RectF;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mRectFTemp:Landroid/graphics/RectF;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mRectTemp:Landroid/graphics/Rect;

    invoke-virtual {p1, p2}, Landroid/graphics/RectF;->roundOut(Landroid/graphics/Rect;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mRectTemp:Landroid/graphics/Rect;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->invalidate(Landroid/graphics/Rect;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->invalidate()V

    :goto_0
    return-void
.end method

.method private doEditorExit()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mTextDrawNode:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextDrawNode;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->removeRevokedDrawNode(Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;)V

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mIsTextChanged:Z

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->removeLastItem()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mTextDrawNode:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextDrawNode;

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentDialogConfigIndex:I

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mTextDrawNode:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextDrawNode;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextDrawNode;->setSaved(Z)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mTextDrawNode:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextDrawNode;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->addDrawNode(Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;)V

    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->clear()V

    return-void
.end method

.method private enableStatusForCurrentItem(Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;Z)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentDialogConfigIndex:I

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->isIndexValid(I)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mITextDialogConfigs:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentDialogConfigIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setDialogWithStatusData(Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;)V

    if-eqz p2, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->getBitmapGestureParamsHolder()Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    move-result-object p1

    iget-object p1, p1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayInsideRect:Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/graphics/RectF;->centerX()F

    move-result p1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->getBitmapGestureParamsHolder()Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    move-result-object p2

    iget-object p2, p2, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayInsideRect:Landroid/graphics/RectF;

    invoke-virtual {p2}, Landroid/graphics/RectF;->centerY()F

    move-result p2

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setUserLocationX(F)V

    invoke-interface {v0, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setUserLocationY(F)V

    :cond_1
    const/4 p1, 0x0

    invoke-direct {p0, v0, p1, p1}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->countAndInvalidate(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;ZZ)V

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->configOperationPosition(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;)V

    return-void
.end method

.method private findActivationIndex()I
    .locals 2

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mITextDialogConfigs:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mITextDialogConfigs:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->isActivation()Z

    move-result v1

    if-eqz v1, :cond_0

    return v0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, -0x1

    return v0
.end method

.method private findItemByEvent(FF)I
    .locals 6

    const/high16 v0, -0x40800000    # -1.0f

    const/4 v1, -0x1

    const/4 v2, 0x0

    const/high16 v3, -0x40800000    # -1.0f

    :goto_0
    iget-object v4, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mITextDialogConfigs:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-ge v2, v4, :cond_3

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mITextDialogConfigs:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {v4, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->contains(FF)Z

    move-result v5

    if-nez v5, :cond_0

    goto :goto_1

    :cond_0
    iget-object v5, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-interface {v4, v5}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getOutLineRect(Landroid/graphics/RectF;)V

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-direct {p0, v4, p1, p2}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->getDistance(Landroid/graphics/RectF;FF)F

    move-result v4

    cmpl-float v5, v3, v0

    if-nez v5, :cond_1

    move v1, v2

    move v3, v4

    goto :goto_1

    :cond_1
    cmpg-float v4, v4, v3

    if-gtz v4, :cond_2

    move v1, v2

    :cond_2
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    return v1
.end method

.method private findTouchAction(FF)Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$TouchAction;
    .locals 3

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->DELETE:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->getDecorationRect(Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mRectFTemp:Landroid/graphics/RectF;

    int-to-float p1, p1

    int-to-float p2, p2

    invoke-virtual {v0, p1, p2}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object p1, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$TouchAction;->DELETE:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$TouchAction;

    return-object p1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->SCALE:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->getDecorationRect(Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object p1, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$TouchAction;->SCALE:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$TouchAction;

    return-object p1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->MIRROR:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->getDecorationRect(Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v0

    if-eqz v0, :cond_2

    sget-object p1, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$TouchAction;->MIRROR:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$TouchAction;

    return-object p1

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->EDIT:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->getDecorationRect(Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v0

    if-eqz v0, :cond_3

    sget-object p1, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$TouchAction;->EDIT:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$TouchAction;

    return-object p1

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->REVERSE_WHITE:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->getDecorationRect(Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v0

    if-eqz v0, :cond_4

    sget-object p1, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$TouchAction;->REVERSE_WHITE:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$TouchAction;

    return-object p1

    :cond_4
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->REVERSE_BLACK:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->getDecorationRect(Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mRectFTemp:Landroid/graphics/RectF;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/RectF;->contains(FF)Z

    move-result p1

    if-eqz p1, :cond_5

    sget-object p1, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$TouchAction;->REVERSE_BLACK:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$TouchAction;

    return-object p1

    :cond_5
    sget-object p1, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$TouchAction;->NONE:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$TouchAction;

    return-object p1
.end method

.method private getCurrentItemStatus(Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentDialogConfigIndex:I

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->isIndexValid(I)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->setEmpty()V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mITextDialogConfigs:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentDialogConfigIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getColor()I

    move-result v1

    iput v1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->color:I

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getTextTransparent()F

    move-result v1

    iput v1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->transparentProgress:F

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getTextStyle()Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    move-result-object v1

    iput-object v1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->isBoldText()Z

    move-result v1

    iput-boolean v1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textBold:Z

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->isShadow()Z

    move-result v1

    iput-boolean v1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textShadow:Z

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getTextAlignment()Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    move-result-object v1

    iput-object v1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->textAlignment:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getUserLocationX()F

    move-result v1

    iput v1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->itemPositionX:F

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getUserLocationY()F

    move-result v1

    iput v1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->itemPositionY:F

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getUserScaleMultiple()F

    move-result v1

    iput v1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->itemScale:F

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getRotateDegrees()F

    move-result v0

    iput v0, p1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->itemDegree:F

    return-void
.end method

.method private getDialogStatusData(Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentDialogConfigIndex:I

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->isIndexValid(I)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->setEmpty()V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mITextDialogConfigs:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentDialogConfigIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getDialogStatusData(Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;)V

    return-void
.end method

.method private getDistance(Landroid/graphics/RectF;FF)F
    .locals 2

    invoke-virtual {p1}, Landroid/graphics/RectF;->centerX()F

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/RectF;->centerY()F

    move-result p1

    sub-float/2addr v0, p2

    float-to-double v0, v0

    sub-float/2addr p1, p3

    float-to-double p1, p1

    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide p1

    double-to-float p1, p1

    return p1
.end method

.method private getItemTextDialogConfig()Ljava/lang/String;
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentDialogConfigIndex:I

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->isIndexValid(I)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, ""

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mITextDialogConfigs:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentDialogConfigIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getText()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getTextConfigDataByIndex(I)Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mTextConfigDataArray:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;-><init>()V

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->setEmpty()V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mTextConfigDataArray:Landroid/util/SparseArray;

    invoke-virtual {v1, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    :cond_0
    return-object v0
.end method

.method private init()V
    .locals 3

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mTextEditDialog:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mTextEditDialog:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    new-instance v1, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$ConfigListener;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$ConfigListener;-><init>(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$1;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->setConfigChangeListener(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$ConfigChangeListener;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mTextEditDialog:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mTextWatcher:Landroid/text/TextWatcher;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->setTextWatch(Landroid/text/TextWatcher;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mTextEditDialog:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mStatusListener:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$StatusListener;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->setStatusListener(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$StatusListener;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mAuxiliaryPaint:Landroid/graphics/Paint;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mAuxiliaryPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mAuxiliaryPaint:Landroid/graphics/Paint;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mGesListener:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView$GesListener;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->setFeatureGestureListener(Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$FeatureGesListener;)V

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;-><init>(Landroid/content/res/Resources;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mContext:Landroid/content/Context;

    instance-of v0, v0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mFragmentManager:Landroid/app/FragmentManager;

    :cond_0
    invoke-static {}, Lcom/miui/gallery/editor/photo/core/imports/text/TextManager;->getDefaultTextConfig()Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->addNewItem(Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;)V

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->performSetDialog(Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;I)V

    return-void
.end method

.method private isIndexValid(I)Z
    .locals 1

    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mITextDialogConfigs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private isItemActivation()Z
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentDialogConfigIndex:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static synthetic lambda$addNewItem$44(Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->invalidate()V

    return-void
.end method

.method private performSetDialog(Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;I)V
    .locals 3

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;->getBaseDialogModel()Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mTextConfigDataArray:Landroid/util/SparseArray;

    invoke-virtual {v1, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;

    if-nez v1, :cond_1

    invoke-direct {p0, p2}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->getTextConfigDataByIndex(I)Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;

    move-result-object v1

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;->isWatermark()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;->getWatermarkInfo()Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->watermarkInitSelf(Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo;)V

    goto :goto_0

    :cond_0
    invoke-virtual {v1, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->configSelfByInit(Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;)V

    :goto_0
    const/4 v2, 0x1

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    :goto_1
    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;->isWatermark()Z

    move-result p1

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mBubbleText:Ljava/lang/String;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mBubbleText:Ljava/lang/String;

    iput-object p1, v1, Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;->text:Ljava/lang/String;

    :cond_2
    invoke-direct {p0, v1, v2}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->enableStatusForCurrentItem(Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;Z)V

    iput p2, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentMenuItemIndex:I

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->setItemDialogModel(Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;)V

    return-void
.end method

.method private removeLastItem()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mITextDialogConfigs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mITextDialogConfigs:Ljava/util/List;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mITextDialogConfigs:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method private setItemBold(Z)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentDialogConfigIndex:I

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->isIndexValid(I)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mITextDialogConfigs:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentDialogConfigIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setBoldText(Z)V

    const/4 p1, 0x1

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setActivation(Z)V

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p1}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->countAndInvalidate(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;ZZ)V

    return-void
.end method

.method private setItemDialogModel(Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;)V
    .locals 3

    iget v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentDialogConfigIndex:I

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->isIndexValid(I)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mITextDialogConfigs:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentDialogConfigIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setActivation(Z)V

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-interface {v0, p1, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setDialogModel(Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;Landroid/content/res/Resources;)V

    const/4 p1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->countAndInvalidate(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;ZZ)V

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->configOperationDecoration(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;)V

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->configOperationPosition(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;)V

    return-void
.end method

.method private setItemShadow(Z)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentDialogConfigIndex:I

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->isIndexValid(I)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mITextDialogConfigs:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentDialogConfigIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setShadow(Z)V

    const/4 p1, 0x1

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setActivation(Z)V

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p1}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->countAndInvalidate(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;ZZ)V

    return-void
.end method

.method private setItemTextAlignment(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentDialogConfigIndex:I

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->isIndexValid(I)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mITextDialogConfigs:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentDialogConfigIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setTextAlignment(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;)V

    const/4 p1, 0x1

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setActivation(Z)V

    const/4 p1, 0x0

    invoke-direct {p0, v0, p1, p1}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->countAndInvalidate(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;ZZ)V

    return-void
.end method

.method private setItemTextColor(I)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentDialogConfigIndex:I

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->isIndexValid(I)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mITextDialogConfigs:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentDialogConfigIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setActivation(Z)V

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setColor(I)V

    const/4 p1, 0x0

    invoke-direct {p0, v0, v1, p1}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->countAndInvalidate(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;ZZ)V

    return-void
.end method

.method private setItemTransparent(F)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentDialogConfigIndex:I

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->isIndexValid(I)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mITextDialogConfigs:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentDialogConfigIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setActivation(Z)V

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setTextTransparent(F)V

    const/4 p1, 0x0

    invoke-direct {p0, v0, v1, p1}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->countAndInvalidate(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;ZZ)V

    return-void
.end method

.method private setItemTypeface(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentDialogConfigIndex:I

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->isIndexValid(I)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mITextDialogConfigs:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentDialogConfigIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setActivation(Z)V

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setTextStyle(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;)V

    const/4 p1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->countAndInvalidate(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;ZZ)V

    return-void
.end method

.method private setLastItemActivation()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mITextDialogConfigs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->setActivation(I)V

    return-void
.end method

.method private updateDrawNode()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mTextDrawNode:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextDrawNode;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mITextDialogConfigs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mITextDialogConfigs:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mTextDrawNode:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextDrawNode;

    invoke-virtual {v1, v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextDrawNode;->setTextDialogConfig(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;)Lcom/miui/gallery/editor/photo/screen/text/ScreenTextDrawNode;

    return-void
.end method

.method private updateOperationDrawable(Z)V
    .locals 6

    if-eqz p1, :cond_0

    sget-object p1, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->REVERSE_WHITE:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    :goto_0
    move-object v4, p1

    goto :goto_1

    :cond_0
    sget-object p1, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->REVERSE_BLACK:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    goto :goto_0

    :goto_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->EDIT:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    const/4 v2, 0x0

    sget-object v3, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;->SCALE:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual/range {v0 .. v5}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->configActionPosition(Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable$Action;Landroid/content/res/Resources;)V

    return-void
.end method


# virtual methods
.method public add(Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;I)V
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentMenuItemIndex:I

    if-ne p2, v0, :cond_0

    return-void

    :cond_0
    iget v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentMenuItemIndex:I

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->getTextConfigDataByIndex(I)Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->getDialogStatusData(Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;)V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->getItemTextDialogConfig()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mBubbleText:Ljava/lang/String;

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->removeLastItem()V

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->addNewItem(Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;)V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->isItemActivation()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->setLastItemActivation()V

    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->performSetDialog(Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;I)V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->updateDrawNode()V

    return-void
.end method

.method public canRevoke()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mIsTextChanged:Z

    return v0
.end method

.method public canvasMatrixChange()V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentDialogConfigIndex:I

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->isIndexValid(I)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mITextDialogConfigs:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentDialogConfigIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->configOperationPosition(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;)V

    return-void
.end method

.method public clear()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mIsTextChanged:Z

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentMenuItemIndex:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mBubbleText:Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mITextDialogConfigs:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mTextConfigDataArray:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    return-void
.end method

.method public clearActivation()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->disableChildHandleMode()V

    return-void
.end method

.method public doRevert()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mIsTextChanged:Z

    iget v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentDialogConfigIndex:I

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->isIndexValid(I)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mRevokeText:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->setItemText(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->invalidate()V

    return-void
.end method

.method public doRevoke()V
    .locals 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mIsTextChanged:Z

    iget v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentDialogConfigIndex:I

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->isIndexValid(I)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mITextDialogConfigs:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentDialogConfigIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getText()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mRevokeText:Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mContext:Landroid/content/Context;

    const v1, 0x7f1006d2

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->setItemText(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mTextDrawNode:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextDrawNode;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->addRevokedDrawNode(Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->invalidate()V

    return-void
.end method

.method public drawCurrentNode(Landroid/graphics/Canvas;Landroid/graphics/RectF;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mTextDrawNode:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextDrawNode;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mTextDrawNode:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextDrawNode;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextDrawNode;->draw(Landroid/graphics/Canvas;Landroid/graphics/RectF;)V

    :cond_0
    return-void
.end method

.method public drawOverlay(Landroid/graphics/Canvas;)V
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentDialogConfigIndex:I

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->isIndexValid(I)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->getBitmapGestureParamsHolder()Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    move-result-object v0

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/RectF;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method public getActivationItemBottom()I
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mLocation:[I

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->getLocationInWindow([I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mLocation:[I

    const/4 v1, 0x1

    aget v0, v0, v1

    iget v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentDialogConfigIndex:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    int-to-float v0, v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mOperationDrawable:Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/PaintElementOperationDrawable;->findLowerDecorationPosition()F

    move-result v1

    add-float/2addr v0, v1

    float-to-int v0, v0

    :cond_0
    return v0
.end method

.method public getCurrentMenuItemIndex()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentMenuItemIndex:I

    return v0
.end method

.method public offsetWithAnimator(F)V
    .locals 4

    iget v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentDialogConfigIndex:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    return-void

    :cond_0
    iget v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentTargetOffsetY:F

    cmpl-float v0, v0, p1

    if-nez v0, :cond_1

    return-void

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mOffsetAnimator:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mOffsetAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    goto :goto_0

    :cond_2
    new-instance v0, Landroid/animation/ObjectAnimator;

    invoke-direct {v0}, Landroid/animation/ObjectAnimator;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mOffsetAnimator:Landroid/animation/ObjectAnimator;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mOffsetAnimator:Landroid/animation/ObjectAnimator;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    :goto_0
    iput p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentTargetOffsetY:F

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mOffsetAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0, p0}, Landroid/animation/ObjectAnimator;->setTarget(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mOffsetAnimator:Landroid/animation/ObjectAnimator;

    const-string v1, "canvasOffsetY"

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setPropertyName(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mOffsetAnimator:Landroid/animation/ObjectAnimator;

    const/4 v1, 0x2

    new-array v1, v1, [F

    const/4 v2, 0x0

    iget v3, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCanvasOffsetY:F

    aput v3, v1, v2

    const/4 v2, 0x1

    aput p1, v1, v2

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setFloatValues([F)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mOffsetAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    const-string v0, "ScreenTextView"

    const-string v1, "start targetOffset : %f"

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public onChangeOperation(Z)V
    .locals 0

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->init()V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->addNewDrawNode()V

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->clearActivation()V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->doEditorExit()V

    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->invalidate()V

    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    return-void
.end method

.method public onItemEdit()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mTextEditDialog:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->getItemTextDialogConfig()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mContext:Landroid/content/Context;

    const v2, 0x7f1006d2

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mTextEditDialog:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    invoke-virtual {v2, v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->setWillEditText(Ljava/lang/String;Z)V

    iget v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentMenuItemIndex:I

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->getTextConfigDataByIndex(I)Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->getCurrentItemStatus(Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mTextEditDialog:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    invoke-virtual {v1, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->setInitializeData(Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mTextEditDialog:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mFragmentManager:Landroid/app/FragmentManager;

    const-string v2, "TextEditDialog"

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method public setActivation(I)V
    .locals 3

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->clearActivation(Z)V

    if-ltz p1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mITextDialogConfigs:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lt p1, v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mITextDialogConfigs:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->isActivation()Z

    move-result v1

    if-eqz v1, :cond_1

    return-void

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mITextDialogConfigs:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setActivation(Z)V

    invoke-interface {v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setDrawOutline(Z)V

    invoke-direct {p0, v1, v0, v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->countAndInvalidate(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;ZZ)V

    invoke-direct {p0, v1}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->configOperationDecoration(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;)V

    invoke-direct {p0, v1}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->configOperationPosition(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;)V

    iput p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentDialogConfigIndex:I

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->enableChildHandleMode()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->invalidate()V

    return-void

    :cond_2
    :goto_0
    return-void
.end method

.method public setItemText(Ljava/lang/String;)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentDialogConfigIndex:I

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->isIndexValid(I)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mITextDialogConfigs:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->mCurrentDialogConfigIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setActivation(Z)V

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;->setText(Ljava/lang/String;)V

    const/4 p1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->countAndInvalidate(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;ZZ)V

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->configOperationPosition(Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextDialogConfig;)V

    :cond_1
    return-void
.end method
