.class public Lcom/miui/gallery/monitor/FileLog;
.super Ljava/lang/Object;
.source "FileLog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/monitor/FileLog$LogTask;
    }
.end annotation


# instance fields
.field private mActiveCache:I

.field private final mCache0:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mCache1:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mLock:Ljava/lang/Object;

.field private final mTask:Lcom/miui/gallery/monitor/FileLog$LogTask;


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/monitor/FileLog;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/monitor/FileLog;->mLock:Ljava/lang/Object;

    new-instance v0, Lcom/miui/gallery/monitor/FileLog$LogTask;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/monitor/FileLog$LogTask;-><init>(Lcom/miui/gallery/monitor/FileLog;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/miui/gallery/monitor/FileLog;->mTask:Lcom/miui/gallery/monitor/FileLog$LogTask;

    new-instance p1, Ljava/util/LinkedList;

    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/monitor/FileLog;->mCache0:Ljava/util/LinkedList;

    new-instance p1, Ljava/util/LinkedList;

    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/monitor/FileLog;->mCache1:Ljava/util/LinkedList;

    iget-object p1, p0, Lcom/miui/gallery/monitor/FileLog;->mTask:Lcom/miui/gallery/monitor/FileLog$LogTask;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Lcom/miui/gallery/monitor/FileLog$LogTask;->setPriority(I)V

    iget-object p1, p0, Lcom/miui/gallery/monitor/FileLog;->mTask:Lcom/miui/gallery/monitor/FileLog$LogTask;

    invoke-virtual {p1}, Lcom/miui/gallery/monitor/FileLog$LogTask;->start()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/monitor/FileLog;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/monitor/FileLog;->mLock:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/monitor/FileLog;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/monitor/FileLog;->mActiveCache:I

    return p0
.end method

.method static synthetic access$102(Lcom/miui/gallery/monitor/FileLog;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/monitor/FileLog;->mActiveCache:I

    return p1
.end method

.method static synthetic access$200(Lcom/miui/gallery/monitor/FileLog;)Ljava/util/LinkedList;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/monitor/FileLog;->mCache0:Ljava/util/LinkedList;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/monitor/FileLog;)Ljava/util/LinkedList;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/monitor/FileLog;->mCache1:Ljava/util/LinkedList;

    return-object p0
.end method


# virtual methods
.method public log(Ljava/lang/String;)V
    .locals 5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/miui/gallery/monitor/FileLog;->mLock:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    iget v3, p0, Lcom/miui/gallery/monitor/FileLog;->mActiveCache:I

    if-nez v3, :cond_0

    iget-object v3, p0, Lcom/miui/gallery/monitor/FileLog;->mCache0:Ljava/util/LinkedList;

    goto :goto_0

    :cond_0
    iget-object v3, p0, Lcom/miui/gallery/monitor/FileLog;->mCache1:Ljava/util/LinkedList;

    :goto_0
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {v3, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    iget-object p1, p0, Lcom/miui/gallery/monitor/FileLog;->mTask:Lcom/miui/gallery/monitor/FileLog$LogTask;

    invoke-virtual {p1}, Lcom/miui/gallery/monitor/FileLog$LogTask;->active()V

    const-string p1, "FileLog"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "log cost: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, v0

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method
