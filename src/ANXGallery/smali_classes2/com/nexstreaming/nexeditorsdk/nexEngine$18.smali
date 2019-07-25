.class Lcom/nexstreaming/nexeditorsdk/nexEngine$18;
.super Ljava/lang/Object;
.source "nexEngine.java"

# interfaces
.implements Lcom/nexstreaming/app/common/task/Task$OnTaskEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nexstreaming/nexeditorsdk/nexEngine;->export(Ljava/lang/String;IIIJIIIIII)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:I

.field final synthetic c:I

.field final synthetic d:I

.field final synthetic e:I

.field final synthetic f:I

.field final synthetic g:Lcom/nexstreaming/nexeditorsdk/nexEngine;


# direct methods
.method constructor <init>(Lcom/nexstreaming/nexeditorsdk/nexEngine;IIIIII)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$18;->g:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$18;->a:I

    iput p3, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$18;->b:I

    iput p4, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$18;->c:I

    iput p5, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$18;->d:I

    iput p6, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$18;->e:I

    iput p7, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$18;->f:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTaskEvent(Lcom/nexstreaming/app/common/task/Task;Lcom/nexstreaming/app/common/task/Task$Event;)V
    .locals 17

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$18;->g:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$1500(Lcom/nexstreaming/nexeditorsdk/nexEngine;Z)V

    iget-object v1, v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$18;->g:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$1600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)V

    iget v1, v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$18;->a:I

    const/16 v2, 0x5a

    const/4 v3, 0x0

    if-eq v1, v2, :cond_2

    const/16 v2, 0xb4

    if-eq v1, v2, :cond_1

    const/16 v2, 0x10e

    if-eq v1, v2, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    const/16 v1, 0x40

    goto :goto_0

    :cond_1
    const/16 v1, 0x20

    goto :goto_0

    :cond_2
    const/16 v1, 0x10

    :goto_0
    iget-object v2, v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$18;->g:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    iget-boolean v2, v2, Lcom/nexstreaming/nexeditorsdk/nexEngine;->bNeedScaling:Z

    if-eqz v2, :cond_3

    iget-object v2, v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$18;->g:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    iput-boolean v3, v2, Lcom/nexstreaming/nexeditorsdk/nexEngine;->bNeedScaling:Z

    const/high16 v2, 0x100000

    or-int/2addr v1, v2

    :cond_3
    move/from16 v16, v1

    iget-object v1, v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$18;->g:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$1700(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$i;)V

    iget-object v1, v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$18;->g:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$1700(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    move-result-object v1

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$1800()I

    move-result v3

    invoke-virtual {v1, v3, v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(I[B)V

    iget-object v1, v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$18;->g:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$1700(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    move-result-object v2

    iget-object v1, v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$18;->g:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$1900(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Ljava/lang/String;

    move-result-object v3

    iget-object v1, v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$18;->g:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$2000(Lcom/nexstreaming/nexeditorsdk/nexEngine;)I

    move-result v4

    iget-object v1, v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$18;->g:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$2100(Lcom/nexstreaming/nexeditorsdk/nexEngine;)I

    move-result v5

    iget-object v1, v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$18;->g:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$2200(Lcom/nexstreaming/nexeditorsdk/nexEngine;)I

    move-result v6

    iget-object v1, v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$18;->g:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$2300(Lcom/nexstreaming/nexeditorsdk/nexEngine;)J

    move-result-wide v7

    const/4 v9, 0x0

    const/4 v10, 0x0

    iget v11, v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$18;->b:I

    iget v12, v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$18;->c:I

    iget v13, v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$18;->d:I

    iget v14, v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$18;->e:I

    iget v15, v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$18;->f:I

    invoke-virtual/range {v2 .. v16}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Ljava/lang/String;IIIJIZIIIIII)Lcom/nexstreaming/app/common/task/Task;

    move-result-object v1

    new-instance v2, Lcom/nexstreaming/nexeditorsdk/nexEngine$18$1;

    invoke-direct {v2, v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine$18$1;-><init>(Lcom/nexstreaming/nexeditorsdk/nexEngine$18;)V

    invoke-virtual {v1, v2}, Lcom/nexstreaming/app/common/task/Task;->onFailure(Lcom/nexstreaming/app/common/task/Task$OnFailListener;)Lcom/nexstreaming/app/common/task/Task;

    return-void
.end method
