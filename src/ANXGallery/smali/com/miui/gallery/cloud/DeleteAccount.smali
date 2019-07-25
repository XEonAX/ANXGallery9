.class public Lcom/miui/gallery/cloud/DeleteAccount;
.super Ljava/lang/Object;
.source "DeleteAccount.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/cloud/DeleteAccount$DeleteAccountTask;,
        Lcom/miui/gallery/cloud/DeleteAccount$DeleteAccountListener;
    }
.end annotation


# static fields
.field private static sNeedDeleteAfterSync:Z = false

.field private static sWipeDataStrategyAfterSync:I = 0x2


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public static deleteAccountAfterSyncIfNeeded()V
    .locals 1

    sget-boolean v0, Lcom/miui/gallery/cloud/DeleteAccount;->sNeedDeleteAfterSync:Z

    if-eqz v0, :cond_0

    sget v0, Lcom/miui/gallery/cloud/DeleteAccount;->sWipeDataStrategyAfterSync:I

    invoke-static {v0}, Lcom/miui/gallery/cloud/DeleteAccount;->executeDeleteAccount(I)Z

    const/4 v0, 0x0

    sput-boolean v0, Lcom/miui/gallery/cloud/DeleteAccount;->sNeedDeleteAfterSync:Z

    :cond_0
    return-void
.end method

.method public static deleteAccountInTask(Landroid/app/Activity;Landroid/accounts/Account;ILcom/miui/gallery/cloud/DeleteAccount$DeleteAccountListener;)V
    .locals 2

    const-string v0, "com.miui.gallery.cloud.provider"

    invoke-static {p1, v0}, Landroid/content/ContentResolver;->isSyncActive(Landroid/accounts/Account;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    sput-boolean v0, Lcom/miui/gallery/cloud/DeleteAccount;->sNeedDeleteAfterSync:Z

    sput p2, Lcom/miui/gallery/cloud/DeleteAccount;->sWipeDataStrategyAfterSync:I

    const-string v0, "DeleteAccount"

    const-string v1, "cancel sync..."

    invoke-static {v0, v1}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "com.miui.gallery.cloud.provider"

    invoke-static {p1, v0}, Landroid/content/ContentResolver;->cancelSync(Landroid/accounts/Account;Ljava/lang/String;)V

    :cond_0
    new-instance p1, Lcom/miui/gallery/cloud/DeleteAccount$DeleteAccountTask;

    invoke-direct {p1, p0, p2, p3}, Lcom/miui/gallery/cloud/DeleteAccount$DeleteAccountTask;-><init>(Landroid/app/Activity;ILcom/miui/gallery/cloud/DeleteAccount$DeleteAccountListener;)V

    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Void;

    invoke-virtual {p1, p0}, Lcom/miui/gallery/cloud/DeleteAccount$DeleteAccountTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static executeDeleteAccount(I)Z
    .locals 4

    invoke-static {}, Lcom/miui/gallery/push/GalleryPushManager;->getInstance()Lcom/miui/gallery/push/GalleryPushManager;

    move-result-object v0

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/push/GalleryPushManager;->onDeleteAccount(Landroid/content/Context;)V

    invoke-static {}, Lcom/miui/gallery/cloud/AlbumShareOperations;->resetAccountInfo()V

    const-string v0, "DeleteAccount"

    const-string v1, "reset AlbumShareOperations when account is deleted"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder;->onDeleteAccount()V

    const/4 v0, 0x0

    invoke-static {v0, v0}, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->resetAccountInfo(Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;)V

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/miui/gallery/util/DeleteDataUtil;->delete(Landroid/content/Context;I)Z

    move-result v0

    const-string v1, "DeleteAccount"

    const-string v2, "delete data result %s"

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v1, Lcom/miui/gallery/cloudcontrol/CloudControlRequestHelper;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/miui/gallery/cloudcontrol/CloudControlRequestHelper;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1}, Lcom/miui/gallery/cloudcontrol/CloudControlRequestHelper;->execRequestSync()Z

    const-string v1, "DeleteAccount"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "finish deleting account, strategy="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, ", result="

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/miui/gallery/util/SyncLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    return v0
.end method
