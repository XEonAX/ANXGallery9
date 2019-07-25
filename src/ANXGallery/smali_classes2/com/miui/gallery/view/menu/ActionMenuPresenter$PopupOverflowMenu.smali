.class Lcom/miui/gallery/view/menu/ActionMenuPresenter$PopupOverflowMenu;
.super Lcom/miui/gallery/view/menu/MenuPopupHelper;
.source "ActionMenuPresenter.java"

# interfaces
.implements Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenu;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/view/menu/ActionMenuPresenter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PopupOverflowMenu"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/view/menu/ActionMenuPresenter;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/view/menu/ActionMenuPresenter;Landroid/content/Context;Lcom/miui/gallery/view/menu/MenuBuilder;Landroid/view/View;Z)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter$PopupOverflowMenu;->this$0:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    invoke-direct {p0, p2, p3, p4, p5}, Lcom/miui/gallery/view/menu/MenuPopupHelper;-><init>(Landroid/content/Context;Lcom/miui/gallery/view/menu/MenuBuilder;Landroid/view/View;Z)V

    iget-object p1, p1, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mPopupPresenterCallback:Lcom/miui/gallery/view/menu/ActionMenuPresenter$PopupPresenterCallback;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/view/menu/ActionMenuPresenter$PopupOverflowMenu;->setCallback(Lcom/miui/gallery/view/menu/MenuPresenter$Callback;)V

    const p1, 0x7f0b00de

    invoke-virtual {p0, p1}, Lcom/miui/gallery/view/menu/ActionMenuPresenter$PopupOverflowMenu;->setMenuItemLayout(I)V

    return-void
.end method


# virtual methods
.method public dismiss(Z)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/view/menu/MenuPopupHelper;->dismiss(Z)V

    iget-object p1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter$PopupOverflowMenu;->this$0:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    invoke-static {p1}, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->access$700(Lcom/miui/gallery/view/menu/ActionMenuPresenter;)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter$PopupOverflowMenu;->this$0:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    invoke-static {p1}, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->access$700(Lcom/miui/gallery/view/menu/ActionMenuPresenter;)Landroid/view/View;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    :cond_0
    return-void
.end method

.method public onDismiss()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/view/menu/MenuPopupHelper;->onDismiss()V

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter$PopupOverflowMenu;->this$0:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    iget-object v0, v0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mMenu:Lcom/miui/gallery/view/menu/MenuBuilder;

    invoke-virtual {v0}, Lcom/miui/gallery/view/menu/MenuBuilder;->close()V

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter$PopupOverflowMenu;->this$0:Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->access$602(Lcom/miui/gallery/view/menu/ActionMenuPresenter;Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenu;)Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenu;

    return-void
.end method

.method public update(Lcom/miui/gallery/view/menu/MenuBuilder;)V
    .locals 0

    return-void
.end method
