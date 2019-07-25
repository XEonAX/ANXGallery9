.class Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$RecentDiscoveryLoaderCallback;
.super Ljava/lang/Object;
.source "PickRecentDiscoveryFragment.java"

# interfaces
.implements Landroid/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RecentDiscoveryLoaderCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$RecentDiscoveryLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$RecentDiscoveryLoaderCallback;-><init>(Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;)V

    return-void
.end method


# virtual methods
.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/content/Loader;
    .locals 1

    new-instance p2, Landroid/content/CursorLoader;

    iget-object v0, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$RecentDiscoveryLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;

    iget-object v0, v0, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->mActivity:Landroid/app/Activity;

    invoke-direct {p2, v0}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;)V

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    sget-object p1, Lcom/miui/gallery/provider/GalleryContract$Album;->URI_ALL:Landroid/net/Uri;

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setUri(Landroid/net/Uri;)V

    sget-object p1, Lcom/miui/gallery/util/AlbumsCursorHelper;->ALL_ALBUMS_PROJECTION:[Ljava/lang/String;

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setProjection([Ljava/lang/String;)V

    const-string p1, "sortBy ASC "

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setSortOrder(Ljava/lang/String;)V

    goto :goto_0

    :pswitch_1
    iget-object p1, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$RecentDiscoveryLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->getUri()Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setUri(Landroid/net/Uri;)V

    sget-object p1, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->PROJECTION:[Ljava/lang/String;

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setProjection([Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$RecentDiscoveryLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;

    invoke-static {p1}, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->access$100(Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setSelection(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$RecentDiscoveryLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;

    invoke-static {p1}, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->access$200(Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;)[Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setSelectionArgs([Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$RecentDiscoveryLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;

    invoke-static {p1}, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->access$300(Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setSortOrder(Ljava/lang/String;)V

    :goto_0
    return-object p2

    nop

    :pswitch_data_0
    .packed-switch 0x1
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
    iget-object p1, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$RecentDiscoveryLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;

    invoke-static {p1}, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->access$400(Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;)Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$PickRecentAlbumTimelineAdapter;

    move-result-object p1

    check-cast p2, Landroid/database/Cursor;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$PickRecentAlbumTimelineAdapter;->setAllAlbums(Landroid/database/Cursor;)V

    goto :goto_0

    :pswitch_1
    iget-object p1, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$RecentDiscoveryLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;

    invoke-static {p1}, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->access$400(Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;)Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$PickRecentAlbumTimelineAdapter;

    move-result-object p1

    check-cast p2, Landroid/database/Cursor;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$PickRecentAlbumTimelineAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    iget-object p1, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$RecentDiscoveryLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->copy2Pick()V

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
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
    iget-object p1, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$RecentDiscoveryLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;

    invoke-static {p1}, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->access$400(Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;)Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$PickRecentAlbumTimelineAdapter;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$PickRecentAlbumTimelineAdapter;->setAllAlbums(Landroid/database/Cursor;)V

    goto :goto_0

    :pswitch_1
    iget-object p1, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$RecentDiscoveryLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;

    invoke-static {p1}, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->access$400(Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;)Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$PickRecentAlbumTimelineAdapter;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$PickRecentAlbumTimelineAdapter;->changeCursor(Landroid/database/Cursor;)V

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
