.class Lcom/miui/gallery/cloud/UpDownloadManager$OnItemChangedDecorator;
.super Ljava/lang/Object;
.source "UpDownloadManager.java"

# interfaces
.implements Lcom/miui/gallery/cloud/thread/RequestCommandQueue$OnItemChangedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cloud/UpDownloadManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "OnItemChangedDecorator"
.end annotation


# instance fields
.field final mListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/cloud/thread/RequestCommandQueue$OnItemChangedListener;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/miui/gallery/cloud/UpDownloadManager;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/cloud/UpDownloadManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cloud/UpDownloadManager$OnItemChangedDecorator;->this$0:Lcom/miui/gallery/cloud/UpDownloadManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/cloud/UpDownloadManager$OnItemChangedDecorator;->mListeners:Ljava/util/List;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/cloud/UpDownloadManager;Lcom/miui/gallery/cloud/UpDownloadManager$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/UpDownloadManager$OnItemChangedDecorator;-><init>(Lcom/miui/gallery/cloud/UpDownloadManager;)V

    return-void
.end method


# virtual methods
.method public addOnItemChangedListener(Lcom/miui/gallery/cloud/thread/RequestCommandQueue$OnItemChangedListener;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cloud/UpDownloadManager$OnItemChangedDecorator;->mListeners:Ljava/util/List;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/cloud/UpDownloadManager$OnItemChangedDecorator;->mListeners:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public onAddItem(Lcom/miui/gallery/cloud/RequestCloudItem;)V
    .locals 3

    invoke-static {p1}, Lcom/miui/gallery/cloud/UpDownloadManager;->access$100(Lcom/miui/gallery/cloud/RequestCloudItem;)V

    iget-object v0, p0, Lcom/miui/gallery/cloud/UpDownloadManager$OnItemChangedDecorator;->mListeners:Ljava/util/List;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/cloud/UpDownloadManager$OnItemChangedDecorator;->mListeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/cloud/thread/RequestCommandQueue$OnItemChangedListener;

    invoke-interface {v2, p1}, Lcom/miui/gallery/cloud/thread/RequestCommandQueue$OnItemChangedListener;->onAddItem(Lcom/miui/gallery/cloud/RequestCloudItem;)V

    goto :goto_0

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public onRemoveItem(Lcom/miui/gallery/cloud/RequestCloudItem;)V
    .locals 3

    invoke-static {p1}, Lcom/miui/gallery/cloud/UpDownloadManager;->access$000(Lcom/miui/gallery/cloud/RequestCloudItem;)V

    iget-object v0, p0, Lcom/miui/gallery/cloud/UpDownloadManager$OnItemChangedDecorator;->mListeners:Ljava/util/List;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/cloud/UpDownloadManager$OnItemChangedDecorator;->mListeners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/cloud/thread/RequestCommandQueue$OnItemChangedListener;

    invoke-interface {v2, p1}, Lcom/miui/gallery/cloud/thread/RequestCommandQueue$OnItemChangedListener;->onRemoveItem(Lcom/miui/gallery/cloud/RequestCloudItem;)V

    goto :goto_0

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
