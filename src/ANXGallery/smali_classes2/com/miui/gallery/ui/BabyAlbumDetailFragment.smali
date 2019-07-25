.class public Lcom/miui/gallery/ui/BabyAlbumDetailFragment;
.super Lcom/miui/gallery/ui/AlbumDetailFragmentBase;
.source "BabyAlbumDetailFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/BabyAlbumDetailFragment$MyRecommendationPhotoHelper;,
        Lcom/miui/gallery/ui/BabyAlbumDetailFragment$MyOnScrollListener;,
        Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;
    }
.end annotation


# instance fields
.field private isStickyGridViewAtBottom:Z

.field private isStickyGridViewAtTop:Z

.field private mActionHelper:Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;

.field private mBabyAlbumAdapter:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;

.field private mBabyAlbumPeopleServerId:Ljava/lang/String;

.field private mBabyInfo:Lcom/miui/gallery/cloud/baby/BabyInfo;

.field private mContentView:Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;

.field private mGotoPickHeaderBackgroundMaskView:Landroid/view/View;

.field private mHandler:Landroid/os/Handler;

.field private mIsNightMode:Z

.field private mMyRecommendationPhotoHelper:Lcom/miui/gallery/ui/BabyAlbumDetailFragment$MyRecommendationPhotoHelper;

.field private mRecommendFacePhoto2ThisAlbumView:Landroid/view/View;

.field private mShowInPhotosTab:Z

.field private mThumbnailInfo:Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->isStickyGridViewAtTop:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->isStickyGridViewAtBottom:Z

    new-instance v0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;-><init>(Lcom/miui/gallery/ui/BabyAlbumDetailFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mActionHelper:Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mHandler:Landroid/os/Handler;

    new-instance v0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$MyRecommendationPhotoHelper;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$MyRecommendationPhotoHelper;-><init>(Lcom/miui/gallery/ui/BabyAlbumDetailFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mMyRecommendationPhotoHelper:Lcom/miui/gallery/ui/BabyAlbumDetailFragment$MyRecommendationPhotoHelper;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/BabyAlbumDetailFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mIsNightMode:Z

    return p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/BabyAlbumDetailFragment;)Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mActionHelper:Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;

    return-object p0
.end method

.method static synthetic access$1100(Lcom/miui/gallery/ui/BabyAlbumDetailFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->showMenuDialog()V

    return-void
.end method

.method static synthetic access$1200(Lcom/miui/gallery/ui/BabyAlbumDetailFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->gotoPickHeaderBackground()V

    return-void
.end method

.method static synthetic access$1600(Lcom/miui/gallery/ui/BabyAlbumDetailFragment;)Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mBabyAlbumAdapter:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;

    return-object p0
.end method

.method static synthetic access$1700(Lcom/miui/gallery/ui/BabyAlbumDetailFragment;)Lcom/miui/gallery/cloud/baby/BabyInfo;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mBabyInfo:Lcom/miui/gallery/cloud/baby/BabyInfo;

    return-object p0
.end method

.method static synthetic access$1900(Lcom/miui/gallery/ui/BabyAlbumDetailFragment;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$2000(Lcom/miui/gallery/ui/BabyAlbumDetailFragment;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mBabyAlbumPeopleServerId:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$2200(Lcom/miui/gallery/ui/BabyAlbumDetailFragment;)J
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->getOriginalAlbumId()J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$402(Lcom/miui/gallery/ui/BabyAlbumDetailFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->isStickyGridViewAtBottom:Z

    return p1
.end method

.method static synthetic access$500(Lcom/miui/gallery/ui/BabyAlbumDetailFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->isStickyGridViewAtTop:Z

    return p0
.end method

.method static synthetic access$502(Lcom/miui/gallery/ui/BabyAlbumDetailFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->isStickyGridViewAtTop:Z

    return p1
.end method

.method static synthetic access$600(Lcom/miui/gallery/ui/BabyAlbumDetailFragment;)Landroid/view/View;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mGotoPickHeaderBackgroundMaskView:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/ui/BabyAlbumDetailFragment;)Landroid/view/View;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mRecommendFacePhoto2ThisAlbumView:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$900(Lcom/miui/gallery/ui/BabyAlbumDetailFragment;)Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mContentView:Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;

    return-object p0
.end method

.method private getOriginalAlbumId()J
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mIsOtherShareAlbum:Z

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mAlbumId:J

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/ShareAlbumManager;->getOriginalAlbumId(J)J

    move-result-wide v0

    goto :goto_0

    :cond_0
    iget-wide v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mAlbumId:J

    :goto_0
    return-wide v0
.end method

.method private gotoPickHeaderBackground()V
    .locals 3

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const-class v2, Lcom/miui/gallery/picker/PickGalleryActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "pick-upper-bound"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v1, "pick-need-id"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const/16 v1, 0x12

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method private intialFaceHeader(Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;Lcom/miui/gallery/cloud/baby/BabyInfo;Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;Ljava/lang/String;Ljava/lang/String;)V
    .locals 9

    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mBabyAlbumAdapter:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;

    invoke-direct {p0}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->getOriginalAlbumId()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->setAlbumId(J)V

    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mBabyAlbumAdapter:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;

    invoke-virtual {v0, p5}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->setPeopleServerId(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mBabyAlbumAdapter:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;

    iget-object v6, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mGotoPickHeaderBackgroundMaskView:Landroid/view/View;

    new-instance v7, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$3;

    invoke-direct {v7, p0}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$3;-><init>(Lcom/miui/gallery/ui/BabyAlbumDetailFragment;)V

    iget-boolean v8, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mIsOtherShareAlbum:Z

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p1

    invoke-virtual/range {v1 .. v8}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->setFaceHeader(Lcom/miui/gallery/cloud/baby/BabyInfo;Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;Ljava/lang/String;Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;Landroid/view/View;Landroid/view/View$OnClickListener;Z)V

    return-void
.end method

.method private setBabyAlbumBg(J)V
    .locals 3

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-gez v2, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mThumbnailInfo:Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;

    if-nez v0, :cond_1

    return-void

    :cond_1
    new-instance v1, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$5;

    invoke-direct {v1, p0, v0, p1, p2}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$5;-><init>(Lcom/miui/gallery/ui/BabyAlbumDetailFragment;Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;J)V

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Void;

    invoke-virtual {v1, p1}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$5;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method private showMenuDialog()V
    .locals 4

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    iget-object v1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const v2, 0x7f10007a

    invoke-virtual {v1, v2}, Lcom/miui/gallery/activity/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    new-instance v1, Landroid/app/AlertDialog$Builder;

    iget-object v2, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {v1, v2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    new-instance v2, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$4;

    invoke-direct {v2, p0}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$4;-><init>(Lcom/miui/gallery/ui/BabyAlbumDetailFragment;)V

    const/4 v3, -0x1

    invoke-virtual {v1, v0, v3, v2}, Landroid/app/AlertDialog$Builder;->setSingleChoiceItems([Ljava/lang/CharSequence;ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic getAdapter()Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->getAdapter()Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;

    move-result-object v0

    return-object v0
.end method

.method protected getAdapter()Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mBabyAlbumAdapter:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;

    iget-object v1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {v0, v1}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mBabyAlbumAdapter:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;

    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mBabyAlbumAdapter:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;

    sget-object v1, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->BABY:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->setAlbumType(Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mBabyAlbumAdapter:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;

    return-object v0
.end method

.method protected getCreatorIdByPosition(I)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mBabyAlbumAdapter:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->getCreatorId(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected getCurrentSortOrder()Ljava/lang/String;
    .locals 1

    const-string v0, "alias_create_time DESC "

    return-object v0
.end method

.method protected getLayoutSource()I
    .locals 1

    const v0, 0x7f0b0023

    return v0
.end method

.method public getPageName()Ljava/lang/String;
    .locals 1

    const-string v0, "baby"

    return-object v0
.end method

.method protected getUri()Landroid/net/Uri;
    .locals 1

    sget-object v0, Lcom/miui/gallery/widget/SortByHeader$SortBy;->DATE:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->getUri(Lcom/miui/gallery/widget/SortByHeader$SortBy;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method protected mayDoAdditionalWork(Landroid/database/Cursor;)V
    .locals 2

    if-eqz p1, :cond_2

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_0

    :cond_1
    const/4 v0, 0x2

    invoke-interface {p1, v0}, Landroid/database/Cursor;->move(I)Z

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mBabyAlbumAdapter:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->firstBindHeaderPic(Landroid/database/Cursor;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mMyRecommendationPhotoHelper:Lcom/miui/gallery/ui/BabyAlbumDetailFragment$MyRecommendationPhotoHelper;

    invoke-static {v0, p1}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$MyRecommendationPhotoHelper;->access$1300(Lcom/miui/gallery/ui/BabyAlbumDetailFragment$MyRecommendationPhotoHelper;Landroid/database/Cursor;)V

    return-void

    :cond_2
    :goto_1
    return-void
.end method

.method protected needEnableAutoUpload()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0}, Lcom/miui/gallery/util/SyncUtil;->isGalleryCloudSyncable(Landroid/content/Context;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 4

    const/16 v0, 0xc

    if-eq p1, v0, :cond_5

    const/16 v0, 0xe

    const/4 v1, -0x1

    if-eq p1, v0, :cond_4

    const/16 v0, 0x12

    if-eq p1, v0, :cond_1

    const/16 v0, 0x1f

    if-eq p1, v0, :cond_0

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->onActivityResult(IILandroid/content/Intent;)V

    goto :goto_1

    :cond_0
    if-ne p2, v1, :cond_7

    if-eqz p3, :cond_7

    iget-object p1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mMyRecommendationPhotoHelper:Lcom/miui/gallery/ui/BabyAlbumDetailFragment$MyRecommendationPhotoHelper;

    invoke-static {p1, p3}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$MyRecommendationPhotoHelper;->access$1400(Lcom/miui/gallery/ui/BabyAlbumDetailFragment$MyRecommendationPhotoHelper;Landroid/content/Intent;)V

    goto :goto_1

    :cond_1
    if-ne p2, v1, :cond_7

    if-eqz p3, :cond_7

    const-string p1, "pick-result-data"

    invoke-virtual {p3, p1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object p1

    check-cast p1, Ljava/util/ArrayList;

    if-eqz p1, :cond_3

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_2

    goto :goto_0

    :cond_2
    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide p1

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->setBabyAlbumBg(J)V

    iget-object p1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mGotoPickHeaderBackgroundMaskView:Landroid/view/View;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1

    :cond_3
    :goto_0
    return-void

    :cond_4
    if-ne p2, v1, :cond_7

    if-eqz p3, :cond_7

    iget-object p1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mMyRecommendationPhotoHelper:Lcom/miui/gallery/ui/BabyAlbumDetailFragment$MyRecommendationPhotoHelper;

    invoke-static {p1, p3}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$MyRecommendationPhotoHelper;->access$1500(Lcom/miui/gallery/ui/BabyAlbumDetailFragment$MyRecommendationPhotoHelper;Landroid/content/Intent;)V

    goto :goto_1

    :cond_5
    if-nez p3, :cond_6

    return-void

    :cond_6
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    const-string p2, "baby-info"

    invoke-virtual {p1, p2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/cloud/baby/BabyInfo;

    new-instance p2, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;

    invoke-direct {p0}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->getOriginalAlbumId()J

    move-result-wide v0

    iget-boolean v2, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mIsOtherShareAlbum:Z

    const-string v3, "thumbnail_info_of_baby"

    invoke-virtual {p3, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-direct {p2, v0, v1, v2, p3}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;-><init>(JZLjava/lang/String;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mThumbnailInfo:Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;

    iget-object p2, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mBabyAlbumAdapter:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;

    iget-object p3, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mThumbnailInfo:Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;

    invoke-virtual {p2, p1, p3}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->resetBabyInfoAndThumbnailInfo(Lcom/miui/gallery/cloud/baby/BabyInfo;Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;)V

    :cond_7
    :goto_1
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0}, Lcom/miui/gallery/util/BuildUtil;->isMiuiSdkGte15(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    const v0, 0x7f0c000c

    goto :goto_0

    :cond_0
    const v0, 0x7f0c0002

    :goto_0
    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    invoke-static {}, Lcom/miui/gallery/util/deviceprovider/ApplicationHelper;->supportShare()Z

    move-result p2

    if-nez p2, :cond_1

    const p2, 0x7f0901d6

    invoke-interface {p1, p2}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    const/4 p2, 0x0

    invoke-interface {p1, p2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_1
    return-void
.end method

.method protected onEnterActionMode()V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mShowInPhotosTab:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/ui/ImageSelectionTipFragment;->showImageSelectionTipDialogIfNecessary(Landroid/app/Activity;)V

    :cond_0
    return-void
.end method

.method public onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 8

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    invoke-static {p2}, Lcom/miui/gallery/util/MiscUtil;->isNightMode(Landroid/content/Context;)Z

    move-result p2

    iput-boolean p2, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mIsNightMode:Z

    iget-object p2, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p2}, Lcom/miui/gallery/activity/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object p2

    const-string p3, "attributes"

    const-wide/16 v0, 0x0

    invoke-virtual {p2, p3, v0, v1}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v2

    const-wide/16 v4, 0x4

    and-long/2addr v2, v4

    cmp-long p3, v2, v0

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p3, :cond_0

    const/4 p3, 0x1

    goto :goto_0

    :cond_0
    const/4 p3, 0x0

    :goto_0
    iput-boolean p3, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mShowInPhotosTab:Z

    const p3, 0x7f0900ae

    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;

    iput-object p3, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mContentView:Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;

    const p3, 0x7f090256

    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    iput-object p3, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mRecommendFacePhoto2ThisAlbumView:Landroid/view/View;

    const-string p3, "people_id"

    invoke-virtual {p2, p3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mBabyAlbumPeopleServerId:Ljava/lang/String;

    iget-object p3, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mAlbumDetailGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->getAdapter()Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;

    move-result-object v2

    invoke-virtual {p3, v2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setAdapter(Landroid/widget/ListAdapter;)V

    const p3, 0x7f09014a

    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    iput-object p3, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mGotoPickHeaderBackgroundMaskView:Landroid/view/View;

    new-instance p3, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;

    invoke-direct {p0}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->getOriginalAlbumId()J

    move-result-wide v2

    iget-boolean v4, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mIsOtherShareAlbum:Z

    const-string v5, "thumbnail_info_of_baby"

    invoke-virtual {p2, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {p3, v2, v3, v4, v5}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;-><init>(JZLjava/lang/String;)V

    iput-object p3, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mThumbnailInfo:Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;

    const-string p3, "baby_info"

    invoke-virtual {p2, p3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-static {p3}, Lcom/miui/gallery/cloud/baby/BabyInfo;->fromJSON(Ljava/lang/String;)Lcom/miui/gallery/cloud/baby/BabyInfo;

    move-result-object p3

    iput-object p3, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mBabyInfo:Lcom/miui/gallery/cloud/baby/BabyInfo;

    const p3, 0x7f090116

    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    move-object v3, p3

    check-cast v3, Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;

    iget-object v4, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mBabyInfo:Lcom/miui/gallery/cloud/baby/BabyInfo;

    iget-object v5, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mThumbnailInfo:Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;

    const-string p3, "baby_sharer_info"

    invoke-virtual {p2, p3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mBabyAlbumPeopleServerId:Ljava/lang/String;

    move-object v2, p0

    invoke-direct/range {v2 .. v7}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->intialFaceHeader(Lcom/miui/gallery/ui/BabyAlbumDetailFaceHeaderItem;Lcom/miui/gallery/cloud/baby/BabyInfo;Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;Ljava/lang/String;Ljava/lang/String;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mAlbumDetailGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    new-instance p3, Lcom/nostra13/universalimageloader/core/listener/PauseOnScrollListener;

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$MyOnScrollListener;

    invoke-direct {v3, p0}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$MyOnScrollListener;-><init>(Lcom/miui/gallery/ui/BabyAlbumDetailFragment;)V

    invoke-direct {p3, v2, v0, v1, v3}, Lcom/nostra13/universalimageloader/core/listener/PauseOnScrollListener;-><init>(Lcom/nostra13/universalimageloader/core/ImageLoader;ZZLandroid/widget/AbsListView$OnScrollListener;)V

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mContentView:Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;

    new-instance p3, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$1;

    invoke-direct {p3, p0}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$1;-><init>(Lcom/miui/gallery/ui/BabyAlbumDetailFragment;)V

    invoke-virtual {p2, p3}, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->setInnerScollerMessager(Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView$InnerScollerStateChangedMessager;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mActionHelper:Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;

    invoke-static {p2}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;->access$800(Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;)Landroid/view/View;

    iget-object p2, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mActionHelper:Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;

    invoke-static {p2}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;->access$200(Lcom/miui/gallery/ui/BabyAlbumDetailFragment$ActionBarHelper;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mContentView:Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;

    new-instance p3, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$2;

    invoke-direct {p3, p0}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$2;-><init>(Lcom/miui/gallery/ui/BabyAlbumDetailFragment;)V

    invoke-virtual {p2, p3}, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->post(Ljava/lang/Runnable;)Z

    return-object p1
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 13

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0901bf

    const/4 v2, 0x1

    if-eq v0, v1, :cond_1

    const v1, 0x7f0901d4

    if-eq v0, v1, :cond_0

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/AlbumDetailFragmentBase;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p1

    return p1

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mBabyAlbumAdapter:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;

    invoke-virtual {p1}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->getFaceImageOfFaceHeaderItem()Landroid/graphics/Bitmap;

    move-result-object v8

    iget-object p1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/activity/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    iget-object v3, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-boolean v4, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mIsOtherShareAlbum:Z

    iget-wide v5, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mAlbumId:J

    iget-object v7, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mAlbumName:Ljava/lang/String;

    const-string v0, "people_id"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v0, "thumbnail_info_of_baby"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v0, "baby_info"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v0, "baby_sharer_info"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-static/range {v3 .. v12}, Lcom/miui/gallery/util/IntentUtil;->createShortCutForBabyAlbum(Landroid/content/Context;ZJLjava/lang/String;Landroid/graphics/Bitmap;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const v1, 0x7f1006be

    invoke-virtual {v0, v1}, Lcom/miui/gallery/activity/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    const-string p1, "baby"

    const-string v0, "baby_send_shortcut"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mBabyAlbumAdapter:Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;

    iget-boolean v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->mIsOtherShareAlbum:Z

    invoke-virtual {p1, v0}, Lcom/miui/gallery/adapter/BabyAlbumDetailTimeLineAdapter;->gotoBabyInfoSettingPage(Z)V

    const-string p1, "baby"

    const-string v0, "baby_edit_baby_info"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    return v2
.end method
