.class public Lcom/miui/gallery/share/AlbumShareUIManager;
.super Ljava/lang/Object;
.source "AlbumShareUIManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/share/AlbumShareUIManager$FutureCancelledListener;,
        Lcom/miui/gallery/share/AlbumShareUIManager$FutureListenerAdapter;,
        Lcom/miui/gallery/share/AlbumShareUIManager$JobStatusManager;,
        Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;,
        Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;,
        Lcom/miui/gallery/share/AlbumShareUIManager$OnStatusChangedListener;
    }
.end annotation


# static fields
.field private static final sAlbumShareManager:Lcom/miui/gallery/share/AlbumShareUIManager$JobStatusManager;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/share/AlbumShareUIManager$JobStatusManager<",
            "Lcom/miui/gallery/share/Path;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final sDefaultJobManager:Lcom/miui/gallery/share/AlbumShareUIManager$JobStatusManager;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/share/AlbumShareUIManager$JobStatusManager<",
            "Ljava/lang/Void;",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field static final sHandler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/miui/gallery/share/AlbumShareUIManager;->sHandler:Landroid/os/Handler;

    new-instance v0, Lcom/miui/gallery/share/AlbumShareUIManager$JobStatusManager;

    new-instance v1, Lcom/miui/gallery/threadpool/ThreadPool;

    invoke-direct {v1}, Lcom/miui/gallery/threadpool/ThreadPool;-><init>()V

    invoke-direct {v0, v1}, Lcom/miui/gallery/share/AlbumShareUIManager$JobStatusManager;-><init>(Lcom/miui/gallery/threadpool/ThreadPool;)V

    sput-object v0, Lcom/miui/gallery/share/AlbumShareUIManager;->sDefaultJobManager:Lcom/miui/gallery/share/AlbumShareUIManager$JobStatusManager;

    new-instance v0, Lcom/miui/gallery/share/AlbumShareUIManager$1;

    new-instance v1, Lcom/miui/gallery/threadpool/ThreadPool;

    const/4 v2, 0x1

    invoke-direct {v1, v2, v2}, Lcom/miui/gallery/threadpool/ThreadPool;-><init>(II)V

    invoke-direct {v0, v1}, Lcom/miui/gallery/share/AlbumShareUIManager$1;-><init>(Lcom/miui/gallery/threadpool/ThreadPool;)V

    sput-object v0, Lcom/miui/gallery/share/AlbumShareUIManager;->sAlbumShareManager:Lcom/miui/gallery/share/AlbumShareUIManager$JobStatusManager;

    return-void
.end method

.method private static acceptInvitationAsync(Lcom/miui/gallery/share/Path;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;)Lcom/miui/gallery/threadpool/Future;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/share/Path;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "Lcom/miui/gallery/share/Path;",
            "Ljava/lang/Long;",
            ">;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;",
            ")",
            "Lcom/miui/gallery/threadpool/Future<",
            "*>;"
        }
    .end annotation

    invoke-static {p0}, Lcom/miui/gallery/share/AlbumShareUIManager;->findSharerMediaSet(Lcom/miui/gallery/share/Path;)Lcom/miui/gallery/share/CloudSharerMediaSet;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/share/AlbumShareUIManager;->allowOperation(Lcom/miui/gallery/share/CloudSharerMediaSet;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    invoke-static {p1}, Lcom/miui/gallery/share/AlbumShareUIManager;->notifyError(Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)V

    return-object v2

    :cond_0
    invoke-virtual {v0}, Lcom/miui/gallery/share/CloudSharerMediaSet;->getShareUrl()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string p0, "AlbumShareUIManager"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "acceptInvitationAsync: Invalid shareUrl, media set="

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p1}, Lcom/miui/gallery/share/AlbumShareUIManager;->notifyError(Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)V

    return-object v2

    :cond_1
    invoke-static {v0}, Lcom/miui/gallery/share/AlbumShareUIManager;->readAlbumShareStateFromDB(Lcom/miui/gallery/share/CloudSharerMediaSet;)I

    move-result v1

    invoke-static {v1}, Lcom/miui/gallery/share/AlbumShareState;->accept(I)I

    move-result v1

    invoke-static {v1}, Lcom/miui/gallery/share/AlbumShareState;->isValid(I)Z

    move-result v3

    if-nez v3, :cond_2

    const-string p0, "AlbumShareUIManager"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "acceptInvitationAsync: Invalid state, media set="

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p1}, Lcom/miui/gallery/share/AlbumShareUIManager;->notifyError(Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)V

    return-object v2

    :cond_2
    invoke-virtual {v0}, Lcom/miui/gallery/share/CloudSharerMediaSet;->getShareUrl()Ljava/lang/String;

    move-result-object v2

    new-instance v6, Lcom/miui/gallery/share/AlbumShareUIManager$9;

    invoke-direct {v6, v2, v0}, Lcom/miui/gallery/share/AlbumShareUIManager$9;-><init>(Ljava/lang/String;Lcom/miui/gallery/share/CloudSharerMediaSet;)V

    sget-object v3, Lcom/miui/gallery/share/AlbumShareUIManager;->sAlbumShareManager:Lcom/miui/gallery/share/AlbumShareUIManager$JobStatusManager;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    move-object v4, p0

    move-object v7, p1

    move-object v8, p2

    invoke-static/range {v3 .. v8}, Lcom/miui/gallery/share/AlbumShareUIManager;->submit(Lcom/miui/gallery/share/AlbumShareUIManager$JobStatusManager;Ljava/lang/Object;Ljava/lang/Object;Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;)Lcom/miui/gallery/threadpool/Future;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$000()Lcom/miui/gallery/share/AlbumShareUIManager$JobStatusManager;
    .locals 1

    sget-object v0, Lcom/miui/gallery/share/AlbumShareUIManager;->sAlbumShareManager:Lcom/miui/gallery/share/AlbumShareUIManager$JobStatusManager;

    return-object v0
.end method

.method static synthetic access$100(Landroid/app/Activity;Lcom/miui/gallery/share/Path;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/share/AlbumShareUIManager;->onNegativeClick(Landroid/app/Activity;Lcom/miui/gallery/share/Path;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/share/Path;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;)Lcom/miui/gallery/threadpool/Future;
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/share/AlbumShareUIManager;->acceptInvitationAsync(Lcom/miui/gallery/share/Path;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;)Lcom/miui/gallery/threadpool/Future;

    move-result-object p0

    return-object p0
.end method

.method public static addInvitationToDBAsync(Ljava/lang/String;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "Ljava/lang/Void;",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/share/AlbumShareUIManager$5;

    invoke-direct {v0, p0}, Lcom/miui/gallery/share/AlbumShareUIManager$5;-><init>(Ljava/lang/String;)V

    invoke-static {v0, p1}, Lcom/miui/gallery/share/AlbumShareUIManager;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)Lcom/miui/gallery/threadpool/Future;

    return-void
.end method

.method static allowOperation(Lcom/miui/gallery/share/CloudSharerMediaSet;)Z
    .locals 4

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return v0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/share/CloudSharerMediaSet;->getPath()Lcom/miui/gallery/share/Path;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/share/AlbumShareUIManager;->findAlbumShareStateFromCache(Lcom/miui/gallery/share/Path;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    const-string v1, "AlbumShareUIManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Operation is in process, mediaSet="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v0

    :cond_1
    const/4 p0, 0x1

    return p0
.end method

.method public static applyToShareAlbum(Landroid/app/Activity;Lcom/miui/gallery/share/Path;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Landroid/content/DialogInterface$OnCancelListener;Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;Z)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Lcom/miui/gallery/share/Path;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "Lcom/miui/gallery/share/Path;",
            "Ljava/lang/Void;",
            ">;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "Lcom/miui/gallery/share/Path;",
            "Ljava/lang/Long;",
            ">;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "Lcom/miui/gallery/share/Path;",
            "Ljava/lang/Void;",
            ">;",
            "Landroid/content/DialogInterface$OnCancelListener;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;",
            "Z)V"
        }
    .end annotation

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    new-instance p0, Lcom/miui/gallery/share/AlbumShareUIManager$7;

    move-object v0, p0

    move-object v2, p1

    move v3, p7

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    move-object v7, p2

    invoke-direct/range {v0 .. v7}, Lcom/miui/gallery/share/AlbumShareUIManager$7;-><init>(Ljava/lang/ref/WeakReference;Lcom/miui/gallery/share/Path;ZLcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Landroid/content/DialogInterface$OnCancelListener;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)V

    new-instance p3, Lcom/miui/gallery/share/AlbumShareUIManager$8;

    invoke-direct {p3, p1, p2, p0, p6}, Lcom/miui/gallery/share/AlbumShareUIManager$8;-><init>(Lcom/miui/gallery/share/Path;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;)V

    const/4 p0, 0x1

    invoke-static {p3, p1, p0}, Lcom/miui/gallery/share/AlbumShareUIManager;->doAfterCloudMediaSetSetReload(Ljava/lang/Runnable;Lcom/miui/gallery/share/Path;Z)V

    return-void
.end method

.method public static changePublicStatusAsync(Ljava/lang/String;ZLcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)Lcom/miui/gallery/threadpool/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "Ljava/lang/Void;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/miui/gallery/threadpool/Future<",
            "*>;"
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/share/AlbumShareUIManager$13;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/share/AlbumShareUIManager$13;-><init>(Ljava/lang/String;Z)V

    invoke-static {v0, p2}, Lcom/miui/gallery/share/AlbumShareUIManager;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)Lcom/miui/gallery/threadpool/Future;

    move-result-object p0

    return-object p0
.end method

.method private static denyInvitationAsync(Lcom/miui/gallery/share/Path;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;)Lcom/miui/gallery/threadpool/Future;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/share/Path;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "Lcom/miui/gallery/share/Path;",
            "Ljava/lang/Void;",
            ">;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;",
            ")",
            "Lcom/miui/gallery/threadpool/Future<",
            "*>;"
        }
    .end annotation

    invoke-static {p0}, Lcom/miui/gallery/share/AlbumShareUIManager;->findSharerMediaSet(Lcom/miui/gallery/share/Path;)Lcom/miui/gallery/share/CloudSharerMediaSet;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/share/AlbumShareUIManager;->allowOperation(Lcom/miui/gallery/share/CloudSharerMediaSet;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    invoke-static {p1}, Lcom/miui/gallery/share/AlbumShareUIManager;->notifyError(Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)V

    return-object v2

    :cond_0
    invoke-virtual {v0}, Lcom/miui/gallery/share/CloudSharerMediaSet;->getShareUrl()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string p0, "AlbumShareUIManager"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "denyInvitationAsync: Invalid shareUrl, media set="

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p1}, Lcom/miui/gallery/share/AlbumShareUIManager;->notifyError(Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)V

    return-object v2

    :cond_1
    invoke-static {v0}, Lcom/miui/gallery/share/AlbumShareUIManager;->readAlbumShareStateFromDB(Lcom/miui/gallery/share/CloudSharerMediaSet;)I

    move-result v1

    invoke-static {v1}, Lcom/miui/gallery/share/AlbumShareState;->deny(I)I

    move-result v1

    invoke-static {v1}, Lcom/miui/gallery/share/AlbumShareState;->isValid(I)Z

    move-result v3

    if-nez v3, :cond_2

    const-string p0, "AlbumShareUIManager"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "denyInvitationAsync: Invalid state, media set="

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p1}, Lcom/miui/gallery/share/AlbumShareUIManager;->notifyError(Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)V

    return-object v2

    :cond_2
    invoke-virtual {v0}, Lcom/miui/gallery/share/CloudSharerMediaSet;->getShareUrl()Ljava/lang/String;

    move-result-object v2

    new-instance v6, Lcom/miui/gallery/share/AlbumShareUIManager$10;

    invoke-direct {v6, v2, v0}, Lcom/miui/gallery/share/AlbumShareUIManager$10;-><init>(Ljava/lang/String;Lcom/miui/gallery/share/CloudSharerMediaSet;)V

    sget-object v3, Lcom/miui/gallery/share/AlbumShareUIManager;->sAlbumShareManager:Lcom/miui/gallery/share/AlbumShareUIManager$JobStatusManager;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    move-object v4, p0

    move-object v7, p1

    move-object v8, p2

    invoke-static/range {v3 .. v8}, Lcom/miui/gallery/share/AlbumShareUIManager;->submit(Lcom/miui/gallery/share/AlbumShareUIManager$JobStatusManager;Ljava/lang/Object;Ljava/lang/Object;Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;)Lcom/miui/gallery/threadpool/Future;

    move-result-object p0

    return-object p0
.end method

.method public static doAfterCloudMediaSetSetReload(Ljava/lang/Runnable;Lcom/miui/gallery/share/Path;Z)V
    .locals 0

    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    :cond_0
    return-void
.end method

.method public static exitAlbumShareAsync(Lcom/miui/gallery/share/Path;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/share/Path;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "Lcom/miui/gallery/share/Path;",
            "Ljava/lang/Void;",
            ">;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;",
            ")V"
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/share/AlbumShareUIManager$11;

    invoke-direct {v0, p0, p1, p2}, Lcom/miui/gallery/share/AlbumShareUIManager$11;-><init>(Lcom/miui/gallery/share/Path;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;)V

    const/4 p1, 0x1

    invoke-static {v0, p0, p1}, Lcom/miui/gallery/share/AlbumShareUIManager;->doAfterCloudMediaSetSetReload(Ljava/lang/Runnable;Lcom/miui/gallery/share/Path;Z)V

    return-void
.end method

.method static findAlbumShareStateFromCache(Lcom/miui/gallery/share/Path;)I
    .locals 1

    sget-object v0, Lcom/miui/gallery/share/AlbumShareUIManager;->sAlbumShareManager:Lcom/miui/gallery/share/AlbumShareUIManager$JobStatusManager;

    invoke-virtual {v0, p0}, Lcom/miui/gallery/share/AlbumShareUIManager$JobStatusManager;->find(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    goto :goto_0

    :cond_0
    const/4 p0, -0x1

    :goto_0
    return p0
.end method

.method public static findSharerMediaSet(Lcom/miui/gallery/share/Path;)Lcom/miui/gallery/share/CloudSharerMediaSet;
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/share/Path;->getMediaSet()Lcom/miui/gallery/share/CloudSharerMediaSet;

    move-result-object p0

    return-object p0
.end method

.method static getContentResolver()Landroid/content/ContentResolver;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    return-object v0
.end method

.method public static getIncomingInvitation(Lcom/miui/gallery/share/CloudSharerMediaSet;)Lcom/miui/gallery/share/AlbumShareOperations$IncomingInvitation;
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/share/CloudSharerMediaSet;->getShareUrlLong()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/miui/gallery/share/AlbumShareOperations;->parseInvitation(Ljava/lang/String;)Lcom/miui/gallery/share/AlbumShareOperations$IncomingInvitation;

    move-result-object p0

    return-object p0
.end method

.method public static kickSharersAsync(Ljava/lang/String;Ljava/util/List;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;)Lcom/miui/gallery/threadpool/Future;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "Ljava/lang/Void;",
            "Landroid/util/Pair<",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;>;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;",
            ")",
            "Lcom/miui/gallery/threadpool/Future<",
            "*>;"
        }
    .end annotation

    new-instance v3, Lcom/miui/gallery/share/AlbumShareUIManager$20;

    invoke-direct {v3, p0, p1}, Lcom/miui/gallery/share/AlbumShareUIManager$20;-><init>(Ljava/lang/String;Ljava/util/List;)V

    sget-object v0, Lcom/miui/gallery/share/AlbumShareUIManager;->sDefaultJobManager:Lcom/miui/gallery/share/AlbumShareUIManager$JobStatusManager;

    const/4 v1, 0x0

    const/4 v2, 0x0

    move-object v4, p2

    move-object v5, p3

    invoke-static/range {v0 .. v5}, Lcom/miui/gallery/share/AlbumShareUIManager;->submit(Lcom/miui/gallery/share/AlbumShareUIManager$JobStatusManager;Ljava/lang/Object;Ljava/lang/Object;Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;)Lcom/miui/gallery/threadpool/Future;

    move-result-object p0

    return-object p0
.end method

.method static notifyError(Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "**>;)V"
        }
    .end annotation

    const/16 v0, -0x6e

    invoke-static {p0, v0}, Lcom/miui/gallery/share/AlbumShareUIManager;->notifyError(Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;I)V

    return-void
.end method

.method static notifyError(Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "**>;I)V"
        }
    .end annotation

    if-eqz p0, :cond_0

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-interface {p0, v1, v1, p1, v0}, Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;->onCompletion(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    :cond_0
    return-void
.end method

.method private static onNegativeClick(Landroid/app/Activity;Lcom/miui/gallery/share/Path;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Lcom/miui/gallery/share/Path;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "Lcom/miui/gallery/share/Path;",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    if-eqz p2, :cond_0

    goto :goto_0

    :cond_0
    new-instance p2, Lcom/miui/gallery/share/AlbumShareUIManager$27;

    invoke-direct {p2}, Lcom/miui/gallery/share/AlbumShareUIManager$27;-><init>()V

    :goto_0
    const/4 v0, 0x0

    const v1, 0x7f1004de

    invoke-virtual {p0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {p0, v0, v1, v2}, Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;->create(Landroid/app/Activity;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;

    move-result-object p0

    invoke-static {p1, p2, p0}, Lcom/miui/gallery/share/AlbumShareUIManager;->denyInvitationAsync(Lcom/miui/gallery/share/Path;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;)Lcom/miui/gallery/threadpool/Future;

    return-void
.end method

.method static readAlbumShareStateFromDB(Lcom/miui/gallery/share/CloudSharerMediaSet;)I
    .locals 1

    if-nez p0, :cond_0

    const/4 p0, -0x1

    return p0

    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/share/CloudSharerMediaSet;->getAlbumShareState(Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method static readAlbumShareStateFromDB(Lcom/miui/gallery/share/Path;)I
    .locals 0

    if-nez p0, :cond_0

    const/4 p0, -0x1

    return p0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/share/Path;->getMediaSet()Lcom/miui/gallery/share/CloudSharerMediaSet;

    move-result-object p0

    invoke-static {p0}, Lcom/miui/gallery/share/AlbumShareUIManager;->readAlbumShareStateFromDB(Lcom/miui/gallery/share/CloudSharerMediaSet;)I

    move-result p0

    return p0
.end method

.method public static requestInvitationForSmsAsync(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;)Lcom/miui/gallery/threadpool/Future;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "Ljava/lang/Void;",
            "Lcom/miui/gallery/share/AlbumShareOperations$OutgoingInvitation;",
            ">;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;",
            ")",
            "Lcom/miui/gallery/threadpool/Future<",
            "*>;"
        }
    .end annotation

    new-instance v6, Lcom/miui/gallery/share/AlbumShareUIManager$16;

    move-object v0, v6

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/miui/gallery/share/AlbumShareUIManager$16;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/miui/gallery/share/AlbumShareUIManager;->sDefaultJobManager:Lcom/miui/gallery/share/AlbumShareUIManager$JobStatusManager;

    const/4 v1, 0x0

    const/4 v2, 0x0

    move-object v3, v6

    move-object v4, p5

    move-object v5, p6

    invoke-static/range {v0 .. v5}, Lcom/miui/gallery/share/AlbumShareUIManager;->submit(Lcom/miui/gallery/share/AlbumShareUIManager$JobStatusManager;Ljava/lang/Object;Ljava/lang/Object;Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;)Lcom/miui/gallery/threadpool/Future;

    move-result-object p0

    return-object p0
.end method

.method private static requestPublicUrlAsync(Ljava/lang/String;ZLcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)Lcom/miui/gallery/threadpool/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "Ljava/lang/Void;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/miui/gallery/threadpool/Future<",
            "*>;"
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/share/AlbumShareUIManager$14;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/share/AlbumShareUIManager$14;-><init>(Ljava/lang/String;Z)V

    invoke-static {v0, p2}, Lcom/miui/gallery/share/AlbumShareUIManager;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)Lcom/miui/gallery/threadpool/Future;

    move-result-object p0

    return-object p0
.end method

.method public static requestPublicUrlForOwnerAsync(Ljava/lang/String;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)Lcom/miui/gallery/threadpool/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "Ljava/lang/Void;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/miui/gallery/threadpool/Future<",
            "*>;"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Lcom/miui/gallery/share/AlbumShareUIManager;->requestPublicUrlAsync(Ljava/lang/String;ZLcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)Lcom/miui/gallery/threadpool/Future;

    move-result-object p0

    return-object p0
.end method

.method public static requestPublicUrlForSharerAsync(Ljava/lang/String;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)Lcom/miui/gallery/threadpool/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "Ljava/lang/Void;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/miui/gallery/threadpool/Future<",
            "*>;"
        }
    .end annotation

    const/4 v0, 0x1

    invoke-static {p0, v0, p1}, Lcom/miui/gallery/share/AlbumShareUIManager;->requestPublicUrlAsync(Ljava/lang/String;ZLcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)Lcom/miui/gallery/threadpool/Future;

    move-result-object p0

    return-object p0
.end method

.method public static requestUrlForBarcodeAsync(Ljava/lang/String;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)Lcom/miui/gallery/threadpool/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "Ljava/lang/Void;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/miui/gallery/threadpool/Future<",
            "*>;"
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/share/AlbumShareUIManager$12;

    invoke-direct {v0, p0}, Lcom/miui/gallery/share/AlbumShareUIManager$12;-><init>(Ljava/lang/String;)V

    invoke-static {v0, p1}, Lcom/miui/gallery/share/AlbumShareUIManager;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)Lcom/miui/gallery/threadpool/Future;

    move-result-object p0

    return-object p0
.end method

.method private static showDialogToAccept(Landroid/app/Activity;Lcom/miui/gallery/share/AlbumShareOperations$IncomingInvitation;Landroid/content/DialogInterface$OnCancelListener;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnShowListener;)V
    .locals 7

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/share/AlbumShareOperations$IncomingInvitation;->getOwnerName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const-string v0, ""

    :goto_0
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/share/AlbumShareOperations$IncomingInvitation;->getAlbumName()Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_1
    const-string p1, ""

    :goto_1
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f100670

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f100001

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const v0, 0x7f1005bc

    const/4 v5, 0x1

    new-array v6, v5, [Ljava/lang/Object;

    aput-object p1, v6, v4

    invoke-virtual {p0, v0, v6}, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v3, v5

    invoke-virtual {p0, v2, v3}, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const/high16 p1, 0x7f100000

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const p1, 0x7f100307

    invoke-virtual {p0, p1, p3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-virtual {p0, p4}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {p0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method private static showDialogToAccept(Landroid/app/Activity;Lcom/miui/gallery/share/AlbumShareOperations$SharerInfo;Landroid/content/DialogInterface$OnCancelListener;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnShowListener;)V
    .locals 10

    iget-object v0, p1, Lcom/miui/gallery/share/AlbumShareOperations$SharerInfo;->mAlbumNickName:Ljava/lang/String;

    iget-object v1, p1, Lcom/miui/gallery/share/AlbumShareOperations$SharerInfo;->mOwnerRelationText:Ljava/lang/String;

    iget-object v2, p1, Lcom/miui/gallery/share/AlbumShareOperations$SharerInfo;->mSharerRelationText:Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f02000f

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f020017

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_0
    array-length v7, v3

    if-ge v6, v7, :cond_1

    aget-object v7, v3, v6

    invoke-virtual {v7, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    aget-object v2, v4, v6

    goto :goto_1

    :cond_0
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    invoke-virtual {p0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v3

    const v4, 0x7f0b0029

    const/4 v6, 0x0

    invoke-virtual {v3, v4, v6}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    const v4, 0x7f0901e8

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    const v7, 0x7f10007f

    const/4 v8, 0x5

    new-array v8, v8, [Ljava/lang/Object;

    aput-object v0, v8, v5

    const/4 v9, 0x1

    aput-object v2, v8, v9

    const/4 v2, 0x2

    aput-object v0, v8, v2

    const/4 v2, 0x3

    aput-object v1, v8, v2

    const/4 v1, 0x4

    aput-object v0, v8, v1

    invoke-virtual {p0, v7, v8}, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v0, Landroid/app/AlertDialog$Builder;

    sget v1, Lmiui/R$style;->Theme_Light_Dialog:I

    invoke-direct {v0, p0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v0, v3}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const/high16 v0, 0x7f100000

    invoke-virtual {p0, v0, v6}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const v0, 0x7f100307

    invoke-virtual {p0, v0, p3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-virtual {p0, p4}, Landroid/app/AlertDialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    iget-object p2, p1, Lcom/miui/gallery/share/AlbumShareOperations$SharerInfo;->mThumbnailUrl:Ljava/lang/String;

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_2

    new-instance p2, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {p2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    invoke-virtual {p2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheOnDisc()Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p2

    invoke-virtual {p2, v9}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerExifParams(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p2

    invoke-virtual {p2, v9}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->resetViewBeforeLoading(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p2

    sget-object p3, Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;->EXACTLY:Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    invoke-virtual {p2, p3}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageScaleType(Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p2

    sget-object p3, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-virtual {p2, p3}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->bitmapConfig(Landroid/graphics/Bitmap$Config;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p2

    new-instance p3, Lcom/miui/gallery/util/face/PeopleItemBitmapDisplayer;

    invoke-direct {p3, v5}, Lcom/miui/gallery/util/face/PeopleItemBitmapDisplayer;-><init>(Z)V

    invoke-virtual {p2, p3}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->displayer(Lcom/nostra13/universalimageloader/core/display/BitmapDisplayer;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p2

    const p3, 0x7f070036

    invoke-virtual {p2, p3}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showStubImage(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p2

    invoke-virtual {p2, v9}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->usingRegionDecoderFace(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p2

    invoke-virtual {p2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v7

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object p2

    invoke-virtual {p2}, Lcom/nostra13/universalimageloader/core/ImageLoader;->resume()V

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v4

    iget-object v5, p1, Lcom/miui/gallery/share/AlbumShareOperations$SharerInfo;->mThumbnailUrl:Ljava/lang/String;

    const p2, 0x7f090053

    invoke-virtual {v3, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    move-object v6, p2

    check-cast v6, Landroid/widget/ImageView;

    const/4 v8, 0x0

    iget-object v9, p1, Lcom/miui/gallery/share/AlbumShareOperations$SharerInfo;->mFaceRelativePos:Landroid/graphics/RectF;

    invoke-virtual/range {v4 .. v9}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;)V

    new-instance p1, Lcom/miui/gallery/share/AlbumShareUIManager$25;

    invoke-direct {p1}, Lcom/miui/gallery/share/AlbumShareUIManager$25;-><init>()V

    invoke-virtual {p0, p1}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    :cond_2
    invoke-virtual {p0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method

.method static showDialogToAccept(Landroid/app/Activity;Lcom/miui/gallery/share/CloudSharerMediaSet;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Landroid/content/DialogInterface$OnCancelListener;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Lcom/miui/gallery/share/CloudSharerMediaSet;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "Lcom/miui/gallery/share/Path;",
            "Ljava/lang/Long;",
            ">;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "Lcom/miui/gallery/share/Path;",
            "Ljava/lang/Void;",
            ">;",
            "Landroid/content/DialogInterface$OnCancelListener;",
            ")V"
        }
    .end annotation

    invoke-virtual {p1}, Lcom/miui/gallery/share/CloudSharerMediaSet;->getPath()Lcom/miui/gallery/share/Path;

    move-result-object v0

    invoke-static {p1}, Lcom/miui/gallery/share/AlbumShareUIManager;->getIncomingInvitation(Lcom/miui/gallery/share/CloudSharerMediaSet;)Lcom/miui/gallery/share/AlbumShareOperations$IncomingInvitation;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/share/AlbumShareUIManager$23;

    invoke-direct {v2, p0, v0, p3}, Lcom/miui/gallery/share/AlbumShareUIManager$23;-><init>(Landroid/app/Activity;Lcom/miui/gallery/share/Path;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)V

    new-instance p3, Lcom/miui/gallery/share/AlbumShareUIManager$24;

    invoke-direct {p3, v0, p0, p2}, Lcom/miui/gallery/share/AlbumShareUIManager$24;-><init>(Lcom/miui/gallery/share/Path;Landroid/app/Activity;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)V

    const/4 p2, 0x0

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/miui/gallery/share/AlbumShareOperations$IncomingInvitation;->hasSharerInfo()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/share/CloudSharerMediaSet;->getSharerInfo()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    move-object p1, p2

    :goto_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p1}, Lcom/miui/gallery/share/AlbumShareOperations;->parseSharerInfo(Ljava/lang/String;)Lcom/miui/gallery/share/AlbumShareOperations$SharerInfo;

    move-result-object p2

    :cond_1
    if-eqz p2, :cond_2

    invoke-static {p0, p2, p4, v2, p3}, Lcom/miui/gallery/share/AlbumShareUIManager;->showDialogToAccept(Landroid/app/Activity;Lcom/miui/gallery/share/AlbumShareOperations$SharerInfo;Landroid/content/DialogInterface$OnCancelListener;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnShowListener;)V

    goto :goto_1

    :cond_2
    invoke-static {p0, v1, p4, v2, p3}, Lcom/miui/gallery/share/AlbumShareUIManager;->showDialogToAccept(Landroid/app/Activity;Lcom/miui/gallery/share/AlbumShareOperations$IncomingInvitation;Landroid/content/DialogInterface$OnCancelListener;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnShowListener;)V

    :goto_1
    return-void
.end method

.method static submit(Lcom/miui/gallery/share/AlbumShareUIManager$JobStatusManager;Ljava/lang/Object;Ljava/lang/Object;Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)Lcom/miui/gallery/threadpool/Future;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "T:",
            "Ljava/lang/Object;",
            "S:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/miui/gallery/share/AlbumShareUIManager$JobStatusManager<",
            "TK;TS;>;TK;TS;",
            "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
            "Lcom/miui/gallery/share/AsyncResult<",
            "TT;>;>;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "TK;TT;>;)",
            "Lcom/miui/gallery/threadpool/Future<",
            "Lcom/miui/gallery/share/AsyncResult<",
            "TT;>;>;"
        }
    .end annotation

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-static/range {v0 .. v5}, Lcom/miui/gallery/share/AlbumShareUIManager;->submit(Lcom/miui/gallery/share/AlbumShareUIManager$JobStatusManager;Ljava/lang/Object;Ljava/lang/Object;Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;)Lcom/miui/gallery/threadpool/Future;

    move-result-object p0

    return-object p0
.end method

.method static submit(Lcom/miui/gallery/share/AlbumShareUIManager$JobStatusManager;Ljava/lang/Object;Ljava/lang/Object;Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;)Lcom/miui/gallery/threadpool/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "T:",
            "Ljava/lang/Object;",
            "S:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/miui/gallery/share/AlbumShareUIManager$JobStatusManager<",
            "TK;TS;>;TK;TS;",
            "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
            "Lcom/miui/gallery/share/AsyncResult<",
            "TT;>;>;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "TK;TT;>;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;",
            ")",
            "Lcom/miui/gallery/threadpool/Future<",
            "Lcom/miui/gallery/share/AsyncResult<",
            "TT;>;>;"
        }
    .end annotation

    if-nez p5, :cond_0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/share/AlbumShareUIManager$JobStatusManager;->add(Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance p2, Lcom/miui/gallery/share/AlbumShareUIManager$FutureListenerAdapter;

    invoke-direct {p2, p1, p4, p0}, Lcom/miui/gallery/share/AlbumShareUIManager$FutureListenerAdapter;-><init>(Ljava/lang/Object;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$JobStatusManager;)V

    invoke-virtual {p0}, Lcom/miui/gallery/share/AlbumShareUIManager$JobStatusManager;->getThreadPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object p0

    invoke-virtual {p0, p3, p2}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/threadpool/FutureListener;)Lcom/miui/gallery/threadpool/Future;

    move-result-object p0

    return-object p0

    :cond_0
    invoke-virtual {p5}, Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;->buildDialog()Lmiui/app/ProgressDialog;

    move-result-object v0

    if-nez v0, :cond_2

    const/4 p0, 0x0

    if-eqz p4, :cond_1

    const/4 p2, -0x2

    const/4 p3, 0x0

    invoke-interface {p4, p1, p0, p2, p3}, Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;->onCompletion(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    :cond_1
    return-object p0

    :cond_2
    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/share/AlbumShareUIManager$JobStatusManager;->add(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    new-instance p2, Lcom/miui/gallery/share/AlbumShareUIManager$FutureCancelledListener;

    invoke-direct {p2, p4, v0}, Lcom/miui/gallery/share/AlbumShareUIManager$FutureCancelledListener;-><init>(Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Landroid/app/Dialog;)V

    new-instance p4, Lcom/miui/gallery/share/AlbumShareUIManager$FutureListenerAdapter;

    invoke-direct {p4, p1, p2, p0}, Lcom/miui/gallery/share/AlbumShareUIManager$FutureListenerAdapter;-><init>(Ljava/lang/Object;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$JobStatusManager;)V

    invoke-virtual {p0}, Lcom/miui/gallery/share/AlbumShareUIManager$JobStatusManager;->getThreadPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object p0

    invoke-virtual {p0, p3, p4}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/threadpool/FutureListener;)Lcom/miui/gallery/threadpool/Future;

    move-result-object p0

    new-instance p1, Lcom/miui/gallery/share/AlbumShareUIManager$22;

    invoke-direct {p1, p0, p5}, Lcom/miui/gallery/share/AlbumShareUIManager$22;-><init>(Lcom/miui/gallery/threadpool/Future;Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;)V

    invoke-virtual {v0, p1}, Landroid/app/Dialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    return-object p0
.end method

.method public static submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)Lcom/miui/gallery/threadpool/Future;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
            "Lcom/miui/gallery/share/AsyncResult<",
            "TT;>;>;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "Ljava/lang/Void;",
            "TT;>;)",
            "Lcom/miui/gallery/threadpool/Future<",
            "Lcom/miui/gallery/share/AsyncResult<",
            "TT;>;>;"
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/share/AlbumShareUIManager;->sDefaultJobManager:Lcom/miui/gallery/share/AlbumShareUIManager$JobStatusManager;

    const/4 v1, 0x0

    invoke-static {v0, v1, v1, p0, p1}, Lcom/miui/gallery/share/AlbumShareUIManager;->submit(Lcom/miui/gallery/share/AlbumShareUIManager$JobStatusManager;Ljava/lang/Object;Ljava/lang/Object;Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)Lcom/miui/gallery/threadpool/Future;

    move-result-object p0

    return-object p0
.end method

.method public static syncAllUserInfoFromNetworkAsync(Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)Lcom/miui/gallery/threadpool/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "Ljava/lang/Void;",
            "Ljava/lang/Void;",
            ">;)",
            "Lcom/miui/gallery/threadpool/Future<",
            "*>;"
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/share/AlbumShareUIManager$19;

    invoke-direct {v0}, Lcom/miui/gallery/share/AlbumShareUIManager$19;-><init>()V

    invoke-static {v0, p0}, Lcom/miui/gallery/share/AlbumShareUIManager;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)Lcom/miui/gallery/threadpool/Future;

    move-result-object p0

    return-object p0
.end method

.method public static syncUserListForAlbumAsync(Ljava/lang/String;ZLcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)Lcom/miui/gallery/threadpool/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "Ljava/lang/Void;",
            "Ljava/lang/Void;",
            ">;)",
            "Lcom/miui/gallery/threadpool/Future<",
            "*>;"
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/share/AlbumShareUIManager$18;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/share/AlbumShareUIManager$18;-><init>(Ljava/lang/String;Z)V

    invoke-static {v0, p2}, Lcom/miui/gallery/share/AlbumShareUIManager;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)Lcom/miui/gallery/threadpool/Future;

    move-result-object p0

    return-object p0
.end method

.method public static tryToAccept(Lcom/miui/gallery/share/Path;Landroid/app/Activity;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Landroid/content/DialogInterface$OnCancelListener;Landroid/app/Dialog;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/share/Path;",
            "Landroid/app/Activity;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "Lcom/miui/gallery/share/Path;",
            "Ljava/lang/Long;",
            ">;",
            "Landroid/content/DialogInterface$OnCancelListener;",
            "Landroid/app/Dialog;",
            ")V"
        }
    .end annotation

    if-eqz p4, :cond_0

    invoke-virtual {p4}, Landroid/app/Dialog;->dismiss()V

    :cond_0
    new-instance p3, Lcom/miui/gallery/share/AlbumShareUIManager$26;

    invoke-direct {p3, p1, p0, p2}, Lcom/miui/gallery/share/AlbumShareUIManager$26;-><init>(Landroid/app/Activity;Lcom/miui/gallery/share/Path;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)V

    invoke-static {p1}, Lcom/miui/account/AccountHelper;->getXiaomiAccount(Landroid/content/Context;)Landroid/accounts/Account;

    move-result-object p4

    const/4 v0, 0x0

    if-eqz p4, :cond_1

    const-string v1, "com.miui.gallery.cloud.provider"

    invoke-static {p4, v1}, Landroid/content/ContentResolver;->getSyncAutomatically(Landroid/accounts/Account;Ljava/lang/String;)Z

    move-result p4

    if-eqz p4, :cond_1

    const/4 p4, 0x1

    goto :goto_0

    :cond_1
    const/4 p4, 0x0

    :goto_0
    if-nez p4, :cond_2

    const/4 p3, 0x0

    const/16 p4, -0x3eb

    invoke-interface {p2, p0, p3, p4, v0}, Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;->onCompletion(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    new-instance p2, Landroid/content/Intent;

    const-class p3, Lcom/miui/gallery/share/LoginAndSyncForInvitationActivity;

    invoke-direct {p2, p1, p3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string p3, "invitation_path"

    invoke-virtual {p2, p3, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    invoke-virtual {p1, p2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    goto :goto_1

    :cond_2
    invoke-interface {p3}, Ljava/lang/Runnable;->run()V

    :goto_1
    return-void
.end method

.method public static tryToCreateCloudAlbumAsync(Ljava/lang/String;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)Lcom/miui/gallery/threadpool/Future;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "Ljava/lang/Void;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/miui/gallery/threadpool/Future<",
            "*>;"
        }
    .end annotation

    new-instance v3, Lcom/miui/gallery/share/AlbumShareUIManager$21;

    invoke-direct {v3, p0}, Lcom/miui/gallery/share/AlbumShareUIManager$21;-><init>(Ljava/lang/String;)V

    sget-object v0, Lcom/miui/gallery/share/AlbumShareUIManager;->sDefaultJobManager:Lcom/miui/gallery/share/AlbumShareUIManager$JobStatusManager;

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v5, 0x0

    move-object v4, p1

    invoke-static/range {v0 .. v5}, Lcom/miui/gallery/share/AlbumShareUIManager;->submit(Lcom/miui/gallery/share/AlbumShareUIManager$JobStatusManager;Ljava/lang/Object;Ljava/lang/Object;Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;)Lcom/miui/gallery/threadpool/Future;

    move-result-object p0

    return-object p0
.end method

.method public static updateInvitationAsync(Lcom/miui/gallery/share/Path;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)Lcom/miui/gallery/threadpool/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/share/Path;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "Lcom/miui/gallery/share/Path;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/miui/gallery/threadpool/Future<",
            "*>;"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/miui/gallery/share/AlbumShareUIManager;->updateInvitationAsync(Lcom/miui/gallery/share/Path;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;)Lcom/miui/gallery/threadpool/Future;

    move-result-object p0

    return-object p0
.end method

.method public static updateInvitationAsync(Lcom/miui/gallery/share/Path;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;)Lcom/miui/gallery/threadpool/Future;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/share/Path;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "Lcom/miui/gallery/share/Path;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;",
            ")",
            "Lcom/miui/gallery/threadpool/Future<",
            "*>;"
        }
    .end annotation

    invoke-static {p0}, Lcom/miui/gallery/share/AlbumShareUIManager;->findSharerMediaSet(Lcom/miui/gallery/share/Path;)Lcom/miui/gallery/share/CloudSharerMediaSet;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/share/AlbumShareUIManager;->allowOperation(Lcom/miui/gallery/share/CloudSharerMediaSet;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    invoke-static {p1}, Lcom/miui/gallery/share/AlbumShareUIManager;->notifyError(Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)V

    return-object v2

    :cond_0
    invoke-virtual {v0}, Lcom/miui/gallery/share/CloudSharerMediaSet;->getShareUrl()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string p0, "AlbumShareUIManager"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "updateInvitationAsync: Invalid shareUrl, media set="

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p1}, Lcom/miui/gallery/share/AlbumShareUIManager;->notifyError(Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)V

    return-object v2

    :cond_1
    invoke-virtual {v0}, Lcom/miui/gallery/share/CloudSharerMediaSet;->hasShareDetailInfo()Z

    move-result v1

    if-eqz v1, :cond_3

    const-string p2, "AlbumShareUIManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "updateInvitationAsync: Already exist share detail info, media set="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz p1, :cond_2

    invoke-virtual {v0}, Lcom/miui/gallery/share/CloudSharerMediaSet;->getShareUrlLong()Ljava/lang/String;

    move-result-object p2

    const/4 v0, 0x0

    invoke-interface {p1, p0, p2, v0, v0}, Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;->onCompletion(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    :cond_2
    return-object v2

    :cond_3
    invoke-static {v0}, Lcom/miui/gallery/share/AlbumShareUIManager;->readAlbumShareStateFromDB(Lcom/miui/gallery/share/CloudSharerMediaSet;)I

    move-result v1

    invoke-static {v1}, Lcom/miui/gallery/share/AlbumShareState;->requestLongUrl(I)I

    move-result v1

    invoke-static {v1}, Lcom/miui/gallery/share/AlbumShareState;->isValid(I)Z

    move-result v3

    if-nez v3, :cond_4

    const-string p0, "AlbumShareUIManager"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "updateInvitationAsync: Invalid state, media set="

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p1}, Lcom/miui/gallery/share/AlbumShareUIManager;->notifyError(Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)V

    return-object v2

    :cond_4
    invoke-virtual {v0}, Lcom/miui/gallery/share/CloudSharerMediaSet;->getShareUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcom/miui/gallery/share/CloudSharerMediaSet;->getShareUrlLong()Ljava/lang/String;

    move-result-object v3

    new-instance v7, Lcom/miui/gallery/share/AlbumShareUIManager$3;

    invoke-direct {v7, v2, v3, v0}, Lcom/miui/gallery/share/AlbumShareUIManager$3;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/share/CloudSharerMediaSet;)V

    sget-object v4, Lcom/miui/gallery/share/AlbumShareUIManager;->sAlbumShareManager:Lcom/miui/gallery/share/AlbumShareUIManager$JobStatusManager;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    move-object v5, p0

    move-object v8, p1

    move-object v9, p2

    invoke-static/range {v4 .. v9}, Lcom/miui/gallery/share/AlbumShareUIManager;->submit(Lcom/miui/gallery/share/AlbumShareUIManager$JobStatusManager;Ljava/lang/Object;Ljava/lang/Object;Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;)Lcom/miui/gallery/threadpool/Future;

    move-result-object p0

    return-object p0
.end method

.method public static updateShareUrlLongAuto(Lcom/miui/gallery/share/Path;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/share/Path;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "Lcom/miui/gallery/share/Path;",
            "Ljava/lang/Void;",
            ">;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "Lcom/miui/gallery/share/Path;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lcom/miui/gallery/share/AlbumShareUIManager;->updateShareUrlLongAuto(Lcom/miui/gallery/share/Path;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;)V

    return-void
.end method

.method public static updateShareUrlLongAuto(Lcom/miui/gallery/share/Path;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/share/Path;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "Lcom/miui/gallery/share/Path;",
            "Ljava/lang/Void;",
            ">;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener<",
            "Lcom/miui/gallery/share/Path;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;",
            ")V"
        }
    .end annotation

    invoke-static {p0}, Lcom/miui/gallery/share/AlbumShareUIManager;->findSharerMediaSet(Lcom/miui/gallery/share/Path;)Lcom/miui/gallery/share/CloudSharerMediaSet;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eqz v0, :cond_5

    invoke-virtual {v0}, Lcom/miui/gallery/share/CloudSharerMediaSet;->isNormalStatus()Z

    move-result v3

    if-eqz v3, :cond_0

    if-eqz p1, :cond_6

    const/16 p2, -0x9

    invoke-interface {p1, p0, v1, p2, v2}, Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;->onCompletion(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lcom/miui/gallery/share/CloudSharerMediaSet;->getShareUrlLong()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_4

    invoke-static {p1}, Lcom/miui/gallery/share/AlbumShareOperations;->parseInvitation(Ljava/lang/String;)Lcom/miui/gallery/share/AlbumShareOperations$IncomingInvitation;

    move-result-object v1

    invoke-virtual {v0}, Lcom/miui/gallery/share/CloudSharerMediaSet;->getSharerInfo()Ljava/lang/String;

    move-result-object v0

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lcom/miui/gallery/share/AlbumShareOperations$IncomingInvitation;->hasSharerInfo()Z

    move-result v1

    if-eqz v1, :cond_2

    :cond_1
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4

    :cond_2
    if-eqz p2, :cond_3

    invoke-interface {p2, p0, p1, v2, v2}, Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;->onCompletion(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    :cond_3
    return-void

    :cond_4
    invoke-static {p0, p2, p3}, Lcom/miui/gallery/share/AlbumShareUIManager;->updateInvitationAsync(Lcom/miui/gallery/share/Path;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;)Lcom/miui/gallery/threadpool/Future;

    goto :goto_0

    :cond_5
    if-eqz p2, :cond_6

    const/4 p1, -0x2

    invoke-interface {p2, p0, v1, p1, v2}, Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;->onCompletion(Ljava/lang/Object;Ljava/lang/Object;IZ)V

    :cond_6
    :goto_0
    return-void
.end method
