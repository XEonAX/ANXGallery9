.class public Lcom/miui/gallery/provider/GalleryProvider;
.super Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;
.source "GalleryProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;
    }
.end annotation


# instance fields
.field private mContentResolver:Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;

.field private mInitializeListener:Lcom/miui/gallery/provider/cache/MediaManager$InitializeListener;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "album"

    const/16 v3, 0x48

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "media"

    const/16 v3, 0x33

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "media/#"

    const/16 v3, 0x34

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "album_media"

    const/16 v3, 0x49

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "share_album_media/#"

    const/16 v3, 0x71

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "persons"

    const/16 v3, 0x5a

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "ignore_persons"

    const/16 v3, 0x61

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "person"

    const/16 v3, 0x5b

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "gallery_cloud"

    const/16 v3, 0x46

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "gallery_cloud/#"

    const/16 v3, 0x47

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "cloud_owner_sububi/#"

    const/16 v3, 0x4a

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "share_image"

    const/16 v3, 0x6e

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "share_image/#"

    const/16 v3, 0x6f

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "share_image_sububi/#"

    const/16 v3, 0x73

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "person_recommend"

    const/16 v3, 0x5e

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "peopleFace"

    const/16 v3, 0x5c

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "cloud_and_share"

    const/16 v3, 0x32

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "owner_and_other_album"

    const/16 v3, 0x70

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "other_share_album"

    const/16 v3, 0x72

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "cloud_write_bulk_notify"

    const/16 v3, 0x4b

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "person_item"

    const/16 v3, 0x5d

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "share_user"

    const/16 v3, 0x82

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "share_user/#"

    const/16 v3, 0x83

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "cloud_user"

    const/16 v3, 0x84

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "cloud_user/#"

    const/16 v3, 0x85

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "people_face_cover"

    const/16 v3, 0x5f

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "discovery_message"

    const/16 v3, 0x96

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "discovery_message/#"

    const/16 v3, 0x97

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "recent_discovered_media"

    const/16 v3, 0x98

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "recent_discovered_cover"

    const/16 v3, 0x99

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "cloudControl"

    const/16 v3, 0xaa

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "cloudControl/#"

    const/16 v3, 0xab

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "people_cover"

    const/16 v3, 0x60

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "image_face"

    const/16 v3, 0x62

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "people_tag"

    const/16 v3, 0x63

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "favorites"

    const/16 v3, 0xb4

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "extended_cloud"

    const/16 v3, 0x4c

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "pick_cloud_and_share"

    const/16 v3, 0x57

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "persons_item"

    const/16 v3, 0x64

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "month_media"

    const/16 v3, 0x35

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.miui.gallery.cloud.provider"

    const-string v2, "people_snapshot"

    const/16 v3, 0x65

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;-><init>()V

    new-instance v0, Lcom/miui/gallery/provider/GalleryProvider$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/provider/GalleryProvider$1;-><init>(Lcom/miui/gallery/provider/GalleryProvider;)V

    iput-object v0, p0, Lcom/miui/gallery/provider/GalleryProvider;->mInitializeListener:Lcom/miui/gallery/provider/cache/MediaManager$InitializeListener;

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/provider/GalleryProvider;Landroid/net/Uri;Landroid/database/ContentObserver;J)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/miui/gallery/provider/GalleryProvider;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;J)V

    return-void
.end method

.method static synthetic access$200()Landroid/content/UriMatcher;
    .locals 1

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    return-object v0
.end method

.method static synthetic access$300()Landroid/content/UriMatcher;
    .locals 1

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    return-object v0
.end method

.method private buildNonProcessingSelection(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    invoke-static {}, Lcom/miui/gallery/provider/ProcessingMediaManager;->queryProcessingMediaPaths()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_2

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "localFile NOT IN ("

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x0

    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/CharSequence;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v1, v3}, Landroid/database/DatabaseUtils;->appendEscapedSQLString(Ljava/lang/StringBuilder;Ljava/lang/String;)V

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-eq v2, v3, :cond_0

    const-string v3, ", "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const-string v0, ")"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/database/DatabaseUtils;->concatenateWhere(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_2
    return-object p1
.end method

.method private doInsertWithNoNotify(Landroid/net/Uri;ILandroid/content/ContentValues;)J
    .locals 7

    sget-object p1, Lcom/miui/gallery/provider/GalleryProvider;->sDBHelper:Lcom/miui/gallery/provider/GalleryDBHelper;

    invoke-virtual {p1}, Lcom/miui/gallery/provider/GalleryDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    const/16 v0, 0x46

    const/4 v1, 0x1

    const-wide/16 v2, -0x1

    const/4 v4, 0x0

    if-eq p2, v0, :cond_3

    const/16 v0, 0x4b

    if-eq p2, v0, :cond_3

    const/16 v0, 0x5c

    if-eq p2, v0, :cond_2

    const/16 v0, 0x6e

    if-eq p2, v0, :cond_1

    const/16 v0, 0x98

    if-eq p2, v0, :cond_0

    return-wide v2

    :cond_0
    const-string p2, "recentDiscoveredMedia"

    const/4 v0, 0x5

    invoke-virtual {p1, p2, v4, p3, v0}, Landroid/database/sqlite/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J

    move-result-wide p1

    return-wide p1

    :cond_1
    const-string p2, "shareImage"

    invoke-virtual {p0, p3, v1}, Lcom/miui/gallery/provider/GalleryProvider;->appendValuesForCloud(Landroid/content/ContentValues;Z)Landroid/content/ContentValues;

    move-result-object p3

    invoke-virtual {p1, p2, v4, p3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide p1

    return-wide p1

    :cond_2
    const-string p2, "peopleFace"

    invoke-virtual {p0, p3, v1}, Lcom/miui/gallery/provider/GalleryProvider;->appendValuesForCloud(Landroid/content/ContentValues;Z)Landroid/content/ContentValues;

    move-result-object p3

    invoke-virtual {p1, p2, v4, p3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide p1

    return-wide p1

    :cond_3
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransactionNonExclusive()V

    :try_start_0
    const-string p2, "cloud"

    invoke-virtual {p0, p1, p2, p3}, Lcom/miui/gallery/provider/GalleryProvider;->onPreInsert(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v5

    cmp-long p2, v5, v2

    if-nez p2, :cond_5

    const-string p2, "cloud"

    invoke-virtual {p0, p3, v1}, Lcom/miui/gallery/provider/GalleryProvider;->appendValuesForCloud(Landroid/content/ContentValues;Z)Landroid/content/ContentValues;

    move-result-object v0

    invoke-virtual {p1, p2, v4, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v5

    cmp-long p2, v5, v2

    if-eqz p2, :cond_5

    iget-object p2, p0, Lcom/miui/gallery/provider/GalleryProvider;->mMediaManager:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-virtual {p2, v5, v6, p3}, Lcom/miui/gallery/provider/cache/MediaManager;->insert(JLandroid/content/ContentValues;)J

    const-string p2, "serverType"

    invoke-virtual {p3, p2}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_5

    const-string p2, "serverType"

    invoke-virtual {p3, p2}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p2

    const/4 v0, 0x0

    invoke-static {p2, v0}, Lcom/miui/gallery/util/Numbers;->equals(Ljava/lang/Number;I)Z

    move-result p2

    if-eqz p2, :cond_5

    const-string p2, "attributes"

    invoke-virtual {p3, p2}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object p2

    iget-object p3, p0, Lcom/miui/gallery/provider/GalleryProvider;->mMediaManager:Lcom/miui/gallery/provider/cache/MediaManager;

    if-nez p2, :cond_4

    const-wide/16 v0, 0x0

    goto :goto_0

    :cond_4
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    :goto_0
    invoke-virtual {p3, v5, v6, v0, v1}, Lcom/miui/gallery/provider/cache/MediaManager;->insertAttributes(JJ)V

    :cond_5
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    return-wide v5

    :catchall_0
    move-exception p2

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw p2
.end method

.method private getSha1ListFromFavorites(Ljava/lang/String;[Ljava/lang/String;Z)Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p3, :cond_1

    :try_start_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-eqz p3, :cond_0

    const-string p1, "isFavorite NOT NULL AND isFavorite> 0"

    goto :goto_0

    :cond_0
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " AND (isFavorite NOT NULL AND isFavorite> 0)"

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_2

    :cond_1
    :goto_0
    move-object v4, p1

    sget-object v1, Lcom/miui/gallery/provider/GalleryProvider;->sDBHelper:Lcom/miui/gallery/provider/GalleryDBHelper;

    const-string v2, "favorites"

    const-string p1, "sha1"

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object v3

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v5, p2

    invoke-virtual/range {v1 .. v9}, Lcom/miui/gallery/provider/GalleryDBHelper;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p1, :cond_4

    :try_start_1
    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result p2

    if-lez p2, :cond_4

    new-instance p2, Ljava/util/ArrayList;

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result p3

    invoke-direct {p2, p3}, Ljava/util/ArrayList;-><init>(I)V

    :cond_2
    :goto_1
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result p3

    if-eqz p3, :cond_3

    const/4 p3, 0x0

    invoke-interface {p1, p3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-interface {p2, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    :cond_3
    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return-object p2

    :catchall_1
    move-exception p2

    move-object v0, p1

    move-object p1, p2

    goto :goto_2

    :cond_4
    :try_start_2
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return-object p2

    :goto_2
    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    throw p1
.end method

.method private isBlockedByMediaManager(I)Z
    .locals 0

    packed-switch p1, :pswitch_data_0

    const/4 p1, 0x1

    return p1

    :pswitch_0
    const/4 p1, 0x0

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0xaa
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private static isCloudUri(I)Z
    .locals 2

    const/16 v0, 0x46

    const/16 v1, 0x4c

    invoke-static {p0, v0, v1}, Lcom/miui/gallery/provider/GalleryProvider;->isSpecificUri(III)Z

    move-result p0

    return p0
.end method

.method private static isFaceUri(I)Z
    .locals 2

    const/16 v0, 0x5a

    const/16 v1, 0x65

    invoke-static {p0, v0, v1}, Lcom/miui/gallery/provider/GalleryProvider;->isSpecificUri(III)Z

    move-result p0

    return p0
.end method

.method private static isFavoriteUri(I)Z
    .locals 1

    const/16 v0, 0xb4

    invoke-static {p0, v0, v0}, Lcom/miui/gallery/provider/GalleryProvider;->isSpecificUri(III)Z

    move-result p0

    return p0
.end method

.method private static isMediaUri(I)Z
    .locals 2

    const/16 v0, 0x32

    const/16 v1, 0x35

    invoke-static {p0, v0, v1}, Lcom/miui/gallery/provider/GalleryProvider;->isSpecificUri(III)Z

    move-result p0

    return p0
.end method

.method private static isShareUri(I)Z
    .locals 2

    const/16 v0, 0x6e

    const/16 v1, 0x73

    invoke-static {p0, v0, v1}, Lcom/miui/gallery/provider/GalleryProvider;->isSpecificUri(III)Z

    move-result p0

    return p0
.end method

.method private static isSpecificUri(III)Z
    .locals 0

    if-lt p0, p1, :cond_0

    if-gt p0, p2, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static isUserUri(I)Z
    .locals 2

    const/16 v0, 0x82

    const/16 v1, 0x85

    invoke-static {p0, v0, v1}, Lcom/miui/gallery/provider/GalleryProvider;->isSpecificUri(III)Z

    move-result p0

    return p0
.end method

.method private needDelayNotify(Landroid/net/Uri;)Z
    .locals 2

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v0, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v0

    const/16 v1, 0x4b

    if-eq v0, v1, :cond_0

    const-string v0, "delay_notify"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x1

    return p1
.end method

.method private needNotifyUpdate(Landroid/net/Uri;ILandroid/content/ContentValues;)Z
    .locals 3

    const/4 v0, 0x1

    const/16 v1, 0x47

    if-ne p2, v1, :cond_0

    return v0

    :cond_0
    const/16 v1, 0x5c

    if-ne p2, v1, :cond_1

    return v0

    :cond_1
    const/16 v1, 0x4b

    const/4 v2, 0x0

    if-eq p2, v1, :cond_4

    const/16 v1, 0x46

    if-ne p2, v1, :cond_2

    goto :goto_0

    :cond_2
    const/16 v1, 0xb4

    if-ne p2, v1, :cond_3

    const-string p2, "sha1"

    invoke-virtual {p3, p2}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_3

    return v0

    :cond_3
    const-string p2, "requireNotifyUri"

    invoke-virtual {p1, p2, v2}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    move-result p1

    return p1

    :cond_4
    :goto_0
    const-string p1, "sha1"

    invoke-virtual {p3, p1}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_6

    const-string p1, "title"

    invoke-virtual {p3, p1}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_6

    const-string p1, "specialTypeFlags"

    invoke-virtual {p3, p1}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_1

    :cond_5
    const/4 v0, 0x0

    :cond_6
    :goto_1
    return v0
.end method

.method private notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;J)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/provider/GalleryProvider;->needDelayNotify(Landroid/net/Uri;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/provider/GalleryProvider;->mContentResolver:Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;->notifyChangeDelay(Landroid/net/Uri;Landroid/database/ContentObserver;J)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/provider/GalleryProvider;->mContentResolver:Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;J)V

    :goto_0
    return-void
.end method

.method private parseSelection(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    check-cast p3, [Ljava/lang/Object;

    invoke-static {p2, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_0

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, " AND ("

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const-string p1, ""

    :goto_0
    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private static parseSyncReason(Landroid/net/Uri;Landroid/content/ContentValues;)J
    .locals 0

    invoke-static {p0, p1}, Lcom/miui/gallery/provider/GalleryProvider;->shouldRequestSync(Landroid/net/Uri;Landroid/content/ContentValues;)Z

    move-result p1

    if-eqz p1, :cond_4

    sget-object p1, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {p1, p0}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result p0

    invoke-static {p0}, Lcom/miui/gallery/provider/GalleryProvider;->isMediaUri(I)Z

    move-result p1

    if-nez p1, :cond_3

    invoke-static {p0}, Lcom/miui/gallery/provider/GalleryProvider;->isCloudUri(I)Z

    move-result p1

    if-nez p1, :cond_3

    invoke-static {p0}, Lcom/miui/gallery/provider/GalleryProvider;->isFavoriteUri(I)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p0}, Lcom/miui/gallery/provider/GalleryProvider;->isFaceUri(I)Z

    move-result p1

    if-eqz p1, :cond_1

    const-wide/16 p0, 0x88

    return-wide p0

    :cond_1
    invoke-static {p0}, Lcom/miui/gallery/provider/GalleryProvider;->isShareUri(I)Z

    move-result p1

    if-nez p1, :cond_2

    invoke-static {p0}, Lcom/miui/gallery/provider/GalleryProvider;->isUserUri(I)Z

    move-result p0

    if-eqz p0, :cond_4

    :cond_2
    const-wide/16 p0, 0x210

    return-wide p0

    :cond_3
    :goto_0
    const-wide/16 p0, 0x21

    return-wide p0

    :cond_4
    const-wide/16 p0, 0x0

    return-wide p0
.end method

.method private registerNotifyUri(Landroid/database/Cursor;I)V
    .locals 1

    sparse-switch p2, :sswitch_data_0

    goto/16 :goto_0

    :sswitch_0
    invoke-virtual {p0}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Favorites;->URI:Landroid/net/Uri;

    invoke-interface {p1, p2, v0}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    goto/16 :goto_0

    :sswitch_1
    invoke-virtual {p0}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$RecentDiscoveredMedia;->URI_COVER:Landroid/net/Uri;

    invoke-interface {p1, p2, v0}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    goto/16 :goto_0

    :sswitch_2
    invoke-virtual {p0}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$RecentDiscoveredMedia;->URI:Landroid/net/Uri;

    invoke-interface {p1, p2, v0}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    goto/16 :goto_0

    :sswitch_3
    invoke-virtual {p0}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$CloudUser;->CLOUD_USER_URI:Landroid/net/Uri;

    invoke-interface {p1, p2, v0}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    goto/16 :goto_0

    :sswitch_4
    invoke-virtual {p0}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$ShareUser;->SHARE_USER_URI:Landroid/net/Uri;

    invoke-interface {p1, p2, v0}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    goto/16 :goto_0

    :sswitch_5
    invoke-virtual {p0}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Media;->URI_OTHER_ALBUM_MEDIA:Landroid/net/Uri;

    invoke-interface {p1, p2, v0}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    goto/16 :goto_0

    :sswitch_6
    invoke-virtual {p0}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Album;->URI_SHARE_ALL:Landroid/net/Uri;

    invoke-interface {p1, p2, v0}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    goto/16 :goto_0

    :sswitch_7
    invoke-virtual {p0}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$PeopleFace;->IGNORE_PERSONS_URI:Landroid/net/Uri;

    invoke-interface {p1, p2, v0}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    goto/16 :goto_0

    :sswitch_8
    invoke-virtual {p0}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$PeopleFace;->PERSONS_URI:Landroid/net/Uri;

    invoke-interface {p1, p2, v0}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    goto/16 :goto_0

    :sswitch_9
    invoke-virtual {p0}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$PeopleFace;->PERSONS_URI:Landroid/net/Uri;

    invoke-interface {p1, p2, v0}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    goto/16 :goto_0

    :sswitch_a
    invoke-virtual {p0}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$PeopleFace;->ONE_PERSON_URI:Landroid/net/Uri;

    invoke-interface {p1, p2, v0}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    goto :goto_0

    :sswitch_b
    invoke-virtual {p0}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$PeopleFace;->PERSONS_URI:Landroid/net/Uri;

    invoke-interface {p1, p2, v0}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    goto :goto_0

    :sswitch_c
    invoke-virtual {p0}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$ExtendedCloud;->URI:Landroid/net/Uri;

    invoke-interface {p1, p2, v0}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    goto :goto_0

    :sswitch_d
    invoke-virtual {p0}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Media;->URI_OWNER_ALBUM_MEDIA:Landroid/net/Uri;

    invoke-interface {p1, p2, v0}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    goto :goto_0

    :sswitch_e
    invoke-virtual {p0}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Album;->URI:Landroid/net/Uri;

    invoke-interface {p1, p2, v0}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    goto :goto_0

    :sswitch_f
    invoke-virtual {p0}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    invoke-interface {p1, p2, v0}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    goto :goto_0

    :sswitch_10
    invoke-virtual {p0}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Media;->URI:Landroid/net/Uri;

    invoke-interface {p1, p2, v0}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    goto :goto_0

    :sswitch_11
    invoke-virtual {p0}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Media;->URI_ALL:Landroid/net/Uri;

    invoke-interface {p1, p2, v0}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    :goto_0
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        0x32 -> :sswitch_11
        0x33 -> :sswitch_10
        0x34 -> :sswitch_10
        0x35 -> :sswitch_10
        0x46 -> :sswitch_f
        0x47 -> :sswitch_f
        0x48 -> :sswitch_e
        0x49 -> :sswitch_d
        0x4c -> :sswitch_c
        0x5a -> :sswitch_b
        0x5b -> :sswitch_a
        0x5f -> :sswitch_9
        0x60 -> :sswitch_8
        0x61 -> :sswitch_7
        0x70 -> :sswitch_6
        0x71 -> :sswitch_5
        0x82 -> :sswitch_4
        0x83 -> :sswitch_4
        0x84 -> :sswitch_3
        0x85 -> :sswitch_3
        0x98 -> :sswitch_2
        0x99 -> :sswitch_1
        0xb4 -> :sswitch_0
    .end sparse-switch
.end method

.method private static shouldRequestSync(Landroid/net/Uri;Landroid/content/ContentValues;)Z
    .locals 1

    const-string p1, "URI_PARAM_REQUEST_SYNC"

    invoke-virtual {p0, p1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    const-string p1, "URI_PARAM_REQUEST_SYNC"

    invoke-virtual {p0, p1, v0}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    move-result p0

    return p0

    :cond_0
    return v0
.end method


# virtual methods
.method public applyBatch(Ljava/util/ArrayList;)[Landroid/content/ContentProviderResult;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/content/ContentProviderOperation;",
            ">;)[",
            "Landroid/content/ContentProviderResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/OperationApplicationException;
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/provider/GalleryProvider;->mMediaManager:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-virtual {v0}, Lcom/miui/gallery/provider/cache/MediaManager;->initialized()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sDBHelper:Lcom/miui/gallery/provider/GalleryDBHelper;

    invoke-virtual {v0}, Lcom/miui/gallery/provider/GalleryDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    :try_start_0
    invoke-super {p0, p1}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->applyBatch(Ljava/util/ArrayList;)[Landroid/content/ContentProviderResult;

    move-result-object p1

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    return-object p1

    :catchall_0
    move-exception p1

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw p1
.end method

.method public bulkInsert(Landroid/net/Uri;[Landroid/content/ContentValues;)I
    .locals 11

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v0, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/provider/GalleryProvider;->isBlockedByMediaManager(I)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/provider/GalleryProvider;->mMediaManager:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-virtual {v1}, Lcom/miui/gallery/provider/cache/MediaManager;->initialized()Z

    move-result v1

    if-nez v1, :cond_0

    return v2

    :cond_0
    if-eqz p2, :cond_4

    sget-object v1, Lcom/miui/gallery/provider/GalleryProvider;->sDBHelper:Lcom/miui/gallery/provider/GalleryDBHelper;

    invoke-virtual {v1}, Lcom/miui/gallery/provider/GalleryDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    const/4 v3, 0x0

    move-object v5, v3

    const/4 v4, 0x0

    :goto_0
    :try_start_0
    array-length v6, p2

    if-ge v2, v6, :cond_2

    aget-object v6, p2, v2

    invoke-direct {p0, p1, v0, v6}, Lcom/miui/gallery/provider/GalleryProvider;->doInsertWithNoNotify(Landroid/net/Uri;ILandroid/content/ContentValues;)J

    move-result-wide v6

    const-wide/16 v8, -0x1

    cmp-long v10, v6, v8

    if-eqz v10, :cond_1

    add-int/lit8 v4, v4, 0x1

    aget-object v5, p2, v2

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    if-lez v4, :cond_3

    invoke-static {p1, v5}, Lcom/miui/gallery/provider/GalleryProvider;->parseSyncReason(Landroid/net/Uri;Landroid/content/ContentValues;)J

    move-result-wide v0

    invoke-direct {p0, p1, v3, v0, v1}, Lcom/miui/gallery/provider/GalleryProvider;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;J)V

    :cond_3
    move v2, v4

    goto :goto_1

    :catchall_0
    move-exception p1

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    throw p1

    :cond_4
    :goto_1
    return v2
.end method

.method public call(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/provider/GalleryProvider;->mMediaManager:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-virtual {v0}, Lcom/miui/gallery/provider/cache/MediaManager;->initialized()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    :cond_0
    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sDBHelper:Lcom/miui/gallery/provider/GalleryDBHelper;

    invoke-virtual {v0}, Lcom/miui/gallery/provider/GalleryDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    invoke-static {p1}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->canHandle(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v4, p0, Lcom/miui/gallery/provider/GalleryProvider;->mMediaManager:Lcom/miui/gallery/provider/cache/MediaManager;

    move-object v5, p1

    move-object v6, p2

    move-object v7, p3

    invoke-static/range {v2 .. v7}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->call(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object p1

    const-wide/16 p2, 0x0

    const-string v0, "should_request_sync"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-wide/16 p2, 0x231

    :cond_1
    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    invoke-direct {p0, v0, v1, p2, p3}, Lcom/miui/gallery/provider/GalleryProvider;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;J)V

    return-object p1

    :cond_2
    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->call(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object p1

    return-object p1
.end method

.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 4

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v0, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/provider/GalleryProvider;->isBlockedByMediaManager(I)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/provider/GalleryProvider;->mMediaManager:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-virtual {v1}, Lcom/miui/gallery/provider/cache/MediaManager;->initialized()Z

    move-result v1

    if-nez v1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    sget-object v1, Lcom/miui/gallery/provider/GalleryProvider;->sDBHelper:Lcom/miui/gallery/provider/GalleryDBHelper;

    invoke-virtual {v1}, Lcom/miui/gallery/provider/GalleryDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const/4 v2, -0x1

    const/4 v3, 0x0

    sparse-switch v0, :sswitch_data_0

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p1

    return p1

    :sswitch_0
    const/4 v0, 0x1

    invoke-direct {p0, p2, p3, v0}, Lcom/miui/gallery/provider/GalleryProvider;->getSha1ListFromFavorites(Ljava/lang/String;[Ljava/lang/String;Z)Ljava/util/List;

    move-result-object v0

    const-string v2, "favorites"

    invoke-virtual {v1, v2, p2, p3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    if-lez v2, :cond_1

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_1

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/provider/GalleryProvider;->mMediaManager:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-virtual {v0, p3}, Lcom/miui/gallery/provider/cache/MediaManager;->removeFromFavorites(Ljava/lang/String;)V

    goto :goto_0

    :sswitch_1
    const-string v0, "cloudControl"

    invoke-virtual {v1, v0, p2, p3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    goto :goto_1

    :sswitch_2
    const-string v0, "recentDiscoveredMedia"

    invoke-virtual {v1, v0, p2, p3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    goto :goto_1

    :sswitch_3
    const-string v0, "discoveryMessage"

    invoke-virtual {v1, v0, p2, p3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    goto :goto_1

    :sswitch_4
    const-string v0, "cloudUser"

    invoke-virtual {v1, v0, p2, p3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    goto :goto_1

    :sswitch_5
    const-string v0, "shareUser"

    invoke-virtual {v1, v0, p2, p3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    goto :goto_1

    :sswitch_6
    const-string v0, "shareImage"

    invoke-virtual {v1, v0, p2, p3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    goto :goto_1

    :sswitch_7
    const-string v0, "peopleFace"

    invoke-virtual {v1, v0, p2, p3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    goto :goto_1

    :sswitch_8
    invoke-virtual {p0, p2, p3}, Lcom/miui/gallery/provider/GalleryProvider;->genIDSelection(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/provider/GalleryProvider;->mMediaManager:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-virtual {v2, v0, v3}, Lcom/miui/gallery/provider/cache/MediaManager;->delete(Ljava/lang/String;[Ljava/lang/String;)I

    const-string v2, "cloud"

    invoke-virtual {v1, v2, p2, p3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    if-lez v2, :cond_1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/provider/GalleryProvider;->deleteAttributes(Ljava/lang/String;)V

    :cond_1
    :goto_1
    :sswitch_9
    if-lez v2, :cond_2

    invoke-static {p1, v3}, Lcom/miui/gallery/provider/GalleryProvider;->parseSyncReason(Landroid/net/Uri;Landroid/content/ContentValues;)J

    move-result-wide p2

    invoke-direct {p0, p1, v3, p2, p3}, Lcom/miui/gallery/provider/GalleryProvider;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;J)V

    :cond_2
    return v2

    :sswitch_data_0
    .sparse-switch
        0x33 -> :sswitch_9
        0x34 -> :sswitch_9
        0x46 -> :sswitch_8
        0x4b -> :sswitch_8
        0x5c -> :sswitch_7
        0x6e -> :sswitch_6
        0x82 -> :sswitch_5
        0x84 -> :sswitch_4
        0x96 -> :sswitch_3
        0x98 -> :sswitch_2
        0xaa -> :sswitch_1
        0xb4 -> :sswitch_0
    .end sparse-switch
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 6

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v0, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/provider/GalleryProvider;->isBlockedByMediaManager(I)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/provider/GalleryProvider;->mMediaManager:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-virtual {v1}, Lcom/miui/gallery/provider/cache/MediaManager;->initialized()Z

    move-result v1

    if-nez v1, :cond_0

    return-object v2

    :cond_0
    sget-object v1, Lcom/miui/gallery/provider/GalleryProvider;->sDBHelper:Lcom/miui/gallery/provider/GalleryDBHelper;

    invoke-virtual {v1}, Lcom/miui/gallery/provider/GalleryDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const/16 v3, 0x46

    if-eq v0, v3, :cond_7

    const/16 v3, 0x4b

    if-eq v0, v3, :cond_7

    const/16 v3, 0x5c

    if-eq v0, v3, :cond_7

    const/16 v3, 0x6e

    if-eq v0, v3, :cond_7

    const/16 v3, 0x82

    if-eq v0, v3, :cond_6

    const/16 v3, 0x84

    if-eq v0, v3, :cond_5

    const/16 v3, 0x96

    if-eq v0, v3, :cond_4

    const/16 v3, 0x98

    const/4 v4, 0x5

    if-eq v0, v3, :cond_3

    const/16 v3, 0xaa

    if-eq v0, v3, :cond_2

    const/16 v3, 0xb4

    if-eq v0, v3, :cond_1

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object p1

    return-object p1

    :cond_1
    const-string v0, "favorites"

    invoke-virtual {v1, v0, v2, p2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0

    const-wide/16 v3, 0x0

    cmp-long v5, v0, v3

    if-lez v5, :cond_8

    const-string v3, "sha1"

    invoke-virtual {p2, v3}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_8

    const-string v3, "isFavorite"

    invoke-virtual {p2, v3}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_8

    const-string v3, "sha1"

    invoke-virtual {p2, v3}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "isFavorite"

    invoke-virtual {p2, v4}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-lez v4, :cond_8

    iget-object v4, p0, Lcom/miui/gallery/provider/GalleryProvider;->mMediaManager:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-virtual {v4, v3}, Lcom/miui/gallery/provider/cache/MediaManager;->insertToFavorites(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    const-string v0, "cloudControl"

    invoke-virtual {v1, v0, v2, p2, v4}, Landroid/database/sqlite/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J

    move-result-wide v0

    goto :goto_0

    :cond_3
    const-string v0, "recentDiscoveredMedia"

    invoke-virtual {v1, v0, v2, p2, v4}, Landroid/database/sqlite/SQLiteDatabase;->insertWithOnConflict(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;I)J

    move-result-wide v0

    goto :goto_0

    :cond_4
    const-string v0, "discoveryMessage"

    invoke-virtual {v1, v0, v2, p2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0

    goto :goto_0

    :cond_5
    const-string v0, "cloudUser"

    invoke-virtual {v1, v0, v2, p2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0

    goto :goto_0

    :cond_6
    const-string v0, "shareUser"

    invoke-virtual {v1, v0, v2, p2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0

    goto :goto_0

    :cond_7
    invoke-direct {p0, p1, v0, p2}, Lcom/miui/gallery/provider/GalleryProvider;->doInsertWithNoNotify(Landroid/net/Uri;ILandroid/content/ContentValues;)J

    move-result-wide v0

    :cond_8
    :goto_0
    const-wide/16 v3, -0x1

    cmp-long v5, v0, v3

    if-eqz v5, :cond_9

    invoke-static {p1, p2}, Lcom/miui/gallery/provider/GalleryProvider;->parseSyncReason(Landroid/net/Uri;Landroid/content/ContentValues;)J

    move-result-wide v3

    invoke-direct {p0, p1, v2, v3, v4}, Lcom/miui/gallery/provider/GalleryProvider;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;J)V

    :cond_9
    invoke-static {p1, v0, v1}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object p1

    return-object p1
.end method

.method public onCreate()Z
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->onCreate()Z

    new-instance v0, Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;-><init>(Lcom/miui/gallery/provider/GalleryProvider;Lcom/miui/gallery/provider/GalleryProvider$1;)V

    iput-object v0, p0, Lcom/miui/gallery/provider/GalleryProvider;->mContentResolver:Lcom/miui/gallery/provider/GalleryProvider$ContentResolver;

    invoke-static {}, Lcom/miui/gallery/provider/cache/MediaManager;->getInstance()Lcom/miui/gallery/provider/cache/MediaManager;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/provider/GalleryProvider;->mMediaManager:Lcom/miui/gallery/provider/cache/MediaManager;

    iget-object v0, p0, Lcom/miui/gallery/provider/GalleryProvider;->mMediaManager:Lcom/miui/gallery/provider/cache/MediaManager;

    iget-object v1, p0, Lcom/miui/gallery/provider/GalleryProvider;->mInitializeListener:Lcom/miui/gallery/provider/cache/MediaManager$InitializeListener;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/provider/cache/MediaManager;->addInitializeListener(Lcom/miui/gallery/provider/cache/MediaManager$InitializeListener;)V

    iget-object v0, p0, Lcom/miui/gallery/provider/GalleryProvider;->mMediaManager:Lcom/miui/gallery/provider/cache/MediaManager;

    sget-object v1, Lcom/miui/gallery/provider/GalleryProvider;->sDBHelper:Lcom/miui/gallery/provider/GalleryDBHelper;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/provider/cache/MediaManager;->load(Landroid/database/sqlite/SQLiteOpenHelper;)V

    const/4 v0, 0x1

    return v0
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 27

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    move-object/from16 v9, p2

    move-object/from16 v6, p3

    move-object/from16 v10, p4

    move-object/from16 v11, p5

    sget-object v2, Lcom/miui/gallery/provider/GalleryProvider;->sDBHelper:Lcom/miui/gallery/provider/GalleryDBHelper;

    invoke-virtual {v2}, Lcom/miui/gallery/provider/GalleryDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v12

    sget-object v2, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v2, v0}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v14

    const/4 v13, 0x1

    const/4 v2, 0x0

    const/4 v15, 0x0

    packed-switch v14, :pswitch_data_0

    packed-switch v14, :pswitch_data_1

    packed-switch v14, :pswitch_data_2

    packed-switch v14, :pswitch_data_3

    packed-switch v14, :pswitch_data_4

    packed-switch v14, :pswitch_data_5

    sparse-switch v14, :sswitch_data_0

    invoke-super/range {p0 .. p5}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    :goto_0
    move/from16 v26, v14

    goto/16 :goto_7

    :sswitch_0
    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getDistinct(Landroid/net/Uri;)Z

    move-result v3

    const-string v4, "favorites"

    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getGroupBy(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v8

    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getHaving(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v13

    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getLimit(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    move-object v2, v12

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    move-object/from16 v7, p4

    move-object v9, v13

    move-object/from16 v10, p5

    move-object v11, v0

    invoke-virtual/range {v2 .. v11}, Landroid/database/sqlite/SQLiteDatabase;->query(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    goto :goto_0

    :sswitch_1
    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getDistinct(Landroid/net/Uri;)Z

    move-result v3

    const-string v4, "cloudUser"

    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getGroupBy(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v8

    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getHaving(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v13

    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getLimit(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    move-object v2, v12

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    move-object/from16 v7, p4

    move-object v9, v13

    move-object/from16 v10, p5

    move-object v11, v0

    invoke-virtual/range {v2 .. v11}, Landroid/database/sqlite/SQLiteDatabase;->query(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    goto :goto_0

    :sswitch_2
    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getDistinct(Landroid/net/Uri;)Z

    move-result v3

    const-string v4, "shareUser"

    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getGroupBy(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v8

    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getHaving(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v13

    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getLimit(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    move-object v2, v12

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    move-object/from16 v7, p4

    move-object v9, v13

    move-object/from16 v10, p5

    move-object v11, v0

    invoke-virtual/range {v2 .. v11}, Landroid/database/sqlite/SQLiteDatabase;->query(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    goto :goto_0

    :sswitch_3
    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getGroupBy(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v9, v6, v10, v0, v11}, Lcom/miui/gallery/picker/helper/PickerSqlHelper;->buildPickerResultQuery([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lcom/miui/gallery/provider/GalleryProvider;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    goto :goto_0

    :sswitch_4
    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getDistinct(Landroid/net/Uri;)Z

    move-result v3

    const-string v4, "extended_cloud"

    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getGroupBy(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v8

    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getHaving(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v13

    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getLimit(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    move-object v2, v12

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    move-object/from16 v7, p4

    move-object v9, v13

    move-object/from16 v10, p5

    move-object v11, v0

    invoke-virtual/range {v2 .. v11}, Landroid/database/sqlite/SQLiteDatabase;->query(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    goto/16 :goto_0

    :pswitch_0
    invoke-static/range {p1 .. p1}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    const-string v3, "cloudControl"

    const-string v2, "_id = %s"

    new-array v4, v13, [Ljava/lang/String;

    aput-object v0, v4, v15

    invoke-direct {v1, v6, v2, v4}, Lcom/miui/gallery/provider/GalleryProvider;->parseSelection(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v2, v12

    move-object/from16 v4, p2

    move-object/from16 v6, p4

    move-object/from16 v9, p5

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    goto/16 :goto_0

    :pswitch_1
    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getDistinct(Landroid/net/Uri;)Z

    move-result v3

    const-string v4, "cloudControl"

    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getGroupBy(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v8

    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getHaving(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v13

    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getLimit(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    move-object v2, v12

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    move-object/from16 v7, p4

    move-object v9, v13

    move-object/from16 v10, p5

    move-object v11, v0

    invoke-virtual/range {v2 .. v11}, Landroid/database/sqlite/SQLiteDatabase;->query(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    goto/16 :goto_0

    :pswitch_2
    const-string v2, "remove_duplicate_items"

    invoke-virtual {v0, v2, v15}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    move-result v2

    :try_start_0
    const-string v3, "album_cover_count"

    invoke-virtual {v0, v3}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move v13, v0

    goto :goto_1

    :catch_0
    move-exception v0

    const-string v3, "GalleryProvider"

    invoke-virtual {v0}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    invoke-static {v12, v13, v2}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->queryAlbumCover(Landroid/database/sqlite/SQLiteDatabase;IZ)Landroid/database/Cursor;

    move-result-object v2

    goto/16 :goto_0

    :pswitch_3
    const-string v2, "remove_duplicate_items"

    invoke-virtual {v0, v2, v15}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    move-result v8

    const-string v2, "generate_headers"

    invoke-virtual {v0, v2, v15}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    move-result v13

    const-string v2, "remove_processing_items"

    invoke-virtual {v0, v2, v15}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-direct {v1, v6}, Lcom/miui/gallery/provider/GalleryProvider;->buildNonProcessingSelection(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    move-object v4, v2

    goto :goto_2

    :cond_0
    move-object v4, v6

    :goto_2
    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getGroupBy(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v6

    move-object v2, v12

    move-object/from16 v3, p2

    move-object/from16 v5, p4

    move-object/from16 v7, p5

    move v9, v13

    invoke-static/range {v2 .. v9}, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)Landroid/database/Cursor;

    move-result-object v2

    goto/16 :goto_0

    :pswitch_4
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v0

    const-string v3, "discoveryMessage"

    const-string v2, "_id = %s"

    new-array v4, v13, [Ljava/lang/String;

    aput-object v0, v4, v15

    invoke-direct {v1, v6, v2, v4}, Lcom/miui/gallery/provider/GalleryProvider;->parseSelection(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v2, v12

    move-object/from16 v4, p2

    move-object/from16 v6, p4

    move-object/from16 v9, p5

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    goto/16 :goto_0

    :pswitch_5
    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getDistinct(Landroid/net/Uri;)Z

    move-result v3

    const-string v4, "discoveryMessage"

    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getGroupBy(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v8

    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getHaving(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v13

    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getLimit(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    move-object v2, v12

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    move-object/from16 v7, p4

    move-object v9, v13

    move-object/from16 v10, p5

    move-object v11, v0

    invoke-virtual/range {v2 .. v11}, Landroid/database/sqlite/SQLiteDatabase;->query(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    goto/16 :goto_0

    :pswitch_6
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    goto/16 :goto_0

    :pswitch_7
    const-string v3, "shareAlbum"

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v2, v12

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v9, p5

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    goto/16 :goto_0

    :pswitch_8
    invoke-static/range {p1 .. p1}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/miui/gallery/provider/ShareAlbumManager;->getOriginalAlbumId(J)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    const-string v4, "remove_duplicate_items"

    invoke-virtual {v0, v4, v15}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    move-result v0

    const-string v4, "localGroupId = %s"

    new-array v5, v13, [Ljava/lang/String;

    aput-object v3, v5, v15

    invoke-direct {v1, v6, v4, v5}, Lcom/miui/gallery/provider/GalleryProvider;->parseSelection(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v0, :cond_1

    const-string v0, "sha1"

    move-object v6, v0

    goto :goto_3

    :cond_1
    move-object v6, v2

    :goto_3
    move-object v2, v12

    move-object/from16 v3, p2

    move-object/from16 v5, p4

    move-object/from16 v7, p5

    invoke-static/range {v2 .. v7}, Lcom/miui/gallery/provider/ShareMediaManager;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    goto/16 :goto_0

    :pswitch_9
    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/provider/GalleryProvider;->getContext()Landroid/content/Context;

    move-result-object v2

    move-object v3, v12

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    invoke-static/range {v2 .. v7}, Lcom/miui/gallery/provider/ShareAlbumManager;->query(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    goto/16 :goto_0

    :pswitch_a
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v0

    const-string v3, "shareImage"

    const-string v2, "_id = %s"

    new-array v4, v13, [Ljava/lang/String;

    aput-object v0, v4, v15

    invoke-direct {v1, v6, v2, v4}, Lcom/miui/gallery/provider/GalleryProvider;->parseSelection(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v2, v12

    move-object/from16 v4, p2

    move-object/from16 v6, p4

    move-object/from16 v9, p5

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    goto/16 :goto_0

    :pswitch_b
    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getDistinct(Landroid/net/Uri;)Z

    move-result v3

    const-string v4, "shareImage"

    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getGroupBy(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v8

    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getHaving(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v13

    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getLimit(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    move-object v2, v12

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    move-object/from16 v7, p4

    move-object v9, v13

    move-object/from16 v10, p5

    move-object v11, v0

    invoke-virtual/range {v2 .. v11}, Landroid/database/sqlite/SQLiteDatabase;->query(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    goto/16 :goto_0

    :pswitch_c
    invoke-static {}, Lcom/miui/gallery/dao/GalleryLiteEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryLiteEntityManager;

    move-result-object v2

    const-class v3, Lcom/miui/gallery/util/face/PeopleItem;

    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getGroupBy(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v7

    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getHaving(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v8

    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getLimit(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v9, p5

    move-object v10, v0

    invoke-virtual/range {v2 .. v10}, Lcom/miui/gallery/dao/GalleryLiteEntityManager;->rawQuery(Ljava/lang/Class;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    goto/16 :goto_0

    :pswitch_d
    aget-object v0, v10, v15

    aget-object v3, v10, v13

    invoke-static {v9, v6, v11, v0, v3}, Lcom/miui/gallery/provider/FaceManager;->buildPersonsItemQuery([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lcom/miui/gallery/provider/GalleryProvider;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    goto/16 :goto_0

    :pswitch_e
    invoke-static {}, Lcom/miui/gallery/provider/FaceManager;->buildPeopleTagQuery()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lcom/miui/gallery/provider/GalleryProvider;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    goto/16 :goto_0

    :pswitch_f
    const-string v3, "serverId"

    invoke-virtual {v0, v3}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "image_server_id"

    invoke-virtual {v0, v4}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v9, v3, v0}, Lcom/miui/gallery/provider/FaceManager;->buildImageFaceQuery([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lcom/miui/gallery/provider/GalleryProvider;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    goto/16 :goto_0

    :pswitch_10
    invoke-static {}, Lcom/miui/gallery/provider/FaceManager;->buildIgnorePersonsQuery()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lcom/miui/gallery/provider/GalleryProvider;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    goto/16 :goto_0

    :pswitch_11
    const-string v3, "serverId"

    invoke-virtual {v0, v3}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "_id"

    invoke-virtual {v0, v4}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v9, v3, v0}, Lcom/miui/gallery/provider/FaceManager;->buildPeopleCoverQuery([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lcom/miui/gallery/provider/GalleryProvider;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    goto/16 :goto_0

    :pswitch_12
    invoke-static {v12}, Lcom/miui/gallery/provider/AlbumManager;->queryFaceAlbumCover(Landroid/database/sqlite/SQLiteDatabase;)Landroid/database/Cursor;

    move-result-object v2

    goto/16 :goto_0

    :pswitch_13
    aget-object v0, v10, v15

    invoke-static {v9, v11, v0}, Lcom/miui/gallery/provider/FaceManager;->buildRecommendFacesOfOnePersonQuery([Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lcom/miui/gallery/provider/GalleryProvider;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    goto/16 :goto_0

    :pswitch_14
    aget-object v0, v10, v15

    invoke-static {v9, v0}, Lcom/miui/gallery/provider/FaceManager;->buildOnePersonItemQuery([Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lcom/miui/gallery/provider/GalleryProvider;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    goto/16 :goto_0

    :pswitch_15
    const-string v3, "peopleFace"

    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getGroupBy(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v7

    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getHaving(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v8

    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getLimit(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    move-object v2, v12

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v9, p5

    move-object v10, v0

    invoke-virtual/range {v2 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    goto/16 :goto_0

    :pswitch_16
    const-string v2, "generate_headers"

    invoke-virtual {v0, v2, v15}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    move-result v8

    aget-object v0, v10, v15

    aget-object v7, v10, v13

    move-object v2, v12

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p5

    move-object v6, v0

    invoke-static/range {v2 .. v8}, Lcom/miui/gallery/provider/FaceManager;->queryOnePersonAlbum(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Landroid/database/Cursor;

    move-result-object v2

    goto/16 :goto_0

    :pswitch_17
    invoke-static {}, Lcom/miui/gallery/provider/FaceManager;->buildPersonsQuery()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v2}, Lcom/miui/gallery/provider/GalleryProvider;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    goto/16 :goto_0

    :pswitch_18
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    goto/16 :goto_0

    :pswitch_19
    const-string v3, "remove_duplicate_items"

    invoke-virtual {v0, v3, v15}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    move-result v3

    const-string v4, "generate_headers"

    invoke-virtual {v0, v4, v15}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    move-result v4

    const-string v5, "remove_processing_items"

    invoke-virtual {v0, v5, v15}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    move-result v0

    new-instance v8, Landroid/os/Bundle;

    invoke-direct {v8}, Landroid/os/Bundle;-><init>()V

    const-string v5, "extra_generate_header"

    invoke-virtual {v8, v5, v4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    if-eqz v0, :cond_2

    invoke-direct {v1, v6}, Lcom/miui/gallery/provider/GalleryProvider;->buildNonProcessingSelection(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    move-object v4, v0

    goto :goto_4

    :cond_2
    move-object v4, v6

    :goto_4
    iget-object v0, v1, Lcom/miui/gallery/provider/GalleryProvider;->mMediaManager:Lcom/miui/gallery/provider/cache/MediaManager;

    if-eqz v3, :cond_3

    const-string v2, "sha1"

    :cond_3
    move-object v7, v2

    move-object v2, v0

    move-object/from16 v3, p2

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    invoke-virtual/range {v2 .. v8}, Lcom/miui/gallery/provider/cache/MediaManager;->query([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/database/Cursor;

    move-result-object v2

    goto/16 :goto_0

    :pswitch_1a
    const-string v3, "join_video"

    invoke-virtual {v0, v3, v15}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    move-result v7

    const-string v3, "join_face"

    invoke-virtual {v0, v3, v15}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    move-result v8

    const-string v3, "join_share"

    invoke-virtual {v0, v3, v15}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    move-result v16

    const-string v3, "join_pano"

    invoke-virtual {v0, v3, v15}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    move-result v17

    const-string v3, "join_recent"

    invoke-virtual {v0, v3, v15}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    move-result v18

    const-string v3, "join_favorites"

    invoke-virtual {v0, v3, v15}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    move-result v20

    const-string v3, "exclude_empty_album"

    invoke-virtual {v0, v3, v15}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    move-result v21

    const-string v3, "all_except_deleted"

    invoke-virtual {v0, v3, v15}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    move-result v22

    const-string v3, "fill_covers"

    invoke-virtual {v0, v3, v13}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    move-result v23

    const-string v3, "stub_for_virtual_albums"

    invoke-virtual {v0, v3, v15}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    move-result v24

    const-string v3, "media_type"

    invoke-virtual {v0, v3}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_4

    :goto_5
    move-object/from16 v25, v2

    goto :goto_6

    :cond_4
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    goto :goto_5

    :goto_6
    const-string v2, "remove_duplicate_items"

    invoke-virtual {v0, v2, v15}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    move-result v15

    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getLimit(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v19

    move-object v2, v12

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move/from16 v9, v16

    move/from16 v10, v17

    move/from16 v11, v18

    move/from16 v12, v20

    move/from16 v13, v21

    move/from16 v26, v14

    move/from16 v14, v22

    move-object/from16 v16, v25

    move/from16 v17, v23

    move/from16 v18, v24

    invoke-static/range {v2 .. v19}, Lcom/miui/gallery/provider/AlbumManager;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;ZZZZZZZZZLjava/lang/Integer;ZZLjava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    goto :goto_7

    :pswitch_1b
    move/from16 v26, v14

    invoke-static/range {p1 .. p1}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    const-string v3, "cloud"

    const-string v2, "_id = %s"

    new-array v4, v13, [Ljava/lang/String;

    aput-object v0, v4, v15

    invoke-direct {v1, v6, v2, v4}, Lcom/miui/gallery/provider/GalleryProvider;->parseSelection(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v2, v12

    move-object/from16 v4, p2

    move-object/from16 v6, p4

    move-object/from16 v9, p5

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    goto :goto_7

    :pswitch_1c
    move/from16 v26, v14

    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getDistinct(Landroid/net/Uri;)Z

    move-result v3

    const-string v4, "cloud"

    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getGroupBy(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v8

    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getHaving(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v13

    invoke-static/range {p1 .. p1}, Lcom/miui/gallery/util/UriUtil;->getLimit(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    move-object v2, v12

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    move-object/from16 v7, p4

    move-object v9, v13

    move-object/from16 v10, p5

    move-object v11, v0

    invoke-virtual/range {v2 .. v11}, Landroid/database/sqlite/SQLiteDatabase;->query(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    :goto_7
    if-eqz v2, :cond_5

    move/from16 v14, v26

    invoke-direct {v1, v2, v14}, Lcom/miui/gallery/provider/GalleryProvider;->registerNotifyUri(Landroid/database/Cursor;I)V

    :cond_5
    return-object v2

    :pswitch_1d
    :sswitch_5
    const-string v3, "require_full_load"

    invoke-virtual {v0, v3, v15}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_6

    iget-object v3, v1, Lcom/miui/gallery/provider/GalleryProvider;->mMediaManager:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-virtual {v3}, Lcom/miui/gallery/provider/cache/MediaManager;->initialized()Z

    goto :goto_8

    :cond_6
    iget-object v3, v1, Lcom/miui/gallery/provider/GalleryProvider;->mMediaManager:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-virtual {v3}, Lcom/miui/gallery/provider/cache/MediaManager;->ensureMinimumPartDone()V

    :goto_8
    const-string v3, "remove_duplicate_items"

    invoke-virtual {v0, v3, v15}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    move-result v3

    const-string v4, "generate_headers"

    invoke-virtual {v0, v4, v15}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    move-result v4

    const-string v5, "remove_processing_items"

    invoke-virtual {v0, v5, v15}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    move-result v0

    new-instance v8, Landroid/os/Bundle;

    invoke-direct {v8}, Landroid/os/Bundle;-><init>()V

    const-string v5, "extra_generate_header"

    invoke-virtual {v8, v5, v4}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const/16 v4, 0x35

    if-ne v14, v4, :cond_7

    const/4 v4, 0x1

    goto :goto_9

    :cond_7
    const/4 v4, 0x0

    :goto_9
    const-string v5, "extra_media_group_by"

    invoke-virtual {v8, v5, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    if-eqz v0, :cond_8

    invoke-direct {v1, v6}, Lcom/miui/gallery/provider/GalleryProvider;->buildNonProcessingSelection(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_a

    :cond_8
    move-object v0, v6

    :goto_a
    iget-object v4, v1, Lcom/miui/gallery/provider/GalleryProvider;->mMediaManager:Lcom/miui/gallery/provider/cache/MediaManager;

    if-eqz v3, :cond_9

    const-string v2, "sha1"

    :cond_9
    move-object v7, v2

    move-object v2, v4

    move-object/from16 v3, p2

    move-object v4, v0

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    invoke-virtual/range {v2 .. v8}, Lcom/miui/gallery/provider/cache/MediaManager;->query([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/database/Cursor;

    move-result-object v8

    if-eqz v8, :cond_a

    invoke-direct {v1, v8, v14}, Lcom/miui/gallery/provider/GalleryProvider;->registerNotifyUri(Landroid/database/Cursor;I)V

    :cond_a
    const/16 v2, 0x32

    if-ne v14, v2, :cond_c

    const-string v6, "sha1"

    move-object v2, v12

    move-object/from16 v3, p2

    move-object v4, v0

    move-object/from16 v5, p4

    move-object/from16 v7, p5

    invoke-static/range {v2 .. v7}, Lcom/miui/gallery/provider/ShareMediaManager;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    if-eqz v0, :cond_b

    invoke-direct {v1, v0, v14}, Lcom/miui/gallery/provider/GalleryProvider;->registerNotifyUri(Landroid/database/Cursor;I)V

    :cond_b
    new-instance v2, Landroid/database/MergeCursor;

    const/4 v3, 0x2

    new-array v3, v3, [Landroid/database/Cursor;

    aput-object v8, v3, v15

    aput-object v0, v3, v13

    invoke-direct {v2, v3}, Landroid/database/MergeCursor;-><init>([Landroid/database/Cursor;)V

    goto :goto_b

    :cond_c
    move-object v2, v8

    :goto_b
    return-object v2

    nop

    :pswitch_data_0
    .packed-switch 0x32
        :pswitch_1d
        :pswitch_1d
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x46
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x5a
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
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x6e
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
    .end packed-switch

    :pswitch_data_4
    .packed-switch 0x96
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
    .end packed-switch

    :pswitch_data_5
    .packed-switch 0xaa
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :sswitch_data_0
    .sparse-switch
        0x35 -> :sswitch_5
        0x4c -> :sswitch_4
        0x57 -> :sswitch_3
        0x82 -> :sswitch_2
        0x84 -> :sswitch_1
        0xb4 -> :sswitch_0
    .end sparse-switch
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 6

    sget-object v0, Lcom/miui/gallery/provider/GalleryProvider;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v0, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/provider/GalleryProvider;->isBlockedByMediaManager(I)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/provider/GalleryProvider;->mMediaManager:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-virtual {v1}, Lcom/miui/gallery/provider/cache/MediaManager;->initialized()Z

    move-result v1

    if-nez v1, :cond_0

    return v2

    :cond_0
    sget-object v1, Lcom/miui/gallery/provider/GalleryProvider;->sDBHelper:Lcom/miui/gallery/provider/GalleryDBHelper;

    invoke-virtual {v1}, Lcom/miui/gallery/provider/GalleryDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const/4 v3, 0x1

    const/4 v4, 0x0

    sparse-switch v0, :sswitch_data_0

    invoke-super {p0, p1, p2, p3, p4}, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    goto/16 :goto_2

    :sswitch_0
    const-string v5, "favorites"

    invoke-virtual {v1, v5, p2, p3, p4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    if-lez v1, :cond_5

    const-string v5, "isFavorite"

    invoke-virtual {p2, v5}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5

    const-string v5, "isFavorite"

    invoke-virtual {p2, v5}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-lez v5, :cond_1

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    :goto_0
    invoke-direct {p0, p3, p4, v2}, Lcom/miui/gallery/provider/GalleryProvider;->getSha1ListFromFavorites(Ljava/lang/String;[Ljava/lang/String;Z)Ljava/util/List;

    move-result-object p3

    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_1
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result p4

    if-eqz p4, :cond_5

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/lang/String;

    if-eqz v3, :cond_2

    iget-object v2, p0, Lcom/miui/gallery/provider/GalleryProvider;->mMediaManager:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-virtual {v2, p4}, Lcom/miui/gallery/provider/cache/MediaManager;->insertToFavorites(Ljava/lang/String;)V

    goto :goto_1

    :cond_2
    iget-object v2, p0, Lcom/miui/gallery/provider/GalleryProvider;->mMediaManager:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-virtual {v2, p4}, Lcom/miui/gallery/provider/cache/MediaManager;->removeFromFavorites(Ljava/lang/String;)V

    goto :goto_1

    :sswitch_1
    const-string v2, "cloudControl"

    invoke-virtual {v1, v2, p2, p3, p4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    goto/16 :goto_2

    :sswitch_2
    const-string v2, "discoveryMessage"

    invoke-virtual {v1, v2, p2, p3, p4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    goto :goto_2

    :sswitch_3
    const-string v2, "cloudUser"

    invoke-virtual {v1, v2, p2, p3, p4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    goto :goto_2

    :sswitch_4
    const-string v2, "shareUser"

    invoke-virtual {v1, v2, p2, p3, p4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    goto :goto_2

    :sswitch_5
    const-string v2, "shareAlbum"

    invoke-virtual {v1, v2, p2, p3, p4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    goto :goto_2

    :sswitch_6
    const-string v3, "shareImage"

    invoke-virtual {p0, p2, v2}, Lcom/miui/gallery/provider/GalleryProvider;->appendValuesForCloud(Landroid/content/ContentValues;Z)Landroid/content/ContentValues;

    move-result-object v2

    invoke-virtual {v1, v3, v2, p3, p4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    goto :goto_2

    :sswitch_7
    const-string v2, "peopleFace"

    invoke-virtual {v1, v2, p2, p3, p4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    goto :goto_2

    :sswitch_8
    invoke-virtual {p2}, Landroid/content/ContentValues;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v2

    if-ne v2, v3, :cond_3

    const-string v2, "sync_status"

    invoke-interface {v1, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p0, p3, p4}, Lcom/miui/gallery/provider/GalleryProvider;->genIDSelection(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    iget-object p4, p0, Lcom/miui/gallery/provider/GalleryProvider;->mMediaManager:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-virtual {p4, p3, v4, p2}, Lcom/miui/gallery/provider/cache/MediaManager;->update(Ljava/lang/String;[Ljava/lang/String;Landroid/content/ContentValues;)I

    move-result v1

    goto :goto_2

    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "only support key: sync_status"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :sswitch_9
    invoke-virtual {p0, p2, v2}, Lcom/miui/gallery/provider/GalleryProvider;->appendValuesForCloud(Landroid/content/ContentValues;Z)Landroid/content/ContentValues;

    invoke-virtual {p0, p3, p4}, Lcom/miui/gallery/provider/GalleryProvider;->genIDSelection(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "attributes"

    invoke-virtual {p2, v3}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    const-string v3, "cloud"

    invoke-virtual {p0, v1, v3, v2, p2}, Lcom/miui/gallery/provider/GalleryProvider;->updateAttributes(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)V

    :cond_4
    iget-object v3, p0, Lcom/miui/gallery/provider/GalleryProvider;->mMediaManager:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-virtual {v3, v2, v4, p2}, Lcom/miui/gallery/provider/cache/MediaManager;->update(Ljava/lang/String;[Ljava/lang/String;Landroid/content/ContentValues;)I

    const-string v2, "cloud"

    invoke-virtual {v1, v2, p2, p3, p4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    :cond_5
    :goto_2
    if-lez v1, :cond_6

    invoke-direct {p0, p1, v0, p2}, Lcom/miui/gallery/provider/GalleryProvider;->needNotifyUpdate(Landroid/net/Uri;ILandroid/content/ContentValues;)Z

    move-result p3

    if-eqz p3, :cond_6

    invoke-static {p1, p2}, Lcom/miui/gallery/provider/GalleryProvider;->parseSyncReason(Landroid/net/Uri;Landroid/content/ContentValues;)J

    move-result-wide p2

    invoke-direct {p0, p1, v4, p2, p3}, Lcom/miui/gallery/provider/GalleryProvider;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;J)V

    :cond_6
    return v1

    nop

    :sswitch_data_0
    .sparse-switch
        0x46 -> :sswitch_9
        0x47 -> :sswitch_8
        0x4b -> :sswitch_9
        0x5c -> :sswitch_7
        0x6e -> :sswitch_6
        0x72 -> :sswitch_5
        0x82 -> :sswitch_4
        0x83 -> :sswitch_4
        0x84 -> :sswitch_3
        0x85 -> :sswitch_3
        0x96 -> :sswitch_2
        0x97 -> :sswitch_2
        0xaa -> :sswitch_1
        0xab -> :sswitch_1
        0xb4 -> :sswitch_0
    .end sparse-switch
.end method
