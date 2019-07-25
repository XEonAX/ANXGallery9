.class public Lcom/xiaomi/push/mpcd/job/AppActiveListCollectionJob;
.super Lcom/xiaomi/push/mpcd/job/CollectionJob;
.source "AppActiveListCollectionJob.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/xiaomi/push/mpcd/job/CollectionJob;-><init>(Landroid/content/Context;I)V

    return-void
.end method


# virtual methods
.method public collectInfo()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getCollectionType()Lcom/xiaomi/xmpush/thrift/ClientCollectionType;
    .locals 1

    sget-object v0, Lcom/xiaomi/xmpush/thrift/ClientCollectionType;->AppActiveList:Lcom/xiaomi/xmpush/thrift/ClientCollectionType;

    return-object v0
.end method

.method public getJobId()I
    .locals 1

    const/4 v0, 0x5

    return v0
.end method
