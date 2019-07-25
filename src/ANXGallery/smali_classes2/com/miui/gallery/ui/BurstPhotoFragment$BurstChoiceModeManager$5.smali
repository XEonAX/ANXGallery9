.class Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager$5;
.super Ljava/lang/Object;
.source "BurstPhotoFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/ProcessTask$OnCompleteListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->saveBurstItems(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/ui/ProcessTask$OnCompleteListener<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager$5;->this$1:Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCompleteProcess(Ljava/lang/Boolean;)V
    .locals 0

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager$5;->this$1:Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;

    iget-object p1, p1, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->this$0:Lcom/miui/gallery/ui/BurstPhotoFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/BurstPhotoFragment;->access$100(Lcom/miui/gallery/ui/BurstPhotoFragment;)V

    :cond_0
    return-void
.end method

.method public bridge synthetic onCompleteProcess(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager$5;->onCompleteProcess(Ljava/lang/Boolean;)V

    return-void
.end method
