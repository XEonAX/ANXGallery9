.class public Lcom/xiaomi/mipush/sdk/stat/upload/UploadDataHelper;
.super Ljava/lang/Object;
.source "UploadDataHelper.java"


# static fields
.field private static mDayPrefix:Ljava/lang/String;

.field private static mSdf:Ljava/text/SimpleDateFormat;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy/MM/dd"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/xiaomi/mipush/sdk/stat/upload/UploadDataHelper;->mSdf:Ljava/text/SimpleDateFormat;

    sget-object v0, Lcom/xiaomi/mipush/sdk/stat/upload/UploadDataHelper;->mSdf:Ljava/text/SimpleDateFormat;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/mipush/sdk/stat/upload/UploadDataHelper;->mDayPrefix:Ljava/lang/String;

    return-void
.end method

.method public static wrapperData(Landroid/content/Context;Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;
    .locals 3

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    new-instance v0, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;

    invoke-direct {v0}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;-><init>()V

    const-string v1, "category_push_stat"

    invoke-virtual {v0, v1}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;->setCategory(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;

    const-string v1, "push_sdk_stat_channel"

    invoke-virtual {v0, v1}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;->setChannel(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;

    const-wide/16 v1, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;->setCounter(J)Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;

    invoke-virtual {v0, p1}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;->setData(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;

    const/4 p1, 0x1

    invoke-virtual {v0, p1}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;->setFromSdk(Z)Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;->setTimestamp(J)Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;

    invoke-static {p0}, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;

    move-result-object p0

    invoke-virtual {p0}, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;->setPkgName(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;

    const-string p0, "com.xiaomi.xmsf"

    invoke-virtual {v0, p0}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;->setSourcePackage(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;

    const-string p0, ""

    invoke-virtual {v0, p0}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;->setId(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;

    const-string p0, "push_stat"

    invoke-virtual {v0, p0}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;->setName(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;

    return-object v0
.end method
