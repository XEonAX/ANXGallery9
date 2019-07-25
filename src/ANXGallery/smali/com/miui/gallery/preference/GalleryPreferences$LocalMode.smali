.class public Lcom/miui/gallery/preference/GalleryPreferences$LocalMode;
.super Ljava/lang/Object;
.source "GalleryPreferences.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/preference/GalleryPreferences;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LocalMode"
.end annotation


# direct methods
.method public static declared-synchronized isOnlyShowLocalPhoto()Z
    .locals 3

    const-class v0, Lcom/miui/gallery/preference/GalleryPreferences$LocalMode;

    monitor-enter v0

    :try_start_0
    const-string v1, "only_show_local_photo"

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/miui/gallery/preference/PreferenceHelper;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/util/SyncUtil;->existXiaomiAccount(Landroid/content/Context;)Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    const/4 v2, 0x1

    :cond_0
    monitor-exit v0

    return v2

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static declared-synchronized setOnlyShowLocalPhoto(Z)V
    .locals 2

    const-class v0, Lcom/miui/gallery/preference/GalleryPreferences$LocalMode;

    monitor-enter v0

    :try_start_0
    const-string v1, "only_show_local_photo"

    invoke-static {v1, p0}, Lcom/miui/gallery/preference/PreferenceHelper;->putBoolean(Ljava/lang/String;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method
