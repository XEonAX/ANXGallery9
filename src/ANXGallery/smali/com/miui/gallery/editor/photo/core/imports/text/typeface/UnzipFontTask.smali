.class public Lcom/miui/gallery/editor/photo/core/imports/text/typeface/UnzipFontTask;
.super Landroid/os/AsyncTask;
.source "UnzipFontTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field private mCallBack:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadCallback;

.field private mResource:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadCallback;)V
    .locals 0

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/UnzipFontTask;->mResource:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/UnzipFontTask;->mCallBack:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadCallback;

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Boolean;
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/UnzipFontTask;->isCancelled()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/UnzipFontTask;->mResource:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;->getDownloadFilePath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/UnzipUtils;->unZipFile(Ljava/lang/String;)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/UnzipFontTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Ljava/lang/Boolean;)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/UnzipFontTask;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/UnzipFontTask;->mCallBack:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadCallback;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/UnzipFontTask;->mCallBack:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadCallback;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-interface {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadCallback;->onCompleted(Z)V

    :cond_1
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/UnzipFontTask;->onPostExecute(Ljava/lang/Boolean;)V

    return-void
.end method

.method public release()V
    .locals 1

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/UnzipFontTask;->cancel(Z)Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/UnzipFontTask;->mCallBack:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadCallback;

    return-void
.end method
