.class Lcom/miui/gallery/data/LocationManager$AddressCache;
.super Ljava/util/ArrayList;
.source "LocationManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/data/LocationManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AddressCache"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/ArrayList<",
        "Lcom/miui/gallery/data/LocationManager$CacheItem;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/data/LocationManager;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/data/LocationManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/data/LocationManager$AddressCache;->this$0:Lcom/miui/gallery/data/LocationManager;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/data/LocationManager;Lcom/miui/gallery/data/LocationManager$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/data/LocationManager$AddressCache;-><init>(Lcom/miui/gallery/data/LocationManager;)V

    return-void
.end method

.method private distance(DDDD)D
    .locals 4

    const-wide v0, 0x3f91df46a2529d39L    # 0.017453292519943295

    mul-double p1, p1, v0

    mul-double p5, p5, v0

    mul-double p3, p3, v0

    mul-double p7, p7, v0

    invoke-static {p1, p2}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    invoke-static {p5, p6}, Ljava/lang/Math;->sin(D)D

    move-result-wide v2

    mul-double v0, v0, v2

    invoke-static {p1, p2}, Ljava/lang/Math;->cos(D)D

    move-result-wide p1

    invoke-static {p5, p6}, Ljava/lang/Math;->cos(D)D

    move-result-wide p5

    mul-double p1, p1, p5

    sub-double/2addr p7, p3

    invoke-static {p7, p8}, Ljava/lang/Math;->cos(D)D

    move-result-wide p3

    mul-double p1, p1, p3

    add-double/2addr v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->acos(D)D

    move-result-wide p1

    const-wide p3, 0x40b8e30000000000L    # 6371.0

    mul-double p1, p1, p3

    const-wide p3, 0x408f400000000000L    # 1000.0

    mul-double p1, p1, p3

    return-wide p1
.end method


# virtual methods
.method public declared-synchronized get(Ljava/util/Locale;DD)Lcom/miui/gallery/data/LocationManager$CacheItem;
    .locals 14

    move-object v10, p0

    move-object v0, p1

    monitor-enter p0

    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p0}, Lcom/miui/gallery/data/LocationManager$AddressCache;->size()I

    move-result v11

    const/4 v12, 0x0

    :goto_0
    if-ge v12, v11, :cond_2

    invoke-virtual {p0, v12}, Lcom/miui/gallery/data/LocationManager$AddressCache;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v13, v1

    check-cast v13, Lcom/miui/gallery/data/LocationManager$CacheItem;

    if-eqz v0, :cond_0

    iget-object v1, v13, Lcom/miui/gallery/data/LocationManager$CacheItem;->locale:Ljava/util/Locale;

    if-eqz v1, :cond_0

    iget-object v1, v13, Lcom/miui/gallery/data/LocationManager$CacheItem;->locale:Ljava/util/Locale;

    invoke-virtual {p1, v1}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_1

    :cond_0
    iget-wide v2, v13, Lcom/miui/gallery/data/LocationManager$CacheItem;->lat:D

    iget-wide v4, v13, Lcom/miui/gallery/data/LocationManager$CacheItem;->lng:D

    move-object v1, p0

    move-wide/from16 v6, p2

    move-wide/from16 v8, p4

    invoke-direct/range {v1 .. v9}, Lcom/miui/gallery/data/LocationManager$AddressCache;->distance(DDDD)D

    move-result-wide v1

    const-wide/high16 v3, 0x4049000000000000L    # 50.0

    cmpg-double v5, v1, v3

    if-gez v5, :cond_1

    double-to-int v0, v1

    iput v0, v13, Lcom/miui/gallery/data/LocationManager$CacheItem;->distance:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v13

    :cond_1
    :goto_1
    add-int/lit8 v12, v12, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized put(Ljava/util/Locale;DDLandroid/location/Address;)V
    .locals 3

    monitor-enter p0

    if-nez p6, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_0
    new-instance v0, Lcom/miui/gallery/data/LocationManager$CacheItem;

    iget-object v1, p0, Lcom/miui/gallery/data/LocationManager$AddressCache;->this$0:Lcom/miui/gallery/data/LocationManager;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/data/LocationManager$CacheItem;-><init>(Lcom/miui/gallery/data/LocationManager;Lcom/miui/gallery/data/LocationManager$1;)V

    iput-object p1, v0, Lcom/miui/gallery/data/LocationManager$CacheItem;->locale:Ljava/util/Locale;

    iput-wide p2, v0, Lcom/miui/gallery/data/LocationManager$CacheItem;->lat:D

    iput-wide p4, v0, Lcom/miui/gallery/data/LocationManager$CacheItem;->lng:D

    iput-object p6, v0, Lcom/miui/gallery/data/LocationManager$CacheItem;->address:Landroid/location/Address;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/data/LocationManager$AddressCache;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
