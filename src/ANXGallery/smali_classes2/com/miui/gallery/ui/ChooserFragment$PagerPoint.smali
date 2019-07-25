.class Lcom/miui/gallery/ui/ChooserFragment$PagerPoint;
.super Ljava/lang/Object;
.source "ChooserFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/ChooserFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PagerPoint"
.end annotation


# instance fields
.field private mActiveDrawable:Landroid/graphics/drawable/Drawable;

.field private mActivePoint:I

.field private mNormalDrawable:Landroid/graphics/drawable/Drawable;

.field private mPointLayout:Landroid/widget/LinearLayout;

.field private mPointMargin:I


# direct methods
.method constructor <init>(Landroid/widget/LinearLayout;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/ui/ChooserFragment$PagerPoint;->mActivePoint:I

    iput-object p1, p0, Lcom/miui/gallery/ui/ChooserFragment$PagerPoint;->mPointLayout:Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f060302

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/ui/ChooserFragment$PagerPoint;->mPointMargin:I

    iput-object p2, p0, Lcom/miui/gallery/ui/ChooserFragment$PagerPoint;->mNormalDrawable:Landroid/graphics/drawable/Drawable;

    iput-object p3, p0, Lcom/miui/gallery/ui/ChooserFragment$PagerPoint;->mActiveDrawable:Landroid/graphics/drawable/Drawable;

    return-void
.end method

.method private generatorPoint()Landroid/widget/ImageView;
    .locals 3

    new-instance v0, Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/miui/gallery/ui/ChooserFragment$PagerPoint;->mPointLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x2

    invoke-direct {v1, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iget v2, p0, Lcom/miui/gallery/ui/ChooserFragment$PagerPoint;->mPointMargin:I

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    iget v2, p0, Lcom/miui/gallery/ui/ChooserFragment$PagerPoint;->mPointMargin:I

    iput v2, v1, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method private setImageDrawable(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)V
    .locals 0

    if-eqz p1, :cond_0

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public notifyActivePointChanged(I)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment$PagerPoint;->mPointLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    const/4 v1, -0x1

    if-le p1, v1, :cond_0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment$PagerPoint;->mPointLayout:Landroid/widget/LinearLayout;

    iget v1, p0, Lcom/miui/gallery/ui/ChooserFragment$PagerPoint;->mActivePoint:I

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/miui/gallery/ui/ChooserFragment$PagerPoint;->mNormalDrawable:Landroid/graphics/drawable/Drawable;

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/ui/ChooserFragment$PagerPoint;->setImageDrawable(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment$PagerPoint;->mPointLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/miui/gallery/ui/ChooserFragment$PagerPoint;->mActiveDrawable:Landroid/graphics/drawable/Drawable;

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/ui/ChooserFragment$PagerPoint;->setImageDrawable(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)V

    iput p1, p0, Lcom/miui/gallery/ui/ChooserFragment$PagerPoint;->mActivePoint:I

    :cond_0
    return-void
.end method

.method public notifyPointCountChanged(II)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/ChooserFragment$PagerPoint;->mPointLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p1, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/ui/ChooserFragment$PagerPoint;->generatorPoint()Landroid/widget/ImageView;

    move-result-object v1

    if-ne p2, v0, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/ui/ChooserFragment$PagerPoint;->mActiveDrawable:Landroid/graphics/drawable/Drawable;

    goto :goto_1

    :cond_0
    iget-object v2, p0, Lcom/miui/gallery/ui/ChooserFragment$PagerPoint;->mNormalDrawable:Landroid/graphics/drawable/Drawable;

    :goto_1
    invoke-direct {p0, v1, v2}, Lcom/miui/gallery/ui/ChooserFragment$PagerPoint;->setImageDrawable(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)V

    iget-object v2, p0, Lcom/miui/gallery/ui/ChooserFragment$PagerPoint;->mPointLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v1, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    iput p2, p0, Lcom/miui/gallery/ui/ChooserFragment$PagerPoint;->mActivePoint:I

    return-void
.end method
