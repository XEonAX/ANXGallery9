.class Lcom/miui/gallery/cloud/SyncConditionManager$BackDownloadWeakChecker;
.super Lcom/miui/gallery/cloud/SyncConditionManager$Checker;
.source "SyncConditionManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cloud/SyncConditionManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BackDownloadWeakChecker"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/cloud/SyncConditionManager$Checker;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/cloud/SyncConditionManager$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/cloud/SyncConditionManager$BackDownloadWeakChecker;-><init>()V

    return-void
.end method


# virtual methods
.method protected checkInternal(Lcom/miui/gallery/cloud/base/SyncType;)I
    .locals 3

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/cloud/GalleryCloudUtils;->isGalleryCloudSyncable(Landroid/content/Context;)Z

    move-result p1

    const/4 v0, 0x2

    if-nez p1, :cond_0

    return v0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isActiveNetworkMetered()Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->getPowerCanSync()Z

    move-result v1

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/miui/gallery/util/MiscUtil;->isAppProcessInForeground(Landroid/content/Context;)Z

    move-result v2

    if-eqz p1, :cond_1

    if-eqz v1, :cond_1

    if-eqz v2, :cond_1

    const/4 p1, 0x0

    return p1

    :cond_1
    return v0
.end method
