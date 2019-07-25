.class public Lcom/xiaomi/clientreport/job/WriteJob;
.super Ljava/lang/Object;
.source "WriteJob.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private mContext:Landroid/content/Context;

.field private mWriter:Lcom/xiaomi/clientreport/processor/IWrite;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/xiaomi/clientreport/processor/IWrite;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/xiaomi/clientreport/job/WriteJob;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/xiaomi/clientreport/job/WriteJob;->mWriter:Lcom/xiaomi/clientreport/processor/IWrite;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/clientreport/job/WriteJob;->mWriter:Lcom/xiaomi/clientreport/processor/IWrite;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/clientreport/job/WriteJob;->mWriter:Lcom/xiaomi/clientreport/processor/IWrite;

    invoke-interface {v0}, Lcom/xiaomi/clientreport/processor/IWrite;->process()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    :cond_0
    :goto_0
    return-void
.end method
