.class Lcom/miui/gallery/picker/PickFaceAlbumFragment$FacePagePhotoLoaderCallback;
.super Ljava/lang/Object;
.source "PickFaceAlbumFragment.java"

# interfaces
.implements Landroid/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/picker/PickFaceAlbumFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FacePagePhotoLoaderCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/picker/PickFaceAlbumFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/picker/PickFaceAlbumFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/picker/PickFaceAlbumFragment$FacePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickFaceAlbumFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/picker/PickFaceAlbumFragment;Lcom/miui/gallery/picker/PickFaceAlbumFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/picker/PickFaceAlbumFragment$FacePagePhotoLoaderCallback;-><init>(Lcom/miui/gallery/picker/PickFaceAlbumFragment;)V

    return-void
.end method


# virtual methods
.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/content/Loader;
    .locals 3

    iget-object p1, p0, Lcom/miui/gallery/picker/PickFaceAlbumFragment$FacePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickFaceAlbumFragment;

    iget-object p1, p1, Lcom/miui/gallery/picker/PickFaceAlbumFragment;->mActivity:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string p2, "pick_face_ids_in"

    invoke-virtual {p1, p2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_0

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "_id in ( "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    new-instance p2, Landroid/content/CursorLoader;

    iget-object v0, p0, Lcom/miui/gallery/picker/PickFaceAlbumFragment$FacePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickFaceAlbumFragment;

    iget-object v0, v0, Lcom/miui/gallery/picker/PickFaceAlbumFragment;->mActivity:Landroid/app/Activity;

    invoke-direct {p2, v0}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/miui/gallery/picker/PickFaceAlbumFragment$FacePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickFaceAlbumFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/picker/PickFaceAlbumFragment;->getUri()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/content/CursorLoader;->setUri(Landroid/net/Uri;)V

    sget-object v0, Lcom/miui/gallery/adapter/FacePageAdapter;->PROJECTION:[Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroid/content/CursorLoader;->setProjection([Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setSelection(Ljava/lang/String;)V

    const/4 p1, 0x2

    new-array p1, p1, [Ljava/lang/String;

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/miui/gallery/picker/PickFaceAlbumFragment$FacePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickFaceAlbumFragment;

    invoke-static {v1}, Lcom/miui/gallery/picker/PickFaceAlbumFragment;->access$000(Lcom/miui/gallery/picker/PickFaceAlbumFragment;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, p1, v0

    const/4 v0, 0x1

    iget-object v1, p0, Lcom/miui/gallery/picker/PickFaceAlbumFragment$FacePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickFaceAlbumFragment;

    invoke-static {v1}, Lcom/miui/gallery/picker/PickFaceAlbumFragment;->access$100(Lcom/miui/gallery/picker/PickFaceAlbumFragment;)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    aput-object v1, p1, v0

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setSelectionArgs([Ljava/lang/String;)V

    const-string p1, "dateTaken DESC "

    invoke-virtual {p2, p1}, Landroid/content/CursorLoader;->setSortOrder(Ljava/lang/String;)V

    return-object p2
.end method

.method public onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/picker/PickFaceAlbumFragment$FacePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickFaceAlbumFragment;

    invoke-static {p1}, Lcom/miui/gallery/picker/PickFaceAlbumFragment;->access$200(Lcom/miui/gallery/picker/PickFaceAlbumFragment;)Lcom/miui/gallery/picker/PickFaceAlbumFragment$PickAlbumDetailTimeLineAdapter;

    move-result-object p1

    check-cast p2, Landroid/database/Cursor;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/picker/PickFaceAlbumFragment$PickAlbumDetailTimeLineAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    iget-object p1, p0, Lcom/miui/gallery/picker/PickFaceAlbumFragment$FacePagePhotoLoaderCallback;->this$0:Lcom/miui/gallery/picker/PickFaceAlbumFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/picker/PickFaceAlbumFragment;->copy2Pick()V

    return-void
.end method

.method public onLoaderReset(Landroid/content/Loader;)V
    .locals 0

    return-void
.end method
