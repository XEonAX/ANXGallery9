.class public interface abstract Lcom/miui/backup/IBackupAgentDelegate;
.super Ljava/lang/Object;
.source "IBackupAgentDelegate.java"


# virtual methods
.method public abstract attachBaseContext(Landroid/content/Context;)V
.end method

.method public abstract getVersion(I)I
.end method

.method public abstract onAttachRestore(Lcom/miui/backup/BackupMeta;Landroid/os/ParcelFileDescriptor;Ljava/lang/String;)I
.end method

.method public abstract onCreate()V
.end method

.method public abstract onDataRestore(Lcom/miui/backup/BackupMeta;Landroid/os/ParcelFileDescriptor;)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract onDestroy()V
.end method

.method public abstract onFullBackup(Landroid/os/ParcelFileDescriptor;I)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract onRestoreEnd(Lcom/miui/backup/BackupMeta;)I
.end method

.method public abstract tarAttaches(Ljava/lang/String;Landroid/app/backup/FullBackupDataOutput;I)I
.end method
