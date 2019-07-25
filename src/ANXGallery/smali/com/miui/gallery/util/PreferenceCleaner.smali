.class public Lcom/miui/gallery/util/PreferenceCleaner;
.super Ljava/lang/Object;
.source "PreferenceCleaner.java"


# direct methods
.method public static clean()V
    .locals 0

    invoke-static {}, Lcom/miui/gallery/util/PreferenceCleaner;->transferOldPreference()V

    return-void
.end method

.method private static transferOldPreference()V
    .locals 4

    const-string v0, "old_preferences_transfered"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/PreferenceHelper;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const-string v0, "old_preferences_transfered"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/PreferenceHelper;->putBoolean(Ljava/lang/String;Z)V

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetSlideshowInterval()I

    move-result v0

    div-int/lit16 v0, v0, 0x3e8

    const/4 v2, 0x3

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    const/16 v2, 0xe10

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-static {v0}, Lcom/miui/gallery/preference/GalleryPreferences$SlideShow;->setSlideShowInterval(I)V

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sIsShowHidden()Z

    move-result v0

    invoke-static {v0}, Lcom/miui/gallery/preference/GalleryPreferences$HiddenAlbum;->setShowHiddenAlbum(Z)V

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sOnlySyncInWifi()Z

    move-result v0

    invoke-static {v0}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->setBackupOnlyInWifi(Z)V

    const-string v0, "cloud_face_status"

    invoke-static {v0}, Lcom/miui/gallery/preference/PreferenceHelper;->removeKey(Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetCloudFaceStatusNextCheckTime()J

    move-result-wide v2

    const-string v0, "cloud_face_status_retry_time"

    invoke-static {v0, v2, v3}, Lcom/miui/gallery/preference/PreferenceHelper;->putLong(Ljava/lang/String;J)V

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetFaceFeaturePending()Z

    move-result v0

    const-string v2, "face_feature_switch_pending"

    invoke-static {v2, v0}, Lcom/miui/gallery/preference/PreferenceHelper;->putBoolean(Ljava/lang/String;Z)V

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetFaceUrlForQueuing()Ljava/lang/String;

    move-result-object v0

    const-string v2, "face_url_for_queuing"

    invoke-static {v2, v0}, Lcom/miui/gallery/preference/PreferenceHelper;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetFaceUrlForWaiting()Ljava/lang/String;

    move-result-object v0

    const-string v2, "face_url_for_waiting"

    invoke-static {v2, v0}, Lcom/miui/gallery/preference/PreferenceHelper;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sCanConnectNetworkByImpunity()Z

    move-result v0

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetImpunityDeclarationEveryTime()Z

    move-result v2

    xor-int/2addr v1, v2

    if-eqz v0, :cond_1

    if-eqz v1, :cond_1

    invoke-static {v1}, Lcom/miui/gallery/preference/GalleryPreferences$CTA;->setCanConnectNetwork(Z)V

    :cond_1
    return-void
.end method
