.class public Lcom/miui/gallery/view/menu/ActionMenuItemView;
.super Landroid/widget/Button;
.source "ActionMenuItemView.java"

# interfaces
.implements Lcom/miui/gallery/view/menu/MenuView$ItemView;


# instance fields
.field private mIsCheckable:Z

.field private mItemData:Lcom/miui/gallery/view/menu/MenuItemImpl;

.field private mItemInvoker:Lcom/miui/gallery/view/menu/MenuBuilder$ItemInvoker;

.field private final mWithText:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/miui/gallery/view/menu/ActionMenuItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/view/menu/ActionMenuItemView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/Button;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-virtual {p0}, Lcom/miui/gallery/view/menu/ActionMenuItemView;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f040003

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result p1

    iput-boolean p1, p0, Lcom/miui/gallery/view/menu/ActionMenuItemView;->mWithText:Z

    return-void
.end method

.method private tagById(I)V
    .locals 0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/view/menu/ActionMenuItemView;->setTag(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public getItemData()Lcom/miui/gallery/view/menu/MenuItemImpl;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuItemView;->mItemData:Lcom/miui/gallery/view/menu/MenuItemImpl;

    return-object v0
.end method

.method public initialize(Lcom/miui/gallery/view/menu/MenuItemImpl;I)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/view/menu/ActionMenuItemView;->mItemData:Lcom/miui/gallery/view/menu/MenuItemImpl;

    const/4 p2, 0x0

    invoke-virtual {p0, p2}, Lcom/miui/gallery/view/menu/ActionMenuItemView;->setSelected(Z)V

    invoke-virtual {p1}, Lcom/miui/gallery/view/menu/MenuItemImpl;->getTitle()Ljava/lang/CharSequence;

    move-result-object p2

    invoke-virtual {p0, p2}, Lcom/miui/gallery/view/menu/ActionMenuItemView;->setTitle(Ljava/lang/CharSequence;)V

    invoke-virtual {p1}, Lcom/miui/gallery/view/menu/MenuItemImpl;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-virtual {p0, p2}, Lcom/miui/gallery/view/menu/ActionMenuItemView;->setIcon(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p1}, Lcom/miui/gallery/view/menu/MenuItemImpl;->isCheckable()Z

    move-result p2

    invoke-virtual {p0, p2}, Lcom/miui/gallery/view/menu/ActionMenuItemView;->setCheckable(Z)V

    invoke-virtual {p1}, Lcom/miui/gallery/view/menu/MenuItemImpl;->isChecked()Z

    move-result p2

    invoke-virtual {p0, p2}, Lcom/miui/gallery/view/menu/ActionMenuItemView;->setChecked(Z)V

    invoke-virtual {p1}, Lcom/miui/gallery/view/menu/MenuItemImpl;->isEnabled()Z

    move-result p2

    invoke-virtual {p0, p2}, Lcom/miui/gallery/view/menu/ActionMenuItemView;->setEnabled(Z)V

    const/4 p2, 0x1

    invoke-virtual {p0, p2}, Lcom/miui/gallery/view/menu/ActionMenuItemView;->setClickable(Z)V

    invoke-virtual {p1}, Lcom/miui/gallery/view/menu/MenuItemImpl;->getItemId()I

    move-result p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/view/menu/ActionMenuItemView;->tagById(I)V

    return-void
.end method

.method public performClick()Z
    .locals 4

    invoke-super {p0}, Landroid/widget/Button;->performClick()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuItemView;->mItemInvoker:Lcom/miui/gallery/view/menu/MenuBuilder$ItemInvoker;

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuItemView;->mItemInvoker:Lcom/miui/gallery/view/menu/MenuBuilder$ItemInvoker;

    iget-object v3, p0, Lcom/miui/gallery/view/menu/ActionMenuItemView;->mItemData:Lcom/miui/gallery/view/menu/MenuItemImpl;

    invoke-interface {v0, v3}, Lcom/miui/gallery/view/menu/MenuBuilder$ItemInvoker;->invokeItem(Lcom/miui/gallery/view/menu/MenuItemImpl;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0, v2}, Lcom/miui/gallery/view/menu/ActionMenuItemView;->playSoundEffect(I)V

    return v1

    :cond_1
    return v2
.end method

.method public prefersCondensedTitle()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public setCheckable(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/view/menu/ActionMenuItemView;->mIsCheckable:Z

    return-void
.end method

.method public setChecked(Z)V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/view/menu/ActionMenuItemView;->mIsCheckable:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/view/menu/ActionMenuItemView;->setSelected(Z)V

    :cond_0
    return-void
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/view/menu/ActionMenuItemView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x1

    aget-object v0, v0, v1

    if-eq v0, p1, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1, v0, v0}, Lcom/miui/gallery/view/menu/ActionMenuItemView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    :cond_0
    return-void
.end method

.method public setItemInvoker(Lcom/miui/gallery/view/menu/MenuBuilder$ItemInvoker;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/view/menu/ActionMenuItemView;->mItemInvoker:Lcom/miui/gallery/view/menu/MenuBuilder$ItemInvoker;

    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/view/menu/ActionMenuItemView;->mWithText:Z

    if-eqz v0, :cond_0

    move-object v0, p1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0, v0}, Lcom/miui/gallery/view/menu/ActionMenuItemView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/view/menu/ActionMenuItemView;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method
