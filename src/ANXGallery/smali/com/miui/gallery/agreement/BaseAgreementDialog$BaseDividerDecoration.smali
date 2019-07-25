.class public Lcom/miui/gallery/agreement/BaseAgreementDialog$BaseDividerDecoration;
.super Landroid/support/v7/widget/RecyclerView$ItemDecoration;
.source "BaseAgreementDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/agreement/BaseAgreementDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "BaseDividerDecoration"
.end annotation


# instance fields
.field protected mDividerDrawable:Landroid/graphics/drawable/Drawable;

.field protected mDividerHeight:I

.field protected mPaddingStart:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/agreement/BaseAgreementDialog$BaseDividerDecoration;->mPaddingStart:I

    return-void
.end method

.method private init(Landroid/content/Context;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/agreement/BaseAgreementDialog$BaseDividerDecoration;->mDividerDrawable:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_0

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/miui/gallery/permission/R$drawable;->item_divider_bg:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/agreement/BaseAgreementDialog$BaseDividerDecoration;->mDividerDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/miui/gallery/permission/R$dimen;->divider_line_height:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/agreement/BaseAgreementDialog$BaseDividerDecoration;->mDividerHeight:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget v0, Lcom/miui/gallery/permission/R$dimen;->agreement_item_padding_start:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/agreement/BaseAgreementDialog$BaseDividerDecoration;->mPaddingStart:I

    :cond_0
    return-void
.end method


# virtual methods
.method protected drawBottom(Landroid/graphics/Canvas;Landroid/view/View;II)V
    .locals 2

    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    invoke-virtual {p2}, Landroid/view/View;->getBottom()I

    move-result v1

    iget v0, v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;->bottomMargin:I

    add-int/2addr v1, v0

    int-to-float v0, v1

    invoke-virtual {p2}, Landroid/view/View;->getTranslationY()F

    move-result p2

    add-float/2addr v0, p2

    float-to-int p2, v0

    iget v0, p0, Lcom/miui/gallery/agreement/BaseAgreementDialog$BaseDividerDecoration;->mDividerHeight:I

    add-int/2addr v0, p2

    iget-object v1, p0, Lcom/miui/gallery/agreement/BaseAgreementDialog$BaseDividerDecoration;->mDividerDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p3, p2, p4, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object p2, p0, Lcom/miui/gallery/agreement/BaseAgreementDialog$BaseDividerDecoration;->mDividerDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method protected drawTop(Landroid/graphics/Canvas;Landroid/view/View;II)V
    .locals 2

    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result v1

    iget v0, v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;->topMargin:I

    sub-int/2addr v1, v0

    int-to-float v0, v1

    invoke-virtual {p2}, Landroid/view/View;->getTranslationY()F

    move-result p2

    add-float/2addr v0, p2

    iget p2, p0, Lcom/miui/gallery/agreement/BaseAgreementDialog$BaseDividerDecoration;->mDividerHeight:I

    int-to-float p2, p2

    sub-float/2addr v0, p2

    float-to-int p2, v0

    iget v0, p0, Lcom/miui/gallery/agreement/BaseAgreementDialog$BaseDividerDecoration;->mDividerHeight:I

    add-int/2addr v0, p2

    iget-object v1, p0, Lcom/miui/gallery/agreement/BaseAgreementDialog$BaseDividerDecoration;->mDividerDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p3, p2, p4, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object p2, p0, Lcom/miui/gallery/agreement/BaseAgreementDialog$BaseDividerDecoration;->mDividerDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V
    .locals 1

    invoke-virtual {p3}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object p4

    if-eqz p4, :cond_1

    invoke-virtual {p3, p2}, Landroid/support/v7/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result p3

    const/4 v0, -0x1

    if-eq p3, v0, :cond_1

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p0, p2}, Lcom/miui/gallery/agreement/BaseAgreementDialog$BaseDividerDecoration;->init(Landroid/content/Context;)V

    iget p2, p0, Lcom/miui/gallery/agreement/BaseAgreementDialog$BaseDividerDecoration;->mDividerHeight:I

    invoke-virtual {p4}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result p4

    add-int/lit8 p4, p4, -0x1

    const/4 v0, 0x0

    if-ne p3, p4, :cond_0

    iget p3, p0, Lcom/miui/gallery/agreement/BaseAgreementDialog$BaseDividerDecoration;->mDividerHeight:I

    goto :goto_0

    :cond_0
    const/4 p3, 0x0

    :goto_0
    invoke-virtual {p1, v0, p2, v0, p3}, Landroid/graphics/Rect;->set(IIII)V

    :cond_1
    return-void
.end method

.method public onDrawOver(Landroid/graphics/Canvas;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V
    .locals 6

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getChildCount()I

    move-result p3

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getPaddingStart()I

    move-result v0

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getRight()I

    move-result v1

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getPaddingEnd()I

    move-result v2

    sub-int/2addr v1, v2

    const/4 v2, 0x0

    :goto_0
    if-ge v2, p3, :cond_2

    invoke-virtual {p2, v2}, Landroid/support/v7/widget/RecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {p2, v3}, Landroid/support/v7/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_1

    if-nez v4, :cond_0

    move v5, v0

    goto :goto_1

    :cond_0
    iget v5, p0, Lcom/miui/gallery/agreement/BaseAgreementDialog$BaseDividerDecoration;->mPaddingStart:I

    add-int/2addr v5, v0

    :goto_1
    invoke-virtual {p0, p1, v3, v5, v1}, Lcom/miui/gallery/agreement/BaseAgreementDialog$BaseDividerDecoration;->drawTop(Landroid/graphics/Canvas;Landroid/view/View;II)V

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v5

    invoke-virtual {v5}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    if-ne v4, v5, :cond_1

    invoke-virtual {p0, p1, v3, v0, v1}, Lcom/miui/gallery/agreement/BaseAgreementDialog$BaseDividerDecoration;->drawBottom(Landroid/graphics/Canvas;Landroid/view/View;II)V

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method
