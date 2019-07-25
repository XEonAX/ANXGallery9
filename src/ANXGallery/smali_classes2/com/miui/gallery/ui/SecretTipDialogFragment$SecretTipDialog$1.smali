.class Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SecretTipDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->startAnimation()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog$1;->this$1:Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog$1;->this$1:Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->access$202(Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;Z)Z

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3

    iget-object p1, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog$1;->this$1:Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;

    invoke-static {p1}, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->access$200(Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog$1;->this$1:Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->access$202(Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;Z)Z

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog$1;->this$1:Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;

    iget-object p1, p1, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->this$0:Lcom/miui/gallery/ui/SecretTipDialogFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/SecretTipDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object p1

    new-instance v0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog$1$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog$1$1;-><init>(Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog$1;)V

    iget-object v1, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog$1;->this$1:Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;

    iget-object v1, v1, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->this$0:Lcom/miui/gallery/ui/SecretTipDialogFragment;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/SecretTipDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0a0053

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    int-to-long v1, v1

    invoke-virtual {p1, v0, v1, v2}, Lcom/android/internal/CompatHandler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_1
    :goto_0
    return-void
.end method
