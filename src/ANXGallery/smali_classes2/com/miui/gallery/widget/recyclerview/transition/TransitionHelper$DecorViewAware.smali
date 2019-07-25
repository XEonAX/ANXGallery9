.class Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$DecorViewAware;
.super Lcom/nostra13/universalimageloader/core/imageaware/NonViewAware;
.source "TransitionHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DecorViewAware"
.end annotation


# instance fields
.field private mDecorItem:Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;)V
    .locals 3

    new-instance v0, Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    iget-object v1, p1, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mFromFrame:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    float-to-int v1, v1

    iget-object v2, p1, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mFromFrame:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v2

    float-to-int v2, v2

    invoke-direct {v0, v1, v2}, Lcom/nostra13/universalimageloader/core/assist/ImageSize;-><init>(II)V

    sget-object v1, Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;->CROP:Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;

    invoke-direct {p0, v0, v1}, Lcom/nostra13/universalimageloader/core/imageaware/NonViewAware;-><init>(Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;)V

    iput-object p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$DecorViewAware;->mDecorItem:Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;

    return-void
.end method

.method static synthetic access$1100(Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$DecorViewAware;)Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$DecorViewAware;->mDecorItem:Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;

    return-object p0
.end method


# virtual methods
.method public getId()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$DecorViewAware;->mDecorItem:Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;

    iget-object v0, v0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mLocalPath:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    return v0
.end method

.method public setImageBitmap(Landroid/graphics/Bitmap;)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$DecorViewAware;->mDecorItem:Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;

    iget-object v0, v0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mHost:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$DecorViewAware;->mDecorItem:Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;

    iget-object v0, v0, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->mHost:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    new-instance v1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {v1, v0, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    invoke-virtual {p0, v1}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$DecorViewAware;->setImageDrawable(Landroid/graphics/drawable/Drawable;)Z

    move-result p1

    return p1
.end method

.method public setImageDrawable(Landroid/graphics/drawable/Drawable;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$DecorViewAware;->mDecorItem:Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->updateDrawable(Landroid/graphics/drawable/Drawable;)V

    const/4 p1, 0x1

    return p1
.end method
