.class public Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;
.super Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter;
.source "ImageResultSimpleAdapter.java"

# interfaces
.implements Lcom/miui/gallery/adapter/CheckableAdapter;


# instance fields
.field private INDEX_CLOUD_ID:I

.field private INDEX_CREATE_TIME:I

.field private INDEX_DURATION:I

.field private INDEX_IS_FAVORITE:I

.field private INDEX_LOCATION:I

.field private INDEX_MICRO_THUMBNAIL_PATH:I

.field private INDEX_MIME_TYPE:I

.field private INDEX_ORIGINAL_PATH:I

.field private INDEX_SERVER_ID:I

.field private INDEX_SHA1:I

.field private INDEX_SIZE:I

.field private INDEX_SPECIAL_TYPE_FLAGS:I

.field private INDEX_SYNC_STATE:I

.field private INDEX_THUMBNAIL_PATH:I

.field private mCheckable:Z

.field private mLoadMoreRequested:Z

.field private mNextLoadEnable:Z

.field protected mQueryInfo:Lcom/miui/gallery/search/core/QueryInfo;

.field protected mRankInfo:Lcom/miui/gallery/search/core/suggestion/RankInfo;

.field private mRequestLoadMoreListener:Lcom/miui/gallery/search/core/display/RequestLoadMoreListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->mNextLoadEnable:Z

    iput-boolean p1, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->mLoadMoreRequested:Z

    return-void
.end method

.method private getSuggestionCursorByPosition(I)Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    return-object p1
.end method

.method private requestLoadMoreIfNeeded()V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->mNextLoadEnable:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->mRequestLoadMoreListener:Lcom/miui/gallery/search/core/display/RequestLoadMoreListener;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->mLoadMoreRequested:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->mLoadMoreRequested:Z

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->mRequestLoadMoreListener:Lcom/miui/gallery/search/core/display/RequestLoadMoreListener;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/display/RequestLoadMoreListener;->onLoadMoreRequested()V

    :cond_0
    return-void
.end method


# virtual methods
.method public changeSuggestions(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/RankInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->mQueryInfo:Lcom/miui/gallery/search/core/QueryInfo;

    iput-object p2, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->mRankInfo:Lcom/miui/gallery/search/core/suggestion/RankInfo;

    invoke-virtual {p0, p3}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    return-void
.end method

.method public closeLoadMore()V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->mNextLoadEnable:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iput-boolean v1, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->mNextLoadEnable:Z

    :cond_0
    iput-boolean v1, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->mLoadMoreRequested:Z

    return-void
.end method

.method public doBindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 8

    check-cast p1, Lcom/miui/gallery/ui/MicroThumbGridItem;

    invoke-interface {p3}, Landroid/database/Cursor;->getPosition()I

    move-result v6

    invoke-virtual {p0, v6}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getLocalPath(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v6}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getDownloadUri(I)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {p0, v6}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getDisplayImageOptions(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v2

    invoke-virtual {p1, v0, v1, v2}, Lcom/miui/gallery/ui/MicroThumbGridItem;->bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    iget v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->INDEX_MIME_TYPE:I

    invoke-interface {p3, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    iget v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->INDEX_DURATION:I

    invoke-interface {p3, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    iget v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->INDEX_SPECIAL_TYPE_FLAGS:I

    invoke-interface {p3, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    move-object v0, p1

    move-object v1, v7

    invoke-virtual/range {v0 .. v5}, Lcom/miui/gallery/ui/MicroThumbGridItem;->bindIndicator(Ljava/lang/String;JJ)V

    invoke-virtual {p0, v6}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->isFavorite(I)Z

    move-result v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/MicroThumbGridItem;->bindFavoriteIndicator(Z)V

    iget-boolean v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->mCheckable:Z

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/MicroThumbGridItem;->setCheckable(Z)V

    iget v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->INDEX_CREATE_TIME:I

    invoke-interface {p3, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    iget v2, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->INDEX_LOCATION:I

    invoke-interface {p3, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, v0, v1, p3, v7}, Lcom/miui/gallery/util/TalkBackUtil;->getContentDescriptionForImage(Landroid/content/Context;JLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/MicroThumbGridItem;->setContentDescription(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getCount()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    if-ne v6, p1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->requestLoadMoreIfNeeded()V

    :cond_0
    return-void
.end method

.method public getCheckableView(Landroid/view/View;)Landroid/view/View;
    .locals 0

    check-cast p1, Lcom/miui/gallery/ui/HomePageGridItem;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/HomePageGridItem;->getCheckBox()Landroid/widget/CheckBox;

    move-result-object p1

    return-object p1
.end method

.method protected getDisplayImageOptions(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->mRankInfo:Lcom/miui/gallery/search/core/suggestion/RankInfo;

    invoke-static {v0}, Lcom/miui/gallery/search/SearchConstants;->isHorizontalDocumentStyle(Lcom/miui/gallery/search/core/suggestion/RankInfo;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->mDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheThumbnail(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->mDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->loadFromMicroCache(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->mDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheInMemory(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->mDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-virtual {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p1

    return-object p1

    :cond_0
    invoke-super {p0, p1}, Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter;->getDisplayImageOptions(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p1

    return-object p1
.end method

.method public getDownloadUri(I)Landroid/net/Uri;
    .locals 3

    invoke-direct {p0, p1}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getSuggestionCursorByPosition(I)Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object v0

    iget v1, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->INDEX_SYNC_STATE:I

    invoke-interface {v0, v1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getInt(I)I

    move-result v0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getItemKey(I)J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getDownloadUri(IJ)Landroid/net/Uri;

    move-result-object p1

    return-object p1
.end method

.method public getFileLength(I)J
    .locals 2

    invoke-direct {p0, p1}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getSuggestionCursorByPosition(I)Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object p1

    iget v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->INDEX_SIZE:I

    invoke-interface {p1, v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getImageIds()Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getResultCursor()Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;->getImageIds()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getItemKey(I)J
    .locals 2

    invoke-direct {p0, p1}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getSuggestionCursorByPosition(I)Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object p1

    iget v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->INDEX_CLOUD_ID:I

    invoke-interface {p1, v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getLocalPath(I)Ljava/lang/String;
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getSuggestionCursorByPosition(I)Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object p1

    iget v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->INDEX_MICRO_THUMBNAIL_PATH:I

    invoke-interface {p1, v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getMicroThumbFilePath(I)Ljava/lang/String;
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getSuggestionCursorByPosition(I)Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object p1

    iget v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->INDEX_MICRO_THUMBNAIL_PATH:I

    invoke-interface {p1, v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getMicroThumbnailSize()Lcom/nostra13/universalimageloader/core/assist/ImageSize;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->mRankInfo:Lcom/miui/gallery/search/core/suggestion/RankInfo;

    invoke-static {v0}, Lcom/miui/gallery/search/SearchConstants;->isHorizontalDocumentStyle(Lcom/miui/gallery/search/core/suggestion/RankInfo;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v0

    iget-object v0, v0, Lcom/miui/gallery/Config$ThumbConfig;->sMicroHorizontalDocumentTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    return-object v0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v0

    iget-object v0, v0, Lcom/miui/gallery/Config$ThumbConfig;->sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    return-object v0
.end method

.method public getMimeType(I)Ljava/lang/String;
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getSuggestionCursorByPosition(I)Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object p1

    iget v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->INDEX_MIME_TYPE:I

    invoke-interface {p1, v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getOriginFilePath(I)Ljava/lang/String;
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getSuggestionCursorByPosition(I)Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object p1

    iget v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->INDEX_ORIGINAL_PATH:I

    invoke-interface {p1, v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getResultCursor()Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/search/resultpage/ImageResultSuggestionCursor;

    :goto_0
    return-object v0
.end method

.method public getServerId(I)Ljava/lang/String;
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getSuggestionCursorByPosition(I)Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object p1

    iget v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->INDEX_SERVER_ID:I

    invoke-interface {p1, v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getSha1(I)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    iget v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->INDEX_SHA1:I

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getThumbFilePath(I)Ljava/lang/String;
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getSuggestionCursorByPosition(I)Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object p1

    iget v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->INDEX_THUMBNAIL_PATH:I

    invoke-interface {p1, v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public isFavorite(I)Z
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getSuggestionCursorByPosition(I)Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object p1

    iget v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->INDEX_IS_FAVORITE:I

    invoke-interface {p1, v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getInt(I)I

    move-result p1

    if-lez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public isLoading()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->mNextLoadEnable:Z

    return v0
.end method

.method public loadComplete()V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->mNextLoadEnable:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iput-boolean v1, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->mNextLoadEnable:Z

    :cond_0
    iput-boolean v1, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->mLoadMoreRequested:Z

    return-void
.end method

.method public newView(Landroid/content/Context;Landroid/database/Cursor;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    iget-object p2, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->mRankInfo:Lcom/miui/gallery/search/core/suggestion/RankInfo;

    invoke-static {p2}, Lcom/miui/gallery/search/SearchConstants;->isHorizontalDocumentStyle(Lcom/miui/gallery/search/core/suggestion/RankInfo;)Z

    move-result p2

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const p2, 0x7f0b0139

    invoke-virtual {p1, p2, p3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/search/resultpage/SearchDocumentGridItem;

    goto :goto_0

    :cond_0
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const p2, 0x7f0b008f

    invoke-virtual {p1, p2, p3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/ui/MicroThumbGridItem;

    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getMicroThumbnailSize()Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/MicroThumbGridItem;->setImageSize(Lcom/nostra13/universalimageloader/core/assist/ImageSize;)V

    const p2, 0x7f07022f

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/MicroThumbGridItem;->setImageForeground(I)V

    return-object p1
.end method

.method public notifyDataSetChanged()V
    .locals 0

    invoke-super {p0}, Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method public openLoadMore()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->mNextLoadEnable:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->mLoadMoreRequested:Z

    return-void
.end method

.method public setRequestLoadMoreListener(Lcom/miui/gallery/search/core/display/RequestLoadMoreListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->mRequestLoadMoreListener:Lcom/miui/gallery/search/core/display/RequestLoadMoreListener;

    return-void
.end method

.method public swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;
    .locals 1

    if-eqz p1, :cond_0

    const-string v0, "serverId"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->INDEX_SERVER_ID:I

    const-string v0, "alias_micro_thumbnail"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->INDEX_MICRO_THUMBNAIL_PATH:I

    const-string v0, "thumbnailFile"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->INDEX_THUMBNAIL_PATH:I

    const-string v0, "localFile"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->INDEX_ORIGINAL_PATH:I

    const-string v0, "sha1"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->INDEX_SHA1:I

    const-string v0, "mimeType"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->INDEX_MIME_TYPE:I

    const-string v0, "alias_sync_state"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->INDEX_SYNC_STATE:I

    const-string v0, "_id"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->INDEX_CLOUD_ID:I

    const-string v0, "duration"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->INDEX_DURATION:I

    const-string v0, "alias_is_favorite"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->INDEX_IS_FAVORITE:I

    const-string v0, "location"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->INDEX_LOCATION:I

    const-string v0, "alias_create_time"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->INDEX_CREATE_TIME:I

    const-string v0, "specialTypeFlags"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->INDEX_SPECIAL_TYPE_FLAGS:I

    const-string v0, "size"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->INDEX_SIZE:I

    :cond_0
    invoke-super {p0, p1}, Lcom/miui/gallery/adapter/BaseMediaSyncStateAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    move-result-object p1

    return-object p1
.end method
