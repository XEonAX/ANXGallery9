.class Lcom/miui/gallery/ui/RecentDiscoveryFragment$RecentDiscoveryLoaderCallback;
.super Ljava/lang/Object;
.source "RecentDiscoveryFragment.java"

# interfaces
.implements Landroid/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/RecentDiscoveryFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RecentDiscoveryLoaderCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/RecentDiscoveryFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$RecentDiscoveryLoaderCallback;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/RecentDiscoveryFragment;Lcom/miui/gallery/ui/RecentDiscoveryFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/RecentDiscoveryFragment$RecentDiscoveryLoaderCallback;-><init>(Lcom/miui/gallery/ui/RecentDiscoveryFragment;)V

    return-void
.end method


# virtual methods
.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/content/Loader;
    .locals 2

    new-instance p2, Landroid/content/CursorLoader;

    iget-object v0, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$RecentDiscoveryLoaderCallback;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {p2, v0}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;)V

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    sget-object p1, Lcom/miui/gallery/provider/GalleryContract$Album;->URI_NO_COVERS:Landroid/net/Uri;

    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p1

    const-string v0, "join_share"

    const-string v1, "true"

    invoke-virtual {p1, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setUri(Landroid/net/Uri;)V

    sget-object p1, Lcom/miui/gallery/util/AlbumsCursorHelper;->ALL_ALBUMS_PROJECTION:[Ljava/lang/String;

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setProjection([Ljava/lang/String;)V

    goto :goto_0

    :pswitch_1
    sget-object p1, Lcom/miui/gallery/provider/GalleryContract$Album;->URI_SHARE_ALL:Landroid/net/Uri;

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setUri(Landroid/net/Uri;)V

    sget-object p1, Lcom/miui/gallery/util/ShareAlbumsCursorHelper;->SHARED_ALBUM_PROJECTION:[Ljava/lang/String;

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setProjection([Ljava/lang/String;)V

    const-string p1, "count > 0"

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setSelection(Ljava/lang/String;)V

    goto :goto_0

    :pswitch_2
    iget-object p1, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$RecentDiscoveryLoaderCallback;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getUri()Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setUri(Landroid/net/Uri;)V

    sget-object p1, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->PROJECTION:[Ljava/lang/String;

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setProjection([Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$RecentDiscoveryLoaderCallback;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getSortOrder()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setSortOrder(Ljava/lang/String;)V

    :goto_0
    return-object p2

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 0

    invoke-virtual {p1}, Landroid/content/Loader;->getId()I

    move-result p1

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object p1, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$RecentDiscoveryLoaderCallback;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getAdapter()Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;

    move-result-object p1

    check-cast p2, Landroid/database/Cursor;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->setAllAlbums(Landroid/database/Cursor;)V

    goto :goto_0

    :pswitch_1
    iget-object p1, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$RecentDiscoveryLoaderCallback;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getAdapter()Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;

    move-result-object p1

    check-cast p2, Landroid/database/Cursor;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->setShareAlbums(Landroid/database/Cursor;)V

    goto :goto_0

    :pswitch_2
    iget-object p1, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$RecentDiscoveryLoaderCallback;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getAdapter()Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;

    move-result-object p1

    check-cast p2, Landroid/database/Cursor;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    iget-object p1, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$RecentDiscoveryLoaderCallback;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getAdapter()Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->getCount()I

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$RecentDiscoveryLoaderCallback;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->setEmptyViewVisibility(I)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$RecentDiscoveryLoaderCallback;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->setEmptyViewVisibility(I)V

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onLoaderReset(Landroid/content/Loader;)V
    .locals 1

    invoke-virtual {p1}, Landroid/content/Loader;->getId()I

    move-result p1

    const/4 v0, 0x0

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object p1, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$RecentDiscoveryLoaderCallback;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getAdapter()Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->setAllAlbums(Landroid/database/Cursor;)V

    goto :goto_0

    :pswitch_1
    iget-object p1, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$RecentDiscoveryLoaderCallback;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getAdapter()Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->resetShareAlbums()V

    goto :goto_0

    :pswitch_2
    iget-object p1, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$RecentDiscoveryLoaderCallback;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getAdapter()Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->changeCursor(Landroid/database/Cursor;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$RecentDiscoveryLoaderCallback;->this$0:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->setEmptyViewVisibility(I)V

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
