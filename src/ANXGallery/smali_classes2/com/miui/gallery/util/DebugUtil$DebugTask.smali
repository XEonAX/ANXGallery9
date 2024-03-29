.class Lcom/miui/gallery/util/DebugUtil$DebugTask;
.super Landroid/os/AsyncTask;
.source "DebugUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/util/DebugUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DebugTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# static fields
.field private static sDebugging:Ljava/util/concurrent/atomic/AtomicBoolean;


# instance fields
.field private mActivityRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private mProgress:Lcom/miui/gallery/ui/ProgressDialogFragment;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    sput-object v0, Lcom/miui/gallery/util/DebugUtil$DebugTask;->sDebugging:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void
.end method

.method constructor <init>(Landroid/app/Activity;)V
    .locals 1

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/miui/gallery/util/DebugUtil$DebugTask;->mActivityRef:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method private getActivity()Landroid/app/Activity;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/DebugUtil$DebugTask;->mActivityRef:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/DebugUtil$DebugTask;->mActivityRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/util/DebugUtil$DebugTask;->mProgress:Lcom/miui/gallery/ui/ProgressDialogFragment;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/util/DebugUtil$DebugTask;->mProgress:Lcom/miui/gallery/ui/ProgressDialogFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/ProgressDialogFragment;->dismissAllowingStateLoss()V

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/util/DebugUtil$DebugTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 2

    sget-object p1, Lcom/miui/gallery/util/DebugUtil$DebugTask;->sDebugging:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    return-object v0

    :cond_0
    sget-object p1, Lcom/miui/gallery/util/DebugUtil$DebugTask;->sDebugging:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    invoke-static {}, Lcom/miui/gallery/util/DebugUtil;->access$000()V

    sget-object p1, Lcom/miui/gallery/util/DebugUtil$DebugTask;->sDebugging:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    return-object v0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/util/DebugUtil$DebugTask;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 4

    iget-object p1, p0, Lcom/miui/gallery/util/DebugUtil$DebugTask;->mProgress:Lcom/miui/gallery/ui/ProgressDialogFragment;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/util/DebugUtil$DebugTask;->mProgress:Lcom/miui/gallery/ui/ProgressDialogFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/ProgressDialogFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/util/DebugUtil$DebugTask;->mProgress:Lcom/miui/gallery/ui/ProgressDialogFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/ProgressDialogFragment;->dismissAllowingStateLoss()V

    invoke-direct {p0}, Lcom/miui/gallery/util/DebugUtil$DebugTask;->getActivity()Landroid/app/Activity;

    move-result-object p1

    if-eqz p1, :cond_0

    new-instance v0, Lcom/miui/gallery/util/DebugUtil$DebugTask$1;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/util/DebugUtil$DebugTask$1;-><init>(Lcom/miui/gallery/util/DebugUtil$DebugTask;Landroid/app/Activity;)V

    const v1, 0x7f1006ed

    invoke-virtual {p1, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f1002ec

    invoke-virtual {p1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    const v3, 0x7f1004c3

    invoke-virtual {p1, v3}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v0, v1, v2, v3}, Lcom/miui/gallery/util/DialogUtil;->showConfirmAlert(Landroid/content/Context;Landroid/content/DialogInterface$OnClickListener;Ljava/lang/String;Ljava/lang/CharSequence;Ljava/lang/String;)Landroid/app/AlertDialog;

    :cond_0
    return-void
.end method

.method protected onPreExecute()V
    .locals 4

    invoke-direct {p0}, Lcom/miui/gallery/util/DebugUtil$DebugTask;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v1, Lcom/miui/gallery/ui/ProgressDialogFragment;

    invoke-direct {v1}, Lcom/miui/gallery/ui/ProgressDialogFragment;-><init>()V

    iput-object v1, p0, Lcom/miui/gallery/util/DebugUtil$DebugTask;->mProgress:Lcom/miui/gallery/ui/ProgressDialogFragment;

    iget-object v1, p0, Lcom/miui/gallery/util/DebugUtil$DebugTask;->mProgress:Lcom/miui/gallery/ui/ProgressDialogFragment;

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f1002ed

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/ui/ProgressDialogFragment;->setTitle(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lcom/miui/gallery/util/DebugUtil$DebugTask;->mProgress:Lcom/miui/gallery/ui/ProgressDialogFragment;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/miui/gallery/ui/ProgressDialogFragment;->setCancelable(Z)V

    iget-object v1, p0, Lcom/miui/gallery/util/DebugUtil$DebugTask;->mProgress:Lcom/miui/gallery/ui/ProgressDialogFragment;

    invoke-virtual {v0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const-string v2, "DebugUtil"

    invoke-virtual {v1, v0, v2}, Lcom/miui/gallery/ui/ProgressDialogFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
