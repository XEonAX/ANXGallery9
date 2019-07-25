.class public Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuTitle;
.super Landroid/widget/LinearLayout;
.source "MoviePreviewMenuTitle.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuTitle$IMenuTitleClickListener;
    }
.end annotation


# instance fields
.field private mListener:Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuTitle$IMenuTitleClickListener;

.field private mLongVideoTitleView:Landroid/widget/TextView;

.field private mShortVideoTitleView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuTitle;->init(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuTitle;->init(Landroid/content/Context;)V

    return-void
.end method

.method private init(Landroid/content/Context;)V
    .locals 1

    const v0, 0x7f0b00bd

    invoke-static {p1, v0, p0}, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuTitle;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuTitle;->mListener:Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuTitle$IMenuTitleClickListener;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f090311

    if-eq p1, v0, :cond_2

    const v0, 0x7f090315

    if-eq p1, v0, :cond_1

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuTitle;->mShortVideoTitleView:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->isSelected()Z

    move-result p1

    if-nez p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuTitle;->mListener:Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuTitle$IMenuTitleClickListener;

    invoke-interface {p1}, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuTitle$IMenuTitleClickListener;->onShortVideoTitleViewClick()V

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuTitle;->updateTitleViewState(Z)V

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuTitle;->mLongVideoTitleView:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->isSelected()Z

    move-result p1

    if-nez p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuTitle;->mListener:Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuTitle$IMenuTitleClickListener;

    invoke-interface {p1}, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuTitle$IMenuTitleClickListener;->onLongVideoTitleViewClick()V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuTitle;->updateTitleViewState(Z)V

    :cond_3
    :goto_0
    return-void
.end method

.method protected onFinishInflate()V
    .locals 1

    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    const v0, 0x7f090315

    invoke-virtual {p0, v0}, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuTitle;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuTitle;->mShortVideoTitleView:Landroid/widget/TextView;

    const v0, 0x7f090311

    invoke-virtual {p0, v0}, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuTitle;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuTitle;->mLongVideoTitleView:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuTitle;->mShortVideoTitleView:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuTitle;->mLongVideoTitleView:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public removeListener()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuTitle;->mListener:Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuTitle$IMenuTitleClickListener;

    return-void
.end method

.method public setListener(Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuTitle$IMenuTitleClickListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuTitle;->mListener:Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuTitle$IMenuTitleClickListener;

    return-void
.end method

.method public updateTitleViewState(Z)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuTitle;->mLongVideoTitleView:Landroid/widget/TextView;

    xor-int/lit8 v1, p1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSelected(Z)V

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/MoviePreviewMenuTitle;->mShortVideoTitleView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setSelected(Z)V

    return-void
.end method
