.class public Lcom/miui/gallery/ui/PeoplePageFragment;
.super Lcom/miui/gallery/ui/BaseFragment;
.source "PeoplePageFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;,
        Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;,
        Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;
    }
.end annotation


# instance fields
.field private mChoiceModeListener:Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;

.field private mCompositeDisposable:Lio/reactivex/disposables/CompositeDisposable;

.field private mDisplayPeopleMode:Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;

.field private mEmptyViewStub:Landroid/view/ViewStub;

.field private mFaceAlbumRenameHandler:Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;

.field mFirstLoadFinish:Z

.field private mFooterView:Landroid/view/View;

.field mHandler:Landroid/os/Handler;

.field mHaveShownSetGroupToastDialog:Z

.field private mInMarkMode:Z

.field private mItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

.field private mMarkMyselfHelper:Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;

.field private mMarkName:Ljava/lang/String;

.field private mMarkRelation:Lcom/miui/gallery/model/PeopleContactInfo$Relation;

.field private mPartialPeopleCount:I

.field private mPeopleGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

.field private mPeopleGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

.field private mPeopleItemPublishSubject:Lio/reactivex/subjects/PublishSubject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/subjects/PublishSubject<",
            "Ljava/util/List<",
            "Lcom/miui/gallery/util/face/PeopleItem;",
            ">;>;"
        }
    .end annotation
.end field

.field private mPeoplePageAdapter:Lcom/miui/gallery/adapter/PeoplePageAdapter;

.field private mPeoplePagePhotoLoaderCallback:Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;

.field private mShowEmptyViewHelper:Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/ui/BaseFragment;-><init>()V

    new-instance v0, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;-><init>(Lcom/miui/gallery/ui/PeoplePageFragment;Lcom/miui/gallery/ui/PeoplePageFragment$1;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mShowEmptyViewHelper:Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;

    invoke-static {}, Lio/reactivex/subjects/PublishSubject;->create()Lio/reactivex/subjects/PublishSubject;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mPeopleItemPublishSubject:Lio/reactivex/subjects/PublishSubject;

    new-instance v0, Lio/reactivex/disposables/CompositeDisposable;

    invoke-direct {v0}, Lio/reactivex/disposables/CompositeDisposable;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mCompositeDisposable:Lio/reactivex/disposables/CompositeDisposable;

    sget-object v0, Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;->DISPLAY_PARTIAL_PEOPLE:Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;

    iput-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mDisplayPeopleMode:Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;

    iput-object v1, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mMarkMyselfHelper:Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mInMarkMode:Z

    iput-object v1, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mMarkName:Ljava/lang/String;

    iput-object v1, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mMarkRelation:Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    new-instance v1, Lcom/miui/gallery/ui/PeoplePageFragment$2;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/PeoplePageFragment$2;-><init>(Lcom/miui/gallery/ui/PeoplePageFragment;)V

    iput-object v1, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mHaveShownSetGroupToastDialog:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mFirstLoadFinish:Z

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mHandler:Landroid/os/Handler;

    new-instance v0, Lcom/miui/gallery/ui/PeoplePageFragment$5;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PeoplePageFragment$5;-><init>(Lcom/miui/gallery/ui/PeoplePageFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mChoiceModeListener:Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;

    return-void
.end method

.method static synthetic access$1000(Lcom/miui/gallery/ui/PeoplePageFragment;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    invoke-direct/range {p0 .. p5}, Lcom/miui/gallery/ui/PeoplePageFragment;->finishWithMarkSuccessResult(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method

.method static synthetic access$1100(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mFaceAlbumRenameHandler:Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;

    return-object p0
.end method

.method static synthetic access$1102(Lcom/miui/gallery/ui/PeoplePageFragment;Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;)Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mFaceAlbumRenameHandler:Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;

    return-object p1
.end method

.method static synthetic access$1200(Lcom/miui/gallery/ui/PeoplePageFragment;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct/range {p0 .. p5}, Lcom/miui/gallery/ui/PeoplePageFragment;->finishWithMarkSuccessResult(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1300(Lcom/miui/gallery/ui/PeoplePageFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PeoplePageFragment;->destroySnapshotLoader()V

    return-void
.end method

.method static synthetic access$1400(Lcom/miui/gallery/ui/PeoplePageFragment;)Lio/reactivex/subjects/PublishSubject;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mPeopleItemPublishSubject:Lio/reactivex/subjects/PublishSubject;

    return-object p0
.end method

.method static synthetic access$1500(Lcom/miui/gallery/ui/PeoplePageFragment;)Landroid/view/ViewStub;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mEmptyViewStub:Landroid/view/ViewStub;

    return-object p0
.end method

.method static synthetic access$1600(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mShowEmptyViewHelper:Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;

    return-object p0
.end method

.method static synthetic access$1800(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mPeopleGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    return-object p0
.end method

.method static synthetic access$1900(Lcom/miui/gallery/ui/PeoplePageFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PeoplePageFragment;->loadPeoplePage()V

    return-void
.end method

.method static synthetic access$2002(Lcom/miui/gallery/ui/PeoplePageFragment;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mPartialPeopleCount:I

    return p1
.end method

.method static synthetic access$2100(Lcom/miui/gallery/ui/PeoplePageFragment;)Landroid/view/View;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mFooterView:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$2200(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mMarkMyselfHelper:Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;

    return-object p0
.end method

.method static synthetic access$2202(Lcom/miui/gallery/ui/PeoplePageFragment;Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;)Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mMarkMyselfHelper:Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;

    return-object p1
.end method

.method static synthetic access$2500(Lcom/miui/gallery/ui/PeoplePageFragment;[JLandroid/view/ActionMode;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/PeoplePageFragment;->mergePeople([JLandroid/view/ActionMode;)V

    return-void
.end method

.method static synthetic access$2600(Lcom/miui/gallery/ui/PeoplePageFragment;[JLandroid/view/ActionMode;)Z
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/PeoplePageFragment;->showIgnoreFaceAlbumAlert([JLandroid/view/ActionMode;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$2700(Lcom/miui/gallery/ui/PeoplePageFragment;[JLandroid/view/ActionMode;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/PeoplePageFragment;->showAndSetRelationDialog([JLandroid/view/ActionMode;)V

    return-void
.end method

.method static synthetic access$2800(Lcom/miui/gallery/ui/PeoplePageFragment;[JLandroid/view/ActionMode;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/PeoplePageFragment;->ignoreFaceAlbum([JLandroid/view/ActionMode;)V

    return-void
.end method

.method static synthetic access$300(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mPeoplePagePhotoLoaderCallback:Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mDisplayPeopleMode:Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;

    return-object p0
.end method

.method static synthetic access$402(Lcom/miui/gallery/ui/PeoplePageFragment;Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;)Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mDisplayPeopleMode:Lcom/miui/gallery/ui/PeoplePageFragment$DisplayPeopleMode;

    return-object p1
.end method

.method static synthetic access$500(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mPeopleGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/miui/gallery/adapter/PeoplePageAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mPeoplePageAdapter:Lcom/miui/gallery/adapter/PeoplePageAdapter;

    return-object p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/ui/PeoplePageFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mInMarkMode:Z

    return p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/ui/PeoplePageFragment;)Lcom/miui/gallery/model/PeopleContactInfo$Relation;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mMarkRelation:Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    return-object p0
.end method

.method static synthetic access$900(Lcom/miui/gallery/ui/PeoplePageFragment;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mMarkName:Ljava/lang/String;

    return-object p0
.end method

.method private destroySnapshotLoader()V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/ui/PeoplePageFragment$4;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/PeoplePageFragment$4;-><init>(Lcom/miui/gallery/ui/PeoplePageFragment;)V

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private finishWithMarkSuccessResult(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f100468

    invoke-static {v0, v1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "server_id_of_album"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p2, "local_id_of_album"

    invoke-virtual {v0, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "mark_relation"

    invoke-virtual {v0, p1, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string p1, "origin_album_name"

    invoke-virtual {v0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "mark_album_name"

    invoke-virtual {v0, p1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const/4 p2, -0x1

    invoke-virtual {p1, p2, v0}, Lcom/miui/gallery/activity/BaseActivity;->setResult(ILandroid/content/Intent;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/activity/BaseActivity;->finish()V

    return-void
.end method

.method private finishWithMarkSuccessResult(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f100468

    invoke-static {v0, v1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "server_id_of_album"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p2, "local_id_of_album"

    invoke-virtual {v0, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "album_name"

    invoke-virtual {v0, p1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "origin_album_name"

    invoke-virtual {v0, p1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "mark_album_name"

    invoke-virtual {v0, p1, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const/4 p2, -0x1

    invoke-virtual {p1, p2, v0}, Lcom/miui/gallery/activity/BaseActivity;->setResult(ILandroid/content/Intent;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/activity/BaseActivity;->finish()V

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const/4 p2, 0x0

    invoke-virtual {p1, p2, p2}, Lcom/miui/gallery/activity/BaseActivity;->overridePendingTransition(II)V

    return-void
.end method

.method private ignoreFaceAlbum([JLandroid/view/ActionMode;)V
    .locals 5

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-wide v3, p1, v2

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    invoke-static {v0}, Lcom/miui/gallery/cloud/peopleface/FaceDataManager;->safeIgnorePeopleByIds(Ljava/util/ArrayList;)V

    invoke-virtual {p2}, Landroid/view/ActionMode;->finish()V

    return-void
.end method

.method private loadPeoplePage()V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/ui/PeoplePageFragment$3;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/PeoplePageFragment$3;-><init>(Lcom/miui/gallery/ui/PeoplePageFragment;)V

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private mergePeople([JLandroid/view/ActionMode;)V
    .locals 6

    invoke-static {p1}, Lcom/miui/gallery/provider/FaceManager;->getPeopleBasicInfoByIds([J)Ljava/util/ArrayList;

    move-result-object p1

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/provider/FaceManager$BasicPeopleInfo;

    new-instance v2, Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

    iget v3, v1, Lcom/miui/gallery/provider/FaceManager$BasicPeopleInfo;->id:I

    int-to-long v3, v3

    iget-object v5, v1, Lcom/miui/gallery/provider/FaceManager$BasicPeopleInfo;->serverId:Ljava/lang/String;

    iget-object v1, v1, Lcom/miui/gallery/provider/FaceManager$BasicPeopleInfo;->name:Ljava/lang/String;

    invoke-direct {v2, v3, v4, v5, v1}, Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;-><init>(JLjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    new-instance p1, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;

    iget-object v1, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    new-instance v2, Lcom/miui/gallery/ui/PeoplePageFragment$8;

    invoke-direct {v2, p0, p2}, Lcom/miui/gallery/ui/PeoplePageFragment$8;-><init>(Lcom/miui/gallery/ui/PeoplePageFragment;Landroid/view/ActionMode;)V

    invoke-direct {p1, v1, v0, v2}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;-><init>(Landroid/app/Activity;Ljava/util/ArrayList;Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler$ConfirmListener;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mFaceAlbumRenameHandler:Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mFaceAlbumRenameHandler:Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->show()V

    return-void

    :cond_2
    :goto_1
    return-void
.end method

.method private showAndSetRelationDialog([JLandroid/view/ActionMode;)V
    .locals 5

    array-length v0, p1

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    aget-wide v0, p1, v0

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/FaceManager;->queryContactInfoOfOnePerson(J)Lcom/miui/gallery/model/PeopleContactInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, v0, Lcom/miui/gallery/model/PeopleContactInfo;->relationWithMeText:Ljava/lang/String;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const v2, 0x7f10066b

    invoke-virtual {v1, v2}, Lcom/miui/gallery/activity/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    array-length v3, p1

    new-instance v4, Lcom/miui/gallery/ui/PeoplePageFragment$9;

    invoke-direct {v4, p0, p2, p1}, Lcom/miui/gallery/ui/PeoplePageFragment$9;-><init>(Lcom/miui/gallery/ui/PeoplePageFragment;Landroid/view/ActionMode;[J)V

    invoke-static {v2, v1, v0, v3, v4}, Lcom/miui/gallery/ui/PeopleRelationSetDialogFragment;->createRelationSetDialog(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;ILcom/miui/gallery/ui/PeopleRelationSetDialogFragment$RelationSelectedListener;)V

    return-void
.end method

.method private showIgnoreFaceAlbumAlert([JLandroid/view/ActionMode;)Z
    .locals 7

    new-instance v1, Lcom/miui/gallery/ui/PeoplePageFragment$6;

    invoke-direct {v1, p0, p1, p2}, Lcom/miui/gallery/ui/PeoplePageFragment$6;-><init>(Lcom/miui/gallery/ui/PeoplePageFragment;[JLandroid/view/ActionMode;)V

    new-instance v2, Lcom/miui/gallery/ui/PeoplePageFragment$7;

    invoke-direct {v2, p0, p2}, Lcom/miui/gallery/ui/PeoplePageFragment$7;-><init>(Lcom/miui/gallery/ui/PeoplePageFragment;Landroid/view/ActionMode;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const-string v3, ""

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const p2, 0x7f100421

    invoke-virtual {p1, p2}, Lcom/miui/gallery/activity/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v4

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const p2, 0x104000a

    invoke-virtual {p1, p2}, Lcom/miui/gallery/activity/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/high16 v6, 0x1040000

    invoke-static/range {v0 .. v6}, Lcom/miui/gallery/util/DialogUtil;->showConfirmAlertWithCancel(Landroid/content/Context;Landroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;Ljava/lang/String;Ljava/lang/CharSequence;Ljava/lang/String;I)Landroid/app/AlertDialog;

    const/4 p1, 0x1

    return p1
.end method


# virtual methods
.method public getPageName()Ljava/lang/String;
    .locals 1

    const-string v0, "people"

    return-object v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 4

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/BaseFragment;->onActivityCreated(Landroid/os/Bundle;)V

    new-instance p1, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;-><init>(Lcom/miui/gallery/ui/PeoplePageFragment;Lcom/miui/gallery/ui/PeoplePageFragment$1;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mPeoplePagePhotoLoaderCallback:Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;

    invoke-static {}, Lcom/miui/gallery/ui/AIAlbumStatusHelper;->isFaceAlbumEnabled()Z

    move-result p1

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mShowEmptyViewHelper:Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;

    iget-object v3, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mEmptyViewStub:Landroid/view/ViewStub;

    invoke-static {p1, v3, v2}, Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;->access$1700(Lcom/miui/gallery/ui/PeoplePageFragment$ShowEmptyViewHelper;Landroid/view/ViewStub;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mPeopleGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    const/16 v3, 0x8

    invoke-virtual {p1, v3}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->setVisibility(I)V

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/PeoplePageFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object p1

    iget-object v3, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mPeoplePagePhotoLoaderCallback:Lcom/miui/gallery/ui/PeoplePageFragment$PeoplePagePhotoLoaderCallback;

    invoke-virtual {p1, v2, v0, v3}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/activity/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v3

    if-eqz v3, :cond_5

    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    const-string v3, "markMode"

    invoke-virtual {p1, v3, v1}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    move-result v3

    iput-boolean v3, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mInMarkMode:Z

    iget-boolean v3, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mInMarkMode:Z

    if-eqz v3, :cond_5

    const-string v3, "markName"

    invoke-virtual {p1, v3}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mMarkName:Ljava/lang/String;

    const-string v3, "markRelation"

    invoke-virtual {p1, v3}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    invoke-static {p1}, Lcom/miui/gallery/model/PeopleContactInfo;->getRelationType(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1}, Lcom/miui/gallery/model/PeopleContactInfo;->getRelation(I)Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mMarkRelation:Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mMarkRelation:Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    sget-object v3, Lcom/miui/gallery/model/PeopleContactInfo$Relation;->unknown:Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    if-ne p1, v3, :cond_1

    const-string p1, "PeoplePageFragment"

    const-string v3, "Do not support mark unknown group type"

    invoke-static {p1, v3}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mMarkRelation:Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mMarkName:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mMarkRelation:Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    if-nez p1, :cond_2

    const-string p1, "PeoplePageFragment"

    const-string v0, "Couldn\'t find valid mark arguments!"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PeoplePageFragment;->finish()V

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mMarkName:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    const v0, 0x7f100500

    if-nez p1, :cond_3

    new-array p1, v2, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mMarkName:Ljava/lang/String;

    aput-object v2, p1, v1

    invoke-virtual {p0, v0, p1}, Lcom/miui/gallery/ui/PeoplePageFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mMarkRelation:Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    if-eqz p1, :cond_4

    new-array p1, v2, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mMarkRelation:Lcom/miui/gallery/model/PeopleContactInfo$Relation;

    invoke-static {v2}, Lcom/miui/gallery/model/PeopleContactInfo;->getRelationName(Lcom/miui/gallery/model/PeopleContactInfo$Relation;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, p1, v1

    invoke-virtual {p0, v0, p1}, Lcom/miui/gallery/ui/PeoplePageFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_4
    const p1, 0x7f100501

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PeoplePageFragment;->getString(I)Ljava/lang/String;

    move-result-object p1

    :goto_1
    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    :cond_5
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2

    const/16 v0, 0x13

    const/4 v1, -0x1

    if-eq p1, v0, :cond_3

    const/16 v0, 0x29

    if-eq p1, v0, :cond_0

    packed-switch p1, :pswitch_data_0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mMarkMyselfHelper:Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mMarkMyselfHelper:Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;

    if-ne p2, v1, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0, v1}, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->setLoadMoreMarkResult(Z)V

    :cond_2
    :goto_1
    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/ui/BaseFragment;->onActivityResult(IILandroid/content/Intent;)V

    goto :goto_2

    :cond_3
    :pswitch_0
    const/4 p1, 0x0

    if-eqz p3, :cond_4

    if-ne p2, v1, :cond_4

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {p1, p3}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->getContactInfo(Landroid/content/Context;Landroid/content/Intent;)Lcom/miui/gallery/model/PeopleContactInfo;

    move-result-object p1

    :cond_4
    iget-object p2, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mFaceAlbumRenameHandler:Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/ui/renameface/FaceAlbumRenameHandler;->finishWhenGetContact(Lcom/miui/gallery/model/PeopleContactInfo;)V

    :goto_2
    return-void

    :pswitch_data_0
    .packed-switch 0x10
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/BaseFragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mPeopleGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getFirstVisiblePosition()I

    move-result v0

    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x2

    if-ne p1, v1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mPeopleGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PeoplePageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0a0026

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    invoke-virtual {p1, v1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->setNumColumns(I)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mPeopleGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PeoplePageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0a0025

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    invoke-virtual {p1, v1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->setNumColumns(I)V

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mPeopleGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {p1, v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->setSelection(I)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 10

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/BaseFragment;->onCreate(Landroid/os/Bundle;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mPeopleItemPublishSubject:Lio/reactivex/subjects/PublishSubject;

    invoke-static {}, Lcom/miui/gallery/threadpool/GallerySchedulers;->misc()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/subjects/PublishSubject;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object p1

    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {}, Lcom/miui/gallery/threadpool/GallerySchedulers;->misc()Lio/reactivex/Scheduler;

    move-result-object v1

    const-wide/16 v2, 0x15e

    invoke-virtual {p1, v2, v3, v0, v1}, Lio/reactivex/Observable;->delay(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v4

    sget-object v7, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {}, Lcom/miui/gallery/threadpool/GallerySchedulers;->misc()Lio/reactivex/Scheduler;

    move-result-object v8

    const-wide/16 v5, 0xbb8

    const/4 v9, 0x1

    invoke-virtual/range {v4 .. v9}, Lio/reactivex/Observable;->throttleLatest(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;Z)Lio/reactivex/Observable;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/ui/-$$Lambda$HsxTmekaKE_eSp8SvVyT4vGiMmM;->INSTANCE:Lcom/miui/gallery/ui/-$$Lambda$HsxTmekaKE_eSp8SvVyT4vGiMmM;

    invoke-virtual {p1, v0}, Lio/reactivex/Observable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Observable;->subscribe()Lio/reactivex/disposables/Disposable;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mCompositeDisposable:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v0, p1}, Lio/reactivex/disposables/CompositeDisposable;->add(Lio/reactivex/disposables/Disposable;)Z

    return-void
.end method

.method public onDestroy()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mPeoplePageAdapter:Lcom/miui/gallery/adapter/PeoplePageAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mPeoplePageAdapter:Lcom/miui/gallery/adapter/PeoplePageAdapter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/PeoplePageAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mCompositeDisposable:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v0}, Lio/reactivex/disposables/CompositeDisposable;->dispose()V

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseFragment;->onDestroy()V

    return-void
.end method

.method public onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2

    const/4 p3, 0x0

    const v0, 0x7f0b00e6

    invoke-virtual {p1, v0, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f09014b

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    iput-object p2, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mPeopleGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    iget-object p2, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mPeopleGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->setHeadersIgnorePadding(Z)V

    new-instance p2, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mPeopleGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-direct {p2, v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;-><init>(Landroid/widget/AbsListView;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mPeopleGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    new-instance p2, Lcom/miui/gallery/adapter/PeoplePageAdapter;

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {p2, v0}, Lcom/miui/gallery/adapter/PeoplePageAdapter;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mPeoplePageAdapter:Lcom/miui/gallery/adapter/PeoplePageAdapter;

    iget-object p2, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mPeopleGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mPeoplePageAdapter:Lcom/miui/gallery/adapter/PeoplePageAdapter;

    invoke-virtual {p2, v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mPeopleGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    invoke-virtual {p2, v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mPeopleGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    const/4 v0, 0x3

    invoke-virtual {p2, v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setChoiceMode(I)V

    iget-object p2, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mPeopleGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mChoiceModeListener:Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;

    invoke-virtual {p2, v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setMultiChoiceModeListener(Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mPeopleGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {p2, p3}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->setAreHeadersSticky(Z)V

    const p2, 0x7f0900fd

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/view/ViewStub;

    iput-object p2, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mEmptyViewStub:Landroid/view/ViewStub;

    iget-object p2, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f0b0152

    const/4 v1, 0x0

    invoke-virtual {p2, v0, v1, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mFooterView:Landroid/view/View;

    iget-object p2, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mFooterView:Landroid/view/View;

    new-instance p3, Lcom/miui/gallery/ui/PeoplePageFragment$1;

    invoke-direct {p3, p0}, Lcom/miui/gallery/ui/PeoplePageFragment$1;-><init>(Lcom/miui/gallery/ui/PeoplePageFragment;)V

    invoke-virtual {p2, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object p1
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 3

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f09001c

    if-eq p1, v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const-class v2, Lcom/miui/gallery/activity/facebaby/IgnorePeoplePageActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p1, v0}, Lcom/miui/gallery/activity/BaseActivity;->startActivity(Landroid/content/Intent;)V

    const/4 p1, 0x1

    return p1
.end method

.method public onStop()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseFragment;->onStop()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mMarkMyselfHelper:Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PeoplePageFragment;->mMarkMyselfHelper:Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;

    invoke-virtual {v0}, Lcom/miui/gallery/people/mark/MarkMyselfViewHelper;->onStop()V

    :cond_0
    return-void
.end method
