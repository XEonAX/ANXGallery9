.class public Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;
.super Ljava/lang/Object;
.source "nexOverlayManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "nexTitleInfo"
.end annotation


# instance fields
.field private cachePaint:Landroid/text/TextPaint;

.field private changeText:Z

.field private fontID:Ljava/lang/String;

.field private fontSize:I

.field private group:Ljava/lang/String;

.field private id:I

.field private overlayHeight:I

.field private overlayWidth:I

.field private realMaxFontSize:I

.field private text:Ljava/lang/String;

.field private textDesc:Ljava/lang/String;

.field private textMaxLen:I


# direct methods
.method private constructor <init>(IILjava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->id:I

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->textMaxLen:I

    iput-object p3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->textDesc:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(IILjava/lang/String;Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$1;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;-><init>(IILjava/lang/String;)V

    return-void
.end method

.method private declared-synchronized calcFontSize()V
    .locals 4

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->changeText:Z

    if-nez v0, :cond_0

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->realMaxFontSize:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-lez v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->cachePaint:Landroid/text/TextPaint;

    if-nez v0, :cond_1

    new-instance v0, Landroid/text/TextPaint;

    invoke-direct {v0}, Landroid/text/TextPaint;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->cachePaint:Landroid/text/TextPaint;

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->cachePaint:Landroid/text/TextPaint;

    invoke-virtual {v0}, Landroid/text/TextPaint;->reset()V

    :goto_0
    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->overlayHeight:I

    add-int/lit8 v0, v0, -0x4

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->cachePaint:Landroid/text/TextPaint;

    int-to-float v2, v0

    invoke-virtual {v1, v2}, Landroid/text/TextPaint;->setTextSize(F)V

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->cachePaint:Landroid/text/TextPaint;

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->a()Lcom/nexstreaming/kminternal/kinemaster/config/a;

    move-result-object v2

    invoke-virtual {v2}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->b()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->fontID:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/nexstreaming/nexeditorsdk/nexFont;->getTypeface(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->cachePaint:Landroid/text/TextPaint;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/text/TextPaint;->setAntiAlias(Z)V

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->cachePaint:Landroid/text/TextPaint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/text/TextPaint;->setStyle(Landroid/graphics/Paint$Style;)V

    :goto_1
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->cachePaint:Landroid/text/TextPaint;

    invoke-virtual {v1}, Landroid/text/TextPaint;->getFontSpacing()F

    move-result v1

    float-to-int v1, v1

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->overlayHeight:I

    add-int/lit8 v2, v2, -0x4

    if-ge v1, v2, :cond_2

    goto :goto_2

    :cond_2
    const/16 v1, 0xa

    if-ge v0, v1, :cond_3

    :goto_2
    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->realMaxFontSize:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->changeText:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :cond_3
    add-int/lit8 v0, v0, -0xa

    :try_start_2
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->cachePaint:Landroid/text/TextPaint;

    int-to-float v2, v0

    invoke-virtual {v1, v2}, Landroid/text/TextPaint;->setTextSize(F)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public getFontID()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->fontID:Ljava/lang/String;

    return-object v0
.end method

.method public getFontSize()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->fontSize:I

    return v0
.end method

.method getGroup()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->group:Ljava/lang/String;

    return-object v0
.end method

.method public getId()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->id:I

    return v0
.end method

.method public getMaxFontSize()I
    .locals 1

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->calcFontSize()V

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->realMaxFontSize:I

    return v0
.end method

.method public getOverlayHeight()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->overlayHeight:I

    return v0
.end method

.method public getOverlayWidth()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->overlayWidth:I

    return v0
.end method

.method public getText()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->text:Ljava/lang/String;

    return-object v0
.end method

.method public getTextDesc()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->textDesc:Ljava/lang/String;

    return-object v0
.end method

.method public declared-synchronized getTextHeight(Ljava/lang/String;)I
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->cachePaint:Landroid/text/TextPaint;

    if-nez p1, :cond_0

    new-instance p1, Landroid/text/TextPaint;

    invoke-direct {p1}, Landroid/text/TextPaint;-><init>()V

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->cachePaint:Landroid/text/TextPaint;

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->cachePaint:Landroid/text/TextPaint;

    invoke-virtual {p1}, Landroid/text/TextPaint;->reset()V

    :goto_0
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->cachePaint:Landroid/text/TextPaint;

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->fontSize:I

    int-to-float v0, v0

    invoke-virtual {p1, v0}, Landroid/text/TextPaint;->setTextSize(F)V

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->cachePaint:Landroid/text/TextPaint;

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->a()Lcom/nexstreaming/kminternal/kinemaster/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->b()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->fontID:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexFont;->getTypeface(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->cachePaint:Landroid/text/TextPaint;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/text/TextPaint;->setAntiAlias(Z)V

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->cachePaint:Landroid/text/TextPaint;

    sget-object v0, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/text/TextPaint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->cachePaint:Landroid/text/TextPaint;

    invoke-virtual {p1}, Landroid/text/TextPaint;->getFontSpacing()F

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    float-to-int p1, p1

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public getTextMaxLen()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->textMaxLen:I

    return v0
.end method

.method public getTextWidth(Ljava/lang/String;)I
    .locals 3

    new-instance v0, Landroid/text/TextPaint;

    invoke-direct {v0}, Landroid/text/TextPaint;-><init>()V

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager;->access$100()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->fontID:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/nexstreaming/nexeditorsdk/nexFont;->getTypeface(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->fontSize:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setTextSize(F)V

    invoke-virtual {v0, p1}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    move-result p1

    float-to-int p1, p1

    return p1
.end method

.method public setFontID(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->fontID:Ljava/lang/String;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->changeText:Z

    return-void
.end method

.method public setFontSize(I)V
    .locals 0

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->fontSize:I

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->changeText:Z

    return-void
.end method

.method setGroup(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->group:Ljava/lang/String;

    return-void
.end method

.method setOverlayResolution(II)V
    .locals 0

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->overlayWidth:I

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->overlayHeight:I

    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayManager$nexTitleInfo;->text:Ljava/lang/String;

    return-void
.end method
