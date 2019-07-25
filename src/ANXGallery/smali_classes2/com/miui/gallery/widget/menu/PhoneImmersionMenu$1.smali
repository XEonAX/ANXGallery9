.class Lcom/miui/gallery/widget/menu/PhoneImmersionMenu$1;
.super Ljava/lang/Object;
.source "PhoneImmersionMenu.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;-><init>(Landroid/content/Context;Lcom/miui/gallery/widget/menu/ImmersionMenuListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;


# direct methods
.method constructor <init>(Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu$1;->this$0:Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    iget-object p1, p0, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu$1;->this$0:Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;

    invoke-static {p1}, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;->access$000(Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;)Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter;

    move-result-object p1

    invoke-virtual {p1, p3}, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter;->getItem(I)Lcom/miui/gallery/widget/menu/ImmersionMenuItem;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/widget/menu/ImmersionMenuItem;->isCheckable()Z

    move-result p3

    if-eqz p3, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu$1;->this$0:Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;

    invoke-static {p1}, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;->access$000(Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;)Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/widget/menu/ImmersionMenuAdapter;->toggleCheckableItem(Landroid/view/View;)V

    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/miui/gallery/widget/menu/ImmersionMenuItem;->hasSubMenu()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/widget/menu/ImmersionMenuItem;->getSubMenu()Lcom/miui/gallery/widget/menu/ImmersionSubMenu;

    move-result-object p2

    iget-object p3, p0, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu$1;->this$0:Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;

    new-instance p4, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu$1$1;

    invoke-direct {p4, p0, p2}, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu$1$1;-><init>(Lcom/miui/gallery/widget/menu/PhoneImmersionMenu$1;Lcom/miui/gallery/widget/menu/ImmersionSubMenu;)V

    invoke-virtual {p3, p4}, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    goto :goto_0

    :cond_1
    iget-object p2, p0, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu$1;->this$0:Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;

    invoke-static {p2}, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;->access$400(Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;)Lcom/miui/gallery/widget/menu/ImmersionMenuListener;

    move-result-object p2

    iget-object p3, p0, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu$1;->this$0:Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;

    invoke-static {p3}, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;->access$300(Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;)Lcom/miui/gallery/widget/menu/ImmersionMenu;

    move-result-object p3

    invoke-interface {p2, p3, p1}, Lcom/miui/gallery/widget/menu/ImmersionMenuListener;->onImmersionMenuSelected(Lcom/miui/gallery/widget/menu/ImmersionMenu;Lcom/miui/gallery/widget/menu/ImmersionMenuItem;)V

    :goto_0
    invoke-virtual {p1}, Lcom/miui/gallery/widget/menu/ImmersionMenuItem;->isRemainWhenClick()Z

    move-result p1

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu$1;->this$0:Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/miui/gallery/widget/menu/PhoneImmersionMenu;->dismiss(Z)V

    :cond_2
    return-void
.end method
