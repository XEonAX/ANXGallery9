.class public abstract Lcom/miui/gallery/cloud/RequestItemBase;
.super Ljava/lang/Object;
.source "RequestItemBase.java"


# static fields
.field public static final DELAY_UPLOAD_TIME:J

.field public static final PRI_THREAD:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static isUpload:Z


# instance fields
.field public commitRetryTimes:I

.field public createRetryTimes:I

.field public final delayInMillis:J

.field public kssRetryTimes:I

.field public mDownloadedSize:J

.field public mTotalSize:J

.field public needReRequest:Z

.field public otherRetryTimes:I

.field public final priority:I

.field public requestId:Ljava/lang/String;

.field public requestIds:Ljava/lang/String;

.field public result:Lcom/miui/gallery/cloud/base/GallerySyncCode;

.field public retryAfter:J

.field public final startInMillis:J

.field private status:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    invoke-static {}, Lcom/google/common/collect/Maps;->newHashMap()Ljava/util/HashMap;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-interface {v0, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-interface {v0, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-interface {v0, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v2, 0x3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-interface {v0, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v2, 0x4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-interface {v0, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v2, 0x5

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-interface {v0, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v2, 0x6

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-interface {v0, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v2, 0x7

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-interface {v0, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v2, 0x8

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v2, 0x9

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v2, 0xa

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v2, 0xb

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v2, 0xc

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v2, 0xd

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/cloud/RequestItemBase;->PRI_THREAD:Ljava/util/Map;

    invoke-static {}, Lcom/miui/gallery/cloud/SyncConditionManager;->sGetSyncConfig()Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->getDelayUploadTime()J

    move-result-wide v0

    sput-wide v0, Lcom/miui/gallery/cloud/RequestItemBase;->DELAY_UPLOAD_TIME:J

    return-void
.end method

.method public constructor <init>(I)V
    .locals 2

    const-wide/16 v0, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/miui/gallery/cloud/RequestItemBase;-><init>(IJ)V

    return-void
.end method

.method public constructor <init>(IJ)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/cloud/RequestItemBase;->needReRequest:Z

    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v1, p0, Lcom/miui/gallery/cloud/RequestItemBase;->status:Ljava/util/concurrent/atomic/AtomicInteger;

    iput p1, p0, Lcom/miui/gallery/cloud/RequestItemBase;->priority:I

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/cloud/RequestItemBase;->startInMillis:J

    iput-wide p2, p0, Lcom/miui/gallery/cloud/RequestItemBase;->delayInMillis:J

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/RequestItemBase;->init()V

    return-void
.end method

.method protected static getDelay(Lcom/miui/gallery/data/DBImage;)J
    .locals 12

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getLocalFlag()I

    move-result v0

    const/4 v1, 0x7

    if-ne v0, v1, :cond_1

    sget-boolean v0, Lcom/miui/gallery/cloud/RequestItemBase;->isUpload:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getLocalFile()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    sget-wide v2, Lcom/miui/gallery/cloud/RequestItemBase;->DELAY_UPLOAD_TIME:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v0

    sub-long v6, v2, v4

    const-wide/16 v8, 0x0

    sget-wide v10, Lcom/miui/gallery/cloud/RequestItemBase;->DELAY_UPLOAD_TIME:J

    invoke-static/range {v6 .. v11}, Lcom/miui/gallery/util/Utils;->clamp(JJJ)J

    move-result-wide v0

    return-wide v0

    :cond_1
    :goto_0
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public static getDownloadTypeByPriority(I)I
    .locals 0

    packed-switch p0, :pswitch_data_0

    const/4 p0, 0x0

    goto :goto_0

    :pswitch_0
    const/4 p0, 0x3

    goto :goto_0

    :pswitch_1
    const/4 p0, 0x4

    goto :goto_0

    :pswitch_2
    const/4 p0, 0x1

    goto :goto_0

    :pswitch_3
    const/4 p0, 0x2

    :goto_0
    return p0

    nop

    :pswitch_data_0
    .packed-switch 0x6
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_2
    .end packed-switch
.end method

.method public static isBackgroundPriority(I)Z
    .locals 1

    sget-object v0, Lcom/miui/gallery/cloud/RequestItemBase;->PRI_THREAD:Ljava/util/Map;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0
.end method

.method public static isCancellablePriority(I)Z
    .locals 1

    const/4 v0, 0x1

    if-eqz p0, :cond_0

    if-eq p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public compareAndSetStatus(II)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/RequestItemBase;->status:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0, p1, p2}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result p1

    return p1
.end method

.method public getDelayToExecuteInMillis(J)J
    .locals 4

    iget-wide v0, p0, Lcom/miui/gallery/cloud/RequestItemBase;->startInMillis:J

    iget-wide v2, p0, Lcom/miui/gallery/cloud/RequestItemBase;->delayInMillis:J

    add-long/2addr v0, v2

    sub-long/2addr v0, p1

    return-wide v0
.end method

.method public getDownloadType()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/cloud/RequestItemBase;->priority:I

    invoke-static {v0}, Lcom/miui/gallery/cloud/RequestItemBase;->getDownloadTypeByPriority(I)I

    move-result v0

    return v0
.end method

.method public abstract getItems()Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/cloud/RequestItemBase;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getRequestLimitAGroup()I
.end method

.method public getStatus()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/RequestItemBase;->status:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    return v0
.end method

.method protected init()V
    .locals 3

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/cloud/RequestItemBase;->createRetryTimes:I

    iput v0, p0, Lcom/miui/gallery/cloud/RequestItemBase;->commitRetryTimes:I

    iput v0, p0, Lcom/miui/gallery/cloud/RequestItemBase;->kssRetryTimes:I

    iput v0, p0, Lcom/miui/gallery/cloud/RequestItemBase;->otherRetryTimes:I

    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lcom/miui/gallery/cloud/RequestItemBase;->retryAfter:J

    iput-boolean v0, p0, Lcom/miui/gallery/cloud/RequestItemBase;->needReRequest:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/cloud/RequestItemBase;->requestId:Ljava/lang/String;

    iput-object v0, p0, Lcom/miui/gallery/cloud/RequestItemBase;->requestIds:Ljava/lang/String;

    iput-wide v1, p0, Lcom/miui/gallery/cloud/RequestItemBase;->mDownloadedSize:J

    iput-wide v1, p0, Lcom/miui/gallery/cloud/RequestItemBase;->mTotalSize:J

    iput-object v0, p0, Lcom/miui/gallery/cloud/RequestItemBase;->result:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    return-void
.end method

.method public abstract isInSameAlbum(Lcom/miui/gallery/cloud/RequestItemBase;)Z
.end method

.method public setStatus(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/RequestItemBase;->status:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    return-void
.end method

.method public abstract supportMultiRequest()Z
.end method
