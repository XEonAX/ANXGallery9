.class Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener$5;
.super Ljava/lang/Object;
.source "NexEditorEventListener.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener;->notifyEvent(IIIII)I
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

.field final synthetic e:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener;


# direct methods
.method constructor <init>(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener;IIII)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener$5;->e:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener;

    iput p2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener$5;->a:I

    iput p3, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener$5;->b:I

    iput p4, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener$5;->c:I

    iput p5, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener$5;->d:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    iget-object v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener$5;->e:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener;

    invoke-static {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener;)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    move-result-object v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener$5;->a:I

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener$5;->e:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener;

    invoke-static {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener;)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->v()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener$5;->e:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener;

    invoke-static {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener;)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    move-result-object v0

    iget v2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener$5;->b:I

    iget v3, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener$5;->c:I

    invoke-virtual {v0, v2, v3}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->d(II)V

    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener$5;->e:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener;

    invoke-static {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener;->c(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener;)Lcom/nexstreaming/kminternal/nexvideoeditor/c;

    move-result-object v0

    if-eqz v0, :cond_4

    iget v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener$5;->a:I

    if-ne v0, v1, :cond_2

    iget-object v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener$5;->e:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener;

    invoke-static {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener;->c(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener;)Lcom/nexstreaming/kminternal/nexvideoeditor/c;

    move-result-object v0

    invoke-interface {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/c;->a()V

    goto :goto_1

    :cond_2
    iget v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener$5;->d:I

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener$5;->e:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener;

    invoke-static {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener;->c(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener;)Lcom/nexstreaming/kminternal/nexvideoeditor/c;

    move-result-object v0

    iget v1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener$5;->d:I

    invoke-static {v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->fromValue(I)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/c;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;)V

    goto :goto_1

    :cond_3
    iget-object v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener$5;->e:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener;

    invoke-static {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener;->c(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener;)Lcom/nexstreaming/kminternal/nexvideoeditor/c;

    move-result-object v0

    iget v1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditorEventListener$5;->b:I

    invoke-interface {v0, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/c;->b(I)V

    :cond_4
    :goto_1
    return-void
.end method
