.class public Lcom/miui/gallery/data/LocationManager;
.super Ljava/lang/Object;
.source "LocationManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/data/LocationManager$Statistics;,
        Lcom/miui/gallery/data/LocationManager$CacheItem;,
        Lcom/miui/gallery/data/LocationManager$AddressCache;,
        Lcom/miui/gallery/data/LocationManager$LocaleParser;,
        Lcom/miui/gallery/data/LocationManager$AddressParser;,
        Lcom/miui/gallery/data/LocationManager$ExtraGps;,
        Lcom/miui/gallery/data/LocationManager$CloudItem;
    }
.end annotation


# static fields
.field private static final ALIAS_EXIF_GPS_VALID:Ljava/lang/String;

.field private static final ALIAS_LOCATION_INFO_INVALID:Ljava/lang/String;

.field private static final FIXED_ADDRESS_LOCALE:Ljava/util/Locale;

.field private static final INVALID_NAME:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final LOCATION_INFO_PROJECTION:[Ljava/lang/String;

.field private static final LOCATION_INFO_SELECTION:Ljava/lang/String;

.field private static mInstance:Lcom/miui/gallery/data/LocationManager;


# instance fields
.field private final CONNECTOR:Ljava/lang/String;

.field private final SEPARATOR:Ljava/lang/String;

.field private mAddressCache:Lcom/miui/gallery/data/LocationManager$AddressCache;

.field private mMediaGpsInfoStage:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 9

    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    sput-object v0, Lcom/miui/gallery/data/LocationManager;->FIXED_ADDRESS_LOCALE:Ljava/util/Locale;

    const-string v1, "_id"

    const-string v2, "exifGPSLatitude"

    const-string v3, "exifGPSLatitudeRef"

    const-string v4, "exifGPSLongitude"

    const-string v5, "exifGPSLongitudeRef"

    const-string v6, "location"

    const-string v7, "address"

    const-string v8, "extraGPS"

    filled-new-array/range {v1 .. v8}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/data/LocationManager;->LOCATION_INFO_PROJECTION:[Ljava/lang/String;

    const-string v0, "((%s NOT NULL AND %s NOT NULL) or %s NOT NULL)"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "exifGPSLatitude"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "exifGPSLongitude"

    const/4 v4, 0x1

    aput-object v2, v1, v4

    const-string v2, "extraGPS"

    const/4 v5, 0x2

    aput-object v2, v1, v5

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/data/LocationManager;->ALIAS_EXIF_GPS_VALID:Ljava/lang/String;

    const-string v0, "(%s IS NULL)"

    new-array v1, v4, [Ljava/lang/Object;

    const-string v2, "address"

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/data/LocationManager;->ALIAS_LOCATION_INFO_INVALID:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/miui/gallery/data/LocationManager;->ALIAS_EXIF_GPS_VALID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/miui/gallery/data/LocationManager;->ALIAS_LOCATION_INFO_INVALID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/data/LocationManager;->LOCATION_INFO_SELECTION:Ljava/lang/String;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/miui/gallery/data/LocationManager;->INVALID_NAME:Ljava/util/HashMap;

    sget-object v0, Lcom/miui/gallery/data/LocationManager;->INVALID_NAME:Ljava/util/HashMap;

    const-string v1, "\u5947\u7eb3"

    const-string v2, "\u4e2d\u56fd"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/miui/gallery/data/LocationManager$AddressCache;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/data/LocationManager$AddressCache;-><init>(Lcom/miui/gallery/data/LocationManager;Lcom/miui/gallery/data/LocationManager$1;)V

    iput-object v0, p0, Lcom/miui/gallery/data/LocationManager;->mAddressCache:Lcom/miui/gallery/data/LocationManager$AddressCache;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f1004ae

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/data/LocationManager;->SEPARATOR:Ljava/lang/String;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f100064

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/data/LocationManager;->CONNECTOR:Ljava/lang/String;

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/data/LocationManager;->mMediaGpsInfoStage:Ljava/util/Map;

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/data/LocationManager;Landroid/database/Cursor;)Lcom/miui/gallery/data/LocationManager$CloudItem;
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/data/LocationManager;->parseCursor(Landroid/database/Cursor;)Lcom/miui/gallery/data/LocationManager$CloudItem;

    move-result-object p0

    return-object p0
.end method

.method private checkVersionAndUpgrade()V
    .locals 5

    const/4 v0, 0x0

    invoke-static {v0}, Lcom/miui/gallery/preference/GalleryPreferences$LocationManager;->getLocationDetailsVersion(I)I

    move-result v0

    const/4 v1, 0x3

    if-lez v0, :cond_0

    if-ge v0, v1, :cond_0

    invoke-static {}, Lcom/miui/gallery/data/LocationManager;->isSyncable()Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "LocationManager"

    const-string v3, "On clear old addresses due to location manager upgrade"

    invoke-static {v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    const-string v3, "address"

    invoke-virtual {v2, v3}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    sget-object v3, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    const/4 v4, 0x0

    invoke-static {v3, v2, v4, v4}, Lcom/miui/gallery/util/GalleryUtils;->safeUpdate(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    :cond_0
    if-eq v0, v1, :cond_1

    invoke-static {v1}, Lcom/miui/gallery/preference/GalleryPreferences$LocationManager;->setLocationDetailsVersion(I)V

    :cond_1
    return-void
.end method

.method private static ensureAreaLevel(I)I
    .locals 1

    if-nez p0, :cond_0

    const/4 p0, 0x6

    return p0

    :cond_0
    const/16 v0, 0xf

    if-ge p0, v0, :cond_1

    const/4 p0, 0x4

    return p0

    :cond_1
    const/16 v0, 0x3c

    if-ge p0, v0, :cond_2

    const/4 p0, 0x3

    return p0

    :cond_2
    const/4 p0, 0x0

    return p0
.end method

.method private static fixAddressFault(Landroid/location/Address;)Landroid/location/Address;
    .locals 3

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Landroid/location/Address;->getCountryName()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/data/LocationManager;->INVALID_NAME:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_0

    invoke-virtual {p0, v0}, Landroid/location/Address;->setCountryName(Ljava/lang/String;)V

    :cond_0
    invoke-virtual {p0}, Landroid/location/Address;->getThoroughfare()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-lez v1, :cond_1

    const-string v1, "/"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/location/Address;->setThoroughfare(Ljava/lang/String;)V

    :cond_1
    invoke-virtual {p0}, Landroid/location/Address;->getSubThoroughfare()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    if-lez v1, :cond_2

    const-string v1, "/"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/location/Address;->setSubThoroughfare(Ljava/lang/String;)V

    :cond_2
    return-object p0
.end method

.method private static formatAddress(Landroid/location/Address;I)Ljava/lang/String;
    .locals 3

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    invoke-static {p0, v1, p1}, Lcom/miui/gallery/data/LocationManager;->obtainArea(Landroid/location/Address;II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x1

    invoke-static {p0, v1, p1}, Lcom/miui/gallery/data/LocationManager;->obtainArea(Landroid/location/Address;II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x2

    invoke-static {p0, v1, p1}, Lcom/miui/gallery/data/LocationManager;->obtainArea(Landroid/location/Address;II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x3

    invoke-static {p0, v1, p1}, Lcom/miui/gallery/data/LocationManager;->obtainArea(Landroid/location/Address;II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x4

    invoke-static {p0, v1, p1}, Lcom/miui/gallery/data/LocationManager;->obtainArea(Landroid/location/Address;II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x5

    invoke-static {p0, v1, p1}, Lcom/miui/gallery/data/LocationManager;->obtainArea(Landroid/location/Address;II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v2, 0x6

    invoke-static {p0, v2, p1}, Lcom/miui/gallery/data/LocationManager;->obtainArea(Landroid/location/Address;II)Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_1

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static formatAddress(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    :cond_0
    :try_start_0
    invoke-static {p0}, Lcom/miui/gallery/data/LocationManager$AddressParser;->fromJson(Ljava/lang/String;)Landroid/location/Address;

    move-result-object p0

    invoke-static {p1}, Lcom/miui/gallery/data/LocationManager;->getAddressTargetLevel(Ljava/lang/String;)I

    move-result p1

    invoke-static {p0, p1}, Lcom/miui/gallery/data/LocationManager;->formatAddress(Landroid/location/Address;I)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    const-string p1, "LocationManager"

    const-string v1, "formatAddress error."

    invoke-static {p1, v1, p0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v0
.end method

.method public static formatAddress(Lorg/json/JSONArray;Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    const/4 v0, 0x0

    if-eqz p0, :cond_3

    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-gtz v1, :cond_0

    goto :goto_2

    :cond_0
    :try_start_0
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    move-object v3, v0

    :goto_0
    if-ltz v2, :cond_2

    invoke-virtual {p0, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v3

    invoke-static {v1}, Lcom/miui/gallery/data/LocationManager$LocaleParser;->toString(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3}, Lcom/miui/gallery/data/LocationManager$AddressParser;->getLocaleStringFromJson(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    goto :goto_1

    :cond_1
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    :cond_2
    :goto_1
    invoke-static {v3}, Lcom/miui/gallery/data/LocationManager$AddressParser;->fromJson(Lorg/json/JSONObject;)Landroid/location/Address;

    move-result-object p0

    invoke-static {p1}, Lcom/miui/gallery/data/LocationManager;->getAddressTargetLevel(Ljava/lang/String;)I

    move-result p1

    invoke-static {p0, p1}, Lcom/miui/gallery/data/LocationManager;->formatAddress(Landroid/location/Address;I)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    const-string p1, "LocationManager"

    const-string v1, "formatAddress error."

    invoke-static {p1, v1, p0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v0

    :cond_3
    :goto_2
    return-object v0
.end method

.method private formatAreaNames(Ljava/util/List;)Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_1

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1

    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    :goto_0
    add-int/lit8 v4, v0, -0x2

    if-ge v1, v4, :cond_2

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/miui/gallery/data/LocationManager;->SEPARATOR:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    invoke-interface {p1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/data/LocationManager;->CONNECTOR:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sub-int/2addr v0, v2

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public static formatExifGpsString(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "%s,%s"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p0, p2}, Lcom/miui/gallery/data/LocationUtil;->convertRationalLatLonToDouble(Ljava/lang/String;Ljava/lang/String;)D

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    aput-object p0, v1, v2

    const/4 p0, 0x1

    invoke-static {p1, p3}, Lcom/miui/gallery/data/LocationUtil;->convertRationalLatLonToDouble(Ljava/lang/String;Ljava/lang/String;)D

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p1

    aput-object p1, v1, p0

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    const-string p0, ""

    return-object p0
.end method

.method private static formatExtraGpsString(DDJ)Ljava/lang/String;
    .locals 2

    const-string v0, "%s,%s,%s"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    const/4 p1, 0x0

    aput-object p0, v1, p1

    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    const/4 p1, 0x1

    aput-object p0, v1, p1

    invoke-static {p4, p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    const/4 p1, 0x2

    aput-object p0, v1, p1

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private getAddress(Landroid/content/Context;Ljava/util/Locale;Lcom/miui/gallery/data/LocationManager$CloudItem;ZLcom/miui/gallery/data/LocationManager$Statistics;)Landroid/location/Address;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/data/LocationManager;->mAddressCache:Lcom/miui/gallery/data/LocationManager$AddressCache;

    iget-wide v2, p3, Lcom/miui/gallery/data/LocationManager$CloudItem;->lat:D

    iget-wide v4, p3, Lcom/miui/gallery/data/LocationManager$CloudItem;->lng:D

    move-object v1, p2

    invoke-virtual/range {v0 .. v5}, Lcom/miui/gallery/data/LocationManager$AddressCache;->get(Ljava/util/Locale;DD)Lcom/miui/gallery/data/LocationManager$CacheItem;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, v0, Lcom/miui/gallery/data/LocationManager$CacheItem;->address:Landroid/location/Address;

    iget v2, p5, Lcom/miui/gallery/data/LocationManager$Statistics;->cacheHit:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p5, Lcom/miui/gallery/data/LocationManager$Statistics;->cacheHit:I

    iget v2, p5, Lcom/miui/gallery/data/LocationManager$Statistics;->cacheDistance:I

    iget v0, v0, Lcom/miui/gallery/data/LocationManager$CacheItem;->distance:I

    add-int/2addr v2, v0

    iput v2, p5, Lcom/miui/gallery/data/LocationManager$Statistics;->cacheDistance:I

    if-eqz p4, :cond_1

    const-string v0, "LocationManager"

    const-string v2, "cache hit."

    invoke-static {v0, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :cond_1
    :goto_0
    if-nez v1, :cond_3

    new-instance v2, Landroid/location/Geocoder;

    invoke-direct {v2, p1, p2}, Landroid/location/Geocoder;-><init>(Landroid/content/Context;Ljava/util/Locale;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    iget-wide v3, p3, Lcom/miui/gallery/data/LocationManager$CloudItem;->lat:D

    iget-wide v5, p3, Lcom/miui/gallery/data/LocationManager$CloudItem;->lng:D

    const/4 v7, 0x1

    invoke-virtual/range {v2 .. v7}, Landroid/location/Geocoder;->getFromLocation(DDI)Ljava/util/List;

    move-result-object p1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v2, v8

    iget v0, p5, Lcom/miui/gallery/data/LocationManager$Statistics;->cost:I

    int-to-long v4, v0

    add-long/2addr v4, v2

    long-to-int v0, v4

    iput v0, p5, Lcom/miui/gallery/data/LocationManager$Statistics;->cost:I

    if-eqz p4, :cond_2

    const-string p4, "LocationManager"

    const-string p5, "get location cost: %s"

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {p4, p5, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_2
    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result p4

    if-eqz p4, :cond_3

    const/4 p4, 0x0

    invoke-interface {p1, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/location/Address;

    invoke-static {p1}, Lcom/miui/gallery/data/LocationManager;->fixAddressFault(Landroid/location/Address;)Landroid/location/Address;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/data/LocationManager;->mAddressCache:Lcom/miui/gallery/data/LocationManager$AddressCache;

    iget-wide v2, p3, Lcom/miui/gallery/data/LocationManager$CloudItem;->lat:D

    iget-wide v4, p3, Lcom/miui/gallery/data/LocationManager$CloudItem;->lng:D

    move-object v1, p2

    move-object v6, p1

    invoke-virtual/range {v0 .. v6}, Lcom/miui/gallery/data/LocationManager$AddressCache;->put(Ljava/util/Locale;DDLandroid/location/Address;)V

    goto :goto_1

    :cond_3
    move-object p1, v1

    :goto_1
    return-object p1
.end method

.method private getAddressList(Landroid/content/Context;Lcom/miui/gallery/data/LocationManager$CloudItem;ZLcom/miui/gallery/data/LocationManager$Statistics;)Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/miui/gallery/data/LocationManager$CloudItem;",
            "Z",
            "Lcom/miui/gallery/data/LocationManager$Statistics;",
            ")",
            "Ljava/util/List<",
            "Landroid/location/Address;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v6

    move-object v0, p0

    move-object v1, p1

    move-object v2, v6

    move-object v3, p2

    move v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/miui/gallery/data/LocationManager;->getAddress(Landroid/content/Context;Ljava/util/Locale;Lcom/miui/gallery/data/LocationManager$CloudItem;ZLcom/miui/gallery/data/LocationManager$Statistics;)Landroid/location/Address;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_0

    const-string p1, "LocationManager"

    const-string p2, "default address not valid."

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    iget p1, p4, Lcom/miui/gallery/data/LocationManager$Statistics;->addressNull:I

    add-int/2addr p1, v2

    iput p1, p4, Lcom/miui/gallery/data/LocationManager$Statistics;->addressNull:I

    return-object v1

    :cond_0
    sget-boolean v3, Lcom/miui/os/Rom;->IS_INTERNATIONAL:Z

    if-eqz v3, :cond_3

    sget-object v3, Lcom/miui/gallery/data/LocationManager;->FIXED_ADDRESS_LOCALE:Ljava/util/Locale;

    invoke-virtual {v6, v3}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    :cond_1
    sget-object v6, Lcom/miui/gallery/data/LocationManager;->FIXED_ADDRESS_LOCALE:Ljava/util/Locale;

    move-object v4, p0

    move-object v5, p1

    move-object v7, p2

    move v8, p3

    move-object v9, p4

    invoke-direct/range {v4 .. v9}, Lcom/miui/gallery/data/LocationManager;->getAddress(Landroid/content/Context;Ljava/util/Locale;Lcom/miui/gallery/data/LocationManager$CloudItem;ZLcom/miui/gallery/data/LocationManager$Statistics;)Landroid/location/Address;

    move-result-object p1

    if-nez p1, :cond_2

    const-string p1, "LocationManager"

    const-string p2, "fixed address not valid."

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    iget p1, p4, Lcom/miui/gallery/data/LocationManager$Statistics;->addressNull:I

    add-int/2addr p1, v2

    iput p1, p4, Lcom/miui/gallery/data/LocationManager$Statistics;->addressNull:I

    return-object v1

    :cond_2
    const/4 p2, 0x2

    new-array p2, p2, [Landroid/location/Address;

    const/4 p3, 0x0

    aput-object v0, p2, p3

    aput-object p1, p2, v2

    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    return-object p1

    :cond_3
    :goto_0
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method private static getAddressTargetLevel(Ljava/lang/String;)I
    .locals 1

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p0}, Lcom/miui/gallery/data/LocationManager;->parseGpsString(Ljava/lang/String;)Lcom/miui/gallery/data/LocationManager$ExtraGps;

    move-result-object p0

    if-eqz p0, :cond_0

    iget p0, p0, Lcom/miui/gallery/data/LocationManager$ExtraGps;->delayTime:I

    invoke-static {p0}, Lcom/miui/gallery/data/LocationManager;->ensureAreaLevel(I)I

    move-result p0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_0

    :cond_1
    const/4 p0, 0x6

    :goto_0
    return p0
.end method

.method private static getArea(Landroid/location/Address;I)Ljava/lang/String;
    .locals 0

    packed-switch p1, :pswitch_data_0

    const/4 p0, 0x0

    return-object p0

    :pswitch_0
    invoke-virtual {p0}, Landroid/location/Address;->getSubThoroughfare()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_1
    invoke-virtual {p0}, Landroid/location/Address;->getThoroughfare()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_2
    invoke-virtual {p0}, Landroid/location/Address;->getSubLocality()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_3
    invoke-virtual {p0}, Landroid/location/Address;->getLocality()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_4
    invoke-virtual {p0}, Landroid/location/Address;->getSubAdminArea()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_5
    invoke-virtual {p0}, Landroid/location/Address;->getAdminArea()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_6
    invoke-virtual {p0}, Landroid/location/Address;->getCountryName()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static declared-synchronized getInstance()Lcom/miui/gallery/data/LocationManager;
    .locals 2

    const-class v0, Lcom/miui/gallery/data/LocationManager;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/data/LocationManager;->mInstance:Lcom/miui/gallery/data/LocationManager;

    if-nez v1, :cond_0

    new-instance v1, Lcom/miui/gallery/data/LocationManager;

    invoke-direct {v1}, Lcom/miui/gallery/data/LocationManager;-><init>()V

    sput-object v1, Lcom/miui/gallery/data/LocationManager;->mInstance:Lcom/miui/gallery/data/LocationManager;

    :cond_0
    sget-object v1, Lcom/miui/gallery/data/LocationManager;->mInstance:Lcom/miui/gallery/data/LocationManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private static getNamesOfArea([[Ljava/lang/String;IILjava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([[",
            "Ljava/lang/String;",
            "II",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p3}, Ljava/util/List;->clear()V

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p1, :cond_1

    aget-object v1, p0, v0

    array-length v1, v1

    const/4 v2, 0x6

    if-ne v1, v2, :cond_0

    aget-object v1, p0, v0

    aget-object v1, v1, p2

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-interface {p3, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-interface {p3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private static isLatLngValid(DD)Z
    .locals 3

    const-wide v0, -0x3fa9800000000000L    # -90.0

    cmpl-double v2, p0, v0

    if-ltz v2, :cond_0

    const-wide v0, 0x4056800000000000L    # 90.0

    cmpg-double v2, p0, v0

    if-gtz v2, :cond_0

    const-wide p0, -0x3f99800000000000L    # -180.0

    cmpl-double v0, p2, p0

    if-ltz v0, :cond_0

    const-wide p0, 0x4066800000000000L    # 180.0

    cmpg-double v0, p2, p0

    if-gtz v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private isNetworkAvailable()Z
    .locals 1

    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isNetworkConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isActiveNetworkMetered()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static isSyncable()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method private loadLocationForItem(Landroid/content/Context;Lcom/miui/gallery/data/LocationManager$CloudItem;ZLcom/miui/gallery/data/LocationManager$Statistics;)Z
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    if-nez p4, :cond_0

    new-instance p4, Lcom/miui/gallery/data/LocationManager$Statistics;

    const/4 v0, 0x0

    invoke-direct {p4, p0, v0}, Lcom/miui/gallery/data/LocationManager$Statistics;-><init>(Lcom/miui/gallery/data/LocationManager;Lcom/miui/gallery/data/LocationManager$1;)V

    :cond_0
    iget-wide v0, p2, Lcom/miui/gallery/data/LocationManager$CloudItem;->lat:D

    iget-wide v2, p2, Lcom/miui/gallery/data/LocationManager$CloudItem;->lng:D

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/data/LocationManager;->isLatLngValid(DD)Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_1

    const-string p1, "LocationManager"

    const-string p2, "Lat or lng not valid."

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    iget p1, p4, Lcom/miui/gallery/data/LocationManager$Statistics;->latLngInvalid:I

    add-int/2addr p1, v2

    iput p1, p4, Lcom/miui/gallery/data/LocationManager$Statistics;->latLngInvalid:I

    return v1

    :cond_1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/miui/gallery/data/LocationManager;->getAddressList(Landroid/content/Context;Lcom/miui/gallery/data/LocationManager$CloudItem;ZLcom/miui/gallery/data/LocationManager$Statistics;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v3

    if-nez v3, :cond_2

    return v1

    :cond_2
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/location/Address;

    iget v4, p2, Lcom/miui/gallery/data/LocationManager$CloudItem;->delayTime:I

    invoke-static {v4}, Lcom/miui/gallery/data/LocationManager;->ensureAreaLevel(I)I

    move-result v4

    invoke-static {v3, v4}, Lcom/miui/gallery/data/LocationManager;->formatAddress(Landroid/location/Address;I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0}, Lcom/miui/gallery/data/LocationManager$AddressParser;->toJson(Ljava/util/List;)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/miui/gallery/data/LocationManager;->isSyncable()Z

    move-result v4

    if-nez v4, :cond_5

    new-instance p3, Landroid/content/ContentValues;

    invoke-direct {p3}, Landroid/content/ContentValues;-><init>()V

    const-string v4, "location"

    invoke-virtual {p3, v4, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "address"

    invoke-virtual {p3, v3, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    const-string v3, "_id=?"

    new-array v4, v2, [Ljava/lang/String;

    iget-wide v5, p2, Lcom/miui/gallery/data/LocationManager$CloudItem;->id:J

    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p2

    aput-object p2, v4, v1

    invoke-static {p1, v0, p3, v3, v4}, Lcom/miui/gallery/util/SafeDBUtil;->safeUpdate(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p1

    if-lez p1, :cond_3

    const/4 v1, 0x1

    :cond_3
    if-nez v1, :cond_4

    const-string p1, "LocationManager"

    const-string p2, "Save location info failed."

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    iget p1, p4, Lcom/miui/gallery/data/LocationManager$Statistics;->saveFail:I

    add-int/2addr p1, v2

    iput p1, p4, Lcom/miui/gallery/data/LocationManager$Statistics;->saveFail:I

    :cond_4
    return v1

    :cond_5
    const-string v4, ""

    const/4 v5, 0x3

    const/4 v6, 0x2

    const/4 v7, 0x4

    if-eqz p3, :cond_7

    new-instance p3, Landroid/content/ContentValues;

    invoke-direct {p3}, Landroid/content/ContentValues;-><init>()V

    const-string v8, "location"

    invoke-virtual {p3, v8, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "address"

    invoke-virtual {p3, v3, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    const-string v3, "_id=?"

    new-array v8, v2, [Ljava/lang/String;

    iget-wide v9, p2, Lcom/miui/gallery/data/LocationManager$CloudItem;->id:J

    invoke-static {v9, v10}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v1

    invoke-static {p1, v0, p3, v3, v8}, Lcom/miui/gallery/util/SafeDBUtil;->safeUpdate(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p1

    if-lez p1, :cond_6

    goto :goto_0

    :cond_6
    const/4 p1, 0x0

    goto :goto_1

    :cond_7
    const-string p1, "%s=%s, %s=%s,"

    new-array p3, v7, [Ljava/lang/Object;

    const-string v4, "location"

    aput-object v4, p3, v1

    invoke-static {v3}, Landroid/database/DatabaseUtils;->sqlEscapeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, p3, v2

    const-string v3, "address"

    aput-object v3, p3, v6

    invoke-static {v0}, Landroid/database/DatabaseUtils;->sqlEscapeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    aput-object v0, p3, v5

    invoke-static {p1, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    :goto_0
    const/4 p1, 0x1

    :goto_1
    if-nez p1, :cond_8

    const-string p1, "LocationManager"

    const-string p2, "Save location info failed."

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    iget p1, p4, Lcom/miui/gallery/data/LocationManager$Statistics;->saveFail:I

    add-int/2addr p1, v2

    iput p1, p4, Lcom/miui/gallery/data/LocationManager$Statistics;->saveFail:I

    return v1

    :cond_8
    const/16 p1, 0x46

    invoke-static {p1}, Lcom/miui/gallery/cloud/GalleryCloudUtils;->transformToEditedColumnsElement(I)Ljava/lang/String;

    move-result-object p1

    const-string p3, "update %s set %s %s=coalesce(replace(%s, \'%s\', \'\') || \'%s\', \'%s\') where %s=%s"

    const/16 v0, 0x9

    new-array v0, v0, [Ljava/lang/Object;

    const-string v3, "cloud"

    aput-object v3, v0, v1

    aput-object v4, v0, v2

    const-string v1, "editedColumns"

    aput-object v1, v0, v6

    const-string v1, "editedColumns"

    aput-object v1, v0, v5

    aput-object p1, v0, v7

    const/4 v1, 0x5

    aput-object p1, v0, v1

    const/4 v1, 0x6

    aput-object p1, v0, v1

    const/4 p1, 0x7

    const-string v1, "_id"

    aput-object v1, v0, p1

    const/16 p1, 0x8

    iget-wide v3, p2, Lcom/miui/gallery/data/LocationManager$CloudItem;->id:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    aput-object p2, v0, p1

    invoke-static {p3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/GalleryUtils;->safeExec(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_9

    const-string p2, "LocationManager"

    const-string p3, "Save location info and update edited column failed."

    invoke-static {p2, p3}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    iget p2, p4, Lcom/miui/gallery/data/LocationManager$Statistics;->saveFail:I

    add-int/2addr p2, v2

    iput p2, p4, Lcom/miui/gallery/data/LocationManager$Statistics;->saveFail:I

    :cond_9
    return p1
.end method

.method private static obtainArea(Landroid/location/Address;II)Ljava/lang/String;
    .locals 0

    if-gt p1, p2, :cond_0

    invoke-static {p0, p1}, Lcom/miui/gallery/data/LocationManager;->getArea(Landroid/location/Address;I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/miui/gallery/data/LocationManager;->obtainString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    const-string p0, ""

    return-object p0
.end method

.method private static obtainString(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const-string v0, ""

    invoke-static {p0, v0}, Lcom/miui/gallery/data/LocationManager;->obtainString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static obtainString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    if-nez p0, :cond_0

    move-object p0, p1

    :cond_0
    return-object p0
.end method

.method private parseCursor(Landroid/database/Cursor;)Lcom/miui/gallery/data/LocationManager$CloudItem;
    .locals 6

    new-instance v0, Lcom/miui/gallery/data/LocationManager$CloudItem;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/data/LocationManager$CloudItem;-><init>(Lcom/miui/gallery/data/LocationManager;Lcom/miui/gallery/data/LocationManager$1;)V

    const/4 v1, 0x0

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    int-to-long v1, v1

    iput-wide v1, v0, Lcom/miui/gallery/data/LocationManager$CloudItem;->id:J

    const/4 v1, 0x5

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/data/LocationManager$CloudItem;->location:Ljava/lang/String;

    const/4 v1, 0x6

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/data/LocationManager$CloudItem;->address:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x4

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x7

    invoke-interface {p1, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    invoke-static {v1, v2}, Lcom/miui/gallery/data/LocationUtil;->convertRationalLatLonToDouble(Ljava/lang/String;Ljava/lang/String;)D

    move-result-wide v1

    iput-wide v1, v0, Lcom/miui/gallery/data/LocationManager$CloudItem;->lat:D

    invoke-static {v3, v4}, Lcom/miui/gallery/data/LocationUtil;->convertRationalLatLonToDouble(Ljava/lang/String;Ljava/lang/String;)D

    move-result-wide v1

    iput-wide v1, v0, Lcom/miui/gallery/data/LocationManager$CloudItem;->lng:D

    goto :goto_0

    :cond_0
    invoke-static {p1}, Lcom/miui/gallery/data/LocationManager;->parseGpsString(Ljava/lang/String;)Lcom/miui/gallery/data/LocationManager$ExtraGps;

    move-result-object p1

    if-eqz p1, :cond_1

    iget v1, p1, Lcom/miui/gallery/data/LocationManager$ExtraGps;->lat:F

    float-to-double v1, v1

    iput-wide v1, v0, Lcom/miui/gallery/data/LocationManager$CloudItem;->lat:D

    iget v1, p1, Lcom/miui/gallery/data/LocationManager$ExtraGps;->lng:F

    float-to-double v1, v1

    iput-wide v1, v0, Lcom/miui/gallery/data/LocationManager$CloudItem;->lng:D

    iget p1, p1, Lcom/miui/gallery/data/LocationManager$ExtraGps;->delayTime:I

    iput p1, v0, Lcom/miui/gallery/data/LocationManager$CloudItem;->delayTime:I

    :cond_1
    :goto_0
    return-object v0
.end method

.method private static parseGpsString(Ljava/lang/String;)Lcom/miui/gallery/data/LocationManager$ExtraGps;
    .locals 5

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    :cond_0
    const-string v0, ","

    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    array-length v0, p0

    const/4 v2, 0x2

    if-eq v0, v2, :cond_1

    const/4 v3, 0x3

    if-eq v0, v3, :cond_1

    return-object v1

    :cond_1
    new-instance v3, Lcom/miui/gallery/data/LocationManager$ExtraGps;

    invoke-direct {v3, v1}, Lcom/miui/gallery/data/LocationManager$ExtraGps;-><init>(Lcom/miui/gallery/data/LocationManager$1;)V

    const/4 v4, 0x0

    :try_start_0
    aget-object v4, p0, v4

    invoke-static {v4}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    iput v4, v3, Lcom/miui/gallery/data/LocationManager$ExtraGps;->lat:F

    const/4 v4, 0x1

    aget-object v4, p0, v4

    invoke-static {v4}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    iput v4, v3, Lcom/miui/gallery/data/LocationManager$ExtraGps;->lng:F

    if-le v0, v2, :cond_2

    aget-object p0, p0, v2

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    iput p0, v3, Lcom/miui/gallery/data/LocationManager$ExtraGps;->delayTime:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_2
    return-object v3

    :catch_0
    return-object v1
.end method

.method private static recordStatistics(Lcom/miui/gallery/data/LocationManager$Statistics;)V
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "count"

    iget v2, p0, Lcom/miui/gallery/data/LocationManager$Statistics;->count:I

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "error"

    iget v2, p0, Lcom/miui/gallery/data/LocationManager$Statistics;->error:I

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "costAvg"

    invoke-virtual {p0}, Lcom/miui/gallery/data/LocationManager$Statistics;->getAverageCost()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "totalTime"

    invoke-virtual {p0}, Lcom/miui/gallery/data/LocationManager$Statistics;->getTotalTime()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "cacheHitPercent"

    invoke-virtual {p0}, Lcom/miui/gallery/data/LocationManager$Statistics;->getCacheHitPercent()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "cacheAvgDistance"

    invoke-virtual {p0}, Lcom/miui/gallery/data/LocationManager$Statistics;->getAvgCacheDistance()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "latLngInvalid"

    iget v2, p0, Lcom/miui/gallery/data/LocationManager$Statistics;->latLngInvalid:I

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "addressNull"

    iget v2, p0, Lcom/miui/gallery/data/LocationManager$Statistics;->addressNull:I

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "saveFail"

    iget p0, p0, Lcom/miui/gallery/data/LocationManager$Statistics;->saveFail:I

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "LocationManager"

    const-string v1, "loadLocations: %s"

    invoke-virtual {v0}, Ljava/util/HashMap;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const-string p0, "location_manager"

    const-string v1, "location_manager_load_stat"

    invoke-static {p0, v1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static segmentLocation(Ljava/lang/String;)[Ljava/lang/String;
    .locals 3

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    :cond_0
    const-string v1, "/"

    const/4 v2, -0x1

    invoke-virtual {p0, v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object p0

    array-length v1, p0

    const/4 v2, 0x1

    if-eq v1, v2, :cond_1

    array-length v1, p0

    const/4 v2, 0x6

    if-eq v1, v2, :cond_1

    const-string v1, "LocationManager"

    const-string v2, "the length of location is not correct. %s"

    array-length p0, p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-static {v1, v2, p0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v0

    :cond_1
    return-object p0
.end method


# virtual methods
.method public appendDefaultLocationValues(Landroid/content/ContentValues;)V
    .locals 10

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "exifGPSLatitude"

    invoke-virtual {p1, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "exifGPSLatitudeRef"

    invoke-virtual {p1, v2}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "exifGPSLongitude"

    invoke-virtual {p1, v3}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "exifGPSLongitudeRef"

    invoke-virtual {p1, v4}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "extraGPS"

    invoke-virtual {p1, v5}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    const/4 v7, 0x1

    const-wide/16 v8, 0x0

    if-nez v6, :cond_0

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_0

    invoke-static {v1, v2}, Lcom/miui/gallery/data/LocationUtil;->convertRationalLatLonToDouble(Ljava/lang/String;Ljava/lang/String;)D

    move-result-wide v8

    invoke-static {v3, v4}, Lcom/miui/gallery/data/LocationUtil;->convertRationalLatLonToDouble(Ljava/lang/String;Ljava/lang/String;)D

    move-result-wide v1

    goto :goto_0

    :cond_0
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-static {v5}, Lcom/miui/gallery/data/LocationManager;->parseGpsString(Ljava/lang/String;)Lcom/miui/gallery/data/LocationManager$ExtraGps;

    move-result-object v1

    if-eqz v1, :cond_1

    iget v2, v1, Lcom/miui/gallery/data/LocationManager$ExtraGps;->lat:F

    float-to-double v8, v2

    iget v1, v1, Lcom/miui/gallery/data/LocationManager$ExtraGps;->lng:F

    float-to-double v1, v1

    goto :goto_0

    :cond_1
    const/4 v7, 0x0

    move-wide v1, v8

    :goto_0
    if-eqz v7, :cond_2

    invoke-static {}, Lcom/miui/gallery/data/CitySearcher;->getInstance()Lcom/miui/gallery/data/CitySearcher;

    move-result-object v3

    new-instance v4, Lcom/miui/gallery/data/Coordinate;

    invoke-direct {v4, v8, v9, v1, v2}, Lcom/miui/gallery/data/Coordinate;-><init>(DD)V

    invoke-virtual {v3, v4}, Lcom/miui/gallery/data/CitySearcher;->decode(Lcom/miui/gallery/data/Coordinate;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/data/LocationUtil;->isLocationValidate(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    const-string v2, "location"

    invoke-static {v0, v1}, Lcom/miui/gallery/data/LocationUtil;->getCityNameFromRes(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    return-void
.end method

.method public appendExtraGpsInfo(Ljava/lang/String;Landroid/content/ContentValues;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/data/LocationManager;->mMediaGpsInfoStage:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-nez p1, :cond_0

    return-void

    :cond_0
    const-string v0, "exifGPSLatitude"

    invoke-virtual {p2, v0}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "exifGPSLongitude"

    invoke-virtual {p2, v1}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    const-string v0, "extraGPS"

    invoke-virtual {p2, v0, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    return-void
.end method

.method public generateTitleLine(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v0}, Lcom/miui/gallery/data/LocationManager;->generateTitleLine(Ljava/util/List;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_1
    :goto_0
    return-object p1
.end method

.method public generateTitleLine(Ljava/util/List;)Ljava/lang/String;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    new-array v1, v0, [[Ljava/lang/String;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_0
    const/4 v6, 0x1

    if-ge v3, v0, :cond_3

    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Lcom/miui/gallery/data/LocationManager;->segmentLocation(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_2

    add-int/lit8 v8, v5, 0x1

    aput-object v7, v1, v5

    array-length v5, v7

    if-le v5, v6, :cond_1

    goto :goto_1

    :cond_1
    const/4 v6, 0x0

    :goto_1
    or-int/2addr v4, v6

    move v5, v8

    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_3
    if-nez v4, :cond_7

    const-string p1, ""

    move-object v0, p1

    const/4 p1, 0x0

    :goto_2
    if-ge p1, v5, :cond_6

    aget-object v3, v1, p1

    aget-object v3, v3, v2

    invoke-static {v3}, Lcom/miui/gallery/data/LocationUtil;->isLocationValidate(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_5

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_4

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/miui/gallery/data/LocationManager;->SEPARATOR:Ljava/lang/String;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_4
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_5
    add-int/lit8 p1, p1, 0x1

    goto :goto_2

    :cond_6
    return-object v0

    :cond_7
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v5}, Ljava/util/ArrayList;-><init>(I)V

    const-string v3, ""

    move-object v4, v3

    const/4 v3, 0x0

    :goto_3
    const/4 v7, 0x6

    if-ge v3, v7, :cond_e

    invoke-static {v1, v5, v3, v0}, Lcom/miui/gallery/data/LocationManager;->getNamesOfArea([[Ljava/lang/String;IILjava/util/List;)V

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v7

    if-le v7, v6, :cond_9

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    if-lez v1, :cond_8

    const-string v1, "-"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_8
    invoke-direct {p0, v0}, Lcom/miui/gallery/data/LocationManager;->formatAreaNames(Ljava/util/List;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_9
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v7

    if-ne v7, v6, :cond_d

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_a

    goto :goto_5

    :cond_a
    if-nez v3, :cond_b

    const-string v4, "\u4e2d\u56fd"

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_b

    goto :goto_4

    :cond_b
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-lez v4, :cond_c

    iget-object v4, p0, Lcom/miui/gallery/data/LocationManager;->SEPARATOR:Ljava/lang/String;

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_c
    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_4
    move-object v4, v7

    :cond_d
    :goto_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    :cond_e
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public loadAllLocation()V
    .locals 9

    invoke-static {}, Landroid/location/Geocoder;->isPresent()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->generatorCommonParams()Ljava/util/Map;

    move-result-object v0

    const-string v1, "location_manager"

    const-string v2, "location_manager_geocoder_error"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    const-string v0, "LocationManager"

    const-string v1, "loadAllLocation, geocoder is not present."

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    const-string v0, "LocationManager"

    const-string v1, "loadAllLocation starts"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/miui/gallery/data/LocationManager;->checkVersionAndUpgrade()V

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$CTA;->canConnectNetwork()Z

    move-result v1

    if-nez v1, :cond_1

    const-string v0, "LocationManager"

    const-string v1, "CTA is not available"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/data/LocationManager;->isNetworkAvailable()Z

    move-result v1

    if-nez v1, :cond_2

    const-string v0, "LocationManager"

    const-string v1, "Network is not available"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_2
    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getLocationStrategy()Lcom/miui/gallery/cloudcontrol/strategies/LocationStrategy;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/cloudcontrol/strategies/LocationStrategy;->getDailyUpdateLimit()I

    move-result v1

    if-gtz v1, :cond_3

    const-string v0, "LocationManager"

    const-string v1, "CloudControl limit is 0"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_3
    sget-object v2, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    invoke-static {v2, v1}, Lcom/miui/gallery/util/UriUtil;->appendLimit(Landroid/net/Uri;I)Landroid/net/Uri;

    move-result-object v3

    sget-object v4, Lcom/miui/gallery/data/LocationManager;->LOCATION_INFO_PROJECTION:[Ljava/lang/String;

    sget-object v5, Lcom/miui/gallery/data/LocationManager;->LOCATION_INFO_SELECTION:Ljava/lang/String;

    const/4 v6, 0x0

    const-string v7, "mixedDateTime DESC"

    new-instance v8, Lcom/miui/gallery/data/LocationManager$1;

    invoke-direct {v8, p0}, Lcom/miui/gallery/data/LocationManager$1;-><init>(Lcom/miui/gallery/data/LocationManager;)V

    move-object v2, v0

    invoke-static/range {v2 .. v8}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/ArrayList;

    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_8

    const-string v2, "LocationManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "loadAllLocation size:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v2, Lcom/miui/gallery/data/LocationManager$Statistics;

    const/4 v4, 0x0

    invoke-direct {v2, p0, v4}, Lcom/miui/gallery/data/LocationManager$Statistics;-><init>(Lcom/miui/gallery/data/LocationManager;Lcom/miui/gallery/data/LocationManager$1;)V

    invoke-virtual {v2}, Lcom/miui/gallery/data/LocationManager$Statistics;->start()V

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    iput v4, v2, Lcom/miui/gallery/data/LocationManager$Statistics;->count:I

    :try_start_0
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    const/4 v4, 0x0

    :goto_0
    :try_start_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/miui/gallery/data/LocationManager$CloudItem;

    invoke-direct {p0}, Lcom/miui/gallery/data/LocationManager;->isNetworkAvailable()Z

    move-result v6

    if-nez v6, :cond_4

    const-string v1, "LocationManager"

    const-string v3, "Network is not available"

    invoke-static {v1, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :cond_4
    invoke-direct {p0, v0, v5, v3, v2}, Lcom/miui/gallery/data/LocationManager;->loadLocationForItem(Landroid/content/Context;Lcom/miui/gallery/data/LocationManager$CloudItem;ZLcom/miui/gallery/data/LocationManager$Statistics;)Z

    move-result v5

    if-eqz v5, :cond_5

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_5
    iget v5, v2, Lcom/miui/gallery/data/LocationManager$Statistics;->error:I

    add-int/lit8 v5, v5, 0x1

    iput v5, v2, Lcom/miui/gallery/data/LocationManager$Statistics;->error:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    goto :goto_1

    :catch_1
    move-exception v1

    const/4 v4, 0x0

    :goto_1
    const-string v3, "LocationManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "loadAllLocation occur exception:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_6
    :goto_2
    move v3, v4

    if-gtz v3, :cond_7

    iget v1, v2, Lcom/miui/gallery/data/LocationManager$Statistics;->error:I

    if-lez v1, :cond_8

    :cond_7
    invoke-static {v2}, Lcom/miui/gallery/data/LocationManager;->recordStatistics(Lcom/miui/gallery/data/LocationManager$Statistics;)V

    if-lez v3, :cond_8

    invoke-static {}, Lcom/miui/gallery/data/LocationManager;->isSyncable()Z

    move-result v1

    if-eqz v1, :cond_8

    new-instance v1, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    invoke-direct {v1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;-><init>()V

    sget-object v2, Lcom/miui/gallery/cloud/base/SyncType;->NORMAL:Lcom/miui/gallery/cloud/base/SyncType;

    invoke-virtual {v1, v2}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setSyncType(Lcom/miui/gallery/cloud/base/SyncType;)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object v1

    const-wide/16 v4, 0x20

    invoke-virtual {v1, v4, v5}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setSyncReason(J)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->build()Lcom/miui/gallery/cloud/base/SyncRequest;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/SyncUtil;->requestSync(Landroid/content/Context;Lcom/miui/gallery/cloud/base/SyncRequest;)V

    :cond_8
    const-string v0, "LocationManager"

    const-string v1, "loadAllLocation success %s"

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public loadLocation(J)V
    .locals 9

    invoke-static {}, Landroid/location/Geocoder;->isPresent()Z

    move-result v0

    if-nez v0, :cond_0

    const-string p1, "LocationManager"

    const-string p2, "loadLocation, geocoder is not present."

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$CTA;->canConnectNetwork()Z

    move-result v0

    if-nez v0, :cond_1

    const-string p1, "LocationManager"

    const-string p2, "CTA is not available"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isNetworkConnected()Z

    move-result v0

    if-nez v0, :cond_2

    const-string p1, "LocationManager"

    const-string p2, "Network is not available"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_2
    sget-object v1, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    sget-object v2, Lcom/miui/gallery/data/LocationManager;->LOCATION_INFO_PROJECTION:[Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "_id=? AND "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Lcom/miui/gallery/data/LocationManager;->LOCATION_INFO_SELECTION:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v8, 0x1

    new-array v4, v8, [Ljava/lang/String;

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    aput-object p1, v4, p2

    const/4 v5, 0x0

    new-instance v6, Lcom/miui/gallery/data/LocationManager$3;

    invoke-direct {v6, p0}, Lcom/miui/gallery/data/LocationManager$3;-><init>(Lcom/miui/gallery/data/LocationManager;)V

    move-object v0, v7

    invoke-static/range {v0 .. v6}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/data/LocationManager$CloudItem;

    if-eqz p1, :cond_3

    const/4 v0, 0x0

    :try_start_0
    invoke-direct {p0, v7, p1, v8, v0}, Lcom/miui/gallery/data/LocationManager;->loadLocationForItem(Landroid/content/Context;Lcom/miui/gallery/data/LocationManager$CloudItem;ZLcom/miui/gallery/data/LocationManager$Statistics;)Z

    move-result p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "LocationManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "loadLocation occur exception:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    const/4 p1, 0x0

    :goto_0
    const-string p2, "LocationManager"

    const-string v0, "loadLocation success %s"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-static {p2, v0, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public loadLocationAsync(J)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getNetworkPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/data/LocationManager$2;

    invoke-direct {v1, p0, p1, p2}, Lcom/miui/gallery/data/LocationManager$2;-><init>(Lcom/miui/gallery/data/LocationManager;J)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    return-void
.end method

.method public recordMediaLocation(Ljava/lang/String;Landroid/content/Intent;)V
    .locals 11

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_9

    if-nez p2, :cond_0

    goto/16 :goto_2

    :cond_0
    const-string v0, "extra_cache_location"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/location/Location;

    const-string v1, "extra_location_option"

    invoke-virtual {p2, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    const-string v1, "extra_cache_location"

    invoke-virtual {p2, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v1

    const-string v2, "extra_location_option"

    const/4 v3, 0x1

    invoke-virtual {p2, v2, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p2

    const/4 v2, 0x2

    const/4 v4, 0x3

    const/4 v5, 0x0

    if-eqz v1, :cond_3

    if-eqz p2, :cond_2

    if-nez v0, :cond_1

    const/4 v6, 0x3

    goto :goto_0

    :cond_1
    const/4 v6, 0x2

    goto :goto_0

    :cond_2
    const/4 v6, 0x1

    goto :goto_0

    :cond_3
    const/4 v6, 0x0

    :goto_0
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    const-string v8, "status"

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v8, "location_manager"

    const-string v9, "location_manager_gps_status"

    invoke-static {v8, v9, v7}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    const-string v7, "LocationManager"

    const-string v8, "record location| no location: %s, cache Location not null: %s, option: %s, result: %s"

    const/4 v9, 0x4

    new-array v9, v9, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    aput-object v1, v9, v5

    if-eqz v0, :cond_4

    const/4 v5, 0x1

    :cond_4
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    aput-object v1, v9, v3

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    aput-object p2, v9, v2

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    aput-object p2, v9, v4

    invoke-static {v7, v8, v9}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_5
    if-nez v0, :cond_6

    return-void

    :cond_6
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtimeNanos()J

    move-result-wide v1

    invoke-virtual {v0}, Landroid/location/Location;->getElapsedRealtimeNanos()J

    move-result-wide v3

    sub-long/2addr v1, v3

    const-wide v3, 0xdf8475800L

    div-long v9, v1, v3

    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    const-string v1, "delay"

    invoke-static {v9, v10}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "location_manager"

    const-string v2, "location_manager_gps_delay_min"

    invoke-static {v1, v2, p2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    const-wide/16 v1, 0x0

    cmp-long p2, v9, v1

    if-ltz p2, :cond_8

    const-wide/16 v1, 0x3c

    cmp-long p2, v9, v1

    if-lez p2, :cond_7

    goto :goto_1

    :cond_7
    const-string p2, "LocationManager"

    const-string v1, "record location| delay %s min"

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {p2, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v0}, Landroid/location/Location;->getLatitude()D

    move-result-wide v5

    invoke-virtual {v0}, Landroid/location/Location;->getLongitude()D

    move-result-wide v7

    invoke-static/range {v5 .. v10}, Lcom/miui/gallery/data/LocationManager;->formatExtraGpsString(DDJ)Ljava/lang/String;

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/data/LocationManager;->mMediaGpsInfoStage:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_8
    :goto_1
    const-string p1, "LocationManager"

    const-string p2, "record location out of date %s min"

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    :cond_9
    :goto_2
    const-string p1, "LocationManager"

    const-string p2, "recordMediaLocation path or intent null"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public subToCity(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    invoke-static {}, Lmiui/util/Pools;->getStringBuilderPool()Lmiui/util/Pools$Pool;

    move-result-object v0

    invoke-interface {v0}, Lmiui/util/Pools$Pool;->acquire()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/StringBuilder;

    invoke-static {p1}, Lcom/miui/gallery/data/LocationManager;->segmentLocation(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_1

    array-length v1, p1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v1, v3, :cond_0

    const-string v1, "\u4e2d\u56fd"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object p1, p1, v2

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    :cond_0
    const/4 v1, 0x3

    array-length v3, p1

    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    move-result v1

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, p1, v2

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result p1

    if-nez p1, :cond_2

    const/4 p1, 0x0

    goto :goto_2

    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_2
    invoke-static {}, Lmiui/util/Pools;->getStringBuilderPool()Lmiui/util/Pools$Pool;

    move-result-object v1

    invoke-interface {v1, v0}, Lmiui/util/Pools$Pool;->release(Ljava/lang/Object;)V

    return-object p1
.end method
