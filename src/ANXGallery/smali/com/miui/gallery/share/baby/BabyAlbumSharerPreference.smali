.class public Lcom/miui/gallery/share/baby/BabyAlbumSharerPreference;
.super Lcom/miui/gallery/share/GridPreferenceBase;
.source "BabyAlbumSharerPreference.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/share/baby/BabyAlbumSharerPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/share/baby/BabyAlbumSharerPreference;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/share/GridPreferenceBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/share/baby/BabyAlbumSharerPreference;->setSelectable(Z)V

    return-void
.end method


# virtual methods
.method protected getLayoutResourceId()I
    .locals 1

    const v0, 0x7f0b002b

    return v0
.end method

.method protected updateGrid(Landroid/view/View;)V
    .locals 13

    iget-object v0, p0, Lcom/miui/gallery/share/baby/BabyAlbumSharerPreference;->mAdapter:Landroid/widget/ListAdapter;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/share/baby/BabyAlbumSharerPreference;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->getCount()I

    move-result v0

    const v1, 0x7f090120

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    const v2, 0x7f0901e2

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    const/16 v3, 0x8

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->setVisibility(I)V

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->setVisibility(I)V

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_0
    const/4 v7, 0x0

    if-ge v5, v0, :cond_7

    iget-object v8, p0, Lcom/miui/gallery/share/baby/BabyAlbumSharerPreference;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v8, v5}, Landroid/widget/ListAdapter;->getItemViewType(I)I

    move-result v8

    const/4 v9, 0x1

    if-eqz v8, :cond_1

    if-ne v8, v9, :cond_5

    :cond_1
    if-nez v8, :cond_2

    move-object v8, v1

    goto :goto_1

    :cond_2
    move-object v8, v2

    :goto_1
    invoke-virtual {v8, v4}, Landroid/view/ViewGroup;->setVisibility(I)V

    invoke-virtual {v8}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v10

    if-ne v10, v9, :cond_3

    invoke-virtual {v8, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    :cond_3
    iget-object v9, p0, Lcom/miui/gallery/share/baby/BabyAlbumSharerPreference;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v9, v5, v7, v8}, Landroid/widget/ListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v9

    invoke-virtual {p0}, Lcom/miui/gallery/share/baby/BabyAlbumSharerPreference;->getTagInfo()I

    move-result v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    if-nez v7, :cond_4

    invoke-virtual {v8, v9}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object v7, p0, Lcom/miui/gallery/share/baby/BabyAlbumSharerPreference;->mClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v9, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_2

    :cond_4
    if-ne v7, v9, :cond_6

    :goto_2
    add-int/lit8 v6, v6, 0x1

    :cond_5
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_6
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string v0, "convert view must be reused!"

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_7
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0}, Lcom/miui/gallery/share/baby/BabyAlbumSharerPreference;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v5, 0x7f06002e

    invoke-virtual {v2, v5}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v2

    float-to-int v2, v2

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout$LayoutParams;->setMarginEnd(I)V

    const v1, 0x102000a

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/GridLayout;

    iget v2, p0, Lcom/miui/gallery/share/baby/BabyAlbumSharerPreference;->mColumnCount:I

    invoke-virtual {v1, v2}, Landroid/widget/GridLayout;->setColumnCount(I)V

    invoke-virtual {v1}, Landroid/widget/GridLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    iget v5, p0, Lcom/miui/gallery/share/baby/BabyAlbumSharerPreference;->mColumnWidth:I

    iget v8, p0, Lcom/miui/gallery/share/baby/BabyAlbumSharerPreference;->mColumnCount:I

    mul-int v5, v5, v8

    iput v5, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-virtual {v1}, Landroid/widget/GridLayout;->getColumnCount()I

    move-result v2

    if-nez v2, :cond_8

    invoke-virtual {v1}, Landroid/widget/GridLayout;->removeAllViews()V

    return-void

    :cond_8
    invoke-virtual {v1}, Landroid/widget/GridLayout;->getChildCount()I

    move-result v2

    const/4 v5, 0x0

    const/4 v8, 0x0

    :goto_3
    if-ge v5, v0, :cond_d

    iget-object v9, p0, Lcom/miui/gallery/share/baby/BabyAlbumSharerPreference;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v9, v5}, Landroid/widget/ListAdapter;->getItemViewType(I)I

    move-result v9

    const/4 v10, 0x2

    if-ne v9, v10, :cond_c

    invoke-virtual {v1}, Landroid/widget/GridLayout;->getChildCount()I

    move-result v9

    if-ge v9, v8, :cond_9

    invoke-virtual {v1, v8}, Landroid/widget/GridLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v9

    goto :goto_4

    :cond_9
    move-object v9, v7

    :goto_4
    iget-object v10, p0, Lcom/miui/gallery/share/baby/BabyAlbumSharerPreference;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v10, v5, v9, v1}, Landroid/widget/ListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v10

    invoke-virtual {p0}, Lcom/miui/gallery/share/baby/BabyAlbumSharerPreference;->getTagInfo()I

    move-result v11

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v10, v11, v12}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    invoke-virtual {v10}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v11

    iget v12, p0, Lcom/miui/gallery/share/baby/BabyAlbumSharerPreference;->mColumnWidth:I

    iput v12, v11, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-nez v9, :cond_a

    invoke-virtual {v1, v10}, Landroid/widget/GridLayout;->addView(Landroid/view/View;)V

    iget-object v9, p0, Lcom/miui/gallery/share/baby/BabyAlbumSharerPreference;->mClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v10, v9}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_5

    :cond_a
    if-ne v9, v10, :cond_b

    :goto_5
    add-int/lit8 v8, v8, 0x1

    goto :goto_6

    :cond_b
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string v0, "convert view must be reused!"

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_c
    :goto_6
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    :cond_d
    sub-int/2addr v0, v6

    if-ge v0, v2, :cond_e

    sub-int/2addr v2, v0

    invoke-virtual {v1, v0, v2}, Landroid/widget/GridLayout;->removeViews(II)V

    :cond_e
    const v1, 0x7f0900e3

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-lez v6, :cond_10

    if-gtz v0, :cond_f

    goto :goto_7

    :cond_f
    const/4 v3, 0x0

    :cond_10
    :goto_7
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p1}, Landroid/view/View;->requestLayout()V

    return-void
.end method
