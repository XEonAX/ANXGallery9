.class public Lcom/miui/gallery/util/deprecated/Preference;
.super Lcom/miui/gallery/util/deprecated/BaseDeprecatedPreference;
.source "Preference.java"


# direct methods
.method public static createAutoUploadAlbumPreferenceKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "auto_upload_album_preference_key_prefix_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static getMultiProcessSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "_preferences_multi"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method public static getSyncFetchAllPrivateData()Z
    .locals 3

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetDefaultPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "sync_fetch_all_private_data"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static getSyncFetchPrivateVideo()Z
    .locals 3

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetDefaultPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "sync_fetch_private_video"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static getSyncFetchSyncExtraInfoFromV2ToV3()Z
    .locals 3

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetDefaultPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "sync_fetch_syncextreinfo_from_v2_to_v3"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static getSyncShouldClearDataBase()Z
    .locals 3

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetDefaultPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "sync_should_clean_data"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method private static isAutoUploadAlbumPreferenceKey(Ljava/lang/String;)Z
    .locals 1

    const-string v0, "auto_upload_album_preference_key_prefix_"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static sGetCloudFaceStatusNextCheckTime()J
    .locals 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetDefaultPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "cloud_face_status_retry_time"

    const-wide/16 v2, 0x0

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    return-wide v0
.end method

.method public static sGetCloudGalleryRecyclebinFull()Z
    .locals 3

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetDefaultPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "cloud_gallery_recyclebin_full"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static sGetCloudGallerySpaceFull()Z
    .locals 9

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetDefaultPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "cloud_gallery_space_full_time"

    const-wide/16 v2, 0x0

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long v4, v2, v0

    const-wide/32 v6, 0x36ee80

    cmp-long v8, v4, v6

    const/4 v4, 0x0

    if-gez v8, :cond_1

    cmp-long v5, v2, v0

    if-gez v5, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetDefaultPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "cloud_gallery_space_full"

    invoke-interface {v0, v1, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0

    :cond_1
    :goto_0
    return v4
.end method

.method public static sGetFaceFeaturePending()Z
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetDefaultPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "face_feature_switch_pending"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static sGetFaceUrlForQueuing()Ljava/lang/String;
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetDefaultPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "face_url_for_queuing"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static sGetFaceUrlForWaiting()Ljava/lang/String;
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetDefaultPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "face_url_for_waiting"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static sGetFilterMinSize()J
    .locals 5

    const-wide/16 v0, 0x0

    :try_start_0
    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetDefaultPreferences()Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v3, "filter_min_size"

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v2

    :catch_0
    return-wide v0
.end method

.method public static sGetImpunityDeclarationEveryTime()Z
    .locals 3

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetDefaultPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "impunity_declaration_every_time"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static sGetIsAlbumAutoUploadOpen(Ljava/lang/String;)Z
    .locals 2

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetDefaultPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-static {p0}, Lcom/miui/gallery/util/deprecated/Preference;->createAutoUploadAlbumPreferenceKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x0

    invoke-interface {v0, p0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public static sGetIsScreenShotAutoUploadOpen()Z
    .locals 3

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetDefaultPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "auto-upload-screenshot"

    invoke-static {v1}, Lcom/miui/gallery/util/deprecated/Preference;->createAutoUploadAlbumPreferenceKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static sGetSlideshowInterval()I
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    :try_start_0
    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetDefaultPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "slideshow_interval"

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 v0, 0x2

    :goto_0
    const/4 v1, 0x1

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    mul-int/lit16 v0, v0, 0x3e8

    return v0
.end method

.method public static sHaveCheckBabyForNewService(Landroid/content/Context;)Z
    .locals 2

    invoke-static {p0}, Lcom/miui/gallery/util/deprecated/Preference;->getMultiProcessSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "have_check_baby_for_new_face_service"

    const/4 v1, 0x0

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public static sIsFirstSynced()Z
    .locals 3

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetDefaultPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "first_synced"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static sIsInternationalAccount()I
    .locals 3

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetDefaultPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "is_international_account"

    const/4 v2, 0x2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static sIsShowHidden()Z
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetDefaultPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "show_hidden_album"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static sOnlySyncInWifi()Z
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetDefaultPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "sync_only_in_wifi"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static sRemoveCloudSettings()V
    .locals 4

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetDefaultEditor()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "last_slowscan_time"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "cloud_gallery_space_full"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "cloud_gallery_recyclebin_full"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "sync_only_in_wifi"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "sync_fetch_syncextreinfo_from_v2_to_v3"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "sync_fetch_all_private_data"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "sync_fetch_private_video"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "first_synced"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "is_international_account"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "cloud_face_status"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "cloud_face_status_retry_time"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "face_feature_switch_pending"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "face_url_for_waiting"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "face_url_for_queuing"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "micloud_vip_level"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "has_ever_synced_system_album"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetDefaultEditor()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetDefaultPreferences()Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Lcom/miui/gallery/util/deprecated/Preference;->isAutoUploadAlbumPreferenceKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    :cond_1
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method public static sSetCloudGalleryRecyclebinFull(Z)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetDefaultEditor()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "cloud_gallery_recyclebin_full"

    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method public static sSetCloudGallerySpaceFull(Z)V
    .locals 3

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetDefaultEditor()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "cloud_gallery_space_full"

    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "cloud_gallery_space_full_time"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-interface {p0, v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method public static sSetFirstSynced()V
    .locals 3

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetDefaultEditor()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "first_synced"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method public static sSetHaveCheckBabyForNewService(Landroid/content/Context;)V
    .locals 2

    invoke-static {p0}, Lcom/miui/gallery/util/deprecated/Preference;->getMultiProcessSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "have_check_baby_for_new_face_service"

    const/4 v1, 0x1

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method public static sSetIsInternationalAccount(I)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetDefaultEditor()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "is_international_account"

    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method public static sSetLastSlowScanTime(J)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetDefaultEditor()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "last_slowscan_time"

    invoke-interface {v0, v1, p0, p1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public static setDBUpgradeTo42()V
    .locals 3

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetDefaultEditor()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "database_upgrade_to_42_clean_data"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public static setSyncFetchAllPrivateData()V
    .locals 3

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetDefaultEditor()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "sync_fetch_all_private_data"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method public static setSyncFetchPrivateVideo()V
    .locals 3

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetDefaultEditor()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "sync_fetch_private_video"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method

.method public static setSyncFetchSyncExtraInfoFromV2ToV3(Z)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetDefaultEditor()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "sync_fetch_syncextreinfo_from_v2_to_v3"

    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public static setSyncShouldClearDataBase(Z)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetDefaultEditor()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "sync_should_clean_data"

    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    return-void
.end method
