.class public Lcom/miui/gallery/editor/photo/app/AlertDialogFragment;
.super Lcom/miui/gallery/widget/GalleryDialogFragment;
.source "AlertDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Builder;,
        Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Callbacks;
    }
.end annotation


# instance fields
.field private mCallbacks:Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Callbacks;

.field private mOnClickListener:Landroid/content/DialogInterface$OnClickListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;-><init>()V

    new-instance v0, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$1;-><init>(Lcom/miui/gallery/editor/photo/app/AlertDialogFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment;->mOnClickListener:Landroid/content/DialogInterface$OnClickListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/app/AlertDialogFragment;)Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Callbacks;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment;->mCallbacks:Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Callbacks;

    return-object p0
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onCancel(Landroid/content/DialogInterface;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment;->mCallbacks:Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Callbacks;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment;->mCallbacks:Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Callbacks;

    invoke-interface {p1, p0}, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Callbacks;->onCancel(Lcom/miui/gallery/editor/photo/app/AlertDialogFragment;)V

    :cond_0
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 3

    new-instance p1, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "AlertDialogFragment:message_resource"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p1, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    :cond_0
    const-string v1, "AlertDialogFragment:negative_resource"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment;->mOnClickListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {p1, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    :cond_1
    const-string v1, "AlertDialogFragment:positive_resource"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment;->mOnClickListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    :cond_2
    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    return-object p1
.end method

.method public onDetach()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onDetach()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment;->mCallbacks:Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Callbacks;

    return-void
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onDismiss(Landroid/content/DialogInterface;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment;->mCallbacks:Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Callbacks;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment;->mCallbacks:Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Callbacks;

    invoke-interface {p1, p0}, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Callbacks;->onDismiss(Lcom/miui/gallery/editor/photo/app/AlertDialogFragment;)V

    :cond_0
    return-void
.end method

.method public final setCallbacks(Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Callbacks;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/AlertDialogFragment;->mCallbacks:Lcom/miui/gallery/editor/photo/app/AlertDialogFragment$Callbacks;

    return-void
.end method
