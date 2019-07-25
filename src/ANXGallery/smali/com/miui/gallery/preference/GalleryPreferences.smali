.class public Lcom/miui/gallery/preference/GalleryPreferences;
.super Ljava/lang/Object;
.source "GalleryPreferences.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/preference/GalleryPreferences$CleanFilePath;,
        Lcom/miui/gallery/preference/GalleryPreferences$SearchBackedAlbum;,
        Lcom/miui/gallery/preference/GalleryPreferences$HomePage;,
        Lcom/miui/gallery/preference/GalleryPreferences$MonthView;,
        Lcom/miui/gallery/preference/GalleryPreferences$Assistant;,
        Lcom/miui/gallery/preference/GalleryPreferences$SmartVideoGuide;,
        Lcom/miui/gallery/preference/GalleryPreferences$SettingsSync;,
        Lcom/miui/gallery/preference/GalleryPreferences$PhotoPrint;,
        Lcom/miui/gallery/preference/GalleryPreferences$PhotoSlim;,
        Lcom/miui/gallery/preference/GalleryPreferences$Favorites;,
        Lcom/miui/gallery/preference/GalleryPreferences$UUID;,
        Lcom/miui/gallery/preference/GalleryPreferences$FeatureRedDot;,
        Lcom/miui/gallery/preference/GalleryPreferences$TopBar;,
        Lcom/miui/gallery/preference/GalleryPreferences$FileDownload;,
        Lcom/miui/gallery/preference/GalleryPreferences$CloudControl;,
        Lcom/miui/gallery/preference/GalleryPreferences$LocationManager;,
        Lcom/miui/gallery/preference/GalleryPreferences$PhotoEditor;,
        Lcom/miui/gallery/preference/GalleryPreferences$HiddenAlbum;,
        Lcom/miui/gallery/preference/GalleryPreferences$SlideShow;,
        Lcom/miui/gallery/preference/GalleryPreferences$DataBase;,
        Lcom/miui/gallery/preference/GalleryPreferences$LocalMode;,
        Lcom/miui/gallery/preference/GalleryPreferences$MediaScanner;,
        Lcom/miui/gallery/preference/GalleryPreferences$Delete;,
        Lcom/miui/gallery/preference/GalleryPreferences$Secret;,
        Lcom/miui/gallery/preference/GalleryPreferences$Search;,
        Lcom/miui/gallery/preference/GalleryPreferences$Face;,
        Lcom/miui/gallery/preference/GalleryPreferences$Baby;,
        Lcom/miui/gallery/preference/GalleryPreferences$CloudGuide;,
        Lcom/miui/gallery/preference/GalleryPreferences$Sync;,
        Lcom/miui/gallery/preference/GalleryPreferences$CTA;,
        Lcom/miui/gallery/preference/GalleryPreferences$SampleStatistic;,
        Lcom/miui/gallery/preference/GalleryPreferences$Album;,
        Lcom/miui/gallery/preference/GalleryPreferences$PrefKeys;
    }
.end annotation


# direct methods
.method public static getAutoBackupPrefKeys()Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const-class v0, Lcom/miui/gallery/preference/GalleryPreferences$PrefKeys;

    invoke-virtual {v0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    :try_start_0
    array-length v3, v0

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v3, :cond_1

    aget-object v5, v0, v4

    const-class v6, Lcom/miui/gallery/preference/AutoBackup;

    invoke-virtual {v5, v6}, Ljava/lang/reflect/Field;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-virtual {v5, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "GalleryPreferences"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    :catch_1
    move-exception v0

    const-string v1, "GalleryPreferences"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1
    :goto_1
    return-object v2

    :cond_2
    return-object v1
.end method

.method public static sRemoveCloudSettings()V
    .locals 4

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Face;->remove()V

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->remove()V

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$CloudGuide;->access$000()V

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$TopBar;->remove()V

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Search;->remove()V

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$CloudControl;->remove()V

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$SettingsSync;->remove()V

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$LocationManager;->remove()V

    invoke-static {}, Lcom/miui/gallery/preference/PreferenceHelper;->getPreferences()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-static {}, Lcom/miui/gallery/preference/PreferenceHelper;->getPreferences()Landroid/content/SharedPreferences;

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

    invoke-static {v2}, Lcom/miui/gallery/preference/GalleryPreferences$Baby;->access$100(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    :cond_1
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-static {}, Lcom/miui/gallery/preference/MemoryPreferenceHelper;->clear()V

    return-void
.end method
