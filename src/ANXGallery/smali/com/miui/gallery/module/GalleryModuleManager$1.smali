.class Lcom/miui/gallery/module/GalleryModuleManager$1;
.super Ljava/lang/Object;
.source "GalleryModuleManager.java"

# interfaces
.implements Lmiui/module/ModuleManager$ModuleLoadListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/module/GalleryModuleManager;->loadModule(ZLcom/miui/gallery/module/GalleryModuleManager$ModuleLoadListener;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/module/GalleryModuleManager;

.field final synthetic val$listener:Lcom/miui/gallery/module/GalleryModuleManager$ModuleLoadListener;


# direct methods
.method constructor <init>(Lcom/miui/gallery/module/GalleryModuleManager;Lcom/miui/gallery/module/GalleryModuleManager$ModuleLoadListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/module/GalleryModuleManager$1;->this$0:Lcom/miui/gallery/module/GalleryModuleManager;

    iput-object p2, p0, Lcom/miui/gallery/module/GalleryModuleManager$1;->val$listener:Lcom/miui/gallery/module/GalleryModuleManager$ModuleLoadListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLoadFail(Ljava/lang/String;I)V
    .locals 3

    const-string v0, "GalleryModuleManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "load module fail :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/module/GalleryModuleManager$1;->this$0:Lcom/miui/gallery/module/GalleryModuleManager;

    invoke-static {v0}, Lcom/miui/gallery/module/GalleryModuleManager;->access$100(Lcom/miui/gallery/module/GalleryModuleManager;)Ljava/util/ArrayList;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/module/GalleryModuleManager$1;->this$0:Lcom/miui/gallery/module/GalleryModuleManager;

    invoke-static {v1}, Lcom/miui/gallery/module/GalleryModuleManager;->access$100(Lcom/miui/gallery/module/GalleryModuleManager;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.miui.gallery.extra_load_module_failed"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "module"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object v1, p0, Lcom/miui/gallery/module/GalleryModuleManager$1;->this$0:Lcom/miui/gallery/module/GalleryModuleManager;

    invoke-static {v1}, Lcom/miui/gallery/module/GalleryModuleManager;->access$200(Lcom/miui/gallery/module/GalleryModuleManager;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/support/v4/content/LocalBroadcastManager;->sendBroadcast(Landroid/content/Intent;)Z

    const/4 v0, 0x3

    if-ne p2, v0, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/module/GalleryModuleManager$1;->this$0:Lcom/miui/gallery/module/GalleryModuleManager;

    invoke-static {p2}, Lcom/miui/gallery/module/GalleryModuleManager;->access$200(Lcom/miui/gallery/module/GalleryModuleManager;)Landroid/content/Context;

    move-result-object p2

    invoke-static {p2, p1}, Lcom/miui/gallery/module/CacheRepository;->clearCache(Landroid/content/Context;Ljava/lang/String;)V

    :cond_0
    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object p1

    new-instance p2, Lcom/miui/gallery/module/GalleryModuleManager$1$2;

    invoke-direct {p2, p0}, Lcom/miui/gallery/module/GalleryModuleManager$1$2;-><init>(Lcom/miui/gallery/module/GalleryModuleManager$1;)V

    invoke-virtual {p1, p2}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public onLoadFinish()V
    .locals 0

    return-void
.end method

.method public onLoadSuccess(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    const-string p2, "GalleryModuleManager"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "load module success :"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p2, p0, Lcom/miui/gallery/module/GalleryModuleManager$1;->this$0:Lcom/miui/gallery/module/GalleryModuleManager;

    invoke-static {p2}, Lcom/miui/gallery/module/GalleryModuleManager;->access$000(Lcom/miui/gallery/module/GalleryModuleManager;)Ljava/util/ArrayList;

    move-result-object p2

    monitor-enter p2

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/module/GalleryModuleManager$1;->this$0:Lcom/miui/gallery/module/GalleryModuleManager;

    invoke-static {v0}, Lcom/miui/gallery/module/GalleryModuleManager;->access$000(Lcom/miui/gallery/module/GalleryModuleManager;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/module/GalleryModuleManager$1;->this$0:Lcom/miui/gallery/module/GalleryModuleManager;

    invoke-static {v0}, Lcom/miui/gallery/module/GalleryModuleManager;->access$000(Lcom/miui/gallery/module/GalleryModuleManager;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    iget-object p2, p0, Lcom/miui/gallery/module/GalleryModuleManager$1;->this$0:Lcom/miui/gallery/module/GalleryModuleManager;

    invoke-static {p2}, Lcom/miui/gallery/module/GalleryModuleManager;->access$100(Lcom/miui/gallery/module/GalleryModuleManager;)Ljava/util/ArrayList;

    move-result-object v0

    monitor-enter v0

    :try_start_1
    iget-object p2, p0, Lcom/miui/gallery/module/GalleryModuleManager$1;->this$0:Lcom/miui/gallery/module/GalleryModuleManager;

    invoke-static {p2}, Lcom/miui/gallery/module/GalleryModuleManager;->access$100(Lcom/miui/gallery/module/GalleryModuleManager;)Ljava/util/ArrayList;

    move-result-object p2

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    new-instance p2, Landroid/content/Intent;

    const-string v0, "com.miui.gallery.extra_load_module_success"

    invoke-direct {p2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v0, "module"

    invoke-virtual {p2, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object p1, p0, Lcom/miui/gallery/module/GalleryModuleManager$1;->this$0:Lcom/miui/gallery/module/GalleryModuleManager;

    invoke-static {p1}, Lcom/miui/gallery/module/GalleryModuleManager;->access$200(Lcom/miui/gallery/module/GalleryModuleManager;)Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/support/v4/content/LocalBroadcastManager;->sendBroadcast(Landroid/content/Intent;)Z

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object p1

    new-instance p2, Lcom/miui/gallery/module/GalleryModuleManager$1$1;

    invoke-direct {p2, p0}, Lcom/miui/gallery/module/GalleryModuleManager$1$1;-><init>(Lcom/miui/gallery/module/GalleryModuleManager$1;)V

    invoke-virtual {p1, p2}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    return-void

    :catchall_0
    move-exception p1

    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1

    :catchall_1
    move-exception p1

    :try_start_3
    monitor-exit p2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw p1
.end method
