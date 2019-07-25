.class Lcom/miui/gallery/video/editor/manager/DownloadManager$1;
.super Ljava/lang/Object;
.source "DownloadManager.java"

# interfaces
.implements Lcom/miui/gallery/net/base/ResponseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/video/editor/manager/DownloadManager;->download(Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IDownloadListener;Lcom/miui/gallery/net/download/Request$Listener;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/video/editor/manager/DownloadManager;

.field final synthetic val$downloadHelper:Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IDownloadListener;

.field final synthetic val$isActiveNetworkMetered:Z

.field final synthetic val$listener:Lcom/miui/gallery/net/download/Request$Listener;

.field final synthetic val$resource:Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;


# direct methods
.method constructor <init>(Lcom/miui/gallery/video/editor/manager/DownloadManager;Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IDownloadListener;Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;ZLcom/miui/gallery/net/download/Request$Listener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/manager/DownloadManager$1;->this$0:Lcom/miui/gallery/video/editor/manager/DownloadManager;

    iput-object p2, p0, Lcom/miui/gallery/video/editor/manager/DownloadManager$1;->val$downloadHelper:Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IDownloadListener;

    iput-object p3, p0, Lcom/miui/gallery/video/editor/manager/DownloadManager$1;->val$resource:Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;

    iput-boolean p4, p0, Lcom/miui/gallery/video/editor/manager/DownloadManager$1;->val$isActiveNetworkMetered:Z

    iput-object p5, p0, Lcom/miui/gallery/video/editor/manager/DownloadManager$1;->val$listener:Lcom/miui/gallery/net/download/Request$Listener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs onResponse([Ljava/lang/Object;)V
    .locals 5

    const/4 v0, 0x0

    aget-object p1, p1, v0

    check-cast p1, Lcom/miui/gallery/net/resource/DownloadInfo;

    const-string v1, "DownloadManager"

    const-string v2, "download %s, %s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p1, Lcom/miui/gallery/net/resource/DownloadInfo;->url:Ljava/lang/String;

    aput-object v4, v3, v0

    iget-object v0, p1, Lcom/miui/gallery/net/resource/DownloadInfo;->sha1:Ljava/lang/String;

    const/4 v4, 0x1

    aput-object v0, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/miui/gallery/video/editor/manager/DownloadManager$1;->val$downloadHelper:Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IDownloadListener;

    iget-object v2, p0, Lcom/miui/gallery/video/editor/manager/DownloadManager$1;->val$resource:Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;

    invoke-interface {v1, v2}, Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IDownloadListener;->getDownloadPath(Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "DownloadManager"

    const-string v2, "the file already exist and its path is : %s"

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    :cond_0
    new-instance v1, Lcom/miui/gallery/net/download/Request;

    iget-object v2, p1, Lcom/miui/gallery/net/resource/DownloadInfo;->url:Ljava/lang/String;

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/miui/gallery/net/download/Request;-><init>(Landroid/net/Uri;Ljava/io/File;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/manager/DownloadManager$1;->this$0:Lcom/miui/gallery/video/editor/manager/DownloadManager;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/manager/DownloadManager;->access$000(Lcom/miui/gallery/video/editor/manager/DownloadManager;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v0, Lcom/miui/gallery/net/download/Verifier$Sha1;

    iget-object p1, p1, Lcom/miui/gallery/net/resource/DownloadInfo;->sha1:Ljava/lang/String;

    invoke-direct {v0, p1}, Lcom/miui/gallery/net/download/Verifier$Sha1;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Lcom/miui/gallery/net/download/Request;->setVerifier(Lcom/miui/gallery/net/download/Verifier;)V

    iget-boolean p1, p0, Lcom/miui/gallery/video/editor/manager/DownloadManager$1;->val$isActiveNetworkMetered:Z

    invoke-virtual {v1, p1}, Lcom/miui/gallery/net/download/Request;->setAllowedOverMetered(Z)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/manager/DownloadManager$1;->val$listener:Lcom/miui/gallery/net/download/Request$Listener;

    invoke-virtual {v1, p1}, Lcom/miui/gallery/net/download/Request;->setListener(Lcom/miui/gallery/net/download/Request$Listener;)V

    sget-object p1, Lcom/miui/gallery/net/download/GalleryDownloadManager;->INSTANCE:Lcom/miui/gallery/net/download/GalleryDownloadManager;

    invoke-virtual {p1, v1}, Lcom/miui/gallery/net/download/GalleryDownloadManager;->enqueue(Lcom/miui/gallery/net/download/Request;)Z

    return-void
.end method

.method public onResponseError(Lcom/miui/gallery/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    iget-object p3, p0, Lcom/miui/gallery/video/editor/manager/DownloadManager$1;->val$listener:Lcom/miui/gallery/net/download/Request$Listener;

    const/4 v0, -0x1

    invoke-interface {p3, v0}, Lcom/miui/gallery/net/download/Request$Listener;->onComplete(I)V

    const-string p3, "DownloadManager"

    const-string v0, "errorMessage:%s,errorCode.name:5s"

    invoke-virtual {p1}, Lcom/miui/gallery/net/base/ErrorCode;->name()Ljava/lang/String;

    move-result-object p1

    invoke-static {p3, v0, p2, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method
