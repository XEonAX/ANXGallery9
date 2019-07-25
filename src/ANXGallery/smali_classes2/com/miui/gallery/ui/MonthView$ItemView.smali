.class Lcom/miui/gallery/ui/MonthView$ItemView;
.super Lcom/nostra13/universalimageloader/core/imageaware/NonViewAware;
.source "MonthView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/MonthView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ItemView"
.end annotation


# instance fields
.field private mBindView:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private mData:Lcom/miui/gallery/ui/MonthView$MonthItem;

.field private mDrawable:Landroid/graphics/drawable/Drawable;

.field private mFrame:Landroid/graphics/RectF;

.field private mMatrix:Landroid/graphics/Matrix;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, v0}, Lcom/miui/gallery/ui/MonthView$ItemView;-><init>(Landroid/view/View;Landroid/graphics/RectF;Lcom/miui/gallery/ui/MonthView$MonthItem;)V

    return-void
.end method

.method public constructor <init>(Landroid/view/View;Landroid/graphics/RectF;Lcom/miui/gallery/ui/MonthView$MonthItem;)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v0

    iget-object v0, v0, Lcom/miui/gallery/Config$ThumbConfig;->sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    sget-object v1, Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;->CROP:Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;

    invoke-direct {p0, v0, v1}, Lcom/nostra13/universalimageloader/core/imageaware/NonViewAware;-><init>(Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;)V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mBindView:Ljava/lang/ref/WeakReference;

    iput-object p2, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mFrame:Landroid/graphics/RectF;

    iput-object p3, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mData:Lcom/miui/gallery/ui/MonthView$MonthItem;

    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mMatrix:Landroid/graphics/Matrix;

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/MonthView$ItemView;)Lcom/miui/gallery/ui/MonthView$MonthItem;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mData:Lcom/miui/gallery/ui/MonthView$MonthItem;

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/ui/MonthView$ItemView;)Landroid/graphics/RectF;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mFrame:Landroid/graphics/RectF;

    return-object p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/ui/MonthView$ItemView;)Landroid/graphics/drawable/Drawable;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mDrawable:Landroid/graphics/drawable/Drawable;

    return-object p0
.end method

.method static synthetic access$900(Lcom/miui/gallery/ui/MonthView$ItemView;)Ljava/lang/ref/WeakReference;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mBindView:Ljava/lang/ref/WeakReference;

    return-object p0
.end method

.method private configureBounds()V
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mFrame:Landroid/graphics/RectF;

    if-nez v0, :cond_0

    goto :goto_3

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mFrame:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    float-to-int v2, v2

    iget-object v3, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mFrame:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    float-to-int v3, v3

    const/4 v4, 0x0

    if-ltz v0, :cond_1

    if-ne v2, v0, :cond_2

    :cond_1
    if-ltz v1, :cond_3

    if-ne v3, v1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v5, 0x0

    goto :goto_1

    :cond_3
    :goto_0
    const/4 v5, 0x1

    :goto_1
    iget-object v6, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v6}, Landroid/graphics/Matrix;->reset()V

    iget-object v6, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v6, v4, v4, v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    if-eqz v5, :cond_4

    return-void

    :cond_4
    mul-int v4, v0, v3

    mul-int v5, v2, v1

    const/high16 v6, 0x3f000000    # 0.5f

    const/4 v7, 0x0

    if-le v4, v5, :cond_5

    int-to-float v3, v3

    int-to-float v1, v1

    div-float/2addr v3, v1

    int-to-float v1, v2

    int-to-float v0, v0

    mul-float v0, v0, v3

    sub-float/2addr v1, v0

    mul-float v0, v1, v6

    move v7, v0

    move v0, v3

    const/4 v1, 0x0

    goto :goto_2

    :cond_5
    int-to-float v2, v2

    int-to-float v0, v0

    div-float v0, v2, v0

    int-to-float v2, v3

    int-to-float v1, v1

    mul-float v1, v1, v0

    sub-float/2addr v2, v1

    mul-float v1, v2, v6

    :goto_2
    iget-object v2, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v2, v0, v0}, Landroid/graphics/Matrix;->setScale(FF)V

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mMatrix:Landroid/graphics/Matrix;

    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v2, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v2, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    return-void

    :cond_6
    :goto_3
    return-void
.end method


# virtual methods
.method public bindView(Landroid/view/View;)Lcom/miui/gallery/ui/MonthView$ItemView;
    .locals 1

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mBindView:Ljava/lang/ref/WeakReference;

    return-object p0
.end method

.method public detach()V
    .locals 2

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mData:Lcom/miui/gallery/ui/MonthView$MonthItem;

    iput-object v0, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mDrawable:Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mBindView:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mBindView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->clear()V

    :cond_0
    iput-object v0, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mBindView:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public getHeight()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mFrame:Landroid/graphics/RectF;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mFrame:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v0

    float-to-int v0, v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getId()I
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mData:Lcom/miui/gallery/ui/MonthView$MonthItem;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mData:Lcom/miui/gallery/ui/MonthView$MonthItem;

    invoke-static {v0}, Lcom/miui/gallery/ui/MonthView$MonthItem;->access$500(Lcom/miui/gallery/ui/MonthView$MonthItem;)J

    move-result-wide v0

    long-to-int v0, v0

    goto :goto_0

    :cond_0
    invoke-super {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    :goto_0
    return v0
.end method

.method public getWidth()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mFrame:Landroid/graphics/RectF;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mFrame:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    float-to-int v0, v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public invalidate()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mFrame:Landroid/graphics/RectF;

    if-nez v0, :cond_0

    goto :goto_3

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mBindView:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mBindView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    goto :goto_2

    :cond_2
    const-string v0, "MonthView"

    const-string v1, "bind view is null: reference %s"

    iget-object v2, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mBindView:Ljava/lang/ref/WeakReference;

    if-nez v2, :cond_3

    const/4 v2, 0x1

    goto :goto_1

    :cond_3
    const/4 v2, 0x0

    :goto_1
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_2
    return-void

    :cond_4
    :goto_3
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mFrame:Landroid/graphics/RectF;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mFrame:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    iget-object v2, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mFrame:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v1, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mFrame:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mFrame:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {p1, v3, v3, v1, v2}, Landroid/graphics/Canvas;->clipRect(FFFF)Z

    iget-object v1, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    iget-object v1, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    :cond_0
    return-void
.end method

.method public setData(Lcom/miui/gallery/ui/MonthView$MonthItem;)Lcom/miui/gallery/ui/MonthView$ItemView;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mData:Lcom/miui/gallery/ui/MonthView$MonthItem;

    return-object p0
.end method

.method public setFrame(Landroid/graphics/RectF;)Lcom/miui/gallery/ui/MonthView$ItemView;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mFrame:Landroid/graphics/RectF;

    invoke-direct {p0}, Lcom/miui/gallery/ui/MonthView$ItemView;->configureBounds()V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/MonthView$ItemView;->invalidate()V

    return-object p0
.end method

.method public setImageBitmap(Landroid/graphics/Bitmap;)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mBindView:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mBindView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    iget-object v1, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mBindView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    goto :goto_0

    :cond_0
    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v0, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    :goto_0
    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/MonthView$ItemView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result p1

    return p1
.end method

.method public setImageDrawable(Landroid/graphics/drawable/Drawable;)Z
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/MonthView$ItemView;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-direct {p0}, Lcom/miui/gallery/ui/MonthView$ItemView;->configureBounds()V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/MonthView$ItemView;->invalidate()V

    const/4 p1, 0x1

    return p1
.end method
