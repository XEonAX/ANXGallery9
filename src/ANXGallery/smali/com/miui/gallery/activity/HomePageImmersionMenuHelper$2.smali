.class Lcom/miui/gallery/activity/HomePageImmersionMenuHelper$2;
.super Ljava/lang/Object;
.source "HomePageImmersionMenuHelper.java"

# interfaces
.implements Lcom/miui/gallery/util/PrintInstallHelper$InstallStateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/activity/HomePageImmersionMenuHelper;->onCreateImmersionMenu(Lcom/miui/gallery/widget/menu/ImmersionMenu;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/activity/HomePageImmersionMenuHelper;

.field final synthetic val$menu:Lcom/miui/gallery/widget/menu/ImmersionMenu;

.field final synthetic val$photoPrintItem:Lcom/miui/gallery/widget/menu/ImmersionMenuItem;


# direct methods
.method constructor <init>(Lcom/miui/gallery/activity/HomePageImmersionMenuHelper;Lcom/miui/gallery/widget/menu/ImmersionMenuItem;Lcom/miui/gallery/widget/menu/ImmersionMenu;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/activity/HomePageImmersionMenuHelper$2;->this$0:Lcom/miui/gallery/activity/HomePageImmersionMenuHelper;

    iput-object p2, p0, Lcom/miui/gallery/activity/HomePageImmersionMenuHelper$2;->val$photoPrintItem:Lcom/miui/gallery/widget/menu/ImmersionMenuItem;

    iput-object p3, p0, Lcom/miui/gallery/activity/HomePageImmersionMenuHelper$2;->val$menu:Lcom/miui/gallery/widget/menu/ImmersionMenu;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFinish(ZII)V
    .locals 0

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/activity/HomePageImmersionMenuHelper$2;->this$0:Lcom/miui/gallery/activity/HomePageImmersionMenuHelper;

    invoke-static {p1}, Lcom/miui/gallery/activity/HomePageImmersionMenuHelper;->access$000(Lcom/miui/gallery/activity/HomePageImmersionMenuHelper;)Landroid/content/Context;

    move-result-object p1

    const p2, 0x7f100569

    invoke-static {p1, p2}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    goto :goto_0

    :cond_0
    invoke-static {p2, p3}, Lcom/miui/gallery/util/PrintInstallHelper;->getFailReasonMsg(II)I

    move-result p1

    if-eqz p1, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/activity/HomePageImmersionMenuHelper$2;->this$0:Lcom/miui/gallery/activity/HomePageImmersionMenuHelper;

    invoke-static {p2}, Lcom/miui/gallery/activity/HomePageImmersionMenuHelper;->access$000(Lcom/miui/gallery/activity/HomePageImmersionMenuHelper;)Landroid/content/Context;

    move-result-object p2

    invoke-static {p2, p1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/activity/HomePageImmersionMenuHelper$2;->val$photoPrintItem:Lcom/miui/gallery/widget/menu/ImmersionMenuItem;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/miui/gallery/widget/menu/ImmersionMenuItem;->setRemainWhenClick(Z)V

    iget-object p1, p0, Lcom/miui/gallery/activity/HomePageImmersionMenuHelper$2;->val$photoPrintItem:Lcom/miui/gallery/widget/menu/ImmersionMenuItem;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/miui/gallery/widget/menu/ImmersionMenuItem;->setInformation(Ljava/lang/CharSequence;)Lcom/miui/gallery/widget/menu/ImmersionMenuItem;

    iget-object p1, p0, Lcom/miui/gallery/activity/HomePageImmersionMenuHelper$2;->this$0:Lcom/miui/gallery/activity/HomePageImmersionMenuHelper;

    iget-object p2, p0, Lcom/miui/gallery/activity/HomePageImmersionMenuHelper$2;->val$menu:Lcom/miui/gallery/widget/menu/ImmersionMenu;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/activity/HomePageImmersionMenuHelper;->updateImmersionMenu(Lcom/miui/gallery/widget/menu/ImmersionMenu;)V

    return-void
.end method

.method public onInstallLimited()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/activity/HomePageImmersionMenuHelper$2;->this$0:Lcom/miui/gallery/activity/HomePageImmersionMenuHelper;

    invoke-static {v0}, Lcom/miui/gallery/activity/HomePageImmersionMenuHelper;->access$000(Lcom/miui/gallery/activity/HomePageImmersionMenuHelper;)Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f1006f9

    invoke-static {v0, v1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    return-void
.end method

.method public onInstalling()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/activity/HomePageImmersionMenuHelper$2;->val$photoPrintItem:Lcom/miui/gallery/widget/menu/ImmersionMenuItem;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/menu/ImmersionMenuItem;->setRemainWhenClick(Z)V

    iget-object v0, p0, Lcom/miui/gallery/activity/HomePageImmersionMenuHelper$2;->val$photoPrintItem:Lcom/miui/gallery/widget/menu/ImmersionMenuItem;

    const v1, 0x7f100568

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/menu/ImmersionMenuItem;->setInformation(I)Lcom/miui/gallery/widget/menu/ImmersionMenuItem;

    iget-object v0, p0, Lcom/miui/gallery/activity/HomePageImmersionMenuHelper$2;->this$0:Lcom/miui/gallery/activity/HomePageImmersionMenuHelper;

    iget-object v1, p0, Lcom/miui/gallery/activity/HomePageImmersionMenuHelper$2;->val$menu:Lcom/miui/gallery/widget/menu/ImmersionMenu;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/activity/HomePageImmersionMenuHelper;->updateImmersionMenu(Lcom/miui/gallery/widget/menu/ImmersionMenu;)V

    return-void
.end method
