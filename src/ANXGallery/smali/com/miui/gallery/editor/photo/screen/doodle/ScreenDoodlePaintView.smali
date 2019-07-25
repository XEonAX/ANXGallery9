.class public Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;
.super Landroid/view/View;
.source "ScreenDoodlePaintView.java"


# instance fields
.field private mBasePaintRect:Landroid/graphics/Rect;

.field private mCurrentPaintIndex:I

.field private mDoodlePaintItemList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x1

    iput p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->mCurrentPaintIndex:I

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->mBasePaintRect:Landroid/graphics/Rect;

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x1

    iput p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->mCurrentPaintIndex:I

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->mBasePaintRect:Landroid/graphics/Rect;

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x1

    iput p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->mCurrentPaintIndex:I

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->mBasePaintRect:Landroid/graphics/Rect;

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->init()V

    return-void
.end method

.method private init()V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->getList(Landroid/content/res/Resources;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->mDoodlePaintItemList:Ljava/util/List;

    return-void
.end method

.method private setPaintLocation(II)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->mBasePaintRect:Landroid/graphics/Rect;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1, p1, p2}, Landroid/graphics/Rect;->set(IIII)V

    :goto_0
    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->mDoodlePaintItemList:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    if-ge v1, p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->mDoodlePaintItemList:Ljava/util/List;

    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->mBasePaintRect:Landroid/graphics/Rect;

    invoke-virtual {p2, v0}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->setBounds(Landroid/graphics/Rect;)V

    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->setSelect(Z)V

    int-to-float v0, p1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->density:F

    sub-float/2addr v0, v2

    float-to-int v0, v0

    invoke-virtual {p2, v0}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->setBigSize(I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public getPaintType()Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem$PaintType;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->mDoodlePaintItemList:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->mCurrentPaintIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->paintType:Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem$PaintType;

    return-object v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->mDoodlePaintItemList:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->mCurrentPaintIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 0

    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->setPaintLocation(II)V

    return-void
.end method

.method public setPaintColor(I)V
    .locals 2

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->mDoodlePaintItemList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->mDoodlePaintItemList:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;

    invoke-virtual {v1, p1}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->setCurrentColor(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public setPaintType(Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem$PaintType;)V
    .locals 1

    if-nez p1, :cond_0

    return-void

    :cond_0
    sget-object v0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView$1;->$SwitchMap$com$miui$gallery$editor$photo$app$doodle$DoodlePaintItem$PaintType:[I

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem$PaintType;->ordinal()I

    move-result p1

    aget p1, v0, p1

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->mCurrentPaintIndex:I

    add-int/lit8 p1, p1, 0x2

    iput p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->mCurrentPaintIndex:I

    iget p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->mCurrentPaintIndex:I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->mDoodlePaintItemList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    rem-int/2addr p1, v0

    iput p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->mCurrentPaintIndex:I

    goto :goto_0

    :pswitch_1
    iget p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->mCurrentPaintIndex:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->mCurrentPaintIndex:I

    iget p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->mCurrentPaintIndex:I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->mDoodlePaintItemList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    rem-int/2addr p1, v0

    iput p1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->mCurrentPaintIndex:I

    :goto_0
    :pswitch_2
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method public transSize()V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->mCurrentPaintIndex:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->mDoodlePaintItemList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    rem-int/2addr v0, v1

    iput v0, p0, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->mCurrentPaintIndex:I

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/doodle/ScreenDoodlePaintView;->invalidate()V

    return-void
.end method
