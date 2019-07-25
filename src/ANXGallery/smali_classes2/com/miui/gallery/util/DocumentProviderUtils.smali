.class public Lcom/miui/gallery/util/DocumentProviderUtils;
.super Lcom/miui/gallery/util/BaseDocumentProviderUtils;
.source "DocumentProviderUtils.java"


# direct methods
.method private static createAccessIntent(Landroid/app/Activity;Ljava/lang/String;I)V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x18
    .end annotation

    invoke-static {}, Lcom/android/internal/storage/StorageManager;->getInstance()Lcom/android/internal/storage/StorageManager;

    move-result-object v0

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0, v1}, Lcom/android/internal/storage/StorageManager;->getStorageInfo(Landroid/content/Context;Ljava/io/File;)Lcom/android/internal/storage/StorageInfo;

    move-result-object p1

    if-nez p1, :cond_0

    invoke-static {p0}, Lcom/miui/gallery/util/DocumentProviderUtils;->firstEntrancyPermFailed(Landroid/app/Activity;)V

    return-void

    :cond_0
    invoke-virtual {p1, p0}, Lcom/android/internal/storage/StorageInfo;->createAccessIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object p1

    if-nez p1, :cond_1

    invoke-static {p0}, Lcom/miui/gallery/util/DocumentProviderUtils;->firstEntrancyPermFailed(Landroid/app/Activity;)V

    return-void

    :cond_1
    new-instance v0, Lcom/miui/gallery/util/DocumentProviderUtils$2;

    invoke-direct {v0, p0, p1, p2}, Lcom/miui/gallery/util/DocumentProviderUtils$2;-><init>(Landroid/app/Activity;Landroid/content/Intent;I)V

    new-instance p1, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    invoke-direct {p1}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;-><init>()V

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->setCancelable(Z)Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    move-result-object p1

    const p2, 0x7f10038c

    invoke-virtual {p0, p2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->setTitle(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    move-result-object p1

    const p2, 0x7f10038b

    invoke-virtual {p0, p2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->setMessage(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    move-result-object p1

    const p2, 0x7f10038a

    invoke-virtual {p0, p2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2, v0}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->create()Lcom/miui/gallery/ui/AlertDialogFragment;

    move-result-object p1

    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p0

    const-string p2, "DocumentProviderUtils"

    invoke-virtual {p1, p0, p2}, Lcom/miui/gallery/ui/AlertDialogFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method private static firstEntrancyPermFailed(Landroid/app/Activity;)V
    .locals 4

    invoke-static {}, Lcom/miui/gallery/util/DocumentProviderUtils;->increaseAccessIntentCount()V

    new-instance v0, Lcom/miui/gallery/util/DocumentProviderUtils$1;

    invoke-direct {v0}, Lcom/miui/gallery/util/DocumentProviderUtils$1;-><init>()V

    new-instance v1, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    invoke-direct {v1}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;-><init>()V

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->setCancelable(Z)Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f100384

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->setTitle(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f100383

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->setMessage(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    move-result-object v1

    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f10038d

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->create()Lcom/miui/gallery/ui/AlertDialogFragment;

    move-result-object v0

    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p0

    const-string v1, "DocumentProviderUtils"

    invoke-virtual {v0, p0, v1}, Lcom/miui/gallery/ui/AlertDialogFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method public static handleRequestPermissionResult(Landroid/app/Activity;IILandroid/content/Intent;)V
    .locals 4

    if-nez p0, :cond_0

    return-void

    :cond_0
    const/16 v0, 0x31

    const/4 v1, 0x1

    const/4 v2, -0x1

    const/4 v3, 0x0

    if-ne p1, v0, :cond_2

    invoke-static {v3}, Lcom/miui/gallery/preference/DocumentProviderPreference;->setFirstEntrance(Z)V

    if-ne p2, v2, :cond_1

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/DocumentProviderUtils;->isUriExternalSDCardRoot(Landroid/net/Uri;)Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-static {p0, p3}, Lcom/miui/gallery/util/DocumentProviderUtils;->handleRequestSucceed(Landroid/app/Activity;Landroid/content/Intent;)V

    const-string p0, "document_provider_permission_request"

    const-string p1, "document_provider_first_entrance"

    invoke-static {v1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/stat/BaseSamplingStatHelper;->recordStringPropertyEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    invoke-static {p0}, Lcom/miui/gallery/util/DocumentProviderUtils;->firstEntrancyPermFailed(Landroid/app/Activity;)V

    const-string p0, "document_provider_permission_request"

    const-string p1, "document_provider_first_entrance"

    invoke-static {v3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/stat/BaseSamplingStatHelper;->recordStringPropertyEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_2
    const/16 v0, 0x2f

    if-ne p1, v0, :cond_4

    if-ne p2, v2, :cond_3

    invoke-static {p0, p3}, Lcom/miui/gallery/util/DocumentProviderUtils;->handleRequestSucceed(Landroid/app/Activity;Landroid/content/Intent;)V

    const-string p0, "document_provider_permission_request"

    const-string p1, "document_provider_permission_requested"

    invoke-static {v1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/stat/BaseSamplingStatHelper;->recordStringPropertyEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_3
    invoke-static {}, Lcom/miui/gallery/util/DocumentProviderUtils;->increaseAccessIntentCount()V

    invoke-static {p0}, Lcom/miui/gallery/util/DocumentProviderUtils;->showOperationFailedDialog(Landroid/app/Activity;)V

    const-string p0, "document_provider_permission_request"

    const-string p1, "document_provider_permission_requested"

    invoke-static {v3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/stat/BaseSamplingStatHelper;->recordStringPropertyEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    return-void

    :cond_4
    const/16 v0, 0x30

    if-ne p1, v0, :cond_6

    if-ne p2, v2, :cond_5

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/DocumentProviderUtils;->isUriExternalSDCardRoot(Landroid/net/Uri;)Z

    move-result p1

    if-eqz p1, :cond_5

    invoke-static {p0, p3}, Lcom/miui/gallery/util/DocumentProviderUtils;->handleRequestSucceed(Landroid/app/Activity;Landroid/content/Intent;)V

    const-string p0, "document_provider_permission_request"

    const-string p1, "document_provider_permission_requested"

    invoke-static {v1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/stat/BaseSamplingStatHelper;->recordStringPropertyEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_5
    invoke-static {p0}, Lcom/miui/gallery/util/DocumentProviderUtils;->showOperationFailedDialog(Landroid/app/Activity;)V

    const-string p0, "document_provider_permission_request"

    const-string p1, "document_provider_permission_requested"

    invoke-static {v3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p2

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/stat/BaseSamplingStatHelper;->recordStringPropertyEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_6
    return-void
.end method

.method private static handleRequestSucceed(Landroid/app/Activity;Landroid/content/Intent;)V
    .locals 1

    invoke-static {p0, p1}, Lcom/miui/gallery/util/DocumentProviderUtils;->persistDocumentProviderUri(Landroid/content/Context;Landroid/content/Intent;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f10038e

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void
.end method

.method private static increaseAccessIntentCount()V
    .locals 1

    invoke-static {}, Lcom/miui/gallery/preference/DocumentProviderPreference;->getOpenExternalDocumentCount()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-static {v0}, Lcom/miui/gallery/preference/DocumentProviderPreference;->setOpenExternalDocumentCount(I)V

    return-void
.end method

.method private static isUriExternalSDCardRoot(Landroid/net/Uri;)Z
    .locals 5

    const/4 v0, 0x0

    if-eqz p0, :cond_2

    invoke-static {}, Lcom/miui/gallery/util/StaticContext;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/util/StorageUtils;->hasExternalSDCard(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/util/StorageUtils;->getSecondaryStoragePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/miui/gallery/util/StaticContext;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, p0}, Landroid/support/v4/provider/DocumentFile;->fromTreeUri(Landroid/content/Context;Landroid/net/Uri;)Landroid/support/v4/provider/DocumentFile;

    move-result-object p0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ".miuigallery"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "any/any"

    invoke-virtual {p0, v3, v2}, Landroid/support/v4/provider/DocumentFile;->createFile(Ljava/lang/String;Ljava/lang/String;)Landroid/support/v4/provider/DocumentFile;

    move-result-object p0

    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Landroid/support/v4/provider/DocumentFile;->delete()Z

    const/4 p0, 0x1

    return p0

    :cond_1
    return v0

    :cond_2
    :goto_0
    return v0
.end method

.method private static persistDocumentProviderUri(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    if-nez p1, :cond_0

    return-void

    :cond_0
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    const/4 v0, 0x3

    invoke-virtual {p0, p1, v0}, Landroid/content/ContentResolver;->takePersistableUriPermission(Landroid/net/Uri;I)V

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/miui/gallery/preference/BaseGalleryPreferences$BaseDocumentProvider;->setExternalSDCardUri(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "DocumentProviderUtils"

    invoke-static {p1, p0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method private static showOperationFailedDialog(Landroid/app/Activity;)V
    .locals 3

    new-instance v0, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    invoke-direct {v0}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;-><init>()V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->setCancelable(Z)Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    move-result-object v0

    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f100389

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->setTitle(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    move-result-object v0

    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f100388

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->setMessage(Ljava/lang/CharSequence;)Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    move-result-object v0

    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f10038d

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lcom/miui/gallery/ui/AlertDialogFragment$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/ui/AlertDialogFragment$Builder;->create()Lcom/miui/gallery/ui/AlertDialogFragment;

    move-result-object v0

    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p0

    const-string v1, "DocumentProviderUtils"

    invoke-virtual {v0, p0, v1}, Lcom/miui/gallery/ui/AlertDialogFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method private static startDocumentTreeIntent(Landroid/app/Activity;I)V
    .locals 1

    if-nez p0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    invoke-static {v0, p1}, Lcom/miui/gallery/ui/DocumentsUIFragment;->newInstance(II)Lcom/miui/gallery/ui/DocumentsUIFragment;

    move-result-object p1

    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p0

    const-string v0, "DocumentsUIFragment"

    invoke-virtual {p1, p0, v0}, Lcom/miui/gallery/ui/DocumentsUIFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method public static startExtSDCardPermissionActivityForResult(Landroid/app/Activity;)V
    .locals 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x18
    .end annotation

    invoke-static {}, Lcom/miui/gallery/util/StorageUtils;->getSecondaryStoragePath()Ljava/lang/String;

    move-result-object v0

    if-eqz p0, :cond_3

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p0}, Lcom/miui/gallery/util/DocumentProviderUtils;->needRequestExternalSDCardPermission(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_1

    return-void

    :cond_1
    invoke-static {}, Lcom/miui/gallery/preference/BaseGalleryPreferences$BaseDocumentProvider;->getExternalSDCardUri()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    const/4 v1, 0x0

    invoke-static {v1}, Lcom/miui/gallery/preference/DocumentProviderPreference;->setOpenExternalDocumentCount(I)V

    :cond_2
    const/16 v1, 0x2f

    const/16 v2, 0x30

    invoke-static {p0, v0, v1, v2}, Lcom/miui/gallery/util/DocumentProviderUtils;->startPermissionActivityForResult(Landroid/app/Activity;Ljava/lang/String;II)V

    return-void

    :cond_3
    :goto_0
    return-void
.end method

.method public static startFirstEntrancyPermissionActivityForResult(Landroid/app/Activity;)V
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x18
    .end annotation

    if-nez p0, :cond_0

    const-string p0, "DocumentProviderUtils"

    const-string v0, "startExtSDCardPermissionActivityForResult activity null"

    invoke-static {p0, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-static {}, Lcom/miui/gallery/util/StorageUtils;->getSecondaryStoragePath()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x31

    invoke-static {p0, v0, v1, v1}, Lcom/miui/gallery/util/DocumentProviderUtils;->startPermissionActivityForResult(Landroid/app/Activity;Ljava/lang/String;II)V

    return-void
.end method

.method private static startPermissionActivityForResult(Landroid/app/Activity;Ljava/lang/String;II)V
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-gt v0, v1, :cond_0

    invoke-static {}, Lcom/miui/gallery/preference/DocumentProviderPreference;->getOpenExternalDocumentCount()I

    move-result v0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_0

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/util/DocumentProviderUtils;->createAccessIntent(Landroid/app/Activity;Ljava/lang/String;I)V

    return-void

    :cond_0
    invoke-static {p0, p3}, Lcom/miui/gallery/util/DocumentProviderUtils;->startDocumentTreeIntent(Landroid/app/Activity;I)V

    return-void
.end method
