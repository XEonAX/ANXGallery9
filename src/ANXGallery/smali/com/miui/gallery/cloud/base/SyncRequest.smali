.class public Lcom/miui/gallery/cloud/base/SyncRequest;
.super Ljava/lang/Object;
.source "SyncRequest.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/cloud/base/SyncRequest$Builder;
    }
.end annotation


# instance fields
.field private mIsDelayUpload:Z

.field private mIsManual:Z

.field private mSyncReason:J

.field private mSyncType:Lcom/miui/gallery/cloud/base/SyncType;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/cloud/base/SyncRequest$Builder;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lcom/miui/gallery/cloud/base/SyncType;->NORMAL:Lcom/miui/gallery/cloud/base/SyncType;

    iput-object v0, p0, Lcom/miui/gallery/cloud/base/SyncRequest;->mSyncType:Lcom/miui/gallery/cloud/base/SyncType;

    const-wide v0, 0x7fffffffffffffffL

    iput-wide v0, p0, Lcom/miui/gallery/cloud/base/SyncRequest;->mSyncReason:J

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/cloud/base/SyncRequest;->mIsDelayUpload:Z

    invoke-static {p1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->access$000(Lcom/miui/gallery/cloud/base/SyncRequest$Builder;)Lcom/miui/gallery/cloud/base/SyncType;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/cloud/base/SyncRequest;->mSyncType:Lcom/miui/gallery/cloud/base/SyncType;

    invoke-static {p1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->access$100(Lcom/miui/gallery/cloud/base/SyncRequest$Builder;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/cloud/base/SyncRequest;->mSyncReason:J

    invoke-static {p1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->access$200(Lcom/miui/gallery/cloud/base/SyncRequest$Builder;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/miui/gallery/cloud/base/SyncRequest;->mIsDelayUpload:Z

    invoke-static {p1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->access$300(Lcom/miui/gallery/cloud/base/SyncRequest$Builder;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/miui/gallery/cloud/base/SyncRequest;->mIsManual:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/cloud/base/SyncRequest$Builder;Lcom/miui/gallery/cloud/base/SyncRequest$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/base/SyncRequest;-><init>(Lcom/miui/gallery/cloud/base/SyncRequest$Builder;)V

    return-void
.end method


# virtual methods
.method public getSyncReason()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/cloud/base/SyncRequest;->mSyncReason:J

    return-wide v0
.end method

.method public getSyncType()Lcom/miui/gallery/cloud/base/SyncType;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/base/SyncRequest;->mSyncType:Lcom/miui/gallery/cloud/base/SyncType;

    return-object v0
.end method

.method public isDelayUpload()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/cloud/base/SyncRequest;->mIsDelayUpload:Z

    return v0
.end method

.method public isManual()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/cloud/base/SyncRequest;->mIsManual:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Request {syncType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/cloud/base/SyncRequest;->mSyncType:Lcom/miui/gallery/cloud/base/SyncType;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", reason="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/miui/gallery/cloud/base/SyncRequest;->mSyncReason:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", delayUpload="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/miui/gallery/cloud/base/SyncRequest;->mIsDelayUpload:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", manual="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/miui/gallery/cloud/base/SyncRequest;->mIsManual:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
