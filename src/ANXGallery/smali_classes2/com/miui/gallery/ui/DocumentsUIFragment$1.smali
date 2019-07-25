.class Lcom/miui/gallery/ui/DocumentsUIFragment$1;
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

    iput-object p1, p0, Lcom/miui/gallery/ui/DocumentsUIFragment$1;->this$0:Lcom/miui/gallery/ui/DocumentsUIFragment;

    iput p2, p0, Lcom/miui/gallery/ui/DocumentsUIFragment$1;->val$requestCode:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    new-instance p1, Landroid/content/Intent;

    const-string p2, "android.intent.action.OPEN_DOCUMENT_TREE"

    invoke-direct {p1, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/DocumentsUIFragment$1;->this$0:Lcom/miui/gallery/ui/DocumentsUIFragment;

    invoke-virtual {p2}, Lcom/miui/gallery/ui/DocumentsUIFragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    iget v0, p0, Lcom/miui/gallery/ui/DocumentsUIFragment$1;->val$requestCode:I

    invoke-virtual {p2, p1, v0}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method
