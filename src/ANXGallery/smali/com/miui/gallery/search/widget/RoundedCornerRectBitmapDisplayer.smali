.class public Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer;
.super Ljava/lang/Object;
.source "RoundedCornerRectBitmapDisplayer.java"

# interfaces
.implements Lcom/nostra13/universalimageloader/core/display/BitmapDisplayer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;
    }
.end annotation


# instance fields
.field protected final cornerRadius:[I


# direct methods
.method public constructor <init>(I)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x4

    new-array v1, v0, [I

    iput-object v1, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer;->cornerRadius:[I

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer;->cornerRadius:[I

    aput p1, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public constructor <init>([I)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    array-length v0, p1

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    iput-object p1, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer;->cornerRadius:[I

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "The corner radius array must contains 4 elements"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public display(Landroid/graphics/Bitmap;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/assist/LoadedFrom;)V
    .locals 1

    instance-of p3, p2, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    if-eqz p3, :cond_0

    new-instance p3, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;

    iget-object v0, p0, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer;->cornerRadius:[I

    invoke-direct {p3, p1, v0}, Lcom/miui/gallery/search/widget/RoundedCornerRectBitmapDisplayer$RoundedDrawable;-><init>(Landroid/graphics/Bitmap;[I)V

    invoke-interface {p2, p3}, Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;->setImageDrawable(Landroid/graphics/drawable/Drawable;)Z

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "ImageAware should wrap ImageView. ImageViewAware is expected."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
