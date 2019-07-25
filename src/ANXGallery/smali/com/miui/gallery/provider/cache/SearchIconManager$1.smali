.class Lcom/miui/gallery/provider/cache/SearchIconManager$1;
.super Landroid/database/ContentObserver;
.source "SearchIconManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/provider/cache/SearchIconManager;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/provider/cache/SearchIconManager;


# direct methods
.method constructor <init>(Lcom/miui/gallery/provider/cache/SearchIconManager;Landroid/os/Handler;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/SearchIconManager$1;->this$0:Lcom/miui/gallery/provider/cache/SearchIconManager;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method

.method public static synthetic lambda$onChange$18(Lcom/miui/gallery/provider/cache/SearchIconManager$1;Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 1

    const-string p1, ".searchProvider.SearchIconManager"

    const-string v0, "On notify change, clear cache"

    invoke-static {p1, v0}, Lcom/miui/gallery/search/utils/SearchLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/provider/cache/SearchIconManager$1;->this$0:Lcom/miui/gallery/provider/cache/SearchIconManager;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/cache/SearchIconManager;->releaseCache()V

    const/4 p1, 0x0

    return-object p1
.end method


# virtual methods
.method public onChange(Z)V
    .locals 1

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object p1

    new-instance v0, Lcom/miui/gallery/provider/cache/-$$Lambda$SearchIconManager$1$Jeew7DMjefJHPZKoPiHPTm2pL4c;

    invoke-direct {v0, p0}, Lcom/miui/gallery/provider/cache/-$$Lambda$SearchIconManager$1$Jeew7DMjefJHPZKoPiHPTm2pL4c;-><init>(Lcom/miui/gallery/provider/cache/SearchIconManager$1;)V

    invoke-virtual {p1, v0}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    return-void
.end method
