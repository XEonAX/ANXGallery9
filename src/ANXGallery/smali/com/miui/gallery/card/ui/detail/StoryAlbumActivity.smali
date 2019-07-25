.class public Lcom/miui/gallery/card/ui/detail/StoryAlbumActivity;
.super Lcom/miui/gallery/activity/BaseActivity;
.source "StoryAlbumActivity.java"


# instance fields
.field private mStoryAlbumFragment:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/activity/BaseActivity;-><init>()V

    return-void
.end method

.method private isValidCard(Lcom/miui/gallery/card/Card;)Z
    .locals 1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getSelectedMediaSha1s()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->isValid()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method


# virtual methods
.method protected getFragmentContainerId()I
    .locals 1

    const v0, 0x1020002

    return v0
.end method

.method public onAttachFragment(Landroid/app/Fragment;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/activity/BaseActivity;->onAttachFragment(Landroid/app/Fragment;)V

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumActivity;->mStoryAlbumFragment:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumActivity;->mStoryAlbumFragment:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->onAttachDialogFragment(Landroid/app/Fragment;)V

    :cond_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/miui/gallery/activity/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "card_id"

    const-wide/16 v1, 0x0

    invoke-virtual {p1, v0, v1, v2}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    move-result-wide v0

    invoke-virtual {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const v2, 0x7f05015b

    invoke-virtual {p1, v2}, Landroid/view/Window;->setBackgroundDrawableResource(I)V

    invoke-static {}, Lcom/miui/gallery/card/CardManager;->getInstance()Lcom/miui/gallery/card/CardManager;

    move-result-object p1

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/card/CardManager;->getCardByCardId(J)Lcom/miui/gallery/card/Card;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumActivity;->isValidCard(Lcom/miui/gallery/card/Card;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumActivity;->finish()V

    return-void

    :cond_0
    invoke-static {}, Lcom/miui/gallery/movie/utils/MovieBackgroundDownloadManager;->getInstance()Lcom/miui/gallery/movie/utils/MovieBackgroundDownloadManager;

    move-result-object v2

    invoke-static {p1}, Lcom/miui/gallery/card/CardUtil;->getMovieTemplateFromCard(Lcom/miui/gallery/card/Card;)I

    move-result p1

    invoke-virtual {v2, p0, p1}, Lcom/miui/gallery/movie/utils/MovieBackgroundDownloadManager;->downloadTemplate(Landroid/content/Context;I)V

    invoke-virtual {p0}, Lcom/miui/gallery/card/ui/detail/StoryAlbumActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    const-string v2, "StoryAlbumFragment"

    invoke-virtual {p1, v2}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumActivity;->mStoryAlbumFragment:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumActivity;->mStoryAlbumFragment:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    if-nez p1, :cond_1

    new-instance p1, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-direct {p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumActivity;->mStoryAlbumFragment:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "card_id"

    invoke-virtual {p1, v2, v0, v1}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumActivity;->mStoryAlbumFragment:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;->setArguments(Landroid/os/Bundle;)V

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/StoryAlbumActivity;->mStoryAlbumFragment:Lcom/miui/gallery/card/ui/detail/StoryAlbumFragment;

    const-string v0, "StoryAlbumFragment"

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/miui/gallery/card/ui/detail/StoryAlbumActivity;->startFragment(Landroid/app/Fragment;Ljava/lang/String;ZZ)V

    :cond_1
    return-void
.end method
