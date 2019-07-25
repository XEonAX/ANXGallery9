.class Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager$2;
.super Ljava/lang/Object;
.source "BurstPhotoFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$OnExitListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->setUpPreviewFragment()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager$2;->this$1:Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDiscard()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager$2;->this$1:Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->discard()V

    return-void
.end method

.method public onSave()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager$2;->this$1:Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->showSaveDialog()V

    return-void
.end method
