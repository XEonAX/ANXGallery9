.class public Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;
.super Ljava/lang/Object;
.source "WatermarkTextPiece.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/core/imports/text/base/ITextSetting;


# instance fields
.field private mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

.field private mColor:I

.field private final mCountSizeSpacing:F

.field private final mDefaultTextSize:F

.field private mDrawOutline:Z

.field private mIsBoldText:Z

.field private mIsRTL:Z

.field private mIsShadow:Z

.field private final mMaxTextSize:F

.field private final mMinTextSize:F

.field private mOutlineDisplayRect:Landroid/graphics/RectF;

.field private mOutlineRect:Landroid/graphics/RectF;

.field private mPaint:Landroid/graphics/Paint;

.field private mText:Ljava/lang/String;

.field private mTextInDialogRect:Landroid/graphics/RectF;

.field private final mTextPaddingInsert:F

.field private mTextPieceInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;

.field private mTextRect:Landroid/graphics/RectF;

.field private mTextStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

.field private mTextTransparent:F


# direct methods
.method public constructor <init>(Landroid/content/res/Resources;Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;FFF)V
    .locals 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mIsRTL:Z

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mDrawOutline:Z

    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2}, Landroid/graphics/RectF;-><init>()V

    iput-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mTextRect:Landroid/graphics/RectF;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mTextPieceInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;

    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Configuration;->getLayoutDirection()I

    move-result v2

    if-ne v2, v1, :cond_0

    iput-boolean v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mIsRTL:Z

    :cond_0
    iget v2, p2, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;->size:F

    const/4 v3, 0x0

    cmpl-float v2, v2, v3

    if-nez v2, :cond_1

    const v2, 0x7f0604ab

    invoke-virtual {p1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v2

    mul-float v2, v2, p5

    iput v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mDefaultTextSize:F

    goto :goto_0

    :cond_1
    iget v2, p2, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;->size:F

    invoke-static {v2}, Lcom/miui/gallery/util/ScreenUtils;->dpToPixel(F)F

    move-result v2

    mul-float v2, v2, p5

    iput v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mDefaultTextSize:F

    :goto_0
    iget v2, p2, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;->minSize:F

    cmpl-float v2, v2, v3

    if-lez v2, :cond_2

    iget p2, p2, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;->minSize:F

    invoke-static {p2}, Lcom/miui/gallery/util/ScreenUtils;->dpToPixel(F)F

    move-result p2

    mul-float p2, p2, p5

    iput p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mMinTextSize:F

    goto :goto_1

    :cond_2
    const p2, 0x7f0604df

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    int-to-float p2, p2

    iput p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mMinTextSize:F

    :goto_1
    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mDefaultTextSize:F

    iput p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mMaxTextSize:F

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p2

    iget p2, p2, Landroid/util/DisplayMetrics;->density:F

    iput p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mCountSizeSpacing:F

    const p2, 0x7f0604e0

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p2

    iput p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mTextPaddingInsert:F

    const/4 p2, -0x1

    iput p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mColor:I

    const/4 p5, 0x0

    iput-object p5, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mTextStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    iput v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mTextTransparent:F

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mIsBoldText:Z

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mIsShadow:Z

    new-instance p5, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    invoke-direct {p5}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;-><init>()V

    iput-object p5, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    iget-object p5, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    invoke-virtual {p5}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->getPaint()Landroid/graphics/Paint;

    move-result-object p5

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mDefaultTextSize:F

    invoke-virtual {p5, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-object p5, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    const v2, 0x7f0604b8

    invoke-virtual {p1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v2

    invoke-virtual {p5, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->setLineHeightOffset(F)V

    iget-object p5, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    iget-boolean v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mIsRTL:Z

    if-eqz v2, :cond_3

    sget-object v2, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;->RIGHT:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    goto :goto_2

    :cond_3
    sget-object v2, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;->LEFT:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    :goto_2
    invoke-virtual {p5, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->setTextAlignment(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;)V

    iget-object p5, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mTextPieceInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;

    iget v2, v2, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;->isVerticalText:I

    if-ne v2, v1, :cond_4

    const/4 v2, 0x1

    goto :goto_3

    :cond_4
    const/4 v2, 0x0

    :goto_3
    invoke-virtual {p5, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->setSingleVerticalText(Z)V

    iget-object p5, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mTextPieceInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;

    iget-object v2, v2, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;->text:Ljava/lang/String;

    invoke-virtual {p5, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->setText(Ljava/lang/String;)V

    iget-object p5, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mTextPieceInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;

    iget v2, v2, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;->letterSpacing:F

    invoke-virtual {p5, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->setLetterSpace(F)V

    iget-object p5, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mTextPieceInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;

    iget v2, v2, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;->lines:I

    invoke-virtual {p5, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->setMaxLines(I)V

    new-instance p5, Landroid/graphics/Paint;

    invoke-direct {p5, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p5, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mPaint:Landroid/graphics/Paint;

    iget-object p5, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p5, p2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mPaint:Landroid/graphics/Paint;

    sget-object p5, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p2, p5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mPaint:Landroid/graphics/Paint;

    const/high16 p5, 0x40400000    # 3.0f

    invoke-virtual {p2, p5}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mPaint:Landroid/graphics/Paint;

    new-instance v2, Landroid/graphics/DashPathEffect;

    const/4 v4, 0x2

    new-array v5, v4, [F

    fill-array-data v5, :array_0

    invoke-direct {v2, v5, v3}, Landroid/graphics/DashPathEffect;-><init>([FF)V

    invoke-virtual {p2, v2}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mPaint:Landroid/graphics/Paint;

    const/high16 v2, 0x3f800000    # 1.0f

    const v5, 0x7f050170

    invoke-virtual {p1, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    invoke-virtual {p2, v2, v3, v3, p1}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    new-instance p1, Landroid/graphics/RectF;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mTextPieceInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;

    iget-object p2, p2, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;->frameRect:[F

    aget p2, p2, v0

    invoke-static {p2}, Lcom/miui/gallery/util/ScreenUtils;->dpToPixel(F)F

    move-result p2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mTextPieceInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;->frameRect:[F

    aget v0, v0, v1

    invoke-static {v0}, Lcom/miui/gallery/util/ScreenUtils;->dpToPixel(F)F

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mTextPieceInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;

    iget-object v1, v1, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;->frameRect:[F

    aget v1, v1, v4

    invoke-static {v1}, Lcom/miui/gallery/util/ScreenUtils;->dpToPixel(F)F

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mTextPieceInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;

    iget-object v2, v2, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;->frameRect:[F

    const/4 v3, 0x3

    aget v2, v2, v3

    invoke-static {v2}, Lcom/miui/gallery/util/ScreenUtils;->dpToPixel(F)F

    move-result v2

    invoke-direct {p1, p2, v0, v1, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mOutlineRect:Landroid/graphics/RectF;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mOutlineRect:Landroid/graphics/RectF;

    neg-float p2, p3

    const/high16 p3, 0x40000000    # 2.0f

    div-float/2addr p2, p3

    neg-float p4, p4

    div-float/2addr p4, p3

    invoke-virtual {p1, p2, p4}, Landroid/graphics/RectF;->offset(FF)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mTextPieceInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;

    iget-object p1, p1, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;->text:Ljava/lang/String;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mText:Ljava/lang/String;

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mTextInDialogRect:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/RectF;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mOutlineRect:Landroid/graphics/RectF;

    invoke-direct {p1, p2}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mOutlineDisplayRect:Landroid/graphics/RectF;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mOutlineDisplayRect:Landroid/graphics/RectF;

    iget p2, p1, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr p2, p5

    iput p2, p1, Landroid/graphics/RectF;->bottom:F

    return-void

    nop

    :array_0
    .array-data 4
        0x41000000    # 8.0f
        0x40800000    # 4.0f
    .end array-data
.end method

.method private getAlphaByConfig()I
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mTextTransparent:F

    const/high16 v1, 0x43660000    # 230.0f

    mul-float v0, v0, v1

    const/high16 v1, 0x437f0000    # 255.0f

    sub-float/2addr v1, v0

    float-to-int v0, v1

    return v0
.end method


# virtual methods
.method public configTextPaint()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->getPaint()Landroid/graphics/Paint;

    move-result-object v0

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mTextStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    if-nez v1, :cond_0

    sget-object v1, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mTextStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;->getTypeFace()Landroid/graphics/Typeface;

    move-result-object v1

    :goto_0
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->getAlphaByConfig()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-boolean v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mIsBoldText:Z

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    iget-boolean v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mIsShadow:Z

    if-eqz v1, :cond_1

    const/high16 v1, 0x66000000

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v0, v2, v2, v2, v1}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    goto :goto_1

    :cond_1
    invoke-virtual {v0}, Landroid/graphics/Paint;->clearShadowLayer()V

    :goto_1
    return-void
.end method

.method public countTextInDialog()V
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mText:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->setText(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mTextInDialogRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mOutlineRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mTextInDialogRect:Landroid/graphics/RectF;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mTextPaddingInsert:F

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/graphics/RectF;->inset(FF)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mTextInDialogRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v3

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mTextInDialogRect:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v4

    const/high16 v5, 0x3fc00000    # 1.5f

    mul-float v4, v4, v5

    iget v5, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mMinTextSize:F

    iget v6, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mMaxTextSize:F

    iget v7, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mCountSizeSpacing:F

    invoke-virtual/range {v2 .. v7}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->countTextArea(FFFFF)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mTextRect:Landroid/graphics/RectF;

    invoke-virtual {v4, v5}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->getTextRect(Landroid/graphics/RectF;)V

    const-string v4, "WatermarkTextPiece"

    const-string v5, "count text time\uff1a %d"

    sub-long/2addr v2, v0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v4, v5, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 3

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mDrawOutline:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mOutlineDisplayRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mOutlineRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mOutlineRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerY()F

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mText:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mTextRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mTextRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v2

    div-float/2addr v2, v1

    invoke-virtual {p1, v0, v2}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mTextPieceInfo:Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;

    iget v0, v0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkInfo$TextPieceInfo;->align:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mTextInDialogRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    div-float/2addr v0, v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mTextRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    sub-float/2addr v0, v2

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mTextRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v2

    neg-float v2, v2

    div-float/2addr v2, v1

    invoke-virtual {p1, v0, v2}, Landroid/graphics/Canvas;->translate(FF)V

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mTextRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    neg-float v0, v0

    div-float/2addr v0, v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mTextRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v2

    neg-float v2, v2

    div-float/2addr v2, v1

    invoke-virtual {p1, v0, v2}, Landroid/graphics/Canvas;->translate(FF)V

    goto :goto_0

    :pswitch_2
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mTextInDialogRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    neg-float v0, v0

    div-float/2addr v0, v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mTextRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v2

    neg-float v2, v2

    div-float/2addr v2, v1

    invoke-virtual {p1, v0, v2}, Landroid/graphics/Canvas;->translate(FF)V

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->draw(Landroid/graphics/Canvas;)V

    :cond_1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getColor()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mColor:I

    return v0
.end method

.method public getOutlineRect()Landroid/graphics/RectF;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mOutlineRect:Landroid/graphics/RectF;

    return-object v0
.end method

.method public getText()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mText:Ljava/lang/String;

    return-object v0
.end method

.method public getTextAlignment()Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->getTextAlignment()Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    move-result-object v0

    return-object v0
.end method

.method public getTextStyle()Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mTextStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    return-object v0
.end method

.method public getTextTransparent()F
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mTextTransparent:F

    return v0
.end method

.method public isBoldText()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mIsBoldText:Z

    return v0
.end method

.method public isShadow()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mIsShadow:Z

    return v0
.end method

.method public setBoldText(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mIsBoldText:Z

    return-void
.end method

.method public setColor(I)V
    .locals 1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mColor:I

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->getPaint()Landroid/graphics/Paint;

    move-result-object p1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mColor:I

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    return-void
.end method

.method public setDrawOutline(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mDrawOutline:Z

    return-void
.end method

.method public setShadow(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mIsShadow:Z

    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mText:Ljava/lang/String;

    return-void
.end method

.method public setTextAlignment(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mAutoLineLayout:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->setTextAlignment(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;)V

    return-void
.end method

.method public setTextStyle(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mTextStyle:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    return-void
.end method

.method public setTextTransparent(F)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/watermark/WatermarkTextPiece;->mTextTransparent:F

    return-void
.end method
