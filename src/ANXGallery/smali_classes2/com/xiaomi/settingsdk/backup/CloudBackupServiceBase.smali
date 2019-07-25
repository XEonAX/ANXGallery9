.class public abstract Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase;
.super Landroid/app/IntentService;
.source "CloudBackupServiceBase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase$SettingsIntentRunner;
    }
.end annotation


# static fields
.field private static final sSettingsExecutor:Ljava/util/concurrent/ExecutorService;


# instance fields
.field private final mBackupRestoreSettingsBinder:Lcom/xiaomi/settingsdk/backup/IBackupRestoreSettings$Stub;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase;->sSettingsExecutor:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const-string v0, "SettingsBackup"

    invoke-direct {p0, v0}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    new-instance v0, Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase$1;

    invoke-direct {v0, p0}, Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase$1;-><init>(Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase;)V

    iput-object v0, p0, Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase;->mBackupRestoreSettingsBinder:Lcom/xiaomi/settingsdk/backup/IBackupRestoreSettings$Stub;

    return-void
.end method

.method static synthetic access$000(Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase;Landroid/content/Intent;Ljava/lang/Integer;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase;->handleIntent(Landroid/content/Intent;Ljava/lang/Integer;)V

    return-void
.end method

.method static synthetic access$100()Ljava/util/concurrent/ExecutorService;
    .locals 1

    sget-object v0, Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase;->sSettingsExecutor:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method private backupSettings()Landroid/os/Bundle;
    .locals 4

    const-string v0, "SettingsBackup"

    const-string v1, "SettingsBackupServiceBase:backupSettings"

    invoke-direct {p0, v1}, Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase;->prependPackageName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0}, Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase;->checkAndGetBackuper()Lcom/xiaomi/settingsdk/backup/ICloudBackup;

    move-result-object v0

    new-instance v1, Lcom/xiaomi/settingsdk/backup/data/DataPackage;

    invoke-direct {v1}, Lcom/xiaomi/settingsdk/backup/data/DataPackage;-><init>()V

    invoke-virtual {p0}, Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-interface {v0, v2, v1}, Lcom/xiaomi/settingsdk/backup/ICloudBackup;->onBackupSettings(Landroid/content/Context;Lcom/xiaomi/settingsdk/backup/data/DataPackage;)V

    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {v1, v2}, Lcom/xiaomi/settingsdk/backup/data/DataPackage;->appendToWrappedBundle(Landroid/os/Bundle;)V

    const-string v1, "version"

    invoke-virtual {p0}, Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/xiaomi/settingsdk/backup/ICloudBackup;->getCurrentVersion(Landroid/content/Context;)I

    move-result v0

    invoke-virtual {v2, v1, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    return-object v2
.end method

.method private checkAndGetBackuper()Lcom/xiaomi/settingsdk/backup/ICloudBackup;
    .locals 2

    invoke-virtual {p0}, Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase;->getBackupImpl()Lcom/xiaomi/settingsdk/backup/ICloudBackup;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "backuper must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private handleIntent(Landroid/content/Intent;Ljava/lang/Integer;)V
    .locals 6

    if-nez p1, :cond_1

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase;->stopSelf(I)V

    :cond_0
    return-void

    :cond_1
    const-string v0, "SettingsBackup"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "myPid: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase;->prependPackageName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "SettingsBackup"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "intent: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase;->prependPackageName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "SettingsBackup"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "extras: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase;->prependPackageName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "result_receiver"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/os/ResultReceiver;

    const-string v2, "miui.action.CLOUD_BACKUP_SETTINGS"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_3

    if-eqz v1, :cond_5

    invoke-direct {p0}, Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase;->backupSettings()Landroid/os/Bundle;

    move-result-object p1

    if-nez p1, :cond_2

    const-string v0, "SettingsBackup"

    const-string v2, "bundle result is null after backupSettings"

    invoke-direct {p0, v2}, Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase;->prependPackageName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    invoke-virtual {v1, v3, p1}, Landroid/os/ResultReceiver;->send(ILandroid/os/Bundle;)V

    goto/16 :goto_4

    :cond_3
    const-string v2, "miui.action.CLOUD_RESTORE_SETTINGS"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    if-eqz v1, :cond_5

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    const-string v2, "data_package"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getBinder(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v2

    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v4

    const/4 v5, 0x2

    :try_start_0
    invoke-interface {v0, v5, v2, v4, v3}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    const-string v0, "version"

    const/4 v5, -0x1

    invoke-virtual {p1, v0, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {v4, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/xiaomi/settingsdk/backup/data/DataPackage;

    invoke-direct {p0, v0, p1}, Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase;->restoreSettings(Lcom/xiaomi/settingsdk/backup/data/DataPackage;I)Z

    move-result p1
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Landroid/os/BadParcelableException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {v2}, Landroid/os/Parcel;->recycle()V

    invoke-virtual {v4}, Landroid/os/Parcel;->recycle()V

    goto :goto_1

    :catchall_0
    move-exception p1

    goto :goto_3

    :catch_0
    :try_start_1
    const-string p1, "SettingsBackup"

    const-string v0, "ClassCastException when cast DataPackage"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :catch_1
    move-exception p1

    const-string v0, "SettingsBackup"

    const-string v5, "BadParcelableException when read readParcelable"

    invoke-static {v0, v5, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    :catch_2
    move-exception p1

    const-string v0, "SettingsBackup"

    const-string v5, "RemoteException in onHandleIntent()"

    invoke-static {v0, v5, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    invoke-virtual {v2}, Landroid/os/Parcel;->recycle()V

    invoke-virtual {v4}, Landroid/os/Parcel;->recycle()V

    const/4 p1, 0x0

    :goto_1
    if-eqz p1, :cond_4

    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {v1, v3, p1}, Landroid/os/ResultReceiver;->send(ILandroid/os/Bundle;)V

    goto :goto_2

    :cond_4
    const/4 p1, 0x1

    const/4 v0, 0x0

    invoke-virtual {v1, p1, v0}, Landroid/os/ResultReceiver;->send(ILandroid/os/Bundle;)V

    :goto_2
    const-string p1, "SettingsBackup"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "r.send()"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase;->prependPackageName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4

    :goto_3
    invoke-virtual {v2}, Landroid/os/Parcel;->recycle()V

    invoke-virtual {v4}, Landroid/os/Parcel;->recycle()V

    throw p1

    :cond_5
    :goto_4
    if-eqz p2, :cond_6

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase;->stopSelf(I)V

    :cond_6
    return-void
.end method

.method private prependPackageName(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private restoreSettings(Lcom/xiaomi/settingsdk/backup/data/DataPackage;I)Z
    .locals 3

    const-string v0, "SettingsBackup"

    const-string v1, "SettingsBackupServiceBase:restoreSettings"

    invoke-direct {p0, v1}, Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase;->prependPackageName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0}, Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase;->checkAndGetBackuper()Lcom/xiaomi/settingsdk/backup/ICloudBackup;

    move-result-object v0

    invoke-virtual {p0}, Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/xiaomi/settingsdk/backup/ICloudBackup;->getCurrentVersion(Landroid/content/Context;)I

    move-result v1

    if-le p2, v1, :cond_0

    const-string p1, "SettingsBackup"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "drop restore data because dataVersion is higher than currentAppVersion, dataVersion: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, ", currentAppVersion: "

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-virtual {p0}, Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-interface {v0, v1, p1, p2}, Lcom/xiaomi/settingsdk/backup/ICloudBackup;->onRestoreSettings(Landroid/content/Context;Lcom/xiaomi/settingsdk/backup/data/DataPackage;I)V

    const/4 p1, 0x1

    return p1
.end method


# virtual methods
.method protected abstract getBackupImpl()Lcom/xiaomi/settingsdk/backup/ICloudBackup;
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 0

    iget-object p1, p0, Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase;->mBackupRestoreSettingsBinder:Lcom/xiaomi/settingsdk/backup/IBackupRestoreSettings$Stub;

    return-object p1
.end method

.method protected onHandleIntent(Landroid/content/Intent;)V
    .locals 3

    const-string v0, "SettingsBackup"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "@Deprecated :: onHandleIntent("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 1

    sget-object p2, Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase;->sSettingsExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase$SettingsIntentRunner;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-direct {v0, p0, p1, p3}, Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase$SettingsIntentRunner;-><init>(Lcom/xiaomi/settingsdk/backup/CloudBackupServiceBase;Landroid/content/Intent;Ljava/lang/Integer;)V

    invoke-interface {p2, v0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    const/4 p1, 0x2

    return p1
.end method
