.class Lcom/miui/gallery/ui/GallerySettingsFragment$7;
.super Ljava/lang/Object;
.source "GallerySettingsFragment.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/GallerySettingsFragment;->switchAutoDownload(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/GallerySettingsFragment;

.field final synthetic val$isAutoDownload:Z


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/GallerySettingsFragment;Z)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment$7;->this$0:Lcom/miui/gallery/ui/GallerySettingsFragment;

    iput-boolean p2, p0, Lcom/miui/gallery/ui/GallerySettingsFragment$7;->val$isAutoDownload:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private checkValidTask(Z)Z
    .locals 1

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->isAutoDownload()Z

    move-result v0

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method


# virtual methods
.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 4

    iget-boolean p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment$7;->val$isAutoDownload:Z

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/GallerySettingsFragment$7;->checkValidTask(Z)Z

    move-result p1

    const/4 v0, 0x0

    if-nez p1, :cond_0

    const-string p1, "GallerySettingsFragment"

    const-string v1, "invalid switch download task, old %s, new %s"

    iget-boolean v2, p0, Lcom/miui/gallery/ui/GallerySettingsFragment$7;->val$isAutoDownload:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->isAutoDownload()Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-static {p1, v1, v2, v3}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment$7;->this$0:Lcom/miui/gallery/ui/GallerySettingsFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment$7;->this$0:Lcom/miui/gallery/ui/GallerySettingsFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/GallerySettingsFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    goto :goto_0

    :cond_1
    move-object p1, v0

    :goto_0
    if-eqz p1, :cond_3

    iget-boolean v1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment$7;->val$isAutoDownload:Z

    if-eqz v1, :cond_2

    invoke-static {p1}, Lcom/miui/gallery/cloud/download/BatchDownloadUtil;->cleanDownloadedMark(Landroid/content/Context;)V

    iget-boolean v1, p0, Lcom/miui/gallery/ui/GallerySettingsFragment$7;->val$isAutoDownload:Z

    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/GallerySettingsFragment$7;->checkValidTask(Z)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-static {}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->canAutoDownload()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-static {}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->getInstance()Lcom/miui/gallery/cloud/download/BatchDownloadManager;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v2}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->startBatchDownload(Landroid/content/Context;Z)V

    goto :goto_1

    :cond_2
    invoke-static {}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->getInstance()Lcom/miui/gallery/cloud/download/BatchDownloadManager;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->stopBatchDownload(Landroid/content/Context;)V

    :cond_3
    :goto_1
    return-object v0
.end method
