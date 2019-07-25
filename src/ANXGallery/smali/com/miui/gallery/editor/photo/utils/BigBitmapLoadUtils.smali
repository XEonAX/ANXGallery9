.class public Lcom/miui/gallery/editor/photo/utils/BigBitmapLoadUtils;
.super Ljava/lang/Object;
.source "BigBitmapLoadUtils.java"


# static fields
.field private static final sSpecialWhiteList:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string v0, "davinci"

    const-string v1, "davinciin"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/editor/photo/utils/BigBitmapLoadUtils;->sSpecialWhiteList:[Ljava/lang/String;

    return-void
.end method

.method public static calculateInSampleSize(Landroid/content/Context;II)I
    .locals 10

    int-to-long v0, p1

    int-to-long v2, p2

    mul-long v0, v0, v2

    const-wide/16 v2, 0x4

    mul-long v0, v0, v2

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v3, 0x1

    const/16 v4, 0x1a

    if-lt v2, v4, :cond_2

    const-wide/32 v4, 0x5b8d800

    cmp-long v2, v0, v4

    if-lez v2, :cond_1

    invoke-static {p0}, Lcom/miui/gallery/editor/photo/utils/BigBitmapLoadUtils;->isMemoryBeyond3G(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-static {p0}, Lcom/miui/gallery/editor/photo/utils/BigBitmapLoadUtils;->isBigMemoryApp(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_0

    const-wide/32 v4, 0xb71b000

    :cond_0
    const/4 p0, 0x1

    :goto_0
    int-to-long v6, p0

    div-long v8, v0, v6

    div-long/2addr v8, v6

    cmp-long v2, v4, v8

    if-gez v2, :cond_3

    mul-int/lit8 p0, p0, 0x2

    goto :goto_0

    :cond_1
    const/4 p0, 0x1

    goto :goto_2

    :cond_2
    invoke-static {p0}, Lcom/miui/gallery/editor/photo/utils/BigBitmapLoadUtils;->getMaxMemory(Landroid/content/Context;)I

    move-result p0

    int-to-long v4, p0

    const-wide/16 v6, 0x400

    mul-long v4, v4, v6

    mul-long v4, v4, v6

    const-wide/16 v6, 0x3

    div-long/2addr v4, v6

    const/4 p0, 0x1

    :goto_1
    int-to-long v6, p0

    div-long v8, v0, v6

    div-long/2addr v8, v6

    cmp-long v2, v4, v8

    if-gez v2, :cond_3

    mul-int/lit8 p0, p0, 0x2

    goto :goto_1

    :cond_3
    :goto_2
    if-eq p0, v3, :cond_4

    const-string v0, "BigBitmapLoadUtils"

    const-string v1, "decoding original bitmap,inSampleSize:%d"

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "inSampleSize"

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "size"

    const-string v2, "%dk*%dk"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    div-int/lit16 p1, p1, 0x3e8

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v4, v5

    div-int/lit16 p2, p2, 0x3e8

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v4, v3

    invoke-static {v2, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "model"

    sget-object p2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "photo_editor"

    const-string p2, "decode_resize"

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_4
    return p0
.end method

.method public static getMaxMemory(Landroid/content/Context;)I
    .locals 3

    const-string v0, "activity"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/ActivityManager;

    invoke-virtual {p0}, Landroid/app/ActivityManager;->getLargeMemoryClass()I

    move-result p0

    const-string v0, "BigBitmapLoadUtils"

    const-string v1, "max memory:%dM"

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return p0
.end method

.method private static getPhoneTotalMem(Landroid/content/Context;)J
    .locals 4

    const-string v0, "activity"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/ActivityManager;

    new-instance v0, Landroid/app/ActivityManager$MemoryInfo;

    invoke-direct {v0}, Landroid/app/ActivityManager$MemoryInfo;-><init>()V

    invoke-virtual {p0, v0}, Landroid/app/ActivityManager;->getMemoryInfo(Landroid/app/ActivityManager$MemoryInfo;)V

    const-string p0, "BigBitmapLoadUtils"

    const-string v1, "phone total memory:%d"

    iget-wide v2, v0, Landroid/app/ActivityManager$MemoryInfo;->totalMem:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {p0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-wide v0, v0, Landroid/app/ActivityManager$MemoryInfo;->totalMem:J

    return-wide v0
.end method

.method public static isBigMemoryApp(Landroid/content/Context;)Z
    .locals 1

    invoke-static {}, Lcom/miui/gallery/editor/photo/utils/BigBitmapLoadUtils;->isSpecialBigMemoryDevices()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p0}, Lcom/miui/gallery/editor/photo/utils/BigBitmapLoadUtils;->getMaxMemory(Landroid/content/Context;)I

    move-result p0

    const/16 v0, 0x200

    if-lt p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method private static isMemoryBeyond3G(Landroid/content/Context;)Z
    .locals 4

    invoke-static {p0}, Lcom/miui/gallery/editor/photo/utils/BigBitmapLoadUtils;->getPhoneTotalMem(Landroid/content/Context;)J

    move-result-wide v0

    const-wide v2, 0xccccccccL

    cmp-long p0, v0, v2

    if-lez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static isSpecialBigMemoryDevices()Z
    .locals 6

    sget-object v0, Lcom/miui/gallery/editor/photo/utils/BigBitmapLoadUtils;->sSpecialWhiteList:[Ljava/lang/String;

    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_1

    aget-object v4, v0, v3

    sget-object v5, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return v2
.end method
