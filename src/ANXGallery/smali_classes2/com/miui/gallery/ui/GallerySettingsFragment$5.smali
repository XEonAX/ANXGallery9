.class Lcom/miui/gallery/ui/GallerySettingsFragment$5;
.super Ljava/lang/Object;
.source "GallerySettingsFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/ConfirmDialog$ConfirmDialogInterface;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/GallerySettingsFragment;->showSyncSettingDialog()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/GallerySettingsFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/GallerySettingsFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment$5;->this$0:Lcom/miui/gallery/ui/GallerySettingsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/app/DialogFragment;)V
    .locals 0

    return-void
.end method

.method public onConfirm(Landroid/app/DialogFragment;)V
    .locals 1

    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.settings.ACCOUNT_LIST"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v0, "com.android.settings"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    iget-object v0, p0, Lcom/miui/gallery/ui/GallerySettingsFragment$5;->this$0:Lcom/miui/gallery/ui/GallerySettingsFragment;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/GallerySettingsFragment;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
