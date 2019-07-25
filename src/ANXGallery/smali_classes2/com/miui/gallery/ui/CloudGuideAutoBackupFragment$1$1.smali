.class Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$1$1;
.super Ljava/lang/Object;
.source "CloudGuideAutoBackupFragment.java"

# interfaces
.implements Landroid/accounts/AccountManagerCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$1;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/accounts/AccountManagerCallback<",
        "Landroid/os/Bundle;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$1;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$1;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$1$1;->this$1:Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Landroid/accounts/AccountManagerFuture;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/accounts/AccountManagerFuture<",
            "Landroid/os/Bundle;",
            ">;)V"
        }
    .end annotation

    iget-object p1, p0, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$1$1;->this$1:Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$1;

    iget-object p1, p1, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$1;->this$0:Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$1$1;->this$1:Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$1;

    iget-object p1, p1, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$1;->this$0:Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/SyncUtil;->existXiaomiAccount(Landroid/content/Context;)Z

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$1$1;->this$1:Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$1;

    iget-object v0, v0, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$1;->this$0:Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz p1, :cond_0

    const/4 p1, -0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    :goto_0
    invoke-virtual {v0, p1}, Landroid/app/Activity;->setResult(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$1$1;->this$1:Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$1;

    iget-object p1, p1, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$1;->this$0:Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    :cond_1
    return-void
.end method
