.class final Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$3;
.super Ljava/lang/Object;
.source "TransitionHelper.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->parseTransitionalItems(Landroid/support/v7/widget/RecyclerView;)Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;)I
    .locals 2

    invoke-interface {p1}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;->getTransitFrame()Landroid/graphics/RectF;

    move-result-object p1

    invoke-interface {p2}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;->getTransitFrame()Landroid/graphics/RectF;

    move-result-object p2

    iget v0, p1, Landroid/graphics/RectF;->top:F

    iget v1, p2, Landroid/graphics/RectF;->top:F

    invoke-static {v0, v1}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    if-nez v0, :cond_0

    iget p1, p1, Landroid/graphics/RectF;->left:F

    iget p2, p2, Landroid/graphics/RectF;->left:F

    :goto_0
    sub-float/2addr p1, p2

    goto :goto_1

    :cond_0
    iget p1, p1, Landroid/graphics/RectF;->top:F

    iget p2, p2, Landroid/graphics/RectF;->top:F

    goto :goto_0

    :goto_1
    float-to-int p1, p1

    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    check-cast p1, Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;

    check-cast p2, Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$3;->compare(Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;)I

    move-result p1

    return p1
.end method
