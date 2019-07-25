.class public Lcom/xiaomi/micloudsdk/file/MiCloudFileMaster;
.super Ljava/lang/Object;
.source "MiCloudFileMaster.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private mRequestor:Lcom/xiaomi/micloudsdk/file/MiCloudFileRequestor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/xiaomi/micloudsdk/file/MiCloudFileRequestor<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/xiaomi/micloudsdk/file/MiCloudFileRequestor;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/xiaomi/micloudsdk/file/MiCloudFileRequestor<",
            "TT;>;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/xiaomi/micloudsdk/file/MiCloudFileMaster;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/xiaomi/micloudsdk/file/MiCloudFileMaster;->mRequestor:Lcom/xiaomi/micloudsdk/file/MiCloudFileRequestor;

    return-void
.end method


# virtual methods
.method public download(Ljava/lang/Object;Ljava/io/File;Lcom/xiaomi/opensdk/file/model/MiCloudFileListener;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/io/File;",
            "Lcom/xiaomi/opensdk/file/model/MiCloudFileListener;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/opensdk/exception/RetriableException;,
            Lcom/xiaomi/opensdk/exception/UnretriableException;,
            Lcom/xiaomi/opensdk/exception/AuthenticationException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    if-eqz p2, :cond_1

    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/micloudsdk/file/MiCloudFileMaster;->mRequestor:Lcom/xiaomi/micloudsdk/file/MiCloudFileRequestor;

    invoke-virtual {v0, p1}, Lcom/xiaomi/micloudsdk/file/MiCloudFileRequestor;->requestDownload(Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    iget-object v1, p0, Lcom/xiaomi/micloudsdk/file/MiCloudFileMaster;->mRequestor:Lcom/xiaomi/micloudsdk/file/MiCloudFileRequestor;

    invoke-virtual {v1, p1, v0}, Lcom/xiaomi/micloudsdk/file/MiCloudFileRequestor;->handleRequestDownloadResultJson(Ljava/lang/Object;Lorg/json/JSONObject;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "data"

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    iget-object v0, p0, Lcom/xiaomi/micloudsdk/file/MiCloudFileMaster;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/opensdk/file/model/MiCloudFileClient;->getInstance(Landroid/content/Context;)Lcom/xiaomi/opensdk/file/model/MiCloudFileClient;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/xiaomi/opensdk/file/model/MiCloudFileClient;->getDownloadParameterForSFS(Lorg/json/JSONObject;)Lcom/xiaomi/opensdk/file/model/DownloadParameter;

    move-result-object p1

    iget-object v0, p0, Lcom/xiaomi/micloudsdk/file/MiCloudFileMaster;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/opensdk/file/model/MiCloudFileClient;->getInstance(Landroid/content/Context;)Lcom/xiaomi/opensdk/file/model/MiCloudFileClient;

    move-result-object v0

    invoke-virtual {v0, p2, p1, p3}, Lcom/xiaomi/opensdk/file/model/MiCloudFileClient;->download(Ljava/io/File;Lcom/xiaomi/opensdk/file/model/DownloadParameter;Lcom/xiaomi/opensdk/file/model/MiCloudFileListener;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-void

    :catch_0
    move-exception p1

    new-instance p2, Lcom/xiaomi/opensdk/exception/UnretriableException;

    invoke-direct {p2, p1}, Lcom/xiaomi/opensdk/exception/UnretriableException;-><init>(Ljava/lang/Throwable;)V

    throw p2

    :cond_1
    new-instance p1, Lcom/xiaomi/opensdk/exception/UnretriableException;

    const-string p2, "\u53c2\u6570\u9519\u8bef\uff0c\u8bf7\u53c2\u8003API\u6587\u6863"

    invoke-direct {p1, p2}, Lcom/xiaomi/opensdk/exception/UnretriableException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public upload(Ljava/lang/Object;Ljava/io/File;Lcom/xiaomi/opensdk/file/model/MiCloudFileListener;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/io/File;",
            "Lcom/xiaomi/opensdk/file/model/MiCloudFileListener;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/opensdk/exception/RetriableException;,
            Lcom/xiaomi/opensdk/exception/UnretriableException;,
            Lcom/xiaomi/opensdk/exception/AuthenticationException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    if-eqz p1, :cond_2

    if-eqz p2, :cond_2

    new-instance v0, Lcom/xiaomi/opensdk/file/model/UploadContext;

    invoke-direct {v0, p2, p3}, Lcom/xiaomi/opensdk/file/model/UploadContext;-><init>(Ljava/io/File;Lcom/xiaomi/opensdk/file/model/MiCloudFileListener;)V

    iget-object p2, p0, Lcom/xiaomi/micloudsdk/file/MiCloudFileMaster;->mContext:Landroid/content/Context;

    invoke-static {p2}, Lcom/xiaomi/opensdk/file/model/MiCloudFileClient;->getInstance(Landroid/content/Context;)Lcom/xiaomi/opensdk/file/model/MiCloudFileClient;

    move-result-object p2

    invoke-virtual {p2, v0}, Lcom/xiaomi/opensdk/file/model/MiCloudFileClient;->upload(Lcom/xiaomi/opensdk/file/model/UploadContext;)V

    const/4 p2, 0x0

    :goto_0
    :try_start_0
    invoke-virtual {v0}, Lcom/xiaomi/opensdk/file/model/UploadContext;->isNeedRequestUpload()Z

    move-result p3

    if-eqz p3, :cond_1

    const/4 p3, 0x5

    if-ge p2, p3, :cond_1

    iget-object p3, p0, Lcom/xiaomi/micloudsdk/file/MiCloudFileMaster;->mContext:Landroid/content/Context;

    invoke-static {p3}, Lcom/xiaomi/opensdk/file/model/MiCloudFileClient;->getInstance(Landroid/content/Context;)Lcom/xiaomi/opensdk/file/model/MiCloudFileClient;

    move-result-object p3

    invoke-virtual {p3, v0}, Lcom/xiaomi/opensdk/file/model/MiCloudFileClient;->getRequestUploadParameter(Lcom/xiaomi/opensdk/file/model/UploadContext;)Lcom/xiaomi/opensdk/file/model/RequestUploadParameter;

    move-result-object p3

    iget-object v1, p0, Lcom/xiaomi/micloudsdk/file/MiCloudFileMaster;->mRequestor:Lcom/xiaomi/micloudsdk/file/MiCloudFileRequestor;

    invoke-virtual {v1, p1, p3}, Lcom/xiaomi/micloudsdk/file/MiCloudFileRequestor;->requestUpload(Ljava/lang/Object;Lcom/xiaomi/opensdk/file/model/RequestUploadParameter;)Lorg/json/JSONObject;

    move-result-object p3

    iget-object v1, p0, Lcom/xiaomi/micloudsdk/file/MiCloudFileMaster;->mRequestor:Lcom/xiaomi/micloudsdk/file/MiCloudFileRequestor;

    invoke-virtual {v1, p1, p3}, Lcom/xiaomi/micloudsdk/file/MiCloudFileRequestor;->handleRequestUploadResultJson(Ljava/lang/Object;Lorg/json/JSONObject;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    const-string v1, "data"

    invoke-virtual {p3, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p3

    iget-object v1, p0, Lcom/xiaomi/micloudsdk/file/MiCloudFileMaster;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/xiaomi/opensdk/file/model/MiCloudFileClient;->getInstance(Landroid/content/Context;)Lcom/xiaomi/opensdk/file/model/MiCloudFileClient;

    move-result-object v1

    invoke-virtual {v1, p3}, Lcom/xiaomi/opensdk/file/model/MiCloudFileClient;->getUploadParameterForSFS(Lorg/json/JSONObject;)Lcom/xiaomi/opensdk/file/model/UploadParameter;

    move-result-object p3

    invoke-virtual {v0, p3}, Lcom/xiaomi/opensdk/file/model/UploadContext;->setUploadParam(Lcom/xiaomi/opensdk/file/model/UploadParameter;)V

    iget-object p3, p0, Lcom/xiaomi/micloudsdk/file/MiCloudFileMaster;->mContext:Landroid/content/Context;

    invoke-static {p3}, Lcom/xiaomi/opensdk/file/model/MiCloudFileClient;->getInstance(Landroid/content/Context;)Lcom/xiaomi/opensdk/file/model/MiCloudFileClient;

    move-result-object p3

    invoke-virtual {p3, v0}, Lcom/xiaomi/opensdk/file/model/MiCloudFileClient;->upload(Lcom/xiaomi/opensdk/file/model/UploadContext;)V

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_0
    return-object v1

    :cond_1
    iget-object p2, p0, Lcom/xiaomi/micloudsdk/file/MiCloudFileMaster;->mContext:Landroid/content/Context;

    invoke-static {p2}, Lcom/xiaomi/opensdk/file/model/MiCloudFileClient;->getInstance(Landroid/content/Context;)Lcom/xiaomi/opensdk/file/model/MiCloudFileClient;

    move-result-object p2

    invoke-virtual {p2, v0}, Lcom/xiaomi/opensdk/file/model/MiCloudFileClient;->getCommitParameter(Lcom/xiaomi/opensdk/file/model/UploadContext;)Lcom/xiaomi/opensdk/file/model/CommitParameter;

    move-result-object p2

    iget-object p3, p0, Lcom/xiaomi/micloudsdk/file/MiCloudFileMaster;->mRequestor:Lcom/xiaomi/micloudsdk/file/MiCloudFileRequestor;

    invoke-virtual {p3, p1, p2}, Lcom/xiaomi/micloudsdk/file/MiCloudFileRequestor;->commitUpload(Ljava/lang/Object;Lcom/xiaomi/opensdk/file/model/CommitParameter;)Lorg/json/JSONObject;

    move-result-object p2

    iget-object p3, p0, Lcom/xiaomi/micloudsdk/file/MiCloudFileMaster;->mRequestor:Lcom/xiaomi/micloudsdk/file/MiCloudFileRequestor;

    invoke-virtual {p3, p1, p2}, Lcom/xiaomi/micloudsdk/file/MiCloudFileRequestor;->handleCommitUploadResult(Ljava/lang/Object;Lorg/json/JSONObject;)Ljava/lang/Object;

    move-result-object p1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    new-instance p2, Lcom/xiaomi/opensdk/exception/UnretriableException;

    invoke-direct {p2, p1}, Lcom/xiaomi/opensdk/exception/UnretriableException;-><init>(Ljava/lang/Throwable;)V

    throw p2

    :cond_2
    new-instance p1, Lcom/xiaomi/opensdk/exception/UnretriableException;

    const-string p2, "\u53c2\u6570\u9519\u8bef\uff0c\u8bf7\u53c2\u8003API\u6587\u6863"

    invoke-direct {p1, p2}, Lcom/xiaomi/opensdk/exception/UnretriableException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
