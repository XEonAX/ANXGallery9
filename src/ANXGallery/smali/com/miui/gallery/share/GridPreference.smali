.class public Lcom/miui/gallery/share/GridPreference;
.super Lcom/miui/gallery/share/GridPreferenceBase;
.source "GridPreference.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/share/GridPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/share/GridPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/share/GridPreferenceBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method protected getLayoutResourceId()I
    .locals 1

    const v0, 0x7f0b015a

    return v0
.end method

.method protected updateGrid(Landroid/view/View;)V
    .locals 7

    const v0, 0x102000a

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/GridLayout;

    iget v0, p0, Lcom/miui/gallery/share/GridPreference;->mColumnCount:I

    invoke-virtual {p1, v0}, Landroid/widget/GridLayout;->setColumnCount(I)V

    iget-object v0, p0, Lcom/miui/gallery/share/GridPreference;->mAdapter:Landroid/widget/ListAdapter;

    if-eqz v0, :cond_5

    invoke-virtual {p1}, Landroid/widget/GridLayout;->getColumnCount()I

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_2

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/share/GridPreference;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->getCount()I

    move-result v0

    invoke-virtual {p1}, Landroid/widget/GridLayout;->getChildCount()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v2

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_2

    invoke-virtual {p1, v3}, Landroid/widget/GridLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    iget-object v5, p0, Lcom/miui/gallery/share/GridPreference;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v5, v3, v4, p1}, Landroid/widget/ListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    if-ne v4, v5, :cond_1

    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    iget v6, p0, Lcom/miui/gallery/share/GridPreference;->mColumnWidth:I

    iput v6, v5, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-virtual {p0}, Lcom/miui/gallery/share/GridPreference;->getTagInfo()I

    move-result v5

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string v0, "convert view must be reused!"

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    :goto_1
    if-ge v3, v0, :cond_3

    iget-object v2, p0, Lcom/miui/gallery/share/GridPreference;->mAdapter:Landroid/widget/ListAdapter;

    const/4 v4, 0x0

    invoke-interface {v2, v3, v4, p1}, Landroid/widget/ListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/widget/GridLayout;->addView(Landroid/view/View;)V

    iget-object v4, p0, Lcom/miui/gallery/share/GridPreference;->mClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v2, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lcom/miui/gallery/share/GridPreference;->getTagInfo()I

    move-result v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    iget v4, p0, Lcom/miui/gallery/share/GridPreference;->mColumnWidth:I

    iput v4, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_3
    if-ge v3, v1, :cond_4

    sub-int/2addr v1, v3

    invoke-virtual {p1, v3, v1}, Landroid/widget/GridLayout;->removeViews(II)V

    :cond_4
    invoke-virtual {p1}, Landroid/widget/GridLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iget v1, p0, Lcom/miui/gallery/share/GridPreference;->mColumnWidth:I

    iget v2, p0, Lcom/miui/gallery/share/GridPreference;->mColumnCount:I

    mul-int v1, v1, v2

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-virtual {p1}, Landroid/widget/GridLayout;->requestLayout()V

    return-void

    :cond_5
    :goto_2
    invoke-virtual {p1}, Landroid/widget/GridLayout;->removeAllViews()V

    return-void
.end method
