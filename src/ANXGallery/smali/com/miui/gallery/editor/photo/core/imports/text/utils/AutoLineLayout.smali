.class public Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;
.super Ljava/lang/Object;
.source "AutoLineLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;,
        Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;,
        Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;
    }
.end annotation


# instance fields
.field private mBound:Landroid/graphics/RectF;

.field private mFontMetricsInt:Landroid/graphics/Paint$FontMetricsInt;

.field private mIsSingleVerticalText:Z

.field private mLineHeight:F

.field private mLineHeightOffset:F

.field private mMaxLines:I

.field private mMultipleLineText:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;

.field private mOriginText:Ljava/lang/String;

.field private final mPaint:Landroid/text/TextPaint;

.field private mText:Ljava/lang/String;

.field private mTextAlignment:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;


# direct methods
.method public constructor <init>()V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/graphics/Paint$FontMetricsInt;

    invoke-direct {v0}, Landroid/graphics/Paint$FontMetricsInt;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mFontMetricsInt:Landroid/graphics/Paint$FontMetricsInt;

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mLineHeight:F

    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mBound:Landroid/graphics/RectF;

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$1;)V

    iput-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mMultipleLineText:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;->LEFT:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    iput-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mTextAlignment:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mLineHeightOffset:F

    new-instance v0, Landroid/text/TextPaint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/text/TextPaint;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mPaint:Landroid/text/TextPaint;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mPaint:Landroid/text/TextPaint;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setColor(I)V

    return-void
.end method

.method static synthetic access$400(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;)Landroid/text/TextPaint;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mPaint:Landroid/text/TextPaint;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;)Landroid/graphics/Paint$FontMetricsInt;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mFontMetricsInt:Landroid/graphics/Paint$FontMetricsInt;

    return-object p0
.end method

.method private cutSingleLineTextByWidth(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;FI)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;",
            "FI)",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    if-gtz p3, :cond_0

    return-object v0

    :cond_0
    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;->access$800(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object p1

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$1;)V

    const/4 v3, 0x0

    move-object v4, v1

    const/4 v1, 0x0

    :goto_0
    array-length v5, p1

    if-gt v3, v5, :cond_5

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mPaint:Landroid/text/TextPaint;

    sub-int v6, v3, v1

    invoke-virtual {v5, p1, v1, v6}, Landroid/text/TextPaint;->measureText([CII)F

    move-result v5

    cmpl-float v5, v5, p2

    if-lez v5, :cond_3

    add-int/lit8 v3, v3, -0x1

    if-ne v3, v1, :cond_1

    add-int/lit8 v3, v3, 0x1

    :cond_1
    invoke-static {v4}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;->access$800(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;)Ljava/lang/StringBuilder;

    move-result-object v5

    sub-int v6, v3, v1

    invoke-virtual {v5, p1, v1, v6}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;->count()V

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-lt v1, p3, :cond_2

    return-object v0

    :cond_2
    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;

    invoke-direct {v1, p0, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$1;)V

    move-object v4, v1

    move v1, v3

    goto :goto_1

    :cond_3
    array-length v5, p1

    if-ne v3, v5, :cond_4

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;->access$800(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1, v1, v6}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;->count()V

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v5

    if-lt v5, p3, :cond_4

    return-object v0

    :cond_4
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_5
    return-object v0
.end method

.method private cutText()V
    .locals 11

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mPaint:Landroid/text/TextPaint;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mFontMetricsInt:Landroid/graphics/Paint$FontMetricsInt;

    invoke-virtual {v2, v3}, Landroid/text/TextPaint;->getFontMetricsInt(Landroid/graphics/Paint$FontMetricsInt;)I

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->getLineHeight()F

    move-result v2

    iput v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mLineHeight:F

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mMultipleLineText:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->access$600(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;)V

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mText:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-void

    :cond_0
    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mMultipleLineText:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->access$100(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;)Ljava/util/List;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;

    const/4 v4, 0x0

    invoke-direct {v3, p0, v4}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$1;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const/4 v3, 0x0

    :goto_0
    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mText:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v3, v5, :cond_3

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mText:Ljava/lang/String;

    const/16 v6, 0xa

    iget-object v7, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mText:Ljava/lang/String;

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    invoke-static {v5, v6, v3, v7}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;CII)I

    move-result v5

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-interface {v2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;

    invoke-static {v6}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;->access$800(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mText:Ljava/lang/String;

    const/4 v9, -0x1

    if-ne v5, v9, :cond_1

    iget-object v10, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mText:Ljava/lang/String;

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v10

    goto :goto_1

    :cond_1
    move v10, v5

    :goto_1
    invoke-virtual {v8, v3, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;->count()V

    invoke-static {v6}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;->access$300(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;)F

    move-result v3

    iget-object v7, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mMultipleLineText:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;

    invoke-static {v7}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->access$200(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;)F

    move-result v7

    cmpl-float v3, v3, v7

    if-lez v3, :cond_2

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mMultipleLineText:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;

    invoke-static {v6}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;->access$300(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;)F

    move-result v7

    invoke-static {v3, v7}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->access$202(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;F)F

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mMultipleLineText:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;

    invoke-static {v6}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;->access$800(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v3, v6}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->access$1002(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;Ljava/lang/String;)Ljava/lang/String;

    :cond_2
    if-eq v5, v9, :cond_3

    new-instance v3, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;

    invoke-direct {v3, p0, v4}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$1;)V

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v5, 0x1

    goto :goto_0

    :cond_3
    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mMultipleLineText:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mMultipleLineText:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->access$100(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    int-to-float v3, v3

    iget v4, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mLineHeight:F

    mul-float v3, v3, v4

    invoke-static {v2, v3}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->access$902(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;F)F

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-string v4, "AutoLineLayout"

    const-string v5, "cut text coast time\uff1a %d"

    sub-long/2addr v2, v0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v4, v5, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method private findSuitableTextSize(FFFFF)V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mPaint:Landroid/text/TextPaint;

    invoke-virtual {v0}, Landroid/text/TextPaint;->getTextSize()F

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mMultipleLineText:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->access$900(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;)F

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mMultipleLineText:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->access$200(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;)F

    move-result v2

    move v3, v0

    :goto_0
    cmpg-float v4, v2, p1

    if-gez v4, :cond_0

    cmpg-float v4, v1, p2

    if-gez v4, :cond_0

    cmpg-float v4, v3, p4

    if-gtz v4, :cond_0

    add-float/2addr v3, p5

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mPaint:Landroid/text/TextPaint;

    invoke-virtual {v1, v3}, Landroid/text/TextPaint;->setTextSize(F)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mPaint:Landroid/text/TextPaint;

    invoke-virtual {v1}, Landroid/text/TextPaint;->getFontSpacing()F

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mMultipleLineText:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->access$100(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    int-to-float v2, v2

    mul-float v1, v1, v2

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mMultipleLineText:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->access$200(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;)F

    move-result v2

    div-float v4, v3, v0

    mul-float v2, v2, v4

    goto :goto_0

    :cond_0
    :goto_1
    cmpl-float v2, v2, p1

    if-gtz v2, :cond_1

    cmpl-float v2, v1, p2

    if-lez v2, :cond_2

    :cond_1
    cmpl-float v2, v3, p3

    if-ltz v2, :cond_2

    sub-float/2addr v3, p5

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mPaint:Landroid/text/TextPaint;

    invoke-virtual {v1, v3}, Landroid/text/TextPaint;->setTextSize(F)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mPaint:Landroid/text/TextPaint;

    invoke-virtual {v1}, Landroid/text/TextPaint;->getFontSpacing()F

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mMultipleLineText:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->access$100(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    int-to-float v2, v2

    mul-float v1, v1, v2

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mMultipleLineText:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->access$200(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;)F

    move-result v2

    div-float v4, v3, v0

    mul-float v2, v2, v4

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mPaint:Landroid/text/TextPaint;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mMultipleLineText:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->access$1000(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    move-result v0

    :goto_2
    cmpg-float v2, v0, p1

    if-gez v2, :cond_3

    cmpg-float v2, v1, p2

    if-gez v2, :cond_3

    cmpg-float v2, v3, p4

    if-gtz v2, :cond_3

    add-float/2addr v3, p5

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mPaint:Landroid/text/TextPaint;

    invoke-virtual {v0, v3}, Landroid/text/TextPaint;->setTextSize(F)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mPaint:Landroid/text/TextPaint;

    invoke-virtual {v0}, Landroid/text/TextPaint;->getFontSpacing()F

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mMultipleLineText:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->access$100(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    int-to-float v1, v1

    mul-float v1, v1, v0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mPaint:Landroid/text/TextPaint;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mMultipleLineText:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->access$1000(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    move-result v0

    goto :goto_2

    :cond_3
    :goto_3
    cmpl-float p4, v0, p1

    if-gtz p4, :cond_4

    cmpl-float p4, v1, p2

    if-lez p4, :cond_5

    :cond_4
    cmpl-float p4, v3, p3

    if-ltz p4, :cond_5

    sub-float/2addr v3, p5

    iget-object p4, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mPaint:Landroid/text/TextPaint;

    invoke-virtual {p4, v3}, Landroid/text/TextPaint;->setTextSize(F)V

    iget-object p4, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mPaint:Landroid/text/TextPaint;

    invoke-virtual {p4}, Landroid/text/TextPaint;->getFontSpacing()F

    move-result p4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mMultipleLineText:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->access$100(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    int-to-float v0, v0

    mul-float v1, p4, v0

    iget-object p4, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mPaint:Landroid/text/TextPaint;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mMultipleLineText:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->access$1000(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p4, v0}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    move-result v0

    goto :goto_3

    :cond_5
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mMultipleLineText:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->access$202(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;F)F

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mMultipleLineText:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;

    invoke-static {p1, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->access$902(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;F)F

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->refreshRect()V

    return-void
.end method

.method private getLineHeight()F
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mPaint:Landroid/text/TextPaint;

    invoke-virtual {v0}, Landroid/text/TextPaint;->getFontSpacing()F

    move-result v0

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mLineHeightOffset:F

    add-float/2addr v0, v1

    return v0
.end method

.method private static getSingleLineText(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_2

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0xa

    if-ne v2, v3, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ge v1, v2, :cond_1

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private refreshRect()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mMultipleLineText:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->access$200(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;)F

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mMultipleLineText:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->access$900(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;)F

    move-result v2

    div-float/2addr v2, v1

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->getLineHeight()F

    move-result v1

    iput v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mLineHeight:F

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mBound:Landroid/graphics/RectF;

    neg-float v3, v0

    neg-float v4, v2

    invoke-virtual {v1, v3, v4, v0, v2}, Landroid/graphics/RectF;->set(FFFF)V

    return-void
.end method


# virtual methods
.method public countText()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->cutText()V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->refreshRect()V

    return-void
.end method

.method public countText(FF)V
    .locals 10

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mPaint:Landroid/text/TextPaint;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mFontMetricsInt:Landroid/graphics/Paint$FontMetricsInt;

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->getFontMetricsInt(Landroid/graphics/Paint$FontMetricsInt;)I

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->getLineHeight()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mLineHeight:F

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mMultipleLineText:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->access$600(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;)V

    const/4 v0, 0x0

    cmpl-float v1, p1, v0

    if-eqz v1, :cond_b

    cmpl-float v1, p2, v0

    if-nez v1, :cond_0

    goto/16 :goto_5

    :cond_0
    cmpg-float v1, p1, v0

    if-gez v1, :cond_1

    const p1, 0x7f7fffff    # Float.MAX_VALUE

    :cond_1
    cmpg-float v0, p2, v0

    if-gez v0, :cond_2

    const p2, 0x7fffffff

    goto :goto_0

    :cond_2
    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mLineHeight:F

    div-float/2addr p2, v0

    float-to-int p2, p2

    :goto_0
    const/4 v0, 0x1

    if-ge p2, v0, :cond_3

    const/4 p2, 0x1

    :cond_3
    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mMaxLines:I

    if-lez v1, :cond_4

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mMaxLines:I

    if-le p2, v1, :cond_4

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mMaxLines:I

    :cond_4
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mMultipleLineText:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->access$100(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;)Ljava/util/List;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$1;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const/4 v2, 0x0

    :goto_1
    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mText:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v2, v4, :cond_7

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    if-gt v4, p2, :cond_7

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mText:Ljava/lang/String;

    const/16 v5, 0xa

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mText:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    invoke-static {v4, v5, v2, v6}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;CII)I

    move-result v4

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    sub-int/2addr v5, v0

    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;

    invoke-static {v5}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;->access$800(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mText:Ljava/lang/String;

    const/4 v8, -0x1

    if-ne v4, v8, :cond_5

    iget-object v9, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mText:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    goto :goto_2

    :cond_5
    move v9, v4

    :goto_2
    invoke-virtual {v7, v2, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;->count()V

    invoke-static {v5}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;->access$300(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;)F

    move-result v2

    cmpl-float v2, v2, p1

    if-lez v2, :cond_6

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    sub-int/2addr v2, v0

    invoke-interface {v1, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    sub-int v2, p2, v2

    invoke-direct {p0, v5, p1, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->cutSingleLineTextByWidth(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;FI)Ljava/util/List;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_6
    if-eq v4, v8, :cond_7

    new-instance v2, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;

    invoke-direct {v2, p0, v3}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$1;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v4, 0x1

    goto :goto_1

    :cond_7
    :goto_3
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result p1

    if-le p1, p2, :cond_8

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mMultipleLineText:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->access$100(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    sub-int/2addr p1, v0

    invoke-interface {v1, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_3

    :cond_8
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mMultipleLineText:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->access$100(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_9
    :goto_4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_a

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;->access$300(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;)F

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mMultipleLineText:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->access$200(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;)F

    move-result v1

    cmpl-float v0, v0, v1

    if-lez v0, :cond_9

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mMultipleLineText:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;->access$300(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;)F

    move-result p2

    invoke-static {v0, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->access$202(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;F)F

    goto :goto_4

    :cond_a
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mMultipleLineText:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mLineHeight:F

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mMultipleLineText:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->access$100(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    int-to-float v0, v0

    mul-float p2, p2, v0

    invoke-static {p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->access$902(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;F)F

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->refreshRect()V

    return-void

    :cond_b
    :goto_5
    return-void
.end method

.method public countTextArea(FFFFF)V
    .locals 3

    const-string v0, "AutoLineLayout"

    const-string v1, "--- begin count text in a area ---"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mMultipleLineText:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->access$600(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mBound:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->setEmpty()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mText:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->cutText()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-direct/range {p0 .. p5}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->findSuitableTextSize(FFFFF)V

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->countText(FF)V

    invoke-direct/range {p0 .. p5}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->findSuitableTextSize(FFFFF)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p3

    const-string p5, "AutoLineLayout"

    const-string v2, "text size coast time\uff1a%d"

    sub-long v0, p3, v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {p5, v2, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->countText(FF)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    const-string p5, "AutoLineLayout"

    const-string v0, "text resize coast time\uff1a%d"

    sub-long/2addr p1, p3

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-static {p5, v0, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const-string p1, "AutoLineLayout"

    const-string p2, "--- end count text in a area ---"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 7

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mBound:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    neg-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mBound:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v2

    neg-float v2, v2

    div-float/2addr v2, v1

    invoke-virtual {p1, v0, v2}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mMultipleLineText:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->access$100(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;

    sget-object v5, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$1;->$SwitchMap$com$miui$gallery$editor$photo$core$imports$text$utils$AutoLineLayout$TextAlignment:[I

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mTextAlignment:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    invoke-virtual {v6}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    const/4 v3, 0x0

    goto :goto_1

    :pswitch_1
    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mMultipleLineText:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->access$200(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;)F

    move-result v3

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;->access$300(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;)F

    move-result v5

    sub-float/2addr v3, v5

    goto :goto_1

    :pswitch_2
    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mMultipleLineText:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;->access$200(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$MultipleLineText;)F

    move-result v3

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;->access$300(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;)F

    move-result v5

    sub-float/2addr v3, v5

    div-float/2addr v3, v1

    :goto_1
    invoke-virtual {p1, v3, v2}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {v4, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$SingleLineText;->draw(Landroid/graphics/Canvas;)V

    neg-float v4, v3

    invoke-virtual {p1, v4, v2}, Landroid/graphics/Canvas;->translate(FF)V

    iget v4, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mLineHeight:F

    invoke-virtual {p1, v2, v4}, Landroid/graphics/Canvas;->translate(FF)V

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getPaint()Landroid/graphics/Paint;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mPaint:Landroid/text/TextPaint;

    return-object v0
.end method

.method public getText()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mOriginText:Ljava/lang/String;

    return-object v0
.end method

.method public getTextAlignment()Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mTextAlignment:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    return-object v0
.end method

.method public getTextRect(Landroid/graphics/RectF;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mBound:Landroid/graphics/RectF;

    invoke-virtual {p1, v0}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    return-void
.end method

.method public setLetterSpace(F)V
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mPaint:Landroid/text/TextPaint;

    invoke-virtual {v0, p1}, Landroid/text/TextPaint;->setLetterSpacing(F)V

    :cond_0
    return-void
.end method

.method public setLineHeightOffset(F)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mLineHeightOffset:F

    return-void
.end method

.method public setMaxLines(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mMaxLines:I

    return-void
.end method

.method public setSingleVerticalText(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mIsSingleVerticalText:Z

    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mOriginText:Ljava/lang/String;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mText:Ljava/lang/String;

    iget-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mIsSingleVerticalText:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mText:Ljava/lang/String;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->getSingleLineText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mText:Ljava/lang/String;

    :cond_0
    return-void
.end method

.method public setTextAlignment(Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->mTextAlignment:Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout$TextAlignment;

    return-void
.end method
