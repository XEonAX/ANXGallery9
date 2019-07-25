.class Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "TextAppendConfig.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TextDrawable"
.end annotation


# instance fields
.field private rectTemp:Landroid/graphics/Rect;

.field final synthetic this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;->rectTemp:Landroid/graphics/Rect;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;)V

    return-void
.end method

.method private canvasTranslate(Landroid/graphics/Canvas;ZZ)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->access$100(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;)F

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->access$1100(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;)F

    move-result v1

    add-float/2addr v0, v1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->access$200(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;)F

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->access$1200(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;)F

    move-result v2

    add-float/2addr v1, v2

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;

    invoke-virtual {p2}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->getScaleMultiple()F

    move-result p2

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->getScaleMultiple()F

    move-result v1

    invoke-virtual {p1, p2, v1, v0, v0}, Landroid/graphics/Canvas;->scale(FFFF)V

    :cond_0
    if-eqz p3, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;

    invoke-virtual {p2}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->getRotateDegrees()F

    move-result p2

    invoke-virtual {p1, p2, v0, v0}, Landroid/graphics/Canvas;->rotate(FFF)V

    :cond_1
    return-void
.end method

.method private drawDialog(Landroid/graphics/Canvas;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->access$300(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->access$400(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;)Landroid/graphics/RectF;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;->rectTemp:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->round(Landroid/graphics/Rect;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->access$300(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;->rectTemp:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;->canvasTranslate(Landroid/graphics/Canvas;ZZ)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->access$500(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/high16 v0, -0x40800000    # -1.0f

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->scale(FF)V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->access$600(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->access$300(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->access$700(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;)I

    move-result v1

    sget-object v2, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->access$300(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method private drawText(Landroid/graphics/Canvas;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->access$800(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;->canvasTranslate(Landroid/graphics/Canvas;ZZ)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->isDialogEnable()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->access$500(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->access$900(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;)Landroid/graphics/RectF;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    move-result v0

    neg-float v0, v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->access$900(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;)Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerY()F

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->access$900(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;)Landroid/graphics/RectF;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->access$900(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;)Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerY()F

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->access$1000(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;)Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/utils/AutoLineLayout;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method private initCanvas(Landroid/graphics/Canvas;)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->access$100(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;)F

    move-result v0

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    const/high16 v2, 0x40000000    # 2.0f

    if-gez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v3, v2

    invoke-static {v0, v3}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->access$102(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;F)F

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->access$200(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;)F

    move-result v0

    cmpg-float v0, v0, v1

    if-gez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result p1

    int-to-float p1, p1

    div-float/2addr p1, v2

    invoke-static {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->access$202(Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;F)F

    :cond_1
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;->initCanvas(Landroid/graphics/Canvas;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig;->isDialogEnable()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;->drawText(Landroid/graphics/Canvas;)V

    goto :goto_0

    :cond_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;->drawDialog(Landroid/graphics/Canvas;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextAppendConfig$TextDrawable;->drawText(Landroid/graphics/Canvas;)V

    :goto_0
    return-void
.end method

.method public getOpacity()I
    .locals 1

    const/4 v0, -0x3

    return v0
.end method

.method public setAlpha(I)V
    .locals 0

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    return-void
.end method
