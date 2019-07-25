.class public Lcom/xiaomi/opensdk/file/model/CommitParameter;
.super Ljava/lang/Object;
.source "CommitParameter.java"


# instance fields
.field private mAwsString:Ljava/lang/String;

.field private mFileSHA1:Ljava/lang/String;

.field private mFileSize:J

.field private mKssString:Ljava/lang/String;

.field private mUploadId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/xiaomi/opensdk/file/model/CommitParameter;->mFileSize:J

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/xiaomi/opensdk/file/model/CommitParameter;->mFileSize:J

    iput-object p1, p0, Lcom/xiaomi/opensdk/file/model/CommitParameter;->mKssString:Ljava/lang/String;

    iput-object p2, p0, Lcom/xiaomi/opensdk/file/model/CommitParameter;->mAwsString:Ljava/lang/String;

    iput-object p3, p0, Lcom/xiaomi/opensdk/file/model/CommitParameter;->mUploadId:Ljava/lang/String;

    iput-object p4, p0, Lcom/xiaomi/opensdk/file/model/CommitParameter;->mFileSHA1:Ljava/lang/String;

    iput-wide p5, p0, Lcom/xiaomi/opensdk/file/model/CommitParameter;->mFileSize:J

    return-void
.end method


# virtual methods
.method public getKssString()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/opensdk/file/model/CommitParameter;->mKssString:Ljava/lang/String;

    return-object v0
.end method

.method public getUploadId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/opensdk/file/model/CommitParameter;->mUploadId:Ljava/lang/String;

    return-object v0
.end method
