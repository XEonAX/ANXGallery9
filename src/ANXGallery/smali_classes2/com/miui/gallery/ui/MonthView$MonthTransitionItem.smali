.class Lcom/miui/gallery/ui/MonthView$MonthTransitionItem;
.super Ljava/lang/Object;
.source "MonthView.java"

# interfaces
.implements Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/MonthView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MonthTransitionItem"
.end annotation


# instance fields
.field private mFrame:Landroid/graphics/RectF;

.field private mItemView:Lcom/miui/gallery/ui/MonthView$ItemView;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/MonthView;Lcom/miui/gallery/ui/MonthView$ItemView;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/ui/MonthView$MonthTransitionItem;->mItemView:Lcom/miui/gallery/ui/MonthView$ItemView;

    new-instance v0, Landroid/graphics/RectF;

    invoke-static {p2}, Lcom/miui/gallery/ui/MonthView$ItemView;->access$600(Lcom/miui/gallery/ui/MonthView$ItemView;)Landroid/graphics/RectF;

    move-result-object p2

    invoke-direct {v0, p2}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/MonthView$MonthTransitionItem;->mFrame:Landroid/graphics/RectF;

    iget-object p2, p0, Lcom/miui/gallery/ui/MonthView$MonthTransitionItem;->mFrame:Landroid/graphics/RectF;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/MonthView;->getLeft()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1}, Lcom/miui/gallery/ui/MonthView;->getTop()I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {p2, v0, p1}, Landroid/graphics/RectF;->offset(FF)V

    return-void
.end method


# virtual methods
.method public getTransitDrawable()Landroid/graphics/drawable/Drawable;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthView$MonthTransitionItem;->mItemView:Lcom/miui/gallery/ui/MonthView$ItemView;

    invoke-static {v0}, Lcom/miui/gallery/util/BindImageHelper;->isViewBindDrawable(Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthView$MonthTransitionItem;->mItemView:Lcom/miui/gallery/ui/MonthView$ItemView;

    invoke-static {v0}, Lcom/miui/gallery/ui/MonthView$ItemView;->access$800(Lcom/miui/gallery/ui/MonthView$ItemView;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_0

    :cond_0
    move-object v0, v1

    :goto_0
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v2

    if-eqz v2, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthView$MonthTransitionItem;->mItemView:Lcom/miui/gallery/ui/MonthView$ItemView;

    invoke-static {v0}, Lcom/miui/gallery/ui/MonthView$ItemView;->access$900(Lcom/miui/gallery/ui/MonthView$ItemView;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthView$MonthTransitionItem;->mItemView:Lcom/miui/gallery/ui/MonthView$ItemView;

    invoke-static {v0}, Lcom/miui/gallery/ui/MonthView$ItemView;->access$900(Lcom/miui/gallery/ui/MonthView$ItemView;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Landroid/view/View;

    :cond_1
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable(Landroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_1

    :cond_2
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    :cond_3
    :goto_1
    return-object v0
.end method

.method public getTransitFrame()Landroid/graphics/RectF;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthView$MonthTransitionItem;->mFrame:Landroid/graphics/RectF;

    return-object v0
.end method

.method public getTransitId()J
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthView$MonthTransitionItem;->mItemView:Lcom/miui/gallery/ui/MonthView$ItemView;

    invoke-static {v0}, Lcom/miui/gallery/ui/MonthView$ItemView;->access$100(Lcom/miui/gallery/ui/MonthView$ItemView;)Lcom/miui/gallery/ui/MonthView$MonthItem;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/ui/MonthView$MonthItem;->access$500(Lcom/miui/gallery/ui/MonthView$MonthItem;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getTransitPath()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/MonthView$MonthTransitionItem;->mItemView:Lcom/miui/gallery/ui/MonthView$ItemView;

    invoke-static {v0}, Lcom/miui/gallery/ui/MonthView$ItemView;->access$100(Lcom/miui/gallery/ui/MonthView$ItemView;)Lcom/miui/gallery/ui/MonthView$MonthItem;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/ui/MonthView$MonthItem;->access$300(Lcom/miui/gallery/ui/MonthView$MonthItem;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTransitScaleType()Landroid/widget/ImageView$ScaleType;
    .locals 1

    sget-object v0, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    return-object v0
.end method
