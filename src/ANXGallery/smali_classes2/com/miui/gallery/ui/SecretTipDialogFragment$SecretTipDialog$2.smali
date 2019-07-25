.class Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog$2;
.super Ljava/lang/Object;
.source "SecretTipDialogFragment.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;
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

    iput-object p1, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog$2;->this$1:Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog$2;->this$1:Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;

    invoke-static {v0}, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->access$300(Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    return-void
.end method
