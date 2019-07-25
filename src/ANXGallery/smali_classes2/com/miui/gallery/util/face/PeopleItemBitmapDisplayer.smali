.class public Lcom/miui/gallery/util/face/PeopleItemBitmapDisplayer;
.super Ljava/lang/Object;
.source "PeopleItemBitmapDisplayer.java"

# interfaces
.implements Lcom/nostra13/universalimageloader/core/display/BitmapDisplayer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/util/face/PeopleItemBitmapDisplayer$PressableCircleBitmapDrawable;
    }
.end annotation


# instance fields
.field private mClickable:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/miui/gallery/util/face/PeopleItemBitmapDisplayer;->mClickable:Z

    return-void
.end method


# virtual methods
.method public display(Landroid/graphics/Bitmap;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/assist/LoadedFrom;)V
    .locals 4

    instance-of p3, p2, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    if-eqz p3, :cond_2

    invoke-interface {p2}, Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;->getWrappedView()Landroid/view/View;

    move-result-object p3

    if-nez p3, :cond_0

    return-void

    :cond_0
    invoke-virtual {p3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    invoke-interface {p2, p1}, Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;->saveBitmap(Landroid/graphics/Bitmap;)V

    new-instance v0, Lcom/miui/gallery/util/face/PeopleItemBitmapDisplayer$PressableCircleBitmapDrawable;

    iget-boolean v1, p0, Lcom/miui/gallery/util/face/PeopleItemBitmapDisplayer;->mClickable:Z

    if-eqz v1, :cond_1

    const v1, 0x7f0500ae

    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    const v2, 0x7f0500b1

    invoke-virtual {p3, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const v3, 0x7f060278

    invoke-virtual {p3, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p3

    int-to-float p3, p3

    invoke-direct {v0, p1, v1, v2, p3}, Lcom/miui/gallery/util/face/PeopleItemBitmapDisplayer$PressableCircleBitmapDrawable;-><init>(Landroid/graphics/Bitmap;Ljava/lang/Integer;Ljava/lang/Integer;F)V

    invoke-interface {p2, v0}, Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;->setImageDrawable(Landroid/graphics/drawable/Drawable;)Z

    return-void

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "ImageAware should wrap ImageView. ImageViewAware is expected."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
