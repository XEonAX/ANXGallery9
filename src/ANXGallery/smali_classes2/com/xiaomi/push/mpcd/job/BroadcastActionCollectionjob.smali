.class public Lcom/xiaomi/push/mpcd/job/BroadcastActionCollectionjob;
.super Lcom/xiaomi/push/mpcd/job/CollectionJob;
.source "BroadcastActionCollectionjob.java"


# static fields
.field public static mChangedActions:Ljava/lang/String; = ""

.field public static mRestartedActions:Ljava/lang/String; = ""


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/xiaomi/push/mpcd/job/CollectionJob;-><init>(Landroid/content/Context;I)V

    return-void
.end method

.method private shrinkActionInfo(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    const-string v0, ","

    invoke-virtual {p2, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    array-length v1, v0

    const/16 v2, 0xa

    if-le v1, v2, :cond_2

    array-length p2, v0

    add-int/lit8 p2, p2, -0x1

    :goto_0
    array-length v1, v0

    sub-int/2addr v1, v2

    if-lt p2, v1, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object p1, v0, p2

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    add-int/lit8 p2, p2, -0x1

    goto :goto_0

    :cond_1
    return-object p1

    :cond_2
    return-object p2

    :cond_3
    :goto_1
    const-string p1, ""

    return-object p1
.end method


# virtual methods
.method public collectInfo()Ljava/lang/String;
    .locals 3

    const-string v0, ""

    sget-object v1, Lcom/xiaomi/push/mpcd/job/BroadcastActionCollectionjob;->mRestartedActions:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v0, Lcom/xiaomi/push/mpcd/Constants;->ACTION_PACKAGE_RESTARTED:Ljava/lang/String;

    sget-object v2, Lcom/xiaomi/push/mpcd/job/BroadcastActionCollectionjob;->mRestartedActions:Ljava/lang/String;

    invoke-direct {p0, v0, v2}, Lcom/xiaomi/push/mpcd/job/BroadcastActionCollectionjob;->shrinkActionInfo(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, ""

    sput-object v1, Lcom/xiaomi/push/mpcd/job/BroadcastActionCollectionjob;->mRestartedActions:Ljava/lang/String;

    :cond_0
    sget-object v1, Lcom/xiaomi/push/mpcd/job/BroadcastActionCollectionjob;->mChangedActions:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v0, Lcom/xiaomi/push/mpcd/Constants;->ACTION_PACKAGE_CHANGED:Ljava/lang/String;

    sget-object v2, Lcom/xiaomi/push/mpcd/job/BroadcastActionCollectionjob;->mChangedActions:Ljava/lang/String;

    invoke-direct {p0, v0, v2}, Lcom/xiaomi/push/mpcd/job/BroadcastActionCollectionjob;->shrinkActionInfo(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, ""

    sput-object v1, Lcom/xiaomi/push/mpcd/job/BroadcastActionCollectionjob;->mChangedActions:Ljava/lang/String;

    :cond_1
    return-object v0
.end method

.method public getCollectionType()Lcom/xiaomi/xmpush/thrift/ClientCollectionType;
    .locals 1

    sget-object v0, Lcom/xiaomi/xmpush/thrift/ClientCollectionType;->BroadcastAction:Lcom/xiaomi/xmpush/thrift/ClientCollectionType;

    return-object v0
.end method

.method public getJobId()I
    .locals 1

    const/16 v0, 0xc

    return v0
.end method
