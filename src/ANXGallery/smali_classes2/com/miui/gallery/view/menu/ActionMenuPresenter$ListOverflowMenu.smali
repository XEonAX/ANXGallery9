.class Lcom/miui/gallery/view/menu/ActionMenuPresenter$ListOverflowMenu;
.super Ljava/lang/Object;
.source "ActionMenuPresenter.java"

# interfaces
.implements Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenu;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/view/menu/ActionMenuPresenter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ListOverflowMenu"
.end annotation


# instance fields
.field private mListMenuPresenter:Lcom/miui/gallery/view/menu/ListMenuPresenter;

.field final synthetic this$0:Lcom/miui/gallery/view/menu/ActionMenuPresenter;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/view/menu/ActionMenuPresenter;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter$ListOverflowMenu;->this$0:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/view/menu/ActionMenuPresenter;Lcom/miui/gallery/view/menu/ActionMenuPresenter$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/view/menu/ActionMenuPresenter$ListOverflowMenu;-><init>(Lcom/miui/gallery/view/menu/ActionMenuPresenter;)V

    return-void
.end method

.method private getListMenuPresenter(Lcom/miui/gallery/view/menu/MenuBuilder;)Lcom/miui/gallery/view/menu/ListMenuPresenter;
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter$ListOverflowMenu;->mListMenuPresenter:Lcom/miui/gallery/view/menu/ListMenuPresenter;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/view/menu/ListMenuPresenter;

    iget-object v1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter$ListOverflowMenu;->this$0:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    iget-object v1, v1, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter$ListOverflowMenu;->this$0:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    invoke-static {v2}, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->access$400(Lcom/miui/gallery/view/menu/ActionMenuPresenter;)I

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter$ListOverflowMenu;->this$0:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    invoke-static {v3}, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->access$500(Lcom/miui/gallery/view/menu/ActionMenuPresenter;)I

    move-result v3

    invoke-direct {v0, v1, v2, v3}, Lcom/miui/gallery/view/menu/ListMenuPresenter;-><init>(Landroid/content/Context;II)V

    iput-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter$ListOverflowMenu;->mListMenuPresenter:Lcom/miui/gallery/view/menu/ListMenuPresenter;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter$ListOverflowMenu;->mListMenuPresenter:Lcom/miui/gallery/view/menu/ListMenuPresenter;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/view/menu/MenuBuilder;->addMenuPresenter(Lcom/miui/gallery/view/menu/MenuPresenter;)V

    iget-object p1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter$ListOverflowMenu;->mListMenuPresenter:Lcom/miui/gallery/view/menu/ListMenuPresenter;

    return-object p1
.end method


# virtual methods
.method public dismiss(Z)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter$ListOverflowMenu;->this$0:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    iget-object p1, p1, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mMenuView:Lcom/miui/gallery/view/menu/MenuView;

    check-cast p1, Lcom/miui/gallery/view/menu/PhoneActionMenuView;

    invoke-virtual {p1}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->hideOverflowMenu()Z

    return-void
.end method

.method public getOverflowMenuView(Lcom/miui/gallery/view/menu/MenuBuilder;)Landroid/view/View;
    .locals 1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/view/menu/MenuBuilder;->getNonActionItems()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    invoke-direct {p0, p1}, Lcom/miui/gallery/view/menu/ActionMenuPresenter$ListOverflowMenu;->getListMenuPresenter(Lcom/miui/gallery/view/menu/MenuBuilder;)Lcom/miui/gallery/view/menu/ListMenuPresenter;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter$ListOverflowMenu;->this$0:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    iget-object v0, v0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mMenuView:Lcom/miui/gallery/view/menu/MenuView;

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/view/menu/ListMenuPresenter;->getMenuView(Landroid/view/ViewGroup;)Lcom/miui/gallery/view/menu/MenuView;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method public isShowing()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter$ListOverflowMenu;->this$0:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    iget-object v0, v0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mMenuView:Lcom/miui/gallery/view/menu/MenuView;

    check-cast v0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;

    invoke-virtual {v0}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->isOverflowMenuShowing()Z

    move-result v0

    return v0
.end method

.method public tryShow()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter$ListOverflowMenu;->this$0:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    iget-object v0, v0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mMenuView:Lcom/miui/gallery/view/menu/MenuView;

    check-cast v0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;

    invoke-virtual {v0}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->showOverflowMenu()Z

    move-result v0

    return v0
.end method

.method public update(Lcom/miui/gallery/view/menu/MenuBuilder;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter$ListOverflowMenu;->this$0:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    iget-object v0, v0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mMenuView:Lcom/miui/gallery/view/menu/MenuView;

    check-cast v0, Lcom/miui/gallery/view/menu/PhoneActionMenuView;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/view/menu/ActionMenuPresenter$ListOverflowMenu;->getOverflowMenuView(Lcom/miui/gallery/view/menu/MenuBuilder;)Landroid/view/View;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->setOverflowMenuView(Landroid/view/View;)V

    return-void
.end method
