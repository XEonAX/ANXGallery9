.class Lcom/miui/gallery/picker/PickAlbumDetailFragment$AlbumDetailLoaderCallback;
.super Ljava/lang/Object;
.source "PickAlbumDetailFragment.java"

# interfaces
.implements Landroid/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/picker/PickAlbumDetailFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AlbumDetailLoaderCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/picker/PickAlbumDetailFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/picker/PickAlbumDetailFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment$AlbumDetailLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/picker/PickAlbumDetailFragment;Lcom/miui/gallery/picker/PickAlbumDetailFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/picker/PickAlbumDetailFragment$AlbumDetailLoaderCallback;-><init>(Lcom/miui/gallery/picker/PickAlbumDetailFragment;)V

    return-void
.end method


# virtual methods
.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/content/Loader;
    .locals 1

    new-instance p1, Landroid/content/CursorLoader;

    iget-object p2, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment$AlbumDetailLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailFragment;

    iget-object p2, p2, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mActivity:Landroid/app/Activity;

    invoke-direct {p1, p2}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;)V

    iget-object p2, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment$AlbumDetailLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailFragment;

    sget-object v0, Lcom/miui/gallery/widget/SortByHeader$SortBy;->DATE:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    invoke-static {p2, p1, v0}, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->access$100(Lcom/miui/gallery/picker/PickAlbumDetailFragment;Landroid/content/CursorLoader;Lcom/miui/gallery/widget/SortByHeader$SortBy;)V

    return-object p1
.end method

.method public onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment$AlbumDetailLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailFragment;

    invoke-static {p1}, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->access$200(Lcom/miui/gallery/picker/PickAlbumDetailFragment;)Lcom/miui/gallery/widget/SortByHeader$SortBy;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/widget/SortByHeader$SortBy;->DATE:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment$AlbumDetailLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailFragment;

    iget-object p1, p1, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mAlbumDetailGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment$AlbumDetailLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailFragment;

    invoke-static {v0}, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->access$300(Lcom/miui/gallery/picker/PickAlbumDetailFragment;)Lcom/miui/gallery/picker/PickAlbumDetailFragment$PickAlbumDetailTimeLineAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment$AlbumDetailLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailFragment;

    invoke-static {p1}, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->access$300(Lcom/miui/gallery/picker/PickAlbumDetailFragment;)Lcom/miui/gallery/picker/PickAlbumDetailFragment$PickAlbumDetailTimeLineAdapter;

    move-result-object p1

    check-cast p2, Landroid/database/Cursor;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/picker/PickAlbumDetailFragment$PickAlbumDetailTimeLineAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment$AlbumDetailLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailFragment;

    iget-object p1, p1, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->mAlbumDetailGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment$AlbumDetailLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailFragment;

    invoke-static {v0}, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->access$400(Lcom/miui/gallery/picker/PickAlbumDetailFragment;)Lcom/miui/gallery/picker/PickAlbumDetailFragment$PickAlbumDetailSimpleAdapter;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment$AlbumDetailLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailFragment;

    invoke-static {p1}, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->access$400(Lcom/miui/gallery/picker/PickAlbumDetailFragment;)Lcom/miui/gallery/picker/PickAlbumDetailFragment$PickAlbumDetailSimpleAdapter;

    move-result-object p1

    check-cast p2, Landroid/database/Cursor;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/picker/PickAlbumDetailFragment$PickAlbumDetailSimpleAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment$AlbumDetailLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailFragment;

    invoke-static {p1}, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->access$600(Lcom/miui/gallery/picker/PickAlbumDetailFragment;)Lcom/miui/gallery/widget/SortByHeader;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment$AlbumDetailLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailFragment;

    invoke-static {p2}, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->access$200(Lcom/miui/gallery/picker/PickAlbumDetailFragment;)Lcom/miui/gallery/widget/SortByHeader$SortBy;

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment$AlbumDetailLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailFragment;

    invoke-static {v0}, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->access$500(Lcom/miui/gallery/picker/PickAlbumDetailFragment;)I

    move-result v0

    invoke-virtual {p1, p2, v0}, Lcom/miui/gallery/widget/SortByHeader;->updateCurrentSortView(Lcom/miui/gallery/widget/SortByHeader$SortBy;I)V

    iget-object p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragment$AlbumDetailLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickAlbumDetailFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/picker/PickAlbumDetailFragment;->copy2Pick()V

    return-void
.end method

.method public onLoaderReset(Landroid/content/Loader;)V
    .locals 0

    return-void
.end method
