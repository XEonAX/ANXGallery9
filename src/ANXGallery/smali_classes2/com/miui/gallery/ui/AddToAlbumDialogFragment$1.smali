.class Lcom/miui/gallery/ui/AddToAlbumDialogFragment$1;
.super Ljava/lang/Object;
.source "AddToAlbumDialogFragment.java"

# interfaces
.implements Landroid/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/AddToAlbumDialogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/app/LoaderManager$LoaderCallbacks<",
        "Landroid/database/Cursor;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/AddToAlbumDialogFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$1;->this$0:Lcom/miui/gallery/ui/AddToAlbumDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/content/Loader;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/os/Bundle;",
            ")",
            "Landroid/content/Loader<",
            "Landroid/database/Cursor;",
            ">;"
        }
    .end annotation

    new-instance p2, Landroid/content/CursorLoader;

    iget-object v0, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$1;->this$0:Lcom/miui/gallery/ui/AddToAlbumDialogFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p2, v0}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$1;->this$0:Lcom/miui/gallery/ui/AddToAlbumDialogFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->access$000(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setUri(Landroid/net/Uri;)V

    sget-object p1, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->PROJECTION:[Ljava/lang/String;

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setProjection([Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$1;->this$0:Lcom/miui/gallery/ui/AddToAlbumDialogFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->access$100(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setSelection(Ljava/lang/String;)V

    const-string p1, "classification ASC, sortBy ASC "

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setSortOrder(Ljava/lang/String;)V

    return-object p2

    :cond_0
    sget-object p1, Lcom/miui/gallery/provider/GalleryContract$Album;->URI_SHARE_ALL:Landroid/net/Uri;

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setUri(Landroid/net/Uri;)V

    sget-object p1, Lcom/miui/gallery/model/AlbumConstants;->SHARED_ALBUM_PROJECTION:[Ljava/lang/String;

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setProjection([Ljava/lang/String;)V

    const-string p1, "count > 0"

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setSelection(Ljava/lang/String;)V

    return-object p2
.end method

.method public onLoadFinished(Landroid/content/Loader;Landroid/database/Cursor;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Loader<",
            "Landroid/database/Cursor;",
            ">;",
            "Landroid/database/Cursor;",
            ")V"
        }
    .end annotation

    invoke-virtual {p1}, Landroid/content/Loader;->getId()I

    move-result v0

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-ne v0, v2, :cond_2

    new-instance p1, Landroid/database/MatrixCursor;

    invoke-interface {p2}, Landroid/database/Cursor;->getColumnNames()[Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/database/MatrixCursor;-><init>([Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$1;->this$0:Lcom/miui/gallery/ui/AddToAlbumDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->access$200(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;)[Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/MatrixCursor;->addRow([Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$1;->this$0:Lcom/miui/gallery/ui/AddToAlbumDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->access$300(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$1;->this$0:Lcom/miui/gallery/ui/AddToAlbumDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->access$400(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;)[Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/MatrixCursor;->addRow([Ljava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$1;->this$0:Lcom/miui/gallery/ui/AddToAlbumDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->access$500(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;)Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;

    move-result-object v0

    invoke-static {v0, p2}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->access$600(Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;Landroid/database/Cursor;)Landroid/database/Cursor;

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$1;->this$0:Lcom/miui/gallery/ui/AddToAlbumDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->access$500(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;)Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;

    move-result-object v0

    if-eqz p2, :cond_1

    new-instance v3, Landroid/database/MergeCursor;

    new-array v1, v1, [Landroid/database/Cursor;

    const/4 v4, 0x0

    aput-object p1, v1, v4

    aput-object p2, v1, v2

    invoke-direct {v3, v1}, Landroid/database/MergeCursor;-><init>([Landroid/database/Cursor;)V

    move-object p1, v3

    :cond_1
    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    goto :goto_0

    :cond_2
    invoke-virtual {p1}, Landroid/content/Loader;->getId()I

    move-result p1

    if-ne p1, v1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$1;->this$0:Lcom/miui/gallery/ui/AddToAlbumDialogFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment;->access$500(Lcom/miui/gallery/ui/AddToAlbumDialogFragment;)Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$AlbumSelectorAdapter;->setSharedAlbums(Landroid/database/Cursor;)V

    :cond_3
    :goto_0
    return-void
.end method

.method public bridge synthetic onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 0

    check-cast p2, Landroid/database/Cursor;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/ui/AddToAlbumDialogFragment$1;->onLoadFinished(Landroid/content/Loader;Landroid/database/Cursor;)V

    return-void
.end method

.method public onLoaderReset(Landroid/content/Loader;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Loader<",
            "Landroid/database/Cursor;",
            ">;)V"
        }
    .end annotation

    return-void
.end method
