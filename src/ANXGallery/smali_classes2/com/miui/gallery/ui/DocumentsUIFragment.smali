.class public Lcom/miui/gallery/ui/DocumentsUIFragment;
.super Lcom/miui/gallery/widget/GalleryDialogFragment;
.source "DocumentsUIFragment.java"


# instance fields
.field private mLayoutId:I

.field private mMessage:Ljava/lang/String;

.field private mPositiveClickListener:Landroid/content/DialogInterface$OnClickListener;

.field private mPositiveText:Ljava/lang/String;

.field private mTitle:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;-><init>()V

    return-void
.end method

.method public static newInstance(II)Lcom/miui/gallery/ui/DocumentsUIFragment;
    .locals 3

    new-instance v0, Lcom/miui/gallery/ui/DocumentsUIFragment;

    invoke-direct {v0}, Lcom/miui/gallery/ui/DocumentsUIFragment;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "which_page"

    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p0, "request_code"

    invoke-virtual {v1, p0, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/DocumentsUIFragment;->setArguments(Landroid/os/Bundle;)V

    return-object v0
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/DocumentsUIFragment;->setCancelable(Z)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/DocumentsUIFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "which_page"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    const-string v1, "request_code"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p1

    const v1, 0x7f10038c

    invoke-virtual {p0, v1}, Lcom/miui/gallery/ui/DocumentsUIFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/ui/DocumentsUIFragment;->mTitle:Ljava/lang/String;

    const v1, 0x7f100387

    invoke-virtual {p0, v1}, Lcom/miui/gallery/ui/DocumentsUIFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/ui/DocumentsUIFragment;->mMessage:Ljava/lang/String;

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    const v0, 0x7f0b0077

    iput v0, p0, Lcom/miui/gallery/ui/DocumentsUIFragment;->mLayoutId:I

    const v0, 0x7f100385

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/DocumentsUIFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/DocumentsUIFragment;->mPositiveText:Ljava/lang/String;

    new-instance v0, Lcom/miui/gallery/ui/DocumentsUIFragment$2;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/ui/DocumentsUIFragment$2;-><init>(Lcom/miui/gallery/ui/DocumentsUIFragment;I)V

    iput-object v0, p0, Lcom/miui/gallery/ui/DocumentsUIFragment;->mPositiveClickListener:Landroid/content/DialogInterface$OnClickListener;

    goto :goto_0

    :cond_0
    const v0, 0x7f0b0078

    iput v0, p0, Lcom/miui/gallery/ui/DocumentsUIFragment;->mLayoutId:I

    const v0, 0x7f100386

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/DocumentsUIFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/DocumentsUIFragment;->mPositiveText:Ljava/lang/String;

    new-instance v0, Lcom/miui/gallery/ui/DocumentsUIFragment$1;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/ui/DocumentsUIFragment$1;-><init>(Lcom/miui/gallery/ui/DocumentsUIFragment;I)V

    iput-object v0, p0, Lcom/miui/gallery/ui/DocumentsUIFragment;->mPositiveClickListener:Landroid/content/DialogInterface$OnClickListener;

    :goto_0
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 2

    new-instance p1, Lmiui/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/DocumentsUIFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p1, v0}, Lmiui/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/DocumentsUIFragment;->mTitle:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lmiui/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/DocumentsUIFragment;->mMessage:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lmiui/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    iget v0, p0, Lcom/miui/gallery/ui/DocumentsUIFragment;->mLayoutId:I

    invoke-virtual {p1, v0}, Lmiui/app/AlertDialog$Builder;->setView(I)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/DocumentsUIFragment;->mPositiveText:Ljava/lang/String;

    iget-object v1, p0, Lcom/miui/gallery/ui/DocumentsUIFragment;->mPositiveClickListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {p1, v0, v1}, Lmiui/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lmiui/app/AlertDialog$Builder;->create()Lmiui/app/AlertDialog;

    move-result-object p1

    return-object p1
.end method
