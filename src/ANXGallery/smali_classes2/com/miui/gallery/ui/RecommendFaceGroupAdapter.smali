.class public abstract Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;
.super Lcom/miui/gallery/widget/PagerGridLayout$BaseAdapter;
.source "RecommendFaceGroupAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;
    }
.end annotation


# static fields
.field public static final PROJECTION:[Ljava/lang/String;


# instance fields
.field private mCloudLoadingListener:Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

.field private mConfirmToRight:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mConfirmToWrong:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected mCursor:Landroid/database/Cursor;

.field private mDisplayImageOptionsBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

.field private mFragment:Lcom/miui/gallery/ui/BaseMediaFragment;

.field private mLoadingCompleteListener:Lcom/miui/gallery/util/BindImageHelper$OnImageLoadingCompleteListener;

.field private mLocalIdOfAlbum:Ljava/lang/Long;

.field private mServerIdOfAlbum:Ljava/lang/String;

.field public mVisibleItemCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 13

    const-string v0, "_id"

    const-string v1, "sha1"

    const-string v2, "microthumbfile"

    const-string v3, "thumbnailFile"

    const-string v4, "localFile"

    const-string v5, "faceXScale"

    const-string v6, "faceYScale"

    const-string v7, "faceWScale"

    const-string v8, "faceHScale"

    const-string v9, "exifOrientation"

    const-string v10, "serverId"

    const-string v11, "photo_id"

    const-string v12, "size"

    filled-new-array/range {v0 .. v12}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery/ui/BaseMediaFragment;Ljava/lang/String;Ljava/lang/Long;)V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/widget/PagerGridLayout$BaseAdapter;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mConfirmToRight:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mConfirmToWrong:Ljava/util/ArrayList;

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mVisibleItemCount:I

    iput-object p1, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mFragment:Lcom/miui/gallery/ui/BaseMediaFragment;

    iput-object p2, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mServerIdOfAlbum:Ljava/lang/String;

    iput-object p3, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mLocalIdOfAlbum:Ljava/lang/Long;

    invoke-direct {p0}, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->initDisplayOptions()V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;Ljava/util/ArrayList;Z)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->confirmFace(Ljava/util/ArrayList;Z)V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;)Lcom/miui/gallery/util/BindImageHelper$OnImageLoadingCompleteListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mLoadingCompleteListener:Lcom/miui/gallery/util/BindImageHelper$OnImageLoadingCompleteListener;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;Ljava/lang/String;Z)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->recommendCheckStatusChanged(Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic access$400(Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;Ljava/lang/String;Lcom/miui/gallery/util/photoview/ItemViewInfo;Ljava/lang/String;JJ)V
    .locals 0

    invoke-direct/range {p0 .. p7}, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->gotoRecommendCoverPage(Ljava/lang/String;Lcom/miui/gallery/util/photoview/ItemViewInfo;Ljava/lang/String;JJ)V

    return-void
.end method

.method static synthetic access$500(Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;)Lcom/miui/gallery/util/uil/CloudImageLoadingListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mCloudLoadingListener:Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    return-object p0
.end method

.method private confirmFace(Ljava/util/ArrayList;Z)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    new-instance v0, Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

    iget-object v1, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mLocalIdOfAlbum:Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    iget-object v3, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mServerIdOfAlbum:Ljava/lang/String;

    const-string v4, ""

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;-><init>(JLjava/lang/String;Ljava/lang/String;)V

    invoke-static {p1, v0}, Lcom/miui/gallery/provider/deprecated/PeopleRecommendMediaSet;->refreshRecommendHistoryToTrue(Ljava/util/ArrayList;Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;)Lcom/miui/gallery/provider/deprecated/PeopleRecommendMediaSet;

    if-eqz p2, :cond_1

    invoke-static {p1, v0}, Lcom/miui/gallery/provider/deprecated/PeopleRecommendMediaSet;->addSelectItemsToRecommendedMediaSet(Ljava/util/ArrayList;Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;)V

    new-instance p2, Ljava/util/HashMap;

    const/4 v0, 0x1

    invoke-direct {p2, v0}, Ljava/util/HashMap;-><init>(I)V

    const-string v0, "count"

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "face"

    const-string v0, "face_confirm_recommend_face"

    invoke-static {p1, v0, p2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_0

    :cond_1
    invoke-static {p1, v0}, Lcom/miui/gallery/provider/deprecated/PeopleRecommendMediaSet;->feedbackIgnoredPeople2Server(Ljava/util/ArrayList;Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;)V

    :goto_0
    return-void

    :cond_2
    :goto_1
    return-void
.end method

.method private getDownloadUri(Landroid/database/Cursor;I)Landroid/net/Uri;
    .locals 0

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide p1

    invoke-static {p1, p2}, Lcom/miui/gallery/util/uil/CloudUriAdapter;->getDownloadUri(J)Landroid/net/Uri;

    move-result-object p1

    return-object p1
.end method

.method private gotoRecommendCoverPage(Ljava/lang/String;Lcom/miui/gallery/util/photoview/ItemViewInfo;Ljava/lang/String;JJ)V
    .locals 16

    new-instance v11, Lcom/miui/gallery/model/ImageLoadParams;

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v0

    iget-object v4, v0, Lcom/miui/gallery/Config$ThumbConfig;->sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x1

    move-object v0, v11

    move-wide/from16 v1, p4

    move-object/from16 v3, p1

    move-wide/from16 v9, p6

    invoke-direct/range {v0 .. v10}, Lcom/miui/gallery/model/ImageLoadParams;-><init>(JLjava/lang/String;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ILjava/lang/String;ZJ)V

    new-instance v12, Ljava/util/ArrayList;

    const/4 v0, 0x1

    invoke-direct {v12, v0}, Ljava/util/ArrayList;-><init>(I)V

    move-object/from16 v1, p2

    invoke-virtual {v12, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object/from16 v14, p0

    iget-object v1, v14, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mFragment:Lcom/miui/gallery/ui/BaseMediaFragment;

    sget-object v2, Lcom/miui/gallery/provider/GalleryContract$PeopleFace;->RECOMMEND_FACES_OF_ONE_PERSON_URI:Landroid/net/Uri;

    new-array v6, v0, [Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\'"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v13, p3

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\'"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v3, 0x0

    aput-object v0, v6, v3

    const-string v7, "dateTaken DESC "

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x1

    const/4 v15, 0x1

    move-object v0, v1

    move-object v1, v3

    move v3, v4

    move v4, v5

    move-object v5, v8

    move-object v8, v11

    move-object/from16 v11, p3

    move v13, v15

    invoke-static/range {v0 .. v13}, Lcom/miui/gallery/util/IntentUtil;->gotoPhotoPage(Lcom/miui/gallery/ui/BaseMediaFragment;Landroid/view/ViewGroup;Landroid/net/Uri;IILjava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/model/ImageLoadParams;Ljava/lang/String;ZLjava/lang/String;Ljava/util/ArrayList;Z)V

    const-string v0, "face"

    const-string v1, "face_click_recommend_face"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private initDisplayOptions()V
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

    new-instance v2, Lcom/miui/gallery/util/face/PeopleItemBitmapDisplayer;

    invoke-direct {v2, v1}, Lcom/miui/gallery/util/face/PeopleItemBitmapDisplayer;-><init>(Z)V

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->displayer(Lcom/nostra13/universalimageloader/core/display/BitmapDisplayer;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->usingRegionDecoderFace(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mDisplayImageOptionsBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    return-void
.end method

.method private recommendCheckStatusChanged(Ljava/lang/String;Z)V
    .locals 0

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mConfirmToWrong:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    iget-object p2, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mConfirmToRight:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    iget-object p2, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mConfirmToWrong:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p2, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mConfirmToRight:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mConfirmToWrong:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    iget p2, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mVisibleItemCount:I

    if-ne p1, p2, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mFragment:Lcom/miui/gallery/ui/BaseMediaFragment;

    instance-of p1, p1, Lcom/miui/gallery/ui/FacePageFragment;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mFragment:Lcom/miui/gallery/ui/BaseMediaFragment;

    check-cast p1, Lcom/miui/gallery/ui/FacePageFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/FacePageFragment;->changeToNextPage()V

    goto :goto_1

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mFragment:Lcom/miui/gallery/ui/BaseMediaFragment;

    check-cast p1, Lcom/miui/gallery/ui/RecommendFacePageFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/RecommendFacePageFragment;->changeToNextPage()V

    :cond_2
    :goto_1
    return-void
.end method


# virtual methods
.method public bindData(ILandroid/view/View;)V
    .locals 12

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0xa

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0xb

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    const/16 v4, 0xc

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    iget-object v6, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mConfirmToRight:Ljava/util/ArrayList;

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p2

    move-object v6, p2

    check-cast v6, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;

    const/4 p2, 0x1

    invoke-virtual {v6, p2}, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->setChecked(Z)V

    invoke-virtual {v6, v0}, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->setServerId(Ljava/lang/String;)V

    invoke-virtual {v6, v2, v3}, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->setCloudId(J)V

    invoke-virtual {v6, v4, v5}, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->setFileLength(J)V

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL:Lcom/miui/gallery/sdk/download/DownloadType;

    const/4 v2, 0x3

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v2, 0x4

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    :cond_0
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->MICRO:Lcom/miui/gallery/sdk/download/DownloadType;

    const/4 v2, 0x2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    :cond_1
    invoke-virtual {v6, v2}, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->setFacePath(Ljava/lang/String;)V

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->MICRO:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/miui/gallery/util/StorageUtils;->getPriorMicroThumbnailPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :cond_2
    move-object v11, v0

    move-object v7, v2

    const-wide/16 v2, 0x0

    cmp-long v0, v4, v2

    if-lez v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mDisplayImageOptionsBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-virtual {v0, p2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerFileLength(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v4, v5}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->fileLength(J)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v0

    :goto_0
    move-object v9, v0

    goto :goto_1

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mDisplayImageOptionsBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerFileLength(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v0

    goto :goto_0

    :goto_1
    invoke-direct {p0, p1, v1}, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->getDownloadUri(Landroid/database/Cursor;I)Landroid/net/Uri;

    move-result-object v8

    new-instance v10, Lcom/miui/gallery/util/face/FaceRegionRectF;

    const/4 v0, 0x5

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getFloat(I)F

    move-result v1

    const/4 v2, 0x6

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getFloat(I)F

    move-result v3

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getFloat(I)F

    move-result v0

    const/4 v4, 0x7

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getFloat(I)F

    move-result v4

    add-float/2addr v4, v0

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getFloat(I)F

    move-result v0

    const/16 v2, 0x8

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getFloat(I)F

    move-result v2

    add-float v5, v0, v2

    const/16 v0, 0x9

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result p1

    move-object v0, v10

    move v2, v3

    move v3, v4

    move v4, v5

    move v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/miui/gallery/util/face/FaceRegionRectF;-><init>(FFFFI)V

    invoke-virtual/range {v6 .. v11}, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Landroid/graphics/RectF;Lcom/miui/gallery/sdk/download/DownloadType;)V

    iget p1, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mVisibleItemCount:I

    add-int/2addr p1, p2

    iput p1, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mVisibleItemCount:I

    return-void
.end method

.method public confirmRecommends(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$1;

    invoke-direct {v1, p0, p1, p2}, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$1;-><init>(Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    return-void
.end method

.method public freshView(Landroid/view/View;)V
    .locals 5

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;

    invoke-static {p1}, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->access$000(Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mDisplayImageOptionsBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerFileLength(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-static {p1}, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->access$000(Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->fileLength(J)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mDisplayImageOptionsBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerFileLength(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v0

    :goto_0
    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;->needToFresh(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    return-void
.end method

.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mCursor:Landroid/database/Cursor;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v0

    :goto_0
    return v0
.end method

.method protected getCursorByPosition(I)Landroid/database/Cursor;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->moveToPosition(I)Z

    iget-object p1, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mCursor:Landroid/database/Cursor;

    return-object p1
.end method

.method protected abstract getLayoutId()I
.end method

.method public getMergeFaceCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mConfirmToRight:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mConfirmToRight:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_0
    return v0
.end method

.method public getView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->getLayoutId()I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    new-instance p2, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;

    invoke-direct {p2, p0, p1}, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$RecommendFaceItem;-><init>(Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;Landroid/view/View;)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    return-object p1
.end method

.method public onPageChanged()V
    .locals 3

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mConfirmToRight:Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mConfirmToWrong:Ljava/util/ArrayList;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->confirmRecommends(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mConfirmToWrong:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v0, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mConfirmToRight:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mVisibleItemCount:I

    return-void
.end method

.method public setOnLoadingCompleteListener(Lcom/miui/gallery/util/BindImageHelper$OnImageLoadingCompleteListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mLoadingCompleteListener:Lcom/miui/gallery/util/BindImageHelper$OnImageLoadingCompleteListener;

    if-eqz p1, :cond_0

    new-instance p1, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$2;

    invoke-direct {p1, p0}, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter$2;-><init>(Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mCloudLoadingListener:Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mCloudLoadingListener:Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    :goto_0
    return-void
.end method

.method public swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mCursor:Landroid/database/Cursor;

    if-ne p1, v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mCursor:Landroid/database/Cursor;

    iput-object p1, p0, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->mCursor:Landroid/database/Cursor;

    return-object v0
.end method
