.class Lcom/nexstreaming/nexeditorsdk/nexTranscode$1;
.super Ljava/lang/Object;
.source "nexTranscode.java"

# interfaces
.implements Lcom/nexstreaming/nexeditorsdk/nexEngineListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nexstreaming/nexeditorsdk/nexTranscode;->run(Lcom/nexstreaming/nexeditorsdk/nexTranscode$Option;)Lcom/nexstreaming/nexeditorsdk/nexTranscode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/nexstreaming/nexeditorsdk/nexTranscode;


# direct methods
.method constructor <init>(Lcom/nexstreaming/nexeditorsdk/nexTranscode;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexTranscode$1;->a:Lcom/nexstreaming/nexeditorsdk/nexTranscode;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckDirectExport(I)V
    .locals 0

    return-void
.end method

.method public onClipInfoDone()V
    .locals 0

    return-void
.end method

.method public onEncodingDone(ZI)V
    .locals 3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexTranscode$1;->a:Lcom/nexstreaming/nexeditorsdk/nexTranscode;

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexTranscode$State;->COMPLETE:Lcom/nexstreaming/nexeditorsdk/nexTranscode$State;

    invoke-static {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexTranscode;->access$002(Lcom/nexstreaming/nexeditorsdk/nexTranscode;Lcom/nexstreaming/nexeditorsdk/nexTranscode$State;)Lcom/nexstreaming/nexeditorsdk/nexTranscode$State;

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexTranscode$1;->a:Lcom/nexstreaming/nexeditorsdk/nexTranscode;

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexTranscode$Error;->NONE:Lcom/nexstreaming/nexeditorsdk/nexTranscode$Error;

    invoke-static {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexTranscode;->access$102(Lcom/nexstreaming/nexeditorsdk/nexTranscode;Lcom/nexstreaming/nexeditorsdk/nexTranscode$Error;)Lcom/nexstreaming/nexeditorsdk/nexTranscode$Error;

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexTranscode$1;->a:Lcom/nexstreaming/nexeditorsdk/nexTranscode;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexTranscode;->access$200(Lcom/nexstreaming/nexeditorsdk/nexTranscode;)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexTranscode$1;->a:Lcom/nexstreaming/nexeditorsdk/nexTranscode;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexTranscode;->access$200(Lcom/nexstreaming/nexeditorsdk/nexTranscode;)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    move-result-object v0

    const-string v1, "std"

    invoke-static {v1}, Lcom/nexstreaming/kminternal/kinemaster/config/EditorGlobal;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->setProjectEffect(Ljava/lang/String;)I

    :cond_0
    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexTranscode;->access$300()Lcom/nexstreaming/nexeditorsdk/nexEngine;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexTranscode;->access$300()Lcom/nexstreaming/nexeditorsdk/nexEngine;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexEngine;->setScalingFlag2Export(Z)V

    :cond_1
    const-string v0, "nexTranscode"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onEncodingDone()="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;->EXPORT_USER_CANCEL:Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;->getValue()I

    move-result v0

    if-ne p2, v0, :cond_2

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexTranscode$1;->a:Lcom/nexstreaming/nexeditorsdk/nexTranscode;

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexTranscode$Error;->CANCEL:Lcom/nexstreaming/nexeditorsdk/nexTranscode$Error;

    invoke-static {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexTranscode;->access$102(Lcom/nexstreaming/nexeditorsdk/nexTranscode;Lcom/nexstreaming/nexeditorsdk/nexTranscode$Error;)Lcom/nexstreaming/nexeditorsdk/nexTranscode$Error;

    goto :goto_0

    :cond_2
    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;->TRANSCODING_BUSY:Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;->getValue()I

    move-result v0

    if-ne p2, v0, :cond_3

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexTranscode$1;->a:Lcom/nexstreaming/nexeditorsdk/nexTranscode;

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexTranscode$Error;->BUSY:Lcom/nexstreaming/nexeditorsdk/nexTranscode$Error;

    invoke-static {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexTranscode;->access$102(Lcom/nexstreaming/nexeditorsdk/nexTranscode;Lcom/nexstreaming/nexeditorsdk/nexTranscode$Error;)Lcom/nexstreaming/nexeditorsdk/nexTranscode$Error;

    goto :goto_0

    :cond_3
    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;->TRANSCODING_NOT_SUPPORTED_FORMAT:Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexEngine$nexErrorCode;->getValue()I

    move-result v0

    if-ne p2, v0, :cond_4

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexTranscode$1;->a:Lcom/nexstreaming/nexeditorsdk/nexTranscode;

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexTranscode$Error;->NOTSUPPORTEDFILE:Lcom/nexstreaming/nexeditorsdk/nexTranscode$Error;

    invoke-static {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexTranscode;->access$102(Lcom/nexstreaming/nexeditorsdk/nexTranscode;Lcom/nexstreaming/nexeditorsdk/nexTranscode$Error;)Lcom/nexstreaming/nexeditorsdk/nexTranscode$Error;

    goto :goto_0

    :cond_4
    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexTranscode$1;->a:Lcom/nexstreaming/nexeditorsdk/nexTranscode;

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexTranscode$Error;->RUNFAIL:Lcom/nexstreaming/nexeditorsdk/nexTranscode$Error;

    invoke-static {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexTranscode;->access$102(Lcom/nexstreaming/nexeditorsdk/nexTranscode;Lcom/nexstreaming/nexeditorsdk/nexTranscode$Error;)Lcom/nexstreaming/nexeditorsdk/nexTranscode$Error;

    :cond_5
    :goto_0
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexTranscode$1;->a:Lcom/nexstreaming/nexeditorsdk/nexTranscode;

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexTranscode;->access$400(Lcom/nexstreaming/nexeditorsdk/nexTranscode;)Lcom/nexstreaming/nexeditorsdk/nexTranscode$OnTransCoderListener;

    move-result-object p1

    if-eqz p1, :cond_6

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexTranscode$1;->a:Lcom/nexstreaming/nexeditorsdk/nexTranscode;

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexTranscode;->access$400(Lcom/nexstreaming/nexeditorsdk/nexTranscode;)Lcom/nexstreaming/nexeditorsdk/nexTranscode$OnTransCoderListener;

    move-result-object p1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexTranscode$1;->a:Lcom/nexstreaming/nexeditorsdk/nexTranscode;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexTranscode;->access$100(Lcom/nexstreaming/nexeditorsdk/nexTranscode;)Lcom/nexstreaming/nexeditorsdk/nexTranscode$Error;

    move-result-object v0

    invoke-virtual {p1, v0, p2}, Lcom/nexstreaming/nexeditorsdk/nexTranscode$OnTransCoderListener;->onTransCodeDone(Lcom/nexstreaming/nexeditorsdk/nexTranscode$Error;I)V

    :cond_6
    return-void
.end method

.method public onEncodingProgress(I)V
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexTranscode$1;->a:Lcom/nexstreaming/nexeditorsdk/nexTranscode;

    sget-object v1, Lcom/nexstreaming/nexeditorsdk/nexTranscode$State;->RUNNING:Lcom/nexstreaming/nexeditorsdk/nexTranscode$State;

    invoke-static {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexTranscode;->access$002(Lcom/nexstreaming/nexeditorsdk/nexTranscode;Lcom/nexstreaming/nexeditorsdk/nexTranscode$State;)Lcom/nexstreaming/nexeditorsdk/nexTranscode$State;

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexTranscode$1;->a:Lcom/nexstreaming/nexeditorsdk/nexTranscode;

    invoke-static {v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexTranscode;->access$502(Lcom/nexstreaming/nexeditorsdk/nexTranscode;I)I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexTranscode$1;->a:Lcom/nexstreaming/nexeditorsdk/nexTranscode;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexTranscode;->access$400(Lcom/nexstreaming/nexeditorsdk/nexTranscode;)Lcom/nexstreaming/nexeditorsdk/nexTranscode$OnTransCoderListener;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexTranscode$1;->a:Lcom/nexstreaming/nexeditorsdk/nexTranscode;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexTranscode;->access$400(Lcom/nexstreaming/nexeditorsdk/nexTranscode;)Lcom/nexstreaming/nexeditorsdk/nexTranscode$OnTransCoderListener;

    move-result-object v0

    const/16 v1, 0x64

    invoke-virtual {v0, p1, v1}, Lcom/nexstreaming/nexeditorsdk/nexTranscode$OnTransCoderListener;->onProgress(II)V

    :cond_0
    return-void
.end method

.method public onFastPreviewStartDone(III)V
    .locals 0

    return-void
.end method

.method public onFastPreviewStopDone(I)V
    .locals 0

    return-void
.end method

.method public onFastPreviewTimeDone(I)V
    .locals 0

    return-void
.end method

.method public onPlayEnd()V
    .locals 0

    return-void
.end method

.method public onPlayFail(II)V
    .locals 0

    return-void
.end method

.method public onPlayStart()V
    .locals 0

    return-void
.end method

.method public onPreviewPeakMeter(II)V
    .locals 0

    return-void
.end method

.method public onProgressThumbnailCaching(II)V
    .locals 0

    return-void
.end method

.method public onSeekStateChanged(Z)V
    .locals 0

    return-void
.end method

.method public onSetTimeDone(I)V
    .locals 0

    return-void
.end method

.method public onSetTimeFail(I)V
    .locals 0

    return-void
.end method

.method public onSetTimeIgnored()V
    .locals 0

    return-void
.end method

.method public onStateChange(II)V
    .locals 0

    return-void
.end method

.method public onTimeChange(I)V
    .locals 1

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexTranscode$1;->a:Lcom/nexstreaming/nexeditorsdk/nexTranscode;

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/nexTranscode$State;->RUNNING:Lcom/nexstreaming/nexeditorsdk/nexTranscode$State;

    invoke-static {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexTranscode;->access$002(Lcom/nexstreaming/nexeditorsdk/nexTranscode;Lcom/nexstreaming/nexeditorsdk/nexTranscode$State;)Lcom/nexstreaming/nexeditorsdk/nexTranscode$State;

    return-void
.end method
