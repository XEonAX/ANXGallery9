.class public Lcom/miui/gallery/util/BaseFileMimeUtil;
.super Ljava/lang/Object;
.source "BaseFileMimeUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;
    }
.end annotation


# static fields
.field private static final IMAGE_MIMES:[Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;

.field private static final MAX_END_LENGTH:I

.field private static final MAX_HEAD_LENGTH:I

.field protected static final VIDEO_MIMES:[Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;


# direct methods
.method static constructor <clinit>()V
    .locals 16

    const/16 v0, 0xb

    new-array v1, v0, [Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;

    new-instance v2, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;

    const-string v3, "image/jpeg"

    const/4 v4, 0x2

    new-array v5, v4, [B

    fill-array-data v5, :array_0

    new-array v6, v4, [B

    fill-array-data v6, :array_1

    invoke-direct {v2, v3, v5, v6}, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;-><init>(Ljava/lang/String;[B[B)V

    const/4 v3, 0x0

    aput-object v2, v1, v3

    new-instance v2, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;

    const-string v5, "image/jpeg"

    new-array v6, v4, [B

    fill-array-data v6, :array_2

    new-array v7, v4, [B

    fill-array-data v7, :array_3

    invoke-direct {v2, v5, v6, v7}, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;-><init>(Ljava/lang/String;[B[B)V

    const/4 v5, 0x1

    aput-object v2, v1, v5

    new-instance v2, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;

    const-string v6, "image/png"

    const/16 v7, 0x8

    new-array v8, v7, [B

    fill-array-data v8, :array_4

    const/4 v9, 0x0

    invoke-direct {v2, v6, v8, v9}, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;-><init>(Ljava/lang/String;[B[B)V

    aput-object v2, v1, v4

    new-instance v2, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;

    const-string v6, "image/tga"

    const/4 v8, 0x5

    new-array v10, v8, [B

    fill-array-data v10, :array_5

    invoke-direct {v2, v6, v10, v9}, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;-><init>(Ljava/lang/String;[B[B)V

    const/4 v6, 0x3

    aput-object v2, v1, v6

    new-instance v2, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;

    const-string v10, "image/tga"

    new-array v11, v8, [B

    fill-array-data v11, :array_6

    invoke-direct {v2, v10, v11, v9}, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;-><init>(Ljava/lang/String;[B[B)V

    const/4 v10, 0x4

    aput-object v2, v1, v10

    new-instance v2, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;

    const-string v11, "image/gif"

    const/4 v12, 0x6

    new-array v13, v12, [B

    fill-array-data v13, :array_7

    invoke-direct {v2, v11, v13, v9}, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;-><init>(Ljava/lang/String;[B[B)V

    aput-object v2, v1, v8

    new-instance v2, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;

    const-string v11, "image/gif"

    new-array v13, v12, [B

    fill-array-data v13, :array_8

    invoke-direct {v2, v11, v13, v9}, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;-><init>(Ljava/lang/String;[B[B)V

    aput-object v2, v1, v12

    new-instance v2, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;

    const-string v11, "image/bmp"

    new-array v13, v4, [B

    fill-array-data v13, :array_9

    invoke-direct {v2, v11, v13, v9}, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;-><init>(Ljava/lang/String;[B[B)V

    const/4 v11, 0x7

    aput-object v2, v1, v11

    new-instance v2, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;

    const-string v13, "image/tiff"

    new-array v14, v4, [B

    fill-array-data v14, :array_a

    invoke-direct {v2, v13, v14, v9}, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;-><init>(Ljava/lang/String;[B[B)V

    aput-object v2, v1, v7

    new-instance v2, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;

    const-string v13, "image/tiff"

    new-array v14, v4, [B

    fill-array-data v14, :array_b

    invoke-direct {v2, v13, v14, v9}, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;-><init>(Ljava/lang/String;[B[B)V

    const/16 v13, 0x9

    aput-object v2, v1, v13

    new-instance v2, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;

    const-string v14, "image/webp"

    new-array v15, v4, [B

    fill-array-data v15, :array_c

    invoke-direct {v2, v14, v15, v9}, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;-><init>(Ljava/lang/String;[B[B)V

    const/16 v14, 0xa

    aput-object v2, v1, v14

    sput-object v1, Lcom/miui/gallery/util/BaseFileMimeUtil;->IMAGE_MIMES:[Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;

    new-array v1, v13, [Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;

    new-instance v2, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;

    const-string v13, "video/3gpp"

    const/16 v15, 0xc

    new-array v7, v15, [B

    fill-array-data v7, :array_d

    invoke-direct {v2, v13, v7, v9}, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;-><init>(Ljava/lang/String;[B[B)V

    aput-object v2, v1, v3

    new-instance v2, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;

    const-string v7, "video/mp4"

    new-array v13, v15, [B

    fill-array-data v13, :array_e

    invoke-direct {v2, v7, v13, v9}, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;-><init>(Ljava/lang/String;[B[B)V

    aput-object v2, v1, v5

    new-instance v2, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;

    const-string v5, "video/mp4"

    new-array v7, v15, [B

    fill-array-data v7, :array_f

    invoke-direct {v2, v5, v7, v9}, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;-><init>(Ljava/lang/String;[B[B)V

    aput-object v2, v1, v4

    new-instance v2, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;

    const-string v4, "video/mp4"

    new-array v0, v0, [B

    fill-array-data v0, :array_10

    invoke-direct {v2, v4, v0, v9}, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;-><init>(Ljava/lang/String;[B[B)V

    aput-object v2, v1, v6

    new-instance v0, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;

    const-string v2, "video/3gp"

    new-array v4, v15, [B

    fill-array-data v4, :array_11

    invoke-direct {v0, v2, v4, v9}, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;-><init>(Ljava/lang/String;[B[B)V

    aput-object v0, v1, v10

    new-instance v0, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;

    const-string v2, "video/quicktime"

    new-array v4, v14, [B

    fill-array-data v4, :array_12

    invoke-direct {v0, v2, v4, v9}, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;-><init>(Ljava/lang/String;[B[B)V

    aput-object v0, v1, v8

    new-instance v0, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;

    const-string v2, "video/mp4"

    new-array v4, v15, [B

    fill-array-data v4, :array_13

    invoke-direct {v0, v2, v4, v9}, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;-><init>(Ljava/lang/String;[B[B)V

    aput-object v0, v1, v12

    new-instance v0, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;

    const-string v2, "video/quicktime"

    new-array v4, v15, [B

    fill-array-data v4, :array_14

    invoke-direct {v0, v2, v4, v9}, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;-><init>(Ljava/lang/String;[B[B)V

    aput-object v0, v1, v11

    new-instance v0, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;

    const-string v2, "video/mp4"

    new-array v4, v15, [B

    fill-array-data v4, :array_15

    invoke-direct {v0, v2, v4, v9}, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;-><init>(Ljava/lang/String;[B[B)V

    const/16 v2, 0x8

    aput-object v0, v1, v2

    sput-object v1, Lcom/miui/gallery/util/BaseFileMimeUtil;->VIDEO_MIMES:[Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;

    invoke-static {}, Lcom/miui/gallery/util/BaseFileMimeUtil;->getMimes()[Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v3, v1, :cond_2

    aget-object v5, v0, v3

    invoke-virtual {v5}, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;->hasHead()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-virtual {v5}, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;->getHeadLength()I

    move-result v6

    if-le v6, v2, :cond_0

    invoke-virtual {v5}, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;->getHeadLength()I

    move-result v2

    :cond_0
    invoke-virtual {v5}, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;->hasEnd()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-virtual {v5}, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;->getEndLength()I

    move-result v6

    if-le v6, v4, :cond_1

    invoke-virtual {v5}, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;->getEndLength()I

    move-result v4

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    sput v2, Lcom/miui/gallery/util/BaseFileMimeUtil;->MAX_HEAD_LENGTH:I

    sput v4, Lcom/miui/gallery/util/BaseFileMimeUtil;->MAX_END_LENGTH:I

    return-void

    :array_0
    .array-data 1
        -0x1t
        -0x28t
    .end array-data

    nop

    :array_1
    .array-data 1
        -0x1t
        -0x27t
    .end array-data

    nop

    :array_2
    .array-data 1
        -0x1t
        -0x28t
    .end array-data

    nop

    :array_3
    .array-data 1
        0x0t
        0x0t
    .end array-data

    nop

    :array_4
    .array-data 1
        -0x77t
        0x50t
        0x4et
        0x47t
        0xdt
        0xat
        0x1at
        0xat
    .end array-data

    :array_5
    .array-data 1
        0x0t
        0x0t
        0x2t
        0x0t
        0x0t
    .end array-data

    nop

    :array_6
    .array-data 1
        0x0t
        0x0t
        0x10t
        0x0t
        0x0t
    .end array-data

    nop

    :array_7
    .array-data 1
        0x47t
        0x49t
        0x46t
        0x38t
        0x37t
        0x61t
    .end array-data

    nop

    :array_8
    .array-data 1
        0x47t
        0x49t
        0x46t
        0x38t
        0x39t
        0x61t
    .end array-data

    nop

    :array_9
    .array-data 1
        0x42t
        0x4dt
    .end array-data

    nop

    :array_a
    .array-data 1
        0x4dt
        0x4dt
    .end array-data

    nop

    :array_b
    .array-data 1
        0x49t
        0x49t
    .end array-data

    nop

    :array_c
    .array-data 1
        0x52t
        0x49t
    .end array-data

    nop

    :array_d
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x0t
        0x69t
        0x73t
        0x6ft
        0x6dt
        0x33t
        0x67t
        0x70t
        0x34t
    .end array-data

    :array_e
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x18t
        0x66t
        0x74t
        0x79t
        0x70t
        0x69t
        0x73t
        0x6ft
        0x6dt
    .end array-data

    :array_f
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x18t
        0x66t
        0x74t
        0x79t
        0x70t
        0x6dt
        0x70t
        0x34t
        0x32t
    .end array-data

    :array_10
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x18t
        0x66t
        0x74t
        0x79t
        0x70t
        0x33t
        0x67t
        0x70t
    .end array-data

    :array_11
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x1ct
        0x66t
        0x74t
        0x79t
        0x70t
        0x33t
        0x67t
        0x70t
        0x34t
    .end array-data

    :array_12
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x14t
        0x66t
        0x74t
        0x79t
        0x70t
        0x71t
        0x74t
    .end array-data

    nop

    :array_13
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x20t
        0x66t
        0x74t
        0x79t
        0x70t
        0x61t
        0x76t
        0x63t
        0x31t
    .end array-data

    :array_14
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x1ct
        0x66t
        0x74t
        0x79t
        0x70t
        0x6dt
        0x70t
        0x34t
        0x32t
    .end array-data

    :array_15
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x20t
        0x66t
        0x74t
        0x79t
        0x70t
        0x69t
        0x73t
        0x6ft
        0x6dt
    .end array-data
.end method

.method public static getMimeType(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p0}, Lcom/miui/gallery/util/MediaFile;->getMimeTypeForFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_0
    const-string p0, "*/*"

    :goto_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string p0, "*/*"

    :cond_1
    return-object p0
.end method

.method public static getMimeTypeByParseFile(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    const-string v0, "*/*"

    :try_start_0
    invoke-static {}, Lcom/miui/gallery/util/BaseFileMimeUtil;->getMimes()[Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/miui/gallery/util/BaseFileMimeUtil;->rawGetMimeType(Ljava/lang/String;[Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string v1, "BaseFileMimeUtil"

    invoke-static {v1, p0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object p0, v0

    :goto_0
    return-object p0
.end method

.method private static getMimes()[Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;
    .locals 5

    sget-object v0, Lcom/miui/gallery/util/BaseFileMimeUtil;->IMAGE_MIMES:[Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;

    array-length v0, v0

    sget-object v1, Lcom/miui/gallery/util/BaseFileMimeUtil;->VIDEO_MIMES:[Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;

    array-length v1, v1

    add-int/2addr v0, v1

    new-array v1, v0, [Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    sget-object v3, Lcom/miui/gallery/util/BaseFileMimeUtil;->IMAGE_MIMES:[Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;

    array-length v3, v3

    if-ge v2, v3, :cond_0

    sget-object v3, Lcom/miui/gallery/util/BaseFileMimeUtil;->IMAGE_MIMES:[Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;

    aget-object v3, v3, v2

    aput-object v3, v1, v2

    goto :goto_1

    :cond_0
    sget-object v3, Lcom/miui/gallery/util/BaseFileMimeUtil;->VIDEO_MIMES:[Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;

    sget-object v4, Lcom/miui/gallery/util/BaseFileMimeUtil;->IMAGE_MIMES:[Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;

    array-length v4, v4

    sub-int v4, v2, v4

    aget-object v3, v3, v4

    aput-object v3, v1, v2

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-object v1
.end method

.method public static hasExif(Ljava/lang/String;)Z
    .locals 1

    invoke-static {p0}, Lcom/miui/gallery/util/MediaFile;->getFileType(Ljava/lang/String;)Lcom/miui/gallery/util/MediaFile$MediaFileType;

    move-result-object p0

    if-eqz p0, :cond_0

    iget p0, p0, Lcom/miui/gallery/util/MediaFile$MediaFileType;->fileType:I

    const/16 v0, 0x1f

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static isGifFromMimeType(Ljava/lang/String;)Z
    .locals 1

    const-string v0, "image/gif"

    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    return p0
.end method

.method public static isImageFromMimeType(Ljava/lang/String;)Z
    .locals 1

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    const-string v0, "image"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    :goto_0
    return p0
.end method

.method public static isVideoFromMimeType(Ljava/lang/String;)Z
    .locals 1

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    const-string v0, "video"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    :goto_0
    return p0
.end method

.method protected static rawGetMimeType(Ljava/lang/String;[Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;)Ljava/lang/String;
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget v0, Lcom/miui/gallery/util/BaseFileMimeUtil;->MAX_HEAD_LENGTH:I

    new-array v0, v0, [B

    sget v1, Lcom/miui/gallery/util/BaseFileMimeUtil;->MAX_END_LENGTH:I

    new-array v1, v1, [B

    const/4 v2, 0x0

    :try_start_0
    new-instance v3, Ljava/io/RandomAccessFile;

    const-string v4, "r"

    invoke-direct {v3, p0, v4}, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const-wide/16 v4, 0x0

    :try_start_1
    invoke-virtual {v3, v4, v5}, Ljava/io/RandomAccessFile;->seek(J)V

    array-length p0, v0

    const/4 v6, 0x0

    invoke-virtual {v3, v0, v6, p0}, Ljava/io/RandomAccessFile;->read([BII)I

    move-result p0

    invoke-virtual {v3}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v7

    array-length v9, v1

    int-to-long v9, v9

    invoke-static {v9, v10, v7, v8}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v9

    cmp-long v11, v9, v4

    if-ltz v11, :cond_8

    const-wide/32 v11, 0x7fffffff

    cmp-long v13, v9, v11

    if-lez v13, :cond_0

    goto :goto_3

    :cond_0
    cmp-long v11, v9, v4

    if-nez v11, :cond_1

    const-string p0, "BaseFileMimeUtil"

    const-string p1, "endBufferedLength is 0, just return null mime type"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {v3}, Lcom/miui/gallery/util/BaseMiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return-object v2

    :cond_1
    const/4 v11, 0x0

    sub-long/2addr v7, v9

    :try_start_2
    invoke-virtual {v3, v7, v8}, Ljava/io/RandomAccessFile;->seek(J)V

    long-to-int v7, v9

    invoke-virtual {v3, v1, v6, v7}, Ljava/io/RandomAccessFile;->read([BII)I

    move-result v7

    int-to-long v7, v7

    cmp-long v11, v9, v7

    if-eqz v11, :cond_2

    goto :goto_0

    :cond_2
    move-wide v4, v9

    :goto_0
    array-length v7, p1

    :goto_1
    if-ge v6, v7, :cond_7

    aget-object v8, p1, v6

    invoke-virtual {v8}, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;->hasHead()Z

    move-result v9

    if-eqz v9, :cond_4

    invoke-virtual {v8}, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;->getHeadLength()I

    move-result v9

    if-ge p0, v9, :cond_3

    goto :goto_2

    :cond_3
    invoke-virtual {v8, v0}, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;->isHeadRight([B)Z

    move-result v9

    if-nez v9, :cond_4

    goto :goto_2

    :cond_4
    invoke-virtual {v8}, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;->hasEnd()Z

    move-result v9

    if-eqz v9, :cond_6

    invoke-virtual {v8}, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;->getEndLength()I

    move-result v9

    int-to-long v9, v9

    cmp-long v11, v4, v9

    if-gez v11, :cond_5

    goto :goto_2

    :cond_5
    invoke-virtual {v8, v1}, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;->isEndRight([B)Z

    move-result v9

    if-nez v9, :cond_6

    :goto_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    :cond_6
    invoke-virtual {v8}, Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;->getMimeType()Ljava/lang/String;

    move-result-object p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    invoke-static {v3}, Lcom/miui/gallery/util/BaseMiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return-object p0

    :cond_7
    invoke-static {v3}, Lcom/miui/gallery/util/BaseMiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return-object v2

    :cond_8
    :goto_3
    :try_start_3
    const-string p0, "BaseFileMimeUtil"

    const-string p1, "unexpected error, endBufferedLength: %d, file length: %d"

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    aput-object v1, v0, v6

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const/4 v4, 0x1

    aput-object v1, v0, v4

    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    invoke-static {v3}, Lcom/miui/gallery/util/BaseMiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return-object v2

    :catchall_0
    move-exception p0

    goto :goto_4

    :catchall_1
    move-exception p0

    move-object v3, v2

    :goto_4
    invoke-static {v3}, Lcom/miui/gallery/util/BaseMiscUtil;->closeSilently(Ljava/io/Closeable;)V

    throw p0
.end method
