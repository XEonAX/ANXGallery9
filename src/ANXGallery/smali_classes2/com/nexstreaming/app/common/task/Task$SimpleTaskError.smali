.class public Lcom/nexstreaming/app/common/task/Task$SimpleTaskError;
.super Ljava/lang/Object;
.source "Task.java"

# interfaces
.implements Lcom/nexstreaming/app/common/task/Task$TaskError;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nexstreaming/app/common/task/Task;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SimpleTaskError"
.end annotation


# instance fields
.field private final mException:Ljava/lang/Exception;

.field private final mMessage:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/Exception;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/nexstreaming/app/common/task/Task$SimpleTaskError;->mException:Ljava/lang/Exception;

    iput-object p2, p0, Lcom/nexstreaming/app/common/task/Task$SimpleTaskError;->mMessage:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getException()Ljava/lang/Exception;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/app/common/task/Task$SimpleTaskError;->mException:Ljava/lang/Exception;

    return-object v0
.end method

.method public getLocalizedMessage(Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    iget-object p1, p0, Lcom/nexstreaming/app/common/task/Task$SimpleTaskError;->mMessage:Ljava/lang/String;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/nexstreaming/app/common/task/Task$SimpleTaskError;->mMessage:Ljava/lang/String;

    return-object p1

    :cond_0
    iget-object p1, p0, Lcom/nexstreaming/app/common/task/Task$SimpleTaskError;->mException:Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/nexstreaming/app/common/task/Task$SimpleTaskError;->mException:Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_1
    iget-object p1, p0, Lcom/nexstreaming/app/common/task/Task$SimpleTaskError;->mException:Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/nexstreaming/app/common/task/Task$SimpleTaskError;->mException:Ljava/lang/Exception;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_2
    const-string p1, "Unknown"

    return-object p1
.end method

.method public getMessage()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/app/common/task/Task$SimpleTaskError;->mMessage:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/app/common/task/Task$SimpleTaskError;->mMessage:Ljava/lang/String;

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/app/common/task/Task$SimpleTaskError;->mException:Ljava/lang/Exception;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/app/common/task/Task$SimpleTaskError;->mException:Ljava/lang/Exception;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1
    const-string v0, "Unknown"

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Lcom/nexstreaming/app/common/task/Task$SimpleTaskError;->getException()Ljava/lang/Exception;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<SimpleTaskError: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/nexstreaming/app/common/task/Task$SimpleTaskError;->getException()Ljava/lang/Exception;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<SimpleTaskError: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/nexstreaming/app/common/task/Task$SimpleTaskError;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ">"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
