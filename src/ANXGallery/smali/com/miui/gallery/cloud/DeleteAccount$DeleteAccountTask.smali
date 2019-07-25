.class Lcom/miui/gallery/cloud/DeleteAccount$DeleteAccountTask;
.super Landroid/os/AsyncTask;
.source "DeleteAccount.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cloud/DeleteAccount;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DeleteAccountTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Integer;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private mActivity:Landroid/app/Activity;

.field private mDialog:Landroid/app/ProgressDialog;

.field private mListener:Lcom/miui/gallery/cloud/DeleteAccount$DeleteAccountListener;

.field private mWipeDataStrategy:I


# direct methods
.method public constructor <init>(Landroid/app/Activity;ILcom/miui/gallery/cloud/DeleteAccount$DeleteAccountListener;)V
    .locals 0

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/cloud/DeleteAccount$DeleteAccountTask;->mActivity:Landroid/app/Activity;

    iput p2, p0, Lcom/miui/gallery/cloud/DeleteAccount$DeleteAccountTask;->mWipeDataStrategy:I

    iput-object p3, p0, Lcom/miui/gallery/cloud/DeleteAccount$DeleteAccountTask;->mListener:Lcom/miui/gallery/cloud/DeleteAccount$DeleteAccountListener;

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/cloud/DeleteAccount$DeleteAccountTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 0

    iget p1, p0, Lcom/miui/gallery/cloud/DeleteAccount$DeleteAccountTask;->mWipeDataStrategy:I

    invoke-static {p1}, Lcom/miui/gallery/cloud/DeleteAccount;->executeDeleteAccount(I)Z

    const/4 p1, 0x0

    return-object p1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/cloud/DeleteAccount$DeleteAccountTask;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/cloud/DeleteAccount$DeleteAccountTask;->mDialog:Landroid/app/ProgressDialog;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/cloud/DeleteAccount$DeleteAccountTask;->mDialog:Landroid/app/ProgressDialog;

    invoke-virtual {p1}, Landroid/app/ProgressDialog;->dismiss()V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/cloud/DeleteAccount$DeleteAccountTask;->mDialog:Landroid/app/ProgressDialog;

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/cloud/DeleteAccount$DeleteAccountTask;->mListener:Lcom/miui/gallery/cloud/DeleteAccount$DeleteAccountListener;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/cloud/DeleteAccount$DeleteAccountTask;->mListener:Lcom/miui/gallery/cloud/DeleteAccount$DeleteAccountListener;

    invoke-interface {p1}, Lcom/miui/gallery/cloud/DeleteAccount$DeleteAccountListener;->onFinish()V

    :cond_1
    return-void
.end method

.method protected onPreExecute()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/cloud/DeleteAccount$DeleteAccountTask;->mActivity:Landroid/app/Activity;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cloud/DeleteAccount$DeleteAccountTask;->mActivity:Landroid/app/Activity;

    const/4 v1, 0x0

    const v2, 0x7f10042f

    invoke-static {v0, v2, v2, v1, v1}, Lcom/miui/gallery/util/GalleryUtils;->showProgressDialog(Landroid/content/Context;IIIZ)Landroid/app/ProgressDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/cloud/DeleteAccount$DeleteAccountTask;->mDialog:Landroid/app/ProgressDialog;

    :cond_0
    return-void
.end method
