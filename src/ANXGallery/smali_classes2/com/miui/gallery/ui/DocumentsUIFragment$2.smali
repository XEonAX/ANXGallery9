.class Lcom/miui/gallery/ui/DocumentsUIFragment$2;
.super Ljava/lang/Object;
.source "DocumentsUIFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/DocumentsUIFragment;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/DocumentsUIFragment;

.field final synthetic val$requestCode:I


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/DocumentsUIFragment;I)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/DocumentsUIFragment$2;->this$0:Lcom/miui/gallery/ui/DocumentsUIFragment;

    iput p2, p0, Lcom/miui/gallery/ui/DocumentsUIFragment$2;->val$requestCode:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    iget p2, p0, Lcom/miui/gallery/ui/DocumentsUIFragment$2;->val$requestCode:I

    const/4 v0, 0x2

    invoke-static {v0, p2}, Lcom/miui/gallery/ui/DocumentsUIFragment;->newInstance(II)Lcom/miui/gallery/ui/DocumentsUIFragment;

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/ui/DocumentsUIFragment$2;->this$0:Lcom/miui/gallery/ui/DocumentsUIFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/DocumentsUIFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const-string v1, "DocumentsUIFragment"

    invoke-virtual {p2, v0, v1}, Lcom/miui/gallery/ui/DocumentsUIFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method
