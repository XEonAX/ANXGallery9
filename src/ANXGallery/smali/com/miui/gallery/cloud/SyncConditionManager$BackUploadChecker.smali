.class Lcom/miui/gallery/cloud/SyncConditionManager$BackUploadChecker;
.super Lcom/miui/gallery/cloud/SyncConditionManager$ServerTagChecker;
.source "SyncConditionManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cloud/SyncConditionManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BackUploadChecker"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/cloud/SyncConditionManager$ServerTagChecker;-><init>(Lcom/miui/gallery/cloud/SyncConditionManager$1;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/cloud/SyncConditionManager$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/cloud/SyncConditionManager$BackUploadChecker;-><init>()V

    return-void
.end method


# virtual methods
.method protected checkInternal(Lcom/miui/gallery/cloud/base/SyncType;)I
    .locals 3

    invoke-super {p0, p1}, Lcom/miui/gallery/cloud/SyncConditionManager$ServerTagChecker;->checkInternal(Lcom/miui/gallery/cloud/base/SyncType;)I

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/miui/gallery/cloud/policy/SyncPolicyManager;->getInstance()Lcom/miui/gallery/cloud/policy/SyncPolicyManager;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/miui/gallery/cloud/policy/SyncPolicyManager;->getPolicy(Lcom/miui/gallery/cloud/base/SyncType;)Lcom/miui/gallery/cloud/policy/IPolicy;

    move-result-object p1

    invoke-interface {p1}, Lcom/miui/gallery/cloud/policy/IPolicy;->isDisallowMetered()Z

    move-result v1

    const/4 v2, 0x2

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isActiveNetworkMetered()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string p1, "SyncConditionManager"

    const-string v0, "network is metered"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    :cond_0
    invoke-interface {p1}, Lcom/miui/gallery/cloud/policy/IPolicy;->isRequireCharging()Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->getIsPlugged()Z

    move-result p1

    if-nez p1, :cond_1

    const-string p1, "SyncConditionManager"

    const-string v0, "not charged"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    :cond_1
    return v0
.end method
