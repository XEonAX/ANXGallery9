.class public Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;
.super Lcom/miui/gallery/widget/GalleryDialogFragment;
.source "ScreenSaveDialogFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$DialogClickListener;,
        Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$ViewHolder;,
        Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$ScreenSaveDialogAdapter;
    }
.end annotation


# instance fields
.field private mAdapter:Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$ScreenSaveDialogAdapter;

.field private mContext:Landroid/content/Context;

.field private mDialog:Landroid/app/AlertDialog;

.field private mListener:Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$DialogClickListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method public static synthetic lambda$onCreateDialog$74(Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;Landroid/content/DialogInterface;I)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;->mListener:Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$DialogClickListener;

    if-nez p1, :cond_0

    return-void

    :cond_0
    packed-switch p2, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;->dismissSafely()V

    const-string p1, "cancel"

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/stat/ScreenEditorStatUtils;->statDoneFragmentClick(Ljava/lang/String;)V

    goto :goto_0

    :pswitch_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;->mListener:Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$DialogClickListener;

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$DialogClickListener;->onDelete()V

    const-string p1, "delete"

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/stat/ScreenEditorStatUtils;->statDoneFragmentClick(Ljava/lang/String;)V

    goto :goto_0

    :pswitch_2
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;->mListener:Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$DialogClickListener;

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$DialogClickListener;->onSave()V

    const-string p1, "save"

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/stat/ScreenEditorStatUtils;->statDoneFragmentClick(Ljava/lang/String;)V

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;->mListener:Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$DialogClickListener;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f090073

    if-eq p1, v0, :cond_3

    const v0, 0x7f0900c6

    if-eq p1, v0, :cond_2

    const v0, 0x7f090273

    if-eq p1, v0, :cond_1

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;->mListener:Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$DialogClickListener;

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$DialogClickListener;->onSave()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;->dismissSafely()V

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;->mListener:Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$DialogClickListener;

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$DialogClickListener;->onDelete()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;->dismissSafely()V

    goto :goto_0

    :cond_3
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;->dismissSafely()V

    :goto_0
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;->mContext:Landroid/content/Context;

    new-instance p1, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$ScreenSaveDialogAdapter;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$ScreenSaveDialogAdapter;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$1;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;->mAdapter:Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$ScreenSaveDialogAdapter;

    new-instance p1, Landroid/app/AlertDialog$Builder;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;->mContext:Landroid/content/Context;

    invoke-direct {p1, v0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;->mAdapter:Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$ScreenSaveDialogAdapter;

    new-instance v1, Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenSaveDialogFragment$4ax9wrlm95_0ZN8YUE-HohWqVnQ;

    invoke-direct {v1, p0}, Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenSaveDialogFragment$4ax9wrlm95_0ZN8YUE-HohWqVnQ;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;)V

    invoke-virtual {p1, v0, v1}, Landroid/app/AlertDialog$Builder;->setAdapter(Landroid/widget/ListAdapter;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {p1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;->mDialog:Landroid/app/AlertDialog;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;->mDialog:Landroid/app/AlertDialog;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;->mDialog:Landroid/app/AlertDialog;

    return-object p1
.end method

.method public onDestroyView()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onDestroyView()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;->mListener:Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$DialogClickListener;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;->mAdapter:Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$ScreenSaveDialogAdapter;

    return-void
.end method

.method public setListener(Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$DialogClickListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment;->mListener:Lcom/miui/gallery/editor/photo/screen/home/ScreenSaveDialogFragment$DialogClickListener;

    return-void
.end method
