.class Lcom/nexstreaming/kminternal/kinemaster/mediainfo/g;
.super Ljava/lang/Object;
.source "ThumbnailParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nexstreaming/kminternal/kinemaster/mediainfo/g$a;,
        Lcom/nexstreaming/kminternal/kinemaster/mediainfo/g$b;
    }
.end annotation


# direct methods
.method private static a(I)I
    .locals 2

    const/high16 v0, -0x1000000

    and-int/2addr v0, p0

    ushr-int/lit8 v0, v0, 0x18

    const/high16 v1, 0xff0000

    and-int/2addr v1, p0

    ushr-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    const v1, 0xff00

    and-int/2addr v1, p0

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    and-int/lit16 p0, p0, 0xff

    shl-int/lit8 p0, p0, 0x18

    or-int/2addr p0, v0

    return p0
.end method

.method static a(Ljava/io/File;ILcom/nexstreaming/kminternal/kinemaster/mediainfo/c;)Lcom/nexstreaming/app/common/task/Task$TaskError;
    .locals 18

    invoke-virtual/range {p0 .. p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/ThumbnailError;->RawFileNotFound:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/ThumbnailError;

    return-object v0

    :cond_0
    invoke-virtual/range {p0 .. p0}, Ljava/io/File;->length()J

    move-result-wide v0

    const-wide/16 v2, 0x8

    cmp-long v4, v0, v2

    if-gez v4, :cond_1

    sget-object v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/ThumbnailError;->RawFileTooSmall:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/ThumbnailError;

    return-object v0

    :cond_1
    :try_start_0
    new-instance v4, Ljava/io/RandomAccessFile;

    const-string v5, "r"

    move-object/from16 v6, p0

    invoke-direct {v4, v6, v5}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/RandomAccessFile;->getFilePointer()J

    move-result-wide v5

    invoke-virtual {v4}, Ljava/io/RandomAccessFile;->readInt()I

    move-result v7

    invoke-virtual {v4}, Ljava/io/RandomAccessFile;->readInt()I

    move-result v8

    invoke-virtual {v4}, Ljava/io/RandomAccessFile;->readInt()I

    move-result v9

    invoke-static {v7}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/g;->a(I)I

    move-result v7

    invoke-static {v8}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/g;->a(I)I

    move-result v8

    invoke-static {v9}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/g;->a(I)I

    move-result v9

    mul-int v10, v8, v9

    mul-int v10, v10, v7

    div-int/lit8 v10, v10, 0x8

    move/from16 v11, p1

    int-to-long v11, v11

    sub-long/2addr v0, v2

    add-int/lit8 v2, v10, 0x4

    int-to-long v2, v2

    div-long/2addr v0, v2

    invoke-static {v11, v12, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    long-to-int v0, v0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_2

    sget-object v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/ThumbnailError;->NoThumbailsFound:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/ThumbnailError;

    return-object v0

    :cond_2
    new-array v1, v10, [B

    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    const/4 v3, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    :goto_0
    if-ge v10, v0, :cond_4

    invoke-virtual {v4}, Ljava/io/RandomAccessFile;->readInt()I

    move-result v12

    invoke-static {v12}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/g;->a(I)I

    move-result v13

    if-le v11, v13, :cond_3

    const-string v11, "ThumbnailParser"

    const-string v14, "thumbnail needSort"

    invoke-static {v11, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    invoke-virtual {v4}, Ljava/io/RandomAccessFile;->getFilePointer()J

    move-result-wide v14

    new-instance v11, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/g$b;

    invoke-direct {v11, v13, v12, v14, v15}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/g$b;-><init>(IIJ)V

    invoke-virtual {v2, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v4, v1}, Ljava/io/RandomAccessFile;->read([B)I

    add-int/lit8 v10, v10, 0x1

    move v11, v13

    goto :goto_0

    :cond_4
    invoke-virtual {v4, v5, v6}, Ljava/io/RandomAccessFile;->seek(J)V

    new-instance v5, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/g$a;

    invoke-direct {v5}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/g$a;-><init>()V

    invoke-static {v2, v5}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    const-string v5, "ThumbnailParser"

    const-string v6, "Sort thumbnail time stamp"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/g$b;

    invoke-virtual {v6}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/g$b;->b()J

    move-result-wide v10

    invoke-virtual {v4, v10, v11}, Ljava/io/RandomAccessFile;->seek(J)V

    invoke-virtual {v4, v1}, Ljava/io/RandomAccessFile;->read([B)I

    invoke-virtual {v6}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/g$b;->a()I

    move-result v11

    move-object v10, v1

    move v12, v8

    move v13, v9

    move v14, v7

    move v15, v3

    move/from16 v16, v0

    move-object/from16 v17, p2

    invoke-static/range {v10 .. v17}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/g;->a([BIIIIIILcom/nexstreaming/kminternal/kinemaster/mediainfo/c;)Lcom/nexstreaming/kminternal/kinemaster/mediainfo/ThumbnailError;

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_5
    invoke-virtual {v4}, Ljava/io/RandomAccessFile;->close()V

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v0, 0x0

    return-object v0

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/nexstreaming/app/common/task/Task;->makeTaskError(Ljava/lang/Exception;)Lcom/nexstreaming/app/common/task/Task$TaskError;

    move-result-object v0

    return-object v0
.end method

.method static a(Ljava/io/InputStream;JILcom/nexstreaming/kminternal/kinemaster/mediainfo/c;)Lcom/nexstreaming/kminternal/kinemaster/mediainfo/ThumbnailError;
    .locals 21
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v0, p4

    if-nez v0, :cond_0

    sget-object v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/ThumbnailError;->ParameterError:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/ThumbnailError;

    return-object v0

    :cond_0
    new-instance v1, Ljava/io/DataInputStream;

    move-object/from16 v2, p0

    invoke-direct {v1, v2}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v1}, Ljava/io/DataInputStream;->readInt()I

    move-result v2

    invoke-virtual {v1}, Ljava/io/DataInputStream;->readInt()I

    move-result v3

    invoke-virtual {v1}, Ljava/io/DataInputStream;->readInt()I

    move-result v4

    instance-of v5, v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/e;

    if-eqz v5, :cond_1

    check-cast v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/e;

    move-object v7, v0

    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    check-cast v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/d;

    const/4 v7, 0x0

    :goto_0
    const/high16 v8, -0x10000

    and-int v9, v3, v8

    if-nez v9, :cond_3

    and-int/2addr v8, v4

    if-eqz v8, :cond_2

    goto :goto_1

    :cond_2
    move v8, v2

    const/4 v2, 0x0

    goto :goto_2

    :cond_3
    :goto_1
    invoke-static {v2}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/g;->a(I)I

    move-result v2

    invoke-static {v3}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/g;->a(I)I

    move-result v3

    invoke-static {v4}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/g;->a(I)I

    move-result v4

    move v8, v2

    const/4 v2, 0x1

    :goto_2
    const-string v9, "ThumbnailParser"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "processRawFile: w/h/swap="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v13, "/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v13, "/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v13, " format="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v9, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v9, 0x20

    const/16 v12, 0x8

    if-ne v8, v9, :cond_5

    if-nez v5, :cond_4

    sget-object v9, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v4, v9}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v9

    goto :goto_3

    :cond_4
    const/4 v9, 0x0

    goto :goto_3

    :cond_5
    const/16 v9, 0x10

    if-ne v8, v9, :cond_6

    if-nez v5, :cond_4

    sget-object v9, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v4, v9}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v9

    goto :goto_3

    :cond_6
    if-ne v8, v12, :cond_e

    if-nez v5, :cond_4

    sget-object v9, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v4, v9}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v9

    :goto_3
    if-nez v5, :cond_7

    invoke-virtual {v9}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v13

    invoke-static {v3, v4, v13}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v13

    new-instance v14, Landroid/graphics/Canvas;

    invoke-direct {v14, v13}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    const/high16 v15, 0x3f800000    # 1.0f

    const/high16 v10, -0x40800000    # -1.0f

    invoke-virtual {v14, v15, v10}, Landroid/graphics/Canvas;->scale(FF)V

    goto :goto_4

    :cond_7
    const/4 v13, 0x0

    const/4 v14, 0x0

    :goto_4
    mul-int v3, v3, v4

    mul-int v3, v3, v8

    div-int/2addr v3, v12

    move/from16 v8, p3

    move-object/from16 v16, v7

    int-to-long v6, v8

    const-wide/16 v17, 0x8

    sub-long v17, p1, v17

    add-int/lit8 v8, v3, 0x4

    int-to-long v11, v8

    div-long v10, v17, v11

    invoke-static {v6, v7, v10, v11}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v6

    long-to-int v6, v6

    const/4 v7, 0x1

    if-ge v6, v7, :cond_8

    sget-object v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/ThumbnailError;->NoThumbailsFound:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/ThumbnailError;

    return-object v0

    :cond_8
    new-array v7, v3, [B

    invoke-static {v7}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v8

    const-string v10, "ThumbnailParser"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "processRawFile : thumbCount="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v10, 0x0

    :goto_5
    if-ge v10, v6, :cond_d

    const-string v11, "ThumbnailParser"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "processRawFile : i="

    invoke-virtual {v12, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v1}, Ljava/io/DataInputStream;->readInt()I

    move-result v11

    if-eqz v2, :cond_9

    invoke-static {v11}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/g;->a(I)I

    move-result v11

    :cond_9
    const-string v12, "ThumbnailParser"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v19, v2

    const-string v2, "processRawFile : time="

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v12, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v1, v7}, Ljava/io/DataInputStream;->read([B)I

    move-result v2

    const/4 v12, 0x1

    add-int/lit8 v15, v3, -0x1

    if-ge v2, v15, :cond_b

    if-eqz v5, :cond_a

    move-object/from16 v2, v16

    const/4 v15, 0x0

    invoke-interface {v2, v15, v10, v6, v11}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/e;->a([BIII)V

    :goto_6
    move-object/from16 v20, v1

    move-object v1, v15

    goto :goto_7

    :cond_a
    move-object/from16 v2, v16

    const/4 v15, 0x0

    invoke-interface {v0, v15, v10, v6, v11}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/d;->a(Landroid/graphics/Bitmap;III)V

    goto :goto_6

    :cond_b
    move-object/from16 v2, v16

    if-eqz v5, :cond_c

    invoke-interface {v2, v7, v10, v6, v11}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/e;->a([BIII)V

    invoke-virtual {v8}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    move-object/from16 v20, v1

    const/4 v1, 0x0

    goto :goto_7

    :cond_c
    invoke-virtual {v9, v8}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    invoke-virtual {v8}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    const/4 v15, 0x0

    neg-int v12, v4

    int-to-float v12, v12

    move-object/from16 v20, v1

    const/4 v1, 0x0

    invoke-virtual {v14, v9, v15, v12, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    invoke-interface {v0, v13, v10, v6, v11}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/d;->a(Landroid/graphics/Bitmap;III)V

    :goto_7
    add-int/lit8 v10, v10, 0x1

    move-object/from16 v16, v2

    move/from16 v2, v19

    move-object/from16 v1, v20

    goto :goto_5

    :cond_d
    const/4 v1, 0x0

    return-object v1

    :cond_e
    sget-object v0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/ThumbnailError;->UnknownFormat:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/ThumbnailError;

    return-object v0
.end method

.method static a([BIIIIIILcom/nexstreaming/kminternal/kinemaster/mediainfo/c;)Lcom/nexstreaming/kminternal/kinemaster/mediainfo/ThumbnailError;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-nez p7, :cond_0

    sget-object p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/ThumbnailError;->ParameterError:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/ThumbnailError;

    return-object p0

    :cond_0
    instance-of v0, p7, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/e;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    check-cast p7, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/e;

    move-object v2, v1

    goto :goto_0

    :cond_1
    check-cast p7, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/d;

    move-object v2, p7

    move-object p7, v1

    :goto_0
    const-string v3, "ThumbnailParser"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "processRawFile: w/h/time="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, ", format="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v3, 0x20

    if-ne p4, v3, :cond_3

    if-nez v0, :cond_2

    sget-object p4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p2, p3, p4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p4

    goto :goto_1

    :cond_2
    move-object p4, v1

    goto :goto_1

    :cond_3
    const/16 v3, 0x10

    if-ne p4, v3, :cond_4

    if-nez v0, :cond_2

    sget-object p4, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-static {p2, p3, p4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p4

    goto :goto_1

    :cond_4
    const/16 v3, 0x8

    if-ne p4, v3, :cond_7

    if-nez v0, :cond_2

    sget-object p4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p2, p3, p4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p4

    :goto_1
    if-nez v0, :cond_5

    invoke-virtual {p4}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v3

    invoke-static {p2, p3, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p2

    new-instance v3, Landroid/graphics/Canvas;

    invoke-direct {v3, p2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    const/high16 v4, 0x3f800000    # 1.0f

    const/high16 v5, -0x40800000    # -1.0f

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Canvas;->scale(FF)V

    goto :goto_2

    :cond_5
    move-object p2, v1

    move-object v3, p2

    :goto_2
    invoke-static {p0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v4

    const-string v5, "ThumbnailParser"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "processRawFile : thumbCount="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, p6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v0, :cond_6

    invoke-interface {p7, p0, p5, p6, p1}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/e;->a([BIII)V

    goto :goto_3

    :cond_6
    invoke-virtual {p4, v4}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    const/4 p0, 0x0

    neg-int p3, p3

    int-to-float p3, p3

    invoke-virtual {v3, p4, p0, p3, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    invoke-interface {v2, p2, p5, p6, p1}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/d;->a(Landroid/graphics/Bitmap;III)V

    :goto_3
    return-object v1

    :cond_7
    sget-object p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/ThumbnailError;->UnknownFormat:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/ThumbnailError;

    return-object p0
.end method
