.class Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;
.super Ljava/lang/Object;
.source "BabyAlbumDetailTimeLineAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "FaceHeaderHelper"
.end annotation


# instance fields
.field private TAG:Ljava/lang/String;

.field private mBabyAlbumLocalId:J

.field private mBabyAlbumPeopleServerId:Ljava/lang/String;

.field private mBabyInfo:Lcom/miui/gallery/cloud/baby/BabyInfo;

.field private mBirthdayDay:I

.field private mBirthdayMonth:I

.field private mBirthdayYear:I

.field mFaceHeaderItem:Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;

.field private mSharerInfoStr:Ljava/lang/String;

.field private mThumbnailInfo:Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;

.field final synthetic this$0:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;


# direct methods
.method constructor <init>(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->this$0:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string p1, "FaceHeaderHelper"

    iput-object p1, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->TAG:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;J)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->getAge(J)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->setBirthday()V

    return-void
.end method

.method static synthetic access$1000(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->mSharerInfoStr:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1002(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->mSharerInfoStr:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1100(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->setBirthdayYearMonthDay()V

    return-void
.end method

.method static synthetic access$1200(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->setFaceImageFromFaceAlbumCover(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1300(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;Ljava/lang/String;Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->bindFaceImageFromPath(Ljava/lang/String;Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;)V

    return-void
.end method

.method static synthetic access$1400(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->setFaceImageFromSharerInfo(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1500(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->setFaceImageFromByFirstGetSharerInfo()V

    return-void
.end method

.method static synthetic access$1600(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->TAG:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->gotoBabyInfoSettingPage(Z)V

    return-void
.end method

.method static synthetic access$300(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;)J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->mBabyAlbumLocalId:J

    return-wide v0
.end method

.method static synthetic access$302(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;J)J
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->mBabyAlbumLocalId:J

    return-wide p1
.end method

.method static synthetic access$400(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->mBabyAlbumPeopleServerId:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$402(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->mBabyAlbumPeopleServerId:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$500(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;)Z
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->bindBackgroundByThumbnail()Z

    move-result p0

    return p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;Landroid/database/Cursor;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->bindBackgroundByCursor(Landroid/database/Cursor;)V

    return-void
.end method

.method static synthetic access$700(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->bindBackgroundPicByPath(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$802(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;Lcom/miui/gallery/cloud/baby/BabyInfo;)Lcom/miui/gallery/cloud/baby/BabyInfo;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->mBabyInfo:Lcom/miui/gallery/cloud/baby/BabyInfo;

    return-object p1
.end method

.method static synthetic access$902(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;)Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->mThumbnailInfo:Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;

    return-object p1
.end method

.method private bindBackgroundByCursor(Landroid/database/Cursor;)V
    .locals 4

    if-eqz p1, :cond_3

    invoke-interface {p1}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    const/4 v0, 0x1

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x2

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0xe

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    move-object v0, v2

    goto :goto_0

    :cond_2
    move-object v0, v1

    :goto_0
    const/16 v1, 0xc

    const/4 v2, 0x0

    invoke-static {p1, v1, v2}, Lcom/miui/gallery/adapter/BaseAdapter;->getDownloadUri(Landroid/database/Cursor;II)Landroid/net/Uri;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->setBackgroundByPathOrUri(Ljava/lang/String;Landroid/net/Uri;)V

    return-void

    :cond_3
    :goto_1
    return-void
.end method

.method private bindBackgroundByThumbnail()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->mThumbnailInfo:Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->mThumbnailInfo:Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;

    invoke-virtual {v0}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->getBgPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->setBackgroundByPathOrUri(Ljava/lang/String;Landroid/net/Uri;)V

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private bindBackgroundPicByPath(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->setBackgroundByPathOrUri(Ljava/lang/String;Landroid/net/Uri;)V

    return-void
.end method

.method private bindFaceImageFromPath(Ljava/lang/String;Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;)V
    .locals 1

    invoke-virtual {p2}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->getFaceRegion()Landroid/graphics/RectF;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->mFaceHeaderItem:Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;

    invoke-virtual {p2}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->getFaceRegion()Landroid/graphics/RectF;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;->bindHeadFacePic(Ljava/lang/String;Landroid/graphics/RectF;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->mFaceHeaderItem:Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;

    invoke-virtual {p2}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->getFaceRegionFromFaceInfo()Landroid/graphics/RectF;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;->bindHeadFacePicFromNet(Ljava/lang/String;Landroid/graphics/RectF;)V

    :goto_0
    return-void
.end method

.method private getAge(J)Ljava/lang/String;
    .locals 10

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget-object v0, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v0

    const-string v1, "cn"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "en"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "us"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    iget v1, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->mBirthdayDay:I

    if-nez v1, :cond_2

    :cond_1
    const-string p1, ""

    return-object p1

    :cond_2
    iget v1, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->mBirthdayYear:I

    iget v2, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->mBirthdayMonth:I

    iget v3, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->mBirthdayDay:I

    invoke-static {p1, p2, v1, v2, v3}, Lcom/miui/gallery/cloud/baby/BabyInfo;->getAge(JIII)[I

    move-result-object p1

    const/4 p2, 0x0

    aget v1, p1, p2

    if-gez v1, :cond_3

    const-string p1, ""

    return-object p1

    :cond_3
    const/4 v2, 0x1

    aget v3, p1, v2

    const/4 v4, 0x2

    aget p1, p1, v4

    const/4 v4, 0x0

    const-string v5, "cn"

    invoke-virtual {v5, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_b

    if-eqz v1, :cond_4

    if-eqz v3, :cond_4

    if-eqz p1, :cond_4

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "\u5c81"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "\u4e2a\u6708"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, "\u5929"

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_1

    :cond_4
    if-eqz v1, :cond_5

    if-eqz v3, :cond_5

    if-nez p1, :cond_5

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, "\u5c81"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, "\u4e2a\u6708"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_1

    :cond_5
    if-eqz v1, :cond_6

    if-nez v3, :cond_6

    if-nez p1, :cond_6

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, "\u5c81\u751f\u65e5"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_1

    :cond_6
    if-nez v1, :cond_7

    if-nez v3, :cond_7

    if-eqz p1, :cond_7

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "\u7b2c"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/2addr p1, v2

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, "\u5929"

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_1

    :cond_7
    if-nez v1, :cond_8

    if-eqz v3, :cond_8

    if-nez p1, :cond_8

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, "\u4e2a\u6708"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_1

    :cond_8
    if-eqz v1, :cond_9

    if-nez v3, :cond_9

    if-eqz p1, :cond_9

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "\u5c81\u96f6"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, "\u5929"

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_1

    :cond_9
    if-nez v1, :cond_a

    if-eqz v3, :cond_a

    if-eqz p1, :cond_a

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "\u4e2a\u6708"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, "\u5929"

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_1

    :cond_a
    if-nez v1, :cond_14

    if-nez v3, :cond_14

    if-nez p1, :cond_14

    const-string v4, "\u51fa\u751f\u7b2c\u4e00\u5929"

    goto/16 :goto_1

    :cond_b
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v5, 0x7f0e0006

    new-array v6, v2, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, p2

    invoke-virtual {v0, v5, v1, v6}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    const v6, 0x7f0e0004

    new-array v7, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, p2

    invoke-virtual {v0, v6, p1, v7}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    const v7, 0x7f0e0005

    new-array v8, v2, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, p2

    invoke-virtual {v0, v7, v3, v8}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    const-string v0, " "

    if-eqz v1, :cond_c

    if-eqz v3, :cond_c

    if-eqz p1, :cond_c

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_1

    :cond_c
    if-eqz v1, :cond_d

    if-eqz v3, :cond_d

    if-nez p1, :cond_d

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_1

    :cond_d
    if-eqz v1, :cond_e

    if-nez v3, :cond_e

    if-nez p1, :cond_e

    move-object v4, v5

    goto/16 :goto_1

    :cond_e
    if-nez v1, :cond_10

    if-nez v3, :cond_10

    if-eqz p1, :cond_10

    if-nez p1, :cond_f

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    add-int/2addr p1, v2

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " day"

    :goto_0
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    move-object v4, p1

    goto :goto_1

    :cond_f
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    add-int/2addr p1, v2

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " days"

    goto :goto_0

    :cond_10
    if-nez v1, :cond_11

    if-eqz v3, :cond_11

    if-nez p1, :cond_11

    move-object v4, p2

    goto :goto_1

    :cond_11
    if-eqz v1, :cond_12

    if-nez v3, :cond_12

    if-eqz p1, :cond_12

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_1

    :cond_12
    if-nez v1, :cond_13

    if-eqz v3, :cond_13

    if-eqz p1, :cond_13

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_1

    :cond_13
    if-nez v1, :cond_14

    if-nez v3, :cond_14

    if-nez p1, :cond_14

    const-string v4, " first day"

    :cond_14
    :goto_1
    return-object v4
.end method

.method private gotoBabyInfoSettingPage(Z)V
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->this$0:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;

    iget-object v0, v0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->mContext:Landroid/content/Context;

    move-object v1, v0

    check-cast v1, Landroid/app/Activity;

    iget-object v2, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->mThumbnailInfo:Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;

    iget-object v3, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->mBabyInfo:Lcom/miui/gallery/cloud/baby/BabyInfo;

    iget-wide v4, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->mBabyAlbumLocalId:J

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->getFaceImage()Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/CropUtil;->circleBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v6

    move v7, p1

    invoke-static/range {v1 .. v7}, Lcom/miui/gallery/util/baby/FindFace2CreateBabyAlbum;->gotoBabyAlbumInfoPage(Landroid/app/Activity;Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;Lcom/miui/gallery/cloud/baby/BabyInfo;JLandroid/graphics/Bitmap;Z)V

    return-void
.end method

.method private setBackgroundByPathOrUri(Ljava/lang/String;Landroid/net/Uri;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->this$0:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;

    invoke-static {v0}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->access$1700(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;)Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;

    move-result-object v0

    iget-object v0, v0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->mFaceHeaderItem:Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;

    iget-object v1, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->this$0:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;

    iget-object v1, v1, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->mDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->loadFromMicroCache(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v1

    invoke-virtual {v0, p1, p2, v1}, Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;->bindHeaderBackgroundPic(Ljava/lang/String;Landroid/net/Uri;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    return-void
.end method

.method private setBirthday()V
    .locals 2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->getAge(J)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->mFaceHeaderItem:Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;

    invoke-virtual {v1, v0}, Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;->setAge(Ljava/lang/String;)V

    return-void
.end method

.method private setBirthdayYearMonthDay()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->mBabyInfo:Lcom/miui/gallery/cloud/baby/BabyInfo;

    invoke-static {v0}, Lcom/miui/gallery/cloud/baby/BabyInfo;->splitBirthDay(Lcom/miui/gallery/cloud/baby/BabyInfo;)[I

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    aget v1, v0, v1

    iput v1, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->mBirthdayYear:I

    const/4 v1, 0x1

    aget v1, v0, v1

    iput v1, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->mBirthdayMonth:I

    const/4 v1, 0x2

    aget v0, v0, v1

    iput v0, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->mBirthdayDay:I

    :cond_0
    return-void
.end method

.method private setFaceImageFromByFirstGetSharerInfo()V
    .locals 4

    new-instance v0, Lcom/miui/gallery/share/Path;

    iget-wide v1, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->mBabyAlbumLocalId:J

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3, v3}, Lcom/miui/gallery/share/Path;-><init>(JZZ)V

    new-instance v1, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper$5;

    invoke-direct {v1, p0}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper$5;-><init>(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;)V

    invoke-static {v0, v1}, Lcom/miui/gallery/share/AlbumShareUIManager;->updateInvitationAsync(Lcom/miui/gallery/share/Path;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)Lcom/miui/gallery/threadpool/Future;

    return-void
.end method

.method private setFaceImageFromFaceAlbumCover(Ljava/lang/String;)V
    .locals 3

    const/4 v0, 0x1

    new-array v0, v0, [Landroid/graphics/RectF;

    invoke-static {p1, v0}, Lcom/miui/gallery/provider/FaceManager;->queryCoverImageOfOnePerson(Ljava/lang/String;[Landroid/graphics/RectF;)Ljava/lang/String;

    move-result-object p1

    iget-object v1, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->mFaceHeaderItem:Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;

    const/4 v2, 0x0

    aget-object v0, v0, v2

    invoke-virtual {v1, p1, v0}, Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;->bindHeadFacePic(Ljava/lang/String;Landroid/graphics/RectF;)V

    return-void
.end method

.method private setFaceImageFromSharerInfo(Ljava/lang/String;)V
    .locals 3

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-static {p1}, Lcom/miui/gallery/share/AlbumShareOperations;->parseSharerInfo(Ljava/lang/String;)Lcom/miui/gallery/share/AlbumShareOperations$SharerInfo;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v1, v0, Lcom/miui/gallery/share/AlbumShareOperations$SharerInfo;->mThumbnailUrl:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    iget-object p1, v0, Lcom/miui/gallery/share/AlbumShareOperations$SharerInfo;->mThumbnailUrl:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->mFaceHeaderItem:Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;

    iget-object v1, v0, Lcom/miui/gallery/share/AlbumShareOperations$SharerInfo;->mThumbnailUrl:Ljava/lang/String;

    iget-object v0, v0, Lcom/miui/gallery/share/AlbumShareOperations$SharerInfo;->mFaceRelativePos:Landroid/graphics/RectF;

    invoke-virtual {p1, v1, v0}, Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;->bindHeadFacePicFromNet(Ljava/lang/String;Landroid/graphics/RectF;)V

    goto :goto_1

    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "illegal SharerInfo: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    :goto_1
    return-void
.end method


# virtual methods
.method protected getFaceImage()Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->mFaceHeaderItem:Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;->getHeadFacePic()Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method protected setFaceImage()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->mThumbnailInfo:Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;

    iget-object v1, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->this$0:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;

    invoke-virtual {v1}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->isOtherShareAlbum()Z

    move-result v1

    if-nez v1, :cond_1

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper$1;

    invoke-direct {v2, p0, v0}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper$1;-><init>(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;)V

    new-instance v3, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper$2;

    invoke-direct {v3, p0, v0}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper$2;-><init>(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;)V

    invoke-virtual {v1, v2, v3}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/threadpool/FutureListener;)Lcom/miui/gallery/threadpool/Future;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->mBabyAlbumPeopleServerId:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->setFaceImageFromFaceAlbumCover(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->mBabyAlbumPeopleServerId:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->mBabyAlbumPeopleServerId:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->setFaceImageFromFaceAlbumCover(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper$3;

    invoke-direct {v2, p0, v0}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper$3;-><init>(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;)V

    new-instance v3, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper$4;

    invoke-direct {v3, p0, v0}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper$4;-><init>(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;)V

    invoke-virtual {v1, v2, v3}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/threadpool/FutureListener;)Lcom/miui/gallery/threadpool/Future;

    :goto_0
    return-void
.end method
