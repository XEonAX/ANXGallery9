.class public Lcom/xiaomi/opensdk/file/model/RequestUploadParameter;
.super Ljava/lang/Object;
.source "RequestUploadParameter.java"


# instance fields
.field private mAwsString:Ljava/lang/String;

.field private mFileMimeType:Ljava/lang/String;

.field private mFileName:Ljava/lang/String;

.field private mFileSHA1:Ljava/lang/String;

.field private mFileSize:J

.field private mKssString:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/xiaomi/opensdk/file/model/RequestUploadParameter;->mFileSize:J

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/xiaomi/opensdk/file/model/RequestUploadParameter;->mFileMimeType:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/xiaomi/opensdk/file/model/RequestUploadParameter;->mFileSize:J

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/xiaomi/opensdk/file/model/RequestUploadParameter;->mFileMimeType:Ljava/lang/String;

    iput-object p1, p0, Lcom/xiaomi/opensdk/file/model/RequestUploadParameter;->mKssString:Ljava/lang/String;

    iput-object p2, p0, Lcom/xiaomi/opensdk/file/model/RequestUploadParameter;->mAwsString:Ljava/lang/String;

    iput-object p3, p0, Lcom/xiaomi/opensdk/file/model/RequestUploadParameter;->mFileSHA1:Ljava/lang/String;

    iput-wide p4, p0, Lcom/xiaomi/opensdk/file/model/RequestUploadParameter;->mFileSize:J

    iput-object p6, p0, Lcom/xiaomi/opensdk/file/model/RequestUploadParameter;->mFileName:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getFileSHA1()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/opensdk/file/model/RequestUploadParameter;->mFileSHA1:Ljava/lang/String;

    return-object v0
.end method

.method public getKssString()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/opensdk/file/model/RequestUploadParameter;->mKssString:Ljava/lang/String;

    return-object v0
.end method
