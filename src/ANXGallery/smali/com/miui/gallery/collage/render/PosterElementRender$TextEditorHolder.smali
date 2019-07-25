.class public Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;
.super Ljava/lang/Object;
.source "PosterElementRender.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/collage/render/PosterElementRender;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TextEditorHolder"
.end annotation


# instance fields
.field private mAlpha:I

.field private mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

.field private mCurrentTextProgress:F

.field private mDensity:F

.field private mHasModify:Z

.field private mHighLightBackground:I

.field private mHighLightColor:I

.field private mHighLightLineColor:I

.field private mHighLightPath:Landroid/graphics/Path;

.field private mHighLightRectF:Landroid/graphics/RectF;

.field private mOriginText:Ljava/lang/String;

.field private mPaint:Landroid/graphics/Paint;

.field private mParentHeight:I

.field private mParentWidth:I

.field private mPathPaint:Landroid/graphics/Paint;

.field private mRTL:Z

.field private mScaleOffset:F

.field private mTextElementModel:Lcom/miui/gallery/collage/core/poster/TextElementModel;

.field private mTextRectF:Landroid/graphics/RectF;

.field private mTextRectForTouch:Landroid/graphics/RectF;

.field private mTextTouchOffset:I


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/miui/gallery/collage/core/poster/TextElementModel;IIF)V
    .locals 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mTextRectF:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mHighLightRectF:Landroid/graphics/RectF;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mPaint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mPathPaint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mHighLightPath:Landroid/graphics/Path;

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mHighLightBackground:I

    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2}, Landroid/graphics/RectF;-><init>()V

    iput-object v2, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mTextRectForTouch:Landroid/graphics/RectF;

    const/4 v2, 0x0

    iput v2, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mCurrentTextProgress:F

    iput v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mAlpha:I

    iput-boolean v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mHasModify:Z

    iput-boolean v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mRTL:Z

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Configuration;->getLayoutDirection()I

    move-result v4

    if-ne v4, v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    iput-boolean v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mRTL:Z

    const v0, 0x7f050069

    invoke-virtual {v3, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mHighLightLineColor:I

    const v0, 0x7f0600d3

    invoke-virtual {v3, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mTextTouchOffset:I

    const v0, 0x7f050068

    invoke-virtual {v3, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mHighLightColor:I

    iget-object v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mPathPaint:Landroid/graphics/Paint;

    new-instance v4, Landroid/graphics/DashPathEffect;

    const/4 v5, 0x2

    new-array v5, v5, [F

    fill-array-data v5, :array_0

    invoke-direct {v4, v5, v2}, Landroid/graphics/DashPathEffect;-><init>([FF)V

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    iget-object v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mPathPaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mHighLightLineColor:I

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mPathPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mPathPaint:Landroid/graphics/Paint;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iput p3, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mParentWidth:I

    iput p4, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mParentHeight:I

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p3

    iget p3, p3, Landroid/util/DisplayMetrics;->density:F

    iput p3, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mDensity:F

    iput p5, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mScaleOffset:F

    iput-object p2, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mTextElementModel:Lcom/miui/gallery/collage/core/poster/TextElementModel;

    invoke-direct {p0, v3}, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->configPaint(Landroid/content/res/Resources;)V

    iget-object p3, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mTextElementModel:Lcom/miui/gallery/collage/core/poster/TextElementModel;

    invoke-virtual {p3, p1}, Lcom/miui/gallery/collage/core/poster/TextElementModel;->getText(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mOriginText:Ljava/lang/String;

    iget-object p1, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mTextElementModel:Lcom/miui/gallery/collage/core/poster/TextElementModel;

    iget-object p1, p1, Lcom/miui/gallery/collage/core/poster/TextElementModel;->currentText:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mTextElementModel:Lcom/miui/gallery/collage/core/poster/TextElementModel;

    iget-object p3, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mOriginText:Ljava/lang/String;

    iput-object p3, p1, Lcom/miui/gallery/collage/core/poster/TextElementModel;->currentText:Ljava/lang/String;

    goto :goto_0

    :cond_1
    iput-boolean v1, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mHasModify:Z

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    sget-object p3, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;->CENTER:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    invoke-virtual {p1, p3}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->setTextAlignment(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;)V

    iget-object p1, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    iget-object p2, p2, Lcom/miui/gallery/collage/core/poster/TextElementModel;->currentText:Ljava/lang/String;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->setText(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->countTextAndStroke()V

    return-void

    :array_0
    .array-data 4
        0x41400000    # 12.0f
        0x40c00000    # 6.0f
    .end array-data
.end method

.method private configPaint(Landroid/content/res/Resources;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mTextElementModel:Lcom/miui/gallery/collage/core/poster/TextElementModel;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    iget-object v1, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mTextElementModel:Lcom/miui/gallery/collage/core/poster/TextElementModel;

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/collage/render/PosterElementRender;->access$1200(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;Lcom/miui/gallery/collage/core/poster/TextElementModel;Landroid/content/res/Resources;)V

    return-void
.end method


# virtual methods
.method public contains(FF)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mTextRectForTouch:Landroid/graphics/RectF;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/RectF;->contains(FF)Z

    move-result p1

    return p1
.end method

.method countTextAndStroke()V
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mTextElementModel:Lcom/miui/gallery/collage/core/poster/TextElementModel;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    iget-object v2, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mTextElementModel:Lcom/miui/gallery/collage/core/poster/TextElementModel;

    iget-object v3, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mTextRectF:Landroid/graphics/RectF;

    iget v4, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mParentWidth:I

    iget v5, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mParentHeight:I

    iget v6, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mScaleOffset:F

    iget-boolean v7, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mRTL:Z

    invoke-static/range {v1 .. v7}, Lcom/miui/gallery/collage/render/PosterElementRender;->access$1300(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;Lcom/miui/gallery/collage/core/poster/TextElementModel;Landroid/graphics/RectF;IIFZ)V

    iget-object v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mHighLightRectF:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mTextRectF:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mHighLightRectF:Landroid/graphics/RectF;

    const/high16 v1, -0x3f400000    # -6.0f

    iget v2, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mDensity:F

    mul-float v2, v2, v1

    const/high16 v1, -0x40000000    # -2.0f

    iget v3, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mDensity:F

    mul-float v3, v3, v1

    invoke-virtual {v0, v2, v3}, Landroid/graphics/RectF;->inset(FF)V

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mHighLightRectF:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    iget-object v1, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mHighLightPath:Landroid/graphics/Path;

    invoke-virtual {v1}, Landroid/graphics/Path;->reset()V

    iget-object v1, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mHighLightPath:Landroid/graphics/Path;

    sget-object v2, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v1, v0, v2}, Landroid/graphics/Path;->addRect(Landroid/graphics/RectF;Landroid/graphics/Path$Direction;)V

    iget-object v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mTextRectForTouch:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mTextRectF:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mTextRectForTouch:Landroid/graphics/RectF;

    iget v1, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mTextTouchOffset:I

    neg-int v1, v1

    int-to-float v1, v1

    iget v2, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mTextTouchOffset:I

    neg-int v2, v2

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/RectF;->inset(FF)V

    return-void
.end method

.method draw(Landroid/graphics/Canvas;)V
    .locals 3

    iget v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mCurrentTextProgress:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mHighLightBackground:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mPathPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mAlpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mHighLightRectF:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    iget-object v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mHighLightPath:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mPathPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    iget-object v1, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mTextRectF:Landroid/graphics/RectF;

    iget v2, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mScaleOffset:F

    invoke-static {p1, v0, v1, v2}, Lcom/miui/gallery/collage/render/PosterElementRender;->access$1100(Landroid/graphics/Canvas;Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;Landroid/graphics/RectF;F)V

    return-void
.end method

.method public getCurrentText()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->getText()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMaxSize()I
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mTextElementModel:Lcom/miui/gallery/collage/core/poster/TextElementModel;

    iget v0, v0, Lcom/miui/gallery/collage/core/poster/TextElementModel;->maxLength:I

    iget-object v1, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mOriginText:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method public hasModify()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mHasModify:Z

    return v0
.end method

.method public setCurrentTextProgress(F)V
    .locals 2

    iput p1, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mCurrentTextProgress:F

    iget p1, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mHighLightColor:I

    iget v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mCurrentTextProgress:F

    const/4 v1, 0x0

    invoke-static {v1, p1, v0}, Lcom/miui/gallery/collage/render/PosterElementRender;->access$1400(IIF)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mHighLightBackground:I

    iget p1, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mCurrentTextProgress:F

    const/high16 v0, 0x437f0000    # 255.0f

    mul-float p1, p1, v0

    float-to-int p1, p1

    iput p1, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mAlpha:I

    return-void
.end method

.method public setTextAndCount(Ljava/lang/String;Landroid/graphics/Rect;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mTextElementModel:Lcom/miui/gallery/collage/core/poster/TextElementModel;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mHasModify:Z

    iget-object v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mTextElementModel:Lcom/miui/gallery/collage/core/poster/TextElementModel;

    iput-object p1, v0, Lcom/miui/gallery/collage/core/poster/TextElementModel;->currentText:Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->setText(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->countTextAndStroke()V

    iget-object p1, p0, Lcom/miui/gallery/collage/render/PosterElementRender$TextEditorHolder;->mTextRectF:Landroid/graphics/RectF;

    invoke-virtual {p1, p2}, Landroid/graphics/RectF;->roundOut(Landroid/graphics/Rect;)V

    return-void
.end method
