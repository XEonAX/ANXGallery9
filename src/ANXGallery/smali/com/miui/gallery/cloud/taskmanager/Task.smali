.class public abstract Lcom/miui/gallery/cloud/taskmanager/Task;
.super Ljava/lang/Object;
.source "Task.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
        "TT;>;",
        "Ljava/lang/Comparable<",
        "Lcom/miui/gallery/cloud/taskmanager/Task;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract compareTo(Lcom/miui/gallery/cloud/taskmanager/Task;)I
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    check-cast p1, Lcom/miui/gallery/cloud/taskmanager/Task;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/cloud/taskmanager/Task;->compareTo(Lcom/miui/gallery/cloud/taskmanager/Task;)I

    move-result p1

    return p1
.end method
