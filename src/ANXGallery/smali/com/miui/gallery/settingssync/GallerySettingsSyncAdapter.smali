.class public Lcom/miui/gallery/settingssync/GallerySettingsSyncAdapter;
.super Ljava/lang/Object;
.source "GallerySettingsSyncAdapter.java"

# interfaces
.implements Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$SyncAdapter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/settingssync/GallerySettingsSyncAdapter$GallerySettingDownloadRequest;,
        Lcom/miui/gallery/settingssync/GallerySettingsSyncAdapter$GallerySettingUploadRequest;
    }
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private mModel:Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$Model;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$Model;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/settingssync/GallerySettingsSyncAdapter;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/miui/gallery/settingssync/GallerySettingsSyncAdapter;->mModel:Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$Model;

    return-void
.end method

.method private doDownload()Z
    .locals 4

    new-instance v0, Lcom/miui/gallery/settingssync/GallerySettingsSyncAdapter$GallerySettingDownloadRequest;

    invoke-direct {v0}, Lcom/miui/gallery/settingssync/GallerySettingsSyncAdapter$GallerySettingDownloadRequest;-><init>()V

    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {v0}, Lcom/miui/gallery/settingssync/GallerySettingsSyncAdapter$GallerySettingDownloadRequest;->executeSync()[Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    array-length v2, v0

    if-lez v2, :cond_0

    const/4 v2, 0x0

    aget-object v3, v0, v2

    instance-of v3, v3, Lorg/json/JSONObject;

    if-eqz v3, :cond_0

    aget-object v0, v0, v2

    check-cast v0, Lorg/json/JSONObject;
    :try_end_0
    .catch Lcom/miui/gallery/net/base/RequestError; {:try_start_0 .. :try_end_0} :catch_0

    move-object v1, v0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v2, "GallerySettingsSyncAdapter"

    const-string v3, "Get setting failed, %s"

    invoke-static {v2, v3, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_0
    :goto_0
    if-nez v1, :cond_1

    const-string v0, "GallerySettingsSyncAdapter"

    const-string v1, "No syncable settings found to update"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    return v0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/settingssync/GallerySettingsSyncAdapter;->mModel:Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$Model;

    invoke-interface {v0, v1}, Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$Model;->onDownloadSettings(Lorg/json/JSONObject;)Z

    move-result v0

    return v0
.end method

.method private doUpload()Z
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/settingssync/GallerySettingsSyncAdapter;->mModel:Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$Model;

    invoke-interface {v0}, Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$Model;->getUploadSettings()Lorg/json/JSONObject;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "GallerySettingsSyncAdapter"

    const-string v1, "No syncable settings found to upload"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    return v0

    :cond_0
    new-instance v1, Lcom/miui/gallery/settingssync/GallerySettingsSyncAdapter$GallerySettingUploadRequest;

    invoke-direct {v1, v0}, Lcom/miui/gallery/settingssync/GallerySettingsSyncAdapter$GallerySettingUploadRequest;-><init>(Lorg/json/JSONObject;)V

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {v1}, Lcom/miui/gallery/settingssync/GallerySettingsSyncAdapter$GallerySettingUploadRequest;->executeSync()[Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_1

    array-length v2, v1

    if-lez v2, :cond_1

    aget-object v2, v1, v0

    instance-of v2, v2, Ljava/lang/Boolean;

    if-eqz v2, :cond_1

    aget-object v1, v1, v0

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1
    :try_end_0
    .catch Lcom/miui/gallery/net/base/RequestError; {:try_start_0 .. :try_end_0} :catch_0

    return v1

    :catch_0
    move-exception v1

    const-string v2, "GallerySettingsSyncAdapter"

    const-string v3, "Post setting failed, %s"

    invoke-static {v2, v3, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_1
    return v0
.end method


# virtual methods
.method public performSync(Landroid/os/Bundle;)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/agreement/AgreementsUtils;->isNetworkingAgreementAccepted()Z

    move-result p1

    if-nez p1, :cond_0

    const-string p1, "GallerySettingsSyncAdapter"

    const-string v0, "Sync settings failed: CTA not confirmed"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    const/4 p1, 0x1

    const/4 v0, 0x0

    invoke-static {v0, p1, v0}, Lcom/miui/gallery/cloud/CloudUtils;->checkAccount(Landroid/app/Activity;ZLjava/lang/Runnable;)Z

    move-result p1

    if-nez p1, :cond_1

    const-string p1, "GallerySettingsSyncAdapter"

    const-string v0, "Sync settings failed: check account failed"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/PrivacyAgreementUtils;->isCloudServiceAgreementEnable(Landroid/content/Context;)Z

    move-result p1

    if-nez p1, :cond_2

    const-string p1, "GallerySettingsSyncAdapter"

    const-string v0, "Sync settings failed: cloud service agreement disabled"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/settingssync/GallerySettingsSyncAdapter;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/miui/gallery/util/SyncUtil;->isGalleryCloudSyncable(Landroid/content/Context;)Z

    move-result p1

    if-nez p1, :cond_3

    const-string p1, "GallerySettingsSyncAdapter"

    const-string v0, "Sync settings failed: sync off"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/settingssync/GallerySettingsSyncAdapter;->mModel:Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$Model;

    invoke-interface {p1}, Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$Model;->isDirty()Z

    move-result p1

    if-eqz p1, :cond_5

    invoke-direct {p0}, Lcom/miui/gallery/settingssync/GallerySettingsSyncAdapter;->doUpload()Z

    move-result p1

    if-eqz p1, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/settingssync/GallerySettingsSyncAdapter;->mModel:Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$Model;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/miui/gallery/settingssync/GallerySettingsSyncContract$Model;->markDirty(Z)V

    :cond_4
    const-string v0, "GallerySettingsSyncAdapter"

    const-string v1, "Upload settings result %s"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :cond_5
    invoke-direct {p0}, Lcom/miui/gallery/settingssync/GallerySettingsSyncAdapter;->doDownload()Z

    move-result p1

    const-string v0, "GallerySettingsSyncAdapter"

    const-string v1, "Download settings result %s"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method
