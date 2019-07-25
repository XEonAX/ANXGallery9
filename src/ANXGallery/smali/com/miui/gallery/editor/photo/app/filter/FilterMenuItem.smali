.class Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "FilterMenuItem.java"


# instance fields
.field private mColorDrawable:Landroid/graphics/drawable/ColorDrawable;

.field private mConfigIndicator:Landroid/view/View;

.field private mData:Lcom/miui/gallery/editor/photo/core/common/model/FilterData;

.field private mPreviewView:Landroid/widget/ImageView;

.field mSelected:Z

.field private mSelector:Landroid/widget/ImageView;

.field private mTitleView:Landroid/widget/TextView;

.field private mValueIndicator:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/view/View;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/ColorDrawable;-><init>()V

    invoke-virtual {v0}, Landroid/graphics/drawable/ColorDrawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/ColorDrawable;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;->mColorDrawable:Landroid/graphics/drawable/ColorDrawable;

    const v0, 0x7f090228

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;->mPreviewView:Landroid/widget/ImageView;

    const v0, 0x7f0902fa

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;->mTitleView:Landroid/widget/TextView;

    const v0, 0x7f090324

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;->mValueIndicator:Landroid/widget/TextView;

    const v0, 0x7f0900ab

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;->mConfigIndicator:Landroid/view/View;

    const v0, 0x7f09029e

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;->mSelector:Landroid/widget/ImageView;

    return-void
.end method


# virtual methods
.method bindData(Lcom/miui/gallery/editor/photo/core/common/model/FilterData;)V
    .locals 2

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;->mData:Lcom/miui/gallery/editor/photo/core/common/model/FilterData;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;->mPreviewView:Landroid/widget/ImageView;

    iget v1, p1, Lcom/miui/gallery/editor/photo/core/common/model/FilterData;->icon:I

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;->mPreviewView:Landroid/widget/ImageView;

    iget-object v1, p1, Lcom/miui/gallery/editor/photo/core/common/model/FilterData;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;->mTitleView:Landroid/widget/TextView;

    iget-object p1, p1, Lcom/miui/gallery/editor/photo/core/common/model/FilterData;->name:Ljava/lang/String;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method setForegroundColor(I)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;->mColorDrawable:Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/ColorDrawable;->setColor(I)V

    iget-boolean p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;->mSelected:Z

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;->mColorDrawable:Landroid/graphics/drawable/ColorDrawable;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;->mData:Lcom/miui/gallery/editor/photo/core/common/model/FilterData;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/common/model/FilterData;->isNone()Z

    move-result v0

    if-eqz v0, :cond_0

    const-wide v0, 0x4063200000000000L    # 153.0

    goto :goto_0

    :cond_0
    const-wide v0, 0x406cb00000000000L    # 229.5

    :goto_0
    double-to-int v0, v0

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/ColorDrawable;->setAlpha(I)V

    :cond_1
    const-class p1, Lcom/miui/gallery/editor/ui/view/RoundImageView;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;->mSelector:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/ui/view/RoundImageView;

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;->mSelected:Z

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/ui/view/RoundImageView;->setTopCorner(Z)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;->mSelector:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;->mColorDrawable:Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method setState(ZZ)V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;->mSelector:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;->mSelected:Z

    invoke-virtual {v0}, Landroid/widget/RelativeLayout$LayoutParams;->getRules()[I

    move-result-object v1

    const/16 v2, 0xa

    const/4 v3, 0x6

    const/16 v4, 0x8

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;->mValueIndicator:Landroid/widget/TextView;

    invoke-virtual {p1, v4}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;->mConfigIndicator:Landroid/view/View;

    invoke-virtual {p1, v4}, Landroid/view/View;->setVisibility(I)V

    aget p1, v1, v3

    const p2, 0x7f0902fa

    if-eq p1, p2, :cond_3

    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout$LayoutParams;->removeRule(I)V

    invoke-virtual {v0, v3, p2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    goto :goto_1

    :cond_0
    const/4 p1, 0x0

    if-nez p2, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;->mValueIndicator:Landroid/widget/TextView;

    invoke-virtual {p2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;->mData:Lcom/miui/gallery/editor/photo/core/common/model/FilterData;

    invoke-virtual {p2}, Lcom/miui/gallery/editor/photo/core/common/model/FilterData;->isNone()Z

    move-result p2

    if-nez p2, :cond_2

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;->mConfigIndicator:Landroid/view/View;

    invoke-virtual {p2, p1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_1
    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;->mValueIndicator:Landroid/widget/TextView;

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;->mConfigIndicator:Landroid/view/View;

    invoke-virtual {p1, v4}, Landroid/view/View;->setVisibility(I)V

    :cond_2
    :goto_0
    aget p1, v1, v2

    const/4 p2, -0x1

    if-eq p1, p2, :cond_3

    invoke-virtual {v0, v2, p2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    invoke-virtual {v0, v3}, Landroid/widget/RelativeLayout$LayoutParams;->removeRule(I)V

    :cond_3
    :goto_1
    return-void
.end method

.method updateIndicator(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;->mValueIndicator:Landroid/widget/TextView;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
