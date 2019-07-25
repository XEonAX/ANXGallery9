.class Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$10;
.super Ljava/lang/Object;
.source "NexEditor.java"

# interfaces
.implements Lcom/nexstreaming/app/common/task/ResultTask$OnResultAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Landroid/content/Context;)Lcom/nexstreaming/app/common/task/Task;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/nexstreaming/app/common/task/ResultTask$OnResultAvailableListener<",
        "Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/ColorFormatChecker$ColorFormat;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;


# direct methods
.method constructor <init>(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$10;->a:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lcom/nexstreaming/app/common/task/ResultTask;Lcom/nexstreaming/app/common/task/Task$Event;Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/ColorFormatChecker$ColorFormat;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/nexstreaming/app/common/task/ResultTask<",
            "Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/ColorFormatChecker$ColorFormat;",
            ">;",
            "Lcom/nexstreaming/app/common/task/Task$Event;",
            "Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/ColorFormatChecker$ColorFormat;",
            ")V"
        }
    .end annotation

    iget-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$10;->a:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-static {p1, p3}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/ColorFormatChecker$ColorFormat;)Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/ColorFormatChecker$ColorFormat;

    sget-object p1, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/ColorFormatChecker$ColorFormat;->UNKNOWN:Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/ColorFormatChecker$ColorFormat;

    const/4 p2, 0x0

    const/4 v0, 0x1

    if-eq p3, p1, :cond_0

    const-string p1, "NexEditor.java"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Setting color format: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/ColorFormatChecker$ColorFormat;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$10;->a:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    const-string v1, "setExportColorFormat"

    invoke-virtual {p3}, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/ColorFormatChecker$ColorFormat;->name()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, v1, p3}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->setProperty(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$10;->a:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-static {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;)Lcom/nexstreaming/app/common/task/Task;

    move-result-object p1

    new-array p3, v0, [Lcom/nexstreaming/app/common/task/Task$Event;

    sget-object v0, Lcom/nexstreaming/app/common/task/Task$Event;->COMPLETE:Lcom/nexstreaming/app/common/task/Task$Event;

    aput-object v0, p3, p2

    invoke-virtual {p1, p3}, Lcom/nexstreaming/app/common/task/Task;->signalEvent([Lcom/nexstreaming/app/common/task/Task$Event;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$10;->a:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-static {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;)Lcom/nexstreaming/app/common/task/Task;

    move-result-object p1

    new-array p3, v0, [Lcom/nexstreaming/app/common/task/Task$Event;

    sget-object v0, Lcom/nexstreaming/app/common/task/Task$Event;->FAIL:Lcom/nexstreaming/app/common/task/Task$Event;

    aput-object v0, p3, p2

    invoke-virtual {p1, p3}, Lcom/nexstreaming/app/common/task/Task;->signalEvent([Lcom/nexstreaming/app/common/task/Task$Event;)V

    :goto_0
    return-void
.end method

.method public synthetic onResultAvailable(Lcom/nexstreaming/app/common/task/ResultTask;Lcom/nexstreaming/app/common/task/Task$Event;Ljava/lang/Object;)V
    .locals 0

    check-cast p3, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/ColorFormatChecker$ColorFormat;

    invoke-virtual {p0, p1, p2, p3}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$10;->a(Lcom/nexstreaming/app/common/task/ResultTask;Lcom/nexstreaming/app/common/task/Task$Event;Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/ColorFormatChecker$ColorFormat;)V

    return-void
.end method
