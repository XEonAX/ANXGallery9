.class Lcom/miui/gallery/ui/HomePageFragment$HomePagePhotoLoaderCallback;
.super Ljava/lang/Object;
.source "HomePageFragment.java"

# interfaces
.implements Landroid/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/HomePageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "HomePagePhotoLoaderCallback"
.end annotation


# instance fields
.field private mIsFirstTime:Z

.field private startTime:J

.field final synthetic this$0:Lcom/miui/gallery/ui/HomePageFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/HomePageFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$HomePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/ui/HomePageFragment$HomePagePhotoLoaderCallback;->mIsFirstTime:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/HomePageFragment;Lcom/miui/gallery/ui/HomePageFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/HomePageFragment$HomePagePhotoLoaderCallback;-><init>(Lcom/miui/gallery/ui/HomePageFragment;)V

    return-void
.end method

.method private isTopBarPermanent()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment$HomePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/HomePageFragment;->access$000(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/adapter/HomePageAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/HomePageAdapter;->getItemCount()I

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/cloud/AccountCache;->getAccount()Landroid/accounts/Account;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private saveHomePageIds()V
    .locals 5

    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0x80

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    iget-object v3, p0, Lcom/miui/gallery/ui/HomePageFragment$HomePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {v3}, Lcom/miui/gallery/ui/HomePageFragment;->access$000(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/adapter/HomePageAdapter;

    move-result-object v3

    invoke-virtual {v3}, Lcom/miui/gallery/adapter/HomePageAdapter;->getItemCount()I

    move-result v3

    if-ge v2, v3, :cond_0

    iget-object v3, p0, Lcom/miui/gallery/ui/HomePageFragment$HomePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {v3}, Lcom/miui/gallery/ui/HomePageFragment;->access$000(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/adapter/HomePageAdapter;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/miui/gallery/adapter/HomePageAdapter;->getItemKey(I)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    const-string v1, ","

    invoke-static {v1, v0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/preference/GalleryPreferences$HomePage;->setHomePageImageIds(Ljava/lang/String;)V

    return-void
.end method

.method private updateAfterLoadFinished()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment$HomePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/HomePageFragment;->access$000(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/adapter/HomePageAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/HomePageAdapter;->getItemCount()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment$HomePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/HomePageFragment;->access$900(Lcom/miui/gallery/ui/HomePageFragment;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment$HomePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/HomePageFragment;->access$1000(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/ui/HomePageTopBarController;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/ui/HomePageFragment$HomePagePhotoLoaderCallback;->isTopBarPermanent()Z

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/ui/HomePageFragment$HomePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/HomePageFragment;->access$1000(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/ui/HomePageTopBarController;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/miui/gallery/ui/HomePageTopBarController;->setPermanent(Z)V

    iget-object v1, p0, Lcom/miui/gallery/ui/HomePageFragment$HomePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/HomePageFragment;->access$800(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/widget/TwoStageDrawer;

    move-result-object v1

    xor-int/lit8 v0, v0, 0x1

    invoke-virtual {v1, v0}, Lcom/miui/gallery/widget/TwoStageDrawer;->setDragEnabled(Z)V

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/ui/HomePageFragment$HomePagePhotoLoaderCallback;->saveHomePageIds()V

    return-void
.end method


# virtual methods
.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/content/Loader;
    .locals 2

    const/4 p2, 0x1

    if-ne p1, p2, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/miui/gallery/ui/HomePageFragment$HomePagePhotoLoaderCallback;->startTime:J

    new-instance p1, Landroid/content/CursorLoader;

    iget-object p2, p0, Lcom/miui/gallery/ui/HomePageFragment$HomePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    iget-object p2, p2, Lcom/miui/gallery/ui/HomePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {p1, p2}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;)V

    sget-object p2, Lcom/miui/gallery/ui/HomePageFragment;->PHOTOS_LOADER_URI:Landroid/net/Uri;

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setUri(Landroid/net/Uri;)V

    sget-object p2, Lcom/miui/gallery/ui/HomePageFragment;->PHOTOS_LOADER_PROJECTION:[Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setProjection([Ljava/lang/String;)V

    const-string p2, "alias_show_in_homepage=1 AND sha1 NOT NULL"

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setSelection(Ljava/lang/String;)V

    const-string p2, "alias_sort_time DESC "

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setSortOrder(Ljava/lang/String;)V

    return-object p1

    :cond_0
    const/4 v0, 0x2

    if-ne p1, v0, :cond_1

    invoke-static {}, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->getInstance()Lcom/miui/gallery/discovery/DiscoveryMessageManager;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment$HomePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/HomePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p1, v0, p2}, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->createLoader(Landroid/content/Context;I)Lcom/miui/gallery/loader/DiscoveryMessageLoader;

    move-result-object p1

    return-object p1

    :cond_1
    const/4 v0, 0x3

    if-ne p1, v0, :cond_2

    sget-object p1, Lcom/miui/gallery/provider/GalleryContract$Media;->URI_MONTH_MEDIA:Landroid/net/Uri;

    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p1

    const-string v0, "remove_duplicate_items"

    invoke-static {p2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    const-string v0, "generate_headers"

    invoke-static {p2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, v0, p2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    new-instance p2, Landroid/content/CursorLoader;

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment$HomePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/HomePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {p2, v0}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;)V

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setUri(Landroid/net/Uri;)V

    sget-object p1, Lcom/miui/gallery/ui/HomePageFragment;->PHOTOS_LOADER_PROJECTION:[Ljava/lang/String;

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setProjection([Ljava/lang/String;)V

    const-string p1, "alias_show_in_homepage=1 AND sha1 NOT NULL"

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setSelection(Ljava/lang/String;)V

    const-string p1, "alias_sort_time DESC "

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setSortOrder(Ljava/lang/String;)V

    return-object p2

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method

.method public onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 5

    invoke-virtual {p1}, Landroid/content/Loader;->getId()I

    move-result p1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    iget-boolean p1, p0, Lcom/miui/gallery/ui/HomePageFragment$HomePagePhotoLoaderCallback;->mIsFirstTime:Z

    if-eqz p1, :cond_0

    const-string p1, "HomePageFragment"

    const-string v0, "onLoadFinished %d"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iget-wide v3, p0, Lcom/miui/gallery/ui/HomePageFragment$HomePagePhotoLoaderCallback;->startTime:J

    sub-long/2addr v1, v3

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/HomePageFragment$HomePagePhotoLoaderCallback;->mIsFirstTime:Z

    :cond_0
    check-cast p2, Landroid/database/Cursor;

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$HomePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/HomePageFragment;->access$000(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/adapter/HomePageAdapter;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/adapter/HomePageAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    invoke-direct {p0}, Lcom/miui/gallery/ui/HomePageFragment$HomePagePhotoLoaderCallback;->updateAfterLoadFinished()V

    goto :goto_0

    :cond_1
    const/4 v0, 0x2

    if-ne p1, v0, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$HomePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/HomePageFragment;->access$1000(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/ui/HomePageTopBarController;

    move-result-object p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$HomePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/HomePageFragment;->access$1000(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/ui/HomePageTopBarController;

    move-result-object p1

    check-cast p2, Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/HomePageTopBarController;->setDiscoveryMessage(Ljava/util/ArrayList;)V

    goto :goto_0

    :cond_2
    const/4 v0, 0x3

    if-ne p1, v0, :cond_3

    check-cast p2, Landroid/database/Cursor;

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$HomePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/HomePageFragment;->access$700(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/adapter/MediaMonthAdapter;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/adapter/MediaMonthAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$HomePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/HomePageFragment;->access$1100(Lcom/miui/gallery/ui/HomePageFragment;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$HomePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/HomePageFragment;->access$1200(Lcom/miui/gallery/ui/HomePageFragment;)V

    :cond_3
    :goto_0
    return-void
.end method

.method public onLoaderReset(Landroid/content/Loader;)V
    .locals 1

    invoke-virtual {p1}, Landroid/content/Loader;->getId()I

    move-result p1

    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$HomePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/HomePageFragment;->isResumed()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$HomePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/HomePageFragment;->access$1000(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/ui/HomePageTopBarController;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment$HomePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/HomePageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/HomePageFragment;->access$1000(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/ui/HomePageTopBarController;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/HomePageTopBarController;->setDiscoveryMessage(Ljava/util/ArrayList;)V

    :cond_0
    return-void
.end method
