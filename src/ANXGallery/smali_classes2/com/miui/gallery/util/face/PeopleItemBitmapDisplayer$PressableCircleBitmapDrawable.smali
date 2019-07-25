.class public Lcom/miui/gallery/util/face/PeopleItemBitmapDisplayer$PressableCircleBitmapDrawable;
.super Lcom/nostra13/universalimageloader/core/display/CircleBitmapDisplayer$CircleDrawable;
.source "PeopleItemBitmapDisplayer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/util/face/PeopleItemBitmapDisplayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PressableCircleBitmapDrawable"
.end annotation


# instance fields
.field private mPressedColorFilter:Landroid/graphics/PorterDuffColorFilter;

.field private mStateSpec:[I


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;Ljava/lang/Integer;Ljava/lang/Integer;F)V
    .locals 0

    invoke-direct {p0, p1, p3, p4}, Lcom/nostra13/universalimageloader/core/display/CircleBitmapDisplayer$CircleDrawable;-><init>(Landroid/graphics/Bitmap;Ljava/lang/Integer;F)V

    const/4 p1, 0x1

    new-array p1, p1, [I

    const/4 p3, 0x0

    const p4, 0x10100a7

    aput p4, p1, p3

    iput-object p1, p0, Lcom/miui/gallery/util/face/PeopleItemBitmapDisplayer$PressableCircleBitmapDrawable;->mStateSpec:[I

    if-eqz p2, :cond_0

    new-instance p1, Landroid/graphics/PorterDuffColorFilter;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    sget-object p3, Landroid/graphics/PorterDuff$Mode;->DARKEN:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {p1, p2, p3}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    iput-object p1, p0, Lcom/miui/gallery/util/face/PeopleItemBitmapDisplayer$PressableCircleBitmapDrawable;->mPressedColorFilter:Landroid/graphics/PorterDuffColorFilter;

    :cond_0
    return-void
.end method


# virtual methods
.method public isStateful()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method protected onStateChange([I)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/face/PeopleItemBitmapDisplayer$PressableCircleBitmapDrawable;->mPressedColorFilter:Landroid/graphics/PorterDuffColorFilter;

    if-nez v0, :cond_0

    invoke-super {p0, p1}, Lcom/nostra13/universalimageloader/core/display/CircleBitmapDisplayer$CircleDrawable;->onStateChange([I)Z

    move-result p1

    return p1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/util/face/PeopleItemBitmapDisplayer$PressableCircleBitmapDrawable;->mStateSpec:[I

    invoke-static {v0, p1}, Landroid/util/StateSet;->stateSetMatches([I[I)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/util/face/PeopleItemBitmapDisplayer$PressableCircleBitmapDrawable;->mPressedColorFilter:Landroid/graphics/PorterDuffColorFilter;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/util/face/PeopleItemBitmapDisplayer$PressableCircleBitmapDrawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/util/face/PeopleItemBitmapDisplayer$PressableCircleBitmapDrawable;->clearColorFilter()V

    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/util/face/PeopleItemBitmapDisplayer$PressableCircleBitmapDrawable;->invalidateSelf()V

    const/4 p1, 0x1

    return p1
.end method
