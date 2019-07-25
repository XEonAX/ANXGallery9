.class Lcom/miui/gallery/cloud/SyncConditionManager$ServerTagChecker;
.super Lcom/miui/gallery/cloud/SyncConditionManager$Checker;
.source "SyncConditionManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cloud/SyncConditionManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ServerTagChecker"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/cloud/SyncConditionManager$Checker;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/cloud/SyncConditionManager$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/cloud/SyncConditionManager$ServerTagChecker;-><init>()V

    return-void
.end method


# virtual methods
.method protected checkInternal(Lcom/miui/gallery/cloud/base/SyncType;)I
    .locals 2

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/cloud/GalleryCloudUtils;->isGalleryCloudSyncable(Landroid/content/Context;)Z

    move-result v0

    const/4 v1, 0x2

    if-nez v0, :cond_0

    return v1

    :cond_0
    invoke-static {}, Lcom/miui/gallery/cloud/policy/SyncPolicyManager;->getInstance()Lcom/miui/gallery/cloud/policy/SyncPolicyManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/cloud/policy/SyncPolicyManager;->getPolicy(Lcom/miui/gallery/cloud/base/SyncType;)Lcom/miui/gallery/cloud/policy/IPolicy;

    move-result-object p1

    if-eqz p1, :cond_3

    invoke-interface {p1}, Lcom/miui/gallery/cloud/policy/IPolicy;->isEnable()Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    invoke-interface {p1}, Lcom/miui/gallery/cloud/policy/IPolicy;->isIgnoreBatteryLow()Z

    move-result p1

    if-nez p1, :cond_2

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->getPowerCanSync()Z

    move-result p1

    if-nez p1, :cond_2

    const-string p1, "SyncConditionManager"

    const-string v0, "battery low"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_2
    const/4 p1, 0x0

    return p1

    :cond_3
    :goto_0
    const-string p1, "SyncConditionManager"

    const-string v0, "policy not enable"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v1
.end method
