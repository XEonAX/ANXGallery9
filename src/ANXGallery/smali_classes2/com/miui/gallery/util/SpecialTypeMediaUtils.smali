.class public Lcom/miui/gallery/util/SpecialTypeMediaUtils;
.super Ljava/lang/Object;
.source "SpecialTypeMediaUtils.java"


# static fields
.field private static final DEBUG_ENABLE:Z

.field private static final SPECIAL_TYPE_MEDIA_STRATEGY:Lmiui/util/SoftReferenceSingleton;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lmiui/util/SoftReferenceSingleton<",
            "Lcom/miui/gallery/cloudcontrol/strategies/ScannerStrategy$SpecialTypeMediaStrategy;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string v0, "SpecialTypeMedia"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    sput-boolean v0, Lcom/miui/gallery/util/SpecialTypeMediaUtils;->DEBUG_ENABLE:Z

    new-instance v0, Lcom/miui/gallery/util/SpecialTypeMediaUtils$1;

    invoke-direct {v0}, Lcom/miui/gallery/util/SpecialTypeMediaUtils$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/util/SpecialTypeMediaUtils;->SPECIAL_TYPE_MEDIA_STRATEGY:Lmiui/util/SoftReferenceSingleton;

    return-void
.end method

.method static synthetic access$000()Z
    .locals 1

    sget-boolean v0, Lcom/miui/gallery/util/SpecialTypeMediaUtils;->DEBUG_ENABLE:Z

    return v0
.end method

.method private static extractFrameRate(Ljava/lang/String;)I
    .locals 7

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    new-instance v0, Landroid/media/MediaExtractor;

    invoke-direct {v0}, Landroid/media/MediaExtractor;-><init>()V

    :try_start_0
    invoke-virtual {v0, p0}, Landroid/media/MediaExtractor;->setDataSource(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/media/MediaExtractor;->getTrackCount()I

    move-result v2

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_2

    invoke-virtual {v0, v3}, Landroid/media/MediaExtractor;->getTrackFormat(I)Landroid/media/MediaFormat;

    move-result-object v4

    const-string v5, "mime"

    invoke-virtual {v4, v5}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_1

    const-string v6, "video/"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    const-string v5, "frame-rate"

    invoke-virtual {v4, v5}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    const-string v2, "frame-rate"

    invoke-virtual {v4, v2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move v1, v2

    goto :goto_1

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_2

    :catch_0
    move-exception v2

    :try_start_1
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_2
    :goto_1
    invoke-virtual {v0}, Landroid/media/MediaExtractor;->release()V

    sget-boolean v0, Lcom/miui/gallery/util/SpecialTypeMediaUtils;->DEBUG_ENABLE:Z

    if-eqz v0, :cond_3

    const-string v0, "SpecialTypeMediaUtils"

    const-string v2, "path [%s] frameRate [%d]"

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v0, v2, p0, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_3
    return v1

    :goto_2
    invoke-virtual {v0}, Landroid/media/MediaExtractor;->release()V

    throw p0
.end method

.method private static is960FpsVideo(Ljava/lang/String;)Z
    .locals 2

    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Lorg/jcodec/movtool/MetadataEditor;->createFrom(Ljava/io/File;)Lorg/jcodec/movtool/MetadataEditor;

    move-result-object p0

    invoke-virtual {p0}, Lorg/jcodec/movtool/MetadataEditor;->getKeyedMeta()Ljava/util/Map;

    move-result-object p0

    if-eqz p0, :cond_1

    const-string v1, "com.xiaomi.capture_framerate"

    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/jcodec/containers/mp4/boxes/MetaValue;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/MetaValue;->getInt()I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/16 v1, 0x3c0

    if-ne p0, v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0

    :catch_0
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_1
    return v0
.end method

.method public static is960VideoEditable(Ljava/lang/String;)Z
    .locals 2

    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Lorg/jcodec/movtool/MetadataEditor;->createFrom(Ljava/io/File;)Lorg/jcodec/movtool/MetadataEditor;

    move-result-object p0

    invoke-virtual {p0}, Lorg/jcodec/movtool/MetadataEditor;->getKeyedMeta()Ljava/util/Map;

    move-result-object p0

    if-eqz p0, :cond_1

    const-string v1, "com.xiaomi.capture_origin_track"

    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/jcodec/containers/mp4/boxes/MetaValue;

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lorg/jcodec/containers/mp4/boxes/MetaValue;->getInt()I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-ltz p0, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0

    :catch_0
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_1
    return v0
.end method

.method public static isBurstPhoto(J)Z
    .locals 3

    const-wide/16 v0, 0x40

    and-long/2addr p0, v0

    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-eqz v2, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static isMTSpecialAITypeSupport()Z
    .locals 2

    sget-object v0, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    const-string v1, "vela"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static isMotionPhoto(Landroid/content/Context;J)Z
    .locals 3

    const-wide/16 v0, 0x20

    and-long/2addr p1, v0

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-eqz v2, :cond_0

    invoke-static {p0}, Lcom/miui/extraphoto/sdk/ExtraPhotoSDK;->isDeviceSupportMotionPhoto(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static isRefocusSupported(Landroid/content/Context;J)Z
    .locals 3

    const-wide/16 v0, 0x1

    and-long/2addr p1, v0

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-eqz v2, :cond_0

    invoke-static {p0}, Lcom/miui/extraphoto/sdk/ExtraPhotoSDK;->isDeviceSupportRefocus(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static parseFlagsForImage(Ljava/lang/String;)J
    .locals 8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    const-wide/16 v3, 0x0

    if-nez v2, :cond_2

    invoke-static {p0}, Lcom/miui/gallery/util/FileMimeUtil;->hasExif(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    :try_start_0
    new-instance v2, Lcom/miui/gallery3d/exif/ExifInterface;

    invoke-direct {v2}, Lcom/miui/gallery3d/exif/ExifInterface;-><init>()V

    invoke-virtual {v2, p0}, Lcom/miui/gallery3d/exif/ExifInterface;->readExif(Ljava/lang/String;)V

    invoke-static {v2}, Lcom/miui/gallery/util/ExifUtil;->supportRefocus(Lcom/miui/gallery3d/exif/ExifInterface;)Z

    move-result v5

    if-eqz v5, :cond_0

    const-wide/16 v3, 0x1

    goto :goto_0

    :cond_0
    invoke-static {v2}, Lcom/miui/gallery/util/ExifUtil;->isMotionPhoto(Lcom/miui/gallery3d/exif/ExifInterface;)Z

    move-result v5

    if-eqz v5, :cond_1

    const-wide/16 v3, 0x20

    :cond_1
    :goto_0
    invoke-static {v2}, Lcom/miui/gallery/util/ExifUtil;->getMTSpecialAITypeValue(Lcom/miui/gallery3d/exif/ExifInterface;)I

    move-result v2

    if-lez v2, :cond_2

    invoke-static {v2}, Lcom/miui/gallery/util/SpecialTypeMediaUtils;->parseMTSpecialAITypeByValue(I)J

    move-result-wide v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    or-long/2addr v3, v5

    goto :goto_1

    :catch_0
    move-exception v2

    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    :cond_2
    :goto_1
    sget-boolean v2, Lcom/miui/gallery/util/SpecialTypeMediaUtils;->DEBUG_ENABLE:Z

    if-eqz v2, :cond_3

    const-string v2, "SpecialTypeMediaUtils"

    const-string v5, "parseFlagsForImage costs [%dms], path [%s]"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v0

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v2, v5, v0, p0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_3
    return-wide v3
.end method

.method public static parseFlagsForVideo(Ljava/lang/String;)J
    .locals 8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    sget-object v2, Lcom/miui/gallery/util/SpecialTypeMediaUtils;->SPECIAL_TYPE_MEDIA_STRATEGY:Lmiui/util/SoftReferenceSingleton;

    invoke-virtual {v2}, Lmiui/util/SoftReferenceSingleton;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/cloudcontrol/strategies/ScannerStrategy$SpecialTypeMediaStrategy;

    invoke-static {p0}, Lcom/miui/gallery/util/SpecialTypeMediaUtils;->extractFrameRate(Ljava/lang/String;)I

    move-result v3

    int-to-long v3, v3

    invoke-virtual {v2}, Lcom/miui/gallery/cloudcontrol/strategies/ScannerStrategy$SpecialTypeMediaStrategy;->getHfr120FpsLowerBound()J

    move-result-wide v5

    cmp-long v7, v3, v5

    if-ltz v7, :cond_0

    invoke-virtual {v2}, Lcom/miui/gallery/cloudcontrol/strategies/ScannerStrategy$SpecialTypeMediaStrategy;->getHfr120FpsUpperBound()J

    move-result-wide v5

    cmp-long v7, v3, v5

    if-gtz v7, :cond_0

    const-wide/16 v2, 0x4

    goto :goto_0

    :cond_0
    invoke-virtual {v2}, Lcom/miui/gallery/cloudcontrol/strategies/ScannerStrategy$SpecialTypeMediaStrategy;->getHfr240FpsLowerBound()J

    move-result-wide v5

    cmp-long v7, v3, v5

    if-ltz v7, :cond_1

    invoke-virtual {v2}, Lcom/miui/gallery/cloudcontrol/strategies/ScannerStrategy$SpecialTypeMediaStrategy;->getHfr240FpsUpperBound()J

    move-result-wide v5

    cmp-long v2, v3, v5

    if-gtz v2, :cond_1

    const-wide/16 v2, 0x8

    goto :goto_0

    :cond_1
    invoke-static {p0}, Lcom/miui/gallery/util/FileMimeUtil;->getMimeTypeByParseFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_2

    const-string v3, "video/mp4"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-static {p0}, Lcom/miui/gallery/util/SpecialTypeMediaUtils;->is960FpsVideo(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    const-wide/16 v2, 0x10

    goto :goto_0

    :cond_2
    const-wide/16 v2, 0x0

    :goto_0
    sget-boolean v4, Lcom/miui/gallery/util/SpecialTypeMediaUtils;->DEBUG_ENABLE:Z

    if-eqz v4, :cond_3

    const-string v4, "SpecialTypeMediaUtils"

    const-string v5, "parseFlagsForVideo costs [%dms], flags [%d], path [%s]"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v0

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {v4, v5, v0, v1, p0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_3
    return-wide v2
.end method

.method public static parseMTSpecialAITypeByValue(I)J
    .locals 2

    const/4 v0, 0x5

    if-eq p0, v0, :cond_0

    packed-switch p0, :pswitch_data_0

    packed-switch p0, :pswitch_data_1

    const-wide/16 v0, 0x0

    return-wide v0

    :pswitch_0
    const-wide/16 v0, 0x1000

    return-wide v0

    :pswitch_1
    const-wide/16 v0, 0x800

    return-wide v0

    :pswitch_2
    const-wide/16 v0, 0x400

    return-wide v0

    :pswitch_3
    const-wide/16 v0, 0x200

    return-wide v0

    :pswitch_4
    const-wide/16 v0, 0x100

    return-wide v0

    :cond_0
    const-wide/16 v0, 0x80

    return-wide v0

    :pswitch_data_0
    .packed-switch 0x9
        :pswitch_4
        :pswitch_3
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0xd
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static parseMTSpecialAITypeDescriptionRes(J)I
    .locals 6

    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    const/4 v3, 0x0

    if-eqz v2, :cond_7

    invoke-static {}, Lcom/miui/gallery/util/SpecialTypeMediaUtils;->isMTSpecialAITypeSupport()Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_0

    :cond_0
    const-wide/16 v4, 0x80

    and-long/2addr v4, p0

    cmp-long v2, v4, v0

    if-eqz v2, :cond_1

    const p0, 0x7f100690

    return p0

    :cond_1
    const-wide/16 v4, 0x100

    and-long/2addr v4, p0

    cmp-long v2, v4, v0

    if-eqz v2, :cond_2

    const p0, 0x7f100691

    return p0

    :cond_2
    const-wide/16 v4, 0x200

    and-long/2addr v4, p0

    cmp-long v2, v4, v0

    if-eqz v2, :cond_3

    const p0, 0x7f100692

    return p0

    :cond_3
    const-wide/16 v4, 0x400

    and-long/2addr v4, p0

    cmp-long v2, v4, v0

    if-eqz v2, :cond_4

    const p0, 0x7f100693

    return p0

    :cond_4
    const-wide/16 v4, 0x800

    and-long/2addr v4, p0

    cmp-long v2, v4, v0

    if-eqz v2, :cond_5

    const p0, 0x7f10068f

    return p0

    :cond_5
    const-wide/16 v4, 0x1000

    and-long/2addr p0, v4

    cmp-long v2, p0, v0

    if-eqz v2, :cond_6

    const p0, 0x7f100694

    return p0

    :cond_6
    return v3

    :cond_7
    :goto_0
    return v3
.end method

.method public static tryGetHFRIndicatorResId(J)I
    .locals 5

    const-wide/16 v0, 0x4

    and-long/2addr v0, p0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_2

    const-wide/16 v0, 0x8

    and-long/2addr v0, p0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    goto :goto_0

    :cond_0
    const-wide/16 v0, 0x10

    and-long/2addr p0, v0

    cmp-long v0, p0, v2

    if-eqz v0, :cond_1

    const p0, 0x7f0702d2

    goto :goto_1

    :cond_1
    const/4 p0, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const p0, 0x7f0702d4

    :goto_1
    return p0
.end method
