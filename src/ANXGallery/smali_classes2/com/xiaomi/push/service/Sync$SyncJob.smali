.class public abstract Lcom/xiaomi/push/service/Sync$SyncJob;
.super Ljava/lang/Object;
.source "Sync.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/push/service/Sync;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "SyncJob"
.end annotation


# instance fields
.field group:Ljava/lang/String;

.field period:J


# direct methods
.method constructor <init>(Ljava/lang/String;J)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/xiaomi/push/service/Sync$SyncJob;->group:Ljava/lang/String;

    iput-wide p2, p0, Lcom/xiaomi/push/service/Sync$SyncJob;->period:J

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    invoke-static {}, Lcom/xiaomi/push/service/Sync;->access$200()Lcom/xiaomi/push/service/Sync;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/xiaomi/push/service/Sync;->access$200()Lcom/xiaomi/push/service/Sync;

    move-result-object v0

    iget-object v0, v0, Lcom/xiaomi/push/service/Sync;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/network/Network;->isConnected(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {}, Lcom/xiaomi/push/service/Sync;->access$200()Lcom/xiaomi/push/service/Sync;

    move-result-object v3

    invoke-static {v3}, Lcom/xiaomi/push/service/Sync;->access$300(Lcom/xiaomi/push/service/Sync;)Landroid/content/SharedPreferences;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ":ts-"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/xiaomi/push/service/Sync$SyncJob;->group:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-wide/16 v5, 0x0

    invoke-interface {v3, v4, v5, v6}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    sub-long/2addr v1, v3

    iget-wide v3, p0, Lcom/xiaomi/push/service/Sync$SyncJob;->period:J

    cmp-long v5, v1, v3

    if-gtz v5, :cond_1

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/misc/DebugUtils;->isTesting(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    invoke-static {}, Lcom/xiaomi/push/service/Sync;->access$200()Lcom/xiaomi/push/service/Sync;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/push/service/Sync;->access$300(Lcom/xiaomi/push/service/Sync;)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ":ts-"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/xiaomi/push/service/Sync$SyncJob;->group:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/android/SharedPrefsCompat;->apply(Landroid/content/SharedPreferences$Editor;)V

    invoke-static {}, Lcom/xiaomi/push/service/Sync;->access$200()Lcom/xiaomi/push/service/Sync;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/xiaomi/push/service/Sync$SyncJob;->sync(Lcom/xiaomi/push/service/Sync;)V

    :cond_2
    return-void
.end method

.method abstract sync(Lcom/xiaomi/push/service/Sync;)V
.end method
