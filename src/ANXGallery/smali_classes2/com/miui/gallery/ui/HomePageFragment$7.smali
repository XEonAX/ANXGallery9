.class Lcom/miui/gallery/ui/HomePageFragment$7;
.super Ljava/lang/Object;
.source "HomePageFragment.java"

# interfaces
.implements Lcom/miui/gallery/util/SafeBroadcastReceiver$WeakReceiver;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/HomePageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/HomePageFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/HomePageFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$7;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$7;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/HomePageFragment;->access$400(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->isInActionMode()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$7;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    const-string v0, "assistant_target_package"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "assistant_target_class"

    invoke-virtual {p2, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, v0, p2}, Lcom/miui/gallery/ui/HomePageFragment;->access$1400(Lcom/miui/gallery/ui/HomePageFragment;Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
