.class public Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;
.super Landroid/support/v7/widget/RecyclerView$ItemDecoration;
.source "SectionedSuggestionItemDecoration.java"


# instance fields
.field mAdapter:Lcom/miui/gallery/search/core/display/SectionedSuggestionAdapter;

.field private mBottomLineDividerColor:I

.field mContext:Landroid/content/Context;

.field private mDrawBottomLine:Z

.field private mDrawLineBetweenSectionItems:Z

.field private mLineDividerHeight:I

.field mPaint:Landroid/graphics/Paint;

.field private mSectionDividerColor:I

.field private mSectionDividerHeight:I

.field private mSectionInnerDividerStartMargin:I

.field private mTopLineDividerColor:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/miui/gallery/search/core/display/SectionedSuggestionAdapter;ZIZ)V
    .locals 1

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mDrawLineBetweenSectionItems:Z

    iput-boolean v0, p0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mDrawBottomLine:Z

    iput-object p1, p0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mAdapter:Lcom/miui/gallery/search/core/display/SectionedSuggestionAdapter;

    new-instance p2, Landroid/graphics/Paint;

    invoke-direct {p2}, Landroid/graphics/Paint;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f060432

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iput p2, p0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mSectionDividerHeight:I

    const p2, 0x7f06041d

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iput p2, p0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mLineDividerHeight:I

    const p2, 0x7f050138

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mBottomLineDividerColor:I

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getColor(I)I

    move-result p2

    iput p2, p0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mTopLineDividerColor:I

    const p2, 0x7f050137

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mSectionDividerColor:I

    iput-boolean p3, p0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mDrawLineBetweenSectionItems:Z

    iput p4, p0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mSectionInnerDividerStartMargin:I

    iput-boolean p5, p0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mDrawBottomLine:Z

    return-void
.end method

.method private drawDivider(Landroid/graphics/Canvas;Landroid/view/View;III)V
    .locals 15

    move-object v0, p0

    move/from16 v2, p5

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getTop()I

    move-result v4

    iget v5, v3, Landroid/support/v7/widget/RecyclerView$LayoutParams;->topMargin:I

    sub-int/2addr v4, v5

    and-int/lit8 v5, p3, 0x1

    if-eqz v5, :cond_0

    iget v5, v0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mSectionDividerHeight:I

    sub-int v5, v4, v5

    iget-object v6, v0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mPaint:Landroid/graphics/Paint;

    sget-object v7, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v6, v0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mPaint:Landroid/graphics/Paint;

    iget v7, v0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mSectionDividerColor:I

    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setColor(I)V

    move/from16 v6, p4

    int-to-float v12, v6

    int-to-float v8, v5

    int-to-float v13, v2

    int-to-float v14, v4

    iget-object v11, v0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v6, p1

    move v7, v12

    move v9, v13

    move v10, v14

    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    iget-object v6, v0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mPaint:Landroid/graphics/Paint;

    sget-object v7, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v6, v0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mPaint:Landroid/graphics/Paint;

    iget v7, v0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mLineDividerHeight:I

    int-to-float v7, v7

    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v6, v0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mPaint:Landroid/graphics/Paint;

    iget v7, v0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mBottomLineDividerColor:I

    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setColor(I)V

    iget v6, v0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mLineDividerHeight:I

    sub-int v6, v5, v6

    int-to-float v8, v6

    iget v6, v0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mLineDividerHeight:I

    sub-int/2addr v5, v6

    int-to-float v10, v5

    iget-object v11, v0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v6, p1

    move v7, v12

    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    iget-object v5, v0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mPaint:Landroid/graphics/Paint;

    iget v6, v0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mTopLineDividerColor:I

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v11, v0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v6, p1

    move v8, v14

    move v10, v14

    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    :cond_0
    and-int/lit8 v5, p3, 0x2

    if-eqz v5, :cond_1

    iget-object v5, v0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mPaint:Landroid/graphics/Paint;

    sget-object v6, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v5, v0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mPaint:Landroid/graphics/Paint;

    iget v6, v0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mBottomLineDividerColor:I

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setColor(I)V

    iget v5, v0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mSectionInnerDividerStartMargin:I

    int-to-float v7, v5

    iget v5, v0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mLineDividerHeight:I

    add-int/2addr v5, v4

    int-to-float v8, v5

    int-to-float v9, v2

    iget v5, v0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mLineDividerHeight:I

    add-int/2addr v4, v5

    int-to-float v10, v4

    iget-object v11, v0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v6, p1

    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    :cond_1
    and-int/lit8 v1, p3, 0x4

    if-eqz v1, :cond_2

    invoke-virtual/range {p2 .. p2}, Landroid/view/View;->getBottom()I

    move-result v1

    iget v3, v3, Landroid/support/v7/widget/RecyclerView$LayoutParams;->bottomMargin:I

    add-int/2addr v1, v3

    iget-object v3, v0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mPaint:Landroid/graphics/Paint;

    sget-object v4, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v3, v0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mPaint:Landroid/graphics/Paint;

    iget v4, v0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mBottomLineDividerColor:I

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    const/4 v6, 0x0

    iget v3, v0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mLineDividerHeight:I

    sub-int v3, v1, v3

    int-to-float v7, v3

    int-to-float v8, v2

    iget v2, v0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mLineDividerHeight:I

    sub-int/2addr v1, v2

    int-to-float v9, v1

    iget-object v10, v0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v5, p1

    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    :cond_2
    return-void
.end method

.method private isSectionHeader([I)Z
    .locals 4

    const/4 v0, 0x1

    aget v1, p1, v0

    const/4 v2, 0x0

    const/4 v3, -0x1

    if-ne v1, v3, :cond_0

    aget p1, p1, v2

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V
    .locals 0

    iget-object p4, p0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mAdapter:Lcom/miui/gallery/search/core/display/SectionedSuggestionAdapter;

    invoke-virtual {p3, p2}, Landroid/support/v7/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result p2

    invoke-virtual {p4, p2}, Lcom/miui/gallery/search/core/display/SectionedSuggestionAdapter;->getInnerItemPosition(I)I

    move-result p2

    const/4 p3, 0x0

    if-ltz p2, :cond_1

    iget-object p4, p0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mAdapter:Lcom/miui/gallery/search/core/display/SectionedSuggestionAdapter;

    invoke-virtual {p4}, Lcom/miui/gallery/search/core/display/SectionedSuggestionAdapter;->getInnerItemViewCount()I

    move-result p4

    if-ge p2, p4, :cond_1

    iget-object p4, p0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mAdapter:Lcom/miui/gallery/search/core/display/SectionedSuggestionAdapter;

    invoke-virtual {p4, p2}, Lcom/miui/gallery/search/core/display/SectionedSuggestionAdapter;->getIndexes(I)[I

    move-result-object p2

    invoke-direct {p0, p2}, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->isSectionHeader([I)Z

    move-result p2

    if-eqz p2, :cond_0

    iget p2, p0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mSectionDividerHeight:I

    invoke-virtual {p1, p3, p2, p3, p3}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0

    :cond_0
    invoke-virtual {p1, p3, p3, p3, p3}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0

    :cond_1
    invoke-virtual {p1, p3, p3, p3, p3}, Landroid/graphics/Rect;->set(IIII)V

    :goto_0
    return-void
.end method

.method public onDrawOver(Landroid/graphics/Canvas;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V
    .locals 10

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getPaddingLeft()I

    move-result p3

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getWidth()I

    move-result v0

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getPaddingRight()I

    move-result v1

    sub-int v6, v0, v1

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getChildCount()I

    move-result v7

    const/4 v8, 0x0

    const/4 v9, 0x0

    :goto_0
    if-ge v9, v7, :cond_4

    invoke-virtual {p2, v9}, Landroid/support/v7/widget/RecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mAdapter:Lcom/miui/gallery/search/core/display/SectionedSuggestionAdapter;

    invoke-virtual {p2, v2}, Landroid/support/v7/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/search/core/display/SectionedSuggestionAdapter;->getInnerItemPosition(I)I

    move-result v0

    if-ltz v0, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mAdapter:Lcom/miui/gallery/search/core/display/SectionedSuggestionAdapter;

    invoke-virtual {v1}, Lcom/miui/gallery/search/core/display/SectionedSuggestionAdapter;->getInnerItemViewCount()I

    move-result v1

    if-ge v0, v1, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mAdapter:Lcom/miui/gallery/search/core/display/SectionedSuggestionAdapter;

    invoke-virtual {v1, v0}, Lcom/miui/gallery/search/core/display/SectionedSuggestionAdapter;->getIndexes(I)[I

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->isSectionHeader([I)Z

    move-result v1

    const/4 v3, 0x1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_1

    :cond_0
    if-eqz v0, :cond_1

    iget-boolean v1, p0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mDrawLineBetweenSectionItems:Z

    if-eqz v1, :cond_1

    const/4 v1, 0x2

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    :goto_1
    iget-boolean v4, p0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mDrawBottomLine:Z

    if-eqz v4, :cond_2

    iget-object v4, p0, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->mAdapter:Lcom/miui/gallery/search/core/display/SectionedSuggestionAdapter;

    invoke-virtual {v4}, Lcom/miui/gallery/search/core/display/SectionedSuggestionAdapter;->getInnerItemViewCount()I

    move-result v4

    sub-int/2addr v4, v3

    if-ne v0, v4, :cond_2

    or-int/lit8 v0, v1, 0x4

    move v3, v0

    goto :goto_2

    :cond_2
    move v3, v1

    :goto_2
    move-object v0, p0

    move-object v1, p1

    move v4, p3

    move v5, v6

    invoke-direct/range {v0 .. v5}, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;->drawDivider(Landroid/graphics/Canvas;Landroid/view/View;III)V

    :cond_3
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    :cond_4
    return-void
.end method
