.class Lcom/miui/gallery/widget/BottomMenu$1;
.super Ljava/lang/Object;
.source "BottomMenu.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/widget/BottomMenu;->onFinishInflate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/widget/BottomMenu;


# direct methods
.method constructor <init>(Lcom/miui/gallery/widget/BottomMenu;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/BottomMenu$1;->this$0:Lcom/miui/gallery/widget/BottomMenu;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/widget/BottomMenu$1;->this$0:Lcom/miui/gallery/widget/BottomMenu;

    invoke-static {p1}, Lcom/miui/gallery/widget/BottomMenu;->access$000(Lcom/miui/gallery/widget/BottomMenu;)Lcom/miui/gallery/view/menu/PhoneActionMenuView;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/widget/BottomMenu$1;->this$0:Lcom/miui/gallery/widget/BottomMenu;

    invoke-static {p1}, Lcom/miui/gallery/widget/BottomMenu;->access$000(Lcom/miui/gallery/widget/BottomMenu;)Lcom/miui/gallery/view/menu/PhoneActionMenuView;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->isOverflowMenuShowing()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/widget/BottomMenu$1;->this$0:Lcom/miui/gallery/widget/BottomMenu;

    invoke-static {p1}, Lcom/miui/gallery/widget/BottomMenu;->access$000(Lcom/miui/gallery/widget/BottomMenu;)Lcom/miui/gallery/view/menu/PhoneActionMenuView;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->getPresenter()Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->hideOverflowMenu(Z)Z

    :cond_0
    return-void
.end method
