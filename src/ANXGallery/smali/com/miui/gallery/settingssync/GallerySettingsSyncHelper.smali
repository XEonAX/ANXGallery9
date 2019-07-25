.class public Lcom/miui/gallery/settingssync/GallerySettingsSyncHelper;
.super Ljava/lang/Object;
.source "GallerySettingsSyncHelper.java"


# direct methods
.method public static doSync(Landroid/content/Context;)V
    .locals 1

    invoke-static {}, Lcom/miui/gallery/settingssync/GallerySettingsSyncHelper;->getRepository()Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$Repository;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/settingssync/GallerySettingsSyncHelper;->getModel(Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$Repository;)Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$Model;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/miui/gallery/settingssync/GallerySettingsSyncHelper;->getSyncAdapter(Landroid/content/Context;Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$Model;)Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$SyncAdapter;

    move-result-object p0

    const/4 v0, 0x0

    invoke-interface {p0, v0}, Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$SyncAdapter;->performSync(Landroid/os/Bundle;)V

    return-void
.end method

.method public static getModel(Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$Repository;)Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$Model;
    .locals 1

    new-instance v0, Lcom/miui/gallery/settingssync/GallerySettingSyncModel;

    invoke-direct {v0, p0}, Lcom/miui/gallery/settingssync/GallerySettingSyncModel;-><init>(Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$Repository;)V

    return-object v0
.end method

.method public static getRepository()Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$Repository;
    .locals 1

    new-instance v0, Lcom/miui/gallery/settingssync/GallerySyncableSettingsRepository;

    invoke-direct {v0}, Lcom/miui/gallery/settingssync/GallerySyncableSettingsRepository;-><init>()V

    return-object v0
.end method

.method public static getSyncAdapter(Landroid/content/Context;Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$Model;)Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$SyncAdapter;
    .locals 1

    new-instance v0, Lcom/miui/gallery/settingssync/GallerySettingsSyncAdapter;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/settingssync/GallerySettingsSyncAdapter;-><init>(Landroid/content/Context;Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$Model;)V

    return-object v0
.end method
