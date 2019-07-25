.class public Lcom/xiaomi/mistatistic/sdk/controller/q;
.super Ljava/lang/Object;
.source "SessionManagerV2.java"


# static fields
.field private static volatile a:Lcom/xiaomi/mistatistic/sdk/controller/q; = null

.field private static b:Z = false


# instance fields
.field private c:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/xiaomi/mistatistic/sdk/controller/q$1;

    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/controller/e;->c()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/xiaomi/mistatistic/sdk/controller/q$1;-><init>(Lcom/xiaomi/mistatistic/sdk/controller/q;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/xiaomi/mistatistic/sdk/controller/q;->c:Landroid/os/Handler;

    return-void
.end method

.method static synthetic a(Lcom/xiaomi/mistatistic/sdk/controller/q;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/mistatistic/sdk/controller/q;->c:Landroid/os/Handler;

    return-object p0
.end method

.method public static a()Lcom/xiaomi/mistatistic/sdk/controller/q;
    .locals 2

    sget-object v0, Lcom/xiaomi/mistatistic/sdk/controller/q;->a:Lcom/xiaomi/mistatistic/sdk/controller/q;

    if-nez v0, :cond_1

    const-class v0, Lcom/xiaomi/mistatistic/sdk/controller/q;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/xiaomi/mistatistic/sdk/controller/q;->a:Lcom/xiaomi/mistatistic/sdk/controller/q;

    if-nez v1, :cond_0

    new-instance v1, Lcom/xiaomi/mistatistic/sdk/controller/q;

    invoke-direct {v1}, Lcom/xiaomi/mistatistic/sdk/controller/q;-><init>()V

    sput-object v1, Lcom/xiaomi/mistatistic/sdk/controller/q;->a:Lcom/xiaomi/mistatistic/sdk/controller/q;

    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :cond_1
    :goto_0
    sget-object v0, Lcom/xiaomi/mistatistic/sdk/controller/q;->a:Lcom/xiaomi/mistatistic/sdk/controller/q;

    return-object v0
.end method

.method static synthetic a(Lcom/xiaomi/mistatistic/sdk/controller/q;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/xiaomi/mistatistic/sdk/controller/q;->c(Ljava/lang/String;)V

    return-void
.end method

.method private a(Ljava/lang/String;JJZ)V
    .locals 9

    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/controller/d;->a()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/mistatistic/sdk/controller/l;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v0, "NULL"

    :cond_0
    move-object v8, v0

    new-instance v0, Lcom/xiaomi/mistatistic/sdk/data/k;

    move-object v1, v0

    move-object v2, p1

    move-wide v3, p2

    move-wide v5, p4

    move v7, p6

    invoke-direct/range {v1 .. v8}, Lcom/xiaomi/mistatistic/sdk/data/k;-><init>(Ljava/lang/String;JJZLjava/lang/String;)V

    invoke-static {v0}, Lcom/xiaomi/mistatistic/sdk/controller/LocalEventRecorder;->insertEvent(Lcom/xiaomi/mistatistic/sdk/data/AbstractEvent;)V

    return-void
.end method

.method private b()V
    .locals 4

    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/controller/d;->a()Landroid/content/Context;

    move-result-object v0

    const-string v1, "action_begin"

    const-wide/16 v2, 0x0

    invoke-static {v0, v1, v2, v3}, Lcom/xiaomi/mistatistic/sdk/controller/m;->b(Landroid/content/Context;Ljava/lang/String;J)V

    const-string v1, "action_end"

    invoke-static {v0, v1, v2, v3}, Lcom/xiaomi/mistatistic/sdk/controller/m;->b(Landroid/content/Context;Ljava/lang/String;J)V

    const-string v1, "action_auto_end"

    invoke-static {v0, v1, v2, v3}, Lcom/xiaomi/mistatistic/sdk/controller/m;->b(Landroid/content/Context;Ljava/lang/String;J)V

    const-string v1, "action_name"

    const-string v2, ""

    invoke-static {v0, v1, v2}, Lcom/xiaomi/mistatistic/sdk/controller/m;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic b(Lcom/xiaomi/mistatistic/sdk/controller/q;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/xiaomi/mistatistic/sdk/controller/q;->d(Ljava/lang/String;)V

    return-void
.end method

.method private c(Ljava/lang/String;)V
    .locals 17

    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/controller/d;->a()Landroid/content/Context;

    move-result-object v2

    const-string v3, "action_begin"

    const-wide/16 v4, 0x0

    invoke-static {v2, v3, v4, v5}, Lcom/xiaomi/mistatistic/sdk/controller/m;->a(Landroid/content/Context;Ljava/lang/String;J)J

    move-result-wide v13

    const-string v3, "action_end"

    invoke-static {v2, v3, v4, v5}, Lcom/xiaomi/mistatistic/sdk/controller/m;->a(Landroid/content/Context;Ljava/lang/String;J)J

    move-result-wide v15

    const-string v3, "action_auto_end"

    invoke-static {v2, v3, v4, v5}, Lcom/xiaomi/mistatistic/sdk/controller/m;->a(Landroid/content/Context;Ljava/lang/String;J)J

    move-result-wide v10

    const-string v3, "action_name"

    const-string v6, ""

    invoke-static {v2, v3, v6}, Lcom/xiaomi/mistatistic/sdk/controller/m;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_0

    cmp-long v6, v13, v4

    if-lez v6, :cond_0

    cmp-long v6, v15, v4

    if-nez v6, :cond_0

    const-string v6, "SMV2"

    const-string v7, "Record the last unusual PA event with auto-end."

    invoke-static {v6, v7}, Lcom/xiaomi/mistatistic/sdk/controller/j;->a(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v12, 0x1

    move-object/from16 v6, p0

    move-object v7, v3

    move-wide v8, v13

    invoke-direct/range {v6 .. v12}, Lcom/xiaomi/mistatistic/sdk/controller/q;->a(Ljava/lang/String;JJZ)V

    :cond_0
    sget-boolean v6, Lcom/xiaomi/mistatistic/sdk/controller/q;->b:Z

    if-nez v6, :cond_1

    const/4 v6, 0x1

    sput-boolean v6, Lcom/xiaomi/mistatistic/sdk/controller/q;->b:Z

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_1

    cmp-long v6, v13, v4

    if-lez v6, :cond_1

    cmp-long v6, v15, v4

    if-lez v6, :cond_1

    new-instance v6, Lcom/xiaomi/mistatistic/sdk/controller/h;

    invoke-direct {v6}, Lcom/xiaomi/mistatistic/sdk/controller/h;-><init>()V

    invoke-virtual {v6, v13, v14}, Lcom/xiaomi/mistatistic/sdk/controller/h;->j(J)Z

    move-result v6

    const-string v7, "SMV2"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "check the last pa event whether been inserted to db. actionBeginTs ="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v9, " isInserted = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/xiaomi/mistatistic/sdk/controller/j;->a(Ljava/lang/String;Ljava/lang/String;)V

    if-nez v6, :cond_1

    const-string v6, "SMV2"

    const-string v7, "Record the last unusual PA event without auto-end."

    invoke-static {v6, v7}, Lcom/xiaomi/mistatistic/sdk/controller/j;->a(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v12, 0x0

    move-object/from16 v6, p0

    move-object v7, v3

    move-wide v8, v13

    move-wide v10, v15

    invoke-direct/range {v6 .. v12}, Lcom/xiaomi/mistatistic/sdk/controller/q;->a(Ljava/lang/String;JJZ)V

    :cond_1
    const-string v3, "action_begin"

    invoke-static {v2, v3, v0, v1}, Lcom/xiaomi/mistatistic/sdk/controller/m;->b(Landroid/content/Context;Ljava/lang/String;J)V

    const-string v0, "action_end"

    invoke-static {v2, v0, v4, v5}, Lcom/xiaomi/mistatistic/sdk/controller/m;->b(Landroid/content/Context;Ljava/lang/String;J)V

    const-string v0, "action_auto_end"

    invoke-static {v2, v0, v4, v5}, Lcom/xiaomi/mistatistic/sdk/controller/m;->b(Landroid/content/Context;Ljava/lang/String;J)V

    const-string v0, "action_name"

    move-object/from16 v1, p1

    invoke-static {v2, v0, v1}, Lcom/xiaomi/mistatistic/sdk/controller/m;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-object/from16 v1, p0

    :try_start_1
    iget-object v0, v1, Lcom/xiaomi/mistatistic/sdk/controller/q;->c:Landroid/os/Handler;

    const/16 v2, 0x64

    const-wide/16 v3, 0x3a98

    invoke-virtual {v0, v2, v3, v4}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    move-object/from16 v1, p0

    :goto_0
    const-string v2, "processActActivated exception: "

    invoke-static {v2, v0}, Lcom/xiaomi/mistatistic/sdk/controller/j;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_1
    return-void
.end method

.method private d(Ljava/lang/String;)V
    .locals 10

    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/controller/d;->a()Landroid/content/Context;

    move-result-object v0

    const-string v1, "action_begin"

    const-wide/16 v2, 0x0

    invoke-static {v0, v1, v2, v3}, Lcom/xiaomi/mistatistic/sdk/controller/m;->a(Landroid/content/Context;Ljava/lang/String;J)J

    move-result-wide v6

    const-string v1, "action_name"

    const-string v8, ""

    invoke-static {v0, v1, v8}, Lcom/xiaomi/mistatistic/sdk/controller/m;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v8, p0, Lcom/xiaomi/mistatistic/sdk/controller/q;->c:Landroid/os/Handler;

    const/16 v9, 0x64

    invoke-virtual {v8, v9}, Landroid/os/Handler;->removeMessages(I)V

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    const-string p1, "SMV2"

    const-string v0, "The actName of recordPageEnd is NOT equal to actName of recordPageStart."

    invoke-static {p1, v0}, Lcom/xiaomi/mistatistic/sdk/controller/j;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/xiaomi/mistatistic/sdk/controller/q;->b()V

    return-void

    :cond_0
    const-string p1, "action_end"

    invoke-static {v0, p1, v4, v5}, Lcom/xiaomi/mistatistic/sdk/controller/m;->b(Landroid/content/Context;Ljava/lang/String;J)V

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_1

    cmp-long p1, v6, v2

    if-lez p1, :cond_1

    const/4 p1, 0x0

    move-object v0, p0

    move-wide v2, v6

    move v6, p1

    invoke-direct/range {v0 .. v6}, Lcom/xiaomi/mistatistic/sdk/controller/q;->a(Ljava/lang/String;JJZ)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "processActDeactivated exception: "

    invoke-static {v0, p1}, Lcom/xiaomi/mistatistic/sdk/controller/j;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 2

    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/controller/e;->a()Lcom/xiaomi/mistatistic/sdk/controller/e;

    move-result-object v0

    new-instance v1, Lcom/xiaomi/mistatistic/sdk/controller/q$2;

    invoke-direct {v1, p0, p1}, Lcom/xiaomi/mistatistic/sdk/controller/q$2;-><init>(Lcom/xiaomi/mistatistic/sdk/controller/q;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/xiaomi/mistatistic/sdk/controller/e;->a(Lcom/xiaomi/mistatistic/sdk/controller/e$a;)V

    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 2

    invoke-static {}, Lcom/xiaomi/mistatistic/sdk/controller/e;->a()Lcom/xiaomi/mistatistic/sdk/controller/e;

    move-result-object v0

    new-instance v1, Lcom/xiaomi/mistatistic/sdk/controller/q$3;

    invoke-direct {v1, p0, p1}, Lcom/xiaomi/mistatistic/sdk/controller/q$3;-><init>(Lcom/xiaomi/mistatistic/sdk/controller/q;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/xiaomi/mistatistic/sdk/controller/e;->a(Lcom/xiaomi/mistatistic/sdk/controller/e$a;)V

    return-void
.end method
