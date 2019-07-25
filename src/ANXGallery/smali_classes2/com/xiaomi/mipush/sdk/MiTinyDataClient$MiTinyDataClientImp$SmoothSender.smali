.class public Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;
.super Ljava/lang/Object;
.source "MiTinyDataClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "SmoothSender"
.end annotation


# instance fields
.field private mExecutor:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

.field private mFuture:Ljava/util/concurrent/ScheduledFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ScheduledFuture<",
            "*>;"
        }
    .end annotation
.end field

.field public final mList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;",
            ">;"
        }
    .end annotation
.end field

.field private final repeatTask:Ljava/lang/Runnable;

.field final synthetic this$0:Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp;


# direct methods
.method public constructor <init>(Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp;)V
    .locals 1

    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;->this$0:Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;-><init>(I)V

    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;->mExecutor:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;->mList:Ljava/util/ArrayList;

    new-instance p1, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender$2;

    invoke-direct {p1, p0}, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender$2;-><init>(Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;)V

    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;->repeatTask:Ljava/lang/Runnable;

    return-void
.end method

.method static synthetic access$000(Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;)V
    .locals 0

    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;->awake()V

    return-void
.end method

.method static synthetic access$100(Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;)V
    .locals 0

    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;->doSend()V

    return-void
.end method

.method static synthetic access$200(Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;)Ljava/util/concurrent/ScheduledFuture;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;->mFuture:Ljava/util/concurrent/ScheduledFuture;

    return-object p0
.end method

.method static synthetic access$202(Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;Ljava/util/concurrent/ScheduledFuture;)Ljava/util/concurrent/ScheduledFuture;
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;->mFuture:Ljava/util/concurrent/ScheduledFuture;

    return-object p1
.end method

.method private awake()V
    .locals 8

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;->mFuture:Ljava/util/concurrent/ScheduledFuture;

    if-nez v0, :cond_0

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;->mExecutor:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;->repeatTask:Ljava/lang/Runnable;

    const-wide/16 v3, 0x3e8

    const-wide/16 v5, 0x3e8

    sget-object v7, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual/range {v1 .. v7}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->scheduleAtFixedRate(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;->mFuture:Ljava/util/concurrent/ScheduledFuture;

    :cond_0
    return-void
.end method

.method private doSend()V
    .locals 7

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;->mList:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;

    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;->this$0:Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp;

    invoke-static {v2}, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp;->access$300(Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp;)Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;->this$0:Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp;

    invoke-static {v3}, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp;->access$300(Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp;)Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/AppInfoHolder;

    move-result-object v3

    invoke-virtual {v3}, Lcom/xiaomi/mipush/sdk/AppInfoHolder;->getAppID()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    new-array v5, v4, [Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;

    aput-object v0, v5, v1

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    const/16 v5, 0x7800

    invoke-static {v1, v2, v3, v5}, Lcom/xiaomi/push/service/TinyDataHelper;->pack(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;I)Ljava/util/ArrayList;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "MiTinyDataClient Send item by PushServiceClient.sendMessage(XmActionNotification)."

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;->getId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->v(Ljava/lang/String;)V

    iget-object v3, p0, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;->this$0:Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp;

    invoke-static {v3}, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp;->access$300(Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp;)Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/PushServiceClient;

    move-result-object v3

    sget-object v5, Lcom/xiaomi/xmpush/thrift/ActionType;->Notification:Lcom/xiaomi/xmpush/thrift/ActionType;

    const/4 v6, 0x0

    invoke-virtual {v3, v2, v5, v4, v6}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->sendMessage(Lorg/apache/thrift/TBase;Lcom/xiaomi/xmpush/thrift/ActionType;ZLcom/xiaomi/xmpush/thrift/PushMetaInfo;)V

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public add(Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;)V
    .locals 2

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;->mExecutor:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    new-instance v1, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender$1;

    invoke-direct {v1, p0, p1}, Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender$1;-><init>(Lcom/xiaomi/mipush/sdk/MiTinyDataClient$MiTinyDataClientImp$SmoothSender;Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;)V

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method
