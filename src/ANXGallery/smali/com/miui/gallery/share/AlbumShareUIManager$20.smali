.class final Lcom/miui/gallery/share/AlbumShareUIManager$20;
.super Ljava/lang/Object;
.source "AlbumShareUIManager.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/share/AlbumShareUIManager;->kickSharersAsync(Ljava/lang/String;Ljava/util/List;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;)Lcom/miui/gallery/threadpool/Future;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
        "Lcom/miui/gallery/share/AsyncResult<",
        "Landroid/util/Pair<",
        "Ljava/util/List<",
        "Ljava/lang/String;",
        ">;",
        "Ljava/util/List<",
        "Ljava/lang/String;",
        ">;>;>;>;"
    }
.end annotation


# instance fields
.field final synthetic val$serverId:Ljava/lang/String;

.field final synthetic val$userIds:Ljava/util/List;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/util/List;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/share/AlbumShareUIManager$20;->val$serverId:Ljava/lang/String;

    iput-object p2, p0, Lcom/miui/gallery/share/AlbumShareUIManager$20;->val$userIds:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Lcom/miui/gallery/share/AsyncResult;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/threadpool/ThreadPool$JobContext;",
            ")",
            "Lcom/miui/gallery/share/AsyncResult<",
            "Landroid/util/Pair<",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;>;"
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/share/AlbumShareUIManager;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/share/AlbumShareUIManager$20;->val$serverId:Ljava/lang/String;

    iget-object v1, p0, Lcom/miui/gallery/share/AlbumShareUIManager$20;->val$userIds:Ljava/util/List;

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/share/AlbumShareOperations;->deleteSharers(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/util/List;)Lcom/miui/gallery/share/AsyncResult;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/share/AlbumShareUIManager$20;->run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Lcom/miui/gallery/share/AsyncResult;

    move-result-object p1

    return-object p1
.end method
