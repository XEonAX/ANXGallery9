.class public Lcom/miui/gallery/settingssync/GallerySettingSyncModel;
.super Ljava/lang/Object;
.source "GallerySettingSyncModel.java"

# interfaces
.implements Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$Model;


# instance fields
.field private final mRepository:Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$Repository;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$Repository;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/settingssync/GallerySettingSyncModel;->mRepository:Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$Repository;

    return-void
.end method

.method private convertSettingToJSON(Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$SyncableSetting;)Lorg/json/JSONObject;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    invoke-interface {p1}, Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$SyncableSetting;->isEnabled()Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {p1}, Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$SyncableSetting;->getValue()Ljava/lang/String;

    move-result-object v1

    if-nez v0, :cond_0

    if-nez v1, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "name"

    invoke-interface {p1}, Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$SyncableSetting;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    if-eqz v0, :cond_1

    const-string p1, "enable"

    invoke-virtual {v2, p1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_1
    if-eqz v1, :cond_2

    const-string p1, "value"

    invoke-virtual {v2, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_2
    return-object v2
.end method

.method private findSettingByName(Ljava/util/List;Ljava/lang/String;)Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$SyncableSetting;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$SyncableSetting;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$SyncableSetting;"
        }
    .end annotation

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$SyncableSetting;

    invoke-interface {v0}, Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$SyncableSetting;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method private saveJSONToSetting(Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$SyncableSetting;Lorg/json/JSONObject;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-string v0, "enable"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const-string v0, "enable"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0

    :cond_0
    move-object v0, v1

    :goto_0
    const-string v2, "value"

    invoke-virtual {p2, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string v1, "value"

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :cond_1
    invoke-interface {p1, v0, v1}, Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$SyncableSetting;->writeValue(Ljava/lang/Boolean;Ljava/lang/Object;)V

    return-void
.end method

.method private saveJSONToSettings(Ljava/util/List;Lorg/json/JSONArray;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$SyncableSetting;",
            ">;",
            "Lorg/json/JSONArray;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    if-eqz p2, :cond_3

    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-gtz v0, :cond_0

    goto :goto_1

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v0, v1, :cond_2

    invoke-virtual {p2, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "name"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    invoke-direct {p0, p1, v2}, Lcom/miui/gallery/settingssync/GallerySettingSyncModel;->findSettingByName(Ljava/util/List;Ljava/lang/String;)Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$SyncableSetting;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-direct {p0, v2, v1}, Lcom/miui/gallery/settingssync/GallerySettingSyncModel;->saveJSONToSetting(Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$SyncableSetting;Lorg/json/JSONObject;)V

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return-void

    :cond_3
    :goto_1
    return-void
.end method


# virtual methods
.method public getUploadSettings()Lorg/json/JSONObject;
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/settingssync/GallerySettingSyncModel;->mRepository:Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$Repository;

    invoke-interface {v0}, Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$Repository;->getSyncableSettings()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    const-string v0, "GallerySettingSyncModel"

    const-string v1, "No syncable settings found!"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-object v2

    :cond_0
    :try_start_0
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    move-object v1, v2

    move-object v3, v1

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$SyncableSetting;

    invoke-direct {p0, v4}, Lcom/miui/gallery/settingssync/GallerySettingSyncModel;->convertSettingToJSON(Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$SyncableSetting;)Lorg/json/JSONObject;

    move-result-object v5

    if-nez v5, :cond_1

    goto :goto_0

    :cond_1
    invoke-interface {v4}, Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$SyncableSetting;->isExport()Z

    move-result v4

    if-eqz v4, :cond_3

    if-nez v1, :cond_2

    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    :cond_2
    invoke-virtual {v1, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    :cond_3
    if-nez v3, :cond_4

    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    :cond_4
    invoke-virtual {v3, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    :cond_5
    if-nez v1, :cond_6

    if-nez v3, :cond_6

    return-object v2

    :cond_6
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    if-eqz v1, :cond_7

    const-string v4, "itemList"

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_7
    if-eqz v3, :cond_8

    const-string v1, "extraConfig"

    invoke-virtual {v0, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_8
    return-object v0

    :catch_0
    move-exception v0

    const-string v1, "GallerySettingSyncModel"

    const-string v3, "Failed form settings to JSONObject, %s"

    invoke-static {v1, v3, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v2
.end method

.method public isDirty()Z
    .locals 1

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$SettingsSync;->isDirty()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$SettingsSync;->isFirstUploadComplete()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public markDirty(Z)V
    .locals 1

    invoke-static {p1}, Lcom/miui/gallery/preference/GalleryPreferences$SettingsSync;->markDirty(Z)V

    if-nez p1, :cond_0

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$SettingsSync;->isFirstUploadComplete()Z

    move-result p1

    if-nez p1, :cond_0

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$SettingsSync;->setFirstUploadComplete()V

    const-string p1, "GallerySettingSyncModel"

    const-string v0, "First setting upload complete"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onDownloadSettings(Lorg/json/JSONObject;)Z
    .locals 4

    const/4 v0, 0x1

    if-nez p1, :cond_0

    const-string p1, "GallerySettingSyncModel"

    const-string v1, "No download settings received!"

    invoke-static {p1, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return v0

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/settingssync/GallerySettingSyncModel;->mRepository:Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$Repository;

    invoke-interface {v1}, Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$Repository;->getSyncableSettings()Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string p1, "GallerySettingSyncModel"

    const-string v1, "No syncable settings found!"

    invoke-static {p1, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v0

    :cond_1
    :try_start_0
    const-string v2, "itemList"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    const-string v3, "extraConfig"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    invoke-direct {p0, v1, v2}, Lcom/miui/gallery/settingssync/GallerySettingSyncModel;->saveJSONToSettings(Ljava/util/List;Lorg/json/JSONArray;)V

    invoke-direct {p0, v1, p1}, Lcom/miui/gallery/settingssync/GallerySettingSyncModel;->saveJSONToSettings(Ljava/util/List;Lorg/json/JSONArray;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    move-exception p1

    const-string v0, "GallerySettingSyncModel"

    const-string v1, "Failed save settings from JSONObject, %s"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const/4 p1, 0x0

    return p1
.end method
