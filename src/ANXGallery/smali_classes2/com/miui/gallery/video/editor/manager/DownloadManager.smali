.class public Lcom/miui/gallery/video/editor/manager/DownloadManager;
.super Ljava/lang/Object;
.source "DownloadManager.java"


# instance fields
.field private mRequestList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/net/download/Request;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/manager/DownloadManager;->mRequestList:Ljava/util/List;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/video/editor/manager/DownloadManager;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/editor/manager/DownloadManager;->mRequestList:Ljava/util/List;

    return-object p0
.end method


# virtual methods
.method public cancelAll()V
    .locals 3

    invoke-static {}, Lcom/miui/gallery/net/HttpManager;->getInstance()Lcom/miui/gallery/net/HttpManager;

    move-result-object v0

    const-string v1, "DownloadManager"

    invoke-virtual {v0, v1}, Lcom/miui/gallery/net/HttpManager;->cancelAll(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/manager/DownloadManager;->mRequestList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/net/download/Request;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/miui/gallery/net/download/Request;->setListener(Lcom/miui/gallery/net/download/Request$Listener;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public download(Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IDownloadListener;Lcom/miui/gallery/net/download/Request$Listener;Z)V
    .locals 9

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;->getId()J

    move-result-wide v0

    const-string v2, "DownloadManager"

    const-string v3, "downloading: %d"

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v2, Lcom/miui/gallery/net/resource/DownloadRequest;

    invoke-direct {v2, v0, v1}, Lcom/miui/gallery/net/resource/DownloadRequest;-><init>(J)V

    const-string v0, "DownloadManager"

    invoke-virtual {v2, v0}, Lcom/miui/gallery/net/resource/DownloadRequest;->setTag(Ljava/lang/Object;)Lcom/miui/gallery/net/base/BaseRequest;

    new-instance v0, Lcom/miui/gallery/video/editor/manager/DownloadManager$1;

    move-object v3, v0

    move-object v4, p0

    move-object v5, p2

    move-object v6, p1

    move v7, p4

    move-object v8, p3

    invoke-direct/range {v3 .. v8}, Lcom/miui/gallery/video/editor/manager/DownloadManager$1;-><init>(Lcom/miui/gallery/video/editor/manager/DownloadManager;Lcom/miui/gallery/video/editor/interfaces/IVideoEditorListener$IDownloadListener;Lcom/miui/gallery/video/editor/model/VideoEditorBaseModel;ZLcom/miui/gallery/net/download/Request$Listener;)V

    invoke-virtual {v2, v0}, Lcom/miui/gallery/net/resource/DownloadRequest;->execute(Lcom/miui/gallery/net/base/ResponseListener;)V

    return-void
.end method
