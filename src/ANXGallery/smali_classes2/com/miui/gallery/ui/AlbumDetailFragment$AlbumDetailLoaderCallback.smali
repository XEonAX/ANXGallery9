.class Lcom/miui/gallery/ui/AlbumDetailFragment$AlbumDetailLoaderCallback;
.super Ljava/lang/Object;
.source "AlbumDetailFragment.java"

# interfaces
.implements Landroid/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/AlbumDetailFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AlbumDetailLoaderCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/AlbumDetailFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/AlbumDetailFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragment$AlbumDetailLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/AlbumDetailFragment;Lcom/miui/gallery/ui/AlbumDetailFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/AlbumDetailFragment$AlbumDetailLoaderCallback;-><init>(Lcom/miui/gallery/ui/AlbumDetailFragment;)V

    return-void
.end method


# virtual methods
.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/content/Loader;
    .locals 1

    new-instance p1, Landroid/content/CursorLoader;

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumDetailFragment$AlbumDetailLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragment;

    iget-object p2, p2, Lcom/miui/gallery/ui/AlbumDetailFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {p1, p2}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumDetailFragment$AlbumDetailLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragment;

    sget-object v0, Lcom/miui/gallery/widget/SortByHeader$SortBy;->DATE:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    invoke-static {p2, p1, v0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->access$100(Lcom/miui/gallery/ui/AlbumDetailFragment;Landroid/content/CursorLoader;Lcom/miui/gallery/widget/SortByHeader$SortBy;)V

    return-object p1
.end method

.method public onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragment$AlbumDetailLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/AlbumDetailFragment;->getAdapter()Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;

    move-result-object p1

    check-cast p2, Landroid/database/Cursor;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumDetailFragment$AlbumDetailLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragment;

    iget-object p2, p2, Lcom/miui/gallery/ui/AlbumDetailFragment;->mAlbumDetailGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumDetailFragment$AlbumDetailLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragment;

    iget-object p2, p2, Lcom/miui/gallery/ui/AlbumDetailFragment;->mAlbumDetailGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->generateWrapScrollListener(Landroid/widget/AbsListView$OnScrollListener;)Landroid/widget/AbsListView$OnScrollListener;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumDetailFragment$AlbumDetailLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/AlbumDetailFragment;->access$400(Lcom/miui/gallery/ui/AlbumDetailFragment;)Lcom/miui/gallery/widget/SortByHeader;

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumDetailFragment$AlbumDetailLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->access$200(Lcom/miui/gallery/ui/AlbumDetailFragment;)Lcom/miui/gallery/widget/SortByHeader$SortBy;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumDetailFragment$AlbumDetailLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/AlbumDetailFragment;->access$300(Lcom/miui/gallery/ui/AlbumDetailFragment;)I

    move-result v1

    invoke-virtual {p2, v0, v1}, Lcom/miui/gallery/widget/SortByHeader;->updateCurrentSortView(Lcom/miui/gallery/widget/SortByHeader$SortBy;I)V

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumDetailFragment$AlbumDetailLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/AlbumDetailFragment;->access$500(Lcom/miui/gallery/ui/AlbumDetailFragment;)V

    invoke-virtual {p1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getCount()I

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragment$AlbumDetailLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/AlbumDetailFragment;->mEmptyView:Landroid/view/View;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumDetailFragment$AlbumDetailLoaderCallback;->this$0:Lcom/miui/gallery/ui/AlbumDetailFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/AlbumDetailFragment;->mEmptyView:Landroid/view/View;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    :goto_0
    return-void
.end method

.method public onLoaderReset(Landroid/content/Loader;)V
    .locals 0

    return-void
.end method
