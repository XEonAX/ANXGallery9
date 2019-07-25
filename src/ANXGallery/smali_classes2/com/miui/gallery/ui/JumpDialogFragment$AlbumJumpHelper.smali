.class Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;
.super Ljava/lang/Object;
.source "JumpDialogFragment.java"

# interfaces
.implements Landroid/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/JumpDialogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AlbumJumpHelper"
.end annotation


# instance fields
.field private mAlbumCursor:Landroid/database/Cursor;

.field private mAlbumsCursorHelper:Lcom/miui/gallery/util/AlbumsCursorHelper;

.field private mFragment:Landroid/app/Fragment;

.field private mHandleIntentCallback:Lcom/miui/gallery/ui/JumpDialogFragment$HandleIntentCallback;

.field private mShareAlbumCursor:Landroid/database/Cursor;

.field private mShareAlbumsCursorHelper:Lcom/miui/gallery/util/ShareAlbumsCursorHelper;

.field private mUri:Landroid/net/Uri;

.field final synthetic this$0:Lcom/miui/gallery/ui/JumpDialogFragment;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/JumpDialogFragment;Landroid/app/Fragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->this$0:Lcom/miui/gallery/ui/JumpDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mFragment:Landroid/app/Fragment;

    return-void
.end method

.method private createJumpIntent()Landroid/content/Intent;
    .locals 13

    iget-object v0, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mAlbumCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-gtz v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mAlbumsCursorHelper:Lcom/miui/gallery/util/AlbumsCursorHelper;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->getAlbumId(I)J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->getShortCutIntent(J)Landroid/content/Intent;

    move-result-object v2

    if-nez v2, :cond_3

    iget-object v2, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mAlbumsCursorHelper:Lcom/miui/gallery/util/AlbumsCursorHelper;

    invoke-virtual {v2, v0, v1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->getAttributes(J)J

    move-result-wide v2

    iget-object v4, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mAlbumsCursorHelper:Lcom/miui/gallery/util/AlbumsCursorHelper;

    invoke-virtual {v4, v0, v1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->getServerId(J)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mAlbumsCursorHelper:Lcom/miui/gallery/util/AlbumsCursorHelper;

    invoke-virtual {v5, v0, v1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->getAlbumName(J)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mAlbumsCursorHelper:Lcom/miui/gallery/util/AlbumsCursorHelper;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/miui/gallery/util/AlbumsCursorHelper;->getAlbumLocalPath(Ljava/lang/Long;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mAlbumsCursorHelper:Lcom/miui/gallery/util/AlbumsCursorHelper;

    invoke-virtual {v7, v0, v1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->isBabyAlbum(J)Z

    move-result v7

    if-eqz v7, :cond_1

    new-instance v7, Landroid/content/Intent;

    iget-object v8, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mFragment:Landroid/app/Fragment;

    invoke-virtual {v8}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    const-class v9, Lcom/miui/gallery/activity/facebaby/BabyAlbumDetailActivity;

    invoke-direct {v7, v8, v9}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v8, "people_id"

    iget-object v9, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mAlbumsCursorHelper:Lcom/miui/gallery/util/AlbumsCursorHelper;

    invoke-virtual {v9, v0, v1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->getBabyAlbumPeopleId(J)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v8, "baby_info"

    iget-object v9, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mAlbumsCursorHelper:Lcom/miui/gallery/util/AlbumsCursorHelper;

    invoke-virtual {v9, v0, v1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->getBabyInfo(J)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v8, "thumbnail_info_of_baby"

    iget-object v9, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mAlbumsCursorHelper:Lcom/miui/gallery/util/AlbumsCursorHelper;

    invoke-virtual {v9, v0, v1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->getThumbnailInfoOfBaby(J)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v8, "baby_sharer_info"

    iget-object v9, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mAlbumsCursorHelper:Lcom/miui/gallery/util/AlbumsCursorHelper;

    invoke-virtual {v9, v0, v1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->getBabySharerInfo(J)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0

    :cond_1
    new-instance v7, Landroid/content/Intent;

    const-string v8, "com.miui.gallery.action.VIEW_ALBUM_DETAIL"

    invoke-direct {v7, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    :goto_0
    const-wide/16 v8, 0x2

    invoke-static {v8, v9}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    iget-object v9, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mAlbumsCursorHelper:Lcom/miui/gallery/util/AlbumsCursorHelper;

    invoke-virtual {v9, v0, v1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->isOtherShareAlbum(J)Z

    move-result v9

    iget-object v10, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mShareAlbumsCursorHelper:Lcom/miui/gallery/util/ShareAlbumsCursorHelper;

    invoke-virtual {v10, v0, v1}, Lcom/miui/gallery/util/ShareAlbumsCursorHelper;->isOwnerShareAlbum(J)Z

    move-result v10

    iget-object v11, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mAlbumsCursorHelper:Lcom/miui/gallery/util/AlbumsCursorHelper;

    invoke-virtual {v11, v0, v1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->isLocalAlbum(J)Z

    move-result v11

    const-string v12, "other_share_album"

    invoke-virtual {v7, v12, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v9, "owner_share_album"

    invoke-virtual {v7, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v9, "is_local_album"

    invoke-virtual {v7, v9, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v9, "screenshot_album"

    invoke-virtual {v7, v9, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v9, "pano_album"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->isPanoAlbum(J)Z

    move-result v10

    invoke-virtual {v7, v9, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v9, "album_id"

    invoke-virtual {v7, v9, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    const-string v9, "album_name"

    invoke-virtual {v7, v9, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v5, "album_unwriteable"

    iget-object v9, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mAlbumsCursorHelper:Lcom/miui/gallery/util/AlbumsCursorHelper;

    invoke-virtual {v9, v0, v1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->albumUnwriteable(J)Z

    move-result v0

    invoke-virtual {v7, v5, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    if-eqz v8, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mUri:Landroid/net/Uri;

    const-string v1, "screenshotAppName"

    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "screenshot_app_name"

    invoke-virtual {v7, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "album_name"

    invoke-virtual {v7, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "album_unwriteable"

    const/4 v1, 0x1

    invoke-virtual {v7, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    :cond_2
    const-string v0, "album_server_id"

    invoke-virtual {v7, v0, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "attributes"

    invoke-virtual {v7, v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    const-string v0, "album_local_path"

    invoke-virtual {v7, v0, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-object v2, v7

    :cond_3
    return-object v2
.end method

.method private getShortCutIntent(J)Landroid/content/Intent;
    .locals 2

    invoke-static {p1, p2}, Lcom/miui/gallery/util/AlbumsCursorHelper;->isFaceAlbum(J)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance p1, Landroid/content/Intent;

    const-string p2, "com.miui.gallery.action.VIEW_PEOPLE"

    invoke-direct {p1, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    return-object p1

    :cond_0
    invoke-static {p1, p2}, Lcom/miui/gallery/util/AlbumsCursorHelper;->isRecentAlbum(J)Z

    move-result p1

    if-eqz p1, :cond_1

    new-instance p1, Landroid/content/Intent;

    const-string p2, "android.intent.action.VIEW"

    invoke-direct {p1, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    sget-object p2, Lcom/miui/gallery/provider/GalleryContract$RecentAlbum;->VIEW_PAGE_URI:Landroid/net/Uri;

    invoke-virtual {p2}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p2

    const-string v0, "source"

    const-string v1, "album_page"

    invoke-virtual {p2, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p2

    invoke-virtual {p2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    iget-object p2, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mFragment:Landroid/app/Fragment;

    invoke-virtual {p2}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    invoke-virtual {p2}, Landroid/app/Activity;->getPackageName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    return-object p1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method


# virtual methods
.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/content/Loader;
    .locals 8

    new-instance v0, Landroid/content/CursorLoader;

    iget-object v1, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mFragment:Landroid/app/Fragment;

    invoke-virtual {v1}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    packed-switch p1, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    sget-object p1, Lcom/miui/gallery/provider/GalleryContract$Album;->URI_SHARE_ALL:Landroid/net/Uri;

    invoke-virtual {v0, p1}, Landroid/content/CursorLoader;->setUri(Landroid/net/Uri;)V

    sget-object p1, Lcom/miui/gallery/util/ShareAlbumsCursorHelper;->SHARED_ALBUM_PROJECTION:[Ljava/lang/String;

    invoke-virtual {v0, p1}, Landroid/content/CursorLoader;->setProjection([Ljava/lang/String;)V

    const-string p1, "%s>0 AND %s=%s"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    const-string v5, "count"

    aput-object v5, v4, v3

    const-string v3, "_id"

    aput-object v3, v4, v2

    const-string v2, "id"

    invoke-virtual {p2, v2}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    aput-object p2, v4, v1

    invoke-static {p1, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/content/CursorLoader;->setSelection(Ljava/lang/String;)V

    goto :goto_1

    :pswitch_1
    sget-object p1, Lcom/miui/gallery/provider/GalleryContract$Album;->URI_ALL_EXCEPT_DELETED:Landroid/net/Uri;

    invoke-virtual {v0, p1}, Landroid/content/CursorLoader;->setUri(Landroid/net/Uri;)V

    sget-object p1, Lcom/miui/gallery/util/AlbumsCursorHelper;->ALL_ALBUMS_PROJECTION:[Ljava/lang/String;

    invoke-virtual {v0, p1}, Landroid/content/CursorLoader;->setProjection([Ljava/lang/String;)V

    const-string p1, "id"

    const-wide/16 v4, -0x1

    invoke-virtual {p2, p1, v4, v5}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long p1, v4, v6

    if-ltz p1, :cond_0

    const-string p1, "%s=%s"

    new-array v1, v1, [Ljava/lang/Object;

    const-string v4, "_id"

    aput-object v4, v1, v3

    const-string v3, "id"

    invoke-virtual {p2, v3}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    aput-object p2, v1, v2

    invoke-static {p1, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const-string p1, "%s=\'%s\'"

    new-array v1, v1, [Ljava/lang/Object;

    const-string v4, "serverId"

    aput-object v4, v1, v3

    const-string v3, "serverId"

    invoke-virtual {p2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    aput-object p2, v1, v2

    invoke-static {p1, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    :goto_0
    invoke-virtual {v0, p1}, Landroid/content/CursorLoader;->setSelection(Ljava/lang/String;)V

    :goto_1
    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 2

    invoke-virtual {p1}, Landroid/content/Loader;->getId()I

    move-result p1

    const v0, 0x7f100035

    packed-switch p1, :pswitch_data_0

    goto/16 :goto_0

    :pswitch_0
    check-cast p2, Landroid/database/Cursor;

    iput-object p2, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mShareAlbumCursor:Landroid/database/Cursor;

    new-instance p1, Lcom/miui/gallery/util/ShareAlbumsCursorHelper;

    invoke-direct {p1}, Lcom/miui/gallery/util/ShareAlbumsCursorHelper;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mShareAlbumsCursorHelper:Lcom/miui/gallery/util/ShareAlbumsCursorHelper;

    iget-object p1, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mShareAlbumsCursorHelper:Lcom/miui/gallery/util/ShareAlbumsCursorHelper;

    iget-object p2, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mShareAlbumCursor:Landroid/database/Cursor;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/util/ShareAlbumsCursorHelper;->setSharedAlbums(Landroid/database/Cursor;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->createJumpIntent()Landroid/content/Intent;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mHandleIntentCallback:Lcom/miui/gallery/ui/JumpDialogFragment$HandleIntentCallback;

    invoke-interface {p2, p1}, Lcom/miui/gallery/ui/JumpDialogFragment$HandleIntentCallback;->onHandleIntent(Landroid/content/Intent;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mHandleIntentCallback:Lcom/miui/gallery/ui/JumpDialogFragment$HandleIntentCallback;

    iget-object p2, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mFragment:Landroid/app/Fragment;

    invoke-virtual {p2}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    iget-object v1, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mFragment:Landroid/app/Fragment;

    invoke-virtual {v1, v0}, Landroid/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, p2, v0}, Lcom/miui/gallery/ui/JumpDialogFragment$HandleIntentCallback;->onJumpFailed(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    :pswitch_1
    check-cast p2, Landroid/database/Cursor;

    iput-object p2, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mAlbumCursor:Landroid/database/Cursor;

    new-instance p1, Lcom/miui/gallery/util/AlbumsCursorHelper;

    iget-object p2, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mFragment:Landroid/app/Fragment;

    invoke-virtual {p2}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/miui/gallery/util/AlbumsCursorHelper;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mAlbumsCursorHelper:Lcom/miui/gallery/util/AlbumsCursorHelper;

    iget-object p1, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mAlbumsCursorHelper:Lcom/miui/gallery/util/AlbumsCursorHelper;

    iget-object p2, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mAlbumCursor:Landroid/database/Cursor;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/util/AlbumsCursorHelper;->setAlbumsData(Landroid/database/Cursor;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mAlbumCursor:Landroid/database/Cursor;

    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result p1

    if-eqz p1, :cond_1

    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    const-string p2, "id"

    iget-object v0, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mAlbumsCursorHelper:Lcom/miui/gallery/util/AlbumsCursorHelper;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->getAlbumId(I)J

    move-result-wide v0

    invoke-virtual {p1, p2, v0, v1}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    iget-object p2, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mFragment:Landroid/app/Fragment;

    invoke-virtual {p2}, Landroid/app/Fragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object p2

    const/4 v0, 0x2

    invoke-virtual {p2, v0, p1, p0}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mHandleIntentCallback:Lcom/miui/gallery/ui/JumpDialogFragment$HandleIntentCallback;

    iget-object p2, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mFragment:Landroid/app/Fragment;

    invoke-virtual {p2}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    iget-object v1, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mFragment:Landroid/app/Fragment;

    invoke-virtual {v1, v0}, Landroid/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, p2, v0}, Lcom/miui/gallery/ui/JumpDialogFragment$HandleIntentCallback;->onJumpFailed(Landroid/content/Context;Ljava/lang/String;)V

    :goto_0
    return-void

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
    iput-object v0, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mShareAlbumsCursorHelper:Lcom/miui/gallery/util/ShareAlbumsCursorHelper;

    iget-object p1, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mShareAlbumCursor:Landroid/database/Cursor;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mShareAlbumCursor:Landroid/database/Cursor;

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    goto :goto_0

    :pswitch_1
    iput-object v0, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mAlbumsCursorHelper:Lcom/miui/gallery/util/AlbumsCursorHelper;

    iget-object p1, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mAlbumCursor:Landroid/database/Cursor;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mAlbumCursor:Landroid/database/Cursor;

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    :cond_0
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public startLoading(Lcom/miui/gallery/ui/JumpDialogFragment$HandleIntentCallback;Landroid/net/Uri;)V
    .locals 5

    iput-object p2, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mUri:Landroid/net/Uri;

    iget-object p2, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mUri:Landroid/net/Uri;

    const-string v0, "serverId"

    invoke-virtual {p2, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mUri:Landroid/net/Uri;

    const-string v1, "id"

    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {v0}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    goto :goto_0

    :cond_0
    const-wide/16 v0, -0x1

    :goto_0
    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-gez v4, :cond_1

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mFragment:Landroid/app/Fragment;

    invoke-virtual {p2}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mFragment:Landroid/app/Fragment;

    const v1, 0x7f100035

    invoke-virtual {v0, v1}, Landroid/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, p2, v0}, Lcom/miui/gallery/ui/JumpDialogFragment$HandleIntentCallback;->onJumpFailed(Landroid/content/Context;Ljava/lang/String;)V

    return-void

    :cond_1
    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->getShortCutIntent(J)Landroid/content/Intent;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-interface {p1, v2}, Lcom/miui/gallery/ui/JumpDialogFragment$HandleIntentCallback;->onHandleIntent(Landroid/content/Intent;)V

    goto :goto_1

    :cond_2
    iput-object p1, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mHandleIntentCallback:Lcom/miui/gallery/ui/JumpDialogFragment$HandleIntentCallback;

    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "serverId"

    invoke-virtual {p1, v2, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "id"

    invoke-virtual {p1, p2, v0, v1}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    iget-object p2, p0, Lcom/miui/gallery/ui/JumpDialogFragment$AlbumJumpHelper;->mFragment:Landroid/app/Fragment;

    invoke-virtual {p2}, Landroid/app/Fragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object p2

    const/4 v0, 0x1

    invoke-virtual {p2, v0, p1, p0}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    :goto_1
    return-void
.end method
