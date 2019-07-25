.class public Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment;
.super Lcom/miui/gallery/widget/GalleryDialogFragment;
.source "SlideshowIntervalDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment$CompleteListener;
    }
.end annotation


# instance fields
.field private mDialog:Lmiui/app/AlertDialog;

.field private mListener:Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment$CompleteListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment;)Lmiui/app/AlertDialog;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment;->mDialog:Lmiui/app/AlertDialog;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment;Ljava/lang/CharSequence;)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment;->isTextValid(Ljava/lang/CharSequence;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment;)Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment$CompleteListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment;->mListener:Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment$CompleteListener;

    return-object p0
.end method

.method private isTextValid(Ljava/lang/CharSequence;)Z
    .locals 2

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    :try_start_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v0, 0x3

    if-lt p1, v0, :cond_1

    const/16 v0, 0xe10

    if-gt p1, v0, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1

    :catch_0
    return v1
.end method


# virtual methods
.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 5

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$SlideShow;->getSlideShowInterval()I

    move-result v0

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const/4 v2, 0x0

    const v3, 0x7f0b006f

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v2, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v1}, Landroid/widget/EditText;->selectAll()V

    const/4 v0, 0x2

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setRawInputType(I)V

    new-instance v0, Lmiui/app/AlertDialog$Builder;

    invoke-direct {v0, p1}, Lmiui/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lmiui/app/AlertDialog$Builder;->setView(Landroid/view/View;)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    const v0, 0x7f10067c

    invoke-virtual {p1, v0}, Lmiui/app/AlertDialog$Builder;->setTitle(I)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    const v0, 0x104000a

    invoke-virtual {p1, v0, v2}, Lmiui/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    const/high16 v0, 0x1040000

    invoke-virtual {p1, v0, v2}, Lmiui/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lmiui/app/AlertDialog$Builder;->create()Lmiui/app/AlertDialog;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment;->mDialog:Lmiui/app/AlertDialog;

    iget-object p1, p0, Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment;->mDialog:Lmiui/app/AlertDialog;

    invoke-virtual {p1}, Lmiui/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroid/view/Window;->setSoftInputMode(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment;->mDialog:Lmiui/app/AlertDialog;

    new-instance v0, Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment$1;

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment$1;-><init>(Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment;Landroid/widget/EditText;)V

    invoke-virtual {p1, v0}, Lmiui/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment;->mDialog:Lmiui/app/AlertDialog;

    return-object p1
.end method

.method public setCompleteListener(Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment$CompleteListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment;->mListener:Lcom/miui/gallery/ui/SlideshowIntervalDialogFragment$CompleteListener;

    return-void
.end method
