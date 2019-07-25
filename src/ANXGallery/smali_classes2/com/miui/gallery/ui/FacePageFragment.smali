.class public Lcom/miui/gallery/ui/FacePageFragment;
.super Lcom/miui/gallery/ui/BaseMediaFragment;
.source "FacePageFragment.java"

# interfaces
.implements Lcom/miui/gallery/util/face/CheckoutRecommendPeople$CheckoutStatusListener;
.implements Lcom/miui/gallery/widget/PagerGridLayout$OnPageChangedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;,
        Lcom/miui/gallery/ui/FacePageFragment$FaceRecommendPhotoLoaderCallback;,
        Lcom/miui/gallery/ui/FacePageFragment$FacePagePhotoLoaderCallback;
    }
.end annotation


# instance fields
.field private mAdapter:Lcom/miui/gallery/adapter/FacePageAdapter;

.field private mAddFooterView:Z

.field private mAlbumName:Ljava/lang/String;

.field private mCheckoutRecommendPeopleTask:Lcom/miui/gallery/util/face/CheckoutRecommendPeople;

.field private mCoverRefreshTask:Lcom/miui/gallery/threadpool/Future;

.field private mFaceAlbumMergeHandler:Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;

.field private mFaceAlbumRenameHandler:Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;

.field private mFaceCoverDisplayOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

.field private mFaceCoverHeader:Landroid/view/View;

.field private mFaceCoverPath:Ljava/lang/String;

.field private mFaceCoverRectF:Landroid/graphics/RectF;

.field private mFaceCoverViewAware:Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

.field private mFaceGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

.field private mFaceGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

.field private mFaceMediaSet:Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

.field private mFaceMediasetsList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;",
            ">;"
        }
    .end annotation
.end field

.field private mFacePagePhotoLoaderCallback:Lcom/miui/gallery/ui/FacePageFragment$FacePagePhotoLoaderCallback;

.field private mFooterView:Landroid/view/View;

.field private mHandler:Landroid/os/Handler;

.field private mHasRequestRecommendFace:Z

.field private mListener:Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;

.field private mLocalIdOfAlbum:J

.field private mNameRefreshTask:Lcom/miui/gallery/threadpool/Future;

.field private mPeopleRecommendMediaSet:Lcom/miui/gallery/provider/deprecated/PeopleRecommendMediaSet;

.field private mRecommendFaceAdapter:Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;

.field private mRecommendFaceButtonContainer:Landroid/view/View;

.field private mRecommendFaceGroup:Lcom/miui/gallery/widget/PagerGridLayout;

.field private mRecommendFaceGroupHeader:Landroid/view/View;

.field private mRecommendFaceIds:Ljava/lang/String;

.field private mRelationType:I

.field private mRemoveFromFaceAlbumHandler:Lcom/miui/gallery/ui/renameface/RemoveFromFaceAlbumHandler;

.field private mServerIdOfAlbum:Ljava/lang/String;

.field private mShareButtonContainer:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/BaseMediaFragment;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mAddFooterView:Z

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/FacePageFragment;)Lcom/miui/gallery/adapter/FacePageAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mAdapter:Lcom/miui/gallery/adapter/FacePageAdapter;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/FacePageFragment;)[Ljava/lang/String;
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/FacePageFragment;->getSelectioinArgs()[Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1000(Lcom/miui/gallery/ui/FacePageFragment;)Lcom/miui/gallery/util/face/CheckoutRecommendPeople;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mCheckoutRecommendPeopleTask:Lcom/miui/gallery/util/face/CheckoutRecommendPeople;

    return-object p0
.end method

.method static synthetic access$1002(Lcom/miui/gallery/ui/FacePageFragment;Lcom/miui/gallery/util/face/CheckoutRecommendPeople;)Lcom/miui/gallery/util/face/CheckoutRecommendPeople;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mCheckoutRecommendPeopleTask:Lcom/miui/gallery/util/face/CheckoutRecommendPeople;

    return-object p1
.end method

.method static synthetic access$1100(Lcom/miui/gallery/ui/FacePageFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/FacePageFragment;->freshFacePhotoCount()V

    return-void
.end method

.method static synthetic access$1200(Lcom/miui/gallery/ui/FacePageFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/FacePageFragment;->refreshFaceCover()V

    return-void
.end method

.method static synthetic access$1300(Lcom/miui/gallery/ui/FacePageFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mAddFooterView:Z

    return p0
.end method

.method static synthetic access$1302(Lcom/miui/gallery/ui/FacePageFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mAddFooterView:Z

    return p1
.end method

.method static synthetic access$1400(Lcom/miui/gallery/ui/FacePageFragment;)Landroid/view/View;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFooterView:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$1500(Lcom/miui/gallery/ui/FacePageFragment;)Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    return-object p0
.end method

.method static synthetic access$1700(Lcom/miui/gallery/ui/FacePageFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/FacePageFragment;->showRenameHandler()V

    return-void
.end method

.method static synthetic access$1800(Lcom/miui/gallery/ui/FacePageFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/FacePageFragment;->invalidateFaceGridView()V

    return-void
.end method

.method static synthetic access$1900(Lcom/miui/gallery/ui/FacePageFragment;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mServerIdOfAlbum:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/FacePageFragment;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/FacePageFragment;->getOrderBy()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2000(Lcom/miui/gallery/ui/FacePageFragment;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceCoverPath:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$2002(Lcom/miui/gallery/ui/FacePageFragment;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceCoverPath:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$2102(Lcom/miui/gallery/ui/FacePageFragment;Landroid/graphics/RectF;)Landroid/graphics/RectF;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceCoverRectF:Landroid/graphics/RectF;

    return-object p1
.end method

.method static synthetic access$2200(Lcom/miui/gallery/ui/FacePageFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/FacePageFragment;->displayFaceCover()V

    return-void
.end method

.method static synthetic access$2300(Lcom/miui/gallery/ui/FacePageFragment;)Landroid/view/View;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceCoverHeader:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$2400(Lcom/miui/gallery/ui/FacePageFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/FacePageFragment;->setTitle()V

    return-void
.end method

.method static synthetic access$2600(Lcom/miui/gallery/ui/FacePageFragment;)Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mRecommendFaceAdapter:Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;

    return-object p0
.end method

.method static synthetic access$2700(Lcom/miui/gallery/ui/FacePageFragment;)Landroid/view/View;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mRecommendFaceGroupHeader:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$2800(Lcom/miui/gallery/ui/FacePageFragment;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mRecommendFaceIds:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$2900(Lcom/miui/gallery/ui/FacePageFragment;)Lcom/miui/gallery/widget/PagerGridLayout;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mRecommendFaceGroup:Lcom/miui/gallery/widget/PagerGridLayout;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/ui/FacePageFragment;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mAlbumName:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$3000(Lcom/miui/gallery/ui/FacePageFragment;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/FacePageFragment;->changeVisibilityOfShareContainer(I)V

    return-void
.end method

.method static synthetic access$302(Lcom/miui/gallery/ui/FacePageFragment;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mAlbumName:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$3100(Lcom/miui/gallery/ui/FacePageFragment;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    return-object p0
.end method

.method static synthetic access$3200(Lcom/miui/gallery/ui/FacePageFragment;Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceAlbumHandlerListener;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/FacePageFragment;->startRemoveFromFaceAlbum(Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceAlbumHandlerListener;)V

    return-void
.end method

.method static synthetic access$3300(Lcom/miui/gallery/ui/FacePageFragment;Landroid/view/ActionMode;[J)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/FacePageFragment;->doDelete(Landroid/view/ActionMode;[J)V

    return-void
.end method

.method static synthetic access$3600(Lcom/miui/gallery/ui/FacePageFragment;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/ui/FacePageFragment;)Lcom/miui/gallery/provider/deprecated/PeopleRecommendMediaSet;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mPeopleRecommendMediaSet:Lcom/miui/gallery/provider/deprecated/PeopleRecommendMediaSet;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/ui/FacePageFragment;)J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mLocalIdOfAlbum:J

    return-wide v0
.end method

.method static synthetic access$600(Lcom/miui/gallery/ui/FacePageFragment;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/FacePageFragment;->getAlbumName()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/ui/FacePageFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/FacePageFragment;->toast2CreateBabyAlbumBeforeShare()V

    return-void
.end method

.method static synthetic access$900(Lcom/miui/gallery/ui/FacePageFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mHasRequestRecommendFace:Z

    return p0
.end method

.method static synthetic access$902(Lcom/miui/gallery/ui/FacePageFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mHasRequestRecommendFace:Z

    return p1
.end method

.method private addFaceCoverHeader()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    const v2, 0x7f0b007c

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceCoverHeader:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceCoverHeader:Landroid/view/View;

    const v1, 0x7f090113

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    new-instance v1, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    invoke-direct {v1, v0}, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;-><init>(Landroid/widget/ImageView;)V

    iput-object v1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceCoverViewAware:Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    invoke-direct {p0}, Lcom/miui/gallery/ui/FacePageFragment;->initFaceCoverDisplayOptions()V

    invoke-direct {p0}, Lcom/miui/gallery/ui/FacePageFragment;->displayFaceCover()V

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceCoverHeader:Landroid/view/View;

    const v1, 0x7f090119

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/miui/gallery/ui/FacePageFragment;->getAlbumName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const v1, 0x7f10039d

    invoke-virtual {p0, v1}, Lcom/miui/gallery/ui/FacePageFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_0
    const v1, 0x7f10039c

    invoke-virtual {p0, v1}, Lcom/miui/gallery/ui/FacePageFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    new-instance v1, Lcom/miui/gallery/ui/FacePageFragment$7;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/FacePageFragment$7;-><init>(Lcom/miui/gallery/ui/FacePageFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    iget-object v1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceCoverHeader:Landroid/view/View;

    invoke-virtual {v0, v1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->addHeaderView(Landroid/view/View;)V

    return-void
.end method

.method private addHeaderView()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/FacePageFragment;->addFaceCoverHeader()V

    invoke-direct {p0}, Lcom/miui/gallery/ui/FacePageFragment;->addRecommendGroupHeader()V

    return-void
.end method

.method private addRecommendGroupHeader()V
    .locals 6

    new-instance v0, Lcom/miui/gallery/provider/deprecated/PeopleRecommendMediaSet;

    new-instance v1, Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

    iget-wide v2, p0, Lcom/miui/gallery/ui/FacePageFragment;->mLocalIdOfAlbum:J

    invoke-virtual {p0}, Lcom/miui/gallery/ui/FacePageFragment;->getServerIdOfAlbum()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0}, Lcom/miui/gallery/ui/FacePageFragment;->getAlbumName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;-><init>(JLjava/lang/String;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Lcom/miui/gallery/provider/deprecated/PeopleRecommendMediaSet;-><init>(Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mPeopleRecommendMediaSet:Lcom/miui/gallery/provider/deprecated/PeopleRecommendMediaSet;

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mPeopleRecommendMediaSet:Lcom/miui/gallery/provider/deprecated/PeopleRecommendMediaSet;

    invoke-virtual {v0}, Lcom/miui/gallery/provider/deprecated/PeopleRecommendMediaSet;->refreshRecommendInfo()V

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mPeopleRecommendMediaSet:Lcom/miui/gallery/provider/deprecated/PeopleRecommendMediaSet;

    invoke-virtual {v0}, Lcom/miui/gallery/provider/deprecated/PeopleRecommendMediaSet;->getActualNeedRecommendPeopleFacePhotoNumber()I

    move-result v0

    if-lez v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/FacePageFragment;->getServerIdOfAlbum()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/preference/GalleryPreferences$Face;->isFaceRecommendGroupHidden(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mPeopleRecommendMediaSet:Lcom/miui/gallery/provider/deprecated/PeopleRecommendMediaSet;

    invoke-virtual {v0}, Lcom/miui/gallery/provider/deprecated/PeopleRecommendMediaSet;->getServerIdsIn()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mRecommendFaceIds:Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0b007e

    iget-object v2, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mRecommendFaceGroupHeader:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    iget-object v1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mRecommendFaceGroupHeader:Landroid/view/View;

    invoke-virtual {v0, v1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->addHeaderView(Landroid/view/View;)V

    const-string v0, "face"

    const-string v1, "face_show_recommend_panel"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mRecommendFaceGroupHeader:Landroid/view/View;

    const v1, 0x7f09011b

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/widget/PagerGridLayout;

    iput-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mRecommendFaceGroup:Lcom/miui/gallery/widget/PagerGridLayout;

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mRecommendFaceGroup:Lcom/miui/gallery/widget/PagerGridLayout;

    invoke-virtual {v0, p0}, Lcom/miui/gallery/widget/PagerGridLayout;->setOnPageChangedListener(Lcom/miui/gallery/widget/PagerGridLayout$OnPageChangedListener;)V

    new-instance v0, Lcom/miui/gallery/ui/FacePageFragment$13;

    iget-object v1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mServerIdOfAlbum:Ljava/lang/String;

    iget-wide v2, p0, Lcom/miui/gallery/ui/FacePageFragment;->mLocalIdOfAlbum:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-direct {v0, p0, p0, v1, v2}, Lcom/miui/gallery/ui/FacePageFragment$13;-><init>(Lcom/miui/gallery/ui/FacePageFragment;Lcom/miui/gallery/ui/BaseMediaFragment;Ljava/lang/String;Ljava/lang/Long;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mRecommendFaceAdapter:Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mRecommendFaceAdapter:Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;

    new-instance v1, Lcom/miui/gallery/ui/FacePageFragment$14;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/FacePageFragment$14;-><init>(Lcom/miui/gallery/ui/FacePageFragment;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->setOnLoadingCompleteListener(Lcom/miui/gallery/util/BindImageHelper$OnImageLoadingCompleteListener;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/FacePageFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    const/4 v1, 0x2

    new-instance v2, Lcom/miui/gallery/ui/FacePageFragment$FaceRecommendPhotoLoaderCallback;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/miui/gallery/ui/FacePageFragment$FaceRecommendPhotoLoaderCallback;-><init>(Lcom/miui/gallery/ui/FacePageFragment;Lcom/miui/gallery/ui/FacePageFragment$1;)V

    invoke-virtual {v0, v1, v3, v2}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mRecommendFaceGroupHeader:Landroid/view/View;

    const v1, 0x7f0900ac

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/ui/FacePageFragment$15;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/FacePageFragment$15;-><init>(Lcom/miui/gallery/ui/FacePageFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mRecommendFaceGroupHeader:Landroid/view/View;

    const v1, 0x7f09011d

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/ui/FacePageFragment$16;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/FacePageFragment$16;-><init>(Lcom/miui/gallery/ui/FacePageFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mAddFooterView:Z

    :cond_1
    :goto_0
    return-void
.end method

.method private cancelTask(Lcom/miui/gallery/threadpool/Future;)V
    .locals 1

    if-eqz p1, :cond_0

    invoke-interface {p1}, Lcom/miui/gallery/threadpool/Future;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-interface {p1}, Lcom/miui/gallery/threadpool/Future;->cancel()V

    :cond_0
    return-void
.end method

.method private changeVisibilityOfShareContainer(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mShareButtonContainer:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mShareButtonContainer:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    return-void
.end method

.method private confirmListener()Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$ConfirmListener;
    .locals 1

    new-instance v0, Lcom/miui/gallery/ui/FacePageFragment$19;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/FacePageFragment$19;-><init>(Lcom/miui/gallery/ui/FacePageFragment;)V

    return-object v0
.end method

.method private displayFaceCover()V
    .locals 9

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceCoverPath:Ljava/lang/String;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v1

    sget-object v0, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->FILE:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    iget-object v2, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceCoverPath:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->wrap(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceCoverViewAware:Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    iget-object v4, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceCoverDisplayOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    const/4 v5, 0x0

    new-instance v6, Lcom/miui/gallery/ui/FacePageFragment$8;

    invoke-direct {v6, p0}, Lcom/miui/gallery/ui/FacePageFragment$8;-><init>(Lcom/miui/gallery/ui/FacePageFragment;)V

    const/4 v7, 0x0

    iget-object v8, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceCoverRectF:Landroid/graphics/RectF;

    invoke-virtual/range {v1 .. v8}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingProgressListener;Landroid/graphics/RectF;)V

    return-void
.end method

.method private doDelete(Landroid/view/ActionMode;[J)V
    .locals 9

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const-string v1, "FacePageFragmentDeleteMediaDialogFragment"

    new-instance v2, Lcom/miui/gallery/ui/FacePageFragment$18;

    invoke-direct {v2, p0, p1}, Lcom/miui/gallery/ui/FacePageFragment$18;-><init>(Lcom/miui/gallery/ui/FacePageFragment;Landroid/view/ActionMode;)V

    iget-wide v3, p0, Lcom/miui/gallery/ui/FacePageFragment;->mLocalIdOfAlbum:J

    iget-object v5, p0, Lcom/miui/gallery/ui/FacePageFragment;->mAlbumName:Ljava/lang/String;

    const/4 v6, 0x0

    const/16 v7, 0x1c

    move-object v8, p2

    invoke-static/range {v0 .. v8}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->delete(Landroid/app/Activity;Ljava/lang/String;Lcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;JLjava/lang/String;II[J)V

    return-void
.end method

.method private freshFacePhotoCount()V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceCoverHeader:Landroid/view/View;

    const v1, 0x7f090218

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mAdapter:Lcom/miui/gallery/adapter/FacePageAdapter;

    invoke-virtual {v1}, Lcom/miui/gallery/adapter/FacePageAdapter;->getCount()I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v2}, Lcom/miui/gallery/activity/BaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const v4, 0x7f0e0029

    invoke-virtual {v2, v4, v1, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private getAlbumName()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    if-nez v0, :cond_0

    const-string v0, ""

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mAlbumName:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const v1, 0x7f100503

    invoke-virtual {v0, v1}, Lcom/miui/gallery/activity/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mAlbumName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mAlbumName:Ljava/lang/String;

    return-object v0

    :cond_1
    const-string v0, ""

    return-object v0
.end method

.method private getOrderBy()Ljava/lang/String;
    .locals 1

    const-string v0, "dateTaken DESC "

    return-object v0
.end method

.method private getSelectioinArgs()[Ljava/lang/String;
    .locals 3

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    iget-object v1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mServerIdOfAlbum:Ljava/lang/String;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    iget-wide v1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mLocalIdOfAlbum:J

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    return-object v0
.end method

.method private initFaceCoverDisplayOptions()V
    .locals 4

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

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showImageOnFail(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showImageForEmptyUri(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    sget-object v2, Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;->EXACTLY:Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageScaleType(Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    sget-object v2, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->bitmapConfig(Landroid/graphics/Bitmap$Config;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    new-instance v2, Lcom/miui/gallery/util/face/PeopleItemBitmapDisplayer;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lcom/miui/gallery/util/face/PeopleItemBitmapDisplayer;-><init>(Z)V

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->displayer(Lcom/nostra13/universalimageloader/core/display/BitmapDisplayer;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->usingRegionDecoderFace(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceCoverDisplayOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-void
.end method

.method private invalidateFaceGridView()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->postInvalidate()V

    :cond_0
    return-void
.end method

.method private recordDisplayModeCountEvent(Ljava/lang/String;)V
    .locals 2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "mode"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "face"

    const-string v1, "face_change_display_mode"

    invoke-static {p1, v1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method private refreshFaceCover()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mServerIdOfAlbum:Ljava/lang/String;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mCoverRefreshTask:Lcom/miui/gallery/threadpool/Future;

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/FacePageFragment;->cancelTask(Lcom/miui/gallery/threadpool/Future;)V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/ui/FacePageFragment$9;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/FacePageFragment$9;-><init>(Lcom/miui/gallery/ui/FacePageFragment;)V

    new-instance v2, Lcom/miui/gallery/ui/FacePageFragment$10;

    invoke-direct {v2, p0}, Lcom/miui/gallery/ui/FacePageFragment$10;-><init>(Lcom/miui/gallery/ui/FacePageFragment;)V

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/threadpool/FutureListener;)Lcom/miui/gallery/threadpool/Future;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mCoverRefreshTask:Lcom/miui/gallery/threadpool/Future;

    return-void
.end method

.method private refreshFaceNameIfNeeded()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mNameRefreshTask:Lcom/miui/gallery/threadpool/Future;

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/FacePageFragment;->cancelTask(Lcom/miui/gallery/threadpool/Future;)V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/ui/FacePageFragment$11;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/FacePageFragment$11;-><init>(Lcom/miui/gallery/ui/FacePageFragment;)V

    new-instance v2, Lcom/miui/gallery/ui/FacePageFragment$12;

    invoke-direct {v2, p0}, Lcom/miui/gallery/ui/FacePageFragment$12;-><init>(Lcom/miui/gallery/ui/FacePageFragment;)V

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/threadpool/FutureListener;)Lcom/miui/gallery/threadpool/Future;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mNameRefreshTask:Lcom/miui/gallery/threadpool/Future;

    return-void
.end method

.method private seeIfHasRecommendFace()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mServerIdOfAlbum:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/ui/FacePageFragment$6;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/FacePageFragment$6;-><init>(Lcom/miui/gallery/ui/FacePageFragment;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    return-void
.end method

.method private setTitle()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    const v1, 0x7f100396

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/miui/gallery/ui/FacePageFragment;->mAlbumName:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-virtual {p0, v1, v2}, Lcom/miui/gallery/ui/FacePageFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lmiui/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceCoverHeader:Landroid/view/View;

    const v1, 0x7f090118

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mAlbumName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private shoeIgnoreAlert()Z
    .locals 7

    new-instance v1, Lcom/miui/gallery/ui/FacePageFragment$17;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/FacePageFragment$17;-><init>(Lcom/miui/gallery/ui/FacePageFragment;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const-string v3, ""

    iget-object v2, p0, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const v4, 0x7f100421

    invoke-virtual {v2, v4}, Lcom/miui/gallery/activity/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v4

    iget-object v2, p0, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const v5, 0x104000a

    invoke-virtual {v2, v5}, Lcom/miui/gallery/activity/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v2, 0x0

    const/high16 v6, 0x1040000

    invoke-static/range {v0 .. v6}, Lcom/miui/gallery/util/DialogUtil;->showConfirmAlertWithCancel(Landroid/content/Context;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;Ljava/lang/String;Ljava/lang/CharSequence;Ljava/lang/String;I)Landroid/app/AlertDialog;

    const/4 v0, 0x1

    return v0
.end method

.method private showMergeHandler()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceAlbumMergeHandler:Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

    iget-wide v1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mLocalIdOfAlbum:J

    iget-object v3, p0, Lcom/miui/gallery/ui/FacePageFragment;->mServerIdOfAlbum:Ljava/lang/String;

    iget-object v4, p0, Lcom/miui/gallery/ui/FacePageFragment;->mAlbumName:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;-><init>(JLjava/lang/String;Ljava/lang/String;)V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceMediasetsList:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceMediasetsList:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;

    iget-object v1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v2, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceMediasetsList:Ljava/util/ArrayList;

    invoke-direct {p0}, Lcom/miui/gallery/ui/FacePageFragment;->confirmListener()Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$ConfirmListener;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;-><init>(Landroid/app/Activity;Ljava/util/ArrayList;Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$ConfirmListener;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceAlbumMergeHandler:Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceAlbumMergeHandler:Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->show()V

    return-void
.end method

.method private showRenameHandler()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceAlbumRenameHandler:Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

    iget-wide v1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mLocalIdOfAlbum:J

    invoke-virtual {p0}, Lcom/miui/gallery/ui/FacePageFragment;->getServerIdOfAlbum()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0}, Lcom/miui/gallery/ui/FacePageFragment;->getAlbumName()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;-><init>(JLjava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceMediaSet:Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

    new-instance v0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;

    iget-object v1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v2, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceMediaSet:Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

    invoke-direct {p0}, Lcom/miui/gallery/ui/FacePageFragment;->confirmListener()Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$ConfirmListener;

    move-result-object v3

    iget v4, p0, Lcom/miui/gallery/ui/FacePageFragment;->mRelationType:I

    invoke-static {v4}, Lcom/miui/gallery/model/PeopleContactInfo;->isUnKnownRelation(I)Z

    move-result v4

    xor-int/lit8 v4, v4, 0x1

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;-><init>(Landroid/app/Activity;Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$ConfirmListener;Z)V

    iput-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceAlbumRenameHandler:Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceAlbumRenameHandler:Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->show()V

    return-void
.end method

.method private startRemoveFromFaceAlbum(Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceAlbumHandlerListener;)V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mRemoveFromFaceAlbumHandler:Lcom/miui/gallery/ui/renameface/RemoveFromFaceAlbumHandler;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/ui/renameface/RemoveFromFaceAlbumHandler;

    iget-object v1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    new-instance v2, Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

    iget-wide v3, p0, Lcom/miui/gallery/ui/FacePageFragment;->mLocalIdOfAlbum:J

    invoke-virtual {p0}, Lcom/miui/gallery/ui/FacePageFragment;->getServerIdOfAlbum()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0}, Lcom/miui/gallery/ui/FacePageFragment;->getAlbumName()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;-><init>(JLjava/lang/String;Ljava/lang/String;)V

    invoke-direct {v0, v1, v2, p1}, Lcom/miui/gallery/ui/renameface/RemoveFromFaceAlbumHandler;-><init>(Landroid/app/Activity;Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceAlbumHandlerListener;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mRemoveFromFaceAlbumHandler:Lcom/miui/gallery/ui/renameface/RemoveFromFaceAlbumHandler;

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mRemoveFromFaceAlbumHandler:Lcom/miui/gallery/ui/renameface/RemoveFromFaceAlbumHandler;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/renameface/RemoveFromFaceAlbumHandler;->show()V

    return-void
.end method

.method private toast2CreateBabyAlbumBeforeShare()V
    .locals 5

    new-instance v0, Lcom/miui/gallery/ui/FacePageFragment$4;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/FacePageFragment$4;-><init>(Lcom/miui/gallery/ui/FacePageFragment;)V

    new-instance v1, Lcom/miui/gallery/ui/FacePageFragment$5;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/FacePageFragment$5;-><init>(Lcom/miui/gallery/ui/FacePageFragment;)V

    :try_start_0
    new-instance v2, Landroid/app/AlertDialog$Builder;

    iget-object v3, p0, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {v2, v3}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x1010355

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setIconAttribute(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    const v3, 0x7f1000c2

    invoke-virtual {v2, v3}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const v4, 0x104000a

    invoke-virtual {v3, v4}, Lcom/miui/gallery/activity/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const/high16 v3, 0x1040000

    invoke-virtual {v2, v3}, Lcom/miui/gallery/activity/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method


# virtual methods
.method public changeDisplayMode()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mAdapter:Lcom/miui/gallery/adapter/FacePageAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/FacePageAdapter;->changeDisplayMode()V

    return-void
.end method

.method public changeToNextPage()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mRecommendFaceGroup:Lcom/miui/gallery/widget/PagerGridLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mRecommendFaceGroup:Lcom/miui/gallery/widget/PagerGridLayout;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/PagerGridLayout;->changeToNextPage()V

    :cond_0
    return-void
.end method

.method public getIsHasEverNotCreateBabyAlbumFromThis()J
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mServerIdOfAlbum:Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/provider/FaceManager;->queryBabyAlbumByPeopleId(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method protected getLoader()Landroid/content/Loader;
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/FacePageFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/LoaderManager;->getLoader(I)Landroid/content/Loader;

    move-result-object v0

    return-object v0
.end method

.method public getPageName()Ljava/lang/String;
    .locals 1

    const-string v0, "face"

    return-object v0
.end method

.method public getServerIdOfAlbum()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mServerIdOfAlbum:Ljava/lang/String;

    return-object v0
.end method

.method public isFaceDisplayMode()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mAdapter:Lcom/miui/gallery/adapter/FacePageAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/FacePageAdapter;->isFaceDisplayMode()Z

    move-result v0

    return v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 6

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/BaseMediaFragment;->onActivityCreated(Landroid/os/Bundle;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "server_id_of_album"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mServerIdOfAlbum:Ljava/lang/String;

    const-string v1, "local_id_of_album"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1

    iput-wide v1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mLocalIdOfAlbum:J

    const-string v1, "face_album_cover"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceCoverPath:Ljava/lang/String;

    const-string v1, "face_position_rect"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/graphics/RectF;

    iput-object v1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceCoverRectF:Landroid/graphics/RectF;

    const-string v1, "album_name"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mAlbumName:Ljava/lang/String;

    new-instance v0, Lcom/miui/gallery/ui/FacePageFragment$FacePagePhotoLoaderCallback;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/ui/FacePageFragment$FacePagePhotoLoaderCallback;-><init>(Lcom/miui/gallery/ui/FacePageFragment;Lcom/miui/gallery/ui/FacePageFragment$1;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFacePagePhotoLoaderCallback:Lcom/miui/gallery/ui/FacePageFragment$FacePagePhotoLoaderCallback;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/FacePageFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFacePagePhotoLoaderCallback:Lcom/miui/gallery/ui/FacePageFragment$FacePagePhotoLoaderCallback;

    const/4 v3, 0x1

    invoke-virtual {v0, v3, v1, v2}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    invoke-direct {p0}, Lcom/miui/gallery/ui/FacePageFragment;->addHeaderView()V

    invoke-direct {p0}, Lcom/miui/gallery/ui/FacePageFragment;->setTitle()V

    if-eqz p1, :cond_1

    const-string v0, "NormalPeopleFaceMediaset"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

    iput-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceMediaSet:Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceMediaSet:Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

    if-eqz v0, :cond_0

    new-instance v0, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;

    iget-object v1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v2, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceMediaSet:Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

    invoke-direct {p0}, Lcom/miui/gallery/ui/FacePageFragment;->confirmListener()Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$ConfirmListener;

    move-result-object v4

    iget v5, p0, Lcom/miui/gallery/ui/FacePageFragment;->mRelationType:I

    invoke-static {v5}, Lcom/miui/gallery/model/PeopleContactInfo;->isUnKnownRelation(I)Z

    move-result v5

    xor-int/2addr v3, v5

    invoke-direct {v0, v1, v2, v4, v3}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;-><init>(Landroid/app/Activity;Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$ConfirmListener;Z)V

    iput-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceAlbumRenameHandler:Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;

    :cond_0
    const-string v0, "NormalPeopleFaceMediasetList"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceMediasetsList:Ljava/util/ArrayList;

    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceMediasetsList:Ljava/util/ArrayList;

    if-eqz p1, :cond_1

    new-instance p1, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceMediasetsList:Ljava/util/ArrayList;

    invoke-direct {p0}, Lcom/miui/gallery/ui/FacePageFragment;->confirmListener()Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$ConfirmListener;

    move-result-object v2

    invoke-direct {p1, v0, v1, v2}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;-><init>(Landroid/app/Activity;Ljava/util/ArrayList;Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$ConfirmListener;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceAlbumMergeHandler:Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;

    :cond_1
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2

    const/4 v0, -0x1

    const/4 v1, 0x0

    packed-switch p1, :pswitch_data_0

    :pswitch_0
    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/ui/BaseMediaFragment;->onActivityResult(IILandroid/content/Intent;)V

    goto :goto_2

    :pswitch_1
    if-eqz p3, :cond_5

    if-ne p2, v0, :cond_5

    const-string p1, "all_faces_confirmed"

    const/4 p2, 0x0

    invoke-virtual {p3, p1, p2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    iget-object p2, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFooterView:Landroid/view/View;

    invoke-virtual {p1, p2}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->removeFooterView(Landroid/view/View;)Z

    goto :goto_2

    :pswitch_2
    if-eqz p3, :cond_0

    if-ne p2, v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {p1, p3}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->getContactInfo(Landroid/content/Context;Landroid/content/Intent;)Lcom/miui/gallery/model/PeopleContactInfo;

    move-result-object p1

    goto :goto_0

    :cond_0
    move-object p1, v1

    :goto_0
    iget-object p2, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceAlbumMergeHandler:Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceAlbumMergeHandler:Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->finishWhenGetContact(Lcom/miui/gallery/model/PeopleContactInfo;)V

    :cond_1
    iput-object v1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceMediasetsList:Ljava/util/ArrayList;

    goto :goto_2

    :pswitch_3
    if-eqz p3, :cond_2

    if-ne p2, v0, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {p1, p3}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->getContactInfo(Landroid/content/Context;Landroid/content/Intent;)Lcom/miui/gallery/model/PeopleContactInfo;

    move-result-object v1

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mRemoveFromFaceAlbumHandler:Lcom/miui/gallery/ui/renameface/RemoveFromFaceAlbumHandler;

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mRemoveFromFaceAlbumHandler:Lcom/miui/gallery/ui/renameface/RemoveFromFaceAlbumHandler;

    invoke-virtual {p1, v1}, Lcom/miui/gallery/ui/renameface/RemoveFromFaceAlbumHandler;->finishWhenGetContact(Lcom/miui/gallery/model/PeopleContactInfo;)V

    goto :goto_2

    :pswitch_4
    if-eqz p3, :cond_3

    if-ne p2, v0, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {p1, p3}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->getContactInfo(Landroid/content/Context;Landroid/content/Intent;)Lcom/miui/gallery/model/PeopleContactInfo;

    move-result-object p1

    goto :goto_1

    :cond_3
    move-object p1, v1

    :goto_1
    iget-object p2, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceAlbumRenameHandler:Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;

    if-eqz p2, :cond_4

    iget-object p2, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceAlbumRenameHandler:Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->finishWhenGetContact(Lcom/miui/gallery/model/PeopleContactInfo;)V

    :cond_4
    iput-object v1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceMediaSet:Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

    :cond_5
    :goto_2
    return-void

    :pswitch_data_0
    .packed-switch 0x10
        :pswitch_4
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onDestroy()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseMediaFragment;->onDestroy()V

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mRecommendFaceAdapter:Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mRecommendFaceAdapter:Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;->setOnLoadingCompleteListener(Lcom/miui/gallery/util/BindImageHelper$OnImageLoadingCompleteListener;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mNameRefreshTask:Lcom/miui/gallery/threadpool/Future;

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/FacePageFragment;->cancelTask(Lcom/miui/gallery/threadpool/Future;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mCoverRefreshTask:Lcom/miui/gallery/threadpool/Future;

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/FacePageFragment;->cancelTask(Lcom/miui/gallery/threadpool/Future;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mAdapter:Lcom/miui/gallery/adapter/FacePageAdapter;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mAdapter:Lcom/miui/gallery/adapter/FacePageAdapter;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/FacePageAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    :cond_1
    return-void
.end method

.method public onFinishCheckoutPeopleFace(I)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mPeopleRecommendMediaSet:Lcom/miui/gallery/provider/deprecated/PeopleRecommendMediaSet;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/deprecated/PeopleRecommendMediaSet;->refreshRecommendInfo()V

    return-void
.end method

.method public onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2

    const/4 p3, 0x0

    const v0, 0x7f0b007a

    invoke-virtual {p1, v0, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    new-instance p2, Lcom/miui/gallery/adapter/FacePageAdapter;

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {p2, v0}, Lcom/miui/gallery/adapter/FacePageAdapter;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/FacePageFragment;->mAdapter:Lcom/miui/gallery/adapter/FacePageAdapter;

    const p2, 0x7f09014b

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    iput-object p2, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    new-instance p2, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-direct {p2, v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;-><init>(Landroid/widget/AbsListView;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    iget-object p2, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mAdapter:Lcom/miui/gallery/adapter/FacePageAdapter;

    invoke-virtual {p2, v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    new-instance v0, Lcom/miui/gallery/ui/FacePageFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/FacePageFragment$1;-><init>(Lcom/miui/gallery/ui/FacePageFragment;)V

    invoke-virtual {p2, v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {p2, p3}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->setAreHeadersSticky(Z)V

    iget-object p2, p0, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    const v1, 0x7f0b0153

    invoke-virtual {p2, v1, v0, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFooterView:Landroid/view/View;

    iget-object p2, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFooterView:Landroid/view/View;

    const v0, 0x7f09028e

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/ui/FacePageFragment;->mRecommendFaceButtonContainer:Landroid/view/View;

    iget-object p2, p0, Lcom/miui/gallery/ui/FacePageFragment;->mRecommendFaceButtonContainer:Landroid/view/View;

    const v0, 0x7f09028d

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    new-instance v0, Lcom/miui/gallery/ui/FacePageFragment$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/FacePageFragment$2;-><init>(Lcom/miui/gallery/ui/FacePageFragment;)V

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p2}, Lcom/miui/gallery/activity/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object p2

    const-string v0, "relationType"

    const/4 v1, -0x1

    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p2

    iput p2, p0, Lcom/miui/gallery/ui/FacePageFragment;->mRelationType:I

    iget p2, p0, Lcom/miui/gallery/ui/FacePageFragment;->mRelationType:I

    invoke-static {p2}, Lcom/miui/gallery/model/PeopleContactInfo;->isBabyRelation(I)Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-static {}, Lcom/miui/gallery/util/deviceprovider/ApplicationHelper;->supportShare()Z

    move-result p2

    if-eqz p2, :cond_1

    const p2, 0x7f0902a3

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/ui/FacePageFragment;->mShareButtonContainer:Landroid/view/View;

    iget-object p2, p0, Lcom/miui/gallery/ui/FacePageFragment;->mShareButtonContainer:Landroid/view/View;

    invoke-virtual {p2, p3}, Landroid/view/View;->setVisibility(I)V

    iget-object p2, p0, Lcom/miui/gallery/ui/FacePageFragment;->mShareButtonContainer:Landroid/view/View;

    const p3, 0x7f0902a2

    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/widget/ActionMenuItemView;

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0}, Lcom/miui/gallery/util/BuildUtil;->isMiuiSdkGte15(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0702dd

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/miui/gallery/widget/ActionMenuItemView;->setIcon(Landroid/graphics/drawable/Drawable;)V

    :cond_0
    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/ActionMenuItemView;->findViewById(I)Landroid/view/View;

    move-result-object p2

    new-instance p3, Lcom/miui/gallery/ui/FacePageFragment$3;

    invoke-direct {p3, p0}, Lcom/miui/gallery/ui/FacePageFragment$3;-><init>(Lcom/miui/gallery/ui/FacePageFragment;)V

    invoke-virtual {p2, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_1
    iget-object p2, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    const/4 p3, 0x3

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setChoiceMode(I)V

    new-instance p2, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;

    const/4 p3, 0x0

    invoke-direct {p2, p0, p3}, Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;-><init>(Lcom/miui/gallery/ui/FacePageFragment;Lcom/miui/gallery/ui/FacePageFragment$1;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/FacePageFragment;->mListener:Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;

    iget-object p2, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    iget-object p3, p0, Lcom/miui/gallery/ui/FacePageFragment;->mListener:Lcom/miui/gallery/ui/FacePageFragment$ChoiceModeListener;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setMultiChoiceModeListener(Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;)V

    return-object p1
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const/4 v0, 0x1

    sparse-switch p1, :sswitch_data_0

    const/4 p1, 0x0

    return p1

    :sswitch_0
    invoke-direct {p0}, Lcom/miui/gallery/ui/FacePageFragment;->showMergeHandler()V

    return v0

    :sswitch_1
    invoke-direct {p0}, Lcom/miui/gallery/ui/FacePageFragment;->shoeIgnoreAlert()Z

    return v0

    :sswitch_2
    invoke-virtual {p0}, Lcom/miui/gallery/ui/FacePageFragment;->changeDisplayMode()V

    const-string p1, "photo"

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/FacePageFragment;->recordDisplayModeCountEvent(Ljava/lang/String;)V

    return v0

    :sswitch_3
    invoke-virtual {p0}, Lcom/miui/gallery/ui/FacePageFragment;->changeDisplayMode()V

    const-string p1, "face"

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/FacePageFragment;->recordDisplayModeCountEvent(Ljava/lang/String;)V

    return v0

    :sswitch_data_0
    .sparse-switch
        0x7f090006 -> :sswitch_3
        0x7f090007 -> :sswitch_2
        0x7f09000f -> :sswitch_1
        0x7f090015 -> :sswitch_0
    .end sparse-switch
.end method

.method public onPageChanged(IIZ)V
    .locals 4

    if-eqz p3, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    iget-object p2, p0, Lcom/miui/gallery/ui/FacePageFragment;->mRecommendFaceGroupHeader:Landroid/view/View;

    invoke-virtual {p1, p2}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->removeHeaderView(Landroid/view/View;)Z

    return-void

    :cond_0
    iget-object p3, p0, Lcom/miui/gallery/ui/FacePageFragment;->mRecommendFaceGroupHeader:Landroid/view/View;

    const v0, 0x7f09011c

    invoke-virtual {p3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/TextView;

    const/4 v0, 0x1

    if-ne p2, v0, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mRecommendFaceGroupHeader:Landroid/view/View;

    const p2, 0x7f09014f

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_1
    const v1, 0x7f10039f

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    add-int/2addr p1, v0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v2, v3

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v2, v0

    invoke-virtual {p0, v1, v2}, Lcom/miui/gallery/ui/FacePageFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    return-void
.end method

.method public onResume()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseMediaFragment;->onResume()V

    invoke-direct {p0}, Lcom/miui/gallery/ui/FacePageFragment;->refreshFaceNameIfNeeded()V

    invoke-direct {p0}, Lcom/miui/gallery/ui/FacePageFragment;->seeIfHasRecommendFace()V

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mRecommendFaceGroup:Lcom/miui/gallery/widget/PagerGridLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mRecommendFaceGroup:Lcom/miui/gallery/widget/PagerGridLayout;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/PagerGridLayout;->freshCurrentPage()V

    :cond_0
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/BaseMediaFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceMediaSet:Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

    if-eqz v0, :cond_0

    const-string v0, "NormalPeopleFaceMediaset"

    iget-object v1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceMediaSet:Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceMediasetsList:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    const-string v0, "NormalPeopleFaceMediasetList"

    iget-object v1, p0, Lcom/miui/gallery/ui/FacePageFragment;->mFaceMediasetsList:Ljava/util/ArrayList;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    :cond_1
    return-void
.end method

.method public onStop()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseMediaFragment;->onStop()V

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mCheckoutRecommendPeopleTask:Lcom/miui/gallery/util/face/CheckoutRecommendPeople;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/FacePageFragment;->mCheckoutRecommendPeopleTask:Lcom/miui/gallery/util/face/CheckoutRecommendPeople;

    invoke-virtual {v0}, Lcom/miui/gallery/util/face/CheckoutRecommendPeople;->clearListener()V

    :cond_0
    return-void
.end method
