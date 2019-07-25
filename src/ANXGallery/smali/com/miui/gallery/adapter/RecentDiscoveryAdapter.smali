.class public Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;
.super Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;
.source "RecentDiscoveryAdapter.java"

# interfaces
.implements Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapter;


# static fields
.field private static final COLUMN_INDEX_ALBUM_ID:I

.field private static final COLUMN_INDEX_DATE_MODIFIED:I

.field public static PROJECTION:[Ljava/lang/String;


# instance fields
.field private mAlbumsCursorHelper:Lcom/miui/gallery/util/AlbumsCursorHelper;

.field private mGroupItemCount:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mGroupStartPos:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mGroupStartTimeLabels:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mIsInPickMode:Z

.field private mShareAlbumsCursorHelper:Lcom/miui/gallery/util/ShareAlbumsCursorHelper;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    sget-object v0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->PROJECTION_INTERNAL:[Ljava/lang/String;

    array-length v0, v0

    sput v0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->COLUMN_INDEX_ALBUM_ID:I

    sget v0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->COLUMN_INDEX_ALBUM_ID:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->COLUMN_INDEX_DATE_MODIFIED:I

    sget-object v0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->PROJECTION_INTERNAL:[Ljava/lang/String;

    array-length v0, v0

    add-int/lit8 v0, v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    sput-object v0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->PROJECTION:[Ljava/lang/String;

    sget-object v0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->PROJECTION_INTERNAL:[Ljava/lang/String;

    sget-object v1, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->PROJECTION:[Ljava/lang/String;

    sget-object v2, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->PROJECTION_INTERNAL:[Ljava/lang/String;

    array-length v2, v2

    const/4 v3, 0x0

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    sget-object v0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->PROJECTION:[Ljava/lang/String;

    sget v1, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->COLUMN_INDEX_ALBUM_ID:I

    const-string v2, "localGroupId"

    aput-object v2, v0, v1

    sget-object v0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->PROJECTION:[Ljava/lang/String;

    sget v1, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->COLUMN_INDEX_DATE_MODIFIED:I

    const-string v2, "dateModified"

    aput-object v2, v0, v1

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    sget-object v0, Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;->SCENE_IN_CHECK_MODE:Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;-><init>(Landroid/content/Context;Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;Z)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;Z)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;-><init>(Landroid/content/Context;Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;)V

    sget-object p1, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->RECENT:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->setAlbumType(Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;)V

    new-instance p1, Lcom/miui/gallery/util/ShareAlbumsCursorHelper;

    invoke-direct {p1}, Lcom/miui/gallery/util/ShareAlbumsCursorHelper;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mShareAlbumsCursorHelper:Lcom/miui/gallery/util/ShareAlbumsCursorHelper;

    new-instance p1, Lcom/miui/gallery/util/AlbumsCursorHelper;

    iget-object p2, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mContext:Landroid/content/Context;

    invoke-direct {p1, p2}, Lcom/miui/gallery/util/AlbumsCursorHelper;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mAlbumsCursorHelper:Lcom/miui/gallery/util/AlbumsCursorHelper;

    iput-boolean p3, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mIsInPickMode:Z

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;)Lcom/miui/gallery/util/AlbumsCursorHelper;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mAlbumsCursorHelper:Lcom/miui/gallery/util/AlbumsCursorHelper;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;)Lcom/miui/gallery/util/ShareAlbumsCursorHelper;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mShareAlbumsCursorHelper:Lcom/miui/gallery/util/ShareAlbumsCursorHelper;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;J)Landroid/content/Intent;
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->newAlbumFromClickedIntent(J)Landroid/content/Intent;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->recordAlbumClick(Ljava/lang/String;)V

    return-void
.end method

.method private newAlbumFromClickedIntent(J)Landroid/content/Intent;
    .locals 12

    iget-object v0, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mAlbumsCursorHelper:Lcom/miui/gallery/util/AlbumsCursorHelper;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/util/AlbumsCursorHelper;->getAttributes(J)J

    move-result-wide v0

    iget-object v2, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mAlbumsCursorHelper:Lcom/miui/gallery/util/AlbumsCursorHelper;

    invoke-virtual {v2, p1, p2}, Lcom/miui/gallery/util/AlbumsCursorHelper;->getServerId(J)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mAlbumsCursorHelper:Lcom/miui/gallery/util/AlbumsCursorHelper;

    invoke-virtual {v3, p1, p2}, Lcom/miui/gallery/util/AlbumsCursorHelper;->getAlbumName(J)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mAlbumsCursorHelper:Lcom/miui/gallery/util/AlbumsCursorHelper;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/miui/gallery/util/AlbumsCursorHelper;->getAlbumLocalPath(Ljava/lang/Long;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    iget-object v6, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mAlbumsCursorHelper:Lcom/miui/gallery/util/AlbumsCursorHelper;

    invoke-virtual {v6, p1, p2}, Lcom/miui/gallery/util/AlbumsCursorHelper;->isBabyAlbum(J)Z

    move-result v6

    invoke-static {p1, p2}, Lcom/miui/gallery/util/AlbumsCursorHelper;->isFaceAlbum(J)Z

    move-result v7

    if-eqz v7, :cond_0

    new-instance p1, Landroid/content/Intent;

    const-string p2, "com.miui.gallery.action.VIEW_PEOPLE"

    invoke-direct {p1, p2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    goto/16 :goto_1

    :cond_0
    if-eqz v6, :cond_1

    new-instance v6, Landroid/content/Intent;

    iget-object v7, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mContext:Landroid/content/Context;

    const-class v8, Lcom/miui/gallery/activity/facebaby/BabyAlbumDetailActivity;

    invoke-direct {v6, v7, v8}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v7, "people_id"

    iget-object v8, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mAlbumsCursorHelper:Lcom/miui/gallery/util/AlbumsCursorHelper;

    invoke-virtual {v8, p1, p2}, Lcom/miui/gallery/util/AlbumsCursorHelper;->getBabyAlbumPeopleId(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v7, "baby_info"

    iget-object v8, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mAlbumsCursorHelper:Lcom/miui/gallery/util/AlbumsCursorHelper;

    invoke-virtual {v8, p1, p2}, Lcom/miui/gallery/util/AlbumsCursorHelper;->getBabyInfo(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v7, "thumbnail_info_of_baby"

    iget-object v8, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mAlbumsCursorHelper:Lcom/miui/gallery/util/AlbumsCursorHelper;

    invoke-virtual {v8, p1, p2}, Lcom/miui/gallery/util/AlbumsCursorHelper;->getThumbnailInfoOfBaby(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v7, "baby_sharer_info"

    iget-object v8, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mAlbumsCursorHelper:Lcom/miui/gallery/util/AlbumsCursorHelper;

    invoke-virtual {v8, p1, p2}, Lcom/miui/gallery/util/AlbumsCursorHelper;->getBabySharerInfo(J)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0

    :cond_1
    new-instance v6, Landroid/content/Intent;

    const-string v7, "com.miui.gallery.action.VIEW_ALBUM_DETAIL"

    invoke-direct {v6, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    :goto_0
    const-wide/16 v7, 0x2

    invoke-static {v7, v8}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    iget-object v8, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mAlbumsCursorHelper:Lcom/miui/gallery/util/AlbumsCursorHelper;

    invoke-virtual {v8, p1, p2}, Lcom/miui/gallery/util/AlbumsCursorHelper;->isOtherShareAlbum(J)Z

    move-result v8

    iget-object v9, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mShareAlbumsCursorHelper:Lcom/miui/gallery/util/ShareAlbumsCursorHelper;

    invoke-virtual {v9, p1, p2}, Lcom/miui/gallery/util/ShareAlbumsCursorHelper;->isOwnerShareAlbum(J)Z

    move-result v9

    iget-object v10, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mAlbumsCursorHelper:Lcom/miui/gallery/util/AlbumsCursorHelper;

    invoke-virtual {v10, p1, p2}, Lcom/miui/gallery/util/AlbumsCursorHelper;->isLocalAlbum(J)Z

    move-result v10

    const-string v11, "other_share_album"

    invoke-virtual {v6, v11, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v8, "owner_share_album"

    invoke-virtual {v6, v8, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v8, "is_local_album"

    invoke-virtual {v6, v8, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v8, "screenshot_album"

    invoke-virtual {v6, v8, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v7, "pano_album"

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v7, "album_id"

    invoke-virtual {v6, v7, p1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    const-string p1, "album_name"

    invoke-virtual {v6, p1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "album_server_id"

    invoke-virtual {v6, p1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "attributes"

    invoke-virtual {v6, p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    const-string p1, "album_unwriteable"

    invoke-virtual {v6, p1, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p1, "album_local_path"

    invoke-virtual {v6, p1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-object p1, v6

    :goto_1
    return-object p1
.end method

.method private recordAlbumClick(Ljava/lang/String;)V
    .locals 2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "album_name"

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "recent_album"

    const-string v1, "recent_album_click_album_name"

    invoke-static {p1, v1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method


# virtual methods
.method public getCountForHeader(I)I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    :goto_0
    return p1
.end method

.method public getDateModified(I)J
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    sget v0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->COLUMN_INDEX_DATE_MODIFIED:I

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getDividerView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    const/4 v2, 0x0

    if-ne p1, v1, :cond_2

    const-string p1, "last_divider"

    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_1

    return-object p2

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mContext:Landroid/content/Context;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const p2, 0x7f0b011d

    invoke-virtual {p1, p2, p3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const-string p2, "last_divider"

    invoke-virtual {p1, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    goto :goto_1

    :cond_2
    const-string p1, "normal_divider"

    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_3

    return-object p2

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mContext:Landroid/content/Context;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const p2, 0x7f0b011e

    invoke-virtual {p1, p2, p3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const-string p2, "normal_divider"

    invoke-virtual {p1, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    :goto_1
    return-object p1
.end method

.method public getHeaderView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5

    const/4 v0, 0x0

    if-nez p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mContext:Landroid/content/Context;

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v1, 0x7f0b0120

    invoke-virtual {p2, v1, p3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    :cond_0
    iget-object p3, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    if-eqz p3, :cond_1

    iget-object p3, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    invoke-virtual {p3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/Integer;

    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result v0

    :cond_1
    iget-object p3, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mGroupStartTimeLabels:Ljava/util/ArrayList;

    const/4 v1, 0x0

    if-eqz p3, :cond_2

    iget-object p3, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mGroupStartTimeLabels:Ljava/util/ArrayList;

    invoke-virtual {p3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    goto :goto_0

    :cond_2
    move-object p3, v1

    :goto_0
    iget-object v2, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    :cond_3
    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/database/Cursor;

    sget v2, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->COLUMN_INDEX_ALBUM_ID:I

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    iget-object p1, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mAlbumsCursorHelper:Lcom/miui/gallery/util/AlbumsCursorHelper;

    invoke-virtual {p1, v2, v3}, Lcom/miui/gallery/util/AlbumsCursorHelper;->isAlbumDataValid(J)Z

    move-result p1

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mAlbumsCursorHelper:Lcom/miui/gallery/util/AlbumsCursorHelper;

    invoke-virtual {p1, v2, v3}, Lcom/miui/gallery/util/AlbumsCursorHelper;->getAlbumName(J)Ljava/lang/String;

    move-result-object v1

    :cond_4
    move-object p1, p2

    check-cast p1, Lcom/miui/gallery/ui/RecentTimelineGridHeaderItem;

    iget-boolean v4, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mIsInPickMode:Z

    invoke-virtual {p1, p3, v0, v1, v4}, Lcom/miui/gallery/ui/RecentTimelineGridHeaderItem;->bindData(Ljava/lang/String;ILjava/lang/String;Z)V

    iget-boolean p3, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mIsInPickMode:Z

    if-nez p3, :cond_5

    new-instance p3, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter$1;

    invoke-direct {p3, p0, v2, v3, v1}, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter$1;-><init>(Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;JLjava/lang/String;)V

    invoke-virtual {p1, p3}, Lcom/miui/gallery/ui/RecentTimelineGridHeaderItem;->setAlbumFromClickedListener(Landroid/view/View$OnClickListener;)V

    :cond_5
    return-object p2
.end method

.method public getNumHeaders()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_0
    return v0
.end method

.method public resetShareAlbums()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mShareAlbumsCursorHelper:Lcom/miui/gallery/util/ShareAlbumsCursorHelper;

    invoke-virtual {v0}, Lcom/miui/gallery/util/ShareAlbumsCursorHelper;->reset()V

    return-void
.end method

.method public setAllAlbums(Landroid/database/Cursor;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mAlbumsCursorHelper:Lcom/miui/gallery/util/AlbumsCursorHelper;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/util/AlbumsCursorHelper;->setAlbumsData(Landroid/database/Cursor;)V

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->getCount()I

    move-result v0

    if-lez v0, :cond_0

    if-eqz p1, :cond_0

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result p1

    if-lez p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->notifyDataSetChanged()V

    :cond_0
    return-void
.end method

.method public setShareAlbums(Landroid/database/Cursor;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mShareAlbumsCursorHelper:Lcom/miui/gallery/util/ShareAlbumsCursorHelper;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/util/ShareAlbumsCursorHelper;->setSharedAlbums(Landroid/database/Cursor;)V

    return-void
.end method

.method public shouldDrawDivider()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;
    .locals 5

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    invoke-interface {p1}, Landroid/database/Cursor;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "extra_timeline_item_count_in_group"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getIntegerArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    const-string v2, "extra_timeline_group_start_pos"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getIntegerArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    const-string v3, "extra_timeline_group_time_labels"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    move-object v4, v1

    move-object v1, v0

    move-object v0, v4

    goto :goto_0

    :cond_0
    move-object v1, v0

    move-object v2, v1

    :goto_0
    if-eqz v0, :cond_1

    if-eqz v2, :cond_1

    if-eqz v1, :cond_1

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v3, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mGroupStartTimeLabels:Ljava/util/ArrayList;

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mGroupStartTimeLabels:Ljava/util/ArrayList;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->mGroupStartTimeLabels:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_4
    :goto_1
    invoke-super {p0, p1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    move-result-object p1

    return-object p1
.end method
