.class public Lcom/miui/gallery/settingsbackup/GallerySettingsBackupImpl;
.super Ljava/lang/Object;
.source "GallerySettingsBackupImpl.java"

# interfaces
.implements Lcom/xiaomi/settingsdk/backup/ICloudBackup;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static logJSON(Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 2

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    sget-boolean v0, Lcom/miui/os/Rom;->IS_ALPHA:Z

    if-nez v0, :cond_1

    sget-boolean v0, Lcom/miui/os/Rom;->IS_DEV:Z

    if-eqz v0, :cond_2

    :cond_1
    const-string v0, "GallerySettingsBackupImpl"

    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    return-object p0
.end method


# virtual methods
.method public getCurrentVersion(Landroid/content/Context;)I
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method public onBackupSettings(Landroid/content/Context;Lcom/xiaomi/settingsdk/backup/data/DataPackage;)V
    .locals 2

    const-string v0, "GallerySettingsBackupImpl"

    const-string v1, "onBackupSettings start"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "com.miui.gallery.settings"

    invoke-static {p1}, Lcom/miui/gallery/settingsbackup/GallerySettingsBackupHelper;->backupToCloud(Landroid/content/Context;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/settingsbackup/GallerySettingsBackupImpl;->logJSON(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {p2, v0, p1}, Lcom/xiaomi/settingsdk/backup/data/DataPackage;->addKeyJson(Ljava/lang/String;Lorg/json/JSONObject;)V

    const-string p1, "GallerySettingsBackupImpl"

    const-string p2, "onBackupSettings end"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onRestoreSettings(Landroid/content/Context;Lcom/xiaomi/settingsdk/backup/data/DataPackage;I)V
    .locals 1

    const-string p3, "GallerySettingsBackupImpl"

    const-string v0, "onRestoreSettings start"

    invoke-static {p3, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p2, :cond_0

    const-string p3, "com.miui.gallery.settings"

    invoke-virtual {p2, p3}, Lcom/xiaomi/settingsdk/backup/data/DataPackage;->get(Ljava/lang/String;)Lcom/xiaomi/settingsdk/backup/data/SettingItem;

    move-result-object p2

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Lcom/xiaomi/settingsdk/backup/data/SettingItem;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lorg/json/JSONObject;

    invoke-static {p2}, Lcom/miui/gallery/settingsbackup/GallerySettingsBackupImpl;->logJSON(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/miui/gallery/settingsbackup/GallerySettingsBackupHelper;->restoreFromCloud(Landroid/content/Context;Lorg/json/JSONObject;)V

    :cond_0
    const-string p1, "GallerySettingsBackupImpl"

    const-string p2, "onRestoreSettings end"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
