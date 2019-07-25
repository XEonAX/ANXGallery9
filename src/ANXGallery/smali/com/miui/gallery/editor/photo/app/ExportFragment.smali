.class public Lcom/miui/gallery/editor/photo/app/ExportFragment;
.super Landroid/app/DialogFragment;
.source "ExportFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/app/ExportFragment$Callbacks;,
        Lcom/miui/gallery/editor/photo/app/ExportFragment$ExportTask;
    }
.end annotation


# instance fields
.field private mCallbacks:Lcom/miui/gallery/editor/photo/app/ExportFragment$Callbacks;

.field private mExportResult:Ljava/lang/Boolean;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/DialogFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/app/ExportFragment;)Lcom/miui/gallery/editor/photo/app/ExportFragment$Callbacks;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/ExportFragment;->mCallbacks:Lcom/miui/gallery/editor/photo/app/ExportFragment$Callbacks;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/app/ExportFragment;Ljava/lang/Boolean;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/app/ExportFragment;->publishResult(Ljava/lang/Boolean;)V

    return-void
.end method

.method private publishResult(Ljava/lang/Boolean;)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/ExportFragment;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/ExportFragment;->isRemoving()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/ExportFragment;->isResumed()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/ExportFragment;->mCallbacks:Lcom/miui/gallery/editor/photo/app/ExportFragment$Callbacks;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/ExportFragment;->mCallbacks:Lcom/miui/gallery/editor/photo/app/ExportFragment$Callbacks;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/app/ExportFragment$Callbacks;->onExported(Z)V

    goto :goto_1

    :cond_1
    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/ExportFragment;->mExportResult:Ljava/lang/Boolean;

    goto :goto_1

    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/ExportFragment;->mCallbacks:Lcom/miui/gallery/editor/photo/app/ExportFragment$Callbacks;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/ExportFragment;->mCallbacks:Lcom/miui/gallery/editor/photo/app/ExportFragment$Callbacks;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/app/ExportFragment$Callbacks;->onCancelled(Z)V

    :cond_3
    :goto_1
    return-void
.end method


# virtual methods
.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 2

    new-instance p1, Lmiui/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/ExportFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p1, v0}, Lmiui/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/ExportFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f100540

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lmiui/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lmiui/app/ProgressDialog;->setCanceledOnTouchOutside(Z)V

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lmiui/app/ProgressDialog;->setIndeterminate(Z)V

    return-object p1
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3

    new-instance v0, Lcom/miui/gallery/editor/photo/app/ExportFragment$ExportTask;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/ExportFragment$ExportTask;-><init>(Lcom/miui/gallery/editor/photo/app/ExportFragment;)V

    sget-object v1, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Void;

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/editor/photo/app/ExportFragment$ExportTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    invoke-super {p0, p1, p2, p3}, Landroid/app/DialogFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onDetach()V
    .locals 1

    invoke-super {p0}, Landroid/app/DialogFragment;->onDetach()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/ExportFragment;->mCallbacks:Lcom/miui/gallery/editor/photo/app/ExportFragment$Callbacks;

    return-void
.end method

.method public onResume()V
    .locals 1

    invoke-super {p0}, Landroid/app/DialogFragment;->onResume()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/ExportFragment;->mExportResult:Ljava/lang/Boolean;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/ExportFragment;->mExportResult:Ljava/lang/Boolean;

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/app/ExportFragment;->publishResult(Ljava/lang/Boolean;)V

    :cond_0
    return-void
.end method

.method public setCallbacks(Lcom/miui/gallery/editor/photo/app/ExportFragment$Callbacks;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/ExportFragment;->mCallbacks:Lcom/miui/gallery/editor/photo/app/ExportFragment$Callbacks;

    return-void
.end method
