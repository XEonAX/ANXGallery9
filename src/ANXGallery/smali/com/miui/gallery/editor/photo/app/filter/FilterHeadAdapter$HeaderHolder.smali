.class public Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter$HeaderHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "FilterHeadAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "HeaderHolder"
.end annotation


# instance fields
.field private mIVState:Landroid/widget/ImageView;

.field private mPercentCircleView:Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;

.field public mTitle:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    const v0, 0x7f09030d

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter$HeaderHolder;->mTitle:Landroid/widget/TextView;

    const v0, 0x7f090194

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter$HeaderHolder;->mIVState:Landroid/widget/ImageView;

    const v0, 0x7f090216

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter$HeaderHolder;->mPercentCircleView:Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;

    return-void
.end method


# virtual methods
.method bind(Lcom/miui/gallery/editor/photo/core/common/model/FilterCategory;)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter$HeaderHolder;->mTitle:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/miui/gallery/editor/photo/core/common/model/FilterCategory;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/common/model/FilterCategory;->getDownloadState()I

    move-result v0

    const/16 v1, 0x8

    if-nez v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter$HeaderHolder;->mIVState:Landroid/widget/ImageView;

    invoke-virtual {p1, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter$HeaderHolder;->mPercentCircleView:Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;

    invoke-virtual {p1, v1}, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->setVisibility(I)V

    goto :goto_0

    :cond_0
    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v0, v2, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter$HeaderHolder;->mIVState:Landroid/widget/ImageView;

    invoke-virtual {p1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter$HeaderHolder;->mIVState:Landroid/widget/ImageView;

    const v0, 0x7f0700fd

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter$HeaderHolder;->mPercentCircleView:Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;

    invoke-virtual {p1, v1}, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->setVisibility(I)V

    goto :goto_0

    :cond_1
    const/4 v2, 0x3

    if-ne v0, v2, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter$HeaderHolder;->mIVState:Landroid/widget/ImageView;

    invoke-virtual {p1, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter$HeaderHolder;->mIVState:Landroid/widget/ImageView;

    const v0, 0x7f0700fe

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter$HeaderHolder;->mPercentCircleView:Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;

    invoke-virtual {p1, v1}, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->setVisibility(I)V

    goto :goto_0

    :cond_2
    const/4 v2, 0x2

    if-ne v0, v2, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter$HeaderHolder;->mIVState:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter$HeaderHolder;->mPercentCircleView:Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;

    invoke-virtual {v0, v3}, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter$HeaderHolder;->mPercentCircleView:Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/common/model/FilterCategory;->getDownloadPercent()F

    move-result p1

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->setPercent(F)V

    :cond_3
    :goto_0
    return-void
.end method
