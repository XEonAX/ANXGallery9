.class Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$1;
.super Ljava/lang/Object;
.source "AlertDialogFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/AlertDialogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/AlertDialogFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/AlertDialogFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/AlertDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/AlertDialogFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    if-ne p1, v0, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/AlertDialogFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment;->access$000(Lcom/miui/gallery/editor/photo/app/AlertDialogFragment;)Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Callbacks;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/AlertDialogFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment;->access$000(Lcom/miui/gallery/editor/photo/app/AlertDialogFragment;)Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Callbacks;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$1;->this$0:Lcom/miui/gallery/editor/photo/app/AlertDialogFragment;

    invoke-interface {p1, v0, p2}, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Callbacks;->onClick(Lcom/miui/gallery/editor/photo/app/AlertDialogFragment;I)V

    :cond_0
    return-void

    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "click event is not from current fragment, maybe listener not detached"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
