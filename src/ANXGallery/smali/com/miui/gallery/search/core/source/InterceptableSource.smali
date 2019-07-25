.class public abstract Lcom/miui/gallery/search/core/source/InterceptableSource;
.super Lcom/miui/gallery/search/core/source/AbstractSource;
.source "InterceptableSource.java"


# instance fields
.field protected mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/search/core/source/AbstractSource;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/search/core/source/InterceptableSource;->mContext:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method protected abstract doGetSuggestions(Lcom/miui/gallery/search/core/QueryInfo;)Lcom/miui/gallery/search/core/result/SourceResult;
.end method

.method protected generateDefaultResult(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)Lcom/miui/gallery/search/core/result/BaseSourceResult;
    .locals 1

    new-instance v0, Lcom/miui/gallery/search/core/result/BaseSourceResult;

    invoke-direct {v0, p1, p0, p2}, Lcom/miui/gallery/search/core/result/BaseSourceResult;-><init>(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/source/Source;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)V

    return-object v0
.end method

.method protected getPrejudgeResult(Lcom/miui/gallery/search/core/QueryInfo;)Lcom/miui/gallery/search/core/result/SourceResult;
    .locals 5

    const/4 v0, 0x3

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/search/core/source/InterceptableSource;->isFatalCondition(Lcom/miui/gallery/search/core/QueryInfo;I)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/miui/gallery/search/utils/SearchUtils;->getXiaomiId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0, p1, v2}, Lcom/miui/gallery/search/core/source/InterceptableSource;->generateDefaultResult(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)Lcom/miui/gallery/search/core/result/BaseSourceResult;

    move-result-object p1

    new-instance v1, Lcom/miui/gallery/search/core/result/ErrorInfo;

    invoke-direct {v1, v0}, Lcom/miui/gallery/search/core/result/ErrorInfo;-><init>(I)V

    invoke-virtual {p1, v1}, Lcom/miui/gallery/search/core/result/BaseSourceResult;->setErrorInfo(Lcom/miui/gallery/search/core/result/ErrorInfo;)V

    return-object p1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/core/source/InterceptableSource;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/miui/gallery/util/PrivacyAgreementUtils;->isCloudServiceAgreementEnable(Landroid/content/Context;)Z

    move-result v0

    const/4 v1, 0x4

    if-nez v0, :cond_1

    invoke-virtual {p0, p1, v2}, Lcom/miui/gallery/search/core/source/InterceptableSource;->generateDefaultResult(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)Lcom/miui/gallery/search/core/result/BaseSourceResult;

    move-result-object p1

    new-instance v0, Lcom/miui/gallery/search/core/result/ErrorInfo;

    invoke-direct {v0, v1}, Lcom/miui/gallery/search/core/result/ErrorInfo;-><init>(I)V

    invoke-virtual {p1, v0}, Lcom/miui/gallery/search/core/result/BaseSourceResult;->setErrorInfo(Lcom/miui/gallery/search/core/result/ErrorInfo;)V

    return-object p1

    :cond_1
    const/16 v0, 0xa

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/search/core/source/InterceptableSource;->isFatalCondition(Lcom/miui/gallery/search/core/QueryInfo;I)Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_4

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sIsFirstSynced()Z

    move-result v3

    if-nez v3, :cond_4

    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isNetworkConnected()Z

    move-result v3

    if-nez v3, :cond_2

    invoke-virtual {p0, p1, v2}, Lcom/miui/gallery/search/core/source/InterceptableSource;->generateDefaultResult(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)Lcom/miui/gallery/search/core/result/BaseSourceResult;

    move-result-object p1

    new-instance v0, Lcom/miui/gallery/search/core/result/ErrorInfo;

    invoke-direct {v0, v4}, Lcom/miui/gallery/search/core/result/ErrorInfo;-><init>(I)V

    invoke-virtual {p1, v0}, Lcom/miui/gallery/search/core/result/BaseSourceResult;->setErrorInfo(Lcom/miui/gallery/search/core/result/ErrorInfo;)V

    return-object p1

    :cond_2
    iget-object v3, p0, Lcom/miui/gallery/search/core/source/InterceptableSource;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/miui/gallery/util/SyncUtil;->isGalleryCloudSyncable(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-virtual {p0, p1, v2}, Lcom/miui/gallery/search/core/source/InterceptableSource;->generateDefaultResult(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)Lcom/miui/gallery/search/core/result/BaseSourceResult;

    move-result-object p1

    new-instance v1, Lcom/miui/gallery/search/core/result/ErrorInfo;

    invoke-direct {v1, v0}, Lcom/miui/gallery/search/core/result/ErrorInfo;-><init>(I)V

    invoke-virtual {p1, v1}, Lcom/miui/gallery/search/core/result/BaseSourceResult;->setErrorInfo(Lcom/miui/gallery/search/core/result/ErrorInfo;)V

    return-object p1

    :cond_3
    invoke-virtual {p0, p1, v2}, Lcom/miui/gallery/search/core/source/InterceptableSource;->generateDefaultResult(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)Lcom/miui/gallery/search/core/result/BaseSourceResult;

    move-result-object p1

    new-instance v0, Lcom/miui/gallery/search/core/result/ErrorInfo;

    invoke-direct {v0, v1}, Lcom/miui/gallery/search/core/result/ErrorInfo;-><init>(I)V

    invoke-virtual {p1, v0}, Lcom/miui/gallery/search/core/result/BaseSourceResult;->setErrorInfo(Lcom/miui/gallery/search/core/result/ErrorInfo;)V

    return-object p1

    :cond_4
    const/16 v0, 0xc

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/search/core/source/InterceptableSource;->isFatalCondition(Lcom/miui/gallery/search/core/QueryInfo;I)Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-static {v4}, Lcom/miui/gallery/ui/AIAlbumStatusHelper;->isLocalSearchOpen(Z)Z

    move-result v1

    if-nez v1, :cond_5

    invoke-virtual {p0, p1, v2}, Lcom/miui/gallery/search/core/source/InterceptableSource;->generateDefaultResult(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)Lcom/miui/gallery/search/core/result/BaseSourceResult;

    move-result-object p1

    new-instance v1, Lcom/miui/gallery/search/core/result/ErrorInfo;

    invoke-direct {v1, v0}, Lcom/miui/gallery/search/core/result/ErrorInfo;-><init>(I)V

    invoke-virtual {p1, v1}, Lcom/miui/gallery/search/core/result/BaseSourceResult;->setErrorInfo(Lcom/miui/gallery/search/core/result/ErrorInfo;)V

    return-object p1

    :cond_5
    const/16 v0, 0xd

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/search/core/source/InterceptableSource;->isFatalCondition(Lcom/miui/gallery/search/core/QueryInfo;I)Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-static {}, Lcom/miui/gallery/ui/AIAlbumStatusHelper;->isCloudControlSearchAIAlbumOpen()Z

    move-result v1

    if-nez v1, :cond_6

    invoke-virtual {p0, p1, v2}, Lcom/miui/gallery/search/core/source/InterceptableSource;->generateDefaultResult(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)Lcom/miui/gallery/search/core/result/BaseSourceResult;

    move-result-object p1

    new-instance v1, Lcom/miui/gallery/search/core/result/ErrorInfo;

    invoke-direct {v1, v0}, Lcom/miui/gallery/search/core/result/ErrorInfo;-><init>(I)V

    invoke-virtual {p1, v1}, Lcom/miui/gallery/search/core/result/BaseSourceResult;->setErrorInfo(Lcom/miui/gallery/search/core/result/ErrorInfo;)V

    return-object p1

    :cond_6
    const/16 v0, 0xe

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/search/core/source/InterceptableSource;->isFatalCondition(Lcom/miui/gallery/search/core/QueryInfo;I)Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-static {}, Lcom/miui/gallery/ui/AIAlbumStatusHelper;->isCloudControlSearchBarOpen()Z

    move-result v1

    if-nez v1, :cond_7

    invoke-virtual {p0, p1, v2}, Lcom/miui/gallery/search/core/source/InterceptableSource;->generateDefaultResult(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)Lcom/miui/gallery/search/core/result/BaseSourceResult;

    move-result-object p1

    new-instance v1, Lcom/miui/gallery/search/core/result/ErrorInfo;

    invoke-direct {v1, v0}, Lcom/miui/gallery/search/core/result/ErrorInfo;-><init>(I)V

    invoke-virtual {p1, v1}, Lcom/miui/gallery/search/core/result/BaseSourceResult;->setErrorInfo(Lcom/miui/gallery/search/core/result/ErrorInfo;)V

    return-object p1

    :cond_7
    return-object v2
.end method

.method public getSuggestions(Lcom/miui/gallery/search/core/QueryInfo;)Lcom/miui/gallery/search/core/result/SourceResult;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/core/source/InterceptableSource;->getPrejudgeResult(Lcom/miui/gallery/search/core/QueryInfo;)Lcom/miui/gallery/search/core/result/SourceResult;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/core/source/InterceptableSource;->doGetSuggestions(Lcom/miui/gallery/search/core/QueryInfo;)Lcom/miui/gallery/search/core/result/SourceResult;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic getSuggestions(Lcom/miui/gallery/search/core/QueryInfo;)Lcom/miui/gallery/search/core/result/SuggestionResult;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/core/source/InterceptableSource;->getSuggestions(Lcom/miui/gallery/search/core/QueryInfo;)Lcom/miui/gallery/search/core/result/SourceResult;

    move-result-object p1

    return-object p1
.end method

.method protected isFatalCondition(Lcom/miui/gallery/search/core/QueryInfo;I)Z
    .locals 0

    const/16 p1, 0xc

    if-ne p2, p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method
