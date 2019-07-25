.class public Lcom/miui/backup/MiuiBackupAgentImpl;
.super Lmiui/app/backup/FullBackupAgent;
.source "MiuiBackupAgentImpl.java"


# instance fields
.field private mDelegate:Lcom/miui/backup/IBackupAgentDelegate;


# direct methods
.method public constructor <init>(Lcom/miui/backup/IBackupAgentDelegate;)V
    .locals 0

    invoke-direct {p0}, Lmiui/app/backup/FullBackupAgent;-><init>()V

    iput-object p1, p0, Lcom/miui/backup/MiuiBackupAgentImpl;->mDelegate:Lcom/miui/backup/IBackupAgentDelegate;

    return-void
.end method


# virtual methods
.method protected attachBaseContext(Landroid/content/Context;)V
    .locals 1

    invoke-super {p0, p1}, Lmiui/app/backup/FullBackupAgent;->attachBaseContext(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/miui/backup/MiuiBackupAgentImpl;->mDelegate:Lcom/miui/backup/IBackupAgentDelegate;

    invoke-interface {v0, p1}, Lcom/miui/backup/IBackupAgentDelegate;->attachBaseContext(Landroid/content/Context;)V

    return-void
.end method

.method protected getVersion(I)I
    .locals 1

    iget-object v0, p0, Lcom/miui/backup/MiuiBackupAgentImpl;->mDelegate:Lcom/miui/backup/IBackupAgentDelegate;

    invoke-interface {v0, p1}, Lcom/miui/backup/IBackupAgentDelegate;->getVersion(I)I

    move-result p1

    return p1
.end method

.method protected onAttachRestore(Lmiui/app/backup/BackupMeta;Landroid/os/ParcelFileDescriptor;Ljava/lang/String;)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/backup/MiuiBackupAgentImpl;->mDelegate:Lcom/miui/backup/IBackupAgentDelegate;

    invoke-static {p1}, Lcom/miui/backup/BackupMetaUtils;->translate(Lmiui/app/backup/BackupMeta;)Lcom/miui/backup/BackupMeta;

    move-result-object p1

    invoke-interface {v0, p1, p2, p3}, Lcom/miui/backup/IBackupAgentDelegate;->onAttachRestore(Lcom/miui/backup/BackupMeta;Landroid/os/ParcelFileDescriptor;Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public onCreate()V
    .locals 1

    iget-object v0, p0, Lcom/miui/backup/MiuiBackupAgentImpl;->mDelegate:Lcom/miui/backup/IBackupAgentDelegate;

    invoke-interface {v0}, Lcom/miui/backup/IBackupAgentDelegate;->onCreate()V

    return-void
.end method

.method protected onDataRestore(Lmiui/app/backup/BackupMeta;Landroid/os/ParcelFileDescriptor;)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/backup/MiuiBackupAgentImpl;->mDelegate:Lcom/miui/backup/IBackupAgentDelegate;

    invoke-static {p1}, Lcom/miui/backup/BackupMetaUtils;->translate(Lmiui/app/backup/BackupMeta;)Lcom/miui/backup/BackupMeta;

    move-result-object p1

    invoke-interface {v0, p1, p2}, Lcom/miui/backup/IBackupAgentDelegate;->onDataRestore(Lcom/miui/backup/BackupMeta;Landroid/os/ParcelFileDescriptor;)I

    move-result p1

    return p1
.end method

.method public onDestroy()V
    .locals 1

    iget-object v0, p0, Lcom/miui/backup/MiuiBackupAgentImpl;->mDelegate:Lcom/miui/backup/IBackupAgentDelegate;

    invoke-interface {v0}, Lcom/miui/backup/IBackupAgentDelegate;->onDestroy()V

    return-void
.end method

.method protected onFullBackup(Landroid/os/ParcelFileDescriptor;I)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/backup/MiuiBackupAgentImpl;->mDelegate:Lcom/miui/backup/IBackupAgentDelegate;

    invoke-interface {v0, p1, p2}, Lcom/miui/backup/IBackupAgentDelegate;->onFullBackup(Landroid/os/ParcelFileDescriptor;I)I

    move-result p1

    return p1
.end method

.method protected onRestoreEnd(Lmiui/app/backup/BackupMeta;)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/backup/MiuiBackupAgentImpl;->mDelegate:Lcom/miui/backup/IBackupAgentDelegate;

    invoke-static {p1}, Lcom/miui/backup/BackupMetaUtils;->translate(Lmiui/app/backup/BackupMeta;)Lcom/miui/backup/BackupMeta;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/miui/backup/IBackupAgentDelegate;->onRestoreEnd(Lcom/miui/backup/BackupMeta;)I

    move-result p1

    return p1
.end method

.method protected tarAttaches(Ljava/lang/String;Landroid/app/backup/FullBackupDataOutput;I)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-super {p0, p1, p2, p3}, Lmiui/app/backup/FullBackupAgent;->tarAttaches(Ljava/lang/String;Landroid/app/backup/FullBackupDataOutput;I)I

    iget-object v0, p0, Lcom/miui/backup/MiuiBackupAgentImpl;->mDelegate:Lcom/miui/backup/IBackupAgentDelegate;

    invoke-interface {v0, p1, p2, p3}, Lcom/miui/backup/IBackupAgentDelegate;->tarAttaches(Ljava/lang/String;Landroid/app/backup/FullBackupDataOutput;I)I

    move-result p1

    return p1
.end method
