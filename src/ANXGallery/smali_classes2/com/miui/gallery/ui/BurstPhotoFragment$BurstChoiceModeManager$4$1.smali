.class Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager$4$1;
.super Ljava/lang/Object;
.source "BurstPhotoFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager$4;->doProcess([Ljava/lang/Void;)Ljava/lang/Boolean;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager$4;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager$4;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager$4$1;->this$2:Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager$4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDeleted(I[J)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager$4$1;->this$2:Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager$4;

    iget-object p1, p1, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager$4;->this$1:Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;

    iget-object p1, p1, Lcom/miui/gallery/ui/BurstPhotoFragment$BurstChoiceModeManager;->this$0:Lcom/miui/gallery/ui/BurstPhotoFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/BurstPhotoFragment;->access$100(Lcom/miui/gallery/ui/BurstPhotoFragment;)V

    return-void
.end method
