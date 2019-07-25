.class public Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;
.super Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;
.source "BabyAlbumDetailTimeLineAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;
    }
.end annotation


# instance fields
.field private mFaceHeaderHelper:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;-><init>(Landroid/content/Context;)V

    new-instance p1, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;

    invoke-direct {p1, p0}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;-><init>(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;)V

    iput-object p1, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->mFaceHeaderHelper:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;

    return-void
.end method

.method static synthetic access$1700(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;)Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->mFaceHeaderHelper:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;

    return-object p0
.end method

.method private setBabyInfoAndThumbnailInfo(Lcom/miui/gallery/cloud/baby/BabyInfo;Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;Ljava/lang/String;)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->mFaceHeaderHelper:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;

    invoke-static {v0, p1}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->access$802(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;Lcom/miui/gallery/cloud/baby/BabyInfo;)Lcom/miui/gallery/cloud/baby/BabyInfo;

    :cond_0
    if-eqz p2, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->mFaceHeaderHelper:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;

    invoke-static {p1, p2}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->access$902(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;)Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;

    :cond_1
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->mFaceHeaderHelper:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;

    invoke-static {p1, p3}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->access$1002(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;Ljava/lang/String;)Ljava/lang/String;

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->mFaceHeaderHelper:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;

    invoke-static {p1}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->access$1100(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;)V

    return-void
.end method


# virtual methods
.method public firstBindHeaderPic(Landroid/database/Cursor;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->mFaceHeaderHelper:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;

    invoke-static {v0}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->access$500(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->mFaceHeaderHelper:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;

    invoke-static {v0, p1}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->access$600(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;Landroid/database/Cursor;)V

    :cond_0
    return-void
.end method

.method public getFaceImageOfFaceHeaderItem()Landroid/graphics/Bitmap;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f060031

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    float-to-int v0, v0

    iget-object v1, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->mFaceHeaderHelper:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;

    invoke-virtual {v1}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->getFaceImage()Landroid/graphics/Bitmap;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v1, v0, v0, v2}, Lcom/miui/gallery/util/CropUtil;->cropImage(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public getHeaderView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    if-nez p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->mContext:Landroid/content/Context;

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f0b0025

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    :cond_0
    const/4 p3, 0x0

    iget-object v0, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->mGroupStartLocations:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    iget-object p3, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->mGroupStartLocations:Ljava/util/ArrayList;

    invoke-virtual {p3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    :cond_1
    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/database/Cursor;

    const/4 v0, 0x5

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    move-object p1, p2

    check-cast p1, Lcom/miui/gallery/ui/BabyAlbumDetailGridHeaderItem;

    iget-object v2, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->mFaceHeaderHelper:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;

    invoke-static {v2, v0, v1}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->access$000(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v0, v1, p3, v2}, Lcom/miui/gallery/ui/BabyAlbumDetailGridHeaderItem;->bindData(JLjava/lang/String;Ljava/lang/String;)V

    return-object p2
.end method

.method public gotoBabyInfoSettingPage(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->mFaceHeaderHelper:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;

    invoke-static {v0, p1}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->access$200(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;Z)V

    return-void
.end method

.method public rebindHeaderPic(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->mFaceHeaderHelper:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;

    invoke-static {v0, p1}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->access$700(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;Ljava/lang/String;)V

    return-void
.end method

.method public resetBabyInfoAndThumbnailInfo(Lcom/miui/gallery/cloud/baby/BabyInfo;Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->setBabyInfoAndThumbnailInfo(Lcom/miui/gallery/cloud/baby/BabyInfo;Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->mFaceHeaderHelper:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;

    invoke-virtual {p1}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->setFaceImage()V

    iget-object p1, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->mFaceHeaderHelper:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;

    invoke-static {p1}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->access$100(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;)V

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method public setAlbumId(J)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->mFaceHeaderHelper:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;

    invoke-static {v0, p1, p2}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->access$302(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;J)J

    return-void
.end method

.method public setFaceHeader(Lcom/miui/gallery/cloud/baby/BabyInfo;Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;Ljava/lang/String;Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;Landroid/view/View;Landroid/view/View$OnClickListener;Z)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->setBabyInfoAndThumbnailInfo(Lcom/miui/gallery/cloud/baby/BabyInfo;Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->mFaceHeaderHelper:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;

    iput-object p4, p1, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->mFaceHeaderItem:Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;

    iget-object p1, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->mFaceHeaderHelper:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;

    invoke-virtual {p1}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->setFaceImage()V

    iget-object p1, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->mFaceHeaderHelper:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;

    invoke-static {p1}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->access$100(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;)V

    iget-object p1, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->mFaceHeaderHelper:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;

    iget-object p1, p1, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->mFaceHeaderItem:Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;

    new-instance p2, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$1;

    invoke-direct {p2, p0, p7}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$1;-><init>(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;Z)V

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;->setOnFaceClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->mFaceHeaderHelper:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;

    iget-object p1, p1, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->mFaceHeaderItem:Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;

    invoke-virtual {p1, p6}, Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;->setOnBackgroundClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public setPeopleServerId(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->mFaceHeaderHelper:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;

    invoke-static {v0, p1}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;->access$402(Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter$FaceHeaderHelper;Ljava/lang/String;)Ljava/lang/String;

    return-void
.end method
