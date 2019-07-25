.class final Lcom/miui/gallery/share/AlbumShareUIManager$11;
.super Ljava/lang/Object;
.source "AlbumShareUIManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/share/AlbumShareUIManager;->exitAlbumShareAsync(Lcom/miui/gallery/share/Path;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$l:Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;

.field final synthetic val$msg:Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;

.field final synthetic val$path:Lcom/miui/gallery/share/Path;


# direct methods
.method constructor <init>(Lcom/miui/gallery/share/Path;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/share/AlbumShareUIManager$11;->val$path:Lcom/miui/gallery/share/Path;

    iput-object p2, p0, Lcom/miui/gallery/share/AlbumShareUIManager$11;->val$l:Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;

    iput-object p3, p0, Lcom/miui/gallery/share/AlbumShareUIManager$11;->val$msg:Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    iget-object v0, p0, Lcom/miui/gallery/share/AlbumShareUIManager$11;->val$path:Lcom/miui/gallery/share/Path;

    invoke-static {v0}, Lcom/miui/gallery/share/AlbumShareUIManager;->findSharerMediaSet(Lcom/miui/gallery/share/Path;)Lcom/miui/gallery/share/CloudSharerMediaSet;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/share/AlbumShareUIManager;->allowOperation(Lcom/miui/gallery/share/CloudSharerMediaSet;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/share/AlbumShareUIManager$11;->val$l:Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;

    invoke-static {v0}, Lcom/miui/gallery/share/AlbumShareUIManager;->notifyError(Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)V

    return-void

    :cond_0
    invoke-static {v0}, Lcom/miui/gallery/share/AlbumShareUIManager;->readAlbumShareStateFromDB(Lcom/miui/gallery/share/CloudSharerMediaSet;)I

    move-result v1

    invoke-static {v1}, Lcom/miui/gallery/share/AlbumShareState;->exit(I)I

    move-result v1

    invoke-static {v1}, Lcom/miui/gallery/share/AlbumShareState;->isValid(I)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v1, "AlbumShareUIManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid state, media set="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/miui/gallery/share/AlbumShareUIManager$11;->val$l:Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;

    invoke-static {v0}, Lcom/miui/gallery/share/AlbumShareUIManager;->notifyError(Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)V

    return-void

    :cond_1
    invoke-virtual {v0}, Lcom/miui/gallery/share/CloudSharerMediaSet;->getShareAlbumId()Ljava/lang/String;

    move-result-object v2

    new-instance v6, Lcom/miui/gallery/share/AlbumShareUIManager$11$1;

    invoke-direct {v6, p0, v2, v0}, Lcom/miui/gallery/share/AlbumShareUIManager$11$1;-><init>(Lcom/miui/gallery/share/AlbumShareUIManager$11;Ljava/lang/String;Lcom/miui/gallery/share/CloudSharerMediaSet;)V

    invoke-static {}, Lcom/miui/gallery/share/AlbumShareUIManager;->access$000()Lcom/miui/gallery/share/AlbumShareUIManager$JobStatusManager;

    move-result-object v3

    iget-object v4, p0, Lcom/miui/gallery/share/AlbumShareUIManager$11;->val$path:Lcom/miui/gallery/share/Path;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    iget-object v7, p0, Lcom/miui/gallery/share/AlbumShareUIManager$11;->val$l:Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;

    iget-object v8, p0, Lcom/miui/gallery/share/AlbumShareUIManager$11;->val$msg:Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;

    invoke-static/range {v3 .. v8}, Lcom/miui/gallery/share/AlbumShareUIManager;->submit(Lcom/miui/gallery/share/AlbumShareUIManager$JobStatusManager;Ljava/lang/Object;Ljava/lang/Object;Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;)Lcom/miui/gallery/threadpool/Future;

    return-void
.end method
