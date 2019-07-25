.class public Lcom/miui/gallery/video/editor/manager/SmartEffectManager;
.super Ljava/lang/Object;
.source "SmartEffectManager.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public initDataWithTemplate(Ljava/util/List;Ljava/util/ArrayList;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexTemplateManager$Template;",
            ">;",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/video/editor/SmartEffect;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nexstreaming/nexeditorsdk/nexTemplateManager$Template;

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexTemplateManager$Template;->packageInfo()Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Asset;

    move-result-object v1

    invoke-interface {v1}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Asset;->assetIdx()I

    move-result v1

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexTemplateManager$Template;->packageInfo()Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Asset;

    move-result-object v2

    invoke-interface {v2}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Asset;->assetId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexTemplateManager$Template;->id()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_2
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/miui/gallery/video/editor/SmartEffect;

    if-nez v6, :cond_3

    goto :goto_1

    :cond_3
    invoke-virtual {v6}, Lcom/miui/gallery/video/editor/SmartEffect;->getAssetName()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_2

    invoke-virtual {v6}, Lcom/miui/gallery/video/editor/SmartEffect;->getAssetName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-virtual {v6}, Lcom/miui/gallery/video/editor/SmartEffect;->getAssetName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-virtual {v6}, Lcom/miui/gallery/video/editor/SmartEffect;->getAssetId()I

    move-result v7

    if-ne v1, v7, :cond_2

    const/16 v1, 0x11

    invoke-virtual {v6, v1}, Lcom/miui/gallery/video/editor/SmartEffect;->setDownloadState(I)V

    invoke-virtual {v6, v0}, Lcom/miui/gallery/video/editor/SmartEffect;->setTemplate(Lcom/nexstreaming/nexeditorsdk/nexTemplateManager$Template;)V

    const/4 v4, 0x0

    :cond_4
    if-eqz v4, :cond_0

    invoke-static {}, Lcom/miui/gallery/video/editor/manager/NexAssetTemplateManager;->getInstance()Lcom/miui/gallery/video/editor/manager/NexAssetTemplateManager;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/miui/gallery/video/editor/manager/NexAssetTemplateManager;->uninstallPackageById(Ljava/lang/String;)V

    goto :goto_0

    :cond_5
    return-void
.end method

.method public updateDataWithTemplate(Ljava/util/List;Lcom/miui/gallery/video/editor/SmartEffect;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/nexstreaming/nexeditorsdk/nexTemplateManager$Template;",
            ">;",
            "Lcom/miui/gallery/video/editor/SmartEffect;",
            ")V"
        }
    .end annotation

    if-eqz p2, :cond_4

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nexstreaming/nexeditorsdk/nexTemplateManager$Template;

    if-nez v0, :cond_2

    return-void

    :cond_2
    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexTemplateManager$Template;->packageInfo()Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Asset;

    move-result-object v1

    invoke-interface {v1}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Asset;->assetIdx()I

    move-result v1

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexTemplateManager$Template;->packageInfo()Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Asset;

    move-result-object v2

    invoke-interface {v2}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager$Asset;->assetId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexTemplateManager$Template;->id()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2}, Lcom/miui/gallery/video/editor/SmartEffect;->getAssetName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    invoke-virtual {p2}, Lcom/miui/gallery/video/editor/SmartEffect;->getAssetName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {p2}, Lcom/miui/gallery/video/editor/SmartEffect;->getAssetName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p2}, Lcom/miui/gallery/video/editor/SmartEffect;->getAssetId()I

    move-result v2

    if-ne v1, v2, :cond_1

    const/4 p1, 0x0

    invoke-virtual {p2, p1}, Lcom/miui/gallery/video/editor/SmartEffect;->setDownloadState(I)V

    invoke-virtual {p2, v0}, Lcom/miui/gallery/video/editor/SmartEffect;->setTemplate(Lcom/nexstreaming/nexeditorsdk/nexTemplateManager$Template;)V

    return-void

    :cond_3
    return-void

    :cond_4
    :goto_0
    return-void
.end method
