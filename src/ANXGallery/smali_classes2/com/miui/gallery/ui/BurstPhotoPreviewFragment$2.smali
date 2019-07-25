.class Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$2;
.super Ljava/lang/Object;
.source "BurstPhotoPreviewFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$2;->this$0:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$2;->this$0:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->access$100(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;)Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$OnExitListener;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$2;->this$0:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->access$100(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;)Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$OnExitListener;

    move-result-object p1

    invoke-interface {p1}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$OnExitListener;->onDiscard()V

    :cond_0
    return-void
.end method
