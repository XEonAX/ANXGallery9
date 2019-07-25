.class public Lcom/miui/gallery/adapter/AlbumPageAdapter;
.super Lcom/miui/gallery/adapter/AlbumAdapterBase;
.source "AlbumPageAdapter.java"

# interfaces
.implements Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;


# instance fields
.field private mActivity:Landroid/app/Activity;


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/AlbumAdapterBase;-><init>(Landroid/app/Activity;)V

    iput-object p1, p0, Lcom/miui/gallery/adapter/AlbumPageAdapter;->mActivity:Landroid/app/Activity;

    return-void
.end method

.method private isSameSection(Lcom/miui/gallery/model/Album$AlbumType;Lcom/miui/gallery/model/Album$AlbumType;)Z
    .locals 3

    sget-object v0, Lcom/miui/gallery/model/Album$AlbumType;->OTHER_ALBUMS:Lcom/miui/gallery/model/Album$AlbumType;

    const/4 v1, 0x0

    if-eq p1, v0, :cond_7

    sget-object v0, Lcom/miui/gallery/model/Album$AlbumType;->OTHER_ALBUMS:Lcom/miui/gallery/model/Album$AlbumType;

    if-ne p2, v0, :cond_0

    goto :goto_1

    :cond_0
    sget-object v0, Lcom/miui/gallery/model/Album$AlbumType;->PINNED:Lcom/miui/gallery/model/Album$AlbumType;

    const/4 v2, 0x1

    if-ne p1, v0, :cond_2

    sget-object p1, Lcom/miui/gallery/model/Album$AlbumType;->PINNED:Lcom/miui/gallery/model/Album$AlbumType;

    if-ne p2, p1, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1

    :cond_2
    sget-object v0, Lcom/miui/gallery/model/Album$AlbumType;->SYSTEM:Lcom/miui/gallery/model/Album$AlbumType;

    if-ne p1, v0, :cond_4

    sget-object p1, Lcom/miui/gallery/model/Album$AlbumType;->SYSTEM:Lcom/miui/gallery/model/Album$AlbumType;

    if-ne p2, p1, :cond_3

    const/4 v1, 0x1

    :cond_3
    return v1

    :cond_4
    sget-object p1, Lcom/miui/gallery/model/Album$AlbumType;->SYSTEM:Lcom/miui/gallery/model/Album$AlbumType;

    if-eq p2, p1, :cond_6

    sget-object p1, Lcom/miui/gallery/model/Album$AlbumType;->PINNED:Lcom/miui/gallery/model/Album$AlbumType;

    if-ne p2, p1, :cond_5

    goto :goto_0

    :cond_5
    return v2

    :cond_6
    :goto_0
    return v1

    :cond_7
    :goto_1
    return v1
.end method

.method private isSyncable()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumPageAdapter;->mActivity:Landroid/app/Activity;

    invoke-static {v0}, Lcom/miui/gallery/util/SyncUtil;->existXiaomiAccount(Landroid/content/Context;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public getBottomDividerType(I)I
    .locals 4

    const/4 v0, 0x0

    const/4 v1, -0x1

    if-ne p1, v1, :cond_0

    return v0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->getItemCount()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    if-ne p1, v1, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    const/4 v3, 0x3

    if-eqz v1, :cond_2

    return v3

    :cond_2
    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->getItem(I)Lcom/miui/gallery/model/Album;

    move-result-object v1

    if-nez v1, :cond_3

    const-string v1, "AlbumPageAdapter"

    const-string v2, "current album item should not be null: %d"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v1, v2, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return v0

    :cond_3
    add-int/2addr p1, v2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->getItem(I)Lcom/miui/gallery/model/Album;

    move-result-object p1

    if-eqz p1, :cond_5

    invoke-virtual {v1}, Lcom/miui/gallery/model/Album;->getAlbumType()Lcom/miui/gallery/model/Album$AlbumType;

    move-result-object v0

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getAlbumType()Lcom/miui/gallery/model/Album$AlbumType;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->isSameSection(Lcom/miui/gallery/model/Album$AlbumType;Lcom/miui/gallery/model/Album$AlbumType;)Z

    move-result p1

    if-eqz p1, :cond_4

    const/4 p1, 0x2

    return p1

    :cond_4
    return v2

    :cond_5
    return v3
.end method

.method protected newClickItemIntent(IJZ)Landroid/content/Intent;
    .locals 3

    invoke-static {p2, p3}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->isOthersAlbum(J)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance p1, Landroid/content/Intent;

    iget-object p2, p0, Lcom/miui/gallery/adapter/AlbumPageAdapter;->mContext:Landroid/content/Context;

    const-class p3, Lcom/miui/gallery/activity/AlbumLocalPageActivity;

    invoke-direct {p1, p2, p3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    goto/16 :goto_1

    :cond_0
    invoke-static {p2, p3}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->isFaceAlbum(J)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance p1, Landroid/content/Intent;

    const-string p2, "com.miui.gallery.action.VIEW_PEOPLE"

    invoke-direct {p1, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    goto/16 :goto_1

    :cond_1
    invoke-static {p2, p3}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->isRecentAlbum(J)Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance p1, Landroid/content/Intent;

    const-string p2, "android.intent.action.VIEW"

    invoke-direct {p1, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    sget-object p2, Lcom/miui/gallery/provider/GalleryContract$RecentAlbum;->VIEW_PAGE_URI:Landroid/net/Uri;

    invoke-virtual {p2}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p2

    const-string p3, "source"

    const-string p4, "album_page"

    invoke-virtual {p2, p3, p4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p2

    invoke-virtual {p2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    iget-object p2, p0, Lcom/miui/gallery/adapter/AlbumPageAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {p2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    goto/16 :goto_1

    :cond_2
    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->isBabyAlbum(I)Z

    move-result v0

    if-nez v0, :cond_3

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.miui.gallery.action.VIEW_ALBUM_DETAIL"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/miui/gallery/adapter/AlbumPageAdapter;->mContext:Landroid/content/Context;

    const-class v2, Lcom/miui/gallery/activity/facebaby/BabyAlbumDetailActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "people_id"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->getBabyAlbumPeopleId(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "baby_info"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->getBabyInfo(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "thumbnail_info_of_baby"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->getThumbnailInfoOfBaby(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "baby_sharer_info"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->getBabySharerInfo(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :goto_0
    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->isOtherShareAlbum(I)Z

    move-result v1

    const-string v2, "other_share_album"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->isOwnerShareAlbum(I)Z

    move-result v1

    const-string v2, "owner_share_album"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v1, "is_local_album"

    invoke-virtual {v0, v1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p4, "screenshot_album"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->isScreenshotsAlbum(I)Z

    move-result v1

    invoke-virtual {v0, p4, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p4, "pano_album"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->isPanoAlbum(I)Z

    move-result v1

    invoke-virtual {v0, p4, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p4, "album_id"

    invoke-virtual {v0, p4, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    const-string p2, "album_name"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->getAlbumName(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v0, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p2, "album_server_id"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->getServerId(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v0, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p2, "attributes"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->getAttributes(I)Ljava/lang/Long;

    move-result-object p3

    invoke-virtual {v0, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    const-string p2, "album_unwriteable"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->albumUnwriteable(I)Z

    move-result p3

    invoke-virtual {v0, p2, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p2, "album_local_path"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->getAlbumLocalPath(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-object p1, v0

    :goto_1
    return-object p1
.end method

.method public onItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;IJFF)Z
    .locals 0

    invoke-virtual {p0, p3}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->getItemId(I)J

    move-result-wide p1

    invoke-direct {p0}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->isSyncable()Z

    move-result p4

    const/4 p5, 0x1

    if-eqz p4, :cond_1

    invoke-virtual {p0, p3}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->isAutoUploadedAlbum(I)Z

    move-result p4

    if-nez p4, :cond_0

    goto :goto_0

    :cond_0
    const/4 p4, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p4, 0x1

    :goto_1
    invoke-virtual {p0, p3, p1, p2, p4}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->newClickItemIntent(IJZ)Landroid/content/Intent;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/adapter/AlbumPageAdapter;->mActivity:Landroid/app/Activity;

    invoke-virtual {p2, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    return p5
.end method
