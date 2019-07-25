.class public Lcom/android/internal/storage/StorageInfo;
.super Ljava/lang/Object;
.source "StorageInfo.java"


# instance fields
.field private isMounted:Z

.field private isPrimary:Z

.field private isSd:Z

.field private isUsb:Z

.field private isVisible:Z

.field private isXspace:Z

.field private mDescription:Ljava/lang/String;

.field private mPath:Ljava/lang/String;

.field private mWrapped:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/internal/storage/StorageInfo;->mPath:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public createAccessIntent(Landroid/content/Context;)Landroid/content/Intent;
    .locals 4
    .annotation build Landroid/annotation/TargetApi;
        value = 0x18
    .end annotation

    iget-object v0, p0, Lcom/android/internal/storage/StorageInfo;->mWrapped:Ljava/lang/Object;

    instance-of v0, v0, Landroid/os/storage/VolumeInfo;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/storage/StorageInfo;->mWrapped:Ljava/lang/Object;

    check-cast v0, Landroid/os/storage/VolumeInfo;

    invoke-virtual {p1}, Landroid/content/Context;->getUserId()I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v0, p1, v2, v3}, Landroid/os/storage/VolumeInfo;->buildStorageVolume(Landroid/content/Context;IZ)Landroid/os/storage/StorageVolume;

    move-result-object p1

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/android/internal/storage/StorageInfo;->mWrapped:Ljava/lang/Object;

    instance-of p1, p1, Landroid/os/storage/StorageVolume;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/android/internal/storage/StorageInfo;->mWrapped:Ljava/lang/Object;

    check-cast p1, Landroid/os/storage/StorageVolume;

    goto :goto_0

    :cond_1
    move-object p1, v1

    :goto_0
    if-eqz p1, :cond_2

    invoke-virtual {p1, v1}, Landroid/os/storage/StorageVolume;->createAccessIntent(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    :cond_2
    return-object v1
.end method

.method public getDescription()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/android/internal/storage/StorageInfo;->mDescription:Ljava/lang/String;

    if-nez v0, :cond_0

    const-string v0, ""

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/android/internal/storage/StorageInfo;->mDescription:Ljava/lang/String;

    :goto_0
    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/android/internal/storage/StorageInfo;->mPath:Ljava/lang/String;

    return-object v0
.end method

.method public isMounted()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/internal/storage/StorageInfo;->isMounted:Z

    return v0
.end method

.method public isPrimary()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/internal/storage/StorageInfo;->isPrimary:Z

    return v0
.end method

.method public isSd()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/internal/storage/StorageInfo;->isSd:Z

    return v0
.end method

.method public isUsb()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/internal/storage/StorageInfo;->isUsb:Z

    return v0
.end method

.method public isXspace()Z
    .locals 1

    iget-boolean v0, p0, Lcom/android/internal/storage/StorageInfo;->isXspace:Z

    return v0
.end method

.method public setDescription(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/android/internal/storage/StorageInfo;->mDescription:Ljava/lang/String;

    return-void
.end method

.method public setMounted(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/internal/storage/StorageInfo;->isMounted:Z

    return-void
.end method

.method setPath(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/android/internal/storage/StorageInfo;->mPath:Ljava/lang/String;

    return-void
.end method

.method setPrimary(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/internal/storage/StorageInfo;->isPrimary:Z

    return-void
.end method

.method setSd(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/internal/storage/StorageInfo;->isSd:Z

    return-void
.end method

.method setUsb(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/internal/storage/StorageInfo;->isUsb:Z

    return-void
.end method

.method setVisible(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/internal/storage/StorageInfo;->isVisible:Z

    return-void
.end method

.method setWrapped(Ljava/lang/Object;)V
    .locals 0

    iput-object p1, p0, Lcom/android/internal/storage/StorageInfo;->mWrapped:Ljava/lang/Object;

    return-void
.end method

.method public setXspace(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/android/internal/storage/StorageInfo;->isXspace:Z

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Storage{ "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "mPath="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/android/internal/storage/StorageInfo;->mPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "mDescription="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/android/internal/storage/StorageInfo;->mDescription:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "isMounted="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/android/internal/storage/StorageInfo;->isMounted:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "isPrimary="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/android/internal/storage/StorageInfo;->isPrimary:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "isSD="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/android/internal/storage/StorageInfo;->isSd:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "isUsb="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/android/internal/storage/StorageInfo;->isUsb:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "isXspace="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/android/internal/storage/StorageInfo;->isXspace:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, " }"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
