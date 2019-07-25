.class Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager$1;
.super Ljava/lang/Object;
.source "PhotoPageFragment.java"

# interfaces
.implements Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete([J)V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$7200(Lcom/miui/gallery/ui/PhotoPageFragment;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    if-eqz p1, :cond_2

    aget-wide v1, p1, v0

    const-wide/16 v3, 0x0

    cmp-long p1, v1, v3

    if-lez p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v2}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataItem(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->access$7300(Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;Lcom/miui/gallery/model/BaseDataItem;)V

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Favorites;->isFirstTimeAddToFavorites()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const v1, 0x7f100016

    invoke-static {p1, v1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v1}, Lcom/miui/gallery/activity/BaseActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f100015

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/miui/gallery/util/TalkBackUtil;->requestAnnouncementEvent(Landroid/view/View;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->refreshStatus()V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const v1, 0x7f10000e

    invoke-static {p1, v1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;

    invoke-static {p1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;->access$7402(Lcom/miui/gallery/ui/PhotoPageFragment$FavoritesManager;Z)Z

    return-void
.end method
