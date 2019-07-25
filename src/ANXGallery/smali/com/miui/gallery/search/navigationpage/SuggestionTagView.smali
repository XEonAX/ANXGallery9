.class public Lcom/miui/gallery/search/navigationpage/SuggestionTagView;
.super Landroid/widget/LinearLayout;
.source "SuggestionTagView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/search/navigationpage/SuggestionTagView$SuggestionTagViewAdapter;
    }
.end annotation


# instance fields
.field private mAdapter:Lcom/miui/gallery/search/navigationpage/SuggestionTagView$SuggestionTagViewAdapter;

.field private mAdapterObserver:Landroid/database/DataSetObserver;

.field private mHorizontalMargin:I

.field private mInvalid:Z

.field private mItemLayoutParam:Landroid/widget/LinearLayout$LayoutParams;

.field private mMaxLines:I

.field private mRowLayoutParam:Landroid/widget/LinearLayout$LayoutParams;

.field private mVerticalMargin:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mInvalid:Z

    new-instance v0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/search/navigationpage/SuggestionTagView$1;-><init>(Lcom/miui/gallery/search/navigationpage/SuggestionTagView;)V

    iput-object v0, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mAdapterObserver:Landroid/database/DataSetObserver;

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->initView(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/search/navigationpage/SuggestionTagView;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->onAdapterChanged()V

    return-void
.end method

.method private changeToNewLine()Landroid/widget/LinearLayout;
    .locals 2

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mRowLayoutParam:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method private getFillWidth(I)I
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->getPaddingLeft()I

    move-result v0

    sub-int/2addr p1, v0

    invoke-virtual {p0}, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->getPaddingRight()I

    move-result v0

    sub-int/2addr p1, v0

    return p1
.end method

.method private getItemMeasuredWidth(Landroid/view/View;)I
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p1, v0, v0}, Landroid/view/View;->measure(II)V

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result p1

    iget v0, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mHorizontalMargin:I

    add-int/2addr p1, v0

    return p1
.end method

.method private initView(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->setOrientation(I)V

    sget-object v1, Lcom/miui/gallery/R$styleable;->SuggestionTagView:[I

    const/4 v2, 0x0

    invoke-virtual {p1, p2, v1, p3, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, v0, p2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p3

    float-to-int p3, p3

    iput p3, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mHorizontalMargin:I

    const/4 p3, 0x2

    invoke-virtual {p1, p3, p2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p2

    float-to-int p2, p2

    iput p2, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mVerticalMargin:I

    const p2, 0x7fffffff

    invoke-virtual {p1, v2, p2}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result p2

    iput p2, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mMaxLines:I

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 p2, -0x2

    const/4 p3, -0x1

    invoke-direct {p1, p3, p2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iput-object p1, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mRowLayoutParam:Landroid/widget/LinearLayout$LayoutParams;

    iget-object p1, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mRowLayoutParam:Landroid/widget/LinearLayout$LayoutParams;

    iget p3, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mVerticalMargin:I

    invoke-virtual {p1, v2, v2, v2, p3}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p1, p2, p2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    iput-object p1, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mItemLayoutParam:Landroid/widget/LinearLayout$LayoutParams;

    iget-object p1, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mItemLayoutParam:Landroid/widget/LinearLayout$LayoutParams;

    iget p2, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mHorizontalMargin:I

    invoke-virtual {p1, v2, v2, p2, v2}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    return-void
.end method

.method private layoutTags(I)V
    .locals 12

    invoke-virtual {p0}, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->removeAllViews()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mInvalid:Z

    iget v1, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mMaxLines:I

    if-lez v1, :cond_10

    iget-object v1, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mAdapter:Lcom/miui/gallery/search/navigationpage/SuggestionTagView$SuggestionTagViewAdapter;

    if-nez v1, :cond_0

    goto/16 :goto_8

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mAdapter:Lcom/miui/gallery/search/navigationpage/SuggestionTagView$SuggestionTagViewAdapter;

    invoke-interface {v1}, Lcom/miui/gallery/search/navigationpage/SuggestionTagView$SuggestionTagViewAdapter;->isFixedMoreItem()Z

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mAdapter:Lcom/miui/gallery/search/navigationpage/SuggestionTagView$SuggestionTagViewAdapter;

    invoke-interface {v2}, Lcom/miui/gallery/search/navigationpage/SuggestionTagView$SuggestionTagViewAdapter;->getCount()I

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mAdapter:Lcom/miui/gallery/search/navigationpage/SuggestionTagView$SuggestionTagViewAdapter;

    invoke-interface {v3}, Lcom/miui/gallery/search/navigationpage/SuggestionTagView$SuggestionTagViewAdapter;->hasMoreItem()Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mAdapter:Lcom/miui/gallery/search/navigationpage/SuggestionTagView$SuggestionTagViewAdapter;

    invoke-interface {v3, v4, p0}, Lcom/miui/gallery/search/navigationpage/SuggestionTagView$SuggestionTagViewAdapter;->getMoreItemView(Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    goto :goto_0

    :cond_1
    move-object v3, v4

    :goto_0
    if-eqz v3, :cond_2

    invoke-direct {p0, v3}, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->getItemMeasuredWidth(Landroid/view/View;)I

    move-result v5

    goto :goto_1

    :cond_2
    const/4 v5, 0x0

    :goto_1
    iget v6, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mMaxLines:I

    add-int/lit8 v6, v6, -0x1

    if-nez v6, :cond_3

    if-eqz v3, :cond_3

    move v6, v5

    goto :goto_2

    :cond_3
    const/4 v6, 0x0

    :goto_2
    move-object v8, v4

    const/4 v7, 0x0

    :goto_3
    if-ge v0, v2, :cond_b

    iget-object v9, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mAdapter:Lcom/miui/gallery/search/navigationpage/SuggestionTagView$SuggestionTagViewAdapter;

    invoke-interface {v9, v0, v4, p0}, Lcom/miui/gallery/search/navigationpage/SuggestionTagView$SuggestionTagViewAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v9

    invoke-direct {p0, v9}, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->getItemMeasuredWidth(Landroid/view/View;)I

    move-result v10

    add-int/2addr v6, v10

    if-le v6, p1, :cond_9

    add-int/lit8 v7, v7, 0x1

    iget v11, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mMaxLines:I

    if-lt v7, v11, :cond_5

    if-eqz v3, :cond_4

    add-int/lit8 v10, v2, -0x1

    if-ne v0, v10, :cond_4

    if-nez v1, :cond_4

    sub-int v10, v6, v5

    if-gt v10, p1, :cond_4

    iget-object v3, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mItemLayoutParam:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v8, v9, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    move-object v3, v4

    goto :goto_7

    :cond_4
    add-int/lit8 v0, v0, -0x1

    goto :goto_7

    :cond_5
    invoke-direct {p0}, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->changeToNewLine()Landroid/widget/LinearLayout;

    move-result-object v8

    iget v6, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mMaxLines:I

    add-int/lit8 v6, v6, -0x1

    if-ne v7, v6, :cond_8

    if-eqz v3, :cond_8

    add-int/2addr v10, v5

    if-gt v10, p1, :cond_6

    iget-object v6, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mItemLayoutParam:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v8, v9, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_5

    :cond_6
    add-int/lit8 v6, v2, -0x1

    if-ne v0, v6, :cond_7

    if-nez v1, :cond_7

    iget-object v3, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mItemLayoutParam:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v8, v9, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    move-object v3, v4

    goto :goto_4

    :cond_7
    add-int/lit8 v0, v0, -0x1

    :goto_4
    move v6, v5

    goto :goto_7

    :cond_8
    iget-object v6, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mItemLayoutParam:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v8, v9, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :goto_5
    move v6, v10

    goto :goto_6

    :cond_9
    if-nez v8, :cond_a

    invoke-direct {p0}, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->changeToNewLine()Landroid/widget/LinearLayout;

    move-result-object v8

    :cond_a
    iget-object v10, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mItemLayoutParam:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v8, v9, v10}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :goto_6
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    :cond_b
    :goto_7
    if-eqz v3, :cond_f

    if-eqz v1, :cond_d

    if-eqz v8, :cond_c

    iget v4, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mMaxLines:I

    add-int/lit8 v4, v4, -0x1

    if-ge v7, v4, :cond_d

    add-int/2addr v6, v5

    if-le v6, p1, :cond_d

    :cond_c
    invoke-direct {p0}, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->changeToNewLine()Landroid/widget/LinearLayout;

    move-result-object v8

    :cond_d
    if-nez v1, :cond_e

    add-int/lit8 v2, v2, -0x1

    if-ge v0, v2, :cond_f

    :cond_e
    iget-object p1, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mItemLayoutParam:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v8, v3, p1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_f
    return-void

    :cond_10
    :goto_8
    return-void
.end method

.method private onAdapterChanged()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mInvalid:Z

    invoke-virtual {p0}, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->requestLayout()V

    return-void
.end method


# virtual methods
.method public getAdapter()Landroid/widget/Adapter;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mAdapter:Lcom/miui/gallery/search/navigationpage/SuggestionTagView$SuggestionTagViewAdapter;

    return-object v0
.end method

.method protected onMeasure(II)V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mInvalid:Z

    if-eqz v0, :cond_0

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->getFillWidth(I)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->layoutTags(I)V

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    return-void
.end method

.method public setAdapter(Lcom/miui/gallery/search/navigationpage/SuggestionTagView$SuggestionTagViewAdapter;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mAdapter:Lcom/miui/gallery/search/navigationpage/SuggestionTagView$SuggestionTagViewAdapter;

    if-eq v0, p1, :cond_1

    iput-object p1, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mAdapter:Lcom/miui/gallery/search/navigationpage/SuggestionTagView$SuggestionTagViewAdapter;

    iget-object p1, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mAdapter:Lcom/miui/gallery/search/navigationpage/SuggestionTagView$SuggestionTagViewAdapter;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mAdapter:Lcom/miui/gallery/search/navigationpage/SuggestionTagView$SuggestionTagViewAdapter;

    iget-object v0, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mAdapterObserver:Landroid/database/DataSetObserver;

    invoke-interface {p1, v0}, Lcom/miui/gallery/search/navigationpage/SuggestionTagView$SuggestionTagViewAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->onAdapterChanged()V

    :cond_1
    return-void
.end method

.method public setMaxLines(I)V
    .locals 1

    iget v0, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mMaxLines:I

    if-eq p1, v0, :cond_0

    iput p1, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mMaxLines:I

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->mInvalid:Z

    invoke-virtual {p0}, Lcom/miui/gallery/search/navigationpage/SuggestionTagView;->requestLayout()V

    :cond_0
    return-void
.end method
