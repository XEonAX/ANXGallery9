.class Lcom/miui/gallery/video/editor/ui/MenuFragment$2;
.super Ljava/lang/Object;
.source "MenuFragment.java"

# interfaces
.implements Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IDownloadListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/video/editor/ui/MenuFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/video/editor/ui/MenuFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/video/editor/ui/MenuFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment$2;->this$0:Lcom/miui/gallery/video/editor/ui/MenuFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/video/editor/ui/MenuFragment$2;Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/video/editor/ui/MenuFragment$2;->unZipDownloadFile(Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;I)V

    return-void
.end method

.method private unZipDownloadFile(Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;I)V
    .locals 9

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment$2;->this$0:Lcom/miui/gallery/video/editor/ui/MenuFragment;

    new-instance v8, Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment$2;->this$0:Lcom/miui/gallery/video/editor/ui/MenuFragment;

    iget-object v2, v1, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;->isTemplate()Z

    move-result v3

    invoke-virtual {p0, p1}, Lcom/miui/gallery/video/editor/ui/MenuFragment$2;->getDownloadPath(Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, p1}, Lcom/miui/gallery/video/editor/ui/MenuFragment$2;->getUnzipPath(Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;)Ljava/lang/String;

    move-result-object v6

    new-instance v7, Lcom/miui/gallery/video/editor/ui/MenuFragment$2$2;

    invoke-direct {v7, p0, p1, p2}, Lcom/miui/gallery/video/editor/ui/MenuFragment$2$2;-><init>(Lcom/miui/gallery/video/editor/ui/MenuFragment$2;Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;I)V

    move-object v1, v8

    move-object v4, p1

    invoke-direct/range {v1 .. v7}, Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;-><init>(Landroid/content/Context;ZLcom/miui/gallery/video/editor/model/VideoEditorBaseModel;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IUnzipFileListener;)V

    invoke-static {v0, v8}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->access$102(Lcom/miui/gallery/video/editor/ui/MenuFragment;Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;)Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment$2;->this$0:Lcom/miui/gallery/video/editor/ui/MenuFragment;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->access$100(Lcom/miui/gallery/video/editor/ui/MenuFragment;)Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;

    move-result-object p1

    const/4 p2, 0x0

    new-array p2, p2, [Ljava/lang/Void;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/video/editor/manager/UnzipTaskManager;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method


# virtual methods
.method public downloadResource(Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;IZ)V
    .locals 9

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment$2;->this$0:Lcom/miui/gallery/video/editor/ui/MenuFragment;

    iget-object v0, v0, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mResourceDownloadManager:Lcom/miui/gallery/video/editor/manager/DownloadManager;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment$2;->this$0:Lcom/miui/gallery/video/editor/ui/MenuFragment;

    new-instance v1, Lcom/miui/gallery/video/editor/manager/DownloadManager;

    invoke-direct {v1}, Lcom/miui/gallery/video/editor/manager/DownloadManager;-><init>()V

    iput-object v1, v0, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mResourceDownloadManager:Lcom/miui/gallery/video/editor/manager/DownloadManager;

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    const-string v0, "MenuFragment"

    const-string v1, "downloadResource start."

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/16 v0, 0x12

    invoke-virtual {p1, v0}, Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;->setDownloadState(I)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment$2;->this$0:Lcom/miui/gallery/video/editor/ui/MenuFragment;

    iget-object v0, v0, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mResourceDownloadManager:Lcom/miui/gallery/video/editor/manager/DownloadManager;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment$2;->this$0:Lcom/miui/gallery/video/editor/ui/MenuFragment;

    iget-object v1, v1, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mIDownloadListener:Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IDownloadListener;

    new-instance v8, Lcom/miui/gallery/video/editor/ui/MenuFragment$2$1;

    move-object v2, v8

    move-object v3, p0

    move v6, p2

    move-object v7, p1

    invoke-direct/range {v2 .. v7}, Lcom/miui/gallery/video/editor/ui/MenuFragment$2$1;-><init>(Lcom/miui/gallery/video/editor/ui/MenuFragment$2;JILcom/miui/gallery/video/editor/model/VideoEditorBaseModel;)V

    invoke-virtual {v0, p1, v1, v8, p3}, Lcom/miui/gallery/video/editor/manager/DownloadManager;->download(Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IDownloadListener;Lcom/miui/gallery/net/download/Request$Listener;Z)V

    return-void
.end method

.method public downloadResourceWithCheck(Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;I)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isNetworkConnected()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment$2;->this$0:Lcom/miui/gallery/video/editor/ui/MenuFragment;

    iget-object p1, p1, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mContext:Landroid/content/Context;

    const p2, 0x7f100727

    invoke-static {p1, p2}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isActiveNetworkMetered()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment$2;->this$0:Lcom/miui/gallery/video/editor/ui/MenuFragment;

    new-instance v1, Lcom/miui/gallery/video/editor/ui/MenuFragment$2$3;

    invoke-direct {v1, p0, p1, p2}, Lcom/miui/gallery/video/editor/ui/MenuFragment$2$3;-><init>(Lcom/miui/gallery/video/editor/ui/MenuFragment$2;Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;I)V

    invoke-static {v0, v1}, Lcom/miui/gallery/video/editor/ui/MenuFragment;->access$200(Lcom/miui/gallery/video/editor/ui/MenuFragment;Lcom/miui/gallery/ui/ConfirmDialog$ConfirmDialogInterface;)V

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/miui/gallery/video/editor/ui/MenuFragment$2;->downloadResource(Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;IZ)V

    :goto_0
    return-void
.end method

.method public getDownloadPath(Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;)Ljava/lang/String;
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment$2;->this$0:Lcom/miui/gallery/video/editor/ui/MenuFragment;

    iget-object v0, v0, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mModuleFactory:Lcom/miui/gallery/video/editor/factory/VideoEditorModuleFactory;

    if-nez v0, :cond_0

    const-string p1, ""

    return-object p1

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment$2;->this$0:Lcom/miui/gallery/video/editor/ui/MenuFragment;

    iget-object v1, v1, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mModuleFactory:Lcom/miui/gallery/video/editor/factory/VideoEditorModuleFactory;

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;->getId()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/miui/gallery/video/editor/factory/VideoEditorModuleFactory;->getTemplateDir(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ".zip"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getUnzipPath(Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;)Ljava/lang/String;
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/video/editor/ui/MenuFragment$2;->this$0:Lcom/miui/gallery/video/editor/ui/MenuFragment;

    iget-object p1, p1, Lcom/miui/gallery/video/editor/ui/MenuFragment;->mModuleFactory:Lcom/miui/gallery/video/editor/factory/VideoEditorModuleFactory;

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/factory/VideoEditorModuleFactory;->getUnzipPath()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
