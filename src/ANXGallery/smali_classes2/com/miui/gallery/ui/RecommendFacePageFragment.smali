.class public Lcom/miui/gallery/ui/RecommendFacePageFragment;
.super Lcom/miui/gallery/ui/BaseMediaFragment;
.source "RecommendFacePageFragment.java"

# interfaces
.implements Lcom/miui/gallery/widget/PagerGridLayout$OnPageChangedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/RecommendFacePageFragment$FaceRecommendPhotoLoaderCallback;
    }
.end annotation


# instance fields
.field private confirmButton:Landroid/widget/Button;

.field private mEmptyViewStub:Landroid/view/ViewStub;

.field private mFaceGroup:Lcom/miui/gallery/widget/PagerGridLayout;

.field private mHandler:Landroid/os/Handler;

.field private mLocalIdOfAlbum:J

.field public mNoMoreRecommendations:Z

.field private mNormalView:Landroid/view/View;

.field private mPeopleName:Ljava/lang/String;

.field private mRecommendFaceAdapter:Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;

.field private mRecommendFaceIds:Ljava/lang/String;

.field private mServerIdOfAlbum:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/BaseMediaFragment;-><init>()V

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/ui/RecommendFacePageFragment;->mHandler:Landroid/os/Handler;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/RecommendFacePageFragment;->mNoMoreRecommendations:Z

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/RecommendFacePageFragment;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/RecommendFacePageFragment;->mRecommendFaceIds:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/RecommendFacePageFragment;)Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/RecommendFacePageFragment;->mRecommendFaceAdapter:Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/ui/RecommendFacePageFragment;)Lcom/miui/gallery/widget/PagerGridLayout;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/RecommendFacePageFragment;->mFaceGroup:Lcom/miui/gallery/widget/PagerGridLayout;

    return-object p0
.end method

.method private setTitle()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/RecommendFacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/RecommendFacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    const v1, 0x7f100479

    invoke-virtual {p0, v1}, Lcom/miui/gallery/ui/RecommendFacePageFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lmiui/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public changeToNextPage()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/RecommendFacePageFragment;->mFaceGroup:Lcom/miui/gallery/widget/PagerGridLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/RecommendFacePageFragment;->mFaceGroup:Lcom/miui/gallery/widget/PagerGridLayout;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/PagerGridLayout;->changeToNextPage()V

    :cond_0
    return-void
.end method

.method protected getLoader()Landroid/content/Loader;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getPageName()Ljava/lang/String;
    .locals 1

    const-string v0, "face_recommend"

    return-object v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/BaseMediaFragment;->onActivityCreated(Landroid/os/Bundle;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/RecommendFacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/activity/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "server_id_of_album"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/RecommendFacePageFragment;->mServerIdOfAlbum:Ljava/lang/String;

    iget-object p1, p0, Lcom/miui/gallery/ui/RecommendFacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/activity/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "local_id_of_album"

    const-wide/16 v1, -0x1

    invoke-virtual {p1, v0, v1, v2}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/ui/RecommendFacePageFragment;->mLocalIdOfAlbum:J

    iget-object p1, p0, Lcom/miui/gallery/ui/RecommendFacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/activity/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "album_name"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/RecommendFacePageFragment;->mPeopleName:Ljava/lang/String;

    iget-object p1, p0, Lcom/miui/gallery/ui/RecommendFacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/activity/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "server_ids_of_faces"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/RecommendFacePageFragment;->mRecommendFaceIds:Ljava/lang/String;

    invoke-direct {p0}, Lcom/miui/gallery/ui/RecommendFacePageFragment;->setTitle()V

    new-instance p1, Lcom/miui/gallery/ui/RecommendFacePageFragment$3;

    iget-object v0, p0, Lcom/miui/gallery/ui/RecommendFacePageFragment;->mServerIdOfAlbum:Ljava/lang/String;

    iget-wide v1, p0, Lcom/miui/gallery/ui/RecommendFacePageFragment;->mLocalIdOfAlbum:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-direct {p1, p0, p0, v0, v1}, Lcom/miui/gallery/ui/RecommendFacePageFragment$3;-><init>(Lcom/miui/gallery/ui/RecommendFacePageFragment;Lcom/miui/gallery/ui/BaseMediaFragment;Ljava/lang/String;Ljava/lang/Long;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/RecommendFacePageFragment;->mRecommendFaceAdapter:Lcom/miui/gallery/ui/RecommendFaceGroupAdapter;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/RecommendFacePageFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object p1

    new-instance v0, Lcom/miui/gallery/ui/RecommendFacePageFragment$FaceRecommendPhotoLoaderCallback;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/ui/RecommendFacePageFragment$FaceRecommendPhotoLoaderCallback;-><init>(Lcom/miui/gallery/ui/RecommendFacePageFragment;Lcom/miui/gallery/ui/RecommendFacePageFragment$1;)V

    const/4 v2, 0x2

    invoke-virtual {p1, v2, v1, v0}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    return-void
.end method

.method public onActivityFinish()V
    .locals 3

    iget-boolean v0, p0, Lcom/miui/gallery/ui/RecommendFacePageFragment;->mNoMoreRecommendations:Z

    if-eqz v0, :cond_0

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "all_faces_confirmed"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    iget-object v1, p0, Lcom/miui/gallery/ui/RecommendFacePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const/4 v2, -0x1

    invoke-virtual {v1, v2, v0}, Lcom/miui/gallery/activity/BaseActivity;->setResult(ILandroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method public onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p2, 0x7f0b0123

    const/4 p3, 0x0

    const/4 v0, 0x0

    invoke-virtual {p1, p2, p3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f090115

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/widget/PagerGridLayout;

    iput-object p2, p0, Lcom/miui/gallery/ui/RecommendFacePageFragment;->mFaceGroup:Lcom/miui/gallery/widget/PagerGridLayout;

    iget-object p2, p0, Lcom/miui/gallery/ui/RecommendFacePageFragment;->mFaceGroup:Lcom/miui/gallery/widget/PagerGridLayout;

    invoke-virtual {p2, p0}, Lcom/miui/gallery/widget/PagerGridLayout;->setOnPageChangedListener(Lcom/miui/gallery/widget/PagerGridLayout$OnPageChangedListener;)V

    const p2, 0x7f0900ac

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/Button;

    iput-object p2, p0, Lcom/miui/gallery/ui/RecommendFacePageFragment;->confirmButton:Landroid/widget/Button;

    const p2, 0x7f090255

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/view/ViewStub;

    iput-object p2, p0, Lcom/miui/gallery/ui/RecommendFacePageFragment;->mEmptyViewStub:Landroid/view/ViewStub;

    const p2, 0x7f0901f1

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/ui/RecommendFacePageFragment;->mNormalView:Landroid/view/View;

    iget-object p2, p0, Lcom/miui/gallery/ui/RecommendFacePageFragment;->confirmButton:Landroid/widget/Button;

    new-instance p3, Lcom/miui/gallery/ui/RecommendFacePageFragment$1;

    invoke-direct {p3, p0}, Lcom/miui/gallery/ui/RecommendFacePageFragment$1;-><init>(Lcom/miui/gallery/ui/RecommendFacePageFragment;)V

    invoke-virtual {p2, p3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object p1
.end method

.method public onPageChanged(IIZ)V
    .locals 0

    if-eqz p3, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/RecommendFacePageFragment;->mNormalView:Landroid/view/View;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/ui/RecommendFacePageFragment;->mNoMoreRecommendations:Z

    iget-object p1, p0, Lcom/miui/gallery/ui/RecommendFacePageFragment;->mEmptyViewStub:Landroid/view/ViewStub;

    invoke-virtual {p1}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object p1

    const p2, 0x7f0900ae

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    const p3, 0x7f100332

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(I)V

    const p2, 0x7f090054

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance p2, Lcom/miui/gallery/ui/RecommendFacePageFragment$2;

    invoke-direct {p2, p0}, Lcom/miui/gallery/ui/RecommendFacePageFragment$2;-><init>(Lcom/miui/gallery/ui/RecommendFacePageFragment;)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseMediaFragment;->onResume()V

    iget-object v0, p0, Lcom/miui/gallery/ui/RecommendFacePageFragment;->mFaceGroup:Lcom/miui/gallery/widget/PagerGridLayout;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/RecommendFacePageFragment;->mFaceGroup:Lcom/miui/gallery/widget/PagerGridLayout;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/PagerGridLayout;->freshCurrentPage()V

    :cond_0
    return-void
.end method
