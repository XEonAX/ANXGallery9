.class Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;
.super Ljava/lang/Object;
.source "PhotoPageFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FavoritesManager"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager$QueryTask;
    }
.end annotation


# instance fields
.field private mAddCompleteListener:Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;

.field private mFavoriteInfo:Lcom/miui/gallery/model/FavoriteInfo;

.field private mIsToggling:Z

.field private mMenu:Landroid/view/Menu;

.field private mQueryTask:Landroid/os/AsyncTask;

.field private mRemoveCompleteListener:Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;

.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageFragment;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment;Landroid/view/Menu;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager$1;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->mAddCompleteListener:Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager$2;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->mRemoveCompleteListener:Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->mMenu:Landroid/view/Menu;

    iget-object p2, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    if-eqz p2, :cond_0

    iget-object p2, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result p1

    invoke-virtual {p2, p1}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataItem(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->sendQueryTask(Lcom/miui/gallery/model/BaseDataItem;)V

    :cond_0
    return-void
.end method

.method static synthetic access$7300(Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->sendQueryTask(Lcom/miui/gallery/model/BaseDataItem;)V

    return-void
.end method

.method static synthetic access$7402(Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->mIsToggling:Z

    return p1
.end method

.method static synthetic access$7500(Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;)Z
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->usingStrictMode()Z

    move-result p0

    return p0
.end method

.method static synthetic access$7602(Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;Lcom/miui/gallery/model/FavoriteInfo;)Lcom/miui/gallery/model/FavoriteInfo;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->mFavoriteInfo:Lcom/miui/gallery/model/FavoriteInfo;

    return-object p1
.end method

.method private cancelQueryTask()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->mQueryTask:Landroid/os/AsyncTask;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->mQueryTask:Landroid/os/AsyncTask;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/AsyncTask;->cancel(Z)Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->mQueryTask:Landroid/os/AsyncTask;

    :cond_0
    return-void
.end method

.method private sendQueryTask(Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->mQueryTask:Landroid/os/AsyncTask;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->mQueryTask:Landroid/os/AsyncTask;

    check-cast v0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager$QueryTask;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager$QueryTask;->access$7100(Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager$QueryTask;)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v0

    if-eq p1, v0, :cond_1

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->cancelQueryTask()V

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager$QueryTask;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager$QueryTask;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;Lcom/miui/gallery/model/BaseDataItem;)V

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Void;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager$QueryTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->mQueryTask:Landroid/os/AsyncTask;

    :cond_1
    return-void
.end method

.method private setFavoriteChecked(Z)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->mMenu:Landroid/view/Menu;

    const v1, 0x7f09000e

    invoke-interface {v0, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Landroid/view/MenuItem;->isChecked()Z

    move-result v1

    if-eq v1, p1, :cond_0

    invoke-interface {v0, p1}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    :cond_0
    return-void
.end method

.method private setFavoriteVisible(Z)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->mMenu:Landroid/view/Menu;

    const v1, 0x7f09000e

    invoke-interface {v0, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Landroid/view/MenuItem;->isVisible()Z

    move-result v1

    if-eq v1, p1, :cond_0

    invoke-interface {v0, p1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_0
    return-void
.end method

.method private usingStrictMode()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$7700(Lcom/miui/gallery/ui/PhotoPageFragment;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method


# virtual methods
.method public hide()V
    .locals 0

    return-void
.end method

.method public onDestroy()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->cancelQueryTask()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->mAddCompleteListener:Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->mRemoveCompleteListener:Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;

    return-void
.end method

.method public refreshStatus()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->mFavoriteInfo:Lcom/miui/gallery/model/FavoriteInfo;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->mFavoriteInfo:Lcom/miui/gallery/model/FavoriteInfo;

    invoke-virtual {v0}, Lcom/miui/gallery/model/FavoriteInfo;->isFavoriteUsable()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->setFavoriteVisible(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->mFavoriteInfo:Lcom/miui/gallery/model/FavoriteInfo;

    invoke-virtual {v0}, Lcom/miui/gallery/model/FavoriteInfo;->isFavorite()Z

    move-result v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->setFavoriteChecked(Z)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->setFavoriteVisible(Z)V

    :goto_0
    return-void
.end method

.method public show()V
    .locals 0

    return-void
.end method

.method public toggle()V
    .locals 4

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->mIsToggling:Z

    if-eqz v0, :cond_0

    const-string v0, "PhotoPageFragment"

    const-string v1, "skip frequent toggle"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v2}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataItem(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment;->isProcessingMedia(Lcom/miui/gallery/model/BaseDataItem;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const v1, 0x7f1004cc

    invoke-static {v0, v1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    return-void

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->mMenu:Landroid/view/Menu;

    const v1, 0x7f09000e

    invoke-interface {v0, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    if-nez v0, :cond_2

    return-void

    :cond_2
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->mIsToggling:Z

    invoke-interface {v0}, Landroid/view/MenuItem;->isChecked()Z

    move-result v0

    xor-int/lit8 v1, v0, 0x1

    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->setFavoriteChecked(Z)V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    invoke-virtual {v1}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataSet()Lcom/miui/gallery/model/BaseDataSet;

    move-result-object v1

    if-eqz v1, :cond_4

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v2}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->mAddCompleteListener:Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;

    invoke-virtual {v1, v0, v2, v3}, Lcom/miui/gallery/model/BaseDataSet;->addToFavorites(Landroid/app/Activity;ILcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;)Z

    const-string v0, "favorites"

    const-string v1, "add_to_favorites"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v2}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->mRemoveCompleteListener:Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;

    invoke-virtual {v1, v0, v2, v3}, Lcom/miui/gallery/model/BaseDataSet;->removeFromFavorites(Landroid/app/Activity;ILcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;)Z

    const-string v0, "favorites"

    const-string v1, "remove_from_favorites"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    :cond_4
    :goto_0
    return-void
.end method

.method public updateItem(Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->mFavoriteInfo:Lcom/miui/gallery/model/FavoriteInfo;

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->sendQueryTask(Lcom/miui/gallery/model/BaseDataItem;)V

    return-void
.end method
