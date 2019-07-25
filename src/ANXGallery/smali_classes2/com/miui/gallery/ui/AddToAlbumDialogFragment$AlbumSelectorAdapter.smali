.class Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;
.super Lcom/miui/gallery/adapter/BaseAdapter;
.source "AddToAlbumDialogFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/AddToAlbumDialogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AlbumSelectorAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter$ShareAlbum;
    }
.end annotation


# instance fields
.field private mSharedAlbums:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter$ShareAlbum;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/miui/gallery/ui/AddToAlbumDialogFragment;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->this$0:Lcom/miui/gallery/ui/AddToAlbumDialogFragment;

    invoke-direct {p0, p2}, Lcom/miui/gallery/adapter/BaseAdapter;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$600(Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;Landroid/database/Cursor;)Landroid/database/Cursor;
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->sortCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    move-result-object p0

    return-object p0
.end method

.method private bindImage(ILandroid/widget/ImageView;)V
    .locals 6

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->getLocalPath(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->getDownloadUri(I)Landroid/net/Uri;

    move-result-object v1

    sget-object v2, Lcom/miui/gallery/sdk/download/DownloadType;->MICRO:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->getDisplayImageOptions(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v4

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object p1

    iget-object v5, p1, Lcom/miui/gallery/Config$ThumbConfig;->sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    move-object v3, p2

    invoke-static/range {v0 .. v5}, Lcom/miui/gallery/util/BindImageHelper;->bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;)V

    return-void
.end method

.method private getAlbumName(Landroid/database/Cursor;)Ljava/lang/String;
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->isCameraAlbum(Landroid/database/Cursor;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->this$0:Lcom/miui/gallery/ui/AddToAlbumDialogFragment;

    const v0, 0x7f10002e

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->isScreenshotsAlbum(Landroid/database/Cursor;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->this$0:Lcom/miui/gallery/ui/AddToAlbumDialogFragment;

    const v0, 0x7f100047

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_1
    const/4 v0, 0x5

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method private getShareAlbumInfo(I)Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter$ShareAlbum;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->mSharedAlbums:Ljava/util/Map;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->mSharedAlbums:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter$ShareAlbum;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method private isBabyAlbum(Landroid/database/Cursor;)Z
    .locals 1

    const/16 v0, 0x8

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    return p1
.end method

.method private isCameraAlbum(Landroid/database/Cursor;)Z
    .locals 2

    const/16 v0, 0xa

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    const-wide/16 v0, 0x1

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method private isForceTypeTime(Landroid/database/Cursor;)Z
    .locals 2

    const/16 v0, 0x9

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/GalleryPreferences$Album;->isForceTopAlbumByTopTime(J)Z

    move-result p1

    return p1
.end method

.method private isOtherShareAlbum(Landroid/database/Cursor;)Z
    .locals 2

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result p1

    int-to-long v0, p1

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/ShareAlbumManager;->isOtherShareAlbumId(J)Z

    move-result p1

    return p1
.end method

.method private isOwnerShareAlbum(Landroid/database/Cursor;)Z
    .locals 2

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->isOtherShareAlbum(Landroid/database/Cursor;)Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->mSharedAlbums:Ljava/util/Map;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->mSharedAlbums:Ljava/util/Map;

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method private isScreenshotsAlbum(Landroid/database/Cursor;)Z
    .locals 2

    const/16 v0, 0xa

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    const-wide/16 v0, 0x2

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method private isSystemAlbum(Landroid/database/Cursor;)Z
    .locals 5

    const/16 v0, 0xa

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Album;->ALL_SYSTEM_ALBUM_SERVER_IDS:[Ljava/lang/Long;

    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_1

    aget-object v4, v0, v3

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return v2
.end method

.method private sortCursor(Landroid/database/Cursor;)Landroid/database/Cursor;
    .locals 10

    if-eqz p1, :cond_8

    invoke-interface {p1}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_3

    :cond_0
    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-lez v0, :cond_7

    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_7

    new-instance v0, Landroid/database/MatrixCursor;

    sget-object v1, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->PROJECTION:[Ljava/lang/String;

    invoke-direct {v0, v1}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    sget-object v6, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->PROJECTION:[Ljava/lang/String;

    array-length v6, v6

    new-array v6, v6, [Ljava/lang/Object;

    const/16 v7, 0xb

    invoke-interface {p1, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v8

    :goto_0
    invoke-interface {p1}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v9

    if-nez v9, :cond_5

    invoke-interface {p1, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v9

    if-eq v9, v8, :cond_1

    invoke-interface {v5, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    invoke-interface {v1}, Ljava/util/List;->clear()V

    invoke-interface {v5, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    invoke-interface {v2}, Ljava/util/List;->clear()V

    invoke-interface {v5, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    invoke-interface {v3}, Ljava/util/List;->clear()V

    invoke-interface {v5, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    invoke-interface {v4}, Ljava/util/List;->clear()V

    move v8, v9

    :cond_1
    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->isForceTypeTime(Landroid/database/Cursor;)Z

    move-result v9

    if-eqz v9, :cond_2

    invoke-interface {p1}, Landroid/database/Cursor;->getPosition()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v1, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_2
    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->isSystemAlbum(Landroid/database/Cursor;)Z

    move-result v9

    if-eqz v9, :cond_3

    invoke-interface {p1}, Landroid/database/Cursor;->getPosition()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v2, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_3
    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->isBabyAlbum(Landroid/database/Cursor;)Z

    move-result v9

    if-eqz v9, :cond_4

    invoke-interface {p1}, Landroid/database/Cursor;->getPosition()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v3, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_4
    invoke-interface {p1}, Landroid/database/Cursor;->getPosition()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v4, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_1
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_0

    :cond_5
    invoke-interface {v5, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    invoke-interface {v5, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    invoke-interface {v5, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    invoke-interface {v5, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->moveToPosition(I)Z

    invoke-static {p1, v0, v6}, Lcom/miui/gallery/util/CursorUtils;->addRowToMatrixCursor(Landroid/database/Cursor;Landroid/database/MatrixCursor;[Ljava/lang/Object;)V

    goto :goto_2

    :cond_6
    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return-object v0

    :cond_7
    return-object p1

    :cond_8
    :goto_3
    const/4 p1, 0x0

    return-object p1
.end method


# virtual methods
.method public bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 11

    invoke-interface {p3}, Landroid/database/Cursor;->getPosition()I

    move-result v0

    const v1, 0x7f0900b4

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    const v2, 0x7f0902fa

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    const v3, 0x7f0900b3

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    const v4, 0x7f090318

    invoke-virtual {p1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {p1, v5}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    const/4 p1, 0x7

    invoke-interface {p3, p1}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    const/4 v6, 0x0

    const/16 v7, 0x8

    const/4 v8, 0x1

    const/4 v9, 0x0

    if-nez v5, :cond_0

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object p1

    invoke-virtual {p1, v1}, Lcom/nostra13/universalimageloader/core/ImageLoader;->cancelDisplayTask(Landroid/widget/ImageView;)V

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v5, 0x7f0700bf

    invoke-virtual {p1, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    :cond_0
    invoke-interface {p3, p1}, Landroid/database/Cursor;->getInt(I)I

    move-result p1

    const/4 v5, 0x2

    if-ne p1, v5, :cond_1

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object p1

    invoke-virtual {p1, v1}, Lcom/nostra13/universalimageloader/core/ImageLoader;->cancelDisplayTask(Landroid/widget/ImageView;)V

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v5, 0x7f070251

    invoke-virtual {p1, v5}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    :cond_1
    invoke-virtual {v1, v6}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v3, v9}, Landroid/widget/TextView;->setVisibility(I)V

    const/4 p1, 0x6

    invoke-interface {p3, p1}, Landroid/database/Cursor;->getInt(I)I

    move-result p1

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v10, 0x7f0e0008

    invoke-virtual {v5, v10, p1}, Landroid/content/res/Resources;->getQuantityText(II)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    new-array v10, v8, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v10, v9

    invoke-static {v5, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->bindImage(ILandroid/widget/ImageView;)V

    :goto_0
    invoke-direct {p0, p3}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->getAlbumName(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-direct {p0, p3}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->isOtherShareAlbum(Landroid/database/Cursor;)Z

    move-result p1

    if-eqz p1, :cond_3

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->getShareAlbumInfo(I)Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter$ShareAlbum;

    move-result-object p1

    if-eqz p1, :cond_5

    invoke-virtual {p1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter$ShareAlbum;->getOwnerName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_5

    invoke-direct {p0, p3}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->isBabyAlbum(Landroid/database/Cursor;)Z

    move-result p3

    if-eqz p3, :cond_2

    const p3, 0x7f10003e

    new-array v0, v8, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter$ShareAlbum;->getOwnerName()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v0, v9

    invoke-virtual {p2, p3, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    :cond_2
    const p3, 0x7f10003f

    new-array v0, v8, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter$ShareAlbum;->getOwnerName()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v0, v9

    invoke-virtual {p2, p3, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    :cond_3
    invoke-direct {p0, p3}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->isBabyAlbum(Landroid/database/Cursor;)Z

    move-result p1

    if-eqz p1, :cond_4

    const p1, 0x7f100055

    invoke-virtual {p2, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    :cond_4
    invoke-direct {p0, p3}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->isOwnerShareAlbum(Landroid/database/Cursor;)Z

    move-result p1

    if-eqz p1, :cond_5

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->getShareAlbumInfo(I)Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter$ShareAlbum;

    move-result-object p1

    if-eqz p1, :cond_5

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f0e0007

    iget v0, p1, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter$ShareAlbum;->mUserCount:I

    new-array v1, v8, [Ljava/lang/Object;

    iget p1, p1, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter$ShareAlbum;->mUserCount:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v1, v9

    invoke-virtual {p2, p3, v0, v1}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    :cond_5
    :goto_1
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_6

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_2

    :cond_6
    invoke-virtual {v4, v9}, Landroid/widget/TextView;->setVisibility(I)V

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_2
    return-void
.end method

.method public getDownloadUri(I)Landroid/net/Uri;
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/4 v0, 0x4

    const/4 v1, 0x1

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->getDownloadUri(Landroid/database/Cursor;II)Landroid/net/Uri;

    move-result-object p1

    return-object p1
.end method

.method public getFileLength(I)J
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0xc

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getLocalPath(I)Ljava/lang/String;
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/4 v0, 0x2

    const/4 v1, 0x3

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->getMicroPath(Landroid/database/Cursor;II)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public newView(Landroid/content/Context;Landroid/database/Cursor;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const p2, 0x7f0b001e

    const/4 v0, 0x0

    invoke-virtual {p1, p2, p3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object p1
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->this$0:Lcom/miui/gallery/ui/AddToAlbumDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->access$500(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;)Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/database/Cursor;->moveToPosition(I)Z

    const/4 v1, 0x7

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    if-nez v2, :cond_0

    new-instance p1, Lcom/miui/gallery/ui/AlbumCreatorDialogFragment;

    invoke-direct {p1}, Lcom/miui/gallery/ui/AlbumCreatorDialogFragment;-><init>()V

    iget-object v0, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->this$0:Lcom/miui/gallery/ui/AddToAlbumDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->access$900(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;)Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$OnAlbumOperationDoneListener;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/AlbumCreatorDialogFragment;->setOnAlbumOperationDoneListener(Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$OnAlbumOperationDoneListener;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->this$0:Lcom/miui/gallery/ui/AddToAlbumDialogFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const-string v1, "AlbumCreatorDialogFragment"

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/ui/AlbumCreatorDialogFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    const-string p1, "add_to_dialog"

    const-string v0, "add_to_new_album"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->this$0:Lcom/miui/gallery/ui/AddToAlbumDialogFragment;

    iget-object v1, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->this$0:Lcom/miui/gallery/ui/AddToAlbumDialogFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->access$500(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;)Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->getItemId(I)J

    move-result-wide v1

    const/4 p1, 0x0

    invoke-static {v0, v1, v2, p1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->access$1000(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;JZ)V

    const-string p1, "add_to_dialog"

    const-string v0, "add_to_secret"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->this$0:Lcom/miui/gallery/ui/AddToAlbumDialogFragment;

    iget-object v1, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->this$0:Lcom/miui/gallery/ui/AddToAlbumDialogFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->access$500(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;)Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->getItemId(I)J

    move-result-wide v1

    iget-object p1, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->this$0:Lcom/miui/gallery/ui/AddToAlbumDialogFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->access$1100(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;)Z

    move-result p1

    invoke-static {v0, v1, v2, p1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->access$1000(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;JZ)V

    :goto_0
    return-void
.end method

.method public setSharedAlbums(Landroid/database/Cursor;)V
    .locals 3

    if-nez p1, :cond_0

    return-void

    :cond_0
    :goto_0
    :try_start_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance v0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter$ShareAlbum;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter$ShareAlbum;-><init>(Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;)V

    const/4 v1, 0x0

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter$ShareAlbum;->mAlbumId:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter$ShareAlbum;->mCreatorId:Ljava/lang/String;

    const/4 v1, 0x2

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    iput v1, v0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter$ShareAlbum;->mUserCount:I

    const/4 v1, 0x3

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter$ShareAlbum;->mOwnerNickName:Ljava/lang/String;

    iget-object v1, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->mSharedAlbums:Ljava/util/Map;

    if-nez v1, :cond_1

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->mSharedAlbums:Ljava/util/Map;

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->mSharedAlbums:Ljava/util/Map;

    iget-object v2, v0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter$ShareAlbum;->mAlbumId:Ljava/lang/String;

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->getCount()I

    move-result v0

    if-lez v0, :cond_3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->notifyDataSetChanged()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_3
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    return-void

    :catchall_0
    move-exception v0

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    throw v0
.end method
