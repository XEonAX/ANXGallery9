.class public Lcom/miui/gallery/provider/cache/SearchIconItem;
.super Ljava/lang/Object;
.source "SearchIconItem.java"

# interfaces
.implements Landroid/os/Parcelable;
.implements Lcom/miui/gallery/provider/cache/CacheItem;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/provider/cache/SearchIconItem$QueryFactory;
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

.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/miui/gallery/provider/cache/SearchIconItem;",
            ">;"
        }
    .end annotation
.end field

.field protected static final PROJECTION:[Ljava/lang/String;


# instance fields
.field public decodeRegionH:Ljava/lang/Float;

.field public decodeRegionOrientation:I

.field public decodeRegionW:Ljava/lang/Float;

.field public decodeRegionX:Ljava/lang/Float;

.field public decodeRegionY:Ljava/lang/Float;

.field public downloadUri:Ljava/lang/String;

.field public filePath:Ljava/lang/String;

.field public iconUri:Ljava/lang/String;

.field notifyUri:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    const-string v0, "icon_uri"

    const-string v1, "file_path"

    const-string v2, "download_uri"

    const-string v3, "decode_region_orientation"

    const-string v4, "decode_region_x"

    const-string v5, "decode_region_y"

    const-string v6, "decode_region_w"

    const-string v7, "decode_region_h"

    filled-new-array/range {v0 .. v7}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/provider/cache/SearchIconItem;->PROJECTION:[Ljava/lang/String;

    new-instance v0, Landroid/util/ArrayMap;

    sget-object v1, Lcom/miui/gallery/provider/cache/SearchIconItem;->PROJECTION:[Ljava/lang/String;

    array-length v1, v1

    invoke-direct {v0, v1}, Landroid/util/ArrayMap;-><init>(I)V

    sput-object v0, Lcom/miui/gallery/provider/cache/SearchIconItem;->COLUMN_MAP:Ljava/util/Map;

    sget-object v0, Lcom/miui/gallery/provider/cache/SearchIconItem;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "icon_uri"

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/SearchIconItem;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "file_path"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/SearchIconItem;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "download_uri"

    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/SearchIconItem;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "decode_region_orientation"

    const/4 v2, 0x3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/SearchIconItem;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "decode_region_x"

    const/4 v2, 0x4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/SearchIconItem;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "decode_region_y"

    const/4 v2, 0x5

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/SearchIconItem;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "decode_region_w"

    const/4 v2, 0x6

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/provider/cache/SearchIconItem;->COLUMN_MAP:Ljava/util/Map;

    const-string v1, "decode_region_h"

    const/4 v2, 0x7

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lcom/miui/gallery/provider/cache/SearchIconItem$1;

    invoke-direct {v0}, Lcom/miui/gallery/provider/cache/SearchIconItem$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/provider/cache/SearchIconItem;->COLUMN_MAPPER:Lcom/miui/gallery/provider/cache/CacheItem$ColumnMapper;

    new-instance v0, Lcom/miui/gallery/provider/cache/SearchIconItem$2;

    invoke-direct {v0}, Lcom/miui/gallery/provider/cache/SearchIconItem$2;-><init>()V

    sput-object v0, Lcom/miui/gallery/provider/cache/SearchIconItem;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/provider/cache/SearchIconItem;->iconUri:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/provider/cache/SearchIconItem;->filePath:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/provider/cache/SearchIconItem;->downloadUri:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/provider/cache/SearchIconItem;->decodeRegionOrientation:I

    const-class v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readValue(Ljava/lang/ClassLoader;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    iput-object v0, p0, Lcom/miui/gallery/provider/cache/SearchIconItem;->decodeRegionX:Ljava/lang/Float;

    const-class v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readValue(Ljava/lang/ClassLoader;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    iput-object v0, p0, Lcom/miui/gallery/provider/cache/SearchIconItem;->decodeRegionY:Ljava/lang/Float;

    const-class v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readValue(Ljava/lang/ClassLoader;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    iput-object v0, p0, Lcom/miui/gallery/provider/cache/SearchIconItem;->decodeRegionW:Ljava/lang/Float;

    const-class v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readValue(Ljava/lang/ClassLoader;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    iput-object v0, p0, Lcom/miui/gallery/provider/cache/SearchIconItem;->decodeRegionH:Ljava/lang/Float;

    const-class v0, Landroid/net/Uri;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/net/Uri;

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/SearchIconItem;->notifyUri:Landroid/net/Uri;

    return-void
.end method

.method static synthetic access$000()Ljava/util/Map;
    .locals 1

    sget-object v0, Lcom/miui/gallery/provider/cache/SearchIconItem;->COLUMN_MAP:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$100()Lcom/miui/gallery/provider/cache/CacheItem$ColumnMapper;
    .locals 1

    sget-object v0, Lcom/miui/gallery/provider/cache/SearchIconItem;->COLUMN_MAPPER:Lcom/miui/gallery/provider/cache/CacheItem$ColumnMapper;

    return-object v0
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public fillWindow(Landroid/database/CursorWindow;III)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public get(IZ)Ljava/lang/Object;
    .locals 0

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/provider/cache/SearchIconItem;->iconUri:Ljava/lang/String;

    return-object p1

    :cond_0
    const/4 p2, 0x1

    if-ne p1, p2, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/provider/cache/SearchIconItem;->filePath:Ljava/lang/String;

    return-object p1

    :cond_1
    const/4 p2, 0x2

    if-ne p1, p2, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/provider/cache/SearchIconItem;->downloadUri:Ljava/lang/String;

    return-object p1

    :cond_2
    const/4 p2, 0x3

    if-ne p1, p2, :cond_3

    iget p1, p0, Lcom/miui/gallery/provider/cache/SearchIconItem;->decodeRegionOrientation:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1

    :cond_3
    const/4 p2, 0x4

    if-ne p1, p2, :cond_4

    iget-object p1, p0, Lcom/miui/gallery/provider/cache/SearchIconItem;->decodeRegionX:Ljava/lang/Float;

    return-object p1

    :cond_4
    const/4 p2, 0x5

    if-ne p1, p2, :cond_5

    iget-object p1, p0, Lcom/miui/gallery/provider/cache/SearchIconItem;->decodeRegionY:Ljava/lang/Float;

    return-object p1

    :cond_5
    const/4 p2, 0x6

    if-ne p1, p2, :cond_6

    iget-object p1, p0, Lcom/miui/gallery/provider/cache/SearchIconItem;->decodeRegionW:Ljava/lang/Float;

    return-object p1

    :cond_6
    const/4 p2, 0x7

    if-ne p1, p2, :cond_7

    iget-object p1, p0, Lcom/miui/gallery/provider/cache/SearchIconItem;->decodeRegionH:Ljava/lang/Float;

    return-object p1

    :cond_7
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, " not recognized column."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public getType(I)I
    .locals 3

    const/4 v0, 0x3

    if-nez p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x1

    if-ne p1, v1, :cond_1

    return v0

    :cond_1
    const/4 v2, 0x2

    if-ne p1, v2, :cond_2

    return v0

    :cond_2
    if-ne p1, v0, :cond_3

    return v1

    :cond_3
    const/4 v0, 0x4

    if-ne p1, v0, :cond_4

    return v2

    :cond_4
    const/4 v0, 0x5

    if-ne p1, v0, :cond_5

    return v2

    :cond_5
    const/4 v0, 0x6

    if-ne p1, v0, :cond_6

    return v2

    :cond_6
    const/4 v0, 0x7

    if-ne p1, v0, :cond_7

    return v2

    :cond_7
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, " not recognized column."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/SearchIconItem;->iconUri:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/SearchIconItem;->filePath:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/SearchIconItem;->downloadUri:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget v0, p0, Lcom/miui/gallery/provider/cache/SearchIconItem;->decodeRegionOrientation:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/SearchIconItem;->decodeRegionX:Ljava/lang/Float;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeValue(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/SearchIconItem;->decodeRegionY:Ljava/lang/Float;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeValue(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/SearchIconItem;->decodeRegionW:Ljava/lang/Float;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeValue(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/SearchIconItem;->decodeRegionH:Ljava/lang/Float;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeValue(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/SearchIconItem;->notifyUri:Landroid/net/Uri;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    return-void
.end method
