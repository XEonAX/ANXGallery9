.class public Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "AlbumPageHeaderAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$SearchAlbum;,
        Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$LocalAlbum;,
        Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;,
        Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$LocalAlbumViewHolder;,
        Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$SearchAlbumViewHolder;,
        Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$PeopleAlbumViewHolder;,
        Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter<",
        "Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private mAlbums:[Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;

.field private mContext:Landroid/content/Context;

.field private mDisplayImageOptionsBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

.field private mFaceDisplayImageOptionsBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

.field private mLayoutInflater:Landroid/view/LayoutInflater;

.field private mMaxCoverNum:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 6

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter;->mContext:Landroid/content/Context;

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter;->mContext:Landroid/content/Context;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter;->mLayoutInflater:Landroid/view/LayoutInflater;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0a0008

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter;->mMaxCoverNum:I

    invoke-direct {p0}, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter;->initDisplayImageOptions()V

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;

    iput-object v0, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter;->mAlbums:[Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter;->mAlbums:[Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;

    new-instance v1, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$LocalAlbum;

    sget-object v2, Lcom/miui/gallery/provider/GalleryContract$Common;->URI_PEOPLE_LIST_PAGE:Landroid/net/Uri;

    const/4 v3, 0x0

    const v4, 0x7f10003a

    const v5, 0x7f07002f

    invoke-direct {v1, v3, v4, v5, v2}, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$LocalAlbum;-><init>(IIILandroid/net/Uri;)V

    aput-object v1, v0, v3

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter;->mAlbums:[Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;

    new-instance v1, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$SearchAlbum;

    sget-object v2, Lcom/miui/gallery/provider/GalleryContract$Search;->URI_LOCATION_LIST_PAGE:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v2

    const-string v3, "title"

    const v4, 0x7f100039

    invoke-virtual {p1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v3, v5}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    const/4 v3, 0x1

    const v5, 0x7f07002d

    invoke-direct {v1, v3, v4, v5, v2}, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$SearchAlbum;-><init>(IIILandroid/net/Uri;)V

    aput-object v1, v0, v3

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter;->mAlbums:[Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;

    new-instance v1, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$SearchAlbum;

    sget-object v2, Lcom/miui/gallery/provider/GalleryContract$Search;->URI_TAG_LIST_PAGE:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v2

    const-string v3, "title"

    const v4, 0x7f10003c

    invoke-virtual {p1, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, v3, p1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    const/4 v2, 0x2

    const v3, 0x7f07002e

    invoke-direct {v1, v2, v4, v3, p1}, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$SearchAlbum;-><init>(IIILandroid/net/Uri;)V

    aput-object v1, v0, v2

    return-void
.end method

.method private initDisplayImageOptions()V
    .locals 5

    new-instance v0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v1

    iget-object v1, v1, Lcom/miui/gallery/Config$ThumbConfig;->MICRO_THUMB_DISPLAY_IMAGE_OPTIONS_DEFAULT:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cloneFrom(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    const v1, 0x7f07019e

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showImageForEmptyUri(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showImageOnFail(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->resetViewBeforeLoading(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showImageOnLoading(Landroid/graphics/drawable/Drawable;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showImageOnLoading(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter;->mDisplayImageOptionsBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    new-instance v0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v4

    iget-object v4, v4, Lcom/miui/gallery/Config$ThumbConfig;->MICRO_THUMB_DISPLAY_IMAGE_OPTIONS_DEFAULT:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    invoke-virtual {v0, v4}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cloneFrom(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showImageForEmptyUri(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showImageOnFail(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->resetViewBeforeLoading(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showImageOnLoading(Landroid/graphics/drawable/Drawable;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showImageOnLoading(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->usingRegionDecoderFace(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter;->mFaceDisplayImageOptionsBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    return-void
.end method


# virtual methods
.method public getItem(I)Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter;->mAlbums:[Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;

    if-eqz v0, :cond_0

    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter;->mAlbums:[Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;

    array-length v0, v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter;->mAlbums:[Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;

    aget-object p1, v0, p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter;->mAlbums:[Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter;->mAlbums:[Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;

    array-length v0, v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getItemId(I)J
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter;->getItem(I)Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;

    move-result-object p1

    if-eqz p1, :cond_0

    iget p1, p1, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;->mIndex:I

    int-to-long v0, p1

    return-wide v0

    :cond_0
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public getItemViewType(I)I
    .locals 0

    packed-switch p1, :pswitch_data_0

    const/4 p1, 0x0

    return p1

    :pswitch_0
    const/4 p1, 0x2

    return p1

    :pswitch_1
    const/4 p1, 0x1

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter;->onBindViewHolder(Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;I)V
    .locals 6

    invoke-virtual {p0, p2}, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter;->getItem(I)Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;

    move-result-object v0

    invoke-virtual {p0, p2}, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter;->getItemId(I)J

    move-result-wide v1

    iget-object p2, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter;->mContext:Landroid/content/Context;

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-nez v5, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter;->mFaceDisplayImageOptionsBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter;->mDisplayImageOptionsBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    :goto_0
    invoke-virtual {p1, p2, v0, v1}, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;->bindView(Landroid/content/Context;Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)V

    iget-object p2, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {p1, p2, v0}, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;->bindClickListener(Landroid/content/Context;Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;)V

    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$BaseViewHolder;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter;->mLayoutInflater:Landroid/view/LayoutInflater;

    const v1, 0x7f0b0014

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    packed-switch p2, :pswitch_data_0

    new-instance p2, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$LocalAlbumViewHolder;

    invoke-direct {p2, p1}, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$LocalAlbumViewHolder;-><init>(Landroid/view/View;)V

    goto :goto_0

    :pswitch_0
    new-instance p2, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$SearchAlbumViewHolder;

    invoke-direct {p2, p1}, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$SearchAlbumViewHolder;-><init>(Landroid/view/View;)V

    goto :goto_0

    :pswitch_1
    new-instance p2, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$PeopleAlbumViewHolder;

    invoke-direct {p2, p1}, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$PeopleAlbumViewHolder;-><init>(Landroid/view/View;)V

    goto :goto_0

    :pswitch_2
    new-instance p2, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$LocalAlbumViewHolder;

    invoke-direct {p2, p1}, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$LocalAlbumViewHolder;-><init>(Landroid/view/View;)V

    :goto_0
    return-object p2

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setAlbumCover(ILjava/util/ArrayList;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList<",
            "*>;)V"
        }
    .end annotation

    if-ltz p1, :cond_a

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter;->getItemCount()I

    move-result v0

    if-lt p1, v0, :cond_0

    goto/16 :goto_1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter;->mAlbums:[Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;

    aget-object v0, v0, p1

    const/4 v1, 0x1

    :try_start_0
    instance-of v2, v0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$SearchAlbum;

    const/4 v3, 0x0

    if-eqz v2, :cond_4

    invoke-static {p2}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_2

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    instance-of v5, v4, Ljava/lang/String;

    if-eqz v5, :cond_1

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    iget v5, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter;->mMaxCoverNum:I

    if-lt v4, v5, :cond_1

    :cond_2
    iget-boolean v2, v0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;->mIsCoverDataValid:Z

    if-eqz v2, :cond_3

    invoke-static {v3}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v2

    if-nez v2, :cond_3

    move-object v2, v0

    check-cast v2, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$SearchAlbum;

    iget-object v2, v2, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$SearchAlbum;->mCoverUris:Ljava/util/ArrayList;

    invoke-static {v2}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_3

    iput-boolean v1, v0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;->mIsCoverDataValid:Z

    return-void

    :cond_3
    :try_start_1
    move-object v2, v0

    check-cast v2, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$SearchAlbum;

    iput-object v3, v2, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$SearchAlbum;->mCoverUris:Ljava/util/ArrayList;

    goto :goto_0

    :cond_4
    instance-of v2, v0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$LocalAlbum;

    if-eqz v2, :cond_9

    invoke-static {p2}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_6

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_5
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    instance-of v5, v4, Lcom/miui/gallery/model/BaseAlbumCover;

    if-eqz v5, :cond_5

    check-cast v4, Lcom/miui/gallery/model/BaseAlbumCover;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    iget v5, p0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter;->mMaxCoverNum:I

    if-lt v4, v5, :cond_5

    :cond_6
    if-eqz v3, :cond_7

    move-object v2, v0

    check-cast v2, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$LocalAlbum;

    iget-object v2, v2, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$LocalAlbum;->mAlbumCovers:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->equals(Ljava/lang/Object;)Z

    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v2, :cond_8

    iput-boolean v1, v0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;->mIsCoverDataValid:Z

    return-void

    :cond_7
    :try_start_2
    iget-boolean v2, v0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;->mIsCoverDataValid:Z

    if-eqz v2, :cond_8

    move-object v2, v0

    check-cast v2, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$LocalAlbum;

    iget-object v2, v2, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$LocalAlbum;->mAlbumCovers:Ljava/util/ArrayList;

    invoke-static {v2}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-nez v2, :cond_8

    iput-boolean v1, v0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;->mIsCoverDataValid:Z

    return-void

    :cond_8
    :try_start_3
    move-object v2, v0

    check-cast v2, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$LocalAlbum;

    iput-object v3, v2, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$LocalAlbum;->mAlbumCovers:Ljava/util/ArrayList;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :cond_9
    :goto_0
    iput-boolean v1, v0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;->mIsCoverDataValid:Z

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter;->notifyItemChanged(I)V

    const-string v0, "AlbumPageHeaderAdapter"

    const-string v1, "notifyItemChanged: %d, %s"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v0, v1, p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :catchall_0
    move-exception p1

    iput-boolean v1, v0, Lcom/miui/gallery/adapter/AlbumPageHeaderAdapter$Album;->mIsCoverDataValid:Z

    throw p1

    :cond_a
    :goto_1
    return-void
.end method
