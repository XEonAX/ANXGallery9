.class public Lcom/miui/gallery/share/baby/BabyAlbumShareUserAdapter;
.super Lcom/miui/gallery/share/ShareUserAdapterBase;
.source "BabyAlbumShareUserAdapter.java"


# static fields
.field private static sParentIconSize:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    const v0, 0x7f0b002a

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/share/ShareUserAdapterBase;-><init>(Landroid/content/Context;Ljava/lang/String;I)V

    sget p2, Lcom/miui/gallery/share/baby/BabyAlbumShareUserAdapter;->sParentIconSize:I

    if-nez p2, :cond_0

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f06002d

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    float-to-int p1, p1

    sput p1, Lcom/miui/gallery/share/baby/BabyAlbumShareUserAdapter;->sParentIconSize:I

    :cond_0
    return-void
.end method

.method private isSharerParent(Lcom/miui/gallery/share/CloudUserCacheEntry;)Z
    .locals 2

    if-eqz p1, :cond_1

    iget-object v0, p1, Lcom/miui/gallery/share/CloudUserCacheEntry;->mRelation:Ljava/lang/String;

    const-string v1, "father"

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object p1, p1, Lcom/miui/gallery/share/CloudUserCacheEntry;->mRelation:Ljava/lang/String;

    const-string v0, "mother"

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_1

    :cond_0
    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    return p1
.end method


# virtual methods
.method protected getAbsentSharerIcon(Lcom/miui/gallery/share/CloudUserCacheEntry;)I
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/share/baby/BabyAlbumShareUserAdapter;->isSharerParent(Lcom/miui/gallery/share/CloudUserCacheEntry;)Z

    move-result p1

    if-eqz p1, :cond_0

    const p1, 0x7f070033

    goto :goto_0

    :cond_0
    const p1, 0x7f070034

    :goto_0
    return p1
.end method

.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/share/baby/BabyAlbumShareUserAdapter;->mShareUsers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method protected getDefaultIcon(Lcom/miui/gallery/share/CloudUserCacheEntry;)I
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/share/baby/BabyAlbumShareUserAdapter;->isSharerParent(Lcom/miui/gallery/share/CloudUserCacheEntry;)Z

    move-result p1

    if-eqz p1, :cond_0

    const p1, 0x7f070035

    goto :goto_0

    :cond_0
    const p1, 0x7f070036

    :goto_0
    return p1
.end method

.method protected getDisplayName(Landroid/content/res/Resources;Lcom/miui/gallery/share/UserInfo;Lcom/miui/gallery/share/CloudUserCacheEntry;)Ljava/lang/String;
    .locals 2

    iget-object v0, p3, Lcom/miui/gallery/share/CloudUserCacheEntry;->mRelationText:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Lcom/miui/gallery/share/UserInfo;->getUserId()Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/miui/gallery/cloud/GalleryCloudUtils;->getAccountName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p3, Lcom/miui/gallery/share/CloudUserCacheEntry;->mRelationText:Ljava/lang/String;

    return-object p1

    :cond_1
    :goto_0
    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/share/ShareUserAdapterBase;->getDisplayName(Landroid/content/res/Resources;Lcom/miui/gallery/share/UserInfo;Lcom/miui/gallery/share/CloudUserCacheEntry;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected getIconEffect()I
    .locals 1

    const v0, 0x7f07016c

    return v0
.end method

.method public getItemViewType(I)I
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/share/baby/BabyAlbumShareUserAdapter;->getItem(I)Lcom/miui/gallery/share/CloudUserCacheEntry;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object v0, p1, Lcom/miui/gallery/share/CloudUserCacheEntry;->mRelation:Ljava/lang/String;

    const-string v1, "father"

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    iget-object p1, p1, Lcom/miui/gallery/share/CloudUserCacheEntry;->mRelation:Ljava/lang/String;

    const-string v0, "mother"

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x2

    return p1
.end method

.method public getViewTypeCount()I
    .locals 1

    const/4 v0, 0x3

    return v0
.end method

.method protected intialDisplayOptions()V
    .locals 3

    new-instance v0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheOnDisc()Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerExifParams(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->resetViewBeforeLoading(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    sget-object v2, Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;->EXACTLY:Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageScaleType(Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    sget-object v2, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->bitmapConfig(Landroid/graphics/Bitmap$Config;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    new-instance v2, Lcom/miui/gallery/util/face/PeopleItemBitmapDisplayer;

    invoke-direct {v2, v1}, Lcom/miui/gallery/util/face/PeopleItemBitmapDisplayer;-><init>(Z)V

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->displayer(Lcom/nostra13/universalimageloader/core/display/BitmapDisplayer;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    const v1, 0x7f070035

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showImageOnLoading(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/share/baby/BabyAlbumShareUserAdapter;->mDefaultDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-void
.end method

.method protected setIconSize(Lcom/miui/gallery/share/CloudUserCacheEntry;Landroid/view/ViewGroup$LayoutParams;)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/share/baby/BabyAlbumShareUserAdapter;->isSharerParent(Lcom/miui/gallery/share/CloudUserCacheEntry;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget p1, Lcom/miui/gallery/share/baby/BabyAlbumShareUserAdapter;->sParentIconSize:I

    iput p1, p2, Landroid/view/ViewGroup$LayoutParams;->width:I

    sget p1, Lcom/miui/gallery/share/baby/BabyAlbumShareUserAdapter;->sParentIconSize:I

    iput p1, p2, Landroid/view/ViewGroup$LayoutParams;->height:I

    goto :goto_0

    :cond_0
    invoke-super {p0, p1, p2}, Lcom/miui/gallery/share/ShareUserAdapterBase;->setIconSize(Lcom/miui/gallery/share/CloudUserCacheEntry;Landroid/view/ViewGroup$LayoutParams;)V

    :goto_0
    return-void
.end method
