.class public Lcom/nexstreaming/app/common/task/Task$TaskErrorException;
.super Ljava/lang/Exception;
.source "Task.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nexstreaming/app/common/task/Task;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TaskErrorException"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final taskError:Lcom/nexstreaming/app/common/task/Task$TaskError;


# direct methods
.method public constructor <init>(Lcom/nexstreaming/app/common/task/Task$TaskError;)V
    .locals 1

    invoke-interface {p1}, Lcom/nexstreaming/app/common/task/Task$TaskError;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/nexstreaming/app/common/task/Task$TaskErrorException;->taskError:Lcom/nexstreaming/app/common/task/Task$TaskError;

    return-void
.end method

.method public constructor <init>(Lcom/nexstreaming/app/common/task/Task$TaskError;Ljava/lang/Throwable;)V
    .locals 1

    invoke-interface {p1}, Lcom/nexstreaming/app/common/task/Task$TaskError;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    iput-object p1, p0, Lcom/nexstreaming/app/common/task/Task$TaskErrorException;->taskError:Lcom/nexstreaming/app/common/task/Task$TaskError;

    return-void
.end method


# virtual methods
.method public getTaskError()Lcom/nexstreaming/app/common/task/Task$TaskError;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/app/common/task/Task$TaskErrorException;->taskError:Lcom/nexstreaming/app/common/task/Task$TaskError;

    return-object v0
.end method
