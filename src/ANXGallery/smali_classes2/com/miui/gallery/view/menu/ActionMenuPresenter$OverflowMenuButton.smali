.class Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenuButton;
.super Landroid/widget/Button;
.source "ActionMenuPresenter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/view/menu/ActionMenuPresenter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "OverflowMenuButton"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/view/menu/ActionMenuPresenter;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/view/menu/ActionMenuPresenter;Landroid/content/Context;)V
    .locals 2

    iput-object p1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenuButton;->this$0:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    invoke-static {p1}, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->access$200(Lcom/miui/gallery/view/menu/ActionMenuPresenter;)I

    move-result v0

    const/4 v1, 0x0

    invoke-direct {p0, p2, v1, v0}, Landroid/widget/Button;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, 0x1

    invoke-virtual {p0, p2}, Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenuButton;->setClickable(Z)V

    invoke-virtual {p0, p2}, Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenuButton;->setFocusable(Z)V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenuButton;->setVisibility(I)V

    invoke-virtual {p0, p2}, Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenuButton;->setEnabled(Z)V

    invoke-static {p1}, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->access$300(Lcom/miui/gallery/view/menu/ActionMenuPresenter;)Lcom/miui/gallery/view/menu/MenuItemImpl;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/view/menu/MenuItemImpl;->getTitle()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenuButton;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f040003

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result p2

    if-eqz p2, :cond_0

    move-object v1, p1

    :cond_0
    invoke-virtual {p0, v1}, Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenuButton;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenuButton;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private isVisible()Z
    .locals 3

    move-object v0, p0

    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    const/4 v1, 0x0

    instance-of v2, v0, Landroid/view/ViewGroup;

    if-eqz v2, :cond_0

    check-cast v0, Landroid/view/ViewGroup;

    goto :goto_0

    :cond_0
    move-object v0, v1

    goto :goto_0

    :cond_1
    if-nez v0, :cond_2

    const/4 v0, 0x1

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    :goto_1
    return v0
.end method


# virtual methods
.method public performClick()Z
    .locals 4

    invoke-super {p0}, Landroid/widget/Button;->performClick()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenuButton;->isVisible()Z

    move-result v0

    if-nez v0, :cond_1

    return v1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenuButton;->this$0:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    iget-object v0, v0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mMenu:Lcom/miui/gallery/view/menu/MenuBuilder;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenuButton;->this$0:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    iget-object v0, v0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mMenu:Lcom/miui/gallery/view/menu/MenuBuilder;

    iget-object v2, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenuButton;->this$0:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    iget-object v2, v2, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mMenu:Lcom/miui/gallery/view/menu/MenuBuilder;

    invoke-virtual {v2}, Lcom/miui/gallery/view/menu/MenuBuilder;->getRootMenu()Lcom/miui/gallery/view/menu/MenuBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenuButton;->this$0:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    invoke-static {v3}, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->access$300(Lcom/miui/gallery/view/menu/ActionMenuPresenter;)Lcom/miui/gallery/view/menu/MenuItemImpl;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/miui/gallery/view/menu/MenuBuilder;->dispatchMenuItemSelected(Lcom/miui/gallery/view/menu/MenuBuilder;Landroid/view/MenuItem;)Z

    :cond_2
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenuButton;->playSoundEffect(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenuButton;->isSelected()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenuButton;->this$0:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->hideOverflowMenu(Z)Z

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenuButton;->this$0:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    invoke-virtual {v0}, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->showOverflowMenu()Z

    :goto_0
    return v1
.end method
