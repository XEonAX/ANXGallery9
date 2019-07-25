.class Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;
.super Ljava/lang/Object;
.source "PhotoPageFragmentBase.java"

# interfaces
.implements Landroid/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageFragmentBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PhotoPageLoaderCallBack"
.end annotation


# instance fields
.field private isFirstLoad:Z

.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragmentBase;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;->isFirstLoad:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragmentBase;Lcom/miui/gallery/ui/PhotoPageFragmentBase$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;-><init>(Lcom/miui/gallery/ui/PhotoPageFragmentBase;)V

    return-void
.end method

.method private isRtl()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Configuration;->getLayoutDirection()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method


# virtual methods
.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/content/Loader;
    .locals 2

    const-string p1, "photo_uri"

    invoke-virtual {p2, p1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-static {}, Lcom/miui/gallery/loader/PhotoLoaderManager;->getInstance()Lcom/miui/gallery/loader/PhotoLoaderManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0, v1, p1, p2}, Lcom/miui/gallery/loader/PhotoLoaderManager;->getPhotoDataSet(Landroid/content/Context;Landroid/net/Uri;Landroid/os/Bundle;)Lcom/miui/gallery/loader/BaseLoader;

    move-result-object p1

    return-object p1
.end method

.method public onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 8

    check-cast p2, Lcom/miui/gallery/model/BaseDataSet;

    if-eqz p2, :cond_b

    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataSet;->getCount()I

    move-result p1

    if-nez p1, :cond_0

    goto/16 :goto_5

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result p1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;->isFirstLoad:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getCount()I

    move-result v0

    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataSet;->getCount()I

    move-result v3

    if-eq v0, v3, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;->isRtl()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-virtual {v3}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getImageLoadParams()Lcom/miui/gallery/model/ImageLoadParams;

    move-result-object v3

    if-eqz v3, :cond_2

    new-instance v4, Lcom/miui/gallery/model/BaseDataItem;

    invoke-direct {v4}, Lcom/miui/gallery/model/BaseDataItem;-><init>()V

    invoke-virtual {v3}, Lcom/miui/gallery/model/ImageLoadParams;->getKey()J

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Lcom/miui/gallery/model/BaseDataItem;->setKey(J)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v4

    invoke-virtual {v3}, Lcom/miui/gallery/model/ImageLoadParams;->getPos()I

    move-result v5

    invoke-virtual {p2, v4, v5}, Lcom/miui/gallery/model/BaseDataSet;->getIndexOfItem(Lcom/miui/gallery/model/BaseDataItem;I)I

    move-result v4

    if-ltz v4, :cond_3

    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataSet;->getCount()I

    move-result v5

    if-ge v4, v5, :cond_3

    invoke-virtual {v3}, Lcom/miui/gallery/model/ImageLoadParams;->getPos()I

    move-result v5

    if-eq v4, v5, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getTAG()Ljava/lang/String;

    move-result-object p1

    const-string v5, "data has changed after load finish %d, %d"

    invoke-virtual {v3}, Lcom/miui/gallery/model/ImageLoadParams;->getPos()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {p1, v5, v6, v7}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v3, v4}, Lcom/miui/gallery/model/ImageLoadParams;->updatePosition(I)V

    or-int/lit8 p1, v0, 0x1

    move v0, p1

    move p1, v4

    goto :goto_1

    :cond_2
    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataSet;->getInitPosition()I

    move-result v3

    if-eq p1, v3, :cond_3

    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataSet;->getInitPosition()I

    move-result p1

    :cond_3
    :goto_1
    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-object v3, v3, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    invoke-virtual {v3, p2, v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->changeDataSet(Lcom/miui/gallery/model/BaseDataSet;Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v0

    if-eq p1, v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v0, p1, v2}, Lcom/miui/gallery/widget/ViewPager;->setCurrentItem(IZ)V

    goto/16 :goto_3

    :cond_4
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    invoke-virtual {p1}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->isPreviewing()Z

    move-result p1

    if-eqz p1, :cond_8

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-static {p1, v1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->access$802(Lcom/miui/gallery/ui/PhotoPageFragmentBase;Z)Z

    goto/16 :goto_4

    :cond_5
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->changeDataSet(Lcom/miui/gallery/model/BaseDataSet;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v3, "photo_focused_path"

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_6

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v3, "photo_focused_path"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result p1

    invoke-virtual {p2, v0, p1}, Lcom/miui/gallery/model/BaseDataSet;->getIndexOfItem(Ljava/lang/String;I)I

    move-result p1

    goto :goto_2

    :cond_6
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v3, "photo_focused_id"

    const-wide/16 v4, 0x0

    invoke-virtual {v0, v3, v4, v5}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v6

    cmp-long v0, v6, v4

    if-lez v0, :cond_7

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "photo_focused_id"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result p1

    invoke-virtual {p2, v6, v7, p1}, Lcom/miui/gallery/model/BaseDataSet;->getIndexOfItem(JI)I

    move-result p1

    :cond_7
    :goto_2
    if-ltz p1, :cond_8

    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataSet;->getCount()I

    move-result v0

    if-ge p1, v0, :cond_8

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v0

    if-eq p1, v0, :cond_8

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v0, p1, v2}, Lcom/miui/gallery/widget/ViewPager;->setCurrentItem(IZ)V

    :goto_3
    const/4 v1, 0x0

    :cond_8
    :goto_4
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->access$800(Lcom/miui/gallery/ui/PhotoPageFragmentBase;)Z

    move-result p1

    if-nez p1, :cond_a

    if-eqz v1, :cond_9

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPagerHelper:Lcom/miui/gallery/ui/PhotoPagerHelper;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/PhotoPagerHelper;->setPageChanged(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPagerHelper:Lcom/miui/gallery/ui/PhotoPagerHelper;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/PhotoPagerHelper;->setPageSettled(I)V

    :cond_9
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;->isFirstLoad:Z

    invoke-virtual {p1, p2, v0}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->onDataSetLoaded(Lcom/miui/gallery/model/BaseDataSet;Z)V

    :cond_a
    iput-boolean v2, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;->isFirstLoad:Z

    return-void

    :cond_b
    :goto_5
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->isAdded()Z

    move-result p1

    if-eqz p1, :cond_c

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->isResumed()Z

    move-result p1

    if-eqz p1, :cond_c

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->getTag()Ljava/lang/String;

    move-result-object p1

    const-string p2, "set is empty"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragmentBase$PhotoPageLoaderCallBack;->this$0:Lcom/miui/gallery/ui/PhotoPageFragmentBase;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragmentBase;->finish()V

    :cond_c
    return-void
.end method

.method public onLoaderReset(Landroid/content/Loader;)V
    .locals 0

    return-void
.end method
