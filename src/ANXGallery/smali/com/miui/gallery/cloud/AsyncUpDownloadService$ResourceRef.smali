.class abstract Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;
.super Ljava/lang/Object;
.source "AsyncUpDownloadService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cloud/AsyncUpDownloadService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "ResourceRef"
.end annotation


# instance fields
.field protected final mOwners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected final mTag:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;->mOwners:Ljava/util/List;

    iput-object p1, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;->mTag:Ljava/lang/String;

    return-void
.end method

.method private dump()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;->mTag:Ljava/lang/String;

    const-string v1, "size=%d"

    iget-object v2, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;->mOwners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;->mOwners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;->mTag:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "name="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public acquire(Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;->mOwners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;->mTag:Ljava/lang/String;

    const-string v1, "onAcquire"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;->onAcquire()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;->mTag:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "add owner: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;->mOwners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method protected abstract onAcquire()V
.end method

.method protected abstract onRelease()V
.end method

.method public release(Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;->mOwners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;->mTag:Ljava/lang/String;

    const-string v1, "remove owner success: %s, left owners: %s"

    iget-object v2, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;->mOwners:Ljava/util/List;

    invoke-static {v0, v1, p1, v2}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;->mOwners:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;->mTag:Ljava/lang/String;

    const-string v0, "onRelease"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;->onRelease()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;->mTag:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "remove owner failed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public releaseAll()V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;->dump()V

    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;->mOwners:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;->mOwners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;->mTag:Ljava/lang/String;

    const-string v1, "onRelease"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;->onRelease()V

    :cond_0
    return-void
.end method
