.class Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9;
.super Ljava/lang/Object;
.source "MediaInfo.java"

# interfaces
.implements Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->a(IIIIII[ILcom/nexstreaming/kminternal/kinemaster/mediainfo/c;)Lcom/nexstreaming/app/common/task/Task;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$d<",
        "Lcom/nexstreaming/kminternal/kinemaster/mediainfo/h;",
        "Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$f;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Ljava/io/File;

.field final synthetic b:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/c;

.field final synthetic c:I

.field final synthetic d:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;


# direct methods
.method constructor <init>(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;Ljava/io/File;Lcom/nexstreaming/kminternal/kinemaster/mediainfo/c;I)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9;->d:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

    iput-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9;->a:Ljava/io/File;

    iput-object p3, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9;->b:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/c;

    iput p4, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9;->c:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c<",
            "Lcom/nexstreaming/kminternal/kinemaster/mediainfo/h;",
            "Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$f;",
            ">;",
            "Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;",
            ")V"
        }
    .end annotation

    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->NONE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eq p2, v0, :cond_8

    iget-boolean v0, p1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->b:Z

    if-eqz v0, :cond_0

    const-string p2, "MediaInfo"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "getDetailThumbnails::onEditorAsyncDone : User Cancel ID="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->getTaskId()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput v2, p1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->a:I

    iget-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9;->a:Ljava/io/File;

    invoke-virtual {p2}, Ljava/io/File;->delete()Z

    sget-object p2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->GETCLIPINFO_USER_CANCEL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    invoke-virtual {p1, p2}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->sendFailure(Lcom/nexstreaming/app/common/task/Task$TaskError;)V

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->E()V

    return-void

    :cond_0
    iget v0, p1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->a:I

    sub-int/2addr v0, v1

    iput v0, p1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->a:I

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9;->b:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/c;

    instance-of v0, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/e;

    if-eqz v0, :cond_1

    iput v2, p1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->a:I

    const-string v0, "MediaInfo"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getDetailThumbnails::Raw File. No RETRYING="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, ", ID="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->getTaskId()I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    iget v0, p1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->a:I

    if-lez v0, :cond_4

    const-string v0, "MediaInfo"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getDetailThumbnails::onEditorAsyncDone : RETRYING="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, ", ID="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->getTaskId()I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9;->a:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->GETCLIPINFO_USER_CANCEL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    if-eq p2, v0, :cond_3

    iget-boolean v0, p1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->b:Z

    if-eqz v0, :cond_2

    goto :goto_0

    :cond_2
    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->F()Ljava/util/Deque;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    sget-object p1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->INPROGRESS_GETCLIPINFO:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    if-eq p2, p1, :cond_7

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->E()V

    goto :goto_1

    :cond_3
    :goto_0
    iput v2, p1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->a:I

    sget-object p2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->GETCLIPINFO_USER_CANCEL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    invoke-virtual {p1, p2}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->sendFailure(Lcom/nexstreaming/app/common/task/Task$TaskError;)V

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->E()V

    goto :goto_1

    :cond_4
    const-string v0, "MediaInfo"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getDetailThumbnails::onEditorAsyncDone : SEND FAILURE="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, ", cancel="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v3, p1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->b:Z

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->GETCLIPINFO_USER_CANCEL:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    if-eq p2, v0, :cond_5

    iget-boolean v0, p1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->b:Z

    if-eqz v0, :cond_6

    :cond_5
    iput v2, p1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->a:I

    :cond_6
    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9;->a:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    invoke-virtual {p1, p2}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->sendFailure(Lcom/nexstreaming/app/common/task/Task$TaskError;)V

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->E()V

    :cond_7
    :goto_1
    return-void

    :cond_8
    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->E()V

    invoke-static {p1}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->a(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$f;

    iget p2, p2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$f;->h:I

    const/high16 v0, 0x40000

    and-int/2addr p2, v0

    if-ne p2, v0, :cond_9

    const-string p2, "MediaInfo"

    const-string v0, "getDetailThumbnails::onEditorAsyncDone() no cache mode"

    invoke-static {p2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p2, 0x2

    new-array p2, p2, [Lcom/nexstreaming/app/common/task/Task$Event;

    sget-object v0, Lcom/nexstreaming/app/common/task/Task$Event;->SUCCESS:Lcom/nexstreaming/app/common/task/Task$Event;

    aput-object v0, p2, v2

    sget-object v0, Lcom/nexstreaming/app/common/task/Task$Event;->COMPLETE:Lcom/nexstreaming/app/common/task/Task$Event;

    aput-object v0, p2, v1

    invoke-virtual {p1, p2}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->signalEvent([Lcom/nexstreaming/app/common/task/Task$Event;)V

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/a;->a()Lcom/nexstreaming/kminternal/kinemaster/mediainfo/h;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->sendResult(Ljava/lang/Object;)V

    goto :goto_2

    :cond_9
    const-string p2, "MediaInfo"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "getDetailThumbnails::onEditorAsyncDone("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9;->d:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;

    invoke-static {v1}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->b(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ") -> "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9;->a:Ljava/io/File;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance p2, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9$1;

    invoke-direct {p2, p0, p1}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9$1;-><init>(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9;Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;)V

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo;->G()Ljava/util/concurrent/Executor;

    move-result-object p1

    new-array v0, v2, [Ljava/lang/Void;

    invoke-virtual {p2, p1, v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9$1;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    :goto_2
    return-void
.end method
