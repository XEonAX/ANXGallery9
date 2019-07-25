.class public Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;
.super Lcom/miui/gallery/picker/PickerFragment;
.source "MovieStoryPickFragment.java"


# instance fields
.field private mActivity:Landroid/app/Activity;

.field private mAdapter:Lcom/miui/gallery/picker/helper/PickableBaseTimeLineAdapterWrapper;

.field private mCardId:J

.field private mEmptyView:Lcom/miui/gallery/widget/EmptyPage;

.field private mGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

.field private mIntent:Landroid/content/Intent;

.field private mLoaderCallbacks:Landroid/app/LoaderManager$LoaderCallbacks;

.field private mStoryMoviePickAdapter:Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/picker/PickerFragment;-><init>()V

    new-instance v0, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment$1;-><init>(Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->mLoaderCallbacks:Landroid/app/LoaderManager$LoaderCallbacks;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;)Landroid/app/Activity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->mActivity:Landroid/app/Activity;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;)[Ljava/lang/String;
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->getProjection()[Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->getSelection()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->getOrder()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;)Lcom/miui/gallery/picker/helper/PickableBaseTimeLineAdapterWrapper;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->mAdapter:Lcom/miui/gallery/picker/helper/PickableBaseTimeLineAdapterWrapper;

    return-object p0
.end method

.method private getOrder()Ljava/lang/String;
    .locals 1

    const-string v0, "alias_create_time DESC "

    return-object v0
.end method

.method private getProjection()[Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;->PROJECTION:[Ljava/lang/String;

    return-object v0
.end method

.method private getSelection()Ljava/lang/String;
    .locals 5

    invoke-static {}, Lcom/miui/gallery/card/CardManager;->getInstance()Lcom/miui/gallery/card/CardManager;

    move-result-object v0

    iget-wide v1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->mCardId:J

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/card/CardManager;->getCardByCardId(J)Lcom/miui/gallery/card/Card;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/miui/gallery/card/Card;->getSelectedMediaSha1s()Ljava/util/List;

    move-result-object v0

    const-string v1, "%s IN (\'%s\')"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string v4, "sha1"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "\',\'"

    invoke-static {v4, v0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const-string v0, ""

    return-object v0
.end method

.method public static synthetic lambda$onInflateView$133(Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 21

    move-object/from16 v0, p0

    move/from16 v1, p3

    iget-object v2, v0, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->mStoryMoviePickAdapter:Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;

    invoke-virtual {v2, v1}, Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/database/Cursor;

    new-instance v9, Ljava/util/ArrayList;

    const/4 v3, 0x1

    invoke-direct {v9, v3}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v4, 0x0

    move-object/from16 v5, p2

    invoke-static {v5, v4}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getImageInfo(Landroid/view/View;I)Lcom/miui/gallery/util/photoview/ItemViewInfo;

    move-result-object v4

    invoke-virtual {v9, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v8, Lcom/miui/gallery/model/ImageLoadParams;

    iget-object v4, v0, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->mStoryMoviePickAdapter:Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;

    invoke-virtual {v4, v1}, Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;->getItemKey(I)J

    move-result-wide v11

    iget-object v4, v0, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->mStoryMoviePickAdapter:Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;

    invoke-virtual {v4, v1}, Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;->getLocalPath(I)Ljava/lang/String;

    move-result-object v13

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v4

    iget-object v14, v4, Lcom/miui/gallery/Config$ThumbConfig;->sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    iget-object v4, v0, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->mStoryMoviePickAdapter:Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;

    invoke-virtual {v4, v1}, Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;->getMimeType(I)Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->isPreviewFace()Z

    move-result v18

    iget-object v4, v0, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->mStoryMoviePickAdapter:Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;

    invoke-virtual {v4, v1}, Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;->getFileLength(I)J

    move-result-wide v19

    const/4 v15, 0x0

    const/16 v16, 0x0

    move-object v10, v8

    invoke-direct/range {v10 .. v20}, Lcom/miui/gallery/model/ImageLoadParams;-><init>(JLjava/lang/String;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ILjava/lang/String;ZJ)V

    iget-object v1, v0, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->mActivity:Landroid/app/Activity;

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->getPreviewUri()Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v0, v2}, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->getPreviewSelection(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v2}, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->getPreviewSelectionArgs(Landroid/database/Cursor;)[Ljava/lang/String;

    move-result-object v6

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->getPreviewOrder()Ljava/lang/String;

    move-result-object v7

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->supportFoldBurstItems()Z

    move-result v2

    xor-int/lit8 v10, v2, 0x1

    move-object v3, v1

    invoke-static/range {v3 .. v10}, Lcom/miui/gallery/util/IntentUtil;->gotoPhotoPageFromPicker(Landroid/app/Activity;Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/model/ImageLoadParams;Ljava/util/ArrayList;Z)V

    return-void
.end method

.method private parseIntent()Z
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->mIntent:Landroid/content/Intent;

    if-nez v0, :cond_0

    const-string v0, "StoryMoviePickFragment"

    const-string v1, "parseIntent is fail. "

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    const/4 v0, 0x0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->mIntent:Landroid/content/Intent;

    const-string v1, "card_id"

    const-wide/16 v2, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->mCardId:J

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->mIntent:Landroid/content/Intent;

    const-string v1, "pick_sha1"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {v2, v1}, Lcom/miui/gallery/picker/helper/Picker;->pick(Ljava/lang/String;)Z

    goto :goto_0

    :cond_1
    const-string v0, "StoryMoviePickFragment"

    const-string v1, "parseIntent is success. "

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    return v0
.end method


# virtual methods
.method public getPageName()Ljava/lang/String;
    .locals 1

    const-string v0, "story_picker_home"

    return-object v0
.end method

.method protected getUri()Landroid/net/Uri;
    .locals 3

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Media;->URI_OWNER_ALBUM_MEDIA:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "remove_duplicate_items"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/miui/gallery/picker/PickerFragment;->onActivityCreated(Landroid/os/Bundle;)V

    invoke-direct {p0}, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->parseIntent()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object p1

    const/16 v0, 0x11

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->mLoaderCallbacks:Landroid/app/LoaderManager$LoaderCallbacks;

    invoke-virtual {p1, v0, v1, v2}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    :cond_0
    return-void
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/picker/PickerFragment;->onAttach(Landroid/app/Activity;)V

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->mActivity:Landroid/app/Activity;

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->mActivity:Landroid/app/Activity;

    check-cast p1, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->getResultIntent()Landroid/content/Intent;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->mIntent:Landroid/content/Intent;

    return-void
.end method

.method public onDestroy()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->mAdapter:Lcom/miui/gallery/picker/helper/PickableBaseTimeLineAdapterWrapper;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->mAdapter:Lcom/miui/gallery/picker/helper/PickableBaseTimeLineAdapterWrapper;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/picker/helper/PickableBaseTimeLineAdapterWrapper;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    :cond_0
    invoke-super {p0}, Lcom/miui/gallery/picker/PickerFragment;->onDestroy()V

    return-void
.end method

.method public onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0b016a

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f09014d

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    iput-object p2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->mGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    iget-object p2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->mGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    new-instance p3, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieStoryPickFragment$MwBJv9rWm39cUAwoxBfZy-TUc0E;

    invoke-direct {p3, p0}, Lcom/miui/gallery/movie/ui/fragment/-$$Lambda$MovieStoryPickFragment$MwBJv9rWm39cUAwoxBfZy-TUc0E;-><init>(Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;)V

    invoke-virtual {p2, p3}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    new-instance p2, Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;

    iget-object p3, p0, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->mActivity:Landroid/app/Activity;

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-direct {p2, p3, v0}, Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;-><init>(Landroid/content/Context;Lcom/miui/gallery/picker/helper/Picker;)V

    iput-object p2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->mStoryMoviePickAdapter:Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;

    new-instance p2, Lcom/miui/gallery/picker/helper/PickableBaseTimeLineAdapterWrapper;

    iget-object p3, p0, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->mStoryMoviePickAdapter:Lcom/miui/gallery/movie/ui/adapter/StoryMoviePickAdapter;

    invoke-direct {p2, p3, v0}, Lcom/miui/gallery/picker/helper/PickableBaseTimeLineAdapterWrapper;-><init>(Lcom/miui/gallery/picker/helper/Picker;Landroid/widget/CursorAdapter;)V

    iput-object p2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->mAdapter:Lcom/miui/gallery/picker/helper/PickableBaseTimeLineAdapterWrapper;

    iget-object p2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->mGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    iget-object p3, p0, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->mAdapter:Lcom/miui/gallery/picker/helper/PickableBaseTimeLineAdapterWrapper;

    invoke-virtual {p2, p3}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->setAdapter(Landroid/widget/ListAdapter;)V

    const p2, 0x1020004

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/widget/EmptyPage;

    iput-object p2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->mEmptyView:Lcom/miui/gallery/widget/EmptyPage;

    iget-object p2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->mGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    iget-object p3, p0, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->mEmptyView:Lcom/miui/gallery/widget/EmptyPage;

    invoke-virtual {p2, p3}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->setEmptyView(Landroid/view/View;)V

    iget-object p2, p0, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;->mEmptyView:Lcom/miui/gallery/widget/EmptyPage;

    const/16 p3, 0x8

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/EmptyPage;->setVisibility(I)V

    return-object p1
.end method

.method protected onPhotoItemClick(Landroid/database/Cursor;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method protected supportFoldBurstItems()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
