.class public Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;
.super Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;
.source "CropFragment.java"


# instance fields
.field private mAspectRatio:Lcom/miui/gallery/editor/photo/core/common/model/CropData$AspectRatio;

.field private mAutoCropDegree:F

.field private mCanvasRotateTimes:I

.field private mCrop:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

.field private mCropTips:Landroid/view/View;

.field private mCropTipsHandler:Landroid/os/Handler;

.field private mEditorView:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;

.field private mMirrored:Z

.field private mOnCropChangedListener:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$OnCropChangedListener;

.field private mOnLayoutChangeListener:Landroid/view/View$OnLayoutChangeListener;

.field private mTuningDegree:F


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;-><init>()V

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment$3;-><init>(Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mOnCropChangedListener:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$OnCropChangedListener;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment$4;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment$4;-><init>(Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mOnLayoutChangeListener:Landroid/view/View$OnLayoutChangeListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->showAnimator(Z)V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;)Landroid/view/View;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mCropTips:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mCrop:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    return-object p0
.end method

.method private showAnimator(Z)V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mCropTips:Landroid/view/View;

    sget-object v1, Landroid/view/View;->ALPHA:Landroid/util/Property;

    const/4 v2, 0x2

    new-array v2, v2, [F

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    if-eqz p1, :cond_0

    const/4 v5, 0x0

    goto :goto_0

    :cond_0
    const/high16 v5, 0x3f800000    # 1.0f

    :goto_0
    const/4 v6, 0x0

    aput v5, v2, v6

    const/4 v5, 0x1

    if-eqz p1, :cond_1

    goto :goto_1

    :cond_1
    const/4 v3, 0x0

    :goto_1
    aput v3, v2, v5

    invoke-static {v0, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    const-wide/16 v1, 0x12c

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    new-instance v1, Lmiui/view/animation/CubicEaseInOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseInOutInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment$2;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment$2;-><init>(Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;Z)V

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mCrop:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->reset()V

    return-void
.end method

.method public doTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mEditorView:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;

    invoke-virtual {v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->getHeight()I

    move-result v2

    int-to-float v2, v2

    add-float/2addr v1, v2

    invoke-virtual {p1, v0, v1}, Landroid/view/MotionEvent;->setLocation(FF)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mEditorView:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public finishTuning()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mCrop:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->finishRotate()V

    return-void
.end method

.method public isEmpty()Z
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mCrop:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getSampleSize()Landroid/graphics/RectF;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mCrop:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getCroppedSize()Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v2

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v3

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-ne v2, v3, :cond_1

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    iget-boolean v1, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mMirrored:Z

    if-nez v1, :cond_2

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mTuningDegree:F

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-nez v1, :cond_2

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mCanvasRotateTimes:I

    rem-int/lit8 v1, v1, 0x4

    if-nez v1, :cond_2

    if-nez v0, :cond_2

    const/4 v4, 0x1

    :cond_2
    return v4
.end method

.method public isSupportAnimation()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method protected onAutoCrop(F)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mCrop:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->setRotateDegreeWithAnimation(F)V

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mTuningDegree:F

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mAutoCropDegree:F

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$PhotoEditor;->isCropTipsShow()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$PhotoEditor;->addCropTipsShowTimes()V

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->showAnimator(Z)V

    new-instance p1, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment$1;-><init>(Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mCropTipsHandler:Landroid/os/Handler;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mCropTipsHandler:Landroid/os/Handler;

    const/4 v0, 0x0

    const-wide/16 v1, 0xbb8

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    :cond_0
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const/4 p3, 0x0

    const v0, 0x7f0b0068

    invoke-virtual {p1, v0, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    const p2, 0x7f0900f9

    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mEditorView:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;

    const p2, 0x7f0900be

    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mCropTips:Landroid/view/View;

    new-instance p2, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p2, v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mCrop:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mEditorView:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mCrop:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {p2, v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->install(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mEditorView:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->setDrawBoundLine(Z)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mEditorView:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object p3

    invoke-virtual {p2, p3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->setBitmap(Landroid/graphics/Bitmap;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mEditorView:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mOnLayoutChangeListener:Landroid/view/View$OnLayoutChangeListener;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mCrop:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mOnCropChangedListener:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$OnCropChangedListener;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->setOnCropChangedListener(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$OnCropChangedListener;)V

    return-object p1
.end method

.method public onDestroyView()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;->onDestroyView()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mEditorView:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mOnLayoutChangeListener:Landroid/view/View$OnLayoutChangeListener;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mCropTipsHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mCropTipsHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    :cond_0
    return-void
.end method

.method protected onDoMirror()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mCrop:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mirror()V

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mMirrored:Z

    xor-int/lit8 v0, v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mMirrored:Z

    return-void
.end method

.method protected onDoRotate()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mCrop:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->rotate()V

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mCanvasRotateTimes:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mCanvasRotateTimes:I

    return-void
.end method

.method public onExport()Lcom/miui/gallery/editor/photo/core/RenderData;
    .locals 2

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropStateData;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mCrop:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->export()Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ParcelableCropEntry;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/crop/CropStateData;-><init>(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ParcelableCropEntry;)V

    return-object v0
.end method

.method protected onSample()Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-boolean v1, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mMirrored:Z

    if-eqz v1, :cond_0

    const-string v1, "mirror"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mTuningDegree:F

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_2

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mAutoCropDegree:F

    iget v4, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mTuningDegree:F

    cmpl-float v1, v1, v4

    if-nez v1, :cond_1

    const-string v1, "rotate_auto"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    const-string v1, "rotate_manual"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_0
    const/4 v1, 0x1

    goto :goto_1

    :cond_2
    const/4 v1, 0x0

    :goto_1
    iget v4, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mCanvasRotateTimes:I

    rem-int/lit8 v4, v4, 0x4

    if-eqz v4, :cond_3

    const-string v1, "rotate_canvas"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const/4 v1, 0x1

    :cond_3
    if-eqz v1, :cond_4

    const-string v1, "rotate"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_4
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mCrop:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getSampleSize()Landroid/graphics/RectF;

    move-result-object v1

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mCrop:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v4}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getCroppedSize()Landroid/graphics/RectF;

    move-result-object v4

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v5

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v6

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v6

    if-ne v5, v6, :cond_5

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v4

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    if-eq v1, v4, :cond_6

    :cond_5
    const-string v1, "crop"

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_6
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "aspect_ratio: %s"

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mAspectRatio:Lcom/miui/gallery/editor/photo/core/common/model/CropData$AspectRatio;

    if-nez v5, :cond_7

    const-string v5, "free"

    goto :goto_2

    :cond_7
    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mAspectRatio:Lcom/miui/gallery/editor/photo/core/common/model/CropData$AspectRatio;

    iget-object v5, v5, Lcom/miui/gallery/editor/photo/core/common/model/CropData$AspectRatio;->name:Ljava/lang/String;

    :goto_2
    aput-object v5, v3, v2

    invoke-static {v1, v4, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method protected onSetAspectRatio(Lcom/miui/gallery/editor/photo/core/common/model/CropData$AspectRatio;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mCrop:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    iget v1, p1, Lcom/miui/gallery/editor/photo/core/common/model/CropData$AspectRatio;->width:I

    iget v2, p1, Lcom/miui/gallery/editor/photo/core/common/model/CropData$AspectRatio;->height:I

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->setFixedAspectRatio(II)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mAspectRatio:Lcom/miui/gallery/editor/photo/core/common/model/CropData$AspectRatio;

    return-void
.end method

.method protected onTurning(F)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mCrop:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->setRotateDegree(F)V

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mTuningDegree:F

    return-void
.end method

.method public prepareTuning()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mCrop:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->beginRotate()V

    return-void
.end method

.method public restore()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;->restore()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mEditorView:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->setBitmap(Landroid/graphics/Bitmap;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mCrop:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->reset()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mCropTipsHandler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mCropTipsHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mCropTipsHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    :cond_0
    return-void
.end method

.method public setBitmap(Landroid/graphics/Bitmap;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;->setBitmap(Landroid/graphics/Bitmap;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mEditorView:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->mEditorView:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView;->setBitmap(Landroid/graphics/Bitmap;)V

    :cond_0
    return-void
.end method
