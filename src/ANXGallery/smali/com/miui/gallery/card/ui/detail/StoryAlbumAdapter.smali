.class public Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;
.super Lcom/miui/gallery/adapter/BaseMediaAdapter;
.source "StoryAlbumAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/adapter/BaseMediaAdapter<",
        "Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;",
        ">;"
    }
.end annotation


# static fields
.field public static final PROJECTION:[Ljava/lang/String;


# instance fields
.field private mDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

.field private mLayoutParamsHelper:Lcom/miui/gallery/card/core/LayoutParamsHelper;


# direct methods
.method static constructor <clinit>()V
    .locals 20

    const-string v0, "_id"

    const-string v1, "alias_micro_thumbnail"

    const-string v2, "thumbnailFile"

    const-string v3, "localFile"

    const-string v4, "mimeType"

    const-string v5, "alias_create_time"

    const-string v6, "location"

    const-string v7, "size"

    const-string v8, "exifImageWidth"

    const-string v9, "exifImageLength"

    const-string v10, "duration"

    const-string v11, "exifGPSLatitude"

    const-string v12, "exifGPSLatitudeRef"

    const-string v13, "exifGPSLongitude"

    const-string v14, "exifGPSLongitudeRef"

    const-string v15, "sha1"

    const-string v16, "alias_sync_state"

    const-string v17, "alias_clear_thumbnail"

    const-string v18, "alias_is_favorite"

    const-string v19, "exifOrientation"

    filled-new-array/range {v0 .. v19}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/BaseMediaAdapter;-><init>(Landroid/content/Context;)V

    new-instance p1, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheInMemory(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheOnDisk(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->loadFromMicroCache(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerExifParams(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->resetViewBeforeLoading(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    sget-object v0, Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;->EXACTLY:Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageScaleType(Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    sget-object v0, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->bitmapConfig(Landroid/graphics/Bitmap$Config;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    const v0, 0x7f07019d

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showImageOnLoading(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->mDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-void
.end method

.method private updateLayoutParams(Lcom/google/android/flexbox/FlexboxLayoutManager$LayoutParams;Lcom/nostra13/universalimageloader/core/assist/ImageSize;)V
    .locals 1

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Lcom/nostra13/universalimageloader/core/assist/ImageSize;->getHeight()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/google/android/flexbox/FlexboxLayoutManager$LayoutParams;->setHeight(I)V

    invoke-virtual {p2}, Lcom/nostra13/universalimageloader/core/assist/ImageSize;->getWidth()I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/google/android/flexbox/FlexboxLayoutManager$LayoutParams;->setWidth(I)V

    :cond_0
    const/high16 p2, 0x3f800000    # 1.0f

    invoke-virtual {p1, p2}, Lcom/google/android/flexbox/FlexboxLayoutManager$LayoutParams;->setFlexGrow(F)V

    return-void
.end method


# virtual methods
.method public doBindViewHolder(Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;I)V
    .locals 4

    iget-object p1, p1, Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;->itemView:Landroid/view/View;

    check-cast p1, Lcom/miui/gallery/card/ui/detail/StoryRecyclerViewItem;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const v1, 0x7f0902cd

    invoke-virtual {p1, v1, v0}, Lcom/miui/gallery/card/ui/detail/StoryRecyclerViewItem;->setTag(ILjava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->mLayoutParamsHelper:Lcom/miui/gallery/card/core/LayoutParamsHelper;

    invoke-virtual {v0, p2}, Lcom/miui/gallery/card/core/LayoutParamsHelper;->getLayoutSize(I)Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/card/ui/detail/StoryRecyclerViewItem;->setImageSize(Lcom/nostra13/universalimageloader/core/assist/ImageSize;)V

    invoke-virtual {p0, p2}, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->getClearThumbFilePath(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p2}, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->getDownloadUri(I)Landroid/net/Uri;

    move-result-object p2

    sget-object v2, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL:Lcom/miui/gallery/sdk/download/DownloadType;

    iget-object v3, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->mDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    invoke-virtual {p1, v1, p2, v2, v3}, Lcom/miui/gallery/card/ui/detail/StoryRecyclerViewItem;->bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    invoke-virtual {p1}, Lcom/miui/gallery/card/ui/detail/StoryRecyclerViewItem;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    instance-of p2, p1, Lcom/google/android/flexbox/FlexboxLayoutManager$LayoutParams;

    if-eqz p2, :cond_0

    check-cast p1, Lcom/google/android/flexbox/FlexboxLayoutManager$LayoutParams;

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->updateLayoutParams(Lcom/google/android/flexbox/FlexboxLayoutManager$LayoutParams;Lcom/nostra13/universalimageloader/core/assist/ImageSize;)V

    :cond_0
    return-void
.end method

.method public getClearThumbFilePath(I)Ljava/lang/String;
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->getOriginFilePath(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->getThumbFilePath(I)Ljava/lang/String;

    move-result-object v0

    :cond_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->getMicroThumbFilePath(I)Ljava/lang/String;

    move-result-object v0

    :cond_1
    return-object v0
.end method

.method public getDownloadUri(I)Landroid/net/Uri;
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->moveCursorToPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0x10

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->getDownloadUri(Landroid/database/Cursor;II)Landroid/net/Uri;

    move-result-object p1

    return-object p1
.end method

.method public getFileLength(I)J
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->moveCursorToPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/4 v0, 0x7

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getItemDecodeRectF(I)Landroid/graphics/RectF;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public getItemKey(I)J
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->moveCursorToPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getLocalPath(I)Ljava/lang/String;
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->moveCursorToPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/4 v0, 0x1

    const/16 v1, 0xf

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->getMicroPath(Landroid/database/Cursor;II)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getMicroThumbFilePath(I)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->moveCursorToPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/4 v0, 0x1

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getMimeType(I)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->moveCursorToPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/4 v0, 0x4

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getOriginFilePath(I)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->moveCursorToPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/4 v0, 0x3

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getSha1(I)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->moveCursorToPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0xf

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getThumbFilePath(I)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->moveCursorToPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/4 v0, 0x2

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;
    .locals 3

    new-instance p2, Lcom/miui/gallery/card/ui/detail/StoryAlbumViewHolder;

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->mContext:Landroid/content/Context;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0b0168

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumViewHolder;-><init>(Landroid/view/View;)V

    return-object p2
.end method

.method public bridge synthetic onViewRecycled(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->onViewRecycled(Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;)V

    return-void
.end method

.method public onViewRecycled(Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/adapter/BaseMediaAdapter;->onViewRecycled(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    return-void
.end method

.method public updateLayoutSizes(Ljava/util/List;II)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;",
            ">;II)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->mLayoutParamsHelper:Lcom/miui/gallery/card/core/LayoutParamsHelper;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/card/core/LayoutParamsHelper;

    invoke-direct {v0}, Lcom/miui/gallery/card/core/LayoutParamsHelper;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->mLayoutParamsHelper:Lcom/miui/gallery/card/core/LayoutParamsHelper;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->mLayoutParamsHelper:Lcom/miui/gallery/card/core/LayoutParamsHelper;

    invoke-virtual {v0, p1, p2, p3}, Lcom/miui/gallery/card/core/LayoutParamsHelper;->updateLayoutSizes(Ljava/util/List;II)V

    invoke-virtual {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->notifyDataSetChanged()V

    return-void
.end method
