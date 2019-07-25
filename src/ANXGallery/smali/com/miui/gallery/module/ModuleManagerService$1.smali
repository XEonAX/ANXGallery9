.class Lcom/miui/gallery/module/ModuleManagerService$1;
.super Ljava/lang/Object;
.source "ModuleManagerService.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/module/ModuleManagerService;->onStartJob(Landroid/app/job/JobParameters;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/module/ModuleManagerService;

.field final synthetic val$module:Ljava/lang/String;

.field final synthetic val$params:Landroid/app/job/JobParameters;


# direct methods
.method constructor <init>(Lcom/miui/gallery/module/ModuleManagerService;Ljava/lang/String;Landroid/app/job/JobParameters;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/module/ModuleManagerService$1;->this$0:Lcom/miui/gallery/module/ModuleManagerService;

    iput-object p2, p0, Lcom/miui/gallery/module/ModuleManagerService$1;->val$module:Ljava/lang/String;

    iput-object p3, p0, Lcom/miui/gallery/module/ModuleManagerService$1;->val$params:Landroid/app/job/JobParameters;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/module/ModuleManagerService$1;->run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;
    .locals 3

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$CTA;->canConnectNetwork()Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    invoke-static {}, Lmiui/net/ConnectivityHelper;->getInstance()Lmiui/net/ConnectivityHelper;

    move-result-object p1

    invoke-virtual {p1}, Lmiui/net/ConnectivityHelper;->isUnmeteredNetworkConnected()Z

    move-result p1

    if-eqz p1, :cond_0

    new-instance p1, Lcom/miui/gallery/module/CacheRepository;

    iget-object v1, p0, Lcom/miui/gallery/module/ModuleManagerService$1;->this$0:Lcom/miui/gallery/module/ModuleManagerService;

    invoke-virtual {v1}, Lcom/miui/gallery/module/ModuleManagerService;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {p1, v1, v0}, Lcom/miui/gallery/module/CacheRepository;-><init>(Landroid/content/Context;Z)V

    iget-object v1, p0, Lcom/miui/gallery/module/ModuleManagerService$1;->val$module:Ljava/lang/String;

    invoke-virtual {p1, v1}, Lcom/miui/gallery/module/CacheRepository;->cache(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/module/ModuleManagerService$1;->this$0:Lcom/miui/gallery/module/ModuleManagerService;

    invoke-static {p1}, Lcom/miui/gallery/module/ModuleManagerService;->access$000(Lcom/miui/gallery/module/ModuleManagerService;)Ljava/lang/String;

    move-result-object p1

    const-string v1, "cache %s failed"

    iget-object v2, p0, Lcom/miui/gallery/module/ModuleManagerService$1;->val$module:Ljava/lang/String;

    invoke-static {p1, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/module/ModuleManagerService$1;->this$0:Lcom/miui/gallery/module/ModuleManagerService;

    iget-object v1, p0, Lcom/miui/gallery/module/ModuleManagerService$1;->val$params:Landroid/app/job/JobParameters;

    invoke-virtual {p1, v1, v0}, Lcom/miui/gallery/module/ModuleManagerService;->jobFinished(Landroid/app/job/JobParameters;Z)V

    const/4 p1, 0x0

    return-object p1
.end method
