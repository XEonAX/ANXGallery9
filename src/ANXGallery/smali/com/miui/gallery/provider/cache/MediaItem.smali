.class Lcom/miui/gallery/provider/cache/MediaItem;
.super Ljava/lang/Object;
.source "MediaItem.java"

# interfaces
.implements Lcom/miui/gallery/provider/cache/CacheItem;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/provider/cache/MediaItem$Generator;,
        Lcom/miui/gallery/provider/cache/MediaItem$AliasClearThumbnailFilter;,
        Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory;
    }
.end annotation


# static fields
.field private static final PROJECTION:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mAlbumId:Ljava/lang/Long;

.field private mAlbumServerId:Ljava/lang/String;

.field private mAliasCreateDate:I

.field private mAliasModifyDate:I

.field private mAliasSortDate:I

.field private mAliasSortTime:J

.field private mBurstGroupId:J

.field private mCreatorId:Ljava/lang/String;

.field private mDateModified:J

.field private mDelegate:Lcom/miui/gallery/provider/cache/AlbumDelegate;

.field private mDescription:Ljava/lang/String;

.field private mDuration:Ljava/lang/Long;

.field private mFavoritesDelegate:Lcom/miui/gallery/provider/cache/FavoritesDelegate;

.field private mFilePath:Ljava/lang/String;

.field private mHeight:Ljava/lang/Integer;

.field private mId:J

.field private mIsSyncing:Ljava/lang/Boolean;

.field private mLatitude:Ljava/lang/String;

.field private mLatitudeRef:Ljava/lang/Character;

.field private mLocalFlag:Ljava/lang/Long;

.field private mLocation:Ljava/lang/String;

.field private mLongitude:Ljava/lang/String;

.field private mLongitudeRef:Ljava/lang/Character;

.field private mMicroThumb:Ljava/lang/String;

.field private mMimeType:Ljava/lang/String;

.field private mMixedTime:J

.field private mOrientation:Ljava/lang/Integer;

.field private mSecretKey:[B

.field private mServerId:Ljava/lang/String;

.field private mServerStatus:Ljava/lang/String;

.field private mServerTag:Ljava/lang/Long;

.field private mSha1:Ljava/lang/String;

.field private mSize:Ljava/lang/Long;

.field private mSpecialTypeFlags:Ljava/lang/Long;

.field private mThumbnail:Ljava/lang/String;

.field private mTitle:Ljava/lang/String;

.field private mType:Ljava/lang/Integer;

.field private mWidth:Ljava/lang/Integer;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    const-string v1, "_id"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    const-string v1, "sha1"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    const-string v1, "localGroupId"

    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    const-string v1, "microthumbfile"

    const/4 v2, 0x3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    const-string v1, "thumbnailFile"

    const/4 v2, 0x4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    const-string v1, "localFile"

    const/4 v2, 0x5

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    const-string v1, "serverType"

    const/4 v2, 0x6

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    const-string v1, "title"

    const/4 v2, 0x7

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    const-string v1, "duration"

    const/16 v2, 0x8

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    const-string v1, "description"

    const/16 v2, 0x9

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    const-string v1, "size"

    const/16 v2, 0xa

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    const-string v1, "mimeType"

    const/16 v2, 0xb

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    const-string v1, "location"

    const/16 v2, 0xc

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    const-string v1, "exifGPSLatitude"

    const/16 v2, 0xd

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    const-string v1, "exifGPSLatitudeRef"

    const/16 v2, 0xe

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    const-string v1, "exifGPSLongitude"

    const/16 v2, 0xf

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    const-string v1, "exifGPSLongitudeRef"

    const/16 v2, 0x10

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    const-string v1, "alias_micro_thumbnail"

    const/16 v2, 0x11

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    const-string v1, "alias_create_time"

    const/16 v2, 0x12

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    const-string v1, "alias_create_date"

    const/16 v2, 0x13

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    const-string v1, "alias_sync_state"

    const/16 v2, 0x14

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    const-string v1, "secretKey"

    const/16 v2, 0x15

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    const-string v1, "exifImageWidth"

    const/16 v2, 0x16

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    const-string v1, "exifImageLength"

    const/16 v2, 0x17

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    const-string v1, "alias_show_in_homepage"

    const/16 v2, 0x18

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    const-string v1, "creatorId"

    const/16 v2, 0x19

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    const-string v1, "localFlag"

    const/16 v2, 0x1a

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    const-string v1, "alias_hidden"

    const/16 v2, 0x1b

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    const-string v1, "serverTag"

    const/16 v2, 0x1c

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    const-string v1, "serverId"

    const/16 v2, 0x1d

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    const-string v1, "dateModified"

    const/16 v2, 0x1e

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    const-string v1, "alias_modify_date"

    const/16 v2, 0x1f

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    const-string v1, "alias_clear_thumbnail"

    const/16 v2, 0x20

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    const-string v1, "alias_is_favorite"

    const/16 v2, 0x21

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    const-string v1, "groupId"

    const/16 v2, 0x22

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    const-string v1, "specialTypeFlags"

    const/16 v2, 0x23

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    const-string v1, "alias_sort_time"

    const/16 v2, 0x24

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    const-string v1, "alias_sort_date"

    const/16 v2, 0x25

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    const-string v1, "exifOrientation"

    const/16 v2, 0x26

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    const-string v1, "burst_group_id"

    const/16 v2, 0x27

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/Long;
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/provider/cache/MediaItem;->getAliasSyncState()Ljava/lang/Long;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/provider/cache/MediaItem;)J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mDateModified:J

    return-wide v0
.end method

.method static synthetic access$1000(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/Integer;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mType:Ljava/lang/Integer;

    return-object p0
.end method

.method static synthetic access$1002(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mType:Ljava/lang/Integer;

    return-object p1
.end method

.method static synthetic access$102(Lcom/miui/gallery/provider/cache/MediaItem;J)J
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mDateModified:J

    return-wide p1
.end method

.method static synthetic access$1100(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/Long;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mLocalFlag:Ljava/lang/Long;

    return-object p0
.end method

.method static synthetic access$1102(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Long;)Ljava/lang/Long;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mLocalFlag:Ljava/lang/Long;

    return-object p1
.end method

.method static synthetic access$1200(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mThumbnail:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1202(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mThumbnail:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1300(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mFilePath:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1302(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mFilePath:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1400(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mSha1:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1402(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mSha1:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1500(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/Long;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mServerTag:Ljava/lang/Long;

    return-object p0
.end method

.method static synthetic access$1502(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Long;)Ljava/lang/Long;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mServerTag:Ljava/lang/Long;

    return-object p1
.end method

.method static synthetic access$1600(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mServerId:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1602(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mServerId:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1700(Lcom/miui/gallery/provider/cache/MediaItem;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAliasCreateDate:I

    return p0
.end method

.method static synthetic access$1702(Lcom/miui/gallery/provider/cache/MediaItem;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAliasCreateDate:I

    return p1
.end method

.method static synthetic access$1800(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mMimeType:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1802(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mMimeType:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$1900(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAlbumServerId:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1902(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAlbumServerId:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$200(Lcom/miui/gallery/provider/cache/MediaItem;)J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAliasSortTime:J

    return-wide v0
.end method

.method static synthetic access$2000(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mLocation:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$2002(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mLocation:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$2100()Ljava/util/HashMap;
    .locals 1

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->PROJECTION:Ljava/util/HashMap;

    return-object v0
.end method

.method static synthetic access$2202(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mMicroThumb:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$2302(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Long;)Ljava/lang/Long;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mDuration:Ljava/lang/Long;

    return-object p1
.end method

.method static synthetic access$2402(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mDescription:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$2502(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mLatitude:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$2602(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Character;)Ljava/lang/Character;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mLatitudeRef:Ljava/lang/Character;

    return-object p1
.end method

.method static synthetic access$2702(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mLongitude:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$2802(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Character;)Ljava/lang/Character;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mLongitudeRef:Ljava/lang/Character;

    return-object p1
.end method

.method static synthetic access$2902(Lcom/miui/gallery/provider/cache/MediaItem;[B)[B
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mSecretKey:[B

    return-object p1
.end method

.method static synthetic access$300(Lcom/miui/gallery/provider/cache/MediaItem;)J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mMixedTime:J

    return-wide v0
.end method

.method static synthetic access$3002(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mServerStatus:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$302(Lcom/miui/gallery/provider/cache/MediaItem;J)J
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mMixedTime:J

    return-wide p1
.end method

.method static synthetic access$3102(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mCreatorId:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$3202(Lcom/miui/gallery/provider/cache/MediaItem;Lcom/miui/gallery/provider/cache/AlbumDelegate;)Lcom/miui/gallery/provider/cache/AlbumDelegate;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mDelegate:Lcom/miui/gallery/provider/cache/AlbumDelegate;

    return-object p1
.end method

.method static synthetic access$3302(Lcom/miui/gallery/provider/cache/MediaItem;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAliasModifyDate:I

    return p1
.end method

.method static synthetic access$3402(Lcom/miui/gallery/provider/cache/MediaItem;Lcom/miui/gallery/provider/cache/FavoritesDelegate;)Lcom/miui/gallery/provider/cache/FavoritesDelegate;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mFavoritesDelegate:Lcom/miui/gallery/provider/cache/FavoritesDelegate;

    return-object p1
.end method

.method static synthetic access$3502(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Long;)Ljava/lang/Long;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mSpecialTypeFlags:Ljava/lang/Long;

    return-object p1
.end method

.method static synthetic access$3600(Lcom/miui/gallery/provider/cache/MediaItem;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/provider/cache/MediaItem;->regenerateSortTimeAndDate()V

    return-void
.end method

.method static synthetic access$3702(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mOrientation:Ljava/lang/Integer;

    return-object p1
.end method

.method static synthetic access$3802(Lcom/miui/gallery/provider/cache/MediaItem;J)J
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mBurstGroupId:J

    return-wide p1
.end method

.method static synthetic access$3900(Ljava/lang/String;)J
    .locals 2

    invoke-static {p0}, Lcom/miui/gallery/provider/cache/MediaItem;->generateBurstGroupId(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$400(Lcom/miui/gallery/provider/cache/MediaItem;)J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mId:J

    return-wide v0
.end method

.method static synthetic access$4002(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mIsSyncing:Ljava/lang/Boolean;

    return-object p1
.end method

.method static synthetic access$402(Lcom/miui/gallery/provider/cache/MediaItem;J)J
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mId:J

    return-wide p1
.end method

.method static synthetic access$500(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mTitle:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$502(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mTitle:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$600(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/Long;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mSize:Ljava/lang/Long;

    return-object p0
.end method

.method static synthetic access$602(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Long;)Ljava/lang/Long;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mSize:Ljava/lang/Long;

    return-object p1
.end method

.method static synthetic access$700(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/Integer;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mWidth:Ljava/lang/Integer;

    return-object p0
.end method

.method static synthetic access$702(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mWidth:Ljava/lang/Integer;

    return-object p1
.end method

.method static synthetic access$800(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/Integer;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mHeight:Ljava/lang/Integer;

    return-object p0
.end method

.method static synthetic access$802(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mHeight:Ljava/lang/Integer;

    return-object p1
.end method

.method static synthetic access$900(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/Long;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAlbumId:Ljava/lang/Long;

    return-object p0
.end method

.method static synthetic access$902(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Long;)Ljava/lang/Long;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAlbumId:Ljava/lang/Long;

    return-object p1
.end method

.method private static generateBurstGroupId(Ljava/lang/String;)J
    .locals 2

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    const-string v0, "_BURST"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    const-string v0, "_"

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_2

    array-length v0, p0

    const/4 v1, 0x4

    if-ge v0, v1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    aget-object v0, p0, v0

    const/4 v1, 0x2

    aget-object p0, p0, v1

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    :try_start_0
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    :catch_0
    move-exception p0

    const-string v0, ".provider.cache.MediaItem"

    const-string v1, "generate burst group id error"

    invoke-static {v0, v1, p0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    sget-object p0, Lcom/miui/gallery/provider/cache/MediaItem;->DEFAULT_INT:Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    int-to-long v0, p0

    return-wide v0

    :cond_2
    :goto_0
    sget-object p0, Lcom/miui/gallery/provider/cache/MediaItem;->DEFAULT_INT:Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    int-to-long v0, p0

    return-wide v0

    :cond_3
    :goto_1
    sget-object p0, Lcom/miui/gallery/provider/cache/MediaItem;->DEFAULT_INT:Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    int-to-long v0, p0

    return-wide v0
.end method

.method private getAliasSyncState()Ljava/lang/Long;
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mLocalFlag:Ljava/lang/Long;

    if-nez v0, :cond_0

    const-string v0, ".provider.cache.MediaItem"

    const-string v1, "localFlag is null!"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    const-wide/32 v0, 0x7fffffff

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mLocalFlag:Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_1

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mLocalFlag:Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    const-wide/16 v2, 0x5

    cmp-long v4, v0, v2

    if-eqz v4, :cond_8

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mLocalFlag:Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    const-wide/16 v2, 0x6

    cmp-long v4, v0, v2

    if-eqz v4, :cond_8

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mLocalFlag:Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    const-wide/16 v2, 0x9

    cmp-long v4, v0, v2

    if-nez v4, :cond_2

    goto :goto_2

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAlbumId:Ljava/lang/Long;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mDelegate:Lcom/miui/gallery/provider/cache/AlbumDelegate;

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAlbumId:Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/provider/cache/AlbumDelegate;->isAutoUpload(J)Z

    move-result v0

    if-nez v0, :cond_3

    goto :goto_1

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mIsSyncing:Ljava/lang/Boolean;

    if-nez v0, :cond_5

    new-instance v0, Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;

    sget-object v1, Lcom/miui/gallery/sdk/uploadstatus/ItemType;->OWNER:Lcom/miui/gallery/sdk/uploadstatus/ItemType;

    iget-wide v2, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mId:J

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;-><init>(Lcom/miui/gallery/sdk/uploadstatus/ItemType;Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/sdk/uploadstatus/SyncProxy;->getInstance()Lcom/miui/gallery/sdk/uploadstatus/SyncProxy;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/sdk/uploadstatus/SyncProxy;->getUploadStatusProxy()Lcom/miui/gallery/sdk/uploadstatus/UploadStatusProxy;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/miui/gallery/sdk/uploadstatus/UploadStatusProxy;->getUploadStatus(Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;)Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;

    move-result-object v0

    if-eqz v0, :cond_4

    iget-object v0, v0, Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;->mStatus:Lcom/miui/gallery/sdk/SyncStatus;

    sget-object v1, Lcom/miui/gallery/sdk/SyncStatus;->STATUS_INIT:Lcom/miui/gallery/sdk/SyncStatus;

    if-ne v0, v1, :cond_4

    const/4 v0, 0x1

    goto :goto_0

    :cond_4
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mIsSyncing:Ljava/lang/Boolean;

    :cond_5
    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mIsSyncing:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_6

    const-wide/16 v0, 0x2

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    :cond_6
    const-wide/16 v0, 0x3

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    :cond_7
    :goto_1
    const-wide/16 v0, 0x4

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0

    :cond_8
    :goto_2
    const-wide/16 v0, 0x1

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method private regenerateSortTimeAndDate()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAlbumId:Ljava/lang/Long;

    if-nez v0, :cond_0

    iget-wide v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mMixedTime:J

    iput-wide v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAliasSortTime:J

    iget v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAliasCreateDate:I

    iput v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAliasSortDate:I

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mDelegate:Lcom/miui/gallery/provider/cache/AlbumDelegate;

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAlbumId:Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/provider/cache/AlbumDelegate;->getSortDate(J)Lcom/miui/gallery/provider/MediaSortDateHelper$SortDate;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/provider/cache/MediaItem$1;->$SwitchMap$com$miui$gallery$provider$MediaSortDateHelper$SortDate:[I

    invoke-virtual {v0}, Lcom/miui/gallery/provider/MediaSortDateHelper$SortDate;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unsupported sort date "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    :pswitch_0
    iget-wide v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mDateModified:J

    iput-wide v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAliasSortTime:J

    iget v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAliasModifyDate:I

    iput v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAliasSortDate:I

    goto :goto_0

    :pswitch_1
    iget-wide v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mMixedTime:J

    iput-wide v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAliasSortTime:J

    iget v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAliasCreateDate:I

    iput v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAliasSortDate:I

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public columnEquals(Lcom/miui/gallery/provider/cache/CacheItem;I)Z
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/provider/cache/CacheUtils;->columnEquals(Lcom/miui/gallery/provider/cache/CacheItem;Lcom/miui/gallery/provider/cache/CacheItem;I)Z

    move-result p1

    return p1
.end method

.method public fillWindow(Landroid/database/CursorWindow;III)Z
    .locals 2

    const/4 v0, 0x0

    packed-switch p4, :pswitch_data_0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, " not recognized column."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_0
    iget-wide v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mBurstGroupId:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p4

    invoke-static {p1, p4, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putLong(Landroid/database/CursorWindow;Ljava/lang/Number;II)Z

    move-result p1

    goto/16 :goto_2

    :pswitch_1
    iget-object p4, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mOrientation:Ljava/lang/Integer;

    invoke-static {p1, p4, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putLong(Landroid/database/CursorWindow;Ljava/lang/Number;II)Z

    move-result p1

    goto/16 :goto_2

    :pswitch_2
    iget p4, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAliasSortDate:I

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    invoke-static {p1, p4, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putLong(Landroid/database/CursorWindow;Ljava/lang/Number;II)Z

    move-result p1

    goto/16 :goto_2

    :pswitch_3
    iget-wide v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAliasSortTime:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p4

    invoke-static {p1, p4, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putLong(Landroid/database/CursorWindow;Ljava/lang/Number;II)Z

    move-result p1

    goto/16 :goto_2

    :pswitch_4
    iget-object p4, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mSpecialTypeFlags:Ljava/lang/Long;

    invoke-static {p1, p4, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putLong(Landroid/database/CursorWindow;Ljava/lang/Number;II)Z

    move-result p1

    goto/16 :goto_2

    :pswitch_5
    iget-object p4, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAlbumServerId:Ljava/lang/String;

    invoke-static {p1, p4, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putString(Landroid/database/CursorWindow;Ljava/lang/String;II)Z

    move-result p1

    goto/16 :goto_2

    :pswitch_6
    invoke-virtual {p0}, Lcom/miui/gallery/provider/cache/MediaItem;->getAliasIsFavorite()Ljava/lang/Long;

    move-result-object p4

    invoke-static {p1, p4, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putLong(Landroid/database/CursorWindow;Ljava/lang/Number;II)Z

    move-result p1

    goto/16 :goto_2

    :pswitch_7
    invoke-virtual {p0}, Lcom/miui/gallery/provider/cache/MediaItem;->getAliasClearThumbnail()Ljava/lang/String;

    move-result-object p4

    invoke-static {p1, p4, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putString(Landroid/database/CursorWindow;Ljava/lang/String;II)Z

    move-result p1

    goto/16 :goto_2

    :pswitch_8
    iget p4, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAliasModifyDate:I

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    invoke-static {p1, p4, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putLong(Landroid/database/CursorWindow;Ljava/lang/Number;II)Z

    move-result p1

    goto/16 :goto_2

    :pswitch_9
    iget-wide v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mDateModified:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p4

    invoke-static {p1, p4, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putLong(Landroid/database/CursorWindow;Ljava/lang/Number;II)Z

    move-result p1

    goto/16 :goto_2

    :pswitch_a
    iget-object p4, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mServerId:Ljava/lang/String;

    invoke-static {p1, p4, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putString(Landroid/database/CursorWindow;Ljava/lang/String;II)Z

    move-result p1

    goto/16 :goto_2

    :pswitch_b
    iget-object p4, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mServerTag:Ljava/lang/Long;

    invoke-static {p1, p4, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putLong(Landroid/database/CursorWindow;Ljava/lang/Number;II)Z

    move-result p1

    goto/16 :goto_2

    :pswitch_c
    invoke-virtual {p0}, Lcom/miui/gallery/provider/cache/MediaItem;->getAliasHidden()Ljava/lang/Long;

    move-result-object p4

    invoke-static {p1, p4, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putLong(Landroid/database/CursorWindow;Ljava/lang/Number;II)Z

    move-result p1

    goto/16 :goto_2

    :pswitch_d
    iget-object p4, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mLocalFlag:Ljava/lang/Long;

    invoke-static {p1, p4, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putLong(Landroid/database/CursorWindow;Ljava/lang/Number;II)Z

    move-result p1

    goto/16 :goto_2

    :pswitch_e
    iget-object p4, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mCreatorId:Ljava/lang/String;

    invoke-static {p1, p4, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putString(Landroid/database/CursorWindow;Ljava/lang/String;II)Z

    move-result p1

    goto/16 :goto_2

    :pswitch_f
    invoke-virtual {p0}, Lcom/miui/gallery/provider/cache/MediaItem;->getAliasShowInHomePage()Ljava/lang/Long;

    move-result-object p4

    invoke-static {p1, p4, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putLong(Landroid/database/CursorWindow;Ljava/lang/Number;II)Z

    move-result p1

    goto/16 :goto_2

    :pswitch_10
    iget-object p4, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mHeight:Ljava/lang/Integer;

    invoke-static {p1, p4, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putLong(Landroid/database/CursorWindow;Ljava/lang/Number;II)Z

    move-result p1

    goto/16 :goto_2

    :pswitch_11
    iget-object p4, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mWidth:Ljava/lang/Integer;

    invoke-static {p1, p4, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putLong(Landroid/database/CursorWindow;Ljava/lang/Number;II)Z

    move-result p1

    goto/16 :goto_2

    :pswitch_12
    iget-object p4, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mSecretKey:[B

    invoke-static {p1, p4, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putBlob(Landroid/database/CursorWindow;[BII)Z

    move-result p1

    goto/16 :goto_2

    :pswitch_13
    invoke-direct {p0}, Lcom/miui/gallery/provider/cache/MediaItem;->getAliasSyncState()Ljava/lang/Long;

    move-result-object p4

    invoke-static {p1, p4, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putLong(Landroid/database/CursorWindow;Ljava/lang/Number;II)Z

    move-result p1

    goto/16 :goto_2

    :pswitch_14
    iget p4, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAliasCreateDate:I

    int-to-long v0, p4

    invoke-virtual {p1, v0, v1, p2, p3}, Landroid/database/CursorWindow;->putLong(JII)Z

    move-result p1

    goto/16 :goto_2

    :pswitch_15
    iget-wide v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mMixedTime:J

    invoke-virtual {p1, v0, v1, p2, p3}, Landroid/database/CursorWindow;->putLong(JII)Z

    move-result p1

    goto/16 :goto_2

    :pswitch_16
    invoke-virtual {p0}, Lcom/miui/gallery/provider/cache/MediaItem;->getAliasMicroThumbnail()Ljava/lang/String;

    move-result-object p4

    invoke-static {p1, p4, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putString(Landroid/database/CursorWindow;Ljava/lang/String;II)Z

    move-result p1

    goto/16 :goto_2

    :pswitch_17
    iget-object p4, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mLongitudeRef:Ljava/lang/Character;

    if-nez p4, :cond_0

    goto :goto_0

    :cond_0
    iget-object p4, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mLongitudeRef:Ljava/lang/Character;

    invoke-static {p4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    invoke-static {p1, v0, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putString(Landroid/database/CursorWindow;Ljava/lang/String;II)Z

    move-result p1

    goto/16 :goto_2

    :pswitch_18
    iget-object p4, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mLongitude:Ljava/lang/String;

    invoke-static {p1, p4, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putString(Landroid/database/CursorWindow;Ljava/lang/String;II)Z

    move-result p1

    goto/16 :goto_2

    :pswitch_19
    iget-object p4, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mLatitudeRef:Ljava/lang/Character;

    if-nez p4, :cond_1

    goto :goto_1

    :cond_1
    iget-object p4, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mLatitudeRef:Ljava/lang/Character;

    invoke-static {p4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :goto_1
    invoke-static {p1, v0, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putString(Landroid/database/CursorWindow;Ljava/lang/String;II)Z

    move-result p1

    goto/16 :goto_2

    :pswitch_1a
    iget-object p4, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mLatitude:Ljava/lang/String;

    invoke-static {p1, p4, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putString(Landroid/database/CursorWindow;Ljava/lang/String;II)Z

    move-result p1

    goto :goto_2

    :pswitch_1b
    iget-object p4, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mLocation:Ljava/lang/String;

    invoke-static {p1, p4, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putString(Landroid/database/CursorWindow;Ljava/lang/String;II)Z

    move-result p1

    goto :goto_2

    :pswitch_1c
    iget-object p4, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mMimeType:Ljava/lang/String;

    invoke-static {p1, p4, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putString(Landroid/database/CursorWindow;Ljava/lang/String;II)Z

    move-result p1

    goto :goto_2

    :pswitch_1d
    iget-object p4, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mSize:Ljava/lang/Long;

    invoke-virtual {p4}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1, p2, p3}, Landroid/database/CursorWindow;->putLong(JII)Z

    move-result p1

    goto :goto_2

    :pswitch_1e
    iget-object p4, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mDescription:Ljava/lang/String;

    invoke-static {p1, p4, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putString(Landroid/database/CursorWindow;Ljava/lang/String;II)Z

    move-result p1

    goto :goto_2

    :pswitch_1f
    iget-object p4, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mDuration:Ljava/lang/Long;

    invoke-static {p1, p4, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putLong(Landroid/database/CursorWindow;Ljava/lang/Number;II)Z

    move-result p1

    goto :goto_2

    :pswitch_20
    iget-object p4, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mTitle:Ljava/lang/String;

    invoke-static {p1, p4, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putString(Landroid/database/CursorWindow;Ljava/lang/String;II)Z

    move-result p1

    goto :goto_2

    :pswitch_21
    iget-object p4, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mType:Ljava/lang/Integer;

    invoke-static {p1, p4, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putLong(Landroid/database/CursorWindow;Ljava/lang/Number;II)Z

    move-result p1

    goto :goto_2

    :pswitch_22
    iget-object p4, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mFilePath:Ljava/lang/String;

    invoke-static {p1, p4, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putString(Landroid/database/CursorWindow;Ljava/lang/String;II)Z

    move-result p1

    goto :goto_2

    :pswitch_23
    iget-object p4, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mThumbnail:Ljava/lang/String;

    invoke-static {p1, p4, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putString(Landroid/database/CursorWindow;Ljava/lang/String;II)Z

    move-result p1

    goto :goto_2

    :pswitch_24
    iget-object p4, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mMicroThumb:Ljava/lang/String;

    invoke-static {p1, p4, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putString(Landroid/database/CursorWindow;Ljava/lang/String;II)Z

    move-result p1

    goto :goto_2

    :pswitch_25
    iget-object p4, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAlbumId:Ljava/lang/Long;

    invoke-static {p1, p4, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putLong(Landroid/database/CursorWindow;Ljava/lang/Number;II)Z

    move-result p1

    goto :goto_2

    :pswitch_26
    iget-object p4, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mSha1:Ljava/lang/String;

    invoke-static {p1, p4, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putString(Landroid/database/CursorWindow;Ljava/lang/String;II)Z

    move-result p1

    goto :goto_2

    :pswitch_27
    iget-wide v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mId:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p4

    invoke-static {p1, p4, p2, p3}, Lcom/miui/gallery/provider/cache/ParseUtils;->putLong(Landroid/database/CursorWindow;Ljava/lang/Number;II)Z

    move-result p1

    :goto_2
    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public get(IZ)Ljava/lang/Object;
    .locals 2

    const/16 v0, 0x20

    const/4 v1, 0x0

    packed-switch p1, :pswitch_data_0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, " not recognized column. "

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_0
    iget-wide p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mBurstGroupId:J

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    return-object p1

    :pswitch_1
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mOrientation:Ljava/lang/Integer;

    if-eqz p1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mOrientation:Ljava/lang/Integer;

    goto :goto_0

    :cond_0
    if-eqz p2, :cond_1

    sget-object v1, Lcom/miui/gallery/provider/cache/MediaItem;->DEFAULT_INT:Ljava/lang/Integer;

    :cond_1
    :goto_0
    return-object v1

    :pswitch_2
    iget p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAliasSortDate:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1

    :pswitch_3
    iget-wide p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAliasSortTime:J

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    return-object p1

    :pswitch_4
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mSpecialTypeFlags:Ljava/lang/Long;

    return-object p1

    :pswitch_5
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAlbumServerId:Ljava/lang/String;

    if-eqz p1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAlbumServerId:Ljava/lang/String;

    goto :goto_1

    :cond_2
    if-eqz p2, :cond_3

    const-string v1, ""

    :cond_3
    :goto_1
    return-object v1

    :pswitch_6
    invoke-virtual {p0}, Lcom/miui/gallery/provider/cache/MediaItem;->getAliasIsFavorite()Ljava/lang/Long;

    move-result-object p1

    return-object p1

    :pswitch_7
    invoke-virtual {p0}, Lcom/miui/gallery/provider/cache/MediaItem;->getAliasClearThumbnail()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_4

    move-object v1, p1

    goto :goto_2

    :cond_4
    if-eqz p2, :cond_5

    const-string v1, ""

    :cond_5
    :goto_2
    return-object v1

    :pswitch_8
    iget p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAliasModifyDate:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1

    :pswitch_9
    iget-wide p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mDateModified:J

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    return-object p1

    :pswitch_a
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mServerId:Ljava/lang/String;

    return-object p1

    :pswitch_b
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mServerTag:Ljava/lang/Long;

    return-object p1

    :pswitch_c
    invoke-virtual {p0}, Lcom/miui/gallery/provider/cache/MediaItem;->getAliasHidden()Ljava/lang/Long;

    move-result-object p1

    return-object p1

    :pswitch_d
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mLocalFlag:Ljava/lang/Long;

    return-object p1

    :pswitch_e
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mCreatorId:Ljava/lang/String;

    return-object p1

    :pswitch_f
    sget-object p1, Lcom/miui/gallery/provider/cache/MediaItem;->TRUE:Ljava/lang/Long;

    return-object p1

    :pswitch_10
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mHeight:Ljava/lang/Integer;

    if-eqz p1, :cond_6

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mHeight:Ljava/lang/Integer;

    goto :goto_3

    :cond_6
    if-eqz p2, :cond_7

    sget-object v1, Lcom/miui/gallery/provider/cache/MediaItem;->DEFAULT_INT:Ljava/lang/Integer;

    :cond_7
    :goto_3
    return-object v1

    :pswitch_11
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mWidth:Ljava/lang/Integer;

    if-eqz p1, :cond_8

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mWidth:Ljava/lang/Integer;

    goto :goto_4

    :cond_8
    if-eqz p2, :cond_9

    sget-object v1, Lcom/miui/gallery/provider/cache/MediaItem;->DEFAULT_INT:Ljava/lang/Integer;

    :cond_9
    :goto_4
    return-object v1

    :pswitch_12
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mSecretKey:[B

    if-eqz p1, :cond_a

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mSecretKey:[B

    goto :goto_5

    :cond_a
    if-eqz p2, :cond_b

    const/4 p1, 0x0

    new-array v1, p1, [B

    :cond_b
    :goto_5
    return-object v1

    :pswitch_13
    invoke-direct {p0}, Lcom/miui/gallery/provider/cache/MediaItem;->getAliasSyncState()Ljava/lang/Long;

    move-result-object p1

    return-object p1

    :pswitch_14
    iget p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAliasCreateDate:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1

    :pswitch_15
    iget-wide p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mMixedTime:J

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    return-object p1

    :pswitch_16
    invoke-virtual {p0}, Lcom/miui/gallery/provider/cache/MediaItem;->getAliasMicroThumbnail()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_c

    move-object v1, p1

    goto :goto_6

    :cond_c
    if-eqz p2, :cond_d

    sget-object v1, Lcom/miui/gallery/provider/cache/MediaItem;->DEFAULT_LONG:Ljava/lang/Long;

    :cond_d
    :goto_6
    return-object v1

    :pswitch_17
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mLongitudeRef:Ljava/lang/Character;

    if-eqz p1, :cond_e

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mLongitudeRef:Ljava/lang/Character;

    goto :goto_7

    :cond_e
    if-eqz p2, :cond_f

    invoke-static {v0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v1

    :cond_f
    :goto_7
    return-object v1

    :pswitch_18
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mLongitude:Ljava/lang/String;

    if-eqz p1, :cond_10

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mLongitude:Ljava/lang/String;

    goto :goto_8

    :cond_10
    if-eqz p2, :cond_11

    sget-object v1, Lcom/miui/gallery/provider/cache/MediaItem;->DEFAULT_LONG:Ljava/lang/Long;

    :cond_11
    :goto_8
    return-object v1

    :pswitch_19
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mLatitudeRef:Ljava/lang/Character;

    if-eqz p1, :cond_12

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mLatitudeRef:Ljava/lang/Character;

    goto :goto_9

    :cond_12
    if-eqz p2, :cond_13

    invoke-static {v0}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v1

    :cond_13
    :goto_9
    return-object v1

    :pswitch_1a
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mLatitude:Ljava/lang/String;

    if-eqz p1, :cond_14

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mLatitude:Ljava/lang/String;

    goto :goto_a

    :cond_14
    if-eqz p2, :cond_15

    sget-object v1, Lcom/miui/gallery/provider/cache/MediaItem;->DEFAULT_LONG:Ljava/lang/Long;

    :cond_15
    :goto_a
    return-object v1

    :pswitch_1b
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mLocation:Ljava/lang/String;

    if-eqz p1, :cond_16

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mLocation:Ljava/lang/String;

    goto :goto_b

    :cond_16
    if-eqz p2, :cond_17

    const-string v1, ""

    :cond_17
    :goto_b
    return-object v1

    :pswitch_1c
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mMimeType:Ljava/lang/String;

    if-eqz p1, :cond_18

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mMimeType:Ljava/lang/String;

    goto :goto_c

    :cond_18
    if-eqz p2, :cond_19

    const-string v1, ""

    :cond_19
    :goto_c
    return-object v1

    :pswitch_1d
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mSize:Ljava/lang/Long;

    return-object p1

    :pswitch_1e
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mDescription:Ljava/lang/String;

    if-eqz p1, :cond_1a

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mDescription:Ljava/lang/String;

    goto :goto_d

    :cond_1a
    if-eqz p2, :cond_1b

    const-string v1, ""

    :cond_1b
    :goto_d
    return-object v1

    :pswitch_1f
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mDuration:Ljava/lang/Long;

    if-eqz p1, :cond_1c

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mDuration:Ljava/lang/Long;

    goto :goto_e

    :cond_1c
    if-eqz p2, :cond_1d

    sget-object v1, Lcom/miui/gallery/provider/cache/MediaItem;->DEFAULT_LONG:Ljava/lang/Long;

    :cond_1d
    :goto_e
    return-object v1

    :pswitch_20
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mTitle:Ljava/lang/String;

    if-eqz p1, :cond_1e

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mTitle:Ljava/lang/String;

    goto :goto_f

    :cond_1e
    if-eqz p2, :cond_1f

    const-string v1, ""

    :cond_1f
    :goto_f
    return-object v1

    :pswitch_21
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mType:Ljava/lang/Integer;

    if-eqz p1, :cond_20

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mType:Ljava/lang/Integer;

    goto :goto_10

    :cond_20
    if-eqz p2, :cond_21

    sget-object v1, Lcom/miui/gallery/provider/cache/MediaItem;->DEFAULT_INT:Ljava/lang/Integer;

    :cond_21
    :goto_10
    return-object v1

    :pswitch_22
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mFilePath:Ljava/lang/String;

    if-eqz p1, :cond_22

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mFilePath:Ljava/lang/String;

    goto :goto_11

    :cond_22
    if-eqz p2, :cond_23

    const-string v1, ""

    :cond_23
    :goto_11
    return-object v1

    :pswitch_23
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mThumbnail:Ljava/lang/String;

    if-eqz p1, :cond_24

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mThumbnail:Ljava/lang/String;

    goto :goto_12

    :cond_24
    if-eqz p2, :cond_25

    const-string v1, ""

    :cond_25
    :goto_12
    return-object v1

    :pswitch_24
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mMicroThumb:Ljava/lang/String;

    if-eqz p1, :cond_26

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mMicroThumb:Ljava/lang/String;

    goto :goto_13

    :cond_26
    if-eqz p2, :cond_27

    const-string v1, ""

    :cond_27
    :goto_13
    return-object v1

    :pswitch_25
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAlbumId:Ljava/lang/Long;

    if-eqz p1, :cond_28

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAlbumId:Ljava/lang/Long;

    goto :goto_14

    :cond_28
    if-eqz p2, :cond_29

    sget-object v1, Lcom/miui/gallery/provider/cache/MediaItem;->DEFAULT_LONG:Ljava/lang/Long;

    :cond_29
    :goto_14
    return-object v1

    :pswitch_26
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mSha1:Ljava/lang/String;

    if-eqz p1, :cond_2a

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mSha1:Ljava/lang/String;

    goto :goto_15

    :cond_2a
    if-eqz p2, :cond_2b

    const-string v1, ""

    :cond_2b
    :goto_15
    return-object v1

    :pswitch_27
    iget-wide p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mId:J

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    return-object p1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getAliasClearThumbnail()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mFilePath:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mFilePath:Ljava/lang/String;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mThumbnail:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mThumbnail:Ljava/lang/String;

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mMicroThumb:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mMicroThumb:Ljava/lang/String;

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public getAliasHidden()Ljava/lang/Long;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAlbumId:Ljava/lang/Long;

    if-nez v0, :cond_0

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->FALSE:Ljava/lang/Long;

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mDelegate:Lcom/miui/gallery/provider/cache/AlbumDelegate;

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAlbumId:Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/provider/cache/AlbumDelegate;->isHidden(J)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->TRUE:Ljava/lang/Long;

    goto :goto_0

    :cond_1
    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->FALSE:Ljava/lang/Long;

    :goto_0
    return-object v0
.end method

.method public getAliasIsFavorite()Ljava/lang/Long;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mSha1:Ljava/lang/String;

    if-nez v0, :cond_0

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->FALSE:Ljava/lang/Long;

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mFavoritesDelegate:Lcom/miui/gallery/provider/cache/FavoritesDelegate;

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mSha1:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/provider/cache/FavoritesDelegate;->isFavorite(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->TRUE:Ljava/lang/Long;

    goto :goto_0

    :cond_1
    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->FALSE:Ljava/lang/Long;

    :goto_0
    return-object v0
.end method

.method public getAliasMicroThumbnail()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mMicroThumb:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mMicroThumb:Ljava/lang/String;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mThumbnail:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mThumbnail:Ljava/lang/String;

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mFilePath:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mFilePath:Ljava/lang/String;

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public getAliasShowInHomePage()Ljava/lang/Long;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAlbumId:Ljava/lang/Long;

    if-nez v0, :cond_0

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->FALSE:Ljava/lang/Long;

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mDelegate:Lcom/miui/gallery/provider/cache/AlbumDelegate;

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAlbumId:Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/provider/cache/AlbumDelegate;->isShowInHomePage(J)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->TRUE:Ljava/lang/Long;

    goto :goto_0

    :cond_1
    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem;->FALSE:Ljava/lang/Long;

    :goto_0
    return-object v0
.end method

.method public getAliasSortDate()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAliasSortDate:I

    return v0
.end method

.method public getAliasSortTime()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAliasSortTime:J

    return-wide v0
.end method

.method public getId()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mId:J

    return-wide v0
.end method

.method public getLocation()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mLocation:Ljava/lang/String;

    return-object v0
.end method

.method public getType(I)I
    .locals 3

    const/4 v0, 0x3

    const/4 v1, 0x0

    const/4 v2, 0x1

    packed-switch p1, :pswitch_data_0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, " not recognized column. "

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_0
    return v2

    :pswitch_1
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mOrientation:Ljava/lang/Integer;

    if-eqz p1, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1

    :pswitch_2
    return v2

    :pswitch_3
    return v2

    :pswitch_4
    return v2

    :pswitch_5
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAlbumServerId:Ljava/lang/String;

    if-eqz p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0

    :pswitch_6
    return v2

    :pswitch_7
    invoke-virtual {p0}, Lcom/miui/gallery/provider/cache/MediaItem;->getAliasClearThumbnail()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_2

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    :goto_1
    return v0

    :pswitch_8
    return v2

    :pswitch_9
    return v2

    :pswitch_a
    return v0

    :pswitch_b
    return v2

    :pswitch_c
    return v2

    :pswitch_d
    return v2

    :pswitch_e
    return v0

    :pswitch_f
    return v2

    :pswitch_10
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mHeight:Ljava/lang/Integer;

    if-eqz p1, :cond_3

    const/4 v1, 0x1

    :cond_3
    return v1

    :pswitch_11
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mWidth:Ljava/lang/Integer;

    if-eqz p1, :cond_4

    const/4 v1, 0x1

    :cond_4
    return v1

    :pswitch_12
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mSecretKey:[B

    if-eqz p1, :cond_5

    const/4 v1, 0x4

    :cond_5
    return v1

    :pswitch_13
    return v2

    :pswitch_14
    return v2

    :pswitch_15
    return v2

    :pswitch_16
    invoke-virtual {p0}, Lcom/miui/gallery/provider/cache/MediaItem;->getAliasMicroThumbnail()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_6

    goto :goto_2

    :cond_6
    const/4 v0, 0x0

    :goto_2
    return v0

    :pswitch_17
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mLongitudeRef:Ljava/lang/Character;

    if-eqz p1, :cond_7

    goto :goto_3

    :cond_7
    const/4 v0, 0x0

    :goto_3
    return v0

    :pswitch_18
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mLongitude:Ljava/lang/String;

    if-eqz p1, :cond_8

    goto :goto_4

    :cond_8
    const/4 v0, 0x0

    :goto_4
    return v0

    :pswitch_19
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mLatitudeRef:Ljava/lang/Character;

    if-eqz p1, :cond_9

    goto :goto_5

    :cond_9
    const/4 v0, 0x0

    :goto_5
    return v0

    :pswitch_1a
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mLatitude:Ljava/lang/String;

    if-eqz p1, :cond_a

    goto :goto_6

    :cond_a
    const/4 v0, 0x0

    :goto_6
    return v0

    :pswitch_1b
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mLocation:Ljava/lang/String;

    if-eqz p1, :cond_b

    goto :goto_7

    :cond_b
    const/4 v0, 0x0

    :goto_7
    return v0

    :pswitch_1c
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mMimeType:Ljava/lang/String;

    if-eqz p1, :cond_c

    goto :goto_8

    :cond_c
    const/4 v0, 0x0

    :goto_8
    return v0

    :pswitch_1d
    return v2

    :pswitch_1e
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mDescription:Ljava/lang/String;

    if-eqz p1, :cond_d

    goto :goto_9

    :cond_d
    const/4 v0, 0x0

    :goto_9
    return v0

    :pswitch_1f
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mDuration:Ljava/lang/Long;

    if-eqz p1, :cond_e

    const/4 v1, 0x1

    :cond_e
    return v1

    :pswitch_20
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mTitle:Ljava/lang/String;

    if-eqz p1, :cond_f

    goto :goto_a

    :cond_f
    const/4 v0, 0x0

    :goto_a
    return v0

    :pswitch_21
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mType:Ljava/lang/Integer;

    if-eqz p1, :cond_10

    const/4 v1, 0x1

    :cond_10
    return v1

    :pswitch_22
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mFilePath:Ljava/lang/String;

    if-eqz p1, :cond_11

    goto :goto_b

    :cond_11
    const/4 v0, 0x0

    :goto_b
    return v0

    :pswitch_23
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mThumbnail:Ljava/lang/String;

    if-eqz p1, :cond_12

    goto :goto_c

    :cond_12
    const/4 v0, 0x0

    :goto_c
    return v0

    :pswitch_24
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mMicroThumb:Ljava/lang/String;

    if-eqz p1, :cond_13

    goto :goto_d

    :cond_13
    const/4 v0, 0x0

    :goto_d
    return v0

    :pswitch_25
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAlbumId:Ljava/lang/Long;

    if-eqz p1, :cond_14

    const/4 v1, 0x1

    :cond_14
    return v1

    :pswitch_26
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mSha1:Ljava/lang/String;

    if-eqz p1, :cond_15

    goto :goto_e

    :cond_15
    const/4 v0, 0x0

    :goto_e
    return v0

    :pswitch_27
    return v2

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "MediaItem{mId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mId:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", mSha1=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mSha1:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, ", mAlbumId="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAlbumId:Ljava/lang/Long;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", mMicroThumb=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mMicroThumb:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, ", mThumbnail=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mThumbnail:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, ", mFilePath=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mFilePath:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, ", mType="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mType:Ljava/lang/Integer;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", mTitle=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mTitle:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, ", mMimeType=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mMimeType:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v1, ", mLocalFlag="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mLocalFlag:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", mIsSyncing="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mIsSyncing:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", mSecretKey="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mSecretKey:[B

    invoke-static {v1}, Ljava/util/Arrays;->toString([B)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", mMixedTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mMixedTime:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", mAliasCreateDate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAliasCreateDate:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mDateModified="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mDateModified:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", mAilasSortTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAliasSortTime:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", mAlbumServerId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mAlbumServerId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", mSpecialTypeFlags="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaItem;->mSpecialTypeFlags:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
