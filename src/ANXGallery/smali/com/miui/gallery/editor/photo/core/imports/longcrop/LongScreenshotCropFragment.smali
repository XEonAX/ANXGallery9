.class public Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropFragment;
.super Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractLongCropFragment;
.source "LongScreenshotCropFragment.java"


# instance fields
.field private mEditorView:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;

.field private mOrigin:Landroid/graphics/Bitmap;

.field private mProgressBar:Landroid/widget/ProgressBar;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractLongCropFragment;-><init>()V

    return-void
.end method

.method private getClipRatioRectByPreData(Ljava/util/List;)Landroid/graphics/RectF;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/RenderData;",
            ">;)",
            "Landroid/graphics/RectF;"
        }
    .end annotation

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v2, v1, v1}, Landroid/graphics/RectF;->set(FFFF)V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/core/RenderData;

    instance-of v2, v1, Lcom/miui/gallery/editor/photo/core/imports/longcrop/CropRenderData;

    if-eqz v2, :cond_0

    check-cast v1, Lcom/miui/gallery/editor/photo/core/imports/longcrop/CropRenderData;

    iget-object v1, v1, Lcom/miui/gallery/editor/photo/core/imports/longcrop/CropRenderData;->mEntry:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v2

    iget v3, v0, Landroid/graphics/RectF;->top:F

    iget v4, v1, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;->mTopRatio:F

    mul-float v4, v4, v2

    add-float/2addr v4, v3

    iput v4, v0, Landroid/graphics/RectF;->top:F

    iget v1, v1, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;->mBottomRatio:F

    mul-float v2, v2, v1

    add-float/2addr v3, v2

    iput v3, v0, Landroid/graphics/RectF;->bottom:F

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method private validateBitmap()V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropFragment;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropFragment;->mOrigin:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropFragment;->mProgressBar:Landroid/widget/ProgressBar;

    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropFragment;->mEditorView:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->setVisibility(I)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropFragment;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropFragment;->mEditorView:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->setVisibility(I)V

    :goto_0
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 0

    return-void
.end method

.method public isEmpty()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropFragment;->mEditorView:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0b00aa

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onDestroyView()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractLongCropFragment;->onDestroyView()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropFragment;->mOrigin:Landroid/graphics/Bitmap;

    return-void
.end method

.method protected onExport()Lcom/miui/gallery/editor/photo/core/RenderData;
    .locals 2

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/CropRenderData;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropFragment;->mEditorView:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->export()Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/CropRenderData;-><init>(Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;)V

    return-object v0
.end method

.method protected onSample()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropFragment;->mEditorView:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->export()Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;

    move-result-object v0

    iget v1, v0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;->mBottomRatio:F

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    iget v0, v0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView$Entry;->mTopRatio:F

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    mul-int v1, v1, v0

    if-nez v1, :cond_0

    const-string v0, "long_crop"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractLongCropFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    const p2, 0x7f0900f9

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropFragment;->mEditorView:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;

    const p2, 0x7f090235

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ProgressBar;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropFragment;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropFragment;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropFragment;->mEditorView:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropFragment;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->setBitmap(Landroid/graphics/Bitmap;)V

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropFragment;->validateBitmap()V

    return-void
.end method

.method public setBitmap(Landroid/graphics/Bitmap;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractLongCropFragment;->setBitmap(Landroid/graphics/Bitmap;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropFragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropFragment;->mEditorView:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->setBitmap(Landroid/graphics/Bitmap;)V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropFragment;->validateBitmap()V

    :cond_0
    return-void
.end method

.method public setOriginBitmap(Landroid/graphics/Bitmap;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Bitmap;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/RenderData;",
            ">;)V"
        }
    .end annotation

    if-nez p1, :cond_0

    return-void

    :cond_0
    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropFragment;->mOrigin:Landroid/graphics/Bitmap;

    invoke-direct {p0, p2}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropFragment;->getClipRatioRectByPreData(Ljava/util/List;)Landroid/graphics/RectF;

    move-result-object p2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropFragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropFragment;->mEditorView:Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;

    iget v1, p2, Landroid/graphics/RectF;->top:F

    iget p2, p2, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {v0, p1, v1, p2}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropEditorView;->setOriginalBitmap(Landroid/graphics/Bitmap;FF)V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/longcrop/LongScreenshotCropFragment;->validateBitmap()V

    :cond_1
    return-void
.end method
