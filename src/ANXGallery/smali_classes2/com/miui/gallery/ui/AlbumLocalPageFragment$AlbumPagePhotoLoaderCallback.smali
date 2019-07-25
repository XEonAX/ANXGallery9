.class Lcom/miui/gallery/ui/AlbumLocalPageFragment$AlbumPagePhotoLoaderCallback;
.super Ljava/lang/Object;
.source "AlbumLocalPageFragment.java"

# interfaces
.implements Landroid/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/AlbumLocalPageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AlbumPagePhotoLoaderCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/AlbumLocalPageFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/AlbumLocalPageFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/AlbumLocalPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumLocalPageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/AlbumLocalPageFragment;Lcom/miui/gallery/ui/AlbumLocalPageFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/AlbumLocalPageFragment$AlbumPagePhotoLoaderCallback;-><init>(Lcom/miui/gallery/ui/AlbumLocalPageFragment;)V

    return-void
.end method

.method private getSelection()Ljava/lang/String;
    .locals 1

    const-string v0, "classification = 1"

    return-object v0
.end method


# virtual methods
.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/content/Loader;
    .locals 2

    const/4 p2, 0x1

    if-ne p1, p2, :cond_0

    new-instance p1, Lcom/miui/gallery/loader/AsyncContentLoader;

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumLocalPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumLocalPageFragment;

    iget-object p2, p2, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumLocalPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumLocalPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->mAlbumConvertCallback:Lcom/miui/gallery/loader/CursorConvertCallback;

    invoke-direct {p1, p2, v0}, Lcom/miui/gallery/loader/AsyncContentLoader;-><init>(Landroid/content/Context;Lcom/miui/gallery/loader/CursorConvertCallback;)V

    sget-object p2, Lcom/miui/gallery/provider/GalleryContract$Album;->URI:Landroid/net/Uri;

    invoke-virtual {p2}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p2

    const-string v0, "join_video"

    const-string v1, "false"

    invoke-virtual {p2, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p2

    const-string v0, "join_face"

    const-string v1, "false"

    invoke-virtual {p2, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p2

    const-string v0, "join_share"

    const-string v1, "false"

    invoke-virtual {p2, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p2

    const-string v0, "exclude_empty_album"

    const-string v1, "true"

    invoke-virtual {p2, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p2

    invoke-virtual {p2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/loader/AsyncContentLoader;->setUri(Landroid/net/Uri;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumLocalPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumLocalPageFragment;

    iget-object p2, p2, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {p2}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->getProjection()[Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/loader/AsyncContentLoader;->setProjection([Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumLocalPageFragment$AlbumPagePhotoLoaderCallback;->getSelection()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/loader/AsyncContentLoader;->setSelection(Ljava/lang/String;)V

    const-string p2, "sortBy ASC "

    invoke-virtual {p1, p2}, Lcom/miui/gallery/loader/AsyncContentLoader;->setSortOrder(Ljava/lang/String;)V

    return-object p1

    :cond_0
    const/4 p2, 0x2

    if-ne p1, p2, :cond_1

    new-instance p1, Landroid/content/CursorLoader;

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumLocalPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumLocalPageFragment;

    iget-object p2, p2, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {p1, p2}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;)V

    sget-object p2, Lcom/miui/gallery/provider/GalleryContract$Album;->URI_SHARE_ALL:Landroid/net/Uri;

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setUri(Landroid/net/Uri;)V

    sget-object p2, Lcom/miui/gallery/model/AlbumConstants;->SHARED_ALBUM_PROJECTION:[Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setProjection([Ljava/lang/String;)V

    const-string p2, "count > 0"

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setSelection(Ljava/lang/String;)V

    return-object p1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 2

    invoke-virtual {p1}, Landroid/content/Loader;->getId()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    if-eqz p2, :cond_0

    check-cast p2, Lcom/miui/gallery/model/AlbumList;

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    invoke-static {p2}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumLocalPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumLocalPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {p1}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->getData()Landroid/support/v7/util/SortedList;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/support/v7/util/SortedList;->replaceAll(Ljava/util/Collection;)V

    goto :goto_1

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumLocalPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumLocalPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->access$100(Lcom/miui/gallery/ui/AlbumLocalPageFragment;)Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->inflateEmptyView()V

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumLocalPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumLocalPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {p1}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->getData()Landroid/support/v7/util/SortedList;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v7/util/SortedList;->clear()V

    :goto_1
    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumLocalPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumLocalPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->access$200(Lcom/miui/gallery/ui/AlbumLocalPageFragment;)Z

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumLocalPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumLocalPageFragment;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->access$202(Lcom/miui/gallery/ui/AlbumLocalPageFragment;Z)Z

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumLocalPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumLocalPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->access$300(Lcom/miui/gallery/ui/AlbumLocalPageFragment;)V

    goto :goto_2

    :cond_2
    invoke-virtual {p1}, Landroid/content/Loader;->getId()I

    move-result p1

    const/4 v0, 0x2

    if-ne p1, v0, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumLocalPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumLocalPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    check-cast p2, Landroid/database/Cursor;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->setSharedAlbums(Landroid/database/Cursor;)V

    :cond_3
    :goto_2
    return-void
.end method

.method public onLoaderReset(Landroid/content/Loader;)V
    .locals 0

    return-void
.end method
