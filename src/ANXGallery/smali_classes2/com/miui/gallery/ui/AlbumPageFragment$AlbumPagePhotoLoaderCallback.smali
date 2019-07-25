.class Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;
.super Ljava/lang/Object;
.source "AlbumPageFragment.java"

# interfaces
.implements Landroid/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/AlbumPageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AlbumPagePhotoLoaderCallback"
.end annotation


# instance fields
.field mFooterViewRef:Ljava/lang/ref/SoftReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/SoftReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field mIsManualLoad:Landroid/util/SparseBooleanArray;

.field mLoaderCreateTime:Landroid/util/SparseLongArray;

.field mOtherAlbumEntity:Lcom/miui/gallery/model/OtherAlbum;

.field final synthetic this$0:Lcom/miui/gallery/ui/AlbumPageFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/AlbumPageFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Landroid/util/SparseLongArray;

    invoke-direct {p1}, Landroid/util/SparseLongArray;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->mLoaderCreateTime:Landroid/util/SparseLongArray;

    new-instance p1, Landroid/util/SparseBooleanArray;

    invoke-direct {p1}, Landroid/util/SparseBooleanArray;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->mIsManualLoad:Landroid/util/SparseBooleanArray;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/AlbumPageFragment;Lcom/miui/gallery/ui/AlbumPageFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;-><init>(Lcom/miui/gallery/ui/AlbumPageFragment;)V

    return-void
.end method

.method private dispatchAlbumUpdates(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/model/Album;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->getData()Landroid/support/v7/util/SortedList;

    move-result-object v0

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, p1}, Landroid/support/v7/util/SortedList;->replaceAll(Ljava/util/Collection;)V

    const-string v0, "AlbumPageFragment"

    const-string v3, "dispatch updates to adapter costs [%d ms], [%d] items"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v1

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v3, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Landroid/support/v7/util/SortedList;->size()I

    move-result v1

    if-lez v1, :cond_1

    invoke-virtual {v0}, Landroid/support/v7/util/SortedList;->clear()V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->notifyDataSetChanged()V

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/AlbumPageFragment;->access$1300(Lcom/miui/gallery/ui/AlbumPageFragment;)Lcom/miui/gallery/widget/TwoStageDrawer;

    move-result-object v0

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result p1

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/TwoStageDrawer;->setDragEnabled(Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/AlbumPageFragment;->access$1400(Lcom/miui/gallery/ui/AlbumPageFragment;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->updateFooterUI()V

    return-void
.end method

.method private statAlbumLoadTime(Ljava/lang/String;JI)V
    .locals 2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "loader"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "costs"

    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "count"

    invoke-static {p4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "album"

    const-string p2, "album_load_time"

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method private updateFooterUI()V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/AlbumPageFragment;->access$1500(Lcom/miui/gallery/ui/AlbumPageFragment;)I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->mFooterViewRef:Ljava/lang/ref/SoftReference;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->mFooterViewRef:Ljava/lang/ref/SoftReference;

    invoke-virtual {v1}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    iget-object v2, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    invoke-static {v2}, Lcom/miui/gallery/ui/AlbumPageFragment;->access$1600(Lcom/miui/gallery/ui/AlbumPageFragment;)Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;

    move-result-object v2

    invoke-virtual {v2}, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;->getWrappedAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->mOtherAlbumEntity:Lcom/miui/gallery/model/OtherAlbum;

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-nez v3, :cond_4

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v2

    if-lez v2, :cond_1

    goto :goto_2

    :cond_1
    iget-object v2, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    invoke-static {v2}, Lcom/miui/gallery/ui/AlbumPageFragment;->access$1700(Lcom/miui/gallery/ui/AlbumPageFragment;)Z

    move-result v2

    if-eqz v2, :cond_5

    iget-object v2, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/AlbumPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2}, Lcom/miui/gallery/util/SyncUtil;->existXiaomiAccount(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_5

    if-nez v1, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/AlbumPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0b0016

    iget-object v2, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    iget-object v2, v2, Lcom/miui/gallery/ui/AlbumPageFragment;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v0, v1, v2, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lcom/miui/gallery/ui/AlbumPageListEmptyItem;

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/AlbumPageFragment;->access$800(Lcom/miui/gallery/ui/AlbumPageFragment;)Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/miui/gallery/ui/AlbumPageListEmptyItem;->setTextContainer(Landroid/view/ViewGroup;)V

    new-instance v0, Ljava/lang/ref/SoftReference;

    invoke-direct {v0, v1}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->mFooterViewRef:Ljava/lang/ref/SoftReference;

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/AlbumPageFragment;->access$1600(Lcom/miui/gallery/ui/AlbumPageFragment;)Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;->getFootersCount()I

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/AlbumPageFragment;->access$1600(Lcom/miui/gallery/ui/AlbumPageFragment;)Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;->addFooterView(Landroid/view/View;)V

    goto :goto_1

    :cond_3
    const/4 v4, 0x0

    :goto_1
    const/4 v0, 0x0

    goto :goto_3

    :cond_4
    :goto_2
    if-eqz v1, :cond_5

    iget-object v2, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    invoke-static {v2}, Lcom/miui/gallery/ui/AlbumPageFragment;->access$1600(Lcom/miui/gallery/ui/AlbumPageFragment;)Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;->removeFooterView(Landroid/view/View;)Z

    goto :goto_3

    :cond_5
    const/4 v4, 0x0

    :goto_3
    if-eqz v4, :cond_6

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/AlbumPageFragment;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->invalidateItemDecorations()V

    :cond_6
    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/AlbumPageFragment;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    iget-object v2, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    iget-object v2, v2, Lcom/miui/gallery/ui/AlbumPageFragment;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v2}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getPaddingLeft()I

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    iget-object v3, v3, Lcom/miui/gallery/ui/AlbumPageFragment;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v3}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getTop()I

    move-result v3

    iget-object v4, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    iget-object v4, v4, Lcom/miui/gallery/ui/AlbumPageFragment;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v4}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getPaddingRight()I

    move-result v4

    invoke-virtual {v1, v2, v3, v4, v0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->setPadding(IIII)V

    return-void
.end method


# virtual methods
.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/content/Loader;
    .locals 3

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->mIsManualLoad:Landroid/util/SparseBooleanArray;

    const/4 v0, 0x1

    invoke-virtual {p2, p1, v0}, Landroid/util/SparseBooleanArray;->put(IZ)V

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->mLoaderCreateTime:Landroid/util/SparseLongArray;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {p2, p1, v1, v2}, Landroid/util/SparseLongArray;->put(IJ)V

    if-ne p1, v0, :cond_0

    new-instance p1, Lcom/miui/gallery/loader/AlbumSnapshotLoader;

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    iget-object p2, p2, Lcom/miui/gallery/ui/AlbumPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {p1, p2}, Lcom/miui/gallery/loader/AlbumSnapshotLoader;-><init>(Landroid/content/Context;)V

    return-object p1

    :cond_0
    const/4 p2, 0x2

    if-ne p1, p2, :cond_1

    new-instance p1, Lcom/miui/gallery/loader/AsyncContentLoader;

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    iget-object p2, p2, Lcom/miui/gallery/ui/AlbumPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumConvertCallback:Lcom/miui/gallery/loader/CursorConvertCallback;

    invoke-direct {p1, p2, v0}, Lcom/miui/gallery/loader/AsyncContentLoader;-><init>(Landroid/content/Context;Lcom/miui/gallery/loader/CursorConvertCallback;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    const/4 v0, 0x0

    invoke-static {p2, v0}, Lcom/miui/gallery/ui/AlbumPageFragment;->access$600(Lcom/miui/gallery/ui/AlbumPageFragment;Z)Landroid/net/Uri;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/loader/AsyncContentLoader;->setUri(Landroid/net/Uri;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    iget-object p2, p2, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {p2}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->getProjection()[Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/loader/AsyncContentLoader;->setProjection([Ljava/lang/String;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    invoke-static {p2, v0}, Lcom/miui/gallery/ui/AlbumPageFragment;->access$700(Lcom/miui/gallery/ui/AlbumPageFragment;Z)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/loader/AsyncContentLoader;->setSelection(Ljava/lang/String;)V

    return-object p1

    :cond_1
    const/4 p2, 0x3

    if-ne p1, p2, :cond_2

    new-instance p1, Landroid/content/CursorLoader;

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    iget-object p2, p2, Lcom/miui/gallery/ui/AlbumPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {p1, p2}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;)V

    sget-object p2, Lcom/miui/gallery/provider/GalleryContract$Album;->URI_SHARE_ALL:Landroid/net/Uri;

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setUri(Landroid/net/Uri;)V

    sget-object p2, Lcom/miui/gallery/adapter/AlbumPageAdapter;->SHARED_ALBUM_PROJECTION:[Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setProjection([Ljava/lang/String;)V

    const-string p2, "count > 0"

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setSelection(Ljava/lang/String;)V

    return-object p1

    :cond_2
    const/4 p2, 0x4

    if-ne p1, p2, :cond_3

    new-instance p1, Landroid/content/CursorLoader;

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    iget-object p2, p2, Lcom/miui/gallery/ui/AlbumPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {p1, p2}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;)V

    sget-object p2, Lcom/miui/gallery/provider/GalleryContract$PeopleFace;->PEOPLE_FACE_COVER_URI:Landroid/net/Uri;

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setUri(Landroid/net/Uri;)V

    return-object p1

    :cond_3
    const/4 p2, 0x5

    if-ne p1, p2, :cond_4

    new-instance p1, Lcom/miui/gallery/loader/AsyncContentLoader;

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/AlbumPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v2, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    iget-object v2, v2, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumConvertCallback:Lcom/miui/gallery/loader/CursorConvertCallback;

    invoke-direct {p1, v1, v2}, Lcom/miui/gallery/loader/AsyncContentLoader;-><init>(Landroid/content/Context;Lcom/miui/gallery/loader/CursorConvertCallback;)V

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    invoke-static {v1, v0}, Lcom/miui/gallery/ui/AlbumPageFragment;->access$600(Lcom/miui/gallery/ui/AlbumPageFragment;Z)Landroid/net/Uri;

    move-result-object v1

    invoke-static {v1, p2}, Lcom/miui/gallery/util/UriUtil;->appendLimit(Landroid/net/Uri;I)Landroid/net/Uri;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/loader/AsyncContentLoader;->setUri(Landroid/net/Uri;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    iget-object p2, p2, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {p2}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->getProjection()[Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/loader/AsyncContentLoader;->setProjection([Ljava/lang/String;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    invoke-static {p2, v0}, Lcom/miui/gallery/ui/AlbumPageFragment;->access$700(Lcom/miui/gallery/ui/AlbumPageFragment;Z)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/loader/AsyncContentLoader;->setSelection(Ljava/lang/String;)V

    const-string p2, "sortBy ASC "

    invoke-virtual {p1, p2}, Lcom/miui/gallery/loader/AsyncContentLoader;->setSortOrder(Ljava/lang/String;)V

    return-object p1

    :cond_4
    const/4 p1, 0x0

    return-object p1
.end method

.method public onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 7

    invoke-virtual {p1}, Landroid/content/Loader;->getId()I

    move-result p1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    if-ne p1, v2, :cond_3

    if-eqz p2, :cond_0

    move-object v3, p2

    check-cast v3, Ljava/util/List;

    :cond_0
    if-eqz v3, :cond_1

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result p2

    goto :goto_0

    :cond_1
    const/4 p2, 0x0

    :goto_0
    if-gtz p2, :cond_2

    iget-object v2, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    invoke-static {v2}, Lcom/miui/gallery/ui/AlbumPageFragment;->access$800(Lcom/miui/gallery/ui/AlbumPageFragment;)Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->inflateEmptyView()V

    :cond_2
    invoke-direct {p0, v3}, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->dispatchAlbumUpdates(Ljava/util/List;)V

    iget-object v2, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    invoke-static {v2}, Lcom/miui/gallery/ui/AlbumPageFragment;->access$900(Lcom/miui/gallery/ui/AlbumPageFragment;)V

    :goto_1
    move v2, p2

    goto/16 :goto_9

    :cond_3
    const/4 v5, 0x2

    if-ne p1, v5, :cond_a

    if-eqz p2, :cond_4

    move-object v3, p2

    check-cast v3, Lcom/miui/gallery/model/AlbumList;

    :cond_4
    if-eqz v3, :cond_5

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result p2

    goto :goto_2

    :cond_5
    const/4 p2, 0x0

    :goto_2
    if-gtz p2, :cond_6

    iget-object v5, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    invoke-static {v5}, Lcom/miui/gallery/ui/AlbumPageFragment;->access$800(Lcom/miui/gallery/ui/AlbumPageFragment;)Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;

    move-result-object v5

    invoke-virtual {v5}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->inflateEmptyView()V

    :cond_6
    invoke-static {v3}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v5

    if-eqz v5, :cond_7

    iget-object v5, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    invoke-static {v5}, Lcom/miui/gallery/ui/AlbumPageFragment;->access$1000(Lcom/miui/gallery/ui/AlbumPageFragment;)Lio/reactivex/subjects/PublishSubject;

    move-result-object v5

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v5, v6}, Lio/reactivex/subjects/PublishSubject;->onNext(Ljava/lang/Object;)V

    goto :goto_3

    :cond_7
    iget-object v5, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    invoke-static {v5}, Lcom/miui/gallery/ui/AlbumPageFragment;->access$1000(Lcom/miui/gallery/ui/AlbumPageFragment;)Lio/reactivex/subjects/PublishSubject;

    move-result-object v5

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v6

    invoke-virtual {v5, v6}, Lio/reactivex/subjects/PublishSubject;->onNext(Ljava/lang/Object;)V

    :goto_3
    iget-object v5, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->mOtherAlbumEntity:Lcom/miui/gallery/model/OtherAlbum;

    if-eqz v5, :cond_9

    if-nez v3, :cond_8

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v2}, Ljava/util/ArrayList;-><init>(I)V

    :cond_8
    iget-object v2, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->mOtherAlbumEntity:Lcom/miui/gallery/model/OtherAlbum;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_9
    invoke-direct {p0, v3}, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->dispatchAlbumUpdates(Ljava/util/List;)V

    iget-object v2, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    iget-object v5, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    iget-object v5, v5, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {v5}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->getData()Landroid/support/v7/util/SortedList;

    move-result-object v5

    invoke-static {v2, v3, v5}, Lcom/miui/gallery/ui/AlbumPageFragment;->access$1100(Lcom/miui/gallery/ui/AlbumPageFragment;Ljava/util/ArrayList;Landroid/support/v7/util/SortedList;)V

    goto :goto_1

    :cond_a
    const/4 v2, 0x3

    if-ne p1, v2, :cond_c

    check-cast p2, Landroid/database/Cursor;

    if-eqz p2, :cond_b

    invoke-interface {p2}, Landroid/database/Cursor;->getCount()I

    move-result v2

    goto :goto_4

    :cond_b
    const/4 v2, 0x0

    :goto_4
    iget-object v3, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    iget-object v3, v3, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {v3, p2}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->setSharedAlbums(Landroid/database/Cursor;)V

    goto/16 :goto_9

    :cond_c
    const/4 v2, 0x4

    if-ne p1, v2, :cond_e

    check-cast p2, Landroid/database/Cursor;

    if-eqz p2, :cond_d

    invoke-interface {p2}, Landroid/database/Cursor;->getCount()I

    move-result v2

    goto :goto_5

    :cond_d
    const/4 v2, 0x0

    :goto_5
    iget-object v3, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    iget-object v3, v3, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {v3, p2}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->setPeopleFaceCover(Landroid/database/Cursor;)V

    goto/16 :goto_9

    :cond_e
    const/4 v2, 0x5

    if-ne p1, v2, :cond_13

    if-eqz p2, :cond_f

    check-cast p2, Lcom/miui/gallery/model/AlbumList;

    goto :goto_6

    :cond_f
    move-object p2, v3

    :goto_6
    invoke-static {p2}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_11

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v2

    new-instance v3, Lcom/miui/gallery/model/OtherAlbum;

    invoke-direct {v3}, Lcom/miui/gallery/model/OtherAlbum;-><init>()V

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_7
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_10

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/miui/gallery/model/Album;

    invoke-virtual {v6}, Lcom/miui/gallery/model/Album;->getLocalizedAlbumName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_7

    :cond_10
    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    const v6, 0x7f1004ae

    invoke-virtual {p2, v6}, Lcom/miui/gallery/ui/AlbumPageFragment;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/google/common/base/Joiner;->on(Ljava/lang/String;)Lcom/google/common/base/Joiner;

    move-result-object p2

    invoke-virtual {p2}, Lcom/google/common/base/Joiner;->skipNulls()Lcom/google/common/base/Joiner;

    move-result-object p2

    invoke-virtual {p2, v5}, Lcom/google/common/base/Joiner;->join(Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v3, p2}, Lcom/miui/gallery/model/OtherAlbum;->setAlbumName(Ljava/lang/String;)V

    invoke-virtual {v3, v5}, Lcom/miui/gallery/model/OtherAlbum;->setAlbumNames(Ljava/util/ArrayList;)V

    invoke-virtual {v3, v2}, Lcom/miui/gallery/model/OtherAlbum;->setCount(I)V

    iput-object v3, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->mOtherAlbumEntity:Lcom/miui/gallery/model/OtherAlbum;

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    iget-object p2, p2, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {p2}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->getData()Landroid/support/v7/util/SortedList;

    move-result-object p2

    iget-object v3, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->mOtherAlbumEntity:Lcom/miui/gallery/model/OtherAlbum;

    invoke-virtual {p2, v3}, Landroid/support/v7/util/SortedList;->add(Ljava/lang/Object;)I

    goto :goto_8

    :cond_11
    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->mOtherAlbumEntity:Lcom/miui/gallery/model/OtherAlbum;

    if-eqz p2, :cond_12

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    iget-object p2, p2, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {p2}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->getData()Landroid/support/v7/util/SortedList;

    move-result-object p2

    iget-object v2, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->mOtherAlbumEntity:Lcom/miui/gallery/model/OtherAlbum;

    invoke-virtual {p2, v2}, Landroid/support/v7/util/SortedList;->remove(Ljava/lang/Object;)Z

    :cond_12
    iput-object v3, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->mOtherAlbumEntity:Lcom/miui/gallery/model/OtherAlbum;

    const/4 v2, 0x0

    :goto_8
    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->updateFooterUI()V

    goto :goto_9

    :cond_13
    const/4 v2, 0x0

    :goto_9
    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->mIsManualLoad:Landroid/util/SparseBooleanArray;

    invoke-virtual {p2, p1}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result p2

    if-eqz p2, :cond_14

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->mIsManualLoad:Landroid/util/SparseBooleanArray;

    invoke-virtual {p2, p1, v4}, Landroid/util/SparseBooleanArray;->put(IZ)V

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->mLoaderCreateTime:Landroid/util/SparseLongArray;

    invoke-virtual {p2, p1}, Landroid/util/SparseLongArray;->get(I)J

    move-result-wide v3

    sub-long/2addr v0, v3

    const-string p2, "AlbumPageFragment"

    const-string v3, "load [%d] items for [%s] costs [%d ms]"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    iget-object v5, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    invoke-static {v5, p1}, Lcom/miui/gallery/ui/AlbumPageFragment;->access$1200(Lcom/miui/gallery/ui/AlbumPageFragment;I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-static {p2, v3, v4, v5, v6}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumPageFragment;

    invoke-static {p2, p1}, Lcom/miui/gallery/ui/AlbumPageFragment;->access$1200(Lcom/miui/gallery/ui/AlbumPageFragment;I)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;->statAlbumLoadTime(Ljava/lang/String;JI)V

    :cond_14
    return-void
.end method

.method public onLoaderReset(Landroid/content/Loader;)V
    .locals 0

    return-void
.end method
