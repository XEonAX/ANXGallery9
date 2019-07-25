.class Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;
.super Ljava/lang/Object;
.source "LoadMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcn/kuaipan/android/kss/download/LoadMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "BlockSpace"
.end annotation


# instance fields
.field private final end:J

.field private final sha1:Ljava/lang/String;

.field private final spaces:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcn/kuaipan/android/kss/download/LoadMap$Space;",
            ">;"
        }
    .end annotation
.end field

.field private final start:J

.field final synthetic this$0:Lcn/kuaipan/android/kss/download/LoadMap;

.field private verifyFailCount:I

.field private verifyState:Lcn/kuaipan/android/kss/download/LoadMap$VerifyState;


# direct methods
.method public constructor <init>(Lcn/kuaipan/android/kss/download/LoadMap;Lcn/kuaipan/android/kss/IKssDownloadRequestResult$Block;J)V
    .locals 0

    iput-object p1, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->this$0:Lcn/kuaipan/android/kss/download/LoadMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object p1, p2, Lcn/kuaipan/android/kss/IKssDownloadRequestResult$Block;->sha1:Ljava/lang/String;

    iput-object p1, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->sha1:Ljava/lang/String;

    iput-wide p3, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->start:J

    iget-wide p1, p2, Lcn/kuaipan/android/kss/IKssDownloadRequestResult$Block;->size:J

    add-long/2addr p3, p1

    iput-wide p3, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->end:J

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->spaces:Ljava/util/ArrayList;

    const/4 p1, 0x0

    iput p1, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->verifyFailCount:I

    invoke-direct {p0}, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->reset()V

    return-void
.end method

.method private _verify(Lcn/kuaipan/android/kss/download/KssAccessor;)Z
    .locals 8

    invoke-virtual {p1}, Lcn/kuaipan/android/kss/download/KssAccessor;->lock()V

    const/4 v0, 0x0

    :try_start_0
    iget-wide v1, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->start:J

    iget-wide v3, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->end:J

    iget-wide v5, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->start:J

    const/4 v7, 0x0

    sub-long/2addr v3, v5

    invoke-virtual {p1, v1, v2, v3, v4}, Lcn/kuaipan/android/kss/download/KssAccessor;->sha1(JJ)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->sha1:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move v0, v1

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_1

    :catch_0
    move-exception v1

    :try_start_1
    const-string v2, "LoadMap"

    const-string v3, "Meet exception when verify sha1."

    invoke-static {v2, v3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    invoke-virtual {p1}, Lcn/kuaipan/android/kss/download/KssAccessor;->unlock()V

    return v0

    :goto_1
    invoke-virtual {p1}, Lcn/kuaipan/android/kss/download/KssAccessor;->unlock()V

    throw v0
.end method

.method static synthetic access$000(Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;)[Lcn/kuaipan/android/kss/download/LoadMap$Space;
    .locals 0

    invoke-direct {p0}, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->getAllSpaces()[Lcn/kuaipan/android/kss/download/LoadMap$Space;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;Lcn/kuaipan/android/kss/download/KssAccessor;Z)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->verify(Lcn/kuaipan/android/kss/download/KssAccessor;Z)Z

    move-result p0

    return p0
.end method

.method static synthetic access$1100(Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;Lcn/kuaipan/android/kss/download/LoadMap$Space;)Z
    .locals 0

    invoke-direct {p0, p1}, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->tryMerge(Lcn/kuaipan/android/kss/download/LoadMap$Space;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$200(Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;)J
    .locals 2

    iget-wide v0, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->start:J

    return-wide v0
.end method

.method static synthetic access$300(Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;)J
    .locals 2

    iget-wide v0, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->end:J

    return-wide v0
.end method

.method static synthetic access$600(Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;)V
    .locals 0

    invoke-direct {p0}, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->reset()V

    return-void
.end method

.method static synthetic access$700(Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;)J
    .locals 2

    invoke-direct {p0}, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->size()J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$800(Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;)Ljava/util/ArrayList;
    .locals 0

    iget-object p0, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->spaces:Ljava/util/ArrayList;

    return-object p0
.end method

.method private declared-synchronized getAllSpaces()[Lcn/kuaipan/android/kss/download/LoadMap$Space;
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->spaces:Ljava/util/ArrayList;

    iget-object v1, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->spaces:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [Lcn/kuaipan/android/kss/download/LoadMap$Space;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcn/kuaipan/android/kss/download/LoadMap$Space;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized reset()V
    .locals 9

    monitor-enter p0

    :try_start_0
    sget-object v0, Lcn/kuaipan/android/kss/download/LoadMap$VerifyState;->NOT_VERIFY:Lcn/kuaipan/android/kss/download/LoadMap$VerifyState;

    iput-object v0, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->verifyState:Lcn/kuaipan/android/kss/download/LoadMap$VerifyState;

    iget-object v0, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->spaces:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v0, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->spaces:Ljava/util/ArrayList;

    new-instance v8, Lcn/kuaipan/android/kss/download/LoadMap$Space;

    iget-object v2, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->this$0:Lcn/kuaipan/android/kss/download/LoadMap;

    iget-wide v4, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->start:J

    iget-wide v6, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->end:J

    move-object v1, v8

    move-object v3, p0

    invoke-direct/range {v1 .. v7}, Lcn/kuaipan/android/kss/download/LoadMap$Space;-><init>(Lcn/kuaipan/android/kss/download/LoadMap;Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;JJ)V

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized size()J
    .locals 6

    monitor-enter p0

    const-wide/16 v0, 0x0

    :try_start_0
    iget-object v2, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->spaces:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcn/kuaipan/android/kss/download/LoadMap$Space;

    invoke-virtual {v3}, Lcn/kuaipan/android/kss/download/LoadMap$Space;->size()J

    move-result-wide v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v5, 0x0

    add-long/2addr v0, v3

    goto :goto_0

    :cond_0
    monitor-exit p0

    return-wide v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized tryMerge(Lcn/kuaipan/android/kss/download/LoadMap$Space;)Z
    .locals 5

    monitor-enter p0

    :try_start_0
    invoke-virtual {p1}, Lcn/kuaipan/android/kss/download/LoadMap$Space;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    const/4 v0, 0x1

    if-gtz v4, :cond_0

    iget-object v1, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->spaces:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :cond_0
    :try_start_1
    iget-object v1, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->spaces:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcn/kuaipan/android/kss/download/LoadMap$Space;

    if-eq v2, p1, :cond_1

    invoke-static {v2, p1}, Lcn/kuaipan/android/kss/download/LoadMap$Space;->access$1200(Lcn/kuaipan/android/kss/download/LoadMap$Space;Lcn/kuaipan/android/kss/download/LoadMap$Space;)Z

    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v2, :cond_1

    monitor-exit p0

    return v0

    :cond_2
    const/4 p1, 0x0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private declared-synchronized verify(Lcn/kuaipan/android/kss/download/KssAccessor;Z)Z
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->verifyState:Lcn/kuaipan/android/kss/download/LoadMap$VerifyState;

    sget-object v1, Lcn/kuaipan/android/kss/download/LoadMap$VerifyState;->NOT_VERIFY:Lcn/kuaipan/android/kss/download/LoadMap$VerifyState;

    const/4 v2, 0x1

    if-ne v0, v1, :cond_6

    invoke-direct {p0}, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->size()J

    move-result-wide v0

    const-wide/16 v3, 0x0

    cmp-long v5, v0, v3

    if-gtz v5, :cond_6

    iget v0, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->verifyFailCount:I

    const/4 v1, 0x2

    if-lt v0, v1, :cond_0

    goto :goto_5

    :cond_0
    sget-object v0, Lcn/kuaipan/android/kss/download/LoadMap$VerifyState;->VERIFING:Lcn/kuaipan/android/kss/download/LoadMap$VerifyState;

    iput-object v0, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->verifyState:Lcn/kuaipan/android/kss/download/LoadMap$VerifyState;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    const/4 v0, 0x0

    :try_start_1
    invoke-direct {p0, p1}, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->_verify(Lcn/kuaipan/android/kss/download/KssAccessor;)Z

    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-nez p1, :cond_3

    if-eqz p2, :cond_1

    :try_start_2
    iget p2, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->verifyFailCount:I

    add-int/2addr p2, v2

    iput p2, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->verifyFailCount:I

    goto :goto_0

    :catchall_0
    move-exception p2

    goto :goto_3

    :cond_1
    :goto_0
    iget p2, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->verifyFailCount:I

    if-ge p2, v1, :cond_2

    goto :goto_1

    :cond_2
    new-instance p2, Ljava/io/IOException;

    const-string v0, "Sha1 verify failed more than MAX_VERIFY_COUNT"

    invoke-direct {p2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_3
    :goto_1
    if-eqz p1, :cond_4

    :try_start_3
    sget-object p2, Lcn/kuaipan/android/kss/download/LoadMap$VerifyState;->VERIFIED:Lcn/kuaipan/android/kss/download/LoadMap$VerifyState;

    iput-object p2, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->verifyState:Lcn/kuaipan/android/kss/download/LoadMap$VerifyState;

    goto :goto_2

    :cond_4
    sget-object p2, Lcn/kuaipan/android/kss/download/LoadMap$VerifyState;->NOT_VERIFY:Lcn/kuaipan/android/kss/download/LoadMap$VerifyState;

    iput-object p2, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->verifyState:Lcn/kuaipan/android/kss/download/LoadMap$VerifyState;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    :goto_2
    monitor-exit p0

    return p1

    :catchall_1
    move-exception p2

    const/4 p1, 0x0

    :goto_3
    if-eqz p1, :cond_5

    :try_start_4
    sget-object p1, Lcn/kuaipan/android/kss/download/LoadMap$VerifyState;->VERIFIED:Lcn/kuaipan/android/kss/download/LoadMap$VerifyState;

    iput-object p1, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->verifyState:Lcn/kuaipan/android/kss/download/LoadMap$VerifyState;

    goto :goto_4

    :cond_5
    sget-object p1, Lcn/kuaipan/android/kss/download/LoadMap$VerifyState;->NOT_VERIFY:Lcn/kuaipan/android/kss/download/LoadMap$VerifyState;

    iput-object p1, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->verifyState:Lcn/kuaipan/android/kss/download/LoadMap$VerifyState;

    :goto_4
    throw p2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    :cond_6
    :goto_5
    monitor-exit p0

    return v2

    :catchall_2
    move-exception p1

    monitor-exit p0

    throw p1
.end method


# virtual methods
.method public isVerified()Z
    .locals 2

    iget-object v0, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->verifyState:Lcn/kuaipan/android/kss/download/LoadMap$VerifyState;

    sget-object v1, Lcn/kuaipan/android/kss/download/LoadMap$VerifyState;->VERIFIED:Lcn/kuaipan/android/kss/download/LoadMap$VerifyState;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public declared-synchronized setSpaces([J)V
    .locals 11

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->spaces:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    sget-object v0, Lcn/kuaipan/android/kss/download/LoadMap$VerifyState;->NOT_VERIFY:Lcn/kuaipan/android/kss/download/LoadMap$VerifyState;

    iput-object v0, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->verifyState:Lcn/kuaipan/android/kss/download/LoadMap$VerifyState;

    if-eqz p1, :cond_0

    array-length v0, p1

    rem-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->spaces:Ljava/util/ArrayList;

    new-instance v8, Lcn/kuaipan/android/kss/download/LoadMap$Space;

    iget-object v2, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->this$0:Lcn/kuaipan/android/kss/download/LoadMap;

    iget-wide v4, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->start:J

    iget-wide v6, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->end:J

    move-object v1, v8

    move-object v3, p0

    invoke-direct/range {v1 .. v7}, Lcn/kuaipan/android/kss/download/LoadMap$Space;-><init>(Lcn/kuaipan/android/kss/download/LoadMap;Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;JJ)V

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    array-length v0, p1

    div-int/lit8 v0, v0, 0x2

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_2

    iget-object v2, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->spaces:Ljava/util/ArrayList;

    new-instance v10, Lcn/kuaipan/android/kss/download/LoadMap$Space;

    iget-object v4, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->this$0:Lcn/kuaipan/android/kss/download/LoadMap;

    mul-int/lit8 v3, v1, 0x2

    aget-wide v6, p1, v3

    add-int/lit8 v3, v3, 0x1

    aget-wide v8, p1, v3

    move-object v3, v10

    move-object v5, p0

    invoke-direct/range {v3 .. v9}, Lcn/kuaipan/android/kss/download/LoadMap$Space;-><init>(Lcn/kuaipan/android/kss/download/LoadMap;Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;JJ)V

    invoke-virtual {v2, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Block("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->start:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, "-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->end:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, "):"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->spaces:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->verifyState:Lcn/kuaipan/android/kss/download/LoadMap$VerifyState;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcn/kuaipan/android/kss/download/LoadMap$BlockSpace;->spaces:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->toArray()[Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
