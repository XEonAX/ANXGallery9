.class public Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter;
.super Lcom/miui/gallery/adapter/BaseAdapter;
.source "IgnorePeoplePageAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter$ViewHolder;,
        Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter$OnRecoveryButtonClickListener;
    }
.end annotation


# instance fields
.field private mRecoveryListener:Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter$OnRecoveryButtonClickListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/BaseAdapter;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter;->mContext:Landroid/content/Context;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter;)Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter$OnRecoveryButtonClickListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter;->mRecoveryListener:Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter$OnRecoveryButtonClickListener;

    return-object p0
.end method


# virtual methods
.method public bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 6

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    move-object v0, p1

    check-cast v0, Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter$ViewHolder;

    invoke-interface {p3}, Landroid/database/Cursor;->getPosition()I

    move-result p1

    invoke-virtual {v0, p3}, Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter$ViewHolder;->bindData(Landroid/database/Cursor;)V

    invoke-static {p3}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getThumbnailPath(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter;->getDownloadUri(I)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter;->getDisplayImageOptions(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v3

    invoke-static {p3}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getFaceRegionRectF(Landroid/database/Cursor;)Lcom/miui/gallery/util/face/FaceRegionRectF;

    move-result-object v4

    invoke-static {p3}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getThumbnailDownloadType(Landroid/database/Cursor;)Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v5

    invoke-virtual/range {v0 .. v5}, Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter$ViewHolder;->bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Landroid/graphics/RectF;Lcom/miui/gallery/sdk/download/DownloadType;)V

    return-void
.end method

.method public getDownloadUri(I)Landroid/net/Uri;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getThumbnailDownloadUri(Landroid/database/Cursor;)Landroid/net/Uri;

    move-result-object p1

    return-object p1
.end method

.method public getFileLength(I)J
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getCoverSize(Landroid/database/Cursor;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getThumbFilePath(I)Ljava/lang/String;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getThumbnailPath(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected initDisplayImageOptions()V
    .locals 3

    new-instance v0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheThumbnail(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->loadFromMicroCache(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheInMemory(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerExifParams(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    const v2, 0x7f0700d7

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showStubImage(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->resetViewBeforeLoading(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    sget-object v2, Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;->EXACTLY:Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageScaleType(Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    sget-object v2, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->bitmapConfig(Landroid/graphics/Bitmap$Config;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    new-instance v2, Lcom/nostra13/universalimageloader/core/display/CircleBitmapDisplayer;

    invoke-direct {v2}, Lcom/nostra13/universalimageloader/core/display/CircleBitmapDisplayer;-><init>()V

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->displayer(Lcom/nostra13/universalimageloader/core/display/BitmapDisplayer;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->usingRegionDecoderFace(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter;->mDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    iget-object v0, p0, Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter;->mDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter;->mDefaultDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-void
.end method

.method public newView(Landroid/content/Context;Landroid/database/Cursor;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const p2, 0x7f0b0098

    const/4 v0, 0x0

    invoke-virtual {p1, p2, p3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    new-instance p2, Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter$ViewHolder;

    iget-object p3, p0, Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter;->mContext:Landroid/content/Context;

    const/4 v0, 0x0

    invoke-direct {p2, p0, p3, v0, p1}, Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter$ViewHolder;-><init>(Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter;Landroid/content/Context;Landroid/util/AttributeSet;Landroid/view/View;)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    return-object p1
.end method

.method public setRecoveryListener(Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter$OnRecoveryButtonClickListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter;->mRecoveryListener:Lcom/miui/gallery/adapter/IgnorePeoplePageAdapter$OnRecoveryButtonClickListener;

    return-void
.end method
