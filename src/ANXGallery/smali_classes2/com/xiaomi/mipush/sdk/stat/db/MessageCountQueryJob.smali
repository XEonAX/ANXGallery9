.class public Lcom/xiaomi/mipush/sdk/stat/db/MessageCountQueryJob;
.super Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseQueryJob;
.source "MessageCountQueryJob.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseQueryJob<",
        "Ljava/lang/Long;",
        ">;"
    }
.end annotation


# instance fields
.field private mDescription:Ljava/lang/String;

.field private mResult:J


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-direct/range {p0 .. p8}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseQueryJob;-><init>(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    const-wide/16 p1, 0x0

    iput-wide p1, p0, Lcom/xiaomi/mipush/sdk/stat/db/MessageCountQueryJob;->mResult:J

    iput-object p9, p0, Lcom/xiaomi/mipush/sdk/stat/db/MessageCountQueryJob;->mDescription:Ljava/lang/String;

    return-void
.end method

.method public static getMessageCountJob(Ljava/lang/String;)Lcom/xiaomi/mipush/sdk/stat/db/MessageCountQueryJob;
    .locals 11

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    const-string v0, "count(*)"

    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v10, Lcom/xiaomi/mipush/sdk/stat/db/MessageCountQueryJob;

    const-string v9, "job to get count of all message"

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v0, v10

    move-object v1, p0

    invoke-direct/range {v0 .. v9}, Lcom/xiaomi/mipush/sdk/stat/db/MessageCountQueryJob;-><init>(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    return-object v10
.end method


# virtual methods
.method public notifyResult(Landroid/content/Context;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p1

    if-lez p1, :cond_0

    const/4 p1, 0x0

    invoke-interface {p2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/xiaomi/mipush/sdk/stat/db/MessageCountQueryJob;->mResult:J

    :cond_0
    return-void
.end method

.method public output()Ljava/lang/Object;
    .locals 2

    iget-wide v0, p0, Lcom/xiaomi/mipush/sdk/stat/db/MessageCountQueryJob;->mResult:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method public processOneData(Landroid/content/Context;Landroid/database/Cursor;)Ljava/lang/Long;
    .locals 0

    const/4 p1, 0x0

    invoke-interface {p2, p1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic processOneData(Landroid/content/Context;Landroid/database/Cursor;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/xiaomi/mipush/sdk/stat/db/MessageCountQueryJob;->processOneData(Landroid/content/Context;Landroid/database/Cursor;)Ljava/lang/Long;

    move-result-object p1

    return-object p1
.end method
