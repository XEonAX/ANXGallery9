.class Lcom/nexstreaming/nexeditorsdk/nexEngine$1;
.super Ljava/lang/Object;
.source "nexEngine.java"

# interfaces
.implements Lcom/nexstreaming/kminternal/nexvideoeditor/c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nexstreaming/nexeditorsdk/nexEngine;->setEditorListener()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/nexstreaming/nexeditorsdk/nexEngine;


# direct methods
.method constructor <init>(Lcom/nexstreaming/nexeditorsdk/nexEngine;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$700(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngineListener;->onSetTimeIgnored()V

    :cond_1
    return-void
.end method

.method public a(I)V
    .locals 6

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$700(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$200()Z

    move-result v0

    const/16 v1, 0x64

    if-eqz v0, :cond_3

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$400()Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$800(Lcom/nexstreaming/nexeditorsdk/nexEngine;)I

    move-result v0

    if-gtz v0, :cond_1

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$900()Lcom/nexstreaming/nexeditorsdk/nexProject;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalTime()I

    move-result v0

    :cond_1
    if-gtz v0, :cond_2

    div-int/lit8 p1, p1, 0xa

    goto :goto_0

    :cond_2
    mul-int/lit8 p1, p1, 0x64

    div-int/2addr p1, v0

    :goto_0
    if-ltz p1, :cond_8

    if-gt p1, v1, :cond_8

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$400()Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexEngineListener;->onEncodingProgress(I)V

    goto/16 :goto_3

    :cond_3
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$1002(Lcom/nexstreaming/nexeditorsdk/nexEngine;I)I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$100(Lcom/nexstreaming/nexeditorsdk/nexEngine;)I

    move-result v0

    const/4 v2, 0x2

    if-eq v0, v2, :cond_5

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$500(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;

    move-result-object v0

    sget-object v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;->RECORD:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;

    if-ne v0, v2, :cond_4

    goto :goto_1

    :cond_4
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexEngineListener;->onTimeChange(I)V

    goto :goto_3

    :cond_5
    :goto_1
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$800(Lcom/nexstreaming/nexeditorsdk/nexEngine;)I

    move-result v0

    if-gtz v0, :cond_6

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$1100(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexProject;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexProject;->getTotalTime()I

    move-result v0

    :cond_6
    if-gtz v0, :cond_7

    const/4 v2, 0x0

    goto :goto_2

    :cond_7
    mul-int/lit8 v2, p1, 0x64

    div-int/2addr v2, v0

    :goto_2
    const-string v3, "nexEngine"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v5}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$000(Lcom/nexstreaming/nexeditorsdk/nexEngine;)I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, "]export progress = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, ", duration="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", currentTime="

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-ltz v2, :cond_8

    if-gt v2, v1, :cond_8

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object p1

    invoke-interface {p1, v2}, Lcom/nexstreaming/nexeditorsdk/nexEngineListener;->onEncodingProgress(I)V

    :cond_8
    :goto_3
    return-void
.end method

.method public a(II)V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    if-eqz v0, :cond_1

    if-le p1, p2, :cond_0

    const/16 p1, 0x64

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexEngineListener;->onProgressThumbnailCaching(II)V

    :cond_1
    return-void
.end method

.method public a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;)V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$700(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->getValue()I

    move-result p1

    invoke-interface {v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexEngineListener;->onSetTimeFail(I)V

    :cond_1
    return-void
.end method

.method public a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;I)V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->getValue()I

    move-result p1

    invoke-interface {v0, p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexEngineListener;->onPlayFail(II)V

    :cond_0
    return-void
.end method

.method public a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;II)V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->getValue()I

    move-result p1

    invoke-interface {v0, p1, p2, p3}, Lcom/nexstreaming/nexeditorsdk/nexEngineListener;->onFastPreviewStartDone(III)V

    :cond_0
    return-void
.end method

.method public a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;)V
    .locals 3

    const-string v0, "nexEngine"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v2}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$000(Lcom/nexstreaming/nexeditorsdk/nexEngine;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "]onStateChange() oldState="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", newState="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ",curState="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v2}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$100(Lcom/nexstreaming/nexeditorsdk/nexEngine;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ", trans="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$200()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;->NONE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;

    const/4 v1, 0x1

    if-ne p1, v0, :cond_0

    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;->IDLE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;

    if-ne p2, v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$102(Lcom/nexstreaming/nexeditorsdk/nexEngine;I)I

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    const/4 v2, 0x0

    invoke-static {v0, v2}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$302(Lcom/nexstreaming/nexeditorsdk/nexEngine;Z)Z

    :goto_0
    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$200()Z

    move-result v0

    const/4 v2, 0x2

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$100(Lcom/nexstreaming/nexeditorsdk/nexEngine;)I

    move-result v0

    if-ne v0, v2, :cond_5

    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;->RECORD:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;

    if-ne p1, v0, :cond_5

    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;->RECORD:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;

    if-eq p2, v0, :cond_5

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$400()Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    if-eqz v0, :cond_5

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$400()Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;->getValue()I

    move-result p1

    invoke-virtual {p2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;->getValue()I

    move-result p2

    invoke-interface {v0, p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexEngineListener;->onStateChange(II)V

    goto/16 :goto_2

    :cond_1
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0, p2}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$502(Lcom/nexstreaming/nexeditorsdk/nexEngine;Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$100(Lcom/nexstreaming/nexeditorsdk/nexEngine;)I

    move-result v0

    if-ne v0, v2, :cond_4

    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;->RECORD:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;

    if-ne p1, v0, :cond_4

    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;->RECORD:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;

    if-eq p2, v0, :cond_4

    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;->PAUSE:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;

    if-ne p2, v0, :cond_2

    const-string v0, "nexEngine"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v2}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$000(Lcom/nexstreaming/nexeditorsdk/nexEngine;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "]new State is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_2
    sget-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;->RESUME:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;

    if-ne p2, v0, :cond_3

    const-string v0, "nexEngine"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v2}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$000(Lcom/nexstreaming/nexeditorsdk/nexEngine;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "]new State is "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_3
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$102(Lcom/nexstreaming/nexeditorsdk/nexEngine;I)I

    :cond_4
    :goto_1
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;->getValue()I

    move-result p1

    invoke-virtual {p2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$PlayState;->getValue()I

    move-result p2

    invoke-interface {v0, p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexEngineListener;->onStateChange(II)V

    :cond_5
    :goto_2
    return-void
.end method

.method public a(Z)V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexEngineListener;->onSeekStateChanged(Z)V

    :cond_0
    return-void
.end method

.method public b()V
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$102(Lcom/nexstreaming/nexeditorsdk/nexEngine;I)I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngineListener;->onPlayEnd()V

    :cond_0
    return-void
.end method

.method public b(I)V
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$700(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$100(Lcom/nexstreaming/nexeditorsdk/nexEngine;)I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexEngineListener;->onSetTimeDone(I)V

    :cond_1
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$1002(Lcom/nexstreaming/nexeditorsdk/nexEngine;I)I

    return-void
.end method

.method public b(II)V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    if-eqz v0, :cond_1

    if-le p1, p2, :cond_0

    const/16 p1, 0x64

    :cond_0
    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {p2}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object p2

    invoke-interface {p2, p1}, Lcom/nexstreaming/nexeditorsdk/nexEngineListener;->onEncodingProgress(I)V

    :cond_1
    return-void
.end method

.method public b(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;)V
    .locals 4

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$102(Lcom/nexstreaming/nexeditorsdk/nexEngine;I)I

    const-string v0, "nexEngine"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v3}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$000(Lcom/nexstreaming/nexeditorsdk/nexEngine;)I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "]onEncodingDone() ="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, ", trans="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$200()Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v3, ", forceMix="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v3}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$1200(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$200()Z

    move-result v0

    const/16 v2, 0x64

    const/4 v3, 0x0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$400()Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->isError()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$400()Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    invoke-interface {v0, v2}, Lcom/nexstreaming/nexeditorsdk/nexEngineListener;->onEncodingProgress(I)V

    :cond_0
    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$400()Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->isError()Z

    move-result v2

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->getValue()I

    move-result p1

    invoke-interface {v0, v2, p1}, Lcom/nexstreaming/nexeditorsdk/nexEngineListener;->onEncodingDone(ZI)V

    :cond_1
    invoke-static {v3}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$202(Z)Z

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {p1, v1, v1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$1300(Lcom/nexstreaming/nexeditorsdk/nexEngine;ZZ)I

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->isError()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    invoke-interface {v0, v2}, Lcom/nexstreaming/nexeditorsdk/nexEngineListener;->onEncodingProgress(I)V

    :cond_3
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->isError()Z

    move-result v1

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->getValue()I

    move-result p1

    invoke-interface {v0, v1, p1}, Lcom/nexstreaming/nexeditorsdk/nexEngineListener;->onEncodingDone(ZI)V

    :cond_4
    :goto_0
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {p1, v3}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$802(Lcom/nexstreaming/nexeditorsdk/nexEngine;I)I

    return-void
.end method

.method public b(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;I)V
    .locals 0

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object p1

    invoke-interface {p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexEngineListener;->onCheckDirectExport(I)V

    :cond_0
    return-void
.end method

.method public c()V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngineListener;->onPlayStart()V

    :cond_0
    return-void
.end method

.method public c(II)V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexEngineListener;->onPreviewPeakMeter(II)V

    :cond_0
    return-void
.end method

.method public c(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;)V
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->isError()Z

    move-result v1

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->getValue()I

    move-result p1

    invoke-interface {v0, v1, p1}, Lcom/nexstreaming/nexeditorsdk/nexEngineListener;->onEncodingDone(ZI)V

    :cond_0
    return-void
.end method

.method public d()V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngineListener;->onClipInfoDone()V

    :cond_0
    return-void
.end method

.method public d(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;)V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->getValue()I

    move-result p1

    invoke-interface {v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexEngineListener;->onFastPreviewStopDone(I)V

    :cond_0
    return-void
.end method

.method public e(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;)V
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexEngine$1;->a:Lcom/nexstreaming/nexeditorsdk/nexEngine;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->access$600(Lcom/nexstreaming/nexeditorsdk/nexEngine;)Lcom/nexstreaming/nexeditorsdk/nexEngineListener;

    move-result-object v0

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->getValue()I

    move-result p1

    invoke-interface {v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexEngineListener;->onFastPreviewTimeDone(I)V

    :cond_0
    return-void
.end method
