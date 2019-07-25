.class public Lcom/miui/gallery/search/core/source/SearchableSources;
.super Ljava/lang/Object;
.source "SearchableSources.java"

# interfaces
.implements Lcom/miui/gallery/search/core/source/Sources;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private mSources:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/search/core/source/Source;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/search/core/source/SearchableSources;->mContext:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method protected addHintSources()V
    .locals 2

    new-instance v0, Lcom/miui/gallery/search/core/source/server/HintSource;

    iget-object v1, p0, Lcom/miui/gallery/search/core/source/SearchableSources;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/miui/gallery/search/core/source/server/HintSource;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/core/source/SearchableSources;->addSource(Lcom/miui/gallery/search/core/source/Source;)V

    return-void
.end method

.method protected addHistorySources()V
    .locals 2

    new-instance v0, Lcom/miui/gallery/search/history/HistorySource;

    iget-object v1, p0, Lcom/miui/gallery/search/core/source/SearchableSources;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/miui/gallery/search/history/HistorySource;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/core/source/SearchableSources;->addSource(Lcom/miui/gallery/search/core/source/Source;)V

    return-void
.end method

.method protected addLocalSources()V
    .locals 2

    new-instance v0, Lcom/miui/gallery/search/core/source/local/AlbumSource;

    iget-object v1, p0, Lcom/miui/gallery/search/core/source/SearchableSources;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/miui/gallery/search/core/source/local/AlbumSource;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/core/source/SearchableSources;->addSource(Lcom/miui/gallery/search/core/source/Source;)V

    new-instance v0, Lcom/miui/gallery/search/core/source/local/AppScreenshotSource;

    iget-object v1, p0, Lcom/miui/gallery/search/core/source/SearchableSources;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/miui/gallery/search/core/source/local/AppScreenshotSource;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/core/source/SearchableSources;->addSource(Lcom/miui/gallery/search/core/source/Source;)V

    return-void
.end method

.method protected addNavigationSources()V
    .locals 2

    new-instance v0, Lcom/miui/gallery/search/core/source/server/NavigationSource;

    iget-object v1, p0, Lcom/miui/gallery/search/core/source/SearchableSources;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/miui/gallery/search/core/source/server/NavigationSource;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/core/source/SearchableSources;->addSource(Lcom/miui/gallery/search/core/source/Source;)V

    return-void
.end method

.method protected addResultSources()V
    .locals 2

    new-instance v0, Lcom/miui/gallery/search/core/source/server/ResultSource;

    iget-object v1, p0, Lcom/miui/gallery/search/core/source/SearchableSources;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/miui/gallery/search/core/source/server/ResultSource;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/core/source/SearchableSources;->addSource(Lcom/miui/gallery/search/core/source/Source;)V

    new-instance v0, Lcom/miui/gallery/search/core/source/server/DataListSource;

    iget-object v1, p0, Lcom/miui/gallery/search/core/source/SearchableSources;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/miui/gallery/search/core/source/server/DataListSource;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/core/source/SearchableSources;->addSource(Lcom/miui/gallery/search/core/source/Source;)V

    new-instance v0, Lcom/miui/gallery/search/core/source/server/FeedbackLikelyListSource;

    iget-object v1, p0, Lcom/miui/gallery/search/core/source/SearchableSources;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/miui/gallery/search/core/source/server/FeedbackLikelyListSource;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/core/source/SearchableSources;->addSource(Lcom/miui/gallery/search/core/source/Source;)V

    return-void
.end method

.method protected addSource(Lcom/miui/gallery/search/core/source/Source;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/search/core/source/SearchableSources;->mSources:Ljava/util/HashMap;

    invoke-interface {p1}, Lcom/miui/gallery/search/core/source/Source;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method protected addSuggestionSources()V
    .locals 2

    new-instance v0, Lcom/miui/gallery/search/core/source/server/SearchSource;

    iget-object v1, p0, Lcom/miui/gallery/search/core/source/SearchableSources;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/miui/gallery/search/core/source/server/SearchSource;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/core/source/SearchableSources;->addSource(Lcom/miui/gallery/search/core/source/Source;)V

    return-void
.end method

.method public getSources()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Lcom/miui/gallery/search/core/source/Source;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/search/core/source/SearchableSources;->mSources:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method

.method public update()V
    .locals 2

    const-string v0, "SearchableSources"

    const-string v1, "update()"

    invoke-static {v0, v1}, Lcom/miui/gallery/search/utils/SearchLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/search/core/source/SearchableSources;->mSources:Ljava/util/HashMap;

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/source/SearchableSources;->addHintSources()V

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/source/SearchableSources;->addNavigationSources()V

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/source/SearchableSources;->addResultSources()V

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/source/SearchableSources;->addSuggestionSources()V

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/source/SearchableSources;->addHistorySources()V

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/source/SearchableSources;->addLocalSources()V

    return-void
.end method
