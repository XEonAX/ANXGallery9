.class Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment$2;
.super Ljava/lang/Object;
.source "AuthenticatePrivacyPasswordFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/ConfirmDialog$ConfirmDialogInterface;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;->authenticatePrivacyPassword()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment$2;->this$0:Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/app/DialogFragment;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment$2;->this$0:Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;->access$100(Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;I)V

    return-void
.end method

.method public onConfirm(Landroid/app/DialogFragment;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment$2;->this$0:Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;

    const/16 v0, 0x1b

    invoke-static {p1, v0}, Lcom/miui/privacy/LockSettingsHelper;->startAuthenticatePasswordActivity(Landroid/app/Fragment;I)V

    return-void
.end method
