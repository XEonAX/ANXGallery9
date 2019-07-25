.class Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog$DividerDecoration;
.super Lcom/miui/gallery/agreement/BaseAgreementDialog$BaseDividerDecoration;
.source "PermissionsDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DividerDecoration"
.end annotation


# instance fields
.field private mSectionDividerDrawable:Landroid/graphics/drawable/Drawable;

.field private mSectionDividerHeight:I

.field final synthetic this$0:Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog$DividerDecoration;->this$0:Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog;

    invoke-direct {p0}, Lcom/miui/gallery/agreement/BaseAgreementDialog$BaseDividerDecoration;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog;Lcom/miui/gallery/permission/PermissionsDialogFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog$DividerDecoration;-><init>(Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog;)V

    return-void
.end method

.method private init(Landroid/content/Context;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog$DividerDecoration;->mSectionDividerDrawable:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_0

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lcom/miui/gallery/permission/R$drawable;->section_divider_bg:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog$DividerDecoration;->mSectionDividerDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget v0, Lcom/miui/gallery/permission/R$dimen;->agreement_section_divider_height:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog$DividerDecoration;->mSectionDividerHeight:I

    :cond_0
    return-void
.end method


# virtual methods
.method protected drawSection(Landroid/graphics/Canvas;Landroid/view/View;II)V
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

    iget p2, p0, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog$DividerDecoration;->mSectionDividerHeight:I

    int-to-float p2, p2

    sub-float/2addr v0, p2

    float-to-int p2, v0

    iget v0, p0, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog$DividerDecoration;->mSectionDividerHeight:I

    add-int/2addr v0, p2

    iget-object v1, p0, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog$DividerDecoration;->mSectionDividerDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p3, p2, p4, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object p2, p0, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog$DividerDecoration;->mSectionDividerDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V
    .locals 2

    invoke-virtual {p3, p2}, Landroid/support/v7/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog$DividerDecoration;->init(Landroid/content/Context;)V

    invoke-virtual {p3}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog$PermissionAdapter;

    invoke-static {v1}, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog$PermissionAdapter;->access$300(Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog$PermissionAdapter;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionWrapper;

    invoke-static {v0}, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionWrapper;->access$200(Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionWrapper;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget p2, p0, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog$DividerDecoration;->mSectionDividerHeight:I

    const/4 p3, 0x0

    invoke-virtual {p1, p3, p2, p3, p3}, Landroid/graphics/Rect;->set(IIII)V

    return-void

    :cond_0
    invoke-super {p0, p1, p2, p3, p4}, Lcom/miui/gallery/agreement/BaseAgreementDialog$BaseDividerDecoration;->getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V

    return-void
.end method

.method public onDrawOver(Landroid/graphics/Canvas;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V
    .locals 7

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getChildCount()I

    move-result p3

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getPaddingStart()I

    move-result v0

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getRight()I

    move-result v1

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getPaddingEnd()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog$PermissionAdapter;

    const/4 v3, 0x0

    :goto_0
    if-ge v3, p3, :cond_3

    invoke-virtual {p2, v3}, Landroid/support/v7/widget/RecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    invoke-virtual {p2, v4}, Landroid/support/v7/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_2

    if-lez v5, :cond_0

    invoke-static {v2}, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog$PermissionAdapter;->access$300(Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog$PermissionAdapter;)Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionWrapper;

    invoke-static {v6}, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionWrapper;->access$200(Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionWrapper;)Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-virtual {p0, p1, v4, v0, v1}, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog$DividerDecoration;->drawSection(Landroid/graphics/Canvas;Landroid/view/View;II)V

    goto :goto_2

    :cond_0
    if-nez v5, :cond_1

    move v6, v0

    goto :goto_1

    :cond_1
    iget v6, p0, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog$DividerDecoration;->mPaddingStart:I

    add-int/2addr v6, v0

    :goto_1
    invoke-virtual {p0, p1, v4, v6, v1}, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog$DividerDecoration;->drawTop(Landroid/graphics/Canvas;Landroid/view/View;II)V

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v6

    invoke-virtual {v6}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    if-ne v5, v6, :cond_2

    invoke-virtual {p0, p1, v4, v0, v1}, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog$DividerDecoration;->drawBottom(Landroid/graphics/Canvas;Landroid/view/View;II)V

    :cond_2
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_3
    return-void
.end method
