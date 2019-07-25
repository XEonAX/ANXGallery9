.class public final Lcom/miui/gallery/ui/AlertDialogFragment$Builder;
.super Ljava/lang/Object;
.source "AlertDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/AlertDialogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private mCancelListener:Landroid/content/DialogInterface$OnCancelListener;

.field private mCancelable:Z

.field private mCheckBoxMessage:Ljava/lang/CharSequence;

.field private mDismissListener:Landroid/content/DialogInterface$OnDismissListener;

.field private mIsChecked:Z

.field private mMessage:Ljava/lang/CharSequence;

.field private mNegativeButtonListener:Landroid/content/DialogInterface$OnClickListener;

.field private mNegativeButtonText:Ljava/lang/CharSequence;

.field private mPositiveButtonListener:Landroid/content/DialogInterface$OnClickListener;

.field private mPositiveButtonText:Ljava/lang/CharSequence;

.field private mTitle:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->mCancelable:Z

    return-void
.end method


# virtual methods
.method public create()Lcom/miui/gallery/ui/AlertDialogFragment;
    .locals 3

    new-instance v0, Lcom/miui/gallery/ui/AlertDialogFragment;

    invoke-direct {v0}, Lcom/miui/gallery/ui/AlertDialogFragment;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->mTitle:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/AlertDialogFragment;->setTitle(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->mMessage:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/AlertDialogFragment;->setMessage(Ljava/lang/CharSequence;)V

    iget-boolean v1, p0, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->mIsChecked:Z

    iget-object v2, p0, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->mCheckBoxMessage:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/ui/AlertDialogFragment;->setCheckBox(ZLjava/lang/CharSequence;)V

    iget-object v1, p0, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->mNegativeButtonText:Ljava/lang/CharSequence;

    iget-object v2, p0, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->mNegativeButtonListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/ui/AlertDialogFragment;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    iget-object v1, p0, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->mPositiveButtonText:Ljava/lang/CharSequence;

    iget-object v2, p0, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->mPositiveButtonListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/ui/AlertDialogFragment;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    iget-object v1, p0, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->mCancelListener:Landroid/content/DialogInterface$OnCancelListener;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/AlertDialogFragment;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    iget-object v1, p0, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->mDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/AlertDialogFragment;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    iget-boolean v1, p0, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->mCancelable:Z

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/AlertDialogFragment;->setCancelable(Z)V

    return-object v0
.end method

.method public setCancelable(Z)Lcom/miui/gallery/ui/AlertDialogFragment$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->mCancelable:Z

    return-object p0
.end method

.method public setMessage(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/AlertDialogFragment$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->mMessage:Ljava/lang/CharSequence;

    return-object p0
.end method

.method public setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/miui/gallery/ui/AlertDialogFragment$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->mNegativeButtonText:Ljava/lang/CharSequence;

    iput-object p2, p0, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->mNegativeButtonListener:Landroid/content/DialogInterface$OnClickListener;

    return-object p0
.end method

.method public setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/miui/gallery/ui/AlertDialogFragment$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->mPositiveButtonText:Ljava/lang/CharSequence;

    iput-object p2, p0, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->mPositiveButtonListener:Landroid/content/DialogInterface$OnClickListener;

    return-object p0
.end method

.method public setTitle(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/AlertDialogFragment$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->mTitle:Ljava/lang/CharSequence;

    return-object p0
.end method
