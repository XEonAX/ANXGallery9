.class final Lcom/nexstreaming/app/common/task/Task$11;
.super Ljava/lang/Object;
.source "Task.java"

# interfaces
.implements Lcom/nexstreaming/app/common/task/Task$OnProgressListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nexstreaming/app/common/task/Task;->combinedTask(Ljava/util/Collection;)Lcom/nexstreaming/app/common/task/Task;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/util/List;

.field final synthetic b:Lcom/nexstreaming/app/common/task/Task;


# direct methods
.method constructor <init>(Ljava/util/List;Lcom/nexstreaming/app/common/task/Task;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/app/common/task/Task$11;->a:Ljava/util/List;

    iput-object p2, p0, Lcom/nexstreaming/app/common/task/Task$11;->b:Lcom/nexstreaming/app/common/task/Task;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgress(Lcom/nexstreaming/app/common/task/Task;Lcom/nexstreaming/app/common/task/Task$Event;II)V
    .locals 2

    iget-object p1, p0, Lcom/nexstreaming/app/common/task/Task$11;->a:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 p2, 0x0

    const/4 p3, 0x0

    const/4 p4, 0x0

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nexstreaming/app/common/task/Task;

    invoke-virtual {v0}, Lcom/nexstreaming/app/common/task/Task;->isProgressAvailable()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {v0}, Lcom/nexstreaming/app/common/task/Task;->getProgress()I

    move-result v1

    add-int/2addr p3, v1

    invoke-virtual {v0}, Lcom/nexstreaming/app/common/task/Task;->getMaxProgress()I

    move-result v0

    add-int/2addr p4, v0

    goto :goto_0

    :cond_1
    const/4 p2, 0x1

    :goto_1
    if-eqz p2, :cond_2

    iget-object p1, p0, Lcom/nexstreaming/app/common/task/Task$11;->b:Lcom/nexstreaming/app/common/task/Task;

    invoke-virtual {p1, p3, p4}, Lcom/nexstreaming/app/common/task/Task;->setProgress(II)V

    :cond_2
    return-void
.end method
