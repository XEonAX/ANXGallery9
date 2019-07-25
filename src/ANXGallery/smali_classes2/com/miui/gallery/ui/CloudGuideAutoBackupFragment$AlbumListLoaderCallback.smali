.class Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$AlbumListLoaderCallback;
.super Ljava/lang/Object;
.source "CloudGuideAutoBackupFragment.java"

# interfaces
.implements Landroid/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AlbumListLoaderCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$AlbumListLoaderCallback;->this$0:Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$AlbumListLoaderCallback;-><init>(Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;)V

    return-void
.end method


# virtual methods
.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/content/Loader;
    .locals 1

    new-instance p2, Landroid/content/CursorLoader;

    iget-object v0, p0, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$AlbumListLoaderCallback;->this$0:Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p2, v0}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    sget-object p1, Lcom/miui/gallery/provider/GalleryContract$Album;->URI:Landroid/net/Uri;

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setUri(Landroid/net/Uri;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$AlbumListLoaderCallback;->this$0:Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->access$200(Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;)Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;->getProjection()[Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setProjection([Ljava/lang/String;)V

    const-string p1, "immutable = 0 AND attributes & 16 = 0 AND _id < 2147383647"

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setSelection(Ljava/lang/String;)V

    const-string p1, "sortBy ASC "

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setSortOrder(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    if-ne p1, v0, :cond_1

    sget-object p1, Lcom/miui/gallery/provider/GalleryContract$Album;->URI_SHARE_ALL:Landroid/net/Uri;

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setUri(Landroid/net/Uri;)V

    sget-object p1, Lcom/miui/gallery/model/AlbumConstants;->SHARED_ALBUM_PROJECTION:[Ljava/lang/String;

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setProjection([Ljava/lang/String;)V

    const-string p1, "count > 0"

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setSelection(Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-object p2
.end method

.method public onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 2

    invoke-virtual {p1}, Landroid/content/Loader;->getId()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$AlbumListLoaderCallback;->this$0:Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->access$200(Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;)Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;

    move-result-object p1

    check-cast p2, Landroid/database/Cursor;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/content/Loader;->getId()I

    move-result p1

    const/4 v0, 0x2

    if-ne p1, v0, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment$AlbumListLoaderCallback;->this$0:Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;->access$200(Lcom/miui/gallery/ui/CloudGuideAutoBackupFragment;)Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;

    move-result-object p1

    check-cast p2, Landroid/database/Cursor;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/adapter/AutoBackupChooserAdapter;->setSharedAlbums(Landroid/database/Cursor;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public onLoaderReset(Landroid/content/Loader;)V
    .locals 0

    return-void
.end method
