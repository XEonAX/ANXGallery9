.class public Lcom/miui/gallery/provider/cache/MediaItem$Generator;
.super Ljava/lang/Object;
.source "MediaItem.java"

# interfaces
.implements Lcom/miui/gallery/provider/cache/CacheItem$Generator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/cache/MediaItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Generator"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/provider/cache/MediaItem$Generator$CloudIdFilter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/provider/cache/CacheItem$Generator<",
        "Lcom/miui/gallery/provider/cache/MediaItem;",
        ">;"
    }
.end annotation


# static fields
.field private static final COLUMN_MAP:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final COLUMN_MAPPER:Lcom/miui/gallery/provider/cache/CacheItem$ColumnMapper;

.field private static final PROJECTION:[Ljava/lang/String;


# instance fields
.field private mAlbumDelegate:Lcom/miui/gallery/provider/cache/AlbumDelegate;

.field private mFavoritesDelegate:Lcom/miui/gallery/provider/cache/FavoritesDelegate;


# direct methods
.method static constructor <clinit>()V
    .locals 31

    new-instance v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator$1;

    invoke-direct {v0}, Lcom/miui/gallery/provider/cache/MediaItem$Generator$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->COLUMN_MAPPER:Lcom/miui/gallery/provider/cache/CacheItem$ColumnMapper;

    const-string v1, "_id"

    const-string v2, "sha1"

    const-string v3, "microthumbfile"

    const-string v4, "thumbnailFile"

    const-string v5, "localFile"

    const-string v6, "serverType"

    const-string v7, "title"

    const-string v8, "duration"

    const-string v9, "description"

    const-string v10, "location"

    const-string v11, "size"

    const-string v12, "localGroupId"

    const-string v13, "mimeType"

    const-string v14, "exifGPSLatitude"

    const-string v15, "exifGPSLatitudeRef"

    const-string v16, "exifGPSLongitude"

    const-string v17, "exifGPSLongitudeRef"

    const-string v18, "secretKey"

    const-string v19, "localFlag"

    const-string v20, "mixedDateTime"

    const-string v21, "exifImageWidth"

    const-string v22, "exifImageLength"

    const-string v23, "serverStatus"

    const-string v24, "dateModified"

    const-string v25, "creatorId"

    const-string v26, "serverTag"

    const-string v27, "serverId"

    const-string v28, "groupId"

    const-string v29, "specialTypeFlags"

    const-string v30, "exifOrientation"

    filled-new-array/range {v1 .. v30}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    new-instance v0, Landroid/util/ArrayMap;

    sget-object v1, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    array-length v1, v1

    invoke-direct {v0, v1}, Landroid/util/ArrayMap;-><init>(I)V

    sput-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->COLUMN_MAP:Ljava/util/Map;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "_id"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "sha1"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "microthumbfile"

    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "thumbnailFile"

    const/4 v2, 0x3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "localFile"

    const/4 v2, 0x4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "serverType"

    const/4 v2, 0x5

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "title"

    const/4 v2, 0x6

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "duration"

    const/4 v2, 0x7

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "description"

    const/16 v2, 0x8

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "location"

    const/16 v2, 0x9

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "size"

    const/16 v2, 0xa

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "localGroupId"

    const/16 v2, 0xb

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "mimeType"

    const/16 v2, 0xc

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "exifGPSLatitude"

    const/16 v2, 0xd

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "exifGPSLatitudeRef"

    const/16 v2, 0xe

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "exifGPSLongitude"

    const/16 v2, 0xf

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "exifGPSLongitudeRef"

    const/16 v2, 0x10

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "secretKey"

    const/16 v2, 0x11

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "localFlag"

    const/16 v2, 0x12

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "mixedDateTime"

    const/16 v2, 0x13

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "exifImageWidth"

    const/16 v2, 0x14

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "exifImageLength"

    const/16 v2, 0x15

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "serverStatus"

    const/16 v2, 0x16

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "dateModified"

    const/16 v2, 0x17

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "creatorId"

    const/16 v2, 0x18

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "serverTag"

    const/16 v2, 0x19

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "serverId"

    const/16 v2, 0x1a

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "groupId"

    const/16 v2, 0x1b

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "specialTypeFlags"

    const/16 v2, 0x1c

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "exifOrientation"

    const/16 v2, 0x1d

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery/provider/cache/AlbumDelegate;Lcom/miui/gallery/provider/cache/FavoritesDelegate;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->mAlbumDelegate:Lcom/miui/gallery/provider/cache/AlbumDelegate;

    iput-object p2, p0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->mFavoritesDelegate:Lcom/miui/gallery/provider/cache/FavoritesDelegate;

    return-void
.end method

.method static synthetic access$4100()Ljava/util/Map;
    .locals 1

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->COLUMN_MAP:Ljava/util/Map;

    return-object v0
.end method


# virtual methods
.method public bridge synthetic from(JLandroid/content/ContentValues;)Lcom/miui/gallery/provider/cache/CacheItem;
    .locals 0

    invoke-virtual {p0, p1, p2, p3}, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->from(JLandroid/content/ContentValues;)Lcom/miui/gallery/provider/cache/MediaItem;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic from(Landroid/database/Cursor;)Lcom/miui/gallery/provider/cache/CacheItem;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->from(Landroid/database/Cursor;)Lcom/miui/gallery/provider/cache/MediaItem;

    move-result-object p1

    return-object p1
.end method

.method public from(JLandroid/content/ContentValues;)Lcom/miui/gallery/provider/cache/MediaItem;
    .locals 5

    new-instance v0, Lcom/miui/gallery/provider/cache/MediaItem;

    invoke-direct {v0}, Lcom/miui/gallery/provider/cache/MediaItem;-><init>()V

    invoke-static {v0, p1, p2}, Lcom/miui/gallery/provider/cache/MediaItem;->access$402(Lcom/miui/gallery/provider/cache/MediaItem;J)J

    sget-object p1, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/4 p2, 0x1

    aget-object p1, p1, p2

    invoke-virtual {p3, p1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$1402(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    sget-object p1, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 p2, 0xb

    aget-object p1, p1, p2

    invoke-virtual {p3, p1}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$902(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Long;)Ljava/lang/Long;

    sget-object p1, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/4 p2, 0x2

    aget-object p1, p1, p2

    invoke-virtual {p3, p1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$2202(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    sget-object p1, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/4 p2, 0x3

    aget-object p1, p1, p2

    invoke-virtual {p3, p1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$1202(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    sget-object p1, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/4 p2, 0x4

    aget-object p1, p1, p2

    invoke-virtual {p3, p1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$1302(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    sget-object p1, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/4 p2, 0x5

    aget-object p1, p1, p2

    invoke-virtual {p3, p1}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$1002(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Integer;)Ljava/lang/Integer;

    sget-object p1, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/4 p2, 0x6

    aget-object p1, p1, p2

    invoke-virtual {p3, p1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$502(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    sget-object p1, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/4 p2, 0x7

    aget-object p1, p1, p2

    invoke-virtual {p3, p1}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$2302(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Long;)Ljava/lang/Long;

    sget-object p1, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 p2, 0x8

    aget-object p1, p1, p2

    invoke-virtual {p3, p1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$2402(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    sget-object p1, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 p2, 0x9

    aget-object p1, p1, p2

    invoke-virtual {p3, p1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$2002(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    sget-object p1, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 p2, 0xa

    aget-object p1, p1, p2

    invoke-virtual {p3, p1}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object p1

    const-wide/16 v1, 0x0

    if-nez p1, :cond_0

    move-wide p1, v1

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide p1

    :goto_0
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$602(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Long;)Ljava/lang/Long;

    sget-object p1, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 p2, 0xc

    aget-object p1, p1, p2

    invoke-virtual {p3, p1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$1802(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    sget-object p1, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 p2, 0xd

    aget-object p1, p1, p2

    invoke-virtual {p3, p1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$2502(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    sget-object p1, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 p2, 0xe

    aget-object p1, p1, p2

    invoke-virtual {p3, p1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    const/4 v3, 0x0

    const/4 v4, 0x0

    if-eqz p2, :cond_1

    move-object p1, v4

    goto :goto_1

    :cond_1
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result p1

    invoke-static {p1}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object p1

    :goto_1
    invoke-static {v0, p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$2602(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Character;)Ljava/lang/Character;

    sget-object p1, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 p2, 0xf

    aget-object p1, p1, p2

    invoke-virtual {p3, p1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$2702(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    sget-object p1, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 p2, 0x10

    aget-object p1, p1, p2

    invoke-virtual {p3, p1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_2

    goto :goto_2

    :cond_2
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result p1

    invoke-static {p1}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v4

    :goto_2
    invoke-static {v0, v4}, Lcom/miui/gallery/provider/cache/MediaItem;->access$2802(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Character;)Ljava/lang/Character;

    sget-object p1, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 p2, 0x11

    aget-object p1, p1, p2

    invoke-virtual {p3, p1}, Landroid/content/ContentValues;->getAsByteArray(Ljava/lang/String;)[B

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$2902(Lcom/miui/gallery/provider/cache/MediaItem;[B)[B

    sget-object p1, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 p2, 0x12

    aget-object p1, p1, p2

    invoke-virtual {p3, p1}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$1102(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Long;)Ljava/lang/Long;

    sget-object p1, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 p2, 0x14

    aget-object p1, p1, p2

    invoke-virtual {p3, p1}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$702(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Integer;)Ljava/lang/Integer;

    sget-object p1, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 p2, 0x15

    aget-object p1, p1, p2

    invoke-virtual {p3, p1}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$802(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Integer;)Ljava/lang/Integer;

    sget-object p1, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 p2, 0x16

    aget-object p1, p1, p2

    invoke-virtual {p3, p1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$3002(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    sget-object p1, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 p2, 0x13

    aget-object p1, p1, p2

    invoke-virtual {p3, p1}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object p1

    if-nez p1, :cond_3

    move-wide p1, v1

    goto :goto_3

    :cond_3
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide p1

    :goto_3
    invoke-static {v0, p1, p2}, Lcom/miui/gallery/provider/cache/MediaItem;->access$302(Lcom/miui/gallery/provider/cache/MediaItem;J)J

    sget-object p1, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 p2, 0x17

    aget-object p1, p1, p2

    invoke-virtual {p3, p1}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object p1

    if-nez p1, :cond_4

    goto :goto_4

    :cond_4
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    :goto_4
    invoke-static {v0, v1, v2}, Lcom/miui/gallery/provider/cache/MediaItem;->access$102(Lcom/miui/gallery/provider/cache/MediaItem;J)J

    invoke-static {v0}, Lcom/miui/gallery/provider/cache/MediaItem;->access$300(Lcom/miui/gallery/provider/cache/MediaItem;)J

    move-result-wide p1

    invoke-static {p1, p2}, Lcom/miui/gallery/util/GalleryDateUtils;->format(J)I

    move-result p1

    invoke-static {v0, p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$1702(Lcom/miui/gallery/provider/cache/MediaItem;I)I

    sget-object p1, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 p2, 0x18

    aget-object p1, p1, p2

    invoke-virtual {p3, p1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$3102(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->mAlbumDelegate:Lcom/miui/gallery/provider/cache/AlbumDelegate;

    invoke-static {v0, p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$3202(Lcom/miui/gallery/provider/cache/MediaItem;Lcom/miui/gallery/provider/cache/AlbumDelegate;)Lcom/miui/gallery/provider/cache/AlbumDelegate;

    sget-object p1, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 p2, 0x19

    aget-object p1, p1, p2

    invoke-virtual {p3, p1}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$1502(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Long;)Ljava/lang/Long;

    sget-object p1, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 p2, 0x1a

    aget-object p1, p1, p2

    invoke-virtual {p3, p1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$1602(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/provider/cache/MediaItem;->access$100(Lcom/miui/gallery/provider/cache/MediaItem;)J

    move-result-wide p1

    invoke-static {p1, p2}, Lcom/miui/gallery/util/GalleryDateUtils;->format(J)I

    move-result p1

    invoke-static {v0, p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$3302(Lcom/miui/gallery/provider/cache/MediaItem;I)I

    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->mFavoritesDelegate:Lcom/miui/gallery/provider/cache/FavoritesDelegate;

    invoke-static {v0, p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$3402(Lcom/miui/gallery/provider/cache/MediaItem;Lcom/miui/gallery/provider/cache/FavoritesDelegate;)Lcom/miui/gallery/provider/cache/FavoritesDelegate;

    sget-object p1, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 p2, 0x1b

    aget-object p1, p1, p2

    invoke-virtual {p3, p1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$1902(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    sget-object p1, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 p2, 0x1c

    aget-object p1, p1, p2

    invoke-virtual {p3, p1}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$3502(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Long;)Ljava/lang/Long;

    invoke-static {v0}, Lcom/miui/gallery/provider/cache/MediaItem;->access$3600(Lcom/miui/gallery/provider/cache/MediaItem;)V

    sget-object p1, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 p2, 0x1d

    aget-object p1, p1, p2

    invoke-virtual {p3, p1}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$3702(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Integer;)Ljava/lang/Integer;

    invoke-static {v0}, Lcom/miui/gallery/provider/cache/MediaItem;->access$500(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$3900(Ljava/lang/String;)J

    move-result-wide p1

    invoke-static {v0, p1, p2}, Lcom/miui/gallery/provider/cache/MediaItem;->access$3802(Lcom/miui/gallery/provider/cache/MediaItem;J)J

    return-object v0
.end method

.method public from(Landroid/database/Cursor;)Lcom/miui/gallery/provider/cache/MediaItem;
    .locals 3

    new-instance v0, Lcom/miui/gallery/provider/cache/MediaItem;

    invoke-direct {v0}, Lcom/miui/gallery/provider/cache/MediaItem;-><init>()V

    const/4 v1, 0x0

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/provider/cache/MediaItem;->access$402(Lcom/miui/gallery/provider/cache/MediaItem;J)J

    const/4 v1, 0x1

    invoke-static {p1, v1}, Lcom/miui/gallery/provider/cache/ParseUtils;->getString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$1402(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    const/16 v1, 0xb

    invoke-static {p1, v1}, Lcom/miui/gallery/provider/cache/ParseUtils;->getLong(Landroid/database/Cursor;I)Ljava/lang/Long;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$902(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Long;)Ljava/lang/Long;

    const/4 v1, 0x2

    invoke-static {p1, v1}, Lcom/miui/gallery/provider/cache/ParseUtils;->getString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$2202(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    const/4 v1, 0x3

    invoke-static {p1, v1}, Lcom/miui/gallery/provider/cache/ParseUtils;->getString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$1202(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    const/4 v1, 0x4

    invoke-static {p1, v1}, Lcom/miui/gallery/provider/cache/ParseUtils;->getString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$1302(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    const/4 v1, 0x5

    invoke-static {p1, v1}, Lcom/miui/gallery/provider/cache/ParseUtils;->getInt(Landroid/database/Cursor;I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$1002(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Integer;)Ljava/lang/Integer;

    const/4 v1, 0x6

    invoke-static {p1, v1}, Lcom/miui/gallery/provider/cache/ParseUtils;->getString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$502(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    const/4 v1, 0x7

    invoke-static {p1, v1}, Lcom/miui/gallery/provider/cache/ParseUtils;->getLong(Landroid/database/Cursor;I)Ljava/lang/Long;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$2302(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Long;)Ljava/lang/Long;

    const/16 v1, 0x8

    invoke-static {p1, v1}, Lcom/miui/gallery/provider/cache/ParseUtils;->getString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$2402(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    const/16 v1, 0x9

    invoke-static {p1, v1}, Lcom/miui/gallery/provider/cache/ParseUtils;->getString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$2002(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    const/16 v1, 0xa

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$602(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Long;)Ljava/lang/Long;

    const/16 v1, 0xc

    invoke-static {p1, v1}, Lcom/miui/gallery/provider/cache/ParseUtils;->getString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$1802(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    const/16 v1, 0xd

    invoke-static {p1, v1}, Lcom/miui/gallery/provider/cache/ParseUtils;->getString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$2502(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    const/16 v1, 0xe

    invoke-static {p1, v1}, Lcom/miui/gallery/provider/cache/ParseUtils;->getChar(Landroid/database/Cursor;I)Ljava/lang/Character;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$2602(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Character;)Ljava/lang/Character;

    const/16 v1, 0xf

    invoke-static {p1, v1}, Lcom/miui/gallery/provider/cache/ParseUtils;->getString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$2702(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    const/16 v1, 0x10

    invoke-static {p1, v1}, Lcom/miui/gallery/provider/cache/ParseUtils;->getChar(Landroid/database/Cursor;I)Ljava/lang/Character;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$2802(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Character;)Ljava/lang/Character;

    const/16 v1, 0x11

    invoke-static {p1, v1}, Lcom/miui/gallery/provider/cache/ParseUtils;->getBlob(Landroid/database/Cursor;I)[B

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$2902(Lcom/miui/gallery/provider/cache/MediaItem;[B)[B

    const/16 v1, 0x12

    invoke-static {p1, v1}, Lcom/miui/gallery/provider/cache/ParseUtils;->getLong(Landroid/database/Cursor;I)Ljava/lang/Long;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$1102(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Long;)Ljava/lang/Long;

    const/16 v1, 0x14

    invoke-static {p1, v1}, Lcom/miui/gallery/provider/cache/ParseUtils;->getInt(Landroid/database/Cursor;I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$702(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Integer;)Ljava/lang/Integer;

    const/16 v1, 0x15

    invoke-static {p1, v1}, Lcom/miui/gallery/provider/cache/ParseUtils;->getInt(Landroid/database/Cursor;I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$802(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Integer;)Ljava/lang/Integer;

    const/16 v1, 0x16

    invoke-static {p1, v1}, Lcom/miui/gallery/provider/cache/ParseUtils;->getString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$3002(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    const/16 v1, 0x13

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/provider/cache/MediaItem;->access$302(Lcom/miui/gallery/provider/cache/MediaItem;J)J

    const/16 v1, 0x17

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/provider/cache/MediaItem;->access$102(Lcom/miui/gallery/provider/cache/MediaItem;J)J

    invoke-static {v0}, Lcom/miui/gallery/provider/cache/MediaItem;->access$300(Lcom/miui/gallery/provider/cache/MediaItem;)J

    move-result-wide v1

    invoke-static {v1, v2}, Lcom/miui/gallery/util/GalleryDateUtils;->format(J)I

    move-result v1

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$1702(Lcom/miui/gallery/provider/cache/MediaItem;I)I

    const/16 v1, 0x18

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$3102(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->mAlbumDelegate:Lcom/miui/gallery/provider/cache/AlbumDelegate;

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$3202(Lcom/miui/gallery/provider/cache/MediaItem;Lcom/miui/gallery/provider/cache/AlbumDelegate;)Lcom/miui/gallery/provider/cache/AlbumDelegate;

    const/16 v1, 0x19

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$1502(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Long;)Ljava/lang/Long;

    const/16 v1, 0x1a

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$1602(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/provider/cache/MediaItem;->access$100(Lcom/miui/gallery/provider/cache/MediaItem;)J

    move-result-wide v1

    invoke-static {v1, v2}, Lcom/miui/gallery/util/GalleryDateUtils;->format(J)I

    move-result v1

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$3302(Lcom/miui/gallery/provider/cache/MediaItem;I)I

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->mFavoritesDelegate:Lcom/miui/gallery/provider/cache/FavoritesDelegate;

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$3402(Lcom/miui/gallery/provider/cache/MediaItem;Lcom/miui/gallery/provider/cache/FavoritesDelegate;)Lcom/miui/gallery/provider/cache/FavoritesDelegate;

    const/16 v1, 0x1b

    invoke-static {p1, v1}, Lcom/miui/gallery/provider/cache/ParseUtils;->getString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$1902(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    const/16 v1, 0x1c

    invoke-static {p1, v1}, Lcom/miui/gallery/provider/cache/ParseUtils;->getLong(Landroid/database/Cursor;I)Ljava/lang/Long;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$3502(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Long;)Ljava/lang/Long;

    invoke-static {v0}, Lcom/miui/gallery/provider/cache/MediaItem;->access$3600(Lcom/miui/gallery/provider/cache/MediaItem;)V

    const/16 v1, 0x1d

    invoke-static {p1, v1}, Lcom/miui/gallery/provider/cache/ParseUtils;->getInt(Landroid/database/Cursor;I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$3702(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Integer;)Ljava/lang/Integer;

    invoke-static {v0}, Lcom/miui/gallery/provider/cache/MediaItem;->access$500(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$3900(Ljava/lang/String;)J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/provider/cache/MediaItem;->access$3802(Lcom/miui/gallery/provider/cache/MediaItem;J)J

    return-object v0
.end method

.method public getFilter(ILcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)Lcom/miui/gallery/provider/cache/Filter$CompareFilter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/miui/gallery/provider/cache/Filter$Comparator;",
            "Ljava/lang/String;",
            ")",
            "Lcom/miui/gallery/provider/cache/Filter$CompareFilter<",
            "Lcom/miui/gallery/provider/cache/MediaItem;",
            ">;"
        }
    .end annotation

    if-nez p1, :cond_0

    new-instance p1, Lcom/miui/gallery/provider/cache/MediaItem$Generator$CloudIdFilter;

    invoke-direct {p1, p2, p3}, Lcom/miui/gallery/provider/cache/MediaItem$Generator$CloudIdFilter;-><init>(Lcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)V

    return-object p1

    :cond_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    new-instance p1, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$Sha1Filter;

    invoke-direct {p1, p2, p3}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$Sha1Filter;-><init>(Lcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)V

    return-object p1

    :cond_1
    sget-object p1, Lcom/miui/gallery/provider/cache/Filter;->NOT_SUPPORTED_FILTER:Lcom/miui/gallery/provider/cache/Filter$CompareFilter;

    return-object p1
.end method

.method public getMapper()Lcom/miui/gallery/provider/cache/CacheItem$ColumnMapper;
    .locals 1

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->COLUMN_MAPPER:Lcom/miui/gallery/provider/cache/CacheItem$ColumnMapper;

    return-object v0
.end method

.method public getProjection()[Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    return-object v0
.end method

.method public bridge synthetic update(Lcom/miui/gallery/provider/cache/CacheItem;Landroid/content/ContentValues;)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/provider/cache/MediaItem;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->update(Lcom/miui/gallery/provider/cache/MediaItem;Landroid/content/ContentValues;)V

    return-void
.end method

.method public update(Lcom/miui/gallery/provider/cache/MediaItem;Landroid/content/ContentValues;)V
    .locals 9

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/4 v1, 0x1

    aget-object v0, v0, v1

    invoke-virtual {p2, v0}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    aget-object v0, v0, v1

    invoke-virtual {p2, v0}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/provider/cache/MediaItem;->access$1402(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    :cond_0
    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 v2, 0xb

    aget-object v0, v0, v2

    invoke-virtual {p2, v0}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v0

    const/4 v3, 0x0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    aget-object v0, v0, v2

    invoke-virtual {p2, v0}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/provider/cache/MediaItem;->access$902(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Long;)Ljava/lang/Long;

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    sget-object v2, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/4 v4, 0x2

    aget-object v2, v2, v4

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    sget-object v2, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    aget-object v2, v2, v4

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/miui/gallery/provider/cache/MediaItem;->access$2202(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    :cond_2
    sget-object v2, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/4 v4, 0x3

    aget-object v2, v2, v4

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    sget-object v2, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    aget-object v2, v2, v4

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/miui/gallery/provider/cache/MediaItem;->access$1202(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    :cond_3
    sget-object v2, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/4 v4, 0x4

    aget-object v2, v2, v4

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    sget-object v2, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    aget-object v2, v2, v4

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/miui/gallery/provider/cache/MediaItem;->access$1302(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    :cond_4
    sget-object v2, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/4 v4, 0x5

    aget-object v2, v2, v4

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    sget-object v2, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    aget-object v2, v2, v4

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/miui/gallery/provider/cache/MediaItem;->access$1002(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Integer;)Ljava/lang/Integer;

    :cond_5
    sget-object v2, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/4 v4, 0x6

    aget-object v2, v2, v4

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_6

    sget-object v2, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    aget-object v2, v2, v4

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/miui/gallery/provider/cache/MediaItem;->access$502(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    invoke-static {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$500(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/miui/gallery/provider/cache/MediaItem;->access$3900(Ljava/lang/String;)J

    move-result-wide v4

    invoke-static {p1, v4, v5}, Lcom/miui/gallery/provider/cache/MediaItem;->access$3802(Lcom/miui/gallery/provider/cache/MediaItem;J)J

    :cond_6
    sget-object v2, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/4 v4, 0x7

    aget-object v2, v2, v4

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_7

    sget-object v2, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    aget-object v2, v2, v4

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/miui/gallery/provider/cache/MediaItem;->access$2302(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Long;)Ljava/lang/Long;

    :cond_7
    sget-object v2, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 v4, 0x8

    aget-object v2, v2, v4

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_8

    sget-object v2, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    aget-object v2, v2, v4

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/miui/gallery/provider/cache/MediaItem;->access$2402(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    :cond_8
    sget-object v2, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 v4, 0x9

    aget-object v2, v2, v4

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_9

    sget-object v2, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    aget-object v2, v2, v4

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/miui/gallery/provider/cache/MediaItem;->access$2002(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    :cond_9
    sget-object v2, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 v4, 0xa

    aget-object v2, v2, v4

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v2

    const-wide/16 v5, 0x0

    if-eqz v2, :cond_b

    sget-object v2, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    aget-object v2, v2, v4

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v2

    if-nez v2, :cond_a

    move-wide v7, v5

    goto :goto_1

    :cond_a
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    :goto_1
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/miui/gallery/provider/cache/MediaItem;->access$602(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Long;)Ljava/lang/Long;

    :cond_b
    sget-object v2, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 v4, 0xc

    aget-object v2, v2, v4

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_c

    sget-object v2, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    aget-object v2, v2, v4

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/miui/gallery/provider/cache/MediaItem;->access$1802(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    :cond_c
    sget-object v2, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 v4, 0xd

    aget-object v2, v2, v4

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_d

    sget-object v2, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    aget-object v2, v2, v4

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/miui/gallery/provider/cache/MediaItem;->access$2502(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    :cond_d
    sget-object v2, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 v4, 0xe

    aget-object v2, v2, v4

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_f

    sget-object v2, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 v4, 0xe

    aget-object v2, v2, v4

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_e

    const/4 v2, 0x0

    goto :goto_2

    :cond_e
    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v2

    :goto_2
    invoke-static {p1, v2}, Lcom/miui/gallery/provider/cache/MediaItem;->access$2602(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Character;)Ljava/lang/Character;

    :cond_f
    sget-object v2, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 v4, 0xf

    aget-object v2, v2, v4

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_10

    sget-object v2, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 v4, 0xf

    aget-object v2, v2, v4

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/miui/gallery/provider/cache/MediaItem;->access$2702(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    :cond_10
    sget-object v2, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 v4, 0x10

    aget-object v2, v2, v4

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_12

    sget-object v2, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 v4, 0x10

    aget-object v2, v2, v4

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_11

    const/4 v2, 0x0

    goto :goto_3

    :cond_11
    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v2

    :goto_3
    invoke-static {p1, v2}, Lcom/miui/gallery/provider/cache/MediaItem;->access$2802(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Character;)Ljava/lang/Character;

    :cond_12
    sget-object v2, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 v4, 0x13

    aget-object v2, v2, v4

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_14

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 v2, 0x13

    aget-object v0, v0, v2

    invoke-virtual {p2, v0}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    if-nez v0, :cond_13

    move-wide v7, v5

    goto :goto_4

    :cond_13
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    :goto_4
    invoke-static {p1, v7, v8}, Lcom/miui/gallery/provider/cache/MediaItem;->access$302(Lcom/miui/gallery/provider/cache/MediaItem;J)J

    invoke-static {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$300(Lcom/miui/gallery/provider/cache/MediaItem;)J

    move-result-wide v7

    invoke-static {v7, v8}, Lcom/miui/gallery/util/GalleryDateUtils;->format(J)I

    move-result v0

    invoke-static {p1, v0}, Lcom/miui/gallery/provider/cache/MediaItem;->access$1702(Lcom/miui/gallery/provider/cache/MediaItem;I)I

    const/4 v0, 0x1

    :cond_14
    sget-object v2, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 v4, 0x11

    aget-object v2, v2, v4

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_15

    sget-object v2, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 v4, 0x11

    aget-object v2, v2, v4

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->getAsByteArray(Ljava/lang/String;)[B

    move-result-object v2

    invoke-static {p1, v2}, Lcom/miui/gallery/provider/cache/MediaItem;->access$2902(Lcom/miui/gallery/provider/cache/MediaItem;[B)[B

    :cond_15
    sget-object v2, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 v4, 0x12

    aget-object v2, v2, v4

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_16

    sget-object v2, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 v4, 0x12

    aget-object v2, v2, v4

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/miui/gallery/provider/cache/MediaItem;->access$1102(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Long;)Ljava/lang/Long;

    :cond_16
    const-string v2, "sync_status"

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_18

    const-string v2, "sync_status"

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/miui/gallery/sdk/SyncStatus;->valueOf(Ljava/lang/String;)Lcom/miui/gallery/sdk/SyncStatus;

    move-result-object v2

    sget-object v4, Lcom/miui/gallery/sdk/SyncStatus;->STATUS_INIT:Lcom/miui/gallery/sdk/SyncStatus;

    if-ne v2, v4, :cond_17

    const/4 v3, 0x1

    :cond_17
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/miui/gallery/provider/cache/MediaItem;->access$4002(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    :cond_18
    sget-object v2, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 v3, 0x14

    aget-object v2, v2, v3

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_19

    sget-object v2, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 v3, 0x14

    aget-object v2, v2, v3

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/miui/gallery/provider/cache/MediaItem;->access$702(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Integer;)Ljava/lang/Integer;

    :cond_19
    sget-object v2, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 v3, 0x15

    aget-object v2, v2, v3

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1a

    sget-object v2, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 v3, 0x15

    aget-object v2, v2, v3

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/miui/gallery/provider/cache/MediaItem;->access$802(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Integer;)Ljava/lang/Integer;

    :cond_1a
    sget-object v2, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 v3, 0x16

    aget-object v2, v2, v3

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1b

    sget-object v2, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 v3, 0x16

    aget-object v2, v2, v3

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/miui/gallery/provider/cache/MediaItem;->access$3002(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    :cond_1b
    sget-object v2, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 v3, 0x17

    aget-object v2, v2, v3

    invoke-virtual {p2, v2}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1d

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 v2, 0x17

    aget-object v0, v0, v2

    invoke-virtual {p2, v0}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v0

    if-nez v0, :cond_1c

    goto :goto_5

    :cond_1c
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    :goto_5
    invoke-static {p1, v5, v6}, Lcom/miui/gallery/provider/cache/MediaItem;->access$102(Lcom/miui/gallery/provider/cache/MediaItem;J)J

    invoke-static {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$100(Lcom/miui/gallery/provider/cache/MediaItem;)J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/miui/gallery/util/GalleryDateUtils;->format(J)I

    move-result v0

    invoke-static {p1, v0}, Lcom/miui/gallery/provider/cache/MediaItem;->access$3302(Lcom/miui/gallery/provider/cache/MediaItem;I)I

    const/4 v0, 0x1

    :cond_1d
    sget-object v1, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 v2, 0x18

    aget-object v1, v1, v2

    invoke-virtual {p2, v1}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1e

    sget-object v1, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 v2, 0x18

    aget-object v1, v1, v2

    invoke-virtual {p2, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$3102(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    :cond_1e
    sget-object v1, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 v2, 0x19

    aget-object v1, v1, v2

    invoke-virtual {p2, v1}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1f

    sget-object v1, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 v2, 0x19

    aget-object v1, v1, v2

    invoke-virtual {p2, v1}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$1502(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Long;)Ljava/lang/Long;

    :cond_1f
    sget-object v1, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 v2, 0x1a

    aget-object v1, v1, v2

    invoke-virtual {p2, v1}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_20

    sget-object v1, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 v2, 0x1a

    aget-object v1, v1, v2

    invoke-virtual {p2, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$1602(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    :cond_20
    sget-object v1, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 v2, 0x1b

    aget-object v1, v1, v2

    invoke-virtual {p2, v1}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_21

    sget-object v1, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 v2, 0x1b

    aget-object v1, v1, v2

    invoke-virtual {p2, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$1902(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/String;)Ljava/lang/String;

    :cond_21
    sget-object v1, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 v2, 0x1c

    aget-object v1, v1, v2

    invoke-virtual {p2, v1}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_22

    sget-object v1, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 v2, 0x1c

    aget-object v1, v1, v2

    invoke-virtual {p2, v1}, Landroid/content/ContentValues;->getAsLong(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$3502(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Long;)Ljava/lang/Long;

    :cond_22
    if-eqz v0, :cond_23

    invoke-static {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$3600(Lcom/miui/gallery/provider/cache/MediaItem;)V

    :cond_23
    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 v1, 0x1d

    aget-object v0, v0, v1

    invoke-virtual {p2, v0}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_24

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;->PROJECTION:[Ljava/lang/String;

    const/16 v1, 0x1d

    aget-object v0, v0, v1

    invoke-virtual {p2, v0}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/miui/gallery/provider/cache/MediaItem;->access$3702(Lcom/miui/gallery/provider/cache/MediaItem;Ljava/lang/Integer;)Ljava/lang/Integer;

    :cond_24
    return-void
.end method
