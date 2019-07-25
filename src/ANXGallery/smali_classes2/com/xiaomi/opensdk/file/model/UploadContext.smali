.class public Lcom/xiaomi/opensdk/file/model/UploadContext;
.super Ljava/lang/Object;
.source "UploadContext.java"


# instance fields
.field private isNeedRequestUpload:Z

.field private mCommitString:Ljava/lang/String;

.field private mKssString:Ljava/lang/String;

.field private final mListener:Lcom/xiaomi/opensdk/file/model/MiCloudFileListener;

.field private final mLocalFile:Ljava/io/File;

.field private mMaxChunkSize:J

.field private mSha1:Ljava/lang/String;

.field private mUploadID:Ljava/lang/String;

.field private mUploadParam:Lcom/xiaomi/opensdk/file/model/UploadParameter;


# direct methods
.method public constructor <init>(Ljava/io/File;Lcom/xiaomi/opensdk/file/model/MiCloudFileListener;)V
    .locals 2

    const-wide/32 v0, 0x400000

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/xiaomi/opensdk/file/model/UploadContext;-><init>(Ljava/io/File;Lcom/xiaomi/opensdk/file/model/MiCloudFileListener;J)V

    return-void
.end method

.method public constructor <init>(Ljava/io/File;Lcom/xiaomi/opensdk/file/model/MiCloudFileListener;J)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/xiaomi/opensdk/file/model/UploadContext;->mLocalFile:Ljava/io/File;

    iput-object p2, p0, Lcom/xiaomi/opensdk/file/model/UploadContext;->mListener:Lcom/xiaomi/opensdk/file/model/MiCloudFileListener;

    iput-wide p3, p0, Lcom/xiaomi/opensdk/file/model/UploadContext;->mMaxChunkSize:J

    return-void
.end method


# virtual methods
.method public getCommitString()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/opensdk/file/model/UploadContext;->mCommitString:Ljava/lang/String;

    return-object v0
.end method

.method public getFilePath()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/opensdk/file/model/UploadContext;->mLocalFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFileSize()J
    .locals 2

    iget-object v0, p0, Lcom/xiaomi/opensdk/file/model/UploadContext;->mLocalFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    return-wide v0
.end method

.method public getKssString()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/opensdk/file/model/UploadContext;->mKssString:Ljava/lang/String;

    return-object v0
.end method

.method public getListener()Lcom/xiaomi/opensdk/file/model/MiCloudFileListener;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/opensdk/file/model/UploadContext;->mListener:Lcom/xiaomi/opensdk/file/model/MiCloudFileListener;

    return-object v0
.end method

.method public getLocalFile()Ljava/io/File;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/opensdk/file/model/UploadContext;->mLocalFile:Ljava/io/File;

    return-object v0
.end method

.method public getMaxChunkSize()J
    .locals 2

    iget-wide v0, p0, Lcom/xiaomi/opensdk/file/model/UploadContext;->mMaxChunkSize:J

    return-wide v0
.end method

.method public getSha1()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/opensdk/file/model/UploadContext;->mSha1:Ljava/lang/String;

    return-object v0
.end method

.method public getUploadId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/opensdk/file/model/UploadContext;->mUploadID:Ljava/lang/String;

    return-object v0
.end method

.method public getUploadParam()Lcom/xiaomi/opensdk/file/model/UploadParameter;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/opensdk/file/model/UploadContext;->mUploadParam:Lcom/xiaomi/opensdk/file/model/UploadParameter;

    return-object v0
.end method

.method public isNeedRequestUpload()Z
    .locals 1

    iget-boolean v0, p0, Lcom/xiaomi/opensdk/file/model/UploadContext;->isNeedRequestUpload:Z

    return v0
.end method

.method public setCommitString(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/opensdk/file/model/UploadContext;->mCommitString:Ljava/lang/String;

    return-void
.end method

.method public setKssString(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/opensdk/file/model/UploadContext;->mKssString:Ljava/lang/String;

    return-void
.end method

.method public setNeedRequestUpload(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/xiaomi/opensdk/file/model/UploadContext;->isNeedRequestUpload:Z

    return-void
.end method

.method public setSha1(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/opensdk/file/model/UploadContext;->mSha1:Ljava/lang/String;

    return-void
.end method

.method public setUploadId(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/opensdk/file/model/UploadContext;->mUploadID:Ljava/lang/String;

    return-void
.end method

.method public setUploadParam(Lcom/xiaomi/opensdk/file/model/UploadParameter;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/opensdk/file/model/UploadContext;->mUploadParam:Lcom/xiaomi/opensdk/file/model/UploadParameter;

    return-void
.end method
