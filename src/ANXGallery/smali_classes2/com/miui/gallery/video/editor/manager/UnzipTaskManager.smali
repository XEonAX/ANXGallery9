.class public Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;
.super Landroid/os/AsyncTask;
.source "UnzipTaskManager.java"


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
.field private TAG:Ljava/lang/String;

.field private mContext:Landroid/content/Context;

.field private mData:Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;

.field private mIsTemplate:Z

.field private mUnZipPath:Ljava/lang/String;

.field private mUnzipFileListener:Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IUnzipFileListener;

.field private mZipPath:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;ZLcom/miui/gallery/video/editor/model/VideoEditorBaseModel;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IUnzipFileListener;)V
    .locals 1

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    const-string v0, "UnzipTaskManager"

    iput-object v0, p0, Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;->TAG:Ljava/lang/String;

    iput-object p1, p0, Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;->mContext:Landroid/content/Context;

    iput-boolean p2, p0, Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;->mIsTemplate:Z

    iput-object p3, p0, Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;->mData:Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;

    iput-object p4, p0, Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;->mZipPath:Ljava/lang/String;

    iput-object p6, p0, Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;->mUnzipFileListener:Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IUnzipFileListener;

    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;->mZipPath:Ljava/lang/String;

    iput-object p1, p0, Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;->mUnZipPath:Ljava/lang/String;

    goto :goto_0

    :cond_0
    iput-object p5, p0, Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;->mUnZipPath:Ljava/lang/String;

    :goto_0
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Boolean;
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;->mContext:Landroid/content/Context;

    if-eqz p1, :cond_1

    iget-boolean p1, p0, Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;->mIsTemplate:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;->mZipPath:Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;->mUnZipPath:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/miui/gallery/video/editor/util/FileHelper;->unZipTemplateFile(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;->mUnZipPath:Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;->mData:Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;->getFileName()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/video/editor/util/FileHelper;->unZipFile(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;->mUnZipPath:Ljava/lang/String;

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;->mUnZipPath:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;->mData:Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;->mUnZipPath:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;->setUnZipPath(Ljava/lang/String;)V

    const/4 p1, 0x1

    goto :goto_1

    :cond_1
    const/4 p1, 0x0

    :goto_1
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;->doInBackground([Ljava/lang/Void;)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Ljava/lang/Boolean;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;->mData:Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;->TAG:Ljava/lang/String;

    const-string v0, "file unzip success"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;->mUnzipFileListener:Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IUnzipFileListener;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;->mUnzipFileListener:Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IUnzipFileListener;

    invoke-interface {p1}, Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IUnzipFileListener;->onUzipFileSuccess()V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;->TAG:Ljava/lang/String;

    const-string v0, "file unzip fail"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;->mUnzipFileListener:Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IUnzipFileListener;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;->mUnzipFileListener:Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IUnzipFileListener;

    invoke-interface {p1}, Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IUnzipFileListener;->onUnzipFileFailed()V

    :cond_1
    :goto_0
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;->onPostExecute(Ljava/lang/Boolean;)V

    return-void
.end method

.method public setListener(Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IUnzipFileListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;->mUnzipFileListener:Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IUnzipFileListener;

    return-void
.end method
