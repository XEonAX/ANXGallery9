.class public Lcom/miui/gallery/ui/AlbumPageListFaceItem;
.super Lcom/miui/gallery/ui/AlbumPageListItemBase;
.source "AlbumPageListFaceItem.java"


# static fields
.field private static sAlbumCovers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/miui/gallery/ui/AlbumPageListFaceItem;->sAlbumCovers:Ljava/util/List;

    sget-object v0, Lcom/miui/gallery/ui/AlbumPageListFaceItem;->sAlbumCovers:Ljava/util/List;

    const v1, 0x7f090030

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/ui/AlbumPageListFaceItem;->sAlbumCovers:Ljava/util/List;

    const v1, 0x7f090032

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/ui/AlbumPageListFaceItem;->sAlbumCovers:Ljava/util/List;

    const v1, 0x7f090033

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/ui/AlbumPageListFaceItem;->sAlbumCovers:Ljava/util/List;

    const v1, 0x7f090031

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/AlbumPageListItemBase;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method private bindImage(Landroid/widget/ImageView;Ljava/lang/String;Landroid/net/Uri;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Landroid/graphics/RectF;)V
    .locals 8

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v0

    iget-object v5, v0, Lcom/miui/gallery/Config$ThumbConfig;->sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    const/4 v7, 0x0

    move-object v1, p2

    move-object v2, p3

    move-object v3, p1

    move-object v4, p4

    move-object v6, p5

    invoke-static/range {v1 .. v7}, Lcom/miui/gallery/util/BindImageHelper;->bindFaceImage(Ljava/lang/String;Landroid/net/Uri;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;Z)V

    return-void
.end method

.method private buildDisplayFaceOptions(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;J)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    .locals 3

    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-lez v2, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerFileLength(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1, p2, p3}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->fileLength(J)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerFileLength(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method private getDownloadUri(JI)Landroid/net/Uri;
    .locals 0

    if-nez p3, :cond_0

    sget-object p3, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    invoke-static {p3, p1, p2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method private getImageView(I)Landroid/widget/ImageView;
    .locals 1

    sget-object v0, Lcom/miui/gallery/ui/AlbumPageListFaceItem;->sAlbumCovers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/AlbumPageListFaceItem;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    return-object p1
.end method

.method private setDefaultCover()V
    .locals 3

    const/4 v0, 0x0

    :goto_0
    sget-object v1, Lcom/miui/gallery/ui/AlbumPageListFaceItem;->sAlbumCovers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/AlbumPageListFaceItem;->getImageView(I)Landroid/widget/ImageView;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public bindImageAndAlbumCount(Landroid/os/Bundle;Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)V
    .locals 10

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    const-class v1, Lcom/miui/gallery/model/FaceAlbumCover;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    const-string v1, "face_album_cover"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    if-eqz p1, :cond_4

    if-nez v1, :cond_1

    goto :goto_3

    :cond_1
    const/4 v2, 0x0

    :goto_1
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_2

    const/4 v3, 0x4

    if-ge v2, v3, :cond_2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/model/FaceAlbumCover;

    invoke-direct {p0, v2}, Lcom/miui/gallery/ui/AlbumPageListFaceItem;->getImageView(I)Landroid/widget/ImageView;

    move-result-object v5

    iget-object v6, v3, Lcom/miui/gallery/model/FaceAlbumCover;->coverPath:Ljava/lang/String;

    iget-wide v7, v3, Lcom/miui/gallery/model/FaceAlbumCover;->coverId:J

    iget v4, v3, Lcom/miui/gallery/model/FaceAlbumCover;->coverSyncState:I

    invoke-direct {p0, v7, v8, v4}, Lcom/miui/gallery/ui/AlbumPageListFaceItem;->getDownloadUri(JI)Landroid/net/Uri;

    move-result-object v7

    iget-wide v8, v3, Lcom/miui/gallery/model/FaceAlbumCover;->coverSize:J

    invoke-direct {p0, p2, v8, v9}, Lcom/miui/gallery/ui/AlbumPageListFaceItem;->buildDisplayFaceOptions(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;J)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v8

    iget-object v9, v3, Lcom/miui/gallery/model/FaceAlbumCover;->faceRectF:Lcom/miui/gallery/util/face/FaceRegionRectF;

    move-object v4, p0

    invoke-direct/range {v4 .. v9}, Lcom/miui/gallery/ui/AlbumPageListFaceItem;->bindImage(Landroid/widget/ImageView;Ljava/lang/String;Landroid/net/Uri;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Landroid/graphics/RectF;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    sget-object p2, Lcom/miui/gallery/ui/AlbumPageListFaceItem;->sAlbumCovers:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    if-ge v2, p2, :cond_3

    :goto_2
    sget-object p2, Lcom/miui/gallery/ui/AlbumPageListFaceItem;->sAlbumCovers:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    if-ge v2, p2, :cond_3

    invoke-direct {p0, v2}, Lcom/miui/gallery/ui/AlbumPageListFaceItem;->getImageView(I)Landroid/widget/ImageView;

    move-result-object p2

    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_3
    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumPageListFaceItem;->mAlbumPhotoCount:Landroid/widget/TextView;

    const-string v0, "face_album_count"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_4

    :cond_4
    :goto_3
    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumPageListFaceItem;->setDefaultCover()V

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumPageListFaceItem;->mAlbumPhotoCount:Landroid/widget/TextView;

    const-string p2, "0"

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_4
    return-void
.end method
