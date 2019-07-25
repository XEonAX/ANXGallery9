.class public Lcom/miui/gallery/cloudcontrol/strategies/SearchStrategy;
.super Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;
.source "SearchStrategy.java"


# instance fields
.field private mAIAlbum:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "search-data"
    .end annotation
.end field

.field private mAIAlbumEnabled:Z

.field private mSearchBar:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "search-box"
    .end annotation
.end field

.field private mSearchBarEnabled:Z


# direct methods
.method public constructor <init>(ZZ)V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;-><init>()V

    sget-object v0, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->UNAVAILABLE:Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->getValue()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SearchStrategy;->mSearchBar:Ljava/lang/String;

    sget-object v0, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->UNAVAILABLE:Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->getValue()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SearchStrategy;->mAIAlbum:Ljava/lang/String;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SearchStrategy;->mSearchBarEnabled:Z

    iput-boolean v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SearchStrategy;->mAIAlbumEnabled:Z

    iput-boolean p1, p0, Lcom/miui/gallery/cloudcontrol/strategies/SearchStrategy;->mSearchBarEnabled:Z

    iput-boolean p2, p0, Lcom/miui/gallery/cloudcontrol/strategies/SearchStrategy;->mAIAlbumEnabled:Z

    return-void
.end method

.method public static createDefault()Lcom/miui/gallery/cloudcontrol/strategies/SearchStrategy;
    .locals 2

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->getInstance()Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    move-result-object v0

    const-string v1, "search"

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->queryFeatureStatus(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->ENABLE:Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    new-instance v1, Lcom/miui/gallery/cloudcontrol/strategies/SearchStrategy;

    invoke-direct {v1, v0, v0}, Lcom/miui/gallery/cloudcontrol/strategies/SearchStrategy;-><init>(ZZ)V

    return-object v1
.end method


# virtual methods
.method public doAdditionalProcessing()V
    .locals 2

    sget-object v0, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->ENABLE:Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->getValue()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/SearchStrategy;->mAIAlbum:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SearchStrategy;->mAIAlbumEnabled:Z

    iget-boolean v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SearchStrategy;->mAIAlbumEnabled:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->ENABLE:Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->getValue()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/SearchStrategy;->mSearchBar:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SearchStrategy;->mSearchBarEnabled:Z

    return-void
.end method

.method public isAIAlbumEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SearchStrategy;->mAIAlbumEnabled:Z

    return v0
.end method

.method public isSearchBarEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/SearchStrategy;->mSearchBarEnabled:Z

    return v0
.end method
