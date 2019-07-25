.class public Lcom/miui/gallery/preference/GalleryPreferences$MediaScanner;
.super Ljava/lang/Object;
.source "GalleryPreferences.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/preference/GalleryPreferences;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MediaScanner"
.end annotation


# static fields
.field private static final PRUNE_PROTECT_THRESHOLD_MILLIS:J


# direct methods
.method static constructor <clinit>()V
    .locals 3

    sget-object v0, Ljava/util/concurrent/TimeUnit;->DAYS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x3

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    sput-wide v0, Lcom/miui/gallery/preference/GalleryPreferences$MediaScanner;->PRUNE_PROTECT_THRESHOLD_MILLIS:J

    return-void
.end method

.method public static getEverCleanUnsupportUploadItems()Z
    .locals 2

    const-string v0, "ever_clean_unsupport_upload_items"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/PreferenceHelper;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static getLastImagesScanTime()J
    .locals 5

    const-string v0, "last_images_scan_time"

    const-wide/16 v1, 0x0

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/preference/PreferenceHelper;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    cmp-long v0, v3, v1

    if-nez v0, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/miui/gallery/preference/GalleryPreferences$MediaScanner;->setLastImagesScanTime(J)V

    :cond_0
    return-wide v3
.end method

.method public static getLastRefreshedIgnoreListVersion()I
    .locals 2

    const-string v0, "last_refreshed_ignore_list_version"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/PreferenceHelper;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getLastVideosScanTime()J
    .locals 5

    const-string v0, "last_videos_scan_time"

    const-wide/16 v1, 0x0

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/preference/PreferenceHelper;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    cmp-long v0, v3, v1

    if-nez v0, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/miui/gallery/preference/GalleryPreferences$MediaScanner;->setLastVideosScanTime(J)V

    :cond_0
    return-wide v3
.end method

.method public static isAlbumPruneProtected()Z
    .locals 5

    const-string v0, "last_local_restore_time"

    const-wide/16 v1, 0x0

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/preference/PreferenceHelper;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    cmp-long v0, v3, v1

    if-lez v0, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sub-long/2addr v0, v3

    sget-wide v2, Lcom/miui/gallery/preference/GalleryPreferences$MediaScanner;->PRUNE_PROTECT_THRESHOLD_MILLIS:J

    cmp-long v4, v0, v2

    if-gez v4, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isEverFillSpecialTypeFlags()Z
    .locals 5

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "ever_fill_special_type_flags_v%d"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v4, 0x0

    aput-object v2, v3, v4

    invoke-static {v0, v1, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v4}, Lcom/miui/gallery/preference/PreferenceHelper;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static isEverRestoreSecretItems()Z
    .locals 2

    const-string v0, "ever_restore_secret_items"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/PreferenceHelper;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method public static recordAlbumRestoreTimeMillis()V
    .locals 3

    const-string v0, "last_local_restore_time"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/preference/PreferenceHelper;->putLong(Ljava/lang/String;J)V

    return-void
.end method

.method public static setEverCleanUnsupportUploadItems()V
    .locals 2

    const-string v0, "ever_clean_unsupport_upload_items"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/PreferenceHelper;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method public static setEverFillSpecialTypeFlags()V
    .locals 6

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "ever_fill_special_type_flags_v%d"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-static {v0, v1, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lcom/miui/gallery/preference/PreferenceHelper;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method public static setHasRestoredSecretItems()V
    .locals 2

    const-string v0, "ever_restore_secret_items"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/PreferenceHelper;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method public static setLastImagesScanTime(J)V
    .locals 1

    const-string v0, "last_images_scan_time"

    invoke-static {v0, p0, p1}, Lcom/miui/gallery/preference/PreferenceHelper;->putLong(Ljava/lang/String;J)V

    return-void
.end method

.method public static setLastRefreshedIgnoreListVersion(I)V
    .locals 1

    const-string v0, "last_refreshed_ignore_list_version"

    invoke-static {v0, p0}, Lcom/miui/gallery/preference/PreferenceHelper;->putInt(Ljava/lang/String;I)V

    return-void
.end method

.method public static setLastVideosScanTime(J)V
    .locals 1

    const-string v0, "last_videos_scan_time"

    invoke-static {v0, p0, p1}, Lcom/miui/gallery/preference/PreferenceHelper;->putLong(Ljava/lang/String;J)V

    return-void
.end method
