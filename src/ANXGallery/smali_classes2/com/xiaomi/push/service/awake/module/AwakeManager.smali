.class public final Lcom/xiaomi/push/service/awake/module/AwakeManager;
.super Ljava/lang/Object;
.source "AwakeManager.java"


# static fields
.field private static volatile sInstance:Lcom/xiaomi/push/service/awake/module/AwakeManager;


# instance fields
.field private mAppId:Ljava/lang/String;

.field private mContext:Landroid/content/Context;

.field private mModuleMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Lcom/xiaomi/push/service/awake/module/HelpType;",
            "Lcom/xiaomi/push/service/awake/module/IAwakeModule;",
            ">;"
        }
    .end annotation
.end field

.field private mOnLineCmd:I

.field private mPackageName:Ljava/lang/String;

.field private mSendDataIml:Lcom/xiaomi/push/service/awake/module/IProcessData;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager;->mModuleMap:Ljava/util/HashMap;

    iput-object p1, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager;->mContext:Landroid/content/Context;

    iget-object p1, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager;->mModuleMap:Ljava/util/HashMap;

    sget-object v0, Lcom/xiaomi/push/service/awake/module/HelpType;->SERVICE_ACTION:Lcom/xiaomi/push/service/awake/module/HelpType;

    new-instance v1, Lcom/xiaomi/push/service/awake/module/ServiceActionAwakeModule;

    invoke-direct {v1}, Lcom/xiaomi/push/service/awake/module/ServiceActionAwakeModule;-><init>()V

    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager;->mModuleMap:Ljava/util/HashMap;

    sget-object v0, Lcom/xiaomi/push/service/awake/module/HelpType;->SERVICE_COMPONENT:Lcom/xiaomi/push/service/awake/module/HelpType;

    new-instance v1, Lcom/xiaomi/push/service/awake/module/ServiceComponentAwakeModule;

    invoke-direct {v1}, Lcom/xiaomi/push/service/awake/module/ServiceComponentAwakeModule;-><init>()V

    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager;->mModuleMap:Ljava/util/HashMap;

    sget-object v0, Lcom/xiaomi/push/service/awake/module/HelpType;->ACTIVITY:Lcom/xiaomi/push/service/awake/module/HelpType;

    new-instance v1, Lcom/xiaomi/push/service/awake/module/ActivityActionAwakeModule;

    invoke-direct {v1}, Lcom/xiaomi/push/service/awake/module/ActivityActionAwakeModule;-><init>()V

    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager;->mModuleMap:Ljava/util/HashMap;

    sget-object v0, Lcom/xiaomi/push/service/awake/module/HelpType;->PROVIDER:Lcom/xiaomi/push/service/awake/module/HelpType;

    new-instance v1, Lcom/xiaomi/push/service/awake/module/ProviderAwakeModule;

    invoke-direct {v1}, Lcom/xiaomi/push/service/awake/module/ProviderAwakeModule;-><init>()V

    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method static synthetic access$000(Lcom/xiaomi/push/service/awake/module/AwakeManager;Lcom/xiaomi/push/service/awake/module/HelpType;Landroid/content/Context;Lcom/xiaomi/push/service/awake/module/AwakeInfo;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/xiaomi/push/service/awake/module/AwakeManager;->doAwake(Lcom/xiaomi/push/service/awake/module/HelpType;Landroid/content/Context;Lcom/xiaomi/push/service/awake/module/AwakeInfo;)V

    return-void
.end method

.method private doAwake(Lcom/xiaomi/push/service/awake/module/HelpType;Landroid/content/Context;Lcom/xiaomi/push/service/awake/module/AwakeInfo;)V
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager;->mModuleMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/xiaomi/push/service/awake/module/IAwakeModule;

    invoke-interface {p1, p2, p3}, Lcom/xiaomi/push/service/awake/module/IAwakeModule;->doAwake(Landroid/content/Context;Lcom/xiaomi/push/service/awake/module/AwakeInfo;)V

    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/awake/module/AwakeManager;
    .locals 2

    sget-object v0, Lcom/xiaomi/push/service/awake/module/AwakeManager;->sInstance:Lcom/xiaomi/push/service/awake/module/AwakeManager;

    if-nez v0, :cond_1

    const-class v0, Lcom/xiaomi/push/service/awake/module/AwakeManager;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/xiaomi/push/service/awake/module/AwakeManager;->sInstance:Lcom/xiaomi/push/service/awake/module/AwakeManager;

    if-nez v1, :cond_0

    new-instance v1, Lcom/xiaomi/push/service/awake/module/AwakeManager;

    invoke-direct {v1, p0}, Lcom/xiaomi/push/service/awake/module/AwakeManager;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/xiaomi/push/service/awake/module/AwakeManager;->sInstance:Lcom/xiaomi/push/service/awake/module/AwakeManager;

    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_1
    :goto_0
    sget-object p0, Lcom/xiaomi/push/service/awake/module/AwakeManager;->sInstance:Lcom/xiaomi/push/service/awake/module/AwakeManager;

    return-object p0
.end method


# virtual methods
.method public getAppId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager;->mAppId:Ljava/lang/String;

    return-object v0
.end method

.method public getOnLineCmd()I
    .locals 1

    iget v0, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager;->mOnLineCmd:I

    return v0
.end method

.method public getPackageName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager;->mPackageName:Ljava/lang/String;

    return-object v0
.end method

.method public getSendDataIml()Lcom/xiaomi/push/service/awake/module/IProcessData;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager;->mSendDataIml:Lcom/xiaomi/push/service/awake/module/IProcessData;

    return-object v0
.end method

.method public sendResult(Lcom/xiaomi/push/service/awake/module/HelpType;Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager;->mModuleMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/xiaomi/push/service/awake/module/IAwakeModule;

    invoke-interface {p1, p2, p3, p4}, Lcom/xiaomi/push/service/awake/module/IAwakeModule;->doSendAwakeResult(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const-string p1, "null"

    const/16 p3, 0x3f0

    const-string p4, "A receive a incorrect message with empty type"

    invoke-static {p2, p1, p3, p4}, Lcom/xiaomi/push/service/awake/AwakeUploadHelper;->uploadData(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;)V

    :goto_0
    return-void
.end method

.method public setAppId(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager;->mAppId:Ljava/lang/String;

    return-void
.end method

.method public setOnLineCmd(I)V
    .locals 0

    iput p1, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager;->mOnLineCmd:I

    return-void
.end method

.method public setPackageInfo(Ljava/lang/String;Ljava/lang/String;ILcom/xiaomi/push/service/awake/module/IProcessData;)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/xiaomi/push/service/awake/module/AwakeManager;->setAppId(Ljava/lang/String;)V

    invoke-virtual {p0, p2}, Lcom/xiaomi/push/service/awake/module/AwakeManager;->setPackageName(Ljava/lang/String;)V

    invoke-virtual {p0, p3}, Lcom/xiaomi/push/service/awake/module/AwakeManager;->setOnLineCmd(I)V

    invoke-virtual {p0, p4}, Lcom/xiaomi/push/service/awake/module/AwakeManager;->setSendDataIml(Lcom/xiaomi/push/service/awake/module/IProcessData;)V

    return-void
.end method

.method public setPackageName(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager;->mPackageName:Ljava/lang/String;

    return-void
.end method

.method public setSendDataIml(Lcom/xiaomi/push/service/awake/module/IProcessData;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager;->mSendDataIml:Lcom/xiaomi/push/service/awake/module/IProcessData;

    return-void
.end method

.method public wakeup(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 7

    if-eqz p1, :cond_1

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p3}, Lcom/xiaomi/push/service/awake/module/AwakeManager;->setOnLineCmd(I)V

    iget-object p3, p0, Lcom/xiaomi/push/service/awake/module/AwakeManager;->mContext:Landroid/content/Context;

    invoke-static {p3}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;

    move-result-object p3

    new-instance v6, Lcom/xiaomi/push/service/awake/module/AwakeManager$1;

    move-object v0, v6

    move-object v1, p0

    move-object v2, p2

    move-object v3, p1

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/xiaomi/push/service/awake/module/AwakeManager$1;-><init>(Lcom/xiaomi/push/service/awake/module/AwakeManager;Ljava/lang/String;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p3, v6}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;->addOneShootJob(Ljava/lang/Runnable;)V

    return-void

    :cond_1
    :goto_0
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, ""

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const/16 p3, 0x3f0

    const-string p4, "A receive a incorrect message"

    invoke-static {p1, p2, p3, p4}, Lcom/xiaomi/push/service/awake/AwakeUploadHelper;->uploadData(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;)V

    return-void
.end method
