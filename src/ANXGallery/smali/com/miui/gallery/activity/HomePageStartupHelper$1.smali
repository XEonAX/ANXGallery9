.class Lcom/miui/gallery/activity/HomePageStartupHelper$1;
.super Ljava/lang/Object;
.source "HomePageStartupHelper.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/activity/HomePageStartupHelper;->loadHomePageData()Lcom/miui/gallery/threadpool/Future;
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
.field final synthetic this$0:Lcom/miui/gallery/activity/HomePageStartupHelper;


# direct methods
.method constructor <init>(Lcom/miui/gallery/activity/HomePageStartupHelper;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/activity/HomePageStartupHelper$1;->this$0:Lcom/miui/gallery/activity/HomePageStartupHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/activity/HomePageStartupHelper$1;->run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;
    .locals 9

    :try_start_0
    iget-object p1, p0, Lcom/miui/gallery/activity/HomePageStartupHelper$1;->this$0:Lcom/miui/gallery/activity/HomePageStartupHelper;

    iget-object v0, p0, Lcom/miui/gallery/activity/HomePageStartupHelper$1;->this$0:Lcom/miui/gallery/activity/HomePageStartupHelper;

    invoke-static {v0}, Lcom/miui/gallery/activity/HomePageStartupHelper;->access$100(Lcom/miui/gallery/activity/HomePageStartupHelper;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Lcom/miui/gallery/ui/HomePageFragment;->PHOTOS_LOADER_URI:Landroid/net/Uri;

    sget-object v3, Lcom/miui/gallery/ui/HomePageFragment;->PHOTOS_LOADER_PROJECTION:[Ljava/lang/String;

    const-string v4, "alias_show_in_homepage=1 AND sha1 NOT NULL"

    const/4 v5, 0x0

    const-string v6, "alias_sort_time DESC "

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/activity/HomePageStartupHelper;->access$002(Lcom/miui/gallery/activity/HomePageStartupHelper;Landroid/database/Cursor;)Landroid/database/Cursor;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-static {}, Lcom/miui/gallery/activity/HomePageStartupHelper;->access$200()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "error when load data in home page "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/activity/HomePageStartupHelper$1;->this$0:Lcom/miui/gallery/activity/HomePageStartupHelper;

    invoke-static {p1}, Lcom/miui/gallery/activity/HomePageStartupHelper;->access$300(Lcom/miui/gallery/activity/HomePageStartupHelper;)Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/activity/HomePageStartupHelper$1;->this$0:Lcom/miui/gallery/activity/HomePageStartupHelper;

    invoke-static {p1}, Lcom/miui/gallery/activity/HomePageStartupHelper;->access$400(Lcom/miui/gallery/activity/HomePageStartupHelper;)V

    return-object v0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/activity/HomePageStartupHelper$1;->this$0:Lcom/miui/gallery/activity/HomePageStartupHelper;

    invoke-static {p1}, Lcom/miui/gallery/activity/HomePageStartupHelper;->access$500(Lcom/miui/gallery/activity/HomePageStartupHelper;)Ljava/lang/Object;

    move-result-object p1

    monitor-enter p1

    :try_start_1
    iget-object v1, p0, Lcom/miui/gallery/activity/HomePageStartupHelper$1;->this$0:Lcom/miui/gallery/activity/HomePageStartupHelper;

    invoke-static {v1}, Lcom/miui/gallery/activity/HomePageStartupHelper;->access$000(Lcom/miui/gallery/activity/HomePageStartupHelper;)Landroid/database/Cursor;

    move-result-object v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/activity/HomePageStartupHelper$1;->this$0:Lcom/miui/gallery/activity/HomePageStartupHelper;

    invoke-static {v1}, Lcom/miui/gallery/activity/HomePageStartupHelper;->access$000(Lcom/miui/gallery/activity/HomePageStartupHelper;)Landroid/database/Cursor;

    move-result-object v1

    invoke-interface {v1}, Landroid/database/Cursor;->isClosed()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/activity/HomePageStartupHelper$1;->this$0:Lcom/miui/gallery/activity/HomePageStartupHelper;

    invoke-static {v1}, Lcom/miui/gallery/activity/HomePageStartupHelper;->access$000(Lcom/miui/gallery/activity/HomePageStartupHelper;)Landroid/database/Cursor;

    move-result-object v1

    invoke-interface {v1}, Landroid/database/Cursor;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "extra_timeline_item_count_in_group"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getIntegerArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    goto :goto_1

    :cond_1
    move-object v1, v0

    :goto_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    iget-object p1, p0, Lcom/miui/gallery/activity/HomePageStartupHelper$1;->this$0:Lcom/miui/gallery/activity/HomePageStartupHelper;

    invoke-static {p1, v1}, Lcom/miui/gallery/activity/HomePageStartupHelper;->access$600(Lcom/miui/gallery/activity/HomePageStartupHelper;Ljava/util/ArrayList;)I

    move-result p1

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    :goto_2
    add-int/lit8 v3, v2, 0x1

    if-ge v2, p1, :cond_5

    iget-object v2, p0, Lcom/miui/gallery/activity/HomePageStartupHelper$1;->this$0:Lcom/miui/gallery/activity/HomePageStartupHelper;

    invoke-static {v2}, Lcom/miui/gallery/activity/HomePageStartupHelper;->access$500(Lcom/miui/gallery/activity/HomePageStartupHelper;)Ljava/lang/Object;

    move-result-object v2

    monitor-enter v2

    :try_start_2
    iget-object v4, p0, Lcom/miui/gallery/activity/HomePageStartupHelper$1;->this$0:Lcom/miui/gallery/activity/HomePageStartupHelper;

    invoke-static {v4}, Lcom/miui/gallery/activity/HomePageStartupHelper;->access$000(Lcom/miui/gallery/activity/HomePageStartupHelper;)Landroid/database/Cursor;

    move-result-object v4

    if-eqz v4, :cond_4

    iget-object v4, p0, Lcom/miui/gallery/activity/HomePageStartupHelper$1;->this$0:Lcom/miui/gallery/activity/HomePageStartupHelper;

    invoke-static {v4}, Lcom/miui/gallery/activity/HomePageStartupHelper;->access$000(Lcom/miui/gallery/activity/HomePageStartupHelper;)Landroid/database/Cursor;

    move-result-object v4

    invoke-interface {v4}, Landroid/database/Cursor;->isClosed()Z

    move-result v4

    if-nez v4, :cond_4

    iget-object v4, p0, Lcom/miui/gallery/activity/HomePageStartupHelper$1;->this$0:Lcom/miui/gallery/activity/HomePageStartupHelper;

    invoke-static {v4}, Lcom/miui/gallery/activity/HomePageStartupHelper;->access$000(Lcom/miui/gallery/activity/HomePageStartupHelper;)Landroid/database/Cursor;

    move-result-object v4

    invoke-interface {v4}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-nez v4, :cond_2

    goto :goto_3

    :cond_2
    iget-object v4, p0, Lcom/miui/gallery/activity/HomePageStartupHelper$1;->this$0:Lcom/miui/gallery/activity/HomePageStartupHelper;

    invoke-static {v4}, Lcom/miui/gallery/activity/HomePageStartupHelper;->access$000(Lcom/miui/gallery/activity/HomePageStartupHelper;)Landroid/database/Cursor;

    move-result-object v4

    const/16 v5, 0xc

    const/4 v6, 0x5

    invoke-static {v4, v5, v6}, Lcom/miui/gallery/adapter/HomePageAdapter;->getMicroPath(Landroid/database/Cursor;II)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_3

    new-instance v5, Lcom/miui/gallery/activity/HomePageStartupHelper$ImageDisplayItem;

    iget-object v6, p0, Lcom/miui/gallery/activity/HomePageStartupHelper$1;->this$0:Lcom/miui/gallery/activity/HomePageStartupHelper;

    iget-object v7, p0, Lcom/miui/gallery/activity/HomePageStartupHelper$1;->this$0:Lcom/miui/gallery/activity/HomePageStartupHelper;

    invoke-static {v7}, Lcom/miui/gallery/activity/HomePageStartupHelper;->access$000(Lcom/miui/gallery/activity/HomePageStartupHelper;)Landroid/database/Cursor;

    move-result-object v7

    const/16 v8, 0x10

    invoke-interface {v7, v8}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v7

    invoke-direct {v5, v6, v4, v7, v8}, Lcom/miui/gallery/activity/HomePageStartupHelper$ImageDisplayItem;-><init>(Lcom/miui/gallery/activity/HomePageStartupHelper;Ljava/lang/String;J)V

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3
    monitor-exit v2

    move v2, v3

    goto :goto_2

    :cond_4
    :goto_3
    monitor-exit v2

    goto :goto_4

    :catchall_0
    move-exception p1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1

    :cond_5
    :goto_4
    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object p1

    new-instance v2, Lcom/miui/gallery/activity/HomePageStartupHelper$1$1;

    invoke-direct {v2, p0}, Lcom/miui/gallery/activity/HomePageStartupHelper$1$1;-><init>(Lcom/miui/gallery/activity/HomePageStartupHelper$1;)V

    invoke-virtual {p1, v2}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    iget-object p1, p0, Lcom/miui/gallery/activity/HomePageStartupHelper$1;->this$0:Lcom/miui/gallery/activity/HomePageStartupHelper;

    const/4 v2, 0x1

    invoke-static {p1, v2}, Lcom/miui/gallery/activity/HomePageStartupHelper;->access$802(Lcom/miui/gallery/activity/HomePageStartupHelper;Z)Z

    iget-object p1, p0, Lcom/miui/gallery/activity/HomePageStartupHelper$1;->this$0:Lcom/miui/gallery/activity/HomePageStartupHelper;

    invoke-static {p1, v1}, Lcom/miui/gallery/activity/HomePageStartupHelper;->access$900(Lcom/miui/gallery/activity/HomePageStartupHelper;Ljava/util/ArrayList;)V

    iget-object p1, p0, Lcom/miui/gallery/activity/HomePageStartupHelper$1;->this$0:Lcom/miui/gallery/activity/HomePageStartupHelper;

    invoke-static {p1}, Lcom/miui/gallery/activity/HomePageStartupHelper;->access$300(Lcom/miui/gallery/activity/HomePageStartupHelper;)Z

    move-result p1

    if-eqz p1, :cond_6

    iget-object p1, p0, Lcom/miui/gallery/activity/HomePageStartupHelper$1;->this$0:Lcom/miui/gallery/activity/HomePageStartupHelper;

    invoke-static {p1}, Lcom/miui/gallery/activity/HomePageStartupHelper;->access$400(Lcom/miui/gallery/activity/HomePageStartupHelper;)V

    :cond_6
    return-object v0

    :catchall_1
    move-exception v0

    :try_start_3
    monitor-exit p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v0
.end method
