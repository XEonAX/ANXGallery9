.class public Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;
.super Ljava/lang/Object;
.source "CloudControlStrategyHelper.java"


# direct methods
.method public static getAlbumByPath(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Album;
    .locals 2

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->getInstance()Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    move-result-object v0

    const-string v1, "album-list"

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->queryFeatureStrategy(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p0}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy;->getAlbumByPath(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$Album;

    move-result-object p0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method

.method public static getAlbumPatterns()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy$AlbumPattern;",
            ">;"
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->getInstance()Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    move-result-object v0

    const-string v1, "album-list"

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->queryFeatureStrategy(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy;->getAlbumPatterns()Ljava/util/List;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public static getAlbumWhiteListPatterns()Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/util/regex/Pattern;",
            ">;"
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->getInstance()Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    move-result-object v0

    const-string v1, "album-list"

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->queryFeatureStrategy(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy;->getWhiteListPatterns()Ljava/util/ArrayList;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public static getAlbumsInWhiteList()Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->getInstance()Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    move-result-object v0

    const-string v1, "album-list"

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->queryFeatureStrategy(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumsStrategy;->getAlbumsInWhiteList()Ljava/util/ArrayList;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public static getAssistantScenarioStrategy()Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy;
    .locals 2

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->getInstance()Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    move-result-object v0

    const-string v1, "assistant-rules"

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->queryFeatureStrategy(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy;

    return-object v0
.end method

.method public static getComponentPriority()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Priority;",
            ">;"
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->getInstance()Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    move-result-object v0

    const-string v1, "components-list"

    sget-object v2, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;->CLOUD_FIRST_MERGER:Lcom/miui/gallery/cloudcontrol/Merger;

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->queryFeatureStrategy(Ljava/lang/String;Lcom/miui/gallery/cloudcontrol/Merger;)Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;->createDefault()Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;

    move-result-object v0

    :cond_0
    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;->getComponentPriority()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static getCreationStrategy()Lcom/miui/gallery/cloudcontrol/strategies/CreationStrategy;
    .locals 2

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->getInstance()Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    move-result-object v0

    const-string v1, "creation"

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->queryFeatureStrategy(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/cloudcontrol/strategies/CreationStrategy;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/cloudcontrol/strategies/CreationStrategy;->createDefault()Lcom/miui/gallery/cloudcontrol/strategies/CreationStrategy;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public static getFileSizeLimitStrategy()Lcom/miui/gallery/cloudcontrol/strategies/ScannerStrategy$FileSizeLimitStrategy;
    .locals 3

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->getInstance()Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    move-result-object v0

    const-string v1, "media_scanner"

    sget-object v2, Lcom/miui/gallery/cloudcontrol/strategies/ScannerStrategy;->CLOUD_FIRST_MERGER:Lcom/miui/gallery/cloudcontrol/Merger;

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->queryFeatureStrategy(Ljava/lang/String;Lcom/miui/gallery/cloudcontrol/Merger;)Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/cloudcontrol/strategies/ScannerStrategy;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/strategies/ScannerStrategy;->createDefault()Lcom/miui/gallery/cloudcontrol/strategies/ScannerStrategy;

    move-result-object v0

    :cond_0
    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/strategies/ScannerStrategy;->getFileSizeStrategy()Lcom/miui/gallery/cloudcontrol/strategies/ScannerStrategy$FileSizeLimitStrategy;

    move-result-object v0

    return-object v0
.end method

.method public static getHiddenAlbums()Lcom/miui/gallery/cloudcontrol/strategies/HiddenAlbumsStrategy;
    .locals 2

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->getInstance()Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    move-result-object v0

    const-string v1, "hidden-albums"

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->queryFeatureStrategy(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/cloudcontrol/strategies/HiddenAlbumsStrategy;

    return-object v0
.end method

.method public static getIgnoreAlbumVersion()I
    .locals 1

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getIgnoreAlbums()Lcom/miui/gallery/cloudcontrol/strategies/IgnoreAlbumsStrategy;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/strategies/IgnoreAlbumsStrategy;->getVersion()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public static getIgnoreAlbums()Lcom/miui/gallery/cloudcontrol/strategies/IgnoreAlbumsStrategy;
    .locals 2

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->getInstance()Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    move-result-object v0

    const-string v1, "ignore-albums"

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->queryFeatureStrategy(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/cloudcontrol/strategies/IgnoreAlbumsStrategy;

    return-object v0
.end method

.method public static getLocationStrategy()Lcom/miui/gallery/cloudcontrol/strategies/LocationStrategy;
    .locals 2

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->getInstance()Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    move-result-object v0

    const-string v1, "location"

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->queryFeatureStrategy(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/cloudcontrol/strategies/LocationStrategy;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/strategies/LocationStrategy;->createDefault()Lcom/miui/gallery/cloudcontrol/strategies/LocationStrategy;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public static getPhotoPrintStrategy()Lcom/miui/gallery/cloudcontrol/strategies/PhotoPrintStrategy;
    .locals 2

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->getInstance()Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    move-result-object v0

    const-string v1, "photo-print"

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->queryFeatureStrategy(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/cloudcontrol/strategies/PhotoPrintStrategy;

    return-object v0
.end method

.method public static getPrintPackageName()Ljava/lang/String;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getPhotoPrintStrategy()Lcom/miui/gallery/cloudcontrol/strategies/PhotoPrintStrategy;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/strategies/PhotoPrintStrategy;->getPhotoPrintPackageName()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public static getSearchStrategy()Lcom/miui/gallery/cloudcontrol/strategies/SearchStrategy;
    .locals 2

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->getInstance()Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    move-result-object v0

    const-string v1, "search"

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->queryFeatureStrategy(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/cloudcontrol/strategies/SearchStrategy;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/strategies/SearchStrategy;->createDefault()Lcom/miui/gallery/cloudcontrol/strategies/SearchStrategy;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public static getServerReservedAlbumNamesStrategy()Lcom/miui/gallery/cloudcontrol/strategies/ServerReservedAlbumNamesStrategy;
    .locals 2

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->getInstance()Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    move-result-object v0

    const-string v1, "server-reserved-album-names"

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->queryFeatureStrategy(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/cloudcontrol/strategies/ServerReservedAlbumNamesStrategy;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/strategies/ServerReservedAlbumNamesStrategy;->createDefault()Lcom/miui/gallery/cloudcontrol/strategies/ServerReservedAlbumNamesStrategy;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public static getServerUnModifyAlbumsStrategy()Lcom/miui/gallery/cloudcontrol/strategies/ServerUnModifyAlbumsStrategy;
    .locals 2

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->getInstance()Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    move-result-object v0

    const-string v1, "server-unmodify-albums"

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->queryFeatureStrategy(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/cloudcontrol/strategies/ServerUnModifyAlbumsStrategy;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/strategies/ServerUnModifyAlbumsStrategy;->getAlbums()Ljava/util/List;

    move-result-object v1

    if-nez v1, :cond_1

    :cond_0
    invoke-static {}, Lcom/miui/gallery/cloudcontrol/strategies/ServerUnModifyAlbumsStrategy;->createDefault()Lcom/miui/gallery/cloudcontrol/strategies/ServerUnModifyAlbumsStrategy;

    move-result-object v0

    :cond_1
    return-object v0
.end method

.method public static getShareComponents()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Component;",
            ">;"
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->getInstance()Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    move-result-object v0

    const-string v1, "components-list"

    sget-object v2, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;->CLOUD_FIRST_MERGER:Lcom/miui/gallery/cloudcontrol/Merger;

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->queryFeatureStrategy(Ljava/lang/String;Lcom/miui/gallery/cloudcontrol/Merger;)Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;->createDefault()Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;

    move-result-object v0

    :cond_0
    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;->getShareComponents()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public static getSpecialTypeMediaStrategy()Lcom/miui/gallery/cloudcontrol/strategies/ScannerStrategy$SpecialTypeMediaStrategy;
    .locals 3

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->getInstance()Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    move-result-object v0

    const-string v1, "media_scanner"

    sget-object v2, Lcom/miui/gallery/cloudcontrol/strategies/ScannerStrategy;->CLOUD_FIRST_MERGER:Lcom/miui/gallery/cloudcontrol/Merger;

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->queryFeatureStrategy(Ljava/lang/String;Lcom/miui/gallery/cloudcontrol/Merger;)Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/cloudcontrol/strategies/ScannerStrategy;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/strategies/ScannerStrategy;->createDefault()Lcom/miui/gallery/cloudcontrol/strategies/ScannerStrategy;

    move-result-object v0

    :cond_0
    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/strategies/ScannerStrategy;->getSpecialTypeMediaStrategy()Lcom/miui/gallery/cloudcontrol/strategies/ScannerStrategy$SpecialTypeMediaStrategy;

    move-result-object v0

    return-object v0
.end method

.method public static getStreamFileStrategy()Lcom/miui/gallery/cloudcontrol/strategies/ScannerStrategy$StreamFileStrategy;
    .locals 3

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->getInstance()Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    move-result-object v0

    const-string v1, "media_scanner"

    sget-object v2, Lcom/miui/gallery/cloudcontrol/strategies/ScannerStrategy;->CLOUD_FIRST_MERGER:Lcom/miui/gallery/cloudcontrol/Merger;

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->queryFeatureStrategy(Ljava/lang/String;Lcom/miui/gallery/cloudcontrol/Merger;)Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/cloudcontrol/strategies/ScannerStrategy;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/strategies/ScannerStrategy;->createDefault()Lcom/miui/gallery/cloudcontrol/strategies/ScannerStrategy;

    move-result-object v0

    :cond_0
    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/strategies/ScannerStrategy;->getStreamFileStrategy()Lcom/miui/gallery/cloudcontrol/strategies/ScannerStrategy$StreamFileStrategy;

    move-result-object v0

    return-object v0
.end method

.method public static getSyncStrategy()Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;
    .locals 2

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->getInstance()Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    move-result-object v0

    const-string v1, "sync"

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->queryFeatureStrategy(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->createDefault()Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public static getUploadSupportedFileTypes()Ljava/util/HashMap;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->getInstance()Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    move-result-object v0

    const-string v1, "upload-supported-file-types"

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->queryFeatureStrategy(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy;->createDefault()Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy;

    move-result-object v0

    :cond_0
    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/strategies/UploadSupportedFileTypeStrategy;->getSupportedFileTypeMap()Ljava/util/HashMap;

    move-result-object v0

    return-object v0
.end method

.method public static isGlobalSecretVideoSupported()Z
    .locals 2

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->getInstance()Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    move-result-object v0

    const-string v1, "feature-switch"

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->queryFeatureStrategy(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/cloudcontrol/strategies/FeatureSwitchStrategy;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/strategies/FeatureSwitchStrategy;->createDefault()Lcom/miui/gallery/cloudcontrol/strategies/FeatureSwitchStrategy;

    move-result-object v0

    :cond_0
    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/strategies/FeatureSwitchStrategy;->isGlobalSecretVideoSupported()Z

    move-result v0

    return v0
.end method
