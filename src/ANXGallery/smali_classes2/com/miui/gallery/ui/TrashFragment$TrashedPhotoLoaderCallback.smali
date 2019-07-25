.class Lcom/miui/gallery/ui/TrashFragment$TrashedPhotoLoaderCallback;
.super Ljava/lang/Object;
.source "TrashFragment.java"

# interfaces
.implements Landroid/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/TrashFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TrashedPhotoLoaderCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/TrashFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/TrashFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/TrashFragment$TrashedPhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/TrashFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/TrashFragment;Lcom/miui/gallery/ui/TrashFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/TrashFragment$TrashedPhotoLoaderCallback;-><init>(Lcom/miui/gallery/ui/TrashFragment;)V

    return-void
.end method


# virtual methods
.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/content/Loader;
    .locals 2

    new-instance p1, Landroid/content/CursorLoader;

    iget-object p2, p0, Lcom/miui/gallery/ui/TrashFragment$TrashedPhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/TrashFragment;

    iget-object p2, p2, Lcom/miui/gallery/ui/TrashFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {p1, p2}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;)V

    sget-object p2, Lcom/miui/gallery/provider/GalleryContract$Media;->URI:Landroid/net/Uri;

    invoke-virtual {p2}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p2

    const-string v0, "remove_duplicate_items"

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p2

    invoke-virtual {p2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setUri(Landroid/net/Uri;)V

    sget-object p2, Lcom/miui/gallery/adapter/TrashAdapter;->PROJECTION:[Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setProjection([Ljava/lang/String;)V

    const-string p2, "alias_create_time DESC "

    invoke-virtual {p1, p2}, Landroid/content/CursorLoader;->setSortOrder(Ljava/lang/String;)V

    return-object p1
.end method

.method public onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/TrashFragment$TrashedPhotoLoaderCallback;->this$0:Lcom/miui/gallery/ui/TrashFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/TrashFragment;->access$000(Lcom/miui/gallery/ui/TrashFragment;)Lcom/miui/gallery/adapter/TrashAdapter;

    move-result-object p1

    check-cast p2, Landroid/database/Cursor;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/adapter/TrashAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    return-void
.end method

.method public onLoaderReset(Landroid/content/Loader;)V
    .locals 0

    return-void
.end method
