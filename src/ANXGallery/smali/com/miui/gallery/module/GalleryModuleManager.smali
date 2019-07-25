.class public Lcom/miui/gallery/module/GalleryModuleManager;
.super Ljava/lang/Object;
.source "GalleryModuleManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/module/GalleryModuleManager$ModuleLoadListener;
    }
.end annotation


# static fields
.field private static final INSTANCE:Lcom/miui/gallery/module/GalleryModuleManager;


# instance fields
.field private mContext:Landroid/content/Context;

.field private mLoadedModules:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mLoadingModules:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/miui/gallery/module/GalleryModuleManager;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/miui/gallery/module/GalleryModuleManager;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/miui/gallery/module/GalleryModuleManager;->INSTANCE:Lcom/miui/gallery/module/GalleryModuleManager;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/module/GalleryModuleManager;->mLoadedModules:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/module/GalleryModuleManager;->mLoadingModules:Ljava/util/ArrayList;

    iput-object p1, p0, Lcom/miui/gallery/module/GalleryModuleManager;->mContext:Landroid/content/Context;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/module/GalleryModuleManager;)Ljava/util/ArrayList;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/module/GalleryModuleManager;->mLoadedModules:Ljava/util/ArrayList;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/module/GalleryModuleManager;)Ljava/util/ArrayList;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/module/GalleryModuleManager;->mLoadingModules:Ljava/util/ArrayList;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/module/GalleryModuleManager;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/module/GalleryModuleManager;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method public static getInstance()Lcom/miui/gallery/module/GalleryModuleManager;
    .locals 1

    sget-object v0, Lcom/miui/gallery/module/GalleryModuleManager;->INSTANCE:Lcom/miui/gallery/module/GalleryModuleManager;

    return-object v0
.end method


# virtual methods
.method public isModuleLoaded(Ljava/lang/String;)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/module/GalleryModuleManager;->mLoadedModules:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/module/GalleryModuleManager;->mLoadedModules:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p1

    monitor-exit v0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public isModuleLoading(Ljava/lang/String;)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/module/GalleryModuleManager;->mLoadingModules:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/module/GalleryModuleManager;->mLoadingModules:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p1

    monitor-exit v0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public loadModule(ZLcom/miui/gallery/module/GalleryModuleManager$ModuleLoadListener;Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/module/GalleryModuleManager;->mLoadingModules:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/module/GalleryModuleManager;->mLoadingModules:Ljava/util/ArrayList;

    invoke-virtual {v1, p3}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/module/GalleryModuleManager;->mLoadingModules:Ljava/util/ArrayList;

    invoke-virtual {v1, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.miui.gallery.extra_load_module_failed"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "module"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/miui/gallery/module/GalleryModuleManager;->mContext:Landroid/content/Context;

    invoke-static {v1}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/support/v4/content/LocalBroadcastManager;->sendBroadcast(Landroid/content/Intent;)Z

    if-eqz p3, :cond_1

    invoke-static {}, Lmiui/module/ModuleManager;->getInstance()Lmiui/module/ModuleManager;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/module/GalleryModuleManager$1;

    invoke-direct {v1, p0, p2}, Lcom/miui/gallery/module/GalleryModuleManager$1;-><init>(Lcom/miui/gallery/module/GalleryModuleManager;Lcom/miui/gallery/module/GalleryModuleManager$ModuleLoadListener;)V

    invoke-virtual {v0, v1}, Lmiui/module/ModuleManager;->setModuleLoadListener(Lmiui/module/ModuleManager$ModuleLoadListener;)V

    :cond_1
    const/4 p2, 0x0

    const/4 v0, 0x1

    if-eqz p1, :cond_2

    invoke-static {}, Lmiui/module/ModuleManager;->getInstance()Lmiui/module/ModuleManager;

    move-result-object p1

    new-instance v1, Lcom/miui/gallery/module/CacheRepository;

    iget-object v2, p0, Lcom/miui/gallery/module/GalleryModuleManager;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2, v0}, Lcom/miui/gallery/module/CacheRepository;-><init>(Landroid/content/Context;Z)V

    new-array v0, v0, [Ljava/lang/String;

    aput-object p3, v0, p2

    invoke-virtual {p1, v1, v0}, Lmiui/module/ModuleManager;->loadModules(Lmiui/module/Repository;[Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    invoke-static {}, Lmiui/module/ModuleManager;->getInstance()Lmiui/module/ModuleManager;

    move-result-object p1

    new-instance v1, Lcom/miui/gallery/module/CacheRepository;

    iget-object v2, p0, Lcom/miui/gallery/module/GalleryModuleManager;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2, p2}, Lcom/miui/gallery/module/CacheRepository;-><init>(Landroid/content/Context;Z)V

    new-array v0, v0, [Ljava/lang/String;

    aput-object p3, v0, p2

    invoke-virtual {p1, v1, v0}, Lmiui/module/ModuleManager;->loadModules(Lmiui/module/Repository;[Ljava/lang/String;)V

    :goto_0
    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method
