.class public Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;
.super Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;
.source "ScreenEditorView.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/screen/home/IScreenEditorController;


# instance fields
.field private mAnimatorHelper:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper;

.field private mCurrentScreenEditor:Lcom/miui/gallery/editor/photo/screen/base/IScreenOperationEditor;

.field private mDrawNodeList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;",
            ">;"
        }
    .end annotation
.end field

.field private mIsLongCrop:Z

.field private mLastNodeList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;",
            ">;"
        }
    .end annotation
.end field

.field private mLastScreenEditor:Lcom/miui/gallery/editor/photo/screen/base/IScreenOperationEditor;

.field private mLongCropEntry:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;

.field private mLongCropFullBitmapRect:Landroid/graphics/RectF;

.field private mOperationUpdateListener:Lcom/miui/gallery/editor/photo/screen/home/OperationUpdateListener;

.field private mRevokedNodeList:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;",
            ">;"
        }
    .end annotation
.end field

.field private mSavingNodeList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;",
            ">;"
        }
    .end annotation
.end field

.field private mScreenCrop:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

.field private mScreenDoodle:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

.field private mScreenEditViewAnimatorCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper$Callback;

.field private mScreenMosaic:Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;

.field private mScreenText:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;

.field private mThumbnailAnimatorCallback:Lcom/miui/gallery/editor/photo/screen/home/ThumbnailAnimatorCallback;

.field private mTopPixel:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;-><init>(Landroid/content/Context;)V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDrawNodeList:Ljava/util/List;

    new-instance p1, Ljava/util/LinkedList;

    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mRevokedNodeList:Ljava/util/LinkedList;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mSavingNodeList:Ljava/util/List;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mLastNodeList:Ljava/util/List;

    new-instance p1, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;

    invoke-direct {p1}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mLongCropEntry:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;

    new-instance p1, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView$1;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenEditViewAnimatorCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper$Callback;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDrawNodeList:Ljava/util/List;

    new-instance p1, Ljava/util/LinkedList;

    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mRevokedNodeList:Ljava/util/LinkedList;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mSavingNodeList:Ljava/util/List;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mLastNodeList:Ljava/util/List;

    new-instance p1, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;

    invoke-direct {p1}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mLongCropEntry:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;

    new-instance p1, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView$1;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenEditViewAnimatorCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper$Callback;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDrawNodeList:Ljava/util/List;

    new-instance p1, Ljava/util/LinkedList;

    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mRevokedNodeList:Ljava/util/LinkedList;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mSavingNodeList:Ljava/util/List;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mLastNodeList:Ljava/util/List;

    new-instance p1, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;

    invoke-direct {p1}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mLongCropEntry:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;

    new-instance p1, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView$1;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenEditViewAnimatorCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper$Callback;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;)Landroid/graphics/Bitmap;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mOriginBitmap:Landroid/graphics/Bitmap;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;)Lcom/miui/gallery/editor/photo/screen/home/ThumbnailAnimatorCallback;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mThumbnailAnimatorCallback:Lcom/miui/gallery/editor/photo/screen/home/ThumbnailAnimatorCallback;

    return-object p0
.end method

.method private clearRevokeNode()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mRevokedNodeList:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    return-void
.end method

.method private drawToDisplayCanvas()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDrawNodeList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/16 v1, 0xa

    if-le v0, v1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDisplayCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v0}, Landroid/graphics/Canvas;->save()I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDisplayCanvas:Landroid/graphics/Canvas;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v1, v1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayToBitmapMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDrawNodeList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDrawNodeList:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDisplayCanvas:Landroid/graphics/Canvas;

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->getLongCropFullDisplayRect()Landroid/graphics/RectF;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;->draw(Landroid/graphics/Canvas;Landroid/graphics/RectF;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDisplayCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v0}, Landroid/graphics/Canvas;->restore()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDrawNodeList:Ljava/util/List;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDrawNodeList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mSavingNodeList:Ljava/util/List;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDrawNodeList:Ljava/util/List;

    invoke-interface {v1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDrawNodeList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDrawNodeList:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    return-void
.end method

.method private getLongCropFullDisplayRect()Landroid/graphics/RectF;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mLongCropFullBitmapRect:Landroid/graphics/RectF;

    return-object v0
.end method

.method private setLongCropFullBitmapRect()V
    .locals 5

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mIsLongCrop:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v1, v1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-direct {v0, v1}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mLongCropEntry:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;

    iget v2, v2, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;->mBottomRatio:F

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mLongCropEntry:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;

    iget v3, v3, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;->mTopRatio:F

    sub-float/2addr v2, v3

    div-float/2addr v1, v2

    iget v2, v0, Landroid/graphics/RectF;->top:F

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mLongCropEntry:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;

    iget v3, v3, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;->mTopRatio:F

    mul-float v3, v3, v1

    sub-float/2addr v2, v3

    iput v2, v0, Landroid/graphics/RectF;->top:F

    iget v2, v0, Landroid/graphics/RectF;->bottom:F

    const/high16 v3, 0x3f800000    # 1.0f

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mLongCropEntry:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;

    iget v4, v4, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;->mBottomRatio:F

    sub-float/2addr v3, v4

    mul-float v1, v1, v3

    add-float/2addr v2, v1

    iput v2, v0, Landroid/graphics/RectF;->bottom:F

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mLongCropFullBitmapRect:Landroid/graphics/RectF;

    return-void
.end method


# virtual methods
.method public addDrawNode(Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDrawNodeList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->getLongCropFullDisplayRect()Landroid/graphics/RectF;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;->setBitmapRect(Landroid/graphics/RectF;)V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->clearRevokeNode()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->notifyOperationUpdate()V

    return-void
.end method

.method public addRevokedDrawNode(Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mRevokedNodeList:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public canRevert()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mRevokedNodeList:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public canRevoke()Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mCurrentScreenEditor:Lcom/miui/gallery/editor/photo/screen/base/IScreenOperationEditor;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenText:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;

    const/4 v2, 0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenText:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->canRevoke()Z

    move-result v0

    if-eqz v0, :cond_0

    return v2

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDrawNodeList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mSavingNodeList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :cond_2
    :goto_0
    return v2
.end method

.method public checkTextEditor(Z)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mCurrentScreenEditor:Lcom/miui/gallery/editor/photo/screen/base/IScreenOperationEditor;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenText:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenText:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;

    xor-int/lit8 p1, p1, 0x1

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->onChangeOperation(Z)V

    :cond_0
    return-void
.end method

.method public doRevert()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mCurrentScreenEditor:Lcom/miui/gallery/editor/photo/screen/base/IScreenOperationEditor;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/screen/base/IScreenOperationEditor;->clearActivation()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mRevokedNodeList:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mCurrentScreenEditor:Lcom/miui/gallery/editor/photo/screen/base/IScreenOperationEditor;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenText:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;

    if-ne v1, v2, :cond_0

    instance-of v1, v0, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextDrawNode;

    if-eqz v1, :cond_0

    move-object v1, v0

    check-cast v1, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextDrawNode;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextDrawNode;->isSaved()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenText:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->doRevert()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->notifyOperationUpdate()V

    return-void

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDrawNodeList:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->invalidate()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->notifyOperationUpdate()V

    return-void
.end method

.method public doRevoke()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mCurrentScreenEditor:Lcom/miui/gallery/editor/photo/screen/base/IScreenOperationEditor;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/screen/base/IScreenOperationEditor;->clearActivation()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mCurrentScreenEditor:Lcom/miui/gallery/editor/photo/screen/base/IScreenOperationEditor;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenText:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenText:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->canRevoke()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenText:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->doRevoke()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->notifyOperationUpdate()V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDrawNodeList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mSavingNodeList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/16 v1, 0xa

    if-lt v0, v1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDrawNodeList:Ljava/util/List;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mSavingNodeList:Ljava/util/List;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mSavingNodeList:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    sub-int/2addr v3, v1

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mSavingNodeList:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    invoke-interface {v2, v3, v4}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mSavingNodeList:Ljava/util/List;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mSavingNodeList:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    sub-int/2addr v3, v1

    invoke-interface {v0, v2, v3}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mSavingNodeList:Ljava/util/List;

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDrawNodeList:Ljava/util/List;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mSavingNodeList:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mSavingNodeList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->refreshDisplayCanvas()V

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDrawNodeList:Ljava/util/List;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDrawNodeList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDrawNodeList:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mRevokedNodeList:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->invalidate()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->notifyOperationUpdate()V

    return-void
.end method

.method public getCurrentScreenEditor()Lcom/miui/gallery/editor/photo/screen/base/IScreenOperationEditor;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mCurrentScreenEditor:Lcom/miui/gallery/editor/photo/screen/base/IScreenOperationEditor;

    return-object v0
.end method

.method public init()V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mIsLongCrop:Z

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenCrop:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    :cond_0
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->setCurrentScreenEditor(I)Z

    return-void
.end method

.method public isModified()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDrawNodeList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mSavingNodeList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenCrop:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenCrop:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->isModified()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public isModifiedBaseLast()Z
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mLastNodeList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDrawNodeList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mSavingNodeList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    add-int/2addr v1, v2

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mLastNodeList:Ljava/util/List;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDrawNodeList:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->containsAll(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mLastNodeList:Ljava/util/List;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mSavingNodeList:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->containsAll(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mLastNodeList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mLastNodeList:Ljava/util/List;

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDrawNodeList:Ljava/util/List;

    invoke-interface {v1, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mLastNodeList:Ljava/util/List;

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mSavingNodeList:Ljava/util/List;

    invoke-interface {v1, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    if-eqz v0, :cond_2

    return v3

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenCrop:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenCrop:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->isModifiedBaseLast()Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x1

    goto :goto_2

    :cond_3
    const/4 v0, 0x0

    :goto_2
    if-eqz v0, :cond_4

    return v3

    :cond_4
    return v2
.end method

.method public notifyOperationUpdate()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mOperationUpdateListener:Lcom/miui/gallery/editor/photo/screen/home/OperationUpdateListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mOperationUpdateListener:Lcom/miui/gallery/editor/photo/screen/home/OperationUpdateListener;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->isModified()Z

    move-result v1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->canRevoke()Z

    move-result v2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->canRevert()Z

    move-result v3

    invoke-interface {v0, v1, v2, v3}, Lcom/miui/gallery/editor/photo/screen/home/OperationUpdateListener;->onOperationUpdate(ZZZ)V

    :cond_0
    return-void
.end method

.method public onBitmapMatrixChanged()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenCrop:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenCrop:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->onStart()V

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->invalidate()V

    return-void
.end method

.method public onCanvasMatrixChange()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mCurrentScreenEditor:Lcom/miui/gallery/editor/photo/screen/base/IScreenOperationEditor;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/screen/base/IScreenOperationEditor;->canvasMatrixChange()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenCrop:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenCrop:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->canvasMatrixChange()V

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->invalidate()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->notifyOperationUpdate()V

    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView;->onDetachedFromWindow()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenCrop:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenCrop:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->onDetachedFromWindow()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenText:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenText:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->onDetachedFromWindow()V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenDoodle:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenDoodle:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->onDetachedFromWindow()V

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenMosaic:Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenMosaic:Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->onDetachedFromWindow()V

    :cond_3
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mThumbnailAnimatorCallback:Lcom/miui/gallery/editor/photo/screen/home/ThumbnailAnimatorCallback;

    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDisplayBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDisplayBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mAnimatorHelper:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mAnimatorHelper:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper;->isAnimatorEnd()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mAnimatorHelper:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper;->draw(Landroid/graphics/Canvas;)V

    return-void

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->drawToDisplayCanvas()V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mCanvasMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDisplayBitmap:Landroid/graphics/Bitmap;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v1, v1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapToDisplayMatrix:Landroid/graphics/Matrix;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->getBitmapGestureParamsHolder()Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    move-result-object v0

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/RectF;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDrawNodeList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->getLongCropFullDisplayRect()Landroid/graphics/RectF;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;->draw(Landroid/graphics/Canvas;Landroid/graphics/RectF;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mCurrentScreenEditor:Lcom/miui/gallery/editor/photo/screen/base/IScreenOperationEditor;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenText:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;

    if-ne v0, v1, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenText:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->getLongCropFullDisplayRect()Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;->drawCurrentNode(Landroid/graphics/Canvas;Landroid/graphics/RectF;)V

    :cond_2
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mCurrentScreenEditor:Lcom/miui/gallery/editor/photo/screen/base/IScreenOperationEditor;

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/screen/base/IScreenOperationEditor;->drawOverlay(Landroid/graphics/Canvas;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenCrop:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenCrop:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->drawOverlay(Landroid/graphics/Canvas;)V

    :cond_3
    return-void
.end method

.method public onExport()Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderData;
    .locals 5

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mSavingNodeList:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDrawNodeList:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    new-instance v1, Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderData;

    new-instance v2, Lcom/miui/gallery/editor/photo/screen/core/ScreenDrawEntry;

    iget-boolean v3, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mIsLongCrop:Z

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v4, v4, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-direct {v2, v3, v4, v0}, Lcom/miui/gallery/editor/photo/screen/core/ScreenDrawEntry;-><init>(ZLandroid/graphics/RectF;Ljava/util/List;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenCrop:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenCrop:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->export()Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropEntry;

    move-result-object v0

    :goto_0
    invoke-direct {v1, v2, v0}, Lcom/miui/gallery/editor/photo/screen/core/ScreenRenderData;-><init>(Lcom/miui/gallery/editor/photo/screen/core/ScreenDrawEntry;Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropEntry;)V

    return-object v1
.end method

.method protected refreshDisplayCanvas()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDisplayCanvas:Landroid/graphics/Canvas;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mOriginBitmap:Landroid/graphics/Bitmap;

    iget v2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mTopPixel:I

    neg-int v2, v2

    int-to-float v2, v2

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mBitmapPaint:Landroid/graphics/Paint;

    const/4 v4, 0x0

    invoke-virtual {v0, v1, v4, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDisplayCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v0}, Landroid/graphics/Canvas;->save()I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDisplayCanvas:Landroid/graphics/Canvas;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v1, v1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayToBitmapMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mSavingNodeList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDisplayCanvas:Landroid/graphics/Canvas;

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->getLongCropFullDisplayRect()Landroid/graphics/RectF;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;->draw(Landroid/graphics/Canvas;Landroid/graphics/RectF;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDisplayCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v0}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method public removeDrawNode(Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDrawNodeList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->notifyOperationUpdate()V

    return-void
.end method

.method public removeRevokedDrawNode(Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mRevokedNodeList:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public setCurrentScreenEditor(I)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mCurrentScreenEditor:Lcom/miui/gallery/editor/photo/screen/base/IScreenOperationEditor;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mLastScreenEditor:Lcom/miui/gallery/editor/photo/screen/base/IScreenOperationEditor;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mLastScreenEditor:Lcom/miui/gallery/editor/photo/screen/base/IScreenOperationEditor;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mLastScreenEditor:Lcom/miui/gallery/editor/photo/screen/base/IScreenOperationEditor;

    invoke-interface {v0, v1}, Lcom/miui/gallery/editor/photo/screen/base/IScreenOperationEditor;->onChangeOperation(Z)V

    :cond_0
    const/4 v0, 0x2

    if-ne p1, v0, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenDoodle:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    if-nez p1, :cond_1

    new-instance p1, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-direct {p1, p0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenDoodle:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenDoodle:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    invoke-static {}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleManager;->getDefaultScreenDoodleData()Lcom/miui/gallery/editor/photo/core/common/model/DoodleData;

    move-result-object v0

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;->setDoodleData(Lcom/miui/gallery/editor/photo/core/common/model/DoodleData;I)V

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenDoodle:Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodleView;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mCurrentScreenEditor:Lcom/miui/gallery/editor/photo/screen/base/IScreenOperationEditor;

    goto :goto_0

    :cond_2
    const/4 v0, 0x3

    if-ne p1, v0, :cond_4

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenText:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;

    if-nez p1, :cond_3

    new-instance p1, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;

    invoke-direct {p1, p0}, Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenText:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenText:Lcom/miui/gallery/editor/photo/screen/text/ScreenTextView;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mCurrentScreenEditor:Lcom/miui/gallery/editor/photo/screen/base/IScreenOperationEditor;

    goto :goto_0

    :cond_4
    const/4 v0, 0x4

    if-ne p1, v0, :cond_7

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenMosaic:Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;

    if-nez p1, :cond_6

    sget-object p1, Lcom/miui/gallery/editor/photo/screen/core/ScreenProviderManager;->INSTANCE:Lcom/miui/gallery/editor/photo/screen/core/ScreenProviderManager;

    const-class v0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/screen/core/ScreenProviderManager;->getProvider(Ljava/lang/Class;)Lcom/miui/gallery/editor/photo/screen/core/ScreenProvider;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;->isInitialized()Z

    move-result v0

    if-nez v0, :cond_5

    const-string p1, "ScreenEditorView"

    const-string v0, "ScreenMosaicProvider has not initialized"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_5
    new-instance v0, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenMosaic:Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenMosaic:Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicProvider;->getDefaultData()Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicData;

    move-result-object p1

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;->setMosaicData(Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicData;I)V

    :cond_6
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenMosaic:Lcom/miui/gallery/editor/photo/screen/mosaic/ScreenMosaicView;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mCurrentScreenEditor:Lcom/miui/gallery/editor/photo/screen/base/IScreenOperationEditor;

    :cond_7
    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mCurrentScreenEditor:Lcom/miui/gallery/editor/photo/screen/base/IScreenOperationEditor;

    const/4 v0, 0x1

    if-eqz p1, :cond_8

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mCurrentScreenEditor:Lcom/miui/gallery/editor/photo/screen/base/IScreenOperationEditor;

    invoke-interface {p1, v0}, Lcom/miui/gallery/editor/photo/screen/base/IScreenOperationEditor;->onChangeOperation(Z)V

    :cond_8
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->notifyOperationUpdate()V

    return v0
.end method

.method public setLongCrop(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mIsLongCrop:Z

    return-void
.end method

.method public setLongCropEntry(Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mLongCropEntry:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mLongCropEntry:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mOriginBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->setPreviewBitmap(Landroid/graphics/Bitmap;)V

    :cond_0
    return-void
.end method

.method public setOperationUpdateListener(Lcom/miui/gallery/editor/photo/screen/home/OperationUpdateListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mOperationUpdateListener:Lcom/miui/gallery/editor/photo/screen/home/OperationUpdateListener;

    return-void
.end method

.method public setPreviewBitmap(Landroid/graphics/Bitmap;)V
    .locals 3

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mOriginBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    int-to-float v0, v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mLongCropEntry:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;

    iget v1, v1, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;->mTopRatio:F

    mul-float v0, v0, v1

    const/high16 v1, 0x3f000000    # 0.5f

    add-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mTopPixel:I

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    int-to-float v0, v0

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mLongCropEntry:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;

    iget v2, v2, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;->mBottomRatio:F

    mul-float v0, v0, v2

    add-float/2addr v0, v1

    float-to-int v0, v0

    iget v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mTopPixel:I

    sub-int/2addr v0, v1

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p1

    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, v0, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDisplayBitmap:Landroid/graphics/Bitmap;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDisplayBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->setBitmap(Landroid/graphics/Bitmap;)V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->setLongCropFullBitmapRect()V

    new-instance p1, Landroid/graphics/Canvas;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDisplayBitmap:Landroid/graphics/Bitmap;

    invoke-direct {p1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mDisplayCanvas:Landroid/graphics/Canvas;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->refreshDisplayCanvas()V

    return-void
.end method

.method public startScreenThumbnailAnimate(Lcom/miui/gallery/editor/photo/screen/home/ThumbnailAnimatorCallback;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mAnimatorHelper:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mAnimatorHelper:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper;

    :cond_0
    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mThumbnailAnimatorCallback:Lcom/miui/gallery/editor/photo/screen/home/ThumbnailAnimatorCallback;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mAnimatorHelper:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->mScreenEditViewAnimatorCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper$Callback;

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/screen/home/ThumbnailAnimatorCallback;->getThumbnailRect()[I

    move-result-object p1

    invoke-virtual {v0, v1, v2, p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper;->startEnterAnimation(Landroid/content/Context;Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper$Callback;[I)V

    return-void
.end method
