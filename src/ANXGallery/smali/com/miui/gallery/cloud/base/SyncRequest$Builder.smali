.class public Lcom/miui/gallery/cloud/base/SyncRequest$Builder;
.super Ljava/lang/Object;
.source "SyncRequest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cloud/base/SyncRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private mIsDelayUpload:Z

.field private mIsManual:Z

.field private mSyncReason:J

.field private mSyncType:Lcom/miui/gallery/cloud/base/SyncType;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/cloud/base/SyncRequest$Builder;)Lcom/miui/gallery/cloud/base/SyncType;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->mSyncType:Lcom/miui/gallery/cloud/base/SyncType;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/cloud/base/SyncRequest$Builder;)J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->mSyncReason:J

    return-wide v0
.end method

.method static synthetic access$200(Lcom/miui/gallery/cloud/base/SyncRequest$Builder;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->mIsDelayUpload:Z

    return p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/cloud/base/SyncRequest$Builder;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->mIsManual:Z

    return p0
.end method


# virtual methods
.method public build()Lcom/miui/gallery/cloud/base/SyncRequest;
    .locals 2

    new-instance v0, Lcom/miui/gallery/cloud/base/SyncRequest;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/cloud/base/SyncRequest;-><init>(Lcom/miui/gallery/cloud/base/SyncRequest$Builder;Lcom/miui/gallery/cloud/base/SyncRequest$1;)V

    return-object v0
.end method

.method public cloneFrom(Lcom/miui/gallery/cloud/base/SyncRequest;)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;
    .locals 2

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/SyncRequest;->getSyncType()Lcom/miui/gallery/cloud/base/SyncType;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->mSyncType:Lcom/miui/gallery/cloud/base/SyncType;

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/SyncRequest;->getSyncReason()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->mSyncReason:J

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/SyncRequest;->isDelayUpload()Z

    move-result v0

    iput-boolean v0, p0, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->mIsDelayUpload:Z

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/SyncRequest;->isManual()Z

    move-result p1

    iput-boolean p1, p0, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->mIsManual:Z

    return-object p0
.end method

.method public setDelayUpload(Z)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->mIsDelayUpload:Z

    return-object p0
.end method

.method public setManual(Z)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->mIsManual:Z

    return-object p0
.end method

.method public setSyncReason(J)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->mSyncReason:J

    return-object p0
.end method

.method public setSyncType(Lcom/miui/gallery/cloud/base/SyncType;)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->mSyncType:Lcom/miui/gallery/cloud/base/SyncType;

    return-object p0
.end method
