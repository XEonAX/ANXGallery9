.class Lcom/miui/gallery/picker/PickAlbumPageFragment$AlbumPagePhotoLoaderCallback;
.super Ljava/lang/Object;
.source "PickAlbumPageFragment.java"

# interfaces
.implements Landroid/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/picker/PickAlbumPageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AlbumPagePhotoLoaderCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/picker/PickAlbumPageFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/picker/PickAlbumPageFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickAlbumPageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/picker/PickAlbumPageFragment;Lcom/miui/gallery/picker/PickAlbumPageFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/picker/PickAlbumPageFragment$AlbumPagePhotoLoaderCallback;-><init>(Lcom/miui/gallery/picker/PickAlbumPageFragment;)V

    return-void
.end method

.method private dispatchAlbumUpdates(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/model/Album;",
            ">;)V"
        }
    .end annotation

    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-gtz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickAlbumPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/picker/PickAlbumPageFragment;->access$400(Lcom/miui/gallery/picker/PickAlbumPageFragment;)Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->inflateEmptyView()V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickAlbumPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/picker/PickAlbumPageFragment;->access$000(Lcom/miui/gallery/picker/PickAlbumPageFragment;)Lcom/miui/gallery/adapter/AlbumAdapterBase;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->getData()Landroid/support/v7/util/SortedList;

    move-result-object v0

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {v0, p1}, Landroid/support/v7/util/SortedList;->replaceAll(Ljava/util/Collection;)V

    goto :goto_1

    :cond_2
    invoke-virtual {v0}, Landroid/support/v7/util/SortedList;->size()I

    move-result p1

    if-lez p1, :cond_3

    invoke-virtual {v0}, Landroid/support/v7/util/SortedList;->clear()V

    goto :goto_1

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickAlbumPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/picker/PickAlbumPageFragment;->access$000(Lcom/miui/gallery/picker/PickAlbumPageFragment;)Lcom/miui/gallery/adapter/AlbumAdapterBase;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->notifyDataSetChanged()V

    :goto_1
    return-void
.end method


# virtual methods
.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/content/Loader;
    .locals 1

    const/4 p2, 0x1

    if-ne p1, p2, :cond_0

    new-instance p1, Lcom/miui/gallery/loader/AlbumSnapshotLoader;

    iget-object p2, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickAlbumPageFragment;

    iget-object p2, p2, Lcom/miui/gallery/picker/PickAlbumPageFragment;->mActivity:Landroid/app/Activity;

    invoke-direct {p1, p2}, Lcom/miui/gallery/loader/AlbumSnapshotLoader;-><init>(Landroid/content/Context;)V

    return-object p1

    :cond_0
    const/4 p2, 0x2

    if-ne p1, p2, :cond_1

    new-instance p1, Lcom/miui/gallery/loader/AsyncContentLoader;

    iget-object p2, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickAlbumPageFragment;

    iget-object p2, p2, Lcom/miui/gallery/picker/PickAlbumPageFragment;->mActivity:Landroid/app/Activity;

    new-instance v0, Lcom/miui/gallery/loader/AlbumConvertCallback;

    invoke-direct {v0}, Lcom/miui/gallery/loader/AlbumConvertCallback;-><init>()V

    invoke-direct {p1, p2, v0}, Lcom/miui/gallery/loader/AsyncContentLoader;-><init>(Landroid/content/Context;Lcom/miui/gallery/loader/CursorConvertCallback;)V

    iget-object p2, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickAlbumPageFragment;

    invoke-static {p2}, Lcom/miui/gallery/picker/PickAlbumPageFragment;->access$200(Lcom/miui/gallery/picker/PickAlbumPageFragment;)Landroid/net/Uri;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/loader/AsyncContentLoader;->setUri(Landroid/net/Uri;)V

    iget-object p2, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickAlbumPageFragment;

    invoke-static {p2}, Lcom/miui/gallery/picker/PickAlbumPageFragment;->access$000(Lcom/miui/gallery/picker/PickAlbumPageFragment;)Lcom/miui/gallery/adapter/AlbumAdapterBase;

    move-result-object p2

    invoke-virtual {p2}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->getProjection()[Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/loader/AsyncContentLoader;->setProjection([Ljava/lang/String;)V

    const-string p2, "media_count>0"

    invoke-virtual {p1, p2}, Lcom/miui/gallery/loader/AsyncContentLoader;->setSelection(Ljava/lang/String;)V

    return-object p1

    :cond_1
    const/4 p2, 0x3

    if-ne p1, p2, :cond_2

    new-instance p1, Landroid/content/CursorLoader;

    iget-object p2, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickAlbumPageFragment;

    iget-object p2, p2, Lcom/miui/gallery/picker/PickAlbumPageFragment;->mActivity:Landroid/app/Activity;

    invoke-direct {p1, p2}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;)V

    sget-object p2, Lcom/miui/gallery/provider/GalleryContract$Album;->URI_SHARE_ALL:Landroid/net/Uri;

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setUri(Landroid/net/Uri;)V

    sget-object p2, Lcom/miui/gallery/model/AlbumConstants;->SHARED_ALBUM_PROJECTION:[Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setProjection([Ljava/lang/String;)V

    const-string p2, "count > 0"

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setSelection(Ljava/lang/String;)V

    return-object p1

    :cond_2
    const/4 p2, 0x4

    if-ne p1, p2, :cond_3

    new-instance p1, Landroid/content/CursorLoader;

    iget-object p2, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickAlbumPageFragment;

    iget-object p2, p2, Lcom/miui/gallery/picker/PickAlbumPageFragment;->mActivity:Landroid/app/Activity;

    invoke-direct {p1, p2}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;)V

    sget-object p2, Lcom/miui/gallery/provider/GalleryContract$PeopleFace;->PEOPLE_FACE_COVER_URI:Landroid/net/Uri;

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setUri(Landroid/net/Uri;)V

    return-object p1

    :cond_3
    const/4 p1, 0x0

    return-object p1
.end method

.method public onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 2

    invoke-virtual {p1}, Landroid/content/Loader;->getId()I

    move-result p1

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-ne p1, v1, :cond_1

    if-eqz p2, :cond_0

    move-object v0, p2

    check-cast v0, Ljava/util/List;

    :cond_0
    invoke-direct {p0, v0}, Lcom/miui/gallery/picker/PickAlbumPageFragment$AlbumPagePhotoLoaderCallback;->dispatchAlbumUpdates(Ljava/util/List;)V

    iget-object p1, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickAlbumPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/picker/PickAlbumPageFragment;->access$300(Lcom/miui/gallery/picker/PickAlbumPageFragment;)V

    goto :goto_0

    :cond_1
    const/4 v1, 0x2

    if-ne p1, v1, :cond_3

    if-eqz p2, :cond_2

    move-object v0, p2

    check-cast v0, Lcom/miui/gallery/model/AlbumList;

    :cond_2
    invoke-direct {p0, v0}, Lcom/miui/gallery/picker/PickAlbumPageFragment$AlbumPagePhotoLoaderCallback;->dispatchAlbumUpdates(Ljava/util/List;)V

    goto :goto_0

    :cond_3
    const/4 v0, 0x3

    if-ne p1, v0, :cond_4

    iget-object p1, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickAlbumPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/picker/PickAlbumPageFragment;->access$000(Lcom/miui/gallery/picker/PickAlbumPageFragment;)Lcom/miui/gallery/adapter/AlbumAdapterBase;

    move-result-object p1

    check-cast p2, Landroid/database/Cursor;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->setSharedAlbums(Landroid/database/Cursor;)V

    goto :goto_0

    :cond_4
    const/4 v0, 0x4

    if-ne p1, v0, :cond_5

    iget-object p1, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickAlbumPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/picker/PickAlbumPageFragment;->access$000(Lcom/miui/gallery/picker/PickAlbumPageFragment;)Lcom/miui/gallery/adapter/AlbumAdapterBase;

    move-result-object p1

    check-cast p2, Landroid/database/Cursor;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->setPeopleFaceCover(Landroid/database/Cursor;)V

    :cond_5
    :goto_0
    return-void
.end method

.method public onLoaderReset(Landroid/content/Loader;)V
    .locals 0

    return-void
.end method
