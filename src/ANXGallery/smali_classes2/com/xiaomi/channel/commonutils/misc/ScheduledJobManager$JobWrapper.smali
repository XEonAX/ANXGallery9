.class Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager$JobWrapper;
.super Ljava/lang/Object;
.source "ScheduledJobManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "JobWrapper"
.end annotation


# instance fields
.field job:Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager$Job;


# direct methods
.method public constructor <init>(Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager$Job;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager$JobWrapper;->job:Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager$Job;

    return-void
.end method


# virtual methods
.method onJobDone()V
    .locals 0

    return-void
.end method

.method onJobStart()V
    .locals 0

    return-void
.end method

.method public run()V
    .locals 1

    invoke-virtual {p0}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager$JobWrapper;->onJobStart()V

    iget-object v0, p0, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager$JobWrapper;->job:Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager$Job;

    invoke-virtual {v0}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager$Job;->run()V

    invoke-virtual {p0}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager$JobWrapper;->onJobDone()V

    return-void
.end method
