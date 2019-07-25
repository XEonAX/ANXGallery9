.class Lcom/miui/gallery/settingssync/SearchSetting;
.super Ljava/lang/Object;
.source "SearchSetting.java"

# interfaces
.implements Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$SyncableSetting;


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    const-string v0, "search"

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public isEnabled()Ljava/lang/Boolean;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/ui/AIAlbumStatusHelper;->isLocalSearchSet()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/miui/gallery/ui/AIAlbumStatusHelper;->isLocalSearchOpen(Z)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public isExport()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public writeValue(Ljava/lang/Boolean;Ljava/lang/Object;)V
    .locals 0

    if-eqz p1, :cond_1

    invoke-static {}, Lcom/miui/gallery/ui/AIAlbumStatusHelper;->isLocalSearchSet()Z

    move-result p2

    if-nez p2, :cond_0

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_1

    :cond_0
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-static {p2, p1}, Lcom/miui/gallery/ui/AIAlbumStatusHelper;->setLocalSearchStatus(Landroid/content/Context;Z)V

    :cond_1
    return-void
.end method
