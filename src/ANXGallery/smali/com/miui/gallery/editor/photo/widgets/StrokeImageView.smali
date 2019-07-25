.class public Lcom/miui/gallery/editor/photo/widgets/StrokeImageView;
.super Landroid/widget/ImageView;
.source "StrokeImageView.java"


# instance fields
.field private mIsStrokeVisible:Z

.field private mStrokeImageHelper:Lcom/miui/gallery/editor/photo/widgets/StrokeImageHelper;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/widgets/StrokeImageView;->mIsStrokeVisible:Z

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/widgets/StrokeImageView;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/widgets/StrokeImageView;->mIsStrokeVisible:Z

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/widgets/StrokeImageView;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/widgets/StrokeImageView;->mIsStrokeVisible:Z

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/widgets/StrokeImageView;->init()V

    return-void
.end method

.method private init()V
    .locals 2

    new-instance v0, Lcom/miui/gallery/editor/photo/widgets/StrokeImageHelper;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/StrokeImageView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/miui/gallery/editor/photo/widgets/StrokeImageHelper;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/StrokeImageView;->mStrokeImageHelper:Lcom/miui/gallery/editor/photo/widgets/StrokeImageHelper;

    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 3

    invoke-super {p0, p1}, Landroid/widget/ImageView;->onDraw(Landroid/graphics/Canvas;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/StrokeImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-boolean v1, p0, Lcom/miui/gallery/editor/photo/widgets/StrokeImageView;->mIsStrokeVisible:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/StrokeImageView;->mStrokeImageHelper:Lcom/miui/gallery/editor/photo/widgets/StrokeImageHelper;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/StrokeImageView;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v2

    invoke-virtual {v1, p1, v0, v2}, Lcom/miui/gallery/editor/photo/widgets/StrokeImageHelper;->draw(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Matrix;)V

    :cond_0
    return-void
.end method

.method public setStrokeVisible(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/widgets/StrokeImageView;->mIsStrokeVisible:Z

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/StrokeImageView;->invalidate()V

    return-void
.end method
