.class public Lcom/xiaomi/push/service/awake/module/AwakeInfo;
.super Ljava/lang/Object;
.source "AwakeInfo.java"


# instance fields
.field private mAction:Ljava/lang/String;

.field private mAwakeInfo:Ljava/lang/String;

.field private mClassName:Ljava/lang/String;

.field private mTargetPackageName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getAction()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/push/service/awake/module/AwakeInfo;->mAction:Ljava/lang/String;

    return-object v0
.end method

.method public getAwakeInfo()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/push/service/awake/module/AwakeInfo;->mAwakeInfo:Ljava/lang/String;

    return-object v0
.end method

.method public getClassName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/push/service/awake/module/AwakeInfo;->mClassName:Ljava/lang/String;

    return-object v0
.end method

.method public getTargetPackageName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/push/service/awake/module/AwakeInfo;->mTargetPackageName:Ljava/lang/String;

    return-object v0
.end method

.method public setAction(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/push/service/awake/module/AwakeInfo;->mAction:Ljava/lang/String;

    return-void
.end method

.method public setAwakeInfo(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/push/service/awake/module/AwakeInfo;->mAwakeInfo:Ljava/lang/String;

    return-void
.end method

.method public setClassName(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/push/service/awake/module/AwakeInfo;->mClassName:Ljava/lang/String;

    return-void
.end method

.method public setTargetPackageName(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/push/service/awake/module/AwakeInfo;->mTargetPackageName:Ljava/lang/String;

    return-void
.end method
