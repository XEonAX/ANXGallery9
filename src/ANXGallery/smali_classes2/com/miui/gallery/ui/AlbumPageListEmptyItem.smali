.class public Lcom/miui/gallery/ui/AlbumPageListEmptyItem;
.super Landroid/widget/RelativeLayout;
.source "AlbumPageListEmptyItem.java"


# instance fields
.field private mIsFirstLayout:Z

.field private mTextContainer:Landroid/view/ViewGroup;

.field private mTextVerticalPercent:F

.field private mTextView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/ui/AlbumPageListEmptyItem;->mIsFirstLayout:Z

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumPageListEmptyItem;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const/high16 v0, 0x7f080000

    invoke-virtual {p2, v0, p1, p1}, Landroid/content/res/Resources;->getFraction(III)F

    move-result p1

    iput p1, p0, Lcom/miui/gallery/ui/AlbumPageListEmptyItem;->mTextVerticalPercent:F

    return-void
.end method


# virtual methods
.method protected onFinishInflate()V
    .locals 2

    invoke-super {p0}, Landroid/widget/RelativeLayout;->onFinishInflate()V

    const v0, 0x7f0902d6

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/AlbumPageListEmptyItem;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/ui/AlbumPageListEmptyItem;->mTextView:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageListEmptyItem;->mTextView:Landroid/widget/TextView;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageListEmptyItem;->mTextView:Landroid/widget/TextView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumPageListEmptyItem;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumPageListEmptyItem;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumPageListEmptyItem;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/miui/gallery/ui/AlbumPageListEmptyItem;->mTextContainer:Landroid/view/ViewGroup;

    :cond_0
    invoke-static {}, Lcom/miui/gallery/BaseConfig$ScreenConfig;->getScreenHeight()I

    move-result v0

    invoke-static {}, Lcom/miui/gallery/BaseConfig$ScreenConfig;->getScreenWidth()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/AlbumPageListEmptyItem;->setMinimumHeight(I)V

    return-void

    :cond_1
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "textView shouldn\'t be null!"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected onLayout(ZIIII)V
    .locals 3

    invoke-super/range {p0 .. p5}, Landroid/widget/RelativeLayout;->onLayout(ZIIII)V

    iget-boolean p2, p0, Lcom/miui/gallery/ui/AlbumPageListEmptyItem;->mIsFirstLayout:Z

    if-nez p2, :cond_0

    if-eqz p1, :cond_4

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumPageListEmptyItem;->mTextView:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getVisibility()I

    move-result p1

    const/4 p2, 0x0

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumPageListEmptyItem;->mTextView:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumPageListEmptyItem;->mTextContainer:Landroid/view/ViewGroup;

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumPageListEmptyItem;->mTextContainer:Landroid/view/ViewGroup;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getMeasuredHeight()I

    move-result p1

    sub-int/2addr p1, p3

    const/4 p4, 0x0

    iget-object p5, p0, Lcom/miui/gallery/ui/AlbumPageListEmptyItem;->mTextContainer:Landroid/view/ViewGroup;

    invoke-virtual {p5}, Landroid/view/ViewGroup;->getTranslationY()F

    move-result p5

    invoke-static {p4, p5}, Ljava/lang/Math;->max(FF)F

    move-result p4

    float-to-int p4, p4

    sub-int/2addr p1, p4

    int-to-float p4, p1

    iget p5, p0, Lcom/miui/gallery/ui/AlbumPageListEmptyItem;->mTextVerticalPercent:F

    mul-float p4, p4, p5

    float-to-int p4, p4

    iget-object p5, p0, Lcom/miui/gallery/ui/AlbumPageListEmptyItem;->mTextView:Landroid/widget/TextView;

    invoke-virtual {p5}, Landroid/widget/TextView;->getVisibility()I

    move-result p5

    const/16 v0, 0x8

    if-eq p5, v0, :cond_2

    iget-object p5, p0, Lcom/miui/gallery/ui/AlbumPageListEmptyItem;->mTextView:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageListEmptyItem;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getLeft()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumPageListEmptyItem;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getRight()I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/ui/AlbumPageListEmptyItem;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getHeight()I

    move-result v2

    add-int/2addr v2, p4

    invoke-virtual {p5, v0, p4, v1, v2}, Landroid/widget/TextView;->layout(IIII)V

    :cond_2
    add-int/2addr p3, p1

    invoke-virtual {p0, p3}, Lcom/miui/gallery/ui/AlbumPageListEmptyItem;->setBottom(I)V

    :cond_3
    iput-boolean p2, p0, Lcom/miui/gallery/ui/AlbumPageListEmptyItem;->mIsFirstLayout:Z

    :cond_4
    return-void
.end method

.method public setTextContainer(Landroid/view/ViewGroup;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/AlbumPageListEmptyItem;->mTextContainer:Landroid/view/ViewGroup;

    return-void
.end method
