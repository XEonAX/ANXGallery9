.class Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$15$1;
.super Ljava/lang/Object;
.source "MediaInfo.java"

# interfaces
.implements Lcom/nexstreaming/app/common/task/ResultTask$OnResultAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$15;->a(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/nexstreaming/app/common/task/ResultTask$OnResultAvailableListener<",
        "Lcom/nexstreaming/kminternal/kinemaster/mediainfo/b;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;

.field final synthetic b:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$15;


# direct methods
.method constructor <init>(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$15;Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$15$1;->b:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$15;

    iput-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$15$1;->a:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lcom/nexstreaming/app/common/task/ResultTask;Lcom/nexstreaming/app/common/task/Task$Event;Lcom/nexstreaming/kminternal/kinemaster/mediainfo/b;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/nexstreaming/app/common/task/ResultTask<",
            "Lcom/nexstreaming/kminternal/kinemaster/mediainfo/b;",
            ">;",
            "Lcom/nexstreaming/app/common/task/Task$Event;",
            "Lcom/nexstreaming/kminternal/kinemaster/mediainfo/b;",
            ")V"
        }
    .end annotation

    if-eqz p3, :cond_0

    iget-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$15$1;->a:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;

    invoke-virtual {p1, p3}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->sendResult(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$15$1;->a:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$c;->sendFailure(Lcom/nexstreaming/app/common/task/Task$TaskError;)V

    :goto_0
    return-void
.end method

.method public synthetic onResultAvailable(Lcom/nexstreaming/app/common/task/ResultTask;Lcom/nexstreaming/app/common/task/Task$Event;Ljava/lang/Object;)V
    .locals 0

    check-cast p3, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/b;

    invoke-virtual {p0, p1, p2, p3}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/MediaInfo$15$1;->a(Lcom/nexstreaming/app/common/task/ResultTask;Lcom/nexstreaming/app/common/task/Task$Event;Lcom/nexstreaming/kminternal/kinemaster/mediainfo/b;)V

    return-void
.end method
