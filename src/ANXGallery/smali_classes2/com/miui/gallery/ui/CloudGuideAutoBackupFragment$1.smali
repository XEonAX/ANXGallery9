.class Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$1;
.super Ljava/lang/Object;
.source "CloudGuideAutoBackupFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$1;->this$0:Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 8

    iget-object p1, p0, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$1;->this$0:Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/SyncUtil;->existXiaomiAccount(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$1;->this$0:Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/miui/gallery/util/SyncUtil;->setSyncAutomatically(Landroid/content/Context;Z)Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$1;->this$0:Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Landroid/app/Activity;->setResult(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$1;->this$0:Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$1;->this$0:Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-static {p1}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v0

    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    iget-object p1, p0, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$1;->this$0:Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->access$000(Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;)Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;

    move-result-object p1

    if-eqz p1, :cond_1

    const-string p1, "stat_key_source"

    iget-object v1, p0, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$1;->this$0:Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->access$000(Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;)Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, p1, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    const-string v1, "com.xiaomi"

    const/4 v2, 0x0

    const/4 v3, 0x0

    iget-object p1, p0, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$1;->this$0:Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    new-instance v6, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$1$1;

    invoke-direct {v6, p0}, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$1$1;-><init>(Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$1;)V

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/accounts/AccountManager;->addAccount(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Landroid/os/Bundle;Landroid/app/Activity;Landroid/accounts/AccountManagerCallback;Landroid/os/Handler;)Landroid/accounts/AccountManagerFuture;

    :cond_2
    :goto_0
    return-void
.end method
