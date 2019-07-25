.class public Lcom/xiaomi/push/mpcd/job/TopAppCollectionJob;
.super Lcom/xiaomi/push/mpcd/job/CollectionJob;
.source "TopAppCollectionJob.java"


# instance fields
.field private preferences:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 1

    invoke-direct {p0, p1, p2}, Lcom/xiaomi/push/mpcd/job/CollectionJob;-><init>(Landroid/content/Context;I)V

    const-string p2, "mipush_extra"

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    iput-object p1, p0, Lcom/xiaomi/push/mpcd/job/TopAppCollectionJob;->preferences:Landroid/content/SharedPreferences;

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

    sget-object v0, Lcom/xiaomi/xmpush/thrift/ClientCollectionType;->TopApp:Lcom/xiaomi/xmpush/thrift/ClientCollectionType;

    return-object v0
.end method

.method public getJobId()I
    .locals 1

    const/16 v0, 0x9

    return v0
.end method
