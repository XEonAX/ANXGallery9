.class public Lcom/xiaomi/mipush/sdk/stat/db/MessageInsertJob;
.super Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$InsertJob;
.source "MessageInsertJob.java"


# instance fields
.field private mDescription:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$InsertJob;-><init>(Ljava/lang/String;Landroid/content/ContentValues;)V

    const-string p1, "MessageInsertJob"

    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/stat/db/MessageInsertJob;->mDescription:Ljava/lang/String;

    iput-object p3, p0, Lcom/xiaomi/mipush/sdk/stat/db/MessageInsertJob;->mDescription:Ljava/lang/String;

    return-void
.end method

.method public static buildInsertJob(Landroid/content/Context;Ljava/lang/String;Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;)Lcom/xiaomi/mipush/sdk/stat/db/MessageInsertJob;
    .locals 6

    invoke-static {p2}, Lcom/xiaomi/xmpush/thrift/XmPushThriftSerializeUtils;->convertThriftObjectToBytes(Lorg/apache/thrift/TBase;)[B

    move-result-object v0

    if-eqz v0, :cond_1

    array-length v1, v0

    if-gtz v1, :cond_0

    goto :goto_0

    :cond_0
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    const-string v2, "status"

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v2, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v2, "messageId"

    const-string v4, ""

    invoke-virtual {v1, v2, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "messageItemId"

    invoke-virtual {p2}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;->getId()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v1, v2, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "messageItem"

    invoke-virtual {v1, p2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    const-string p2, "appId"

    invoke-static {p0}, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->getAppId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, p2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "packageName"

    invoke-static {p0}, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;

    move-result-object p0

    invoke-virtual {p0}, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p2, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "createTimeStamp"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-virtual {v1, p0, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string p0, "uploadTimestamp"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {v1, p0, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    new-instance p0, Lcom/xiaomi/mipush/sdk/stat/db/MessageInsertJob;

    const-string p2, "a job build to insert message to db"

    invoke-direct {p0, p1, v1, p2}, Lcom/xiaomi/mipush/sdk/stat/db/MessageInsertJob;-><init>(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;)V

    return-object p0

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return-object p0
.end method
