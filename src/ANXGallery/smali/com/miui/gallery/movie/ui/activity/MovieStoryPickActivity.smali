.class public Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;
.super Lcom/miui/gallery/picker/PickerActivity;
.source "MovieStoryPickActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;
    }
.end annotation


# instance fields
.field private mMediaInfos:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/card/model/MediaInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mParseTask:Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;

.field private mPickIntent:Landroid/content/Intent;

.field private mPickStoryFragment:Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;

.field private mSelectedPhotoSha1s:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/picker/PickerActivity;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->mMediaInfos:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$102(Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;Ljava/util/List;)Ljava/util/List;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->mMediaInfos:Ljava/util/List;

    return-object p1
.end method

.method static synthetic access$202(Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;)Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->mParseTask:Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;

    return-object p1
.end method

.method static synthetic access$300(Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;)Ljava/util/Set;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->mSelectedPhotoSha1s:Ljava/util/Set;

    return-object p0
.end method

.method static synthetic access$302(Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;Ljava/util/Set;)Ljava/util/Set;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->mSelectedPhotoSha1s:Ljava/util/Set;

    return-object p1
.end method

.method static synthetic access$400(Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;)Lcom/miui/gallery/picker/helper/Picker;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    return-object p0
.end method


# virtual methods
.method protected getFragmentContainerId()I
    .locals 1

    const v0, 0x1020002

    return v0
.end method

.method public getResultIntent()Landroid/content/Intent;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->mPickIntent:Landroid/content/Intent;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->mPickIntent:Landroid/content/Intent;

    goto :goto_0

    :cond_0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    :goto_0
    return-object v0
.end method

.method public onBackPressed()V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->onCancel()V

    return-void
.end method

.method protected onCancel()V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->finish()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/miui/gallery/picker/PickerActivity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const v0, 0x7f05015b

    invoke-virtual {p1, v0}, Landroid/view/Window;->setBackgroundDrawableResource(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->initActionBar()V

    invoke-virtual {p0}, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->mPickIntent:Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    const-string v0, "StoryMoviePickFragment"

    invoke-virtual {p1, v0}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->mPickStoryFragment:Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->mPickStoryFragment:Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;

    if-nez p1, :cond_0

    new-instance p1, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;

    invoke-direct {p1}, Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->mPickStoryFragment:Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->mPickStoryFragment:Lcom/miui/gallery/movie/ui/fragment/MovieStoryPickFragment;

    const-string v0, "StoryMoviePickFragment"

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->startFragment(Landroid/app/Fragment;Ljava/lang/String;ZZ)V

    :cond_0
    return-void
.end method

.method protected onDestroy()V
    .locals 3

    invoke-super {p0}, Lcom/miui/gallery/picker/PickerActivity;->onDestroy()V

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->mPickIntent:Landroid/content/Intent;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iput-object v1, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->mPickIntent:Landroid/content/Intent;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->mParseTask:Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->mParseTask:Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;

    invoke-virtual {v0}, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->mParseTask:Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;->cancel(Z)Z

    :cond_1
    iput-object v1, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->mParseTask:Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;

    :cond_2
    return-void
.end method

.method protected onDone()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->mParseTask:Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;-><init>(Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$1;)V

    iput-object v0, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->mParseTask:Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity;->mParseTask:Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;

    sget-object v1, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Void;

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/movie/ui/activity/MovieStoryPickActivity$ParseTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    :cond_0
    const-string v0, "MovieStoryPickActivity"

    const-string v1, "parse task is running, skip"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method
