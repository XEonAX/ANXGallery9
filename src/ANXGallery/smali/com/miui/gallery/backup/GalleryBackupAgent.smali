.class public Lcom/miui/gallery/backup/GalleryBackupAgent;
.super Landroid/app/backup/BackupAgent;
.source "GalleryBackupAgent.java"


# static fields
.field private static final GALLERY_BACKUP_DATA_VERSION:I = 0x1

.field private static final TAG:Ljava/lang/String; = "GalleryBackupAgent"


# instance fields
.field private mBackupAgentImpl:Landroid/app/backup/BackupAgent;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/backup/BackupAgent;-><init>()V

    return-void
.end method

.method private ensureBackupAgent()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupAgent;->mBackupAgentImpl:Landroid/app/backup/BackupAgent;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/backup/GalleryBackupAgent$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/backup/GalleryBackupAgent$1;-><init>(Lcom/miui/gallery/backup/GalleryBackupAgent;)V

    invoke-static {v0}, Lcom/miui/backup/BackupCompatHelper;->createBackupAgentImpl(Lcom/miui/backup/IBackupAgentDelegate;)Landroid/app/backup/BackupAgent;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupAgent;->mBackupAgentImpl:Landroid/app/backup/BackupAgent;

    :cond_0
    return-void
.end method


# virtual methods
.method protected attachBaseContext(Landroid/content/Context;)V
    .locals 7

    invoke-super {p0, p1}, Landroid/app/backup/BackupAgent;->attachBaseContext(Landroid/content/Context;)V

    invoke-direct {p0}, Lcom/miui/gallery/backup/GalleryBackupAgent;->ensureBackupAgent()V

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupAgent;->mBackupAgentImpl:Landroid/app/backup/BackupAgent;

    if-eqz v0, :cond_0

    :try_start_0
    const-class v0, Landroid/app/backup/BackupAgent;

    const-string v1, "attachBaseContext"

    sget-object v2, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Class;

    const-class v5, Landroid/content/Context;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    invoke-static {v0, v1, v2, v4}, Lmiui/reflect/Method;->of(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Class;[Ljava/lang/Class;)Lmiui/reflect/Method;

    move-result-object v0

    const-class v1, Landroid/app/backup/BackupAgent;

    iget-object v2, p0, Lcom/miui/gallery/backup/GalleryBackupAgent;->mBackupAgentImpl:Landroid/app/backup/BackupAgent;

    new-array v3, v3, [Ljava/lang/Object;

    aput-object p1, v3, v6

    invoke-virtual {v0, v1, v2, v3}, Lmiui/reflect/Method;->invoke(Ljava/lang/Class;Ljava/lang/Object;[Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "GalleryBackupAgent"

    invoke-static {v0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    :goto_0
    return-void
.end method

.method public onBackup(Landroid/os/ParcelFileDescriptor;Landroid/app/backup/BackupDataOutput;Landroid/os/ParcelFileDescriptor;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    return-void
.end method

.method public onCreate()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupAgent;->mBackupAgentImpl:Landroid/app/backup/BackupAgent;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupAgent;->mBackupAgentImpl:Landroid/app/backup/BackupAgent;

    invoke-virtual {v0}, Landroid/app/backup/BackupAgent;->onCreate()V

    :cond_0
    return-void
.end method

.method public final onFullBackup(Landroid/app/backup/FullBackupDataOutput;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupAgent;->mBackupAgentImpl:Landroid/app/backup/BackupAgent;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/backup/GalleryBackupAgent;->mBackupAgentImpl:Landroid/app/backup/BackupAgent;

    invoke-virtual {v0, p1}, Landroid/app/backup/BackupAgent;->onFullBackup(Landroid/app/backup/FullBackupDataOutput;)V

    :cond_0
    return-void
.end method

.method public onRestore(Landroid/app/backup/BackupDataInput;ILandroid/os/ParcelFileDescriptor;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    return-void
.end method

.method protected final onRestoreFile(Landroid/os/ParcelFileDescriptor;JILjava/lang/String;Ljava/lang/String;JJ)V
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object v0, p0

    iget-object v1, v0, Lcom/miui/gallery/backup/GalleryBackupAgent;->mBackupAgentImpl:Landroid/app/backup/BackupAgent;

    if-eqz v1, :cond_0

    iget-object v2, v0, Lcom/miui/gallery/backup/GalleryBackupAgent;->mBackupAgentImpl:Landroid/app/backup/BackupAgent;

    move-object v3, p1

    move-wide v4, p2

    move/from16 v6, p4

    move-object/from16 v7, p5

    move-object/from16 v8, p6

    move-wide/from16 v9, p7

    move-wide/from16 v11, p9

    invoke-static/range {v2 .. v12}, Lcom/miui/backup/BackupCompatHelper;->invokeOnRestoreFile(Landroid/app/backup/BackupAgent;Landroid/os/ParcelFileDescriptor;JILjava/lang/String;Ljava/lang/String;JJ)V

    :cond_0
    return-void
.end method
