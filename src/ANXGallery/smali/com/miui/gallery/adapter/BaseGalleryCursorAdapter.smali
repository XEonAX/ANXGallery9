.class public abstract Lcom/miui/gallery/adapter/BaseGalleryCursorAdapter;
.super Lcom/miui/gallery/adapter/CursorRecyclerAdapter;
.source "BaseGalleryCursorAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<VH:",
        "Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;",
        ">",
        "Lcom/miui/gallery/adapter/CursorRecyclerAdapter<",
        "TVH;>;"
    }
.end annotation


# static fields
.field private static sMainMicroFolder:Ljava/lang/String;


# instance fields
.field protected mContext:Landroid/content/Context;

.field protected mDefaultDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

.field protected mDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    invoke-static {}, Lcom/miui/gallery/util/StorageUtils;->getPriorMicroThumbnailDirectory()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/adapter/BaseGalleryCursorAdapter;->sMainMicroFolder:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/adapter/CursorRecyclerAdapter;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/adapter/BaseGalleryCursorAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/BaseGalleryCursorAdapter;->initDisplayImageOptions()V

    return-void
.end method

.method protected static getDownloadUri(IJ)Landroid/net/Uri;
    .locals 0

    if-nez p0, :cond_0

    invoke-static {p1, p2}, Lcom/miui/gallery/adapter/BaseGalleryCursorAdapter;->getDownloadUri(J)Landroid/net/Uri;

    move-result-object p0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method protected static getDownloadUri(J)Landroid/net/Uri;
    .locals 0

    invoke-static {p0, p1}, Lcom/miui/gallery/util/uil/CloudUriAdapter;->getDownloadUri(J)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method protected static getDownloadUri(Landroid/database/Cursor;II)Landroid/net/Uri;
    .locals 2

    invoke-interface {p0, p1}, Landroid/database/Cursor;->getInt(I)I

    move-result p1

    invoke-interface {p0, p2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/adapter/BaseGalleryCursorAdapter;->getDownloadUri(IJ)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method public static getMicroPath(Landroid/database/Cursor;II)Ljava/lang/String;
    .locals 1

    invoke-interface {p0, p1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    if-ltz p2, :cond_0

    sget-object p1, Lcom/miui/gallery/adapter/BaseGalleryCursorAdapter;->sMainMicroFolder:Ljava/lang/String;

    invoke-interface {p0, p2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/miui/gallery/cloud/CloudUtils;->getThumbnailNameBySha1(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/miui/gallery/util/FileUtils;->concat(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :cond_0
    return-object p1
.end method


# virtual methods
.method public getClearThumbFilePath(I)Ljava/lang/String;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method protected getDisplayImageOptions(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    .locals 4

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BaseGalleryCursorAdapter;->getFileLength(I)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-lez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/adapter/BaseGalleryCursorAdapter;->mDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    const/4 v2, 0x1

    invoke-virtual {p1, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerFileLength(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1, v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->fileLength(J)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p1

    return-object p1

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/adapter/BaseGalleryCursorAdapter;->mDefaultDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-object p1
.end method

.method public getDownloadUri(I)Landroid/net/Uri;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public getFileLength(I)J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getLocalPath(I)Ljava/lang/String;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public getMicroThumbFilePath(I)Ljava/lang/String;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public getOriginFilePath(I)Ljava/lang/String;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public getThumbFilePath(I)Ljava/lang/String;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method protected initDisplayImageOptions()V
    .locals 2

    new-instance v0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v1

    iget-object v1, v1, Lcom/miui/gallery/Config$ThumbConfig;->MICRO_THUMB_DISPLAY_IMAGE_OPTIONS_DEFAULT:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cloneFrom(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/adapter/BaseGalleryCursorAdapter;->mDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    iget-object v0, p0, Lcom/miui/gallery/adapter/BaseGalleryCursorAdapter;->mDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/adapter/BaseGalleryCursorAdapter;->mDefaultDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-void
.end method
