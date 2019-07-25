.class public Lcom/miui/gallery/picker/PickAlbumDetailFragment;
.super Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;
.source "PickAlbumDetailFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/picker/PickAlbumDetailFragment$PickAlbumDetailSimpleAdapter;,
        Lcom/miui/gallery/picker/PickAlbumDetailFragment$PickAlbumDetailTimeLineAdapter;,
        Lcom/miui/gallery/picker/PickAlbumDetailFragment$OnSortByClickListener;,
        Lcom/miui/gallery/picker/PickAlbumDetailFragment$AlbumDetailLoaderCallback;
    }
.end annotation


# static fields
.field private static final SELECTION_ONLY_LOCAL:Ljava/lang/String;


# instance fields
.field private mAlbumDetailLoaderCallback:Lcom/miui/gallery/picker/PickAlbumDetailFragment$AlbumDetailLoaderCallback;

.field private mAlbumDetailSimpleAdapter:Lcom/miui/gallery/picker/PickAlbumDetailFragment$PickAlbumDetailSimpleAdapter;

.field private mAlbumDetailTimeLineAdapter:Lcom/miui/gallery/picker/PickAlbumDetailFragment$PickAlbumDetailTimeLineAdapter;

.field private mAlbumId:J

.field private mAlbumItemCheckListener:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$AlbumItemCheckListener;

.field private mCurrentSortBy:Lcom/miui/gallery/widget/SortByHeader$SortBy;

.field private mIsOtherSharedAlbum:Z

.field private mIsPanoAlbum:Z

.field private mOnSortByClickListener:Lcom/miui/gallery/picker/PickAlbumDetailFragment$OnSortByClickListener;

.field private mSortByHeader:Lcom/miui/gallery/widget/SortByHeader;

.field private mSortOrder:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/miui/gallery/provider/InternalContract$Cloud;->ALIAS_LOCAL_MEDIA:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->SELECTION_ONLY_LOCAL:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const-string v0, "album"

    invoke-direct {p0, v0}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;-><init>(Ljava/lang/String;)V

    const-string v0, " DESC "

    iput-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mSortOrder:Ljava/lang/String;

    sget-object v0, Lcom/miui/gallery/widget/SortByHeader$SortBy;->NONE:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    iput-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mCurrentSortBy:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/picker/PickAlbumDetailFragment;Landroid/content/CursorLoader;Lcom/miui/gallery/widget/SortByHeader$SortBy;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->configLoader(Landroid/content/CursorLoader;Lcom/miui/gallery/widget/SortByHeader$SortBy;)V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/picker/PickAlbumDetailFragment;)Lcom/miui/gallery/widget/SortByHeader$SortBy;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mCurrentSortBy:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/picker/PickAlbumDetailFragment;)Lcom/miui/gallery/picker/PickAlbumDetailFragment$PickAlbumDetailTimeLineAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mAlbumDetailTimeLineAdapter:Lcom/miui/gallery/picker/PickAlbumDetailFragment$PickAlbumDetailTimeLineAdapter;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/picker/PickAlbumDetailFragment;)Lcom/miui/gallery/picker/PickAlbumDetailFragment$PickAlbumDetailSimpleAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mAlbumDetailSimpleAdapter:Lcom/miui/gallery/picker/PickAlbumDetailFragment$PickAlbumDetailSimpleAdapter;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/picker/PickAlbumDetailFragment;)I
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->getSortByIndicatorResource()I

    move-result p0

    return p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/picker/PickAlbumDetailFragment;)Lcom/miui/gallery/widget/SortByHeader;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mSortByHeader:Lcom/miui/gallery/widget/SortByHeader;

    return-object p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/picker/PickAlbumDetailFragment;)Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$AlbumItemCheckListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mAlbumItemCheckListener:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$AlbumItemCheckListener;

    return-object p0
.end method

.method private configLoader(Landroid/content/CursorLoader;Lcom/miui/gallery/widget/SortByHeader$SortBy;)V
    .locals 1

    invoke-direct {p0, p2}, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->getUri(Lcom/miui/gallery/widget/SortByHeader$SortBy;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/CursorLoader;->setUri(Landroid/net/Uri;)V

    sget-object v0, Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;->PROJECTION:[Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/content/CursorLoader;->setProjection([Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->getSelection()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/CursorLoader;->setSelection(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->getSelectionArgs()[Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/CursorLoader;->setSelectionArgs([Ljava/lang/String;)V

    invoke-direct {p0, p2}, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->configOrderBy(Lcom/miui/gallery/widget/SortByHeader$SortBy;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setSortOrder(Ljava/lang/String;)V

    return-void
.end method

.method private configOrderBy(Lcom/miui/gallery/widget/SortByHeader$SortBy;)Ljava/lang/String;
    .locals 2

    invoke-direct {p0, p1}, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->getSortByString(Lcom/miui/gallery/widget/SortByHeader$SortBy;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mCurrentSortBy:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    if-ne v1, p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mSortOrder:Ljava/lang/String;

    const-string v1, " DESC "

    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, " ASC "

    goto :goto_0

    :cond_0
    const-string p1, " DESC "

    :goto_0
    iput-object p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mSortOrder:Ljava/lang/String;

    goto :goto_1

    :cond_1
    const-string v1, " DESC "

    iput-object v1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mSortOrder:Ljava/lang/String;

    iput-object p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mCurrentSortBy:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    :goto_1
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mSortOrder:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0}, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->onSortByChanged()V

    return-object p1
.end method

.method private getSelection()Ljava/lang/String;
    .locals 6

    iget-boolean v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mIsOtherSharedAlbum:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mAlbumId:J

    const-wide/32 v3, 0x7fffffff

    cmp-long v5, v1, v3

    if-nez v5, :cond_1

    const-string v1, "serverType = ? AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "alias_hidden = ?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_1
    iget-boolean v1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mIsPanoAlbum:Z

    if-eqz v1, :cond_2

    const-string v1, "title LIKE ?  AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "alias_hidden = ?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_2
    iget-wide v1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mAlbumId:J

    const-wide/32 v3, 0x7ffffffa

    cmp-long v5, v1, v3

    if-nez v5, :cond_3

    const-string v1, "alias_is_favorite = ? AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "alias_hidden = ? AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "localGroupId != ?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->getPicker()Lcom/miui/gallery/picker/helper/Picker;

    move-result-object v1

    invoke-interface {v1}, Lcom/miui/gallery/picker/helper/Picker;->getMediaType()Lcom/miui/gallery/picker/helper/Picker$MediaType;

    move-result-object v1

    sget-object v2, Lcom/miui/gallery/picker/helper/Picker$MediaType;->ALL:Lcom/miui/gallery/picker/helper/Picker$MediaType;

    if-eq v1, v2, :cond_4

    const-string v1, " AND serverType = ?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_3
    const-string v1, "localGroupId = ? "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->getPicker()Lcom/miui/gallery/picker/helper/Picker;

    move-result-object v1

    invoke-interface {v1}, Lcom/miui/gallery/picker/helper/Picker;->getMediaType()Lcom/miui/gallery/picker/helper/Picker$MediaType;

    move-result-object v1

    sget-object v2, Lcom/miui/gallery/picker/helper/Picker$MediaType;->ALL:Lcom/miui/gallery/picker/helper/Picker$MediaType;

    if-eq v1, v2, :cond_4

    const-string v1, " AND serverType=? "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_4
    :goto_0
    invoke-direct {p0}, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->isOnlyShowLocal()Z

    move-result v1

    if-eqz v1, :cond_5

    sget-object v1, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->SELECTION_ONLY_LOCAL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_5
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getSelectionArgs()[Ljava/lang/String;
    .locals 9

    iget-wide v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mAlbumId:J

    const-wide/32 v2, 0x7fffffff

    cmp-long v4, v0, v2

    const/4 v0, 0x2

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v4, :cond_0

    new-array v3, v0, [Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v3, v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v3, v1

    return-object v3

    :cond_0
    iget-boolean v3, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mIsPanoAlbum:Z

    if-eqz v3, :cond_1

    new-array v0, v0, [Ljava/lang/String;

    const-string v3, "PANO_.*"

    aput-object v3, v0, v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    return-object v0

    :cond_1
    iget-boolean v3, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mIsOtherSharedAlbum:Z

    if-eqz v3, :cond_2

    const/4 v0, 0x0

    return-object v0

    :cond_2
    iget-wide v3, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mAlbumId:J

    const-wide/32 v5, 0x7ffffffa

    cmp-long v7, v3, v5

    if-nez v7, :cond_5

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->getPicker()Lcom/miui/gallery/picker/helper/Picker;

    move-result-object v3

    invoke-interface {v3}, Lcom/miui/gallery/picker/helper/Picker;->getMediaType()Lcom/miui/gallery/picker/helper/Picker$MediaType;

    move-result-object v3

    sget-object v4, Lcom/miui/gallery/picker/helper/Picker$MediaType;->ALL:Lcom/miui/gallery/picker/helper/Picker$MediaType;

    const-wide/16 v5, -0x3e8

    const/4 v7, 0x3

    if-ne v3, v4, :cond_3

    new-array v3, v7, [Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v3, v1

    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v3, v0

    return-object v3

    :cond_3
    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v4, v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v4, v1

    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v4, v0

    sget-object v2, Lcom/miui/gallery/picker/helper/Picker$MediaType;->IMAGE:Lcom/miui/gallery/picker/helper/Picker$MediaType;

    if-ne v3, v2, :cond_4

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_4
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    aput-object v0, v4, v7

    return-object v4

    :cond_5
    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->getPicker()Lcom/miui/gallery/picker/helper/Picker;

    move-result-object v3

    invoke-interface {v3}, Lcom/miui/gallery/picker/helper/Picker;->getMediaType()Lcom/miui/gallery/picker/helper/Picker$MediaType;

    move-result-object v3

    sget-object v4, Lcom/miui/gallery/picker/helper/Picker$MediaType;->IMAGE:Lcom/miui/gallery/picker/helper/Picker$MediaType;

    if-ne v3, v4, :cond_6

    new-array v0, v0, [Ljava/lang/String;

    iget-wide v3, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mAlbumId:J

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v2

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    return-object v0

    :cond_6
    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->getPicker()Lcom/miui/gallery/picker/helper/Picker;

    move-result-object v3

    invoke-interface {v3}, Lcom/miui/gallery/picker/helper/Picker;->getMediaType()Lcom/miui/gallery/picker/helper/Picker$MediaType;

    move-result-object v3

    sget-object v4, Lcom/miui/gallery/picker/helper/Picker$MediaType;->VIDEO:Lcom/miui/gallery/picker/helper/Picker$MediaType;

    if-ne v3, v4, :cond_7

    new-array v3, v0, [Ljava/lang/String;

    iget-wide v4, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mAlbumId:J

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v2

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v3, v1

    return-object v3

    :cond_7
    new-array v0, v1, [Ljava/lang/String;

    iget-wide v3, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mAlbumId:J

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v2

    return-object v0
.end method

.method private getSortByIndicatorResource()I
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mSortOrder:Ljava/lang/String;

    const-string v1, " ASC "

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const v0, 0x7f07026b

    goto :goto_0

    :cond_0
    const v0, 0x7f070268

    :goto_0
    return v0
.end method

.method private getSortByString(Lcom/miui/gallery/widget/SortByHeader$SortBy;)Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/miui/gallery/picker/PickAlbumDetailFragment$1;->$SwitchMap$com$miui$gallery$widget$SortByHeader$SortBy:[I

    invoke-virtual {p1}, Lcom/miui/gallery/widget/SortByHeader$SortBy;->ordinal()I

    move-result p1

    aget p1, v0, p1

    packed-switch p1, :pswitch_data_0

    const-string p1, "alias_sort_time"

    return-object p1

    :pswitch_0
    const-string p1, "size"

    return-object p1

    :pswitch_1
    const-string p1, "title"

    return-object p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private getUri(Lcom/miui/gallery/widget/SortByHeader$SortBy;)Landroid/net/Uri;
    .locals 3

    iget-boolean v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mIsOtherSharedAlbum:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    sget-object p1, Lcom/miui/gallery/provider/GalleryContract$Media;->URI_OTHER_ALBUM_MEDIA:Landroid/net/Uri;

    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p1

    const-string v0, "remove_duplicate_items"

    invoke-static {v1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    iget-wide v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mAlbumId:J

    invoke-static {p1, v0, v1}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object p1

    return-object p1

    :cond_0
    sget-object v0, Lcom/miui/gallery/widget/SortByHeader$SortBy;->DATE:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    if-ne p1, v0, :cond_1

    sget-object p1, Lcom/miui/gallery/provider/GalleryContract$Media;->URI_OWNER_ALBUM_MEDIA:Landroid/net/Uri;

    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p1

    const-string v0, "generate_headers"

    invoke-static {v1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v0, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    const-string v0, "remove_duplicate_items"

    invoke-static {v1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v0, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    const-string v0, "remove_processing_items"

    invoke-static {v1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    return-object p1

    :cond_1
    sget-object p1, Lcom/miui/gallery/provider/GalleryContract$Media;->URI_OWNER_ALBUM_MEDIA:Landroid/net/Uri;

    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p1

    const-string v0, "remove_duplicate_items"

    invoke-static {v1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v0, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    const-string v0, "remove_processing_items"

    invoke-static {v1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    return-object p1
.end method

.method private isOnlyShowLocal()Z
    .locals 1

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$LocalMode;->isOnlyShowLocalPhoto()Z

    move-result v0

    return v0
.end method

.method private onSortByChanged()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mAlbumDetailSimpleAdapter:Lcom/miui/gallery/picker/PickAlbumDetailFragment$PickAlbumDetailSimpleAdapter;

    iget-object v1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mCurrentSortBy:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/picker/PickAlbumDetailFragment$PickAlbumDetailSimpleAdapter;->setCurrentSortBy(Lcom/miui/gallery/widget/SortByHeader$SortBy;)V

    return-void
.end method


# virtual methods
.method protected getPageName()Ljava/lang/String;
    .locals 1

    const-string v0, "picker_album_detail"

    return-object v0
.end method

.method protected getUri()Landroid/net/Uri;
    .locals 1

    sget-object v0, Lcom/miui/gallery/widget/SortByHeader$SortBy;->NONE:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    invoke-direct {p0, v0}, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->getUri(Lcom/miui/gallery/widget/SortByHeader$SortBy;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->onActivityCreated(Landroid/os/Bundle;)V

    new-instance p1, Lcom/miui/gallery/picker/PickAlbumDetailFragment$AlbumDetailLoaderCallback;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lcom/miui/gallery/picker/PickAlbumDetailFragment$AlbumDetailLoaderCallback;-><init>(Lcom/miui/gallery/picker/PickAlbumDetailFragment;Lcom/miui/gallery/picker/PickAlbumDetailFragment$1;)V

    iput-object p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mAlbumDetailLoaderCallback:Lcom/miui/gallery/picker/PickAlbumDetailFragment$AlbumDetailLoaderCallback;

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object p1

    iget-object v1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mAlbumDetailLoaderCallback:Lcom/miui/gallery/picker/PickAlbumDetailFragment$AlbumDetailLoaderCallback;

    const/4 v2, 0x1

    invoke-virtual {p1, v2, v0, v1}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->onCreate(Landroid/os/Bundle;)V

    new-instance p1, Lcom/miui/gallery/picker/PickAlbumDetailFragment$PickAlbumDetailTimeLineAdapter;

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mActivity:Landroid/app/Activity;

    invoke-direct {p1, p0, v0}, Lcom/miui/gallery/picker/PickAlbumDetailFragment$PickAlbumDetailTimeLineAdapter;-><init>(Lcom/miui/gallery/picker/PickAlbumDetailFragment;Landroid/content/Context;)V

    iput-object p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mAlbumDetailTimeLineAdapter:Lcom/miui/gallery/picker/PickAlbumDetailFragment$PickAlbumDetailTimeLineAdapter;

    new-instance p1, Lcom/miui/gallery/picker/PickAlbumDetailFragment$PickAlbumDetailSimpleAdapter;

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mActivity:Landroid/app/Activity;

    invoke-direct {p1, p0, v0}, Lcom/miui/gallery/picker/PickAlbumDetailFragment$PickAlbumDetailSimpleAdapter;-><init>(Lcom/miui/gallery/picker/PickAlbumDetailFragment;Landroid/content/Context;)V

    iput-object p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mAlbumDetailSimpleAdapter:Lcom/miui/gallery/picker/PickAlbumDetailFragment$PickAlbumDetailSimpleAdapter;

    return-void
.end method

.method public onDestroy()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mAlbumDetailSimpleAdapter:Lcom/miui/gallery/picker/PickAlbumDetailFragment$PickAlbumDetailSimpleAdapter;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mAlbumDetailSimpleAdapter:Lcom/miui/gallery/picker/PickAlbumDetailFragment$PickAlbumDetailSimpleAdapter;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/picker/PickAlbumDetailFragment$PickAlbumDetailSimpleAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mAlbumDetailTimeLineAdapter:Lcom/miui/gallery/picker/PickAlbumDetailFragment$PickAlbumDetailTimeLineAdapter;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mAlbumDetailTimeLineAdapter:Lcom/miui/gallery/picker/PickAlbumDetailFragment$PickAlbumDetailTimeLineAdapter;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/picker/PickAlbumDetailFragment$PickAlbumDetailTimeLineAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    :cond_1
    invoke-super {p0}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->onDestroy()V

    return-void
.end method

.method public onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0b0008

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f09014b

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    iput-object p2, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mAlbumDetailGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    iget-object p2, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mAlbumDetailGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->getGridViewOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;

    move-result-object p3

    invoke-virtual {p2, p3}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    new-instance p2, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$AlbumItemCheckListener;

    iget-object p3, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-direct {p2, p0, p3}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$AlbumItemCheckListener;-><init>(Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;Lcom/miui/gallery/picker/helper/Picker;)V

    iput-object p2, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mAlbumItemCheckListener:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$AlbumItemCheckListener;

    new-instance p2, Lcom/miui/gallery/picker/PickAlbumDetailFragment$OnSortByClickListener;

    const/4 p3, 0x0

    invoke-direct {p2, p0, p3}, Lcom/miui/gallery/picker/PickAlbumDetailFragment$OnSortByClickListener;-><init>(Lcom/miui/gallery/picker/PickAlbumDetailFragment;Lcom/miui/gallery/picker/PickAlbumDetailFragment$1;)V

    iput-object p2, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mOnSortByClickListener:Lcom/miui/gallery/picker/PickAlbumDetailFragment$OnSortByClickListener;

    const p2, 0x7f0902af

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/widget/SortByHeader;

    iput-object p2, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mSortByHeader:Lcom/miui/gallery/widget/SortByHeader;

    iget-object p2, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mSortByHeader:Lcom/miui/gallery/widget/SortByHeader;

    iget-object p3, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mOnSortByClickListener:Lcom/miui/gallery/picker/PickAlbumDetailFragment$OnSortByClickListener;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/SortByHeader;->setOnSortByClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->intialSelections()V

    return-object p1
.end method

.method public setAlbumId(J)V
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mAlbumId:J

    return-void
.end method

.method public setIsOtherSharedAlbum(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mIsOtherSharedAlbum:Z

    return-void
.end method

.method public setIsPanoAlbum(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mIsPanoAlbum:Z

    return-void
.end method

.method protected supportFoldBurstItems()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mAlbumDetailSimpleAdapter:Lcom/miui/gallery/picker/PickAlbumDetailFragment$PickAlbumDetailSimpleAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mAlbumDetailSimpleAdapter:Lcom/miui/gallery/picker/PickAlbumDetailFragment$PickAlbumDetailSimpleAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/picker/PickAlbumDetailFragment$PickAlbumDetailSimpleAdapter;->supportFoldBurstItems()Z

    move-result v0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mAlbumDetailTimeLineAdapter:Lcom/miui/gallery/picker/PickAlbumDetailFragment$PickAlbumDetailTimeLineAdapter;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mAlbumDetailTimeLineAdapter:Lcom/miui/gallery/picker/PickAlbumDetailFragment$PickAlbumDetailTimeLineAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/picker/PickAlbumDetailFragment$PickAlbumDetailTimeLineAdapter;->supportFoldBurstItems()Z

    :cond_1
    const/4 v0, 0x0

    return v0
.end method
