.class Lcom/nexstreaming/nexeditorsdk/nexEngine$4;
.super Ljava/lang/Object;
.source "nexEngine.java"

# interfaces
.implements Lcom/nexstreaming/app/common/task/Task$OnTaskEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nexstreaming/nexeditorsdk/nexEngine;->transcode(Ljava/lang/String;IIIJII)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:I

.field final synthetic c:Lcom/nexstreaming/nexeditorsdk/nexEngine;


# direct methods
.method constructor <init>(Lcom/nexstreaming/nexeditorsdk/nexEngine;II)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$4;->c:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$4;->a:I

    iput p3, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$4;->b:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTaskEvent(Lcom/nexstreaming/app/common/task/Task;Lcom/nexstreaming/app/common/task/Task$Event;)V
    .locals 11

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$4;->c:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    const/4 p2, 0x1

    invoke-static {p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$1500(Lcom/nexstreaming/nexeditorsdk/nexEngine;Z)V

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$4;->c:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$1600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)V

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$4;->a:I

    const/16 p2, 0x5a

    const/4 v0, 0x0

    if-eq p1, p2, :cond_2

    const/16 p2, 0xb4

    if-eq p1, p2, :cond_1

    const/16 p2, 0x10e

    if-eq p1, p2, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/16 p1, 0x40

    goto :goto_0

    :cond_1
    const/16 p1, 0x20

    goto :goto_0

    :cond_2
    const/16 p1, 0x10

    :goto_0
    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$4;->c:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    iget-boolean p2, p2, Lcom/nexstreaming/nexeditorsdk/nexEngine;->bNeedScaling:Z

    if-eqz p2, :cond_3

    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$4;->c:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    iput-boolean v0, p2, Lcom/nexstreaming/nexeditorsdk/nexEngine;->bNeedScaling:Z

    const/high16 p2, 0x100000

    or-int/2addr p1, p2

    :cond_3
    or-int/lit16 v10, p1, 0x1000

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$4;->c:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$1700(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    move-result-object p1

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$1800()I

    move-result p2

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(I[B)V

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$4;->c:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$1700(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    move-result-object v0

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$4;->c:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$1900(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Ljava/lang/String;

    move-result-object v1

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$4;->c:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$2000(Lcom/nexstreaming/nexeditorsdk/nexEngine;)I

    move-result v2

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$4;->c:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$2100(Lcom/nexstreaming/nexeditorsdk/nexEngine;)I

    move-result v3

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$4;->c:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$2200(Lcom/nexstreaming/nexeditorsdk/nexEngine;)I

    move-result v4

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$4;->c:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$2300(Lcom/nexstreaming/nexeditorsdk/nexEngine;)J

    move-result-wide v5

    const/4 v7, 0x0

    const/4 v8, 0x0

    iget v9, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$4;->b:I

    invoke-virtual/range {v0 .. v10}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Ljava/lang/String;IIIJIZII)Lcom/nexstreaming/app/common/task/Task;

    move-result-object p1

    new-instance p2, Lcom/nexstreaming/nexeditorsdk/nexEngine$4$1;

    invoke-direct {p2, p0}, Lcom/nexstreaming/nexeditorsdk/nexEngine$4$1;-><init>(Lcom/nexstreaming/nexeditorsdk/nexEngine$4;)V

    invoke-virtual {p1, p2}, Lcom/nexstreaming/app/common/task/Task;->onFailure(Lcom/nexstreaming/app/common/task/Task$OnFailListener;)Lcom/nexstreaming/app/common/task/Task;

    return-void
.end method
