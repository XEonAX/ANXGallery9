.class public Lcom/miui/gallery/movie/ui/view/MovieControllerView;
.super Lcom/miui/gallery/movie/ui/view/BaseMovieView;
.source "MovieControllerView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/movie/ui/view/MovieControllerView$ProgressChangeListener;,
        Lcom/miui/gallery/movie/ui/view/MovieControllerView$DeleteIconVisibleListener;
    }
.end annotation


# instance fields
.field private isLoopPlay:Z

.field private mCurrentTime:I

.field private mDeleteVisible:Z

.field private mDeleteVisibleListener:Lcom/miui/gallery/movie/ui/view/MovieControllerView$DeleteIconVisibleListener;

.field private mIgnoreProgressHide:Z

.field private mIsSeekDisable:Z

.field private mMovieManager:Lcom/miui/gallery/movie/core/MovieManager;

.field private mPlayProgressVisible:Z

.field private mProgressChangeListener:Lcom/miui/gallery/movie/ui/view/MovieControllerView$ProgressChangeListener;

.field private mShowDeleteMode:Z

.field private mShowPlayBtnMode:Z

.field private mStateChangeListener:Lcom/miui/gallery/movie/core/MovieManager$StateChangeListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/movie/ui/view/BaseMovieView;-><init>(Landroid/content/Context;)V

    new-instance p1, Lcom/miui/gallery/movie/ui/view/MovieControllerView$2;

    invoke-direct {p1, p0}, Lcom/miui/gallery/movie/ui/view/MovieControllerView$2;-><init>(Lcom/miui/gallery/movie/ui/view/MovieControllerView;)V

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mStateChangeListener:Lcom/miui/gallery/movie/core/MovieManager$StateChangeListener;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/movie/ui/view/BaseMovieView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p1, Lcom/miui/gallery/movie/ui/view/MovieControllerView$2;

    invoke-direct {p1, p0}, Lcom/miui/gallery/movie/ui/view/MovieControllerView$2;-><init>(Lcom/miui/gallery/movie/ui/view/MovieControllerView;)V

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mStateChangeListener:Lcom/miui/gallery/movie/core/MovieManager$StateChangeListener;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/movie/ui/view/BaseMovieView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p1, Lcom/miui/gallery/movie/ui/view/MovieControllerView$2;

    invoke-direct {p1, p0}, Lcom/miui/gallery/movie/ui/view/MovieControllerView$2;-><init>(Lcom/miui/gallery/movie/ui/view/MovieControllerView;)V

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mStateChangeListener:Lcom/miui/gallery/movie/core/MovieManager$StateChangeListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/movie/ui/view/MovieControllerView;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mIsSeekDisable:Z

    return p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/movie/ui/view/MovieControllerView;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mCurrentTime:I

    return p0
.end method

.method static synthetic access$102(Lcom/miui/gallery/movie/ui/view/MovieControllerView;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mCurrentTime:I

    return p1
.end method

.method static synthetic access$200(Lcom/miui/gallery/movie/ui/view/MovieControllerView;)Lcom/miui/gallery/movie/core/MovieManager;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mMovieManager:Lcom/miui/gallery/movie/core/MovieManager;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/movie/ui/view/MovieControllerView;)Lcom/miui/gallery/movie/ui/view/MovieControllerView$ProgressChangeListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mProgressChangeListener:Lcom/miui/gallery/movie/ui/view/MovieControllerView$ProgressChangeListener;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/movie/ui/view/MovieControllerView;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mIgnoreProgressHide:Z

    return p0
.end method

.method static synthetic access$402(Lcom/miui/gallery/movie/ui/view/MovieControllerView;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mIgnoreProgressHide:Z

    return p1
.end method

.method static synthetic access$500(Lcom/miui/gallery/movie/ui/view/MovieControllerView;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->isLoopPlay:Z

    return p0
.end method


# virtual methods
.method protected createDisplayView()Landroid/view/View;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mMovieManager:Lcom/miui/gallery/movie/core/MovieManager;

    invoke-virtual {v0}, Lcom/miui/gallery/movie/core/MovieManager;->getDisplayView()Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getMovieManager()Lcom/miui/gallery/movie/core/MovieManager;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mMovieManager:Lcom/miui/gallery/movie/core/MovieManager;

    return-object v0
.end method

.method public init()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mMovieManager:Lcom/miui/gallery/movie/core/MovieManager;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/movie/ui/factory/MovieFactory;->createMovieManager(Landroid/content/Context;)Lcom/miui/gallery/movie/core/MovieManager;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mMovieManager:Lcom/miui/gallery/movie/core/MovieManager;

    :cond_0
    invoke-super {p0}, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->init()V

    new-instance v0, Lcom/miui/gallery/movie/ui/view/MovieControllerView$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/movie/ui/view/MovieControllerView$1;-><init>(Lcom/miui/gallery/movie/ui/view/MovieControllerView;)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->setProgressChangeListener(Lcom/miui/gallery/movie/ui/view/BaseMovieView$IProgressChangeListener;)V

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mMovieManager:Lcom/miui/gallery/movie/core/MovieManager;

    iget-object v1, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mStateChangeListener:Lcom/miui/gallery/movie/core/MovieManager$StateChangeListener;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/movie/core/MovieManager;->addStateChangeListener(Lcom/miui/gallery/movie/core/MovieManager$StateChangeListener;)V

    return-void
.end method

.method public init(Lcom/miui/gallery/movie/core/MovieManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mMovieManager:Lcom/miui/gallery/movie/core/MovieManager;

    invoke-virtual {p0}, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->init()V

    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->onDetachedFromWindow()V

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mMovieManager:Lcom/miui/gallery/movie/core/MovieManager;

    iget-object v1, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mStateChangeListener:Lcom/miui/gallery/movie/core/MovieManager$StateChangeListener;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/movie/core/MovieManager;->removeStateChangeListener(Lcom/miui/gallery/movie/core/MovieManager$StateChangeListener;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mMovieManager:Lcom/miui/gallery/movie/core/MovieManager;

    return-void
.end method

.method public onPause()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mMovieManager:Lcom/miui/gallery/movie/core/MovieManager;

    invoke-virtual {v0}, Lcom/miui/gallery/movie/core/MovieManager;->onPause()V

    return-void
.end method

.method public onResume()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mMovieManager:Lcom/miui/gallery/movie/core/MovieManager;

    invoke-virtual {v0}, Lcom/miui/gallery/movie/core/MovieManager;->onResume()V

    return-void
.end method

.method public setCurrentPlayTime(IF)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mCurrentTime:I

    invoke-virtual {p0, p2}, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->updatePlayProgress(F)V

    div-int/lit16 p1, p1, 0x3e8

    invoke-virtual {p0, p1}, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->setDuration(I)V

    return-void
.end method

.method public setDeleteVisible(Z)V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mDeleteVisible:Z

    if-ne v0, p1, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mDeleteVisibleListener:Lcom/miui/gallery/movie/ui/view/MovieControllerView$DeleteIconVisibleListener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mDeleteVisibleListener:Lcom/miui/gallery/movie/ui/view/MovieControllerView$DeleteIconVisibleListener;

    invoke-interface {v0, p1}, Lcom/miui/gallery/movie/ui/view/MovieControllerView$DeleteIconVisibleListener;->onChanged(Z)V

    :cond_1
    iput-boolean p1, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mDeleteVisible:Z

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p1, :cond_2

    iget-boolean p1, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mShowDeleteMode:Z

    if-eqz p1, :cond_2

    invoke-virtual {p0, v0}, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->showDeleteIcon(Z)V

    invoke-virtual {p0, v1}, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->showDuration(Z)V

    goto :goto_0

    :cond_2
    invoke-virtual {p0, v1}, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->showDeleteIcon(Z)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->showDuration(Z)V

    :goto_0
    return-void
.end method

.method public setDeleteVisibleListener(Lcom/miui/gallery/movie/ui/view/MovieControllerView$DeleteIconVisibleListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mDeleteVisibleListener:Lcom/miui/gallery/movie/ui/view/MovieControllerView$DeleteIconVisibleListener;

    return-void
.end method

.method public setLoopPlay(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->isLoopPlay:Z

    return-void
.end method

.method public setMovieInfo(Lcom/miui/gallery/movie/entity/MovieInfo;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mMovieManager:Lcom/miui/gallery/movie/core/MovieManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/movie/core/MovieManager;->setInfo(Lcom/miui/gallery/movie/entity/MovieInfo;)V

    return-void
.end method

.method public setPlayProgressVisible(Z)V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mPlayProgressVisible:Z

    if-ne v0, p1, :cond_0

    return-void

    :cond_0
    iput-boolean p1, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mPlayProgressVisible:Z

    iget-boolean p1, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mPlayProgressVisible:Z

    invoke-virtual {p0, p1}, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->showPlayProgress(Z)V

    return-void
.end method

.method public setProgressChangeListener(Lcom/miui/gallery/movie/ui/view/MovieControllerView$ProgressChangeListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mProgressChangeListener:Lcom/miui/gallery/movie/ui/view/MovieControllerView$ProgressChangeListener;

    return-void
.end method

.method public setSeekDisable(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mIsSeekDisable:Z

    return-void
.end method

.method public setShowDeleteMode(Z)V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mShowDeleteMode:Z

    if-ne v0, p1, :cond_0

    return-void

    :cond_0
    iput-boolean p1, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mShowDeleteMode:Z

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-nez p1, :cond_1

    invoke-virtual {p0, v1}, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->showDeleteIcon(Z)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->showDuration(Z)V

    goto :goto_0

    :cond_1
    iget-boolean p1, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mDeleteVisible:Z

    if-eqz p1, :cond_2

    invoke-virtual {p0, v0}, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->showDeleteIcon(Z)V

    invoke-virtual {p0, v1}, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->showDuration(Z)V

    :cond_2
    :goto_0
    return-void
.end method

.method public setShowPlayBtnMode(Z)V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mShowPlayBtnMode:Z

    if-ne v0, p1, :cond_0

    return-void

    :cond_0
    iput-boolean p1, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mShowPlayBtnMode:Z

    if-nez p1, :cond_1

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->showPlayBtn(Z)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mMovieManager:Lcom/miui/gallery/movie/core/MovieManager;

    invoke-virtual {p1}, Lcom/miui/gallery/movie/core/MovieManager;->getState()I

    move-result p1

    const/4 v0, 0x2

    if-eq p1, v0, :cond_2

    const/4 v0, 0x3

    if-ne p1, v0, :cond_3

    :cond_2
    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->showPlayBtn(Z)V

    :cond_3
    :goto_0
    return-void
.end method

.method public showPlayBtn(Z)V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/movie/ui/view/MovieControllerView;->mShowPlayBtnMode:Z

    if-eqz v0, :cond_0

    invoke-super {p0, p1}, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->showPlayBtn(Z)V

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    invoke-super {p0, p1}, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->showPlayBtn(Z)V

    :goto_0
    return-void
.end method
