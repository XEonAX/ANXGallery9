.class public abstract Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;
.super Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;
.source "SearchImageResultFragmentBase.java"

# interfaces
.implements Lcom/miui/gallery/search/core/display/RequestLoadMoreListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase$ErrorViewAdapter;
    }
.end annotation


# instance fields
.field protected mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

.field protected mColumnCount:I

.field private mErrorViewAdapter:Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase$ErrorViewAdapter;

.field protected mGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

.field private mLoadCompleteFooter:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mColumnCount:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mErrorViewAdapter:Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase$ErrorViewAdapter;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;)Landroid/view/View;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mLoadCompleteFooter:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$002(Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;Landroid/view/View;)Landroid/view/View;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mLoadCompleteFooter:Landroid/view/View;

    return-object p1
.end method

.method static synthetic access$100(Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method


# virtual methods
.method protected final bind(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    iput-object p2, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    invoke-virtual {p1, p0}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->setRequestLoadMoreListener(Lcom/miui/gallery/search/core/display/RequestLoadMoreListener;)V

    return-void
.end method

.method protected changeSuggestions(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)V
    .locals 4

    invoke-static {p2}, Lcom/miui/gallery/search/utils/SearchUtils;->getRankInfo(Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)Lcom/miui/gallery/search/core/suggestion/RankInfo;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/search/SearchConstants;->isHorizontalDocumentStyle(Lcom/miui/gallery/search/core/suggestion/RankInfo;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v2, 0x2

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v2

    iget v2, v2, Lcom/miui/gallery/Config$ThumbConfig;->sMicroThumbColumnsPortrait:I

    :goto_0
    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v3, 0x7f0602a7

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v3, 0x7f0602a8

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    :goto_1
    iget v3, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mColumnCount:I

    if-eq v3, v2, :cond_2

    iput v2, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mColumnCount:I

    iget-object v2, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    iget v3, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mColumnCount:I

    invoke-virtual {v2, v3}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->setNumColumns(I)V

    iget-object v2, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {v2, v1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->setVerticalSpacing(I)V

    iget-object v2, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {v2, v1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->setHorizontalSpacing(I)V

    :cond_2
    iget-object v1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    invoke-virtual {v1, p1, v0, p2}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->changeSuggestions(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/RankInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)V

    return-void
.end method

.method protected closeLoadMore()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->closeLoadMore()V

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mStatusHandleHelper:Lcom/miui/gallery/search/StatusHandleHelper;

    invoke-virtual {v0}, Lcom/miui/gallery/search/StatusHandleHelper;->refreshInfoViews()V

    return-void
.end method

.method protected getCheckedServerIdList(Landroid/util/SparseBooleanArray;)Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseBooleanArray;",
            ")",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Landroid/util/SparseBooleanArray;->size()I

    move-result v1

    if-lez v1, :cond_1

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p1}, Landroid/util/SparseBooleanArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    invoke-virtual {p1, v1}, Landroid/util/SparseBooleanArray;->valueAt(I)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {p1, v1}, Landroid/util/SparseBooleanArray;->keyAt(I)I

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    invoke-virtual {v3, v2}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getServerId(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method protected getCheckedServerIds(Landroid/util/SparseBooleanArray;)Ljava/lang/String;
    .locals 1

    const-string v0, ","

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->getCheckedServerIdList(Landroid/util/SparseBooleanArray;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected getErrorViewAdapter()Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mErrorViewAdapter:Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase$ErrorViewAdapter;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase$ErrorViewAdapter;

    iget-object v1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase$ErrorViewAdapter;-><init>(Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mErrorViewAdapter:Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase$ErrorViewAdapter;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mErrorViewAdapter:Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase$ErrorViewAdapter;

    return-object v0
.end method

.method protected getImageIds()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getImageIds()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method protected getMicroThumbnailSize()Lcom/nostra13/universalimageloader/core/assist/ImageSize;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getMicroThumbnailSize()Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    move-result-object v0

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v0

    iget-object v0, v0, Lcom/miui/gallery/Config$ThumbConfig;->sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    :goto_0
    return-object v0
.end method

.method protected getOrder()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected getPhotoPageDataLoaderUri()Landroid/net/Uri;
    .locals 1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$SearchResultPhoto;->URI:Landroid/net/Uri;

    return-object v0
.end method

.method protected getSelection()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected getSelectionArguments()[Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->getImageIds()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method protected goToPhotoPage(Landroid/widget/AdapterView;ILjava/lang/String;)V
    .locals 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;I",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    move-object/from16 v10, p0

    move/from16 v11, p2

    new-instance v12, Lcom/miui/gallery/model/ImageLoadParams;

    iget-object v0, v10, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    invoke-virtual {v0, v11}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getItemKey(I)J

    move-result-wide v1

    iget-object v0, v10, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    invoke-virtual {v0, v11}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getLocalPath(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->getMicroThumbnailSize()Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    move-result-object v4

    iget-object v0, v10, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    invoke-virtual {v0, v11}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getItemDecodeRectF(I)Landroid/graphics/RectF;

    move-result-object v5

    iget-object v0, v10, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    invoke-virtual {v0, v11}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getMimeType(I)Ljava/lang/String;

    move-result-object v7

    iget-object v0, v10, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    invoke-virtual {v0, v11}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getFileLength(I)J

    move-result-wide v8

    move-object v0, v12

    move/from16 v6, p2

    invoke-direct/range {v0 .. v9}, Lcom/miui/gallery/model/ImageLoadParams;-><init>(JLjava/lang/String;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ILjava/lang/String;J)V

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->getPhotoPageDataLoaderUri()Landroid/net/Uri;

    move-result-object v2

    iget-object v0, v10, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getCount()I

    move-result v4

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->getSelection()Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->getSelectionArguments()[Ljava/lang/String;

    move-result-object v6

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->getOrder()Ljava/lang/String;

    move-result-object v7

    const/4 v9, 0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v3, p2

    move-object v8, v12

    invoke-static/range {v0 .. v9}, Lcom/miui/gallery/util/IntentUtil;->gotoPhotoPage(Lcom/miui/gallery/ui/BaseMediaFragment;Landroid/view/ViewGroup;Landroid/net/Uri;IILjava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/model/ImageLoadParams;Z)V

    const-string v14, "client_image_operation_open_photo_page"

    const-string v15, "serverIds"

    iget-object v0, v10, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    invoke-virtual {v0, v11}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getServerId(I)Ljava/lang/String;

    move-result-object v16

    const-string v17, "queryText"

    iget-object v0, v10, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mQueryText:Ljava/lang/String;

    move-object/from16 v13, p3

    move-object/from16 v18, v0

    invoke-static/range {v13 .. v18}, Lcom/miui/gallery/search/statistics/SearchStatUtils;->reportEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method protected moreThanOnePage()Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getFirstVisiblePosition()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {v1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getLastVisiblePosition()I

    move-result v1

    :goto_0
    if-le v1, v0, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {v2, v1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getItemIndexByItemPosition(I)I

    move-result v2

    if-lez v2, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {v2, v1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getItemIndexByItemPosition(I)I

    move-result v1

    goto :goto_1

    :cond_0
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    :cond_1
    const v1, 0x7fffffff

    :goto_1
    const/4 v2, 0x1

    if-gtz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getCount()I

    move-result v0

    sub-int/2addr v0, v2

    if-ge v1, v0, :cond_2

    goto :goto_2

    :cond_2
    const/4 v2, 0x0

    :cond_3
    :goto_2
    return v2
.end method

.method public onDestroy()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    :cond_0
    invoke-super {p0}, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;->onDestroy()V

    return-void
.end method

.method protected onLoadComplete()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->loadComplete()V

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mStatusHandleHelper:Lcom/miui/gallery/search/StatusHandleHelper;

    invoke-virtual {v0}, Lcom/miui/gallery/search/StatusHandleHelper;->refreshInfoViews()V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase$1;-><init>(Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;)V

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method protected openLoadMore()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->openLoadMore()V

    return-void
.end method

.method protected supportFeedback()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->mInFeedbackTaskMode:Z

    if-nez v0, :cond_1

    invoke-super {p0}, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;->supportFeedback()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method protected usePersistentResponse()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
