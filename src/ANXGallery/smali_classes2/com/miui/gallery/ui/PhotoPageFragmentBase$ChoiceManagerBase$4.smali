.class Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$4;
.super Ljava/lang/Object;
.source "PhotoPageFragmentBase.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->doShare(Ljava/util/ArrayList;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$4;->this$1:Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$4;->this$1:Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->access$1200(Lcom/miui/gallery/ui/PhotoPageFragmentBase;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$4;->this$1:Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$4;->this$1:Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->mSharePackageName:Ljava/lang/String;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$4;->this$1:Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->mShareClassName:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->access$1300(Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$4;->this$1:Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f100066

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$4;->this$1:Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v1}, Lcom/miui/gallery/activity/BaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f100065

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    invoke-virtual {v1, v2, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$4;->this$1:Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$4;->this$1:Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v2, v0}, Lcom/miui/gallery/util/DialogUtil;->createLoadingDialog(Landroid/content/Context;Ljava/lang/String;)Landroid/app/AlertDialog;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->access$1402(Lcom/miui/gallery/ui/PhotoPageFragmentBase;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$4;->this$1:Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->access$1400(Lcom/miui/gallery/ui/PhotoPageFragmentBase;)Landroid/app/AlertDialog;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase$4;->this$1:Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$ChoiceManagerBase;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->access$1400(Lcom/miui/gallery/ui/PhotoPageFragmentBase;)Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    :cond_1
    return-void
.end method
