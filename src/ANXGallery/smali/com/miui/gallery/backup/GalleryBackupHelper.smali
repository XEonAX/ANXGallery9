.class public Lcom/miui/gallery/backup/GalleryBackupHelper;
.super Ljava/lang/Object;
.source "GalleryBackupHelper.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "GalleryBackupHelper"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static backup()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;
    .locals 7

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->newBuilder()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object v3

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupHelper;->backupSettings()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->setSettings(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object v3

    invoke-static {v2}, Lcom/miui/gallery/backup/GalleryBackupHelper;->backupAlbumProfiles(Ljava/util/Map;)Ljava/util/List;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->addAllAlbumProfiles(Ljava/lang/Iterable;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;

    move-result-object v3

    invoke-virtual {v3}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Builder;->build()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;

    move-result-object v3

    const-string v4, "costs"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sub-long/2addr v5, v0

    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "local_backup"

    const-string v1, "full_backup"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-object v3
.end method

.method private static backupAlbumProfiles(Ljava/util/Map;)Ljava/util/List;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    const-string v1, "local_path"

    const-string v2, "attributes"

    const-string v3, "name"

    filled-new-array {v1, v2, v3}, [Ljava/lang/String;

    move-result-object v6

    const-string v7, "attributes & 48 <> 16"

    sget-object v1, Lcom/miui/gallery/provider/GalleryContract$Album;->URI:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "fill_covers"

    const-string v3, "false"

    invoke-virtual {v1, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "exclude_empty_album"

    const-string v3, "true"

    invoke-virtual {v1, v2, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v5

    invoke-static {}, Lcom/miui/gallery/util/StaticContext;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v4

    new-instance v10, Lcom/miui/gallery/backup/-$$Lambda$GalleryBackupHelper$sUpNkw9c39tnHXc_RX6ZFt35qQk;

    invoke-direct {v10, v0}, Lcom/miui/gallery/backup/-$$Lambda$GalleryBackupHelper$sUpNkw9c39tnHXc_RX6ZFt35qQk;-><init>(Ljava/util/List;)V

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static/range {v4 .. v10}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    const-string v1, "GalleryBackupHelper"

    const-string v2, "Backup %d album profiles"

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v1, "album_count"

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0
.end method

.method private static backupSettings()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;
    .locals 2

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->newBuilder()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object v0

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$LocalMode;->isOnlyShowLocalPhoto()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->setOnlyShowLocalPhoto(Z)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object v0

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$HiddenAlbum;->isShowHiddenAlbum()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->setShowHiddenAlbum(Z)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object v0

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$SlideShow;->getSlideShowInterval()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->setSlideshowInterval(I)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object v0

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$CTA;->remindConnectNetworkEveryTime()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->setRemindConnectNetworkEveryTime(Z)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings$Builder;->build()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$backupAlbumProfiles$33(Ljava/util/List;Landroid/database/Cursor;)Ljava/lang/Object;
    .locals 4

    const/4 v0, 0x0

    if-eqz p1, :cond_2

    invoke-interface {p1}, Landroid/database/Cursor;->isClosed()Z

    move-result v1

    if-nez v1, :cond_2

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-gtz v1, :cond_0

    goto :goto_1

    :cond_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    :goto_0
    invoke-interface {p1}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-static {}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->newBuilder()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->setPath(Ljava/lang/String;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object v1

    const/4 v2, 0x1

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->setAttributes(J)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object v1

    const/4 v2, 0x2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->setName(Ljava/lang/String;)Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile$Builder;->build()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    move-result-object v1

    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_0

    :cond_1
    return-object v0

    :cond_2
    :goto_1
    return-object v0
.end method

.method public static restore(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;)V
    .locals 5

    if-nez p0, :cond_0

    const-string p0, "GalleryBackupHelper"

    const-string v0, "Backup message is null"

    invoke-static {p0, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->getSettings()Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;

    move-result-object v3

    invoke-static {v3}, Lcom/miui/gallery/backup/GalleryBackupHelper;->restoreSettings(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;)V

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage;->getAlbumProfilesList()Ljava/util/List;

    move-result-object p0

    invoke-static {p0}, Lcom/miui/gallery/backup/GalleryBackupHelper;->restoreAlbumProfiles(Ljava/util/List;)V

    const-string p0, "costs"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, v0

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v2, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "local_backup"

    const-string v0, "full_restore"

    invoke-static {p0, v0, v2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method private static restoreAlbumProfiles(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;",
            ">;)V"
        }
    .end annotation

    if-eqz p0, :cond_5

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_0

    goto :goto_1

    :cond_0
    const/4 v0, 0x0

    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;

    invoke-virtual {v2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v1}, Landroid/content/ContentValues;->clear()V

    const-string v3, "attributes"

    invoke-virtual {v2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->getAttributes()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    invoke-virtual {v2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    const-string v3, "fileName"

    invoke-virtual {v2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    invoke-static {}, Lcom/miui/gallery/util/StaticContext;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v2}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$AlbumProfile;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2, v1}, Lcom/miui/gallery/scanner/MediaScanner;->updateOrInsertAlbum(Landroid/content/Context;Ljava/lang/String;Landroid/content/ContentValues;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    if-lez v0, :cond_4

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$MediaScanner;->recordAlbumRestoreTimeMillis()V

    :cond_4
    const-string p0, "GalleryBackupHelper"

    const-string v1, "Restore %d album profiles"

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {p0, v1, v0}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    :cond_5
    :goto_1
    const-string p0, "GalleryBackupHelper"

    const-string v0, "No album profile exists"

    invoke-static {p0, v0}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private static restoreSettings(Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;)V
    .locals 1

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->getOnlyShowLocalPhoto()Z

    move-result v0

    invoke-static {v0}, Lcom/miui/gallery/preference/GalleryPreferences$LocalMode;->setOnlyShowLocalPhoto(Z)V

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->getShowHiddenAlbum()Z

    move-result v0

    invoke-static {v0}, Lcom/miui/gallery/preference/GalleryPreferences$HiddenAlbum;->setShowHiddenAlbum(Z)V

    invoke-virtual {p0}, Lcom/miui/gallery/backup/GalleryBackupProtos$BackupMessage$Settings;->getSlideshowInterval()I

    move-result p0

    invoke-static {p0}, Lcom/miui/gallery/preference/GalleryPreferences$SlideShow;->setSlideShowInterval(I)V

    return-void
.end method
