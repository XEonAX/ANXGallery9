.class Lcom/miui/gallery/backup/GalleryBackupAgent$1;
.super Ljava/lang/Object;
.source "GalleryBackupAgent.java"

# interfaces
.implements Lcom/miui/backup/IBackupAgentDelegate;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/backup/GalleryBackupAgent;->ensureBackupAgent()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field final synthetic this$0:Lcom/miui/gallery/backup/GalleryBackupAgent;


# direct methods
.method constructor <init>(Lcom/miui/gallery/backup/GalleryBackupAgent;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/backup/GalleryBackupAgent$1;->this$0:Lcom/miui/gallery/backup/GalleryBackupAgent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public attachBaseContext(Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/backup/GalleryBackupAgent$1;->mContext:Landroid/content/Context;

    return-void
.end method

.method public getVersion(I)I
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method public onAttachRestore(Lcom/miui/backup/BackupMeta;Landroid/os/ParcelFileDescriptor;Ljava/lang/String;)I
    .locals 0

    invoke-static {}, Lcom/miui/backup/BackupErrorCode;->ERR_NONE()I

    move-result p1

    return p1
.end method

.method public synthetic onCreate()V
    .locals 0

    invoke-static {p0}, Lcom/miui/backup/IBackupAgentDelegate$-CC;->$default$onCreate(Lcom/miui/backup/IBackupAgentDelegate;)V

    return-void
.end method

.method public onDataRestore(Lcom/miui/backup/BackupMeta;Landroid/os/ParcelFileDescriptor;)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance p1, Ljava/io/FileInputStream;

    invoke-virtual {p2}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/FileInputStream;-><init>(Ljava/io/FileDescriptor;)V

    const/4 p2, 0x0

    :try_start_0
    invoke-static {p1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->parseFrom(Ljava/io/InputStream;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/backup/GalleryBackupHelper;->restore(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {p1}, Ljava/io/FileInputStream;->close()V

    invoke-static {}, Lcom/miui/backup/BackupErrorCode;->ERR_NONE()I

    move-result p1

    return p1

    :catchall_0
    move-exception v0

    goto :goto_0

    :catch_0
    move-exception p2

    :try_start_1
    throw p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    if-eqz p2, :cond_0

    :try_start_2
    invoke-virtual {p1}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    :catch_1
    move-exception p1

    invoke-virtual {p2, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_1

    :cond_0
    invoke-virtual {p1}, Ljava/io/FileInputStream;->close()V

    :goto_1
    throw v0
.end method

.method public synthetic onDestroy()V
    .locals 0

    invoke-static {p0}, Lcom/miui/backup/IBackupAgentDelegate$-CC;->$default$onDestroy(Lcom/miui/backup/IBackupAgentDelegate;)V

    return-void
.end method

.method public onFullBackup(Landroid/os/ParcelFileDescriptor;I)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance p2, Ljava/io/FileOutputStream;

    invoke-virtual {p1}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/FileDescriptor;)V

    const/4 p1, 0x0

    :try_start_0
    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupHelper;->backup()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->writeTo(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V

    invoke-static {}, Lcom/miui/backup/BackupErrorCode;->ERR_NONE()I

    move-result p1

    return p1

    :catchall_0
    move-exception v0

    goto :goto_0

    :catch_0
    move-exception p1

    :try_start_1
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    if-eqz p1, :cond_0

    :try_start_2
    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    :catch_1
    move-exception p2

    invoke-virtual {p1, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_1

    :cond_0
    invoke-virtual {p2}, Ljava/io/OutputStream;->close()V

    :goto_1
    throw v0
.end method

.method public onRestoreEnd(Lcom/miui/backup/BackupMeta;)I
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/backup/GalleryBackupAgent$1;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/miui/backup/BackupCompatHelper;->setIsNeedBeKilled(Landroid/content/Context;)V

    invoke-static {}, Lcom/miui/backup/BackupErrorCode;->ERR_NONE()I

    move-result p1

    return p1
.end method

.method public tarAttaches(Ljava/lang/String;Landroid/app/backup/FullBackupDataOutput;I)I
    .locals 0

    invoke-static {}, Lcom/miui/backup/BackupErrorCode;->ERR_NONE()I

    move-result p1

    return p1
.end method
