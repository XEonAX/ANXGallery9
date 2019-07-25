.class Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9$1;
.super Landroid/os/AsyncTask;
.source "MediaInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9;->a(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field a:Lcom/nexstreaming/app/common/task/Task$TaskError;

.field final synthetic b:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;

.field final synthetic c:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9;


# direct methods
.method constructor <init>(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9;Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9$1;->c:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9;

    iput-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9$1;->b:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9$1;->a:Lcom/nexstreaming/app/common/task/Task$TaskError;

    return-void
.end method


# virtual methods
.method protected varargs a([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 2

    iget-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9$1;->c:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9;

    iget p1, p1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9;->c:I

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9$1;->c:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9;

    iget-object p1, p1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9;->a:Ljava/io/File;

    const/16 v0, 0x32

    iget-object v1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9$1;->c:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9;

    iget-object v1, v1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9;->b:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/c;

    invoke-static {p1, v0, v1}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/g;->a(Ljava/io/File;ILcom/nexstreaming/kminternal/kinemaster/mediainfo/c;)Lcom/nexstreaming/app/common/task/Task$TaskError;

    move-result-object p1

    iput-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9$1;->a:Lcom/nexstreaming/app/common/task/Task$TaskError;

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9$1;->c:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9;

    iget-object p1, p1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9;->a:Ljava/io/File;

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9$1;->c:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9;

    iget v0, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9;->c:I

    iget-object v1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9$1;->c:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9;

    iget-object v1, v1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9;->b:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/c;

    invoke-static {p1, v0, v1}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/g;->a(Ljava/io/File;ILcom/nexstreaming/kminternal/kinemaster/mediainfo/c;)Lcom/nexstreaming/app/common/task/Task$TaskError;

    move-result-object p1

    iput-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9$1;->a:Lcom/nexstreaming/app/common/task/Task$TaskError;

    :goto_0
    iget-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9$1;->c:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9;

    iget-object p1, p1, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9;->a:Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    const/4 p1, 0x0

    return-object p1
.end method

.method protected a(Ljava/lang/Void;)V
    .locals 3

    iget-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9$1;->a:Lcom/nexstreaming/app/common/task/Task$TaskError;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9$1;->b:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9$1;->a:Lcom/nexstreaming/app/common/task/Task$TaskError;

    invoke-virtual {p1, v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->sendFailure(Lcom/nexstreaming/app/common/task/Task$TaskError;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9$1;->b:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;

    const/4 v0, 0x2

    new-array v0, v0, [Lcom/nexstreaming/app/common/task/Task$Event;

    const/4 v1, 0x0

    sget-object v2, Lcom/nexstreaming/app/common/task/Task$Event;->SUCCESS:Lcom/nexstreaming/app/common/task/Task$Event;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    sget-object v2, Lcom/nexstreaming/app/common/task/Task$Event;->COMPLETE:Lcom/nexstreaming/app/common/task/Task$Event;

    aput-object v2, v0, v1

    invoke-virtual {p1, v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->signalEvent([Lcom/nexstreaming/app/common/task/Task$Event;)V

    iget-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9$1;->b:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/a;->a()Lcom/nexstreaming/kminternal/kinemaster/mediainfo/h;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->sendResult(Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method protected synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9$1;->a([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method protected synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$9$1;->a(Ljava/lang/Void;)V

    return-void
.end method
