.class public Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;
.super Lcom/miui/gallery/ui/BaseMediaFragment;
.source "StoryAlbumFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ParseFileMetaValue;,
        Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;,
        Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$StoryAlbumAdapterWrapper;,
        Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;,
        Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;,
        Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$PhotoLoaderCallback;
    }
.end annotation


# instance fields
.field private mActionBarHelper:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;

.field private mAdapter:Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;

.field private mAdapterWrapper:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$StoryAlbumAdapterWrapper;

.field private mCancelDownloadListener:Landroid/content/DialogInterface$OnClickListener;

.field private mCard:Lcom/miui/gallery/card/Card;

.field private mCardDescription:Landroid/widget/TextView;

.field private mCardDownloadDialog:Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;

.field private mCardId:J

.field private mCardTitle:Landroid/widget/TextView;

.field private mCheckDownloadFilesFuture:Lcom/miui/gallery/threadpool/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/threadpool/Future<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private mChoiceModeListener:Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;

.field private mDowloadResultFuture:Lcom/miui/gallery/threadpool/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/threadpool/Future<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private mDownloadCallback:Lcom/miui/gallery/card/ui/detail/CardDownloadDialog$CallBack;

.field private mDownloadListener:Landroid/content/DialogInterface$OnClickListener;

.field private mDownloadPendings:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/picker/uri/Downloader$DownloadTask;",
            ">;"
        }
    .end annotation
.end field

.field private mDownloader:Lcom/miui/gallery/picker/uri/Downloader;

.field private mFlexboxLayoutHeight:I

.field private mFlexboxLayoutManager:Lcom/google/android/flexbox/FlexboxLayoutManager;

.field private mHeaderView:Landroid/view/View;

.field private mImageInfos:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/card/model/MediaInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mIsInActionMode:Z

.field private mIsNightMode:Z

.field private mIsPlayIconScrollStateEnable:Z

.field private mIsShowTranslucentStatusBar:Z

.field private mListViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

.field private mOnGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

.field private mParseFileMetaValues:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ParseFileMetaValue;",
            ">;"
        }
    .end annotation
.end field

.field private mPhotoLoaderCallback:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$PhotoLoaderCallback;

.field private mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

.field private mResults:[Landroid/net/Uri;

.field private mSelectedPhotoSha1s:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mSlideShowHeaderView:Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/BaseMediaFragment;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mIsPlayIconScrollStateEnable:Z

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mDownloadPendings:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mParseFileMetaValues:Ljava/util/ArrayList;

    new-instance v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$3;-><init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mOnGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    new-instance v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;

    invoke-direct {v0, p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$4;-><init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mChoiceModeListener:Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;

    new-instance v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$5;

    invoke-direct {v0, p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$5;-><init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mDownloadListener:Landroid/content/DialogInterface$OnClickListener;

    new-instance v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$6;

    invoke-direct {v0, p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$6;-><init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mCancelDownloadListener:Landroid/content/DialogInterface$OnClickListener;

    new-instance v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$8;

    invoke-direct {v0, p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$8;-><init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mDownloadCallback:Lcom/miui/gallery/card/ui/detail/CardDownloadDialog$CallBack;

    return-void
.end method

.method static synthetic access$1000(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mSlideShowHeaderView:Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;

    return-object p0
.end method

.method static synthetic access$1102(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;Lcom/miui/gallery/threadpool/Future;)Lcom/miui/gallery/threadpool/Future;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mCheckDownloadFilesFuture:Lcom/miui/gallery/threadpool/Future;

    return-object p1
.end method

.method static synthetic access$1200(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Ljava/util/ArrayList;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mParseFileMetaValues:Ljava/util/ArrayList;

    return-object p0
.end method

.method static synthetic access$1300(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->checkDownloadPendingFiles()V

    return-void
.end method

.method static synthetic access$1400(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Ljava/util/ArrayList;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mDownloadPendings:Ljava/util/ArrayList;

    return-object p0
.end method

.method static synthetic access$1500(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$1600(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->showNetworkMeteredDialog()V

    return-void
.end method

.method static synthetic access$1700(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->startDownload()V

    return-void
.end method

.method static synthetic access$1800(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->gotoPhotoMovie()V

    return-void
.end method

.method static synthetic access$2000(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mFlexboxLayoutHeight:I

    return p0
.end method

.method static synthetic access$2100(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->updateFlexBoxLayoutParamHelper()V

    return-void
.end method

.method static synthetic access$2200(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$2300(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Landroid/net/Uri;
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->getUri()Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2400(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)[Ljava/lang/String;
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->getProjection()[Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2500(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;Landroid/database/Cursor;)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->updateImages(Landroid/database/Cursor;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$2600(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;Landroid/database/Cursor;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->parseCursor(Landroid/database/Cursor;)V

    return-void
.end method

.method static synthetic access$2700(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$2800(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mIsInActionMode:Z

    return p0
.end method

.method static synthetic access$2802(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mIsInActionMode:Z

    return p1
.end method

.method static synthetic access$2900(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->updateSlideHeaderPlayStatus()V

    return-void
.end method

.method static synthetic access$300(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$StoryAlbumAdapterWrapper;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mAdapterWrapper:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$StoryAlbumAdapterWrapper;

    return-object p0
.end method

.method static synthetic access$3000(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$3100(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$3200(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActionBarHelper:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;

    return-object p0
.end method

.method static synthetic access$3400(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mListViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    return-object p0
.end method

.method static synthetic access$3500(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Ljava/util/Set;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mSelectedPhotoSha1s:Ljava/util/Set;

    return-object p0
.end method

.method static synthetic access$3600(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$PhotoLoaderCallback;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mPhotoLoaderCallback:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$PhotoLoaderCallback;

    return-object p0
.end method

.method static synthetic access$3700(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/Card;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mCard:Lcom/miui/gallery/card/Card;

    return-object p0
.end method

.method static synthetic access$3800(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$3900(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mAdapter:Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;

    return-object p0
.end method

.method static synthetic access$4000(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$4100(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$4200(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$4300(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$4500(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$4600(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$4700(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mIsShowTranslucentStatusBar:Z

    return p0
.end method

.method static synthetic access$4702(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mIsShowTranslucentStatusBar:Z

    return p1
.end method

.method static synthetic access$4800(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$4900(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    return-object p0
.end method

.method static synthetic access$5000(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$5100(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$5400(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$5500(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->setTitle(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$5600(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->saveAndNotify()V

    return-void
.end method

.method static synthetic access$5700(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$5800(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$5900(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->getSelection()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$6000(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$6100(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$6300(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$6400(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$6500(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mIsNightMode:Z

    return p0
.end method

.method static synthetic access$6600(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$6700(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$6800(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$6900(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)[Ljava/lang/String;
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->getSelectionArgs()[Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$7000(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$7100(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Landroid/view/View;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mHeaderView:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$7200(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$7302(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mIsPlayIconScrollStateEnable:Z

    return p1
.end method

.method static synthetic access$7400(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mCardDownloadDialog:Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;

    return-object p0
.end method

.method static synthetic access$7402(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;)Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mCardDownloadDialog:Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;

    return-object p1
.end method

.method static synthetic access$7500(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$7600(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$7700(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->showConfirmDialog(Z)V

    return-void
.end method

.method static synthetic access$7800(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/picker/uri/Downloader;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mDownloader:Lcom/miui/gallery/picker/uri/Downloader;

    return-object p0
.end method

.method static synthetic access$7802(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;Lcom/miui/gallery/picker/uri/Downloader;)Lcom/miui/gallery/picker/uri/Downloader;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mDownloader:Lcom/miui/gallery/picker/uri/Downloader;

    return-object p1
.end method

.method static synthetic access$7902(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;Lcom/miui/gallery/threadpool/Future;)Lcom/miui/gallery/threadpool/Future;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mDowloadResultFuture:Lcom/miui/gallery/threadpool/Future;

    return-object p1
.end method

.method static synthetic access$800(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->getOrder()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$8000(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)[Landroid/net/Uri;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mResults:[Landroid/net/Uri;

    return-object p0
.end method

.method static synthetic access$8100(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$900(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method private checkDownloadPendingFiles()V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mDownloadPendings:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mDownloadPendings:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mParseFileMetaValues:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Landroid/net/Uri;

    iput-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mResults:[Landroid/net/Uri;

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mParseFileMetaValues:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ParseFileMetaValue;

    iget v2, v1, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ParseFileMetaValue;->position:I

    iget-object v3, v1, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ParseFileMetaValue;->originFilePath:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mResults:[Landroid/net/Uri;

    invoke-static {v4}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v3

    aput-object v3, v1, v2

    goto :goto_0

    :cond_1
    iget-object v3, v1, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ParseFileMetaValue;->thumnailFilePath:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2

    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mResults:[Landroid/net/Uri;

    invoke-static {v4}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v3

    aput-object v3, v1, v2

    goto :goto_0

    :cond_2
    iget-object v1, v1, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ParseFileMetaValue;->downloadUri:Landroid/net/Uri;

    iget-object v3, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mDownloadPendings:Ljava/util/ArrayList;

    new-instance v4, Lcom/miui/gallery/picker/uri/Downloader$DownloadTask;

    sget-object v5, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL:Lcom/miui/gallery/sdk/download/DownloadType;

    const/4 v6, 0x0

    invoke-direct {v4, v1, v5, v6, v2}, Lcom/miui/gallery/picker/uri/Downloader$DownloadTask;-><init>(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;II)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_3
    const-string v0, "StoryAlbumFragment"

    const-string v1, "check dowload file end\uff0cand need download file count: %d ."

    iget-object v2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mDownloadPendings:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method private getOrder()Ljava/lang/String;
    .locals 1

    const-string v0, "alias_create_time DESC "

    return-object v0
.end method

.method private getProjection()[Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->PROJECTION:[Ljava/lang/String;

    return-object v0
.end method

.method private getSelection()Ljava/lang/String;
    .locals 5

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "(localGroupId!=-1000) AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "%s IN (\'%s\')"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "sha1"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, "\',\'"

    iget-object v4, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mSelectedPhotoSha1s:Ljava/util/Set;

    invoke-static {v3, v4}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getSelectionArgs()[Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method private getTopNImages(Ljava/util/List;I)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/card/model/MediaInfo;",
            ">;I)",
            "Ljava/util/List<",
            "Lcom/miui/gallery/card/model/MediaInfo;",
            ">;"
        }
    .end annotation

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_0

    if-lez p2, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    new-instance v1, Lcom/miui/gallery/card/model/MediaInfoScoreComparator;

    invoke-direct {v1}, Lcom/miui/gallery/card/model/MediaInfoScoreComparator;-><init>()V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    const/4 v1, 0x0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-interface {v0, v1, p1}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object p1

    new-instance p2, Lcom/miui/gallery/card/model/MediaInfoTimeComparator;

    invoke-direct {p2}, Lcom/miui/gallery/card/model/MediaInfoTimeComparator;-><init>()V

    invoke-static {p1, p2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method private getUri()Landroid/net/Uri;
    .locals 3

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Media;->URI_OWNER_ALBUM_MEDIA:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "remove_duplicate_items"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method private gotoPhotoMovie()V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mImageInfos:Ljava/util/List;

    const/16 v2, 0x14

    invoke-direct {p0, v1, v2}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->getTopNImages(Ljava/util/List;I)Ljava/util/List;

    move-result-object v1

    iget-wide v2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mCardId:J

    iget-object v4, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mCard:Lcom/miui/gallery/card/Card;

    invoke-static {v4}, Lcom/miui/gallery/card/CardUtil;->getMovieTemplateFromCard(Lcom/miui/gallery/card/Card;)I

    move-result v4

    iget-object v5, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mCard:Lcom/miui/gallery/card/Card;

    invoke-virtual {v5}, Lcom/miui/gallery/card/Card;->getTitle()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mCard:Lcom/miui/gallery/card/Card;

    invoke-virtual {v6}, Lcom/miui/gallery/card/Card;->getDescription()Ljava/lang/String;

    move-result-object v6

    invoke-static/range {v0 .. v6}, Lcom/miui/gallery/util/IntentUtil;->startPhotoMovie(Landroid/app/Activity;Ljava/util/List;JILjava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->recordSlideShowHeaderClick()V

    return-void
.end method

.method private initHeaderView()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mHeaderView:Landroid/view/View;

    const v1, 0x7f0902fa

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mCardTitle:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mHeaderView:Landroid/view/View;

    const v1, 0x7f0900d0

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mCardDescription:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mHeaderView:Landroid/view/View;

    const v1, 0x7f090159

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;

    iput-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mSlideShowHeaderView:Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mSlideShowHeaderView:Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;

    new-instance v1, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$2;

    invoke-direct {v1, p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$2;-><init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private parseCursor(Landroid/database/Cursor;)V
    .locals 2

    if-eqz p1, :cond_1

    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mParseFileMetaValues:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mParseFileMetaValues:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mParseFileMetaValues:Ljava/util/ArrayList;

    new-instance v1, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ParseFileMetaValue;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ParseFileMetaValue;-><init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;Landroid/database/Cursor;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-nez v0, :cond_0

    :cond_1
    return-void
.end method

.method private recordSlideShowHeaderClick()V
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "scenarioId"

    iget-object v2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mCard:Lcom/miui/gallery/card/Card;

    invoke-virtual {v2}, Lcom/miui/gallery/card/Card;->getScenarioId()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "assistant"

    const-string v2, "assistant_card_detail_header_click"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method private saveAndNotify()V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/card/CardManager;->getInstance()Lcom/miui/gallery/card/CardManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mCard:Lcom/miui/gallery/card/Card;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/card/CardManager;->updateCard(Lcom/miui/gallery/card/Card;)V

    return-void
.end method

.method private setTitle(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActionBarHelper:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->setActionBarTitle(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mCardTitle:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private showConfirmDialog(Z)V
    .locals 4

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "download_file_count"

    iget-object v2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mDownloadPendings:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "local_file_count"

    iget-object v2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mResults:[Landroid/net/Uri;

    array-length v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mDownloadPendings:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x0

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/picker/uri/Downloader$DownloadTask;

    iget v3, v3, Lcom/miui/gallery/picker/uri/Downloader$DownloadTask;->mSize:I

    add-int/2addr v2, v3

    goto :goto_0

    :cond_0
    const-string v1, "download_file_size"

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "retry_mode"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    new-instance p1, Lcom/miui/gallery/picker/uri/DownloadConfirmDialog;

    invoke-direct {p1}, Lcom/miui/gallery/picker/uri/DownloadConfirmDialog;-><init>()V

    invoke-virtual {p1, v0}, Lcom/miui/gallery/picker/uri/DownloadConfirmDialog;->setArguments(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const-string v1, "confirm_dialog"

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/picker/uri/DownloadConfirmDialog;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method private showNetworkMeteredDialog()V
    .locals 7

    new-instance v5, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$7;

    invoke-direct {v5, p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$7;-><init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)V

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v1}, Lcom/miui/gallery/activity/BaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f100322

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v2}, Lcom/miui/gallery/activity/BaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f100321

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v3}, Lcom/miui/gallery/activity/BaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f1006b0

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v4}, Lcom/miui/gallery/activity/BaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v6, 0x7f1006b1

    invoke-virtual {v4, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static/range {v0 .. v5}, Lcom/miui/gallery/ui/ConfirmDialog;->showConfirmDialog(Landroid/app/FragmentManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/ui/ConfirmDialog$ConfirmDialogInterface;)V

    return-void
.end method

.method private startDownload()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mDownloader:Lcom/miui/gallery/picker/uri/Downloader;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mDownloader:Lcom/miui/gallery/picker/uri/Downloader;

    invoke-virtual {v0}, Lcom/miui/gallery/picker/uri/Downloader;->cancel()V

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mDownloader:Lcom/miui/gallery/picker/uri/Downloader;

    invoke-virtual {v0}, Lcom/miui/gallery/picker/uri/Downloader;->destroy()V

    :cond_0
    new-instance v0, Lcom/miui/gallery/picker/uri/Downloader;

    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mDownloadPendings:Ljava/util/ArrayList;

    new-instance v2, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$DownloadProgressListener;-><init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$1;)V

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/picker/uri/Downloader;-><init>(Ljava/util/ArrayList;Lcom/miui/gallery/picker/uri/Downloader$DownloadListener;)V

    iput-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mDownloader:Lcom/miui/gallery/picker/uri/Downloader;

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mDownloader:Lcom/miui/gallery/picker/uri/Downloader;

    invoke-virtual {v0}, Lcom/miui/gallery/picker/uri/Downloader;->start()V

    return-void
.end method

.method private updateCardIds()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mCard:Lcom/miui/gallery/card/Card;

    invoke-virtual {v0}, Lcom/miui/gallery/card/Card;->getAllMediaSha1s()Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mCard:Lcom/miui/gallery/card/Card;

    invoke-virtual {v1}, Lcom/miui/gallery/card/Card;->getSelectedMediaSha1s()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mSelectedPhotoSha1s:Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v3

    if-ne v2, v3, :cond_0

    return-void

    :cond_0
    if-nez v0, :cond_1

    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    :cond_1
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_2
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_3
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iget-object v4, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mSelectedPhotoSha1s:Ljava/util/Set;

    invoke-interface {v4, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    invoke-interface {v0, v3}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_4
    iget-object v2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mCard:Lcom/miui/gallery/card/Card;

    const-string v3, "removeByUser"

    invoke-virtual {v2, v1, v3}, Lcom/miui/gallery/card/Card;->setSelectedMediaSha1s(Ljava/util/List;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mCard:Lcom/miui/gallery/card/Card;

    invoke-virtual {v1, v0}, Lcom/miui/gallery/card/Card;->setAllMediaSha1s(Ljava/util/List;)V

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->saveAndNotify()V

    return-void
.end method

.method private updateFlexBoxLayoutParamHelper()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mFlexboxLayoutHeight:I

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mImageInfos:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mImageInfos:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/card/model/MediaInfo;

    invoke-virtual {v2}, Lcom/miui/gallery/card/model/MediaInfo;->getOrientation()I

    move-result v3

    invoke-static {v3}, Lcom/miui/gallery/util/ExifUtil;->isWidthHeightRotated(I)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v2}, Lcom/miui/gallery/card/model/MediaInfo;->getHeight()I

    move-result v3

    invoke-virtual {v2}, Lcom/miui/gallery/card/model/MediaInfo;->getWidth()I

    move-result v2

    goto :goto_1

    :cond_0
    invoke-virtual {v2}, Lcom/miui/gallery/card/model/MediaInfo;->getWidth()I

    move-result v3

    invoke-virtual {v2}, Lcom/miui/gallery/card/model/MediaInfo;->getHeight()I

    move-result v2

    :goto_1
    new-instance v4, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;

    invoke-direct {v4, v3, v2}, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;-><init>(II)V

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mAdapter:Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;

    iget v2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mFlexboxLayoutHeight:I

    iget-object v3, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v3}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0602a8

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    invoke-virtual {v1, v0, v2, v3}, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->updateLayoutSizes(Ljava/util/List;II)V

    iget v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mFlexboxLayoutHeight:I

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mOnGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    :cond_2
    return-void
.end method

.method private updateImages(Landroid/database/Cursor;)Z
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mImageInfos:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mImageInfos:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mSelectedPhotoSha1s:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->clear()V

    if-eqz p1, :cond_2

    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_2

    :cond_0
    new-instance v1, Lcom/miui/gallery/card/model/MediaInfo;

    invoke-direct {v1, p1}, Lcom/miui/gallery/card/model/MediaInfo;-><init>(Landroid/database/Cursor;)V

    invoke-static {}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->getInstance()Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;

    move-result-object v2

    invoke-virtual {v1}, Lcom/miui/gallery/card/model/MediaInfo;->getId()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->getImageFeature(J)Lcom/miui/gallery/assistant/model/TinyImageFeature;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Lcom/miui/gallery/assistant/model/TinyImageFeature;->getScore()D

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/miui/gallery/card/model/MediaInfo;->setScore(D)V

    :cond_1
    iget-object v2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mImageInfos:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const/16 v1, 0xf

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mSelectedPhotoSha1s:Ljava/util/Set;

    invoke-interface {v2, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-nez v1, :cond_0

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mSelectedPhotoSha1s:Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_3

    const-string p1, "StoryAlbumFragment"

    const-string v1, "empty selected ids after data updated"

    invoke-static {p1, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/activity/BaseActivity;->finish()V

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->updateCardIds()V

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mImageInfos:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    if-eq v0, p1, :cond_4

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->updateFlexBoxLayoutParamHelper()V

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mSlideShowHeaderView:Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mImageInfos:Ljava/util/List;

    const/16 v1, 0x14

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->getTopNImages(Ljava/util/List;I)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->updateMedias(Ljava/util/List;)V

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->updateSlideHeaderPlayStatus()V

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->updateCardIds()V

    const/4 p1, 0x1

    return p1

    :cond_4
    const/4 p1, 0x0

    return p1
.end method

.method private updateSlideHeaderPlayStatus()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mImageInfos:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x3

    if-lt v0, v1, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mIsInActionMode:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mIsPlayIconScrollStateEnable:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mSlideShowHeaderView:Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->setPlayEnable(Z)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mSlideShowHeaderView:Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->setPlayEnable(Z)V

    :goto_0
    return-void
.end method


# virtual methods
.method protected getLoader()Landroid/content/Loader;
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/LoaderManager;->getLoader(I)Landroid/content/Loader;

    move-result-object v0

    return-object v0
.end method

.method public getPageName()Ljava/lang/String;
    .locals 1

    const-string v0, "story_album"

    return-object v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/BaseMediaFragment;->onActivityCreated(Landroid/os/Bundle;)V

    if-eqz p1, :cond_0

    const-string v0, "card_id"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mCardId:J

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_1

    const-string v0, "card_id"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "card_id"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mCardId:J

    :cond_1
    invoke-static {}, Lcom/miui/gallery/card/CardManager;->getInstance()Lcom/miui/gallery/card/CardManager;

    move-result-object p1

    iget-wide v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mCardId:J

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/card/CardManager;->getCardByCardId(J)Lcom/miui/gallery/card/Card;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mCard:Lcom/miui/gallery/card/Card;

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mCard:Lcom/miui/gallery/card/Card;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mCard:Lcom/miui/gallery/card/Card;

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getSelectedMediaSha1s()Ljava/util/List;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mCard:Lcom/miui/gallery/card/Card;

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getSelectedMediaSha1s()Ljava/util/List;

    move-result-object p1

    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mImageInfos:Ljava/util/List;

    new-instance v0, Ljava/util/HashSet;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mSelectedPhotoSha1s:Ljava/util/Set;

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mSelectedPhotoSha1s:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isNightMode(Landroid/content/Context;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mIsNightMode:Z

    new-instance p1, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;-><init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$1;)V

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActionBarHelper:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActionBarHelper:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;

    invoke-static {p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;->access$100(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$ActionBarHelper;)V

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mCard:Lcom/miui/gallery/card/Card;

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getTitle()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->setTitle(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mCardDescription:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mCard:Lcom/miui/gallery/card/Card;

    invoke-virtual {v1}, Lcom/miui/gallery/card/Card;->getDescription()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance p1, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$PhotoLoaderCallback;

    invoke-direct {p1, p0, v0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$PhotoLoaderCallback;-><init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$1;)V

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mPhotoLoaderCallback:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$PhotoLoaderCallback;

    invoke-virtual {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object p1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mPhotoLoaderCallback:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$PhotoLoaderCallback;

    invoke-virtual {p1, v1, v0, v2}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    return-void

    :cond_2
    invoke-virtual {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "StoryAlbumFragment"

    const-string v1, "Card and LocalIds should not be null %s"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Card and LocalIds should not be null,Card id:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mCardId:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public onAttachDialogFragment(Landroid/app/Fragment;)V
    .locals 1

    instance-of v0, p1, Lcom/miui/gallery/picker/uri/DownloadConfirmDialog;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/miui/gallery/picker/uri/DownloadConfirmDialog;

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mDownloadListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/picker/uri/DownloadConfirmDialog;->setPositiveListener(Landroid/content/DialogInterface$OnClickListener;)V

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mCancelDownloadListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/picker/uri/DownloadConfirmDialog;->setNegativeListener(Landroid/content/DialogInterface$OnClickListener;)V

    goto :goto_0

    :cond_0
    instance-of v0, p1, Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;

    if-eqz v0, :cond_1

    check-cast p1, Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mDownloadCallback:Lcom/miui/gallery/card/ui/detail/CardDownloadDialog$CallBack;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;->setCallBack(Lcom/miui/gallery/card/ui/detail/CardDownloadDialog$CallBack;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public onDestroyView()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseMediaFragment;->onDestroyView()V

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mDownloadPendings:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mDownloadPendings:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mParseFileMetaValues:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mParseFileMetaValues:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mCheckDownloadFilesFuture:Lcom/miui/gallery/threadpool/Future;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mCheckDownloadFilesFuture:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/Future;->cancel()V

    iput-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mCheckDownloadFilesFuture:Lcom/miui/gallery/threadpool/Future;

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mDowloadResultFuture:Lcom/miui/gallery/threadpool/Future;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mDowloadResultFuture:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/Future;->cancel()V

    iput-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mDowloadResultFuture:Lcom/miui/gallery/threadpool/Future;

    :cond_3
    return-void
.end method

.method public onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3

    const/4 p3, 0x0

    const v0, 0x7f0b0169

    invoke-virtual {p1, v0, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f090258

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    iput-object p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    new-instance p2, Lcom/google/android/flexbox/FlexboxLayoutManager;

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {p2, v0}, Lcom/google/android/flexbox/FlexboxLayoutManager;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mFlexboxLayoutManager:Lcom/google/android/flexbox/FlexboxLayoutManager;

    iget-object p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mFlexboxLayoutManager:Lcom/google/android/flexbox/FlexboxLayoutManager;

    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Lcom/google/android/flexbox/FlexboxLayoutManager;->setFlexWrap(I)V

    iget-object p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mFlexboxLayoutManager:Lcom/google/android/flexbox/FlexboxLayoutManager;

    invoke-virtual {p2, p3}, Lcom/google/android/flexbox/FlexboxLayoutManager;->setFlexDirection(I)V

    iget-object p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mFlexboxLayoutManager:Lcom/google/android/flexbox/FlexboxLayoutManager;

    const/4 v1, 0x4

    invoke-virtual {p2, v1}, Lcom/google/android/flexbox/FlexboxLayoutManager;->setAlignItems(I)V

    iget-object p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mFlexboxLayoutManager:Lcom/google/android/flexbox/FlexboxLayoutManager;

    invoke-virtual {p2, v0}, Lcom/google/android/flexbox/FlexboxLayoutManager;->setRecycleChildrenOnDetach(Z)V

    iget-object p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mFlexboxLayoutManager:Lcom/google/android/flexbox/FlexboxLayoutManager;

    invoke-virtual {p2, v1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    new-instance p2, Lcom/google/android/flexbox/FlexboxItemDecoration;

    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {p2, v1}, Lcom/google/android/flexbox/FlexboxItemDecoration;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f070081

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {p2, v1}, Lcom/google/android/flexbox/FlexboxItemDecoration;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v1, p2}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    iget-object p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    const v2, 0x7f0b0167

    invoke-virtual {p2, v2, v1, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mHeaderView:Landroid/view/View;

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->initHeaderView()V

    new-instance p2, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;

    iget-object p3, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {p2, p3}, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mAdapter:Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;

    iget-object p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mAdapter:Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;

    invoke-virtual {p2, v0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;->setHasStableIds(Z)V

    new-instance p2, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$StoryAlbumAdapterWrapper;

    iget-object p3, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mAdapter:Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;

    invoke-direct {p2, p3}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$StoryAlbumAdapterWrapper;-><init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumAdapter;)V

    iput-object p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mAdapterWrapper:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$StoryAlbumAdapterWrapper;

    iget-object p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mAdapterWrapper:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$StoryAlbumAdapterWrapper;

    iget-object p3, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mHeaderView:Landroid/view/View;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$StoryAlbumAdapterWrapper;->addHeaderView(Landroid/view/View;)V

    new-instance p2, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    iget-object p3, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-direct {p2, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;-><init>(Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;)V

    iput-object p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mListViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    iget-object p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mListViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    new-instance p3, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$1;

    invoke-direct {p3, p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$1;-><init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)V

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->setOnItemClickListener(Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;)V

    iget-object p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mListViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    invoke-virtual {p2, v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->enableChoiceMode(Z)V

    iget-object p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mListViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    iget-object p3, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mChoiceModeListener:Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->setMultiChoiceModeListener(Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;)V

    iget-object p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mListViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    iget-object p3, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mAdapterWrapper:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$StoryAlbumAdapterWrapper;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object p2, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mListViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    new-instance p3, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;

    invoke-direct {p3, p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment$MyOnScrollListener;-><init>(Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;)V

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->setOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    return-object p1
.end method

.method public onPause()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseMediaFragment;->onPause()V

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mDownloader:Lcom/miui/gallery/picker/uri/Downloader;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mDownloader:Lcom/miui/gallery/picker/uri/Downloader;

    invoke-virtual {v0}, Lcom/miui/gallery/picker/uri/Downloader;->pause()V

    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseMediaFragment;->onResume()V

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mDownloader:Lcom/miui/gallery/picker/uri/Downloader;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mDownloader:Lcom/miui/gallery/picker/uri/Downloader;

    invoke-virtual {v0}, Lcom/miui/gallery/picker/uri/Downloader;->resume()V

    :cond_0
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/BaseMediaFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    const-string v0, "card_id"

    iget-wide v1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mCardId:J

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    return-void
.end method

.method public onStart()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseMediaFragment;->onStart()V

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mSlideShowHeaderView:Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;

    invoke-virtual {v0}, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->resume()V

    return-void
.end method

.method public onStop()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseMediaFragment;->onStop()V

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->mSlideShowHeaderView:Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;

    invoke-virtual {v0}, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->pause()V

    return-void
.end method
