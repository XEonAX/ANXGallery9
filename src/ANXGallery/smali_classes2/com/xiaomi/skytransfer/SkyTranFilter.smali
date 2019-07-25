.class public Lcom/xiaomi/skytransfer/SkyTranFilter;
.super Ljava/lang/Object;
.source "SkyTranFilter.java"


# static fields
.field private static sInstance:Lcom/xiaomi/skytransfer/SkyTranFilter;


# instance fields
.field private mIsLoaded:Z

.field private mNativeObj:J

.field private mSync:Ljava/lang/Object;

.field private mTransferTempData:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/xiaomi/skytransfer/SkyTranFilter;

    invoke-direct {v0}, Lcom/xiaomi/skytransfer/SkyTranFilter;-><init>()V

    sput-object v0, Lcom/xiaomi/skytransfer/SkyTranFilter;->sInstance:Lcom/xiaomi/skytransfer/SkyTranFilter;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/skytransfer/SkyTranFilter;->mSync:Ljava/lang/Object;

    return-void
.end method

.method private bitmap2RGB(Landroid/graphics/Bitmap;Z)[B
    .locals 7

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getByteCount()I

    move-result v0

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/graphics/Bitmap;->copyPixelsToBuffer(Ljava/nio/Buffer;)V

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p1

    array-length v0, p1

    div-int/lit8 v0, v0, 0x4

    mul-int/lit8 v0, v0, 0x3

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    array-length v1, p1

    div-int/lit8 v1, v1, 0x4

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    if-eqz p2, :cond_1

    mul-int/lit8 v3, v2, 0x3

    mul-int/lit8 v4, v2, 0x4

    aget-byte v5, p1, v4

    aput-byte v5, v0, v3

    add-int/lit8 v5, v3, 0x1

    add-int/lit8 v6, v4, 0x1

    aget-byte v6, p1, v6

    aput-byte v6, v0, v5

    add-int/lit8 v3, v3, 0x2

    add-int/lit8 v4, v4, 0x2

    aget-byte v4, p1, v4

    aput-byte v4, v0, v3

    goto :goto_1

    :cond_1
    mul-int/lit8 v3, v2, 0x3

    mul-int/lit8 v4, v2, 0x4

    add-int/lit8 v5, v4, 0x2

    aget-byte v5, p1, v5

    aput-byte v5, v0, v3

    add-int/lit8 v5, v3, 0x1

    add-int/lit8 v6, v4, 0x1

    aget-byte v6, p1, v6

    aput-byte v6, v0, v5

    add-int/lit8 v3, v3, 0x2

    aget-byte v4, p1, v4

    aput-byte v4, v0, v3

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    return-object v0
.end method

.method private native bitmapAdjustMoment(JLjava/lang/Object;Ljava/lang/Object;[B[B[BIZF)V
.end method

.method private native bitmapTransferSky(JLjava/lang/Object;Ljava/lang/Object;[BII[BII[B[B[BIZFZ)V
.end method

.method private native freeSkyTransfer(J)V
.end method

.method private getByteFromPath(Ljava/lang/String;)[B
    .locals 2

    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/BitmapUtils;->safeDecodeBitmap(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;[B)Landroid/graphics/Bitmap;

    move-result-object p1

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/xiaomi/skytransfer/SkyTranFilter;->bitmap2RGB(Landroid/graphics/Bitmap;Z)[B

    move-result-object v0

    invoke-static {p1}, Lcom/miui/gallery/util/BitmapUtils;->recycleSilently(Landroid/graphics/Bitmap;)V

    return-object v0
.end method

.method public static getInstance()Lcom/xiaomi/skytransfer/SkyTranFilter;
    .locals 1

    sget-object v0, Lcom/xiaomi/skytransfer/SkyTranFilter;->sInstance:Lcom/xiaomi/skytransfer/SkyTranFilter;

    return-object v0
.end method

.method private native getSkyTransMode(J)I
.end method

.method private init()V
    .locals 2

    iget-boolean v0, p0, Lcom/xiaomi/skytransfer/SkyTranFilter;->mIsLoaded:Z

    if-nez v0, :cond_0

    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyLibraryLoaderHelper;->getInstance()Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyLibraryLoaderHelper;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyLibraryLoaderHelper;->getLibraryDirPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/libsky_transfer_jni.so"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/System;->load(Ljava/lang/String;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/xiaomi/skytransfer/SkyTranFilter;->mIsLoaded:Z
    :try_end_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "SkyTranFilter"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    :goto_0
    iget-boolean v0, p0, Lcom/xiaomi/skytransfer/SkyTranFilter;->mIsLoaded:Z

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/xiaomi/skytransfer/SkyTranFilter;->newSkyTransfer()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/xiaomi/skytransfer/SkyTranFilter;->mNativeObj:J

    :cond_1
    return-void
.end method

.method private native newSkyTransfer()J
.end method

.method private native segment(J[BII[BZZ)V
.end method

.method private transferSky(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;Z)V
    .locals 20

    move-object/from16 v15, p0

    move-object/from16 v0, p4

    if-eqz p1, :cond_6

    if-eqz v0, :cond_6

    if-nez p3, :cond_0

    goto/16 :goto_3

    :cond_0
    iget v2, v0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;->mSkyMode:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_1

    const-string v0, "SkyTranFilter"

    const-string v1, "transfer sky mode is forbidden"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    iget-object v14, v15, Lcom/xiaomi/skytransfer/SkyTranFilter;->mSync:Ljava/lang/Object;

    monitor-enter v14

    :try_start_0
    const-string v2, "SkyTranFilter"

    const-string v3, "transferSky start %d-%d ,%s"

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual/range {p3 .. p3}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v2, v3, v5, v6, v7}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-wide v2, v15, Lcom/xiaomi/skytransfer/SkyTranFilter;->mNativeObj:J

    const-wide/16 v5, 0x0

    cmp-long v7, v2, v5

    if-gtz v7, :cond_2

    const-string v0, "SkyTranFilter"

    const-string v1, "transfer sky native obj is null"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    monitor-exit v14

    return-void

    :cond_2
    new-instance v2, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {p3 .. p3}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v5, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "background"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x0

    invoke-static {v3, v2, v5}, Lcom/miui/gallery/util/BitmapUtils;->safeDecodeBitmap(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;[B)Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v10

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v11

    const/4 v3, 0x1

    invoke-direct {v15, v2, v3}, Lcom/xiaomi/skytransfer/SkyTranFilter;->bitmap2RGB(Landroid/graphics/Bitmap;Z)[B

    move-result-object v9

    invoke-static {v2}, Lcom/miui/gallery/util/BitmapUtils;->recycleSilently(Landroid/graphics/Bitmap;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {p3 .. p3}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v5, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "fore"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v15, v2}, Lcom/xiaomi/skytransfer/SkyTranFilter;->getByteFromPath(Ljava/lang/String;)[B

    move-result-object v12

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {p3 .. p3}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v5, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "whole"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v15, v2}, Lcom/xiaomi/skytransfer/SkyTranFilter;->getByteFromPath(Ljava/lang/String;)[B

    move-result-object v13

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {p3 .. p3}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;->getPath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v5, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "complex"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v15, v2}, Lcom/xiaomi/skytransfer/SkyTranFilter;->getByteFromPath(Ljava/lang/String;)[B

    move-result-object v16

    if-eqz v9, :cond_5

    if-eqz v12, :cond_5

    if-eqz v13, :cond_5

    if-nez v16, :cond_3

    goto :goto_1

    :cond_3
    iget-wide v5, v15, Lcom/xiaomi/skytransfer/SkyTranFilter;->mNativeObj:J

    iget-object v7, v0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;->mMaskData:[B

    iget v8, v0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;->mSegWidth:I

    iget v2, v0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;->mSegHeight:I

    invoke-virtual/range {p3 .. p3}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;->getCate()I

    move-result v17

    iget v0, v0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;->mSkyMode:I

    if-ne v0, v3, :cond_4

    const/4 v0, 0x1

    goto :goto_0

    :cond_4
    const/4 v0, 0x0

    :goto_0
    invoke-virtual/range {p3 .. p3}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;->getProgress()F

    move-result v18
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object/from16 v1, p0

    move/from16 v19, v2

    move-wide v2, v5

    move-object/from16 v4, p1

    move-object/from16 v5, p2

    move-object v6, v7

    move v7, v8

    move/from16 v8, v19

    move-object/from16 v19, v14

    move-object/from16 v14, v16

    move/from16 v15, v17

    move/from16 v16, v0

    move/from16 v17, v18

    move/from16 v18, p5

    :try_start_1
    invoke-direct/range {v1 .. v18}, Lcom/xiaomi/skytransfer/SkyTranFilter;->bitmapTransferSky(JLjava/lang/Object;Ljava/lang/Object;[BII[BII[B[B[BIZFZ)V

    const-string v0, "SkyTranFilter"

    const-string v1, "transferSky end"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    monitor-exit v19

    return-void

    :cond_5
    :goto_1
    move-object/from16 v19, v14

    const-string v0, "SkyTranFilter"

    const-string v1, "res decode failed"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    monitor-exit v19

    return-void

    :catchall_0
    move-exception v0

    move-object/from16 v19, v14

    :goto_2
    monitor-exit v19
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw v0

    :catchall_1
    move-exception v0

    goto :goto_2

    :cond_6
    :goto_3
    return-void
.end method


# virtual methods
.method public getTransferTempData()Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/skytransfer/SkyTranFilter;->mTransferTempData:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;

    return-object v0
.end method

.method public release()V
    .locals 5

    iget-wide v0, p0, Lcom/xiaomi/skytransfer/SkyTranFilter;->mNativeObj:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    iget-wide v0, p0, Lcom/xiaomi/skytransfer/SkyTranFilter;->mNativeObj:J

    invoke-direct {p0, v0, v1}, Lcom/xiaomi/skytransfer/SkyTranFilter;->freeSkyTransfer(J)V

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/xiaomi/skytransfer/SkyTranFilter;->mTransferTempData:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;

    iput-wide v2, p0, Lcom/xiaomi/skytransfer/SkyTranFilter;->mNativeObj:J

    return-void
.end method

.method public segment(Landroid/graphics/Bitmap;)I
    .locals 11

    iget-object v0, p0, Lcom/xiaomi/skytransfer/SkyTranFilter;->mSync:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_0
    iput-object v1, p0, Lcom/xiaomi/skytransfer/SkyTranFilter;->mTransferTempData:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;

    iget-wide v1, p0, Lcom/xiaomi/skytransfer/SkyTranFilter;->mNativeObj:J

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-gtz v5, :cond_0

    invoke-direct {p0}, Lcom/xiaomi/skytransfer/SkyTranFilter;->init()V

    :cond_0
    const-string v1, "SkyTranFilter"

    const-string v2, "segment start"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-wide v1, p0, Lcom/xiaomi/skytransfer/SkyTranFilter;->mNativeObj:J

    cmp-long v5, v1, v3

    const/4 v1, 0x2

    if-gtz v5, :cond_1

    const-string p1, "SkyTranFilter"

    const-string v2, "segment mNativeObj is null"

    invoke-static {p1, v2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    monitor-exit v0

    return v1

    :cond_1
    if-nez p1, :cond_2

    const-string p1, "SkyTranFilter"

    const-string v2, "segment img is null or category < 0"

    invoke-static {p1, v2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    monitor-exit v0

    return v1

    :cond_2
    new-instance v1, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;

    invoke-direct {v1, p1}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v1, p0, Lcom/xiaomi/skytransfer/SkyTranFilter;->mTransferTempData:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;

    const/4 v1, 0x1

    invoke-direct {p0, p1, v1}, Lcom/xiaomi/skytransfer/SkyTranFilter;->bitmap2RGB(Landroid/graphics/Bitmap;Z)[B

    move-result-object v5

    iget-wide v3, p0, Lcom/xiaomi/skytransfer/SkyTranFilter;->mNativeObj:J

    iget-object p1, p0, Lcom/xiaomi/skytransfer/SkyTranFilter;->mTransferTempData:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;

    iget v6, p1, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;->mSegWidth:I

    iget-object p1, p0, Lcom/xiaomi/skytransfer/SkyTranFilter;->mTransferTempData:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;

    iget v7, p1, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;->mSegHeight:I

    iget-object p1, p0, Lcom/xiaomi/skytransfer/SkyTranFilter;->mTransferTempData:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;

    iget-object v8, p1, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;->mMaskData:[B

    const/4 v9, 0x1

    const/4 v10, 0x0

    move-object v2, p0

    invoke-direct/range {v2 .. v10}, Lcom/xiaomi/skytransfer/SkyTranFilter;->segment(J[BII[BZZ)V

    iget-object p1, p0, Lcom/xiaomi/skytransfer/SkyTranFilter;->mTransferTempData:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;

    iget-wide v1, p0, Lcom/xiaomi/skytransfer/SkyTranFilter;->mNativeObj:J

    invoke-direct {p0, v1, v2}, Lcom/xiaomi/skytransfer/SkyTranFilter;->getSkyTransMode(J)I

    move-result v1

    iput v1, p1, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;->mSkyMode:I

    iget-object p1, p0, Lcom/xiaomi/skytransfer/SkyTranFilter;->mTransferTempData:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;

    iget-object p1, p1, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;->mCountDownLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {p1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    const-string p1, "SkyTranFilter"

    const-string v1, "segment end: %d"

    iget-object v2, p0, Lcom/xiaomi/skytransfer/SkyTranFilter;->mTransferTempData:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;

    iget v2, v2, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;->mSkyMode:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {p1, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/xiaomi/skytransfer/SkyTranFilter;->mTransferTempData:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;

    iget p1, p1, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;->mSkyMode:I

    monitor-exit v0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public transferSkyAdjustMoment(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;)V
    .locals 14

    move-object v12, p0

    if-eqz p1, :cond_5

    if-nez p3, :cond_0

    goto/16 :goto_2

    :cond_0
    iget-object v13, v12, Lcom/xiaomi/skytransfer/SkyTranFilter;->mSync:Ljava/lang/Object;

    monitor-enter v13

    :try_start_0
    iget-wide v2, v12, Lcom/xiaomi/skytransfer/SkyTranFilter;->mNativeObj:J

    const-wide/16 v4, 0x0

    cmp-long v6, v2, v4

    if-gtz v6, :cond_1

    const-string v0, "SkyTranFilter"

    const-string v1, "transfer sky native obj is null"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    monitor-exit v13

    return-void

    :cond_1
    const-string v2, "SkyTranFilter"

    const-string v3, "transferSkyAdjustMoment start %s"

    invoke-virtual/range {p3 .. p3}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {p3 .. p3}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "fore"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/xiaomi/skytransfer/SkyTranFilter;->getByteFromPath(Ljava/lang/String;)[B

    move-result-object v6

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {p3 .. p3}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "whole"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/xiaomi/skytransfer/SkyTranFilter;->getByteFromPath(Ljava/lang/String;)[B

    move-result-object v7

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {p3 .. p3}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "complex"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/xiaomi/skytransfer/SkyTranFilter;->getByteFromPath(Ljava/lang/String;)[B

    move-result-object v8

    if-eqz v6, :cond_4

    if-eqz v7, :cond_4

    if-nez v8, :cond_2

    goto :goto_1

    :cond_2
    iget-wide v2, v12, Lcom/xiaomi/skytransfer/SkyTranFilter;->mNativeObj:J

    invoke-virtual/range {p3 .. p3}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;->getCate()I

    move-result v9

    iget-object v4, v12, Lcom/xiaomi/skytransfer/SkyTranFilter;->mTransferTempData:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;

    iget v4, v4, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;->mSkyMode:I

    const/4 v5, 0x1

    if-ne v4, v5, :cond_3

    const/4 v10, 0x1

    goto :goto_0

    :cond_3
    const/4 v4, 0x0

    const/4 v10, 0x0

    :goto_0
    invoke-virtual/range {p3 .. p3}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;->getProgress()F

    move-result v11

    move-object v1, p0

    move-object v4, p1

    move-object/from16 v5, p2

    invoke-direct/range {v1 .. v11}, Lcom/xiaomi/skytransfer/SkyTranFilter;->bitmapAdjustMoment(JLjava/lang/Object;Ljava/lang/Object;[B[B[BIZF)V

    const-string v0, "SkyTranFilter"

    const-string v1, "transferSkyAdjustMoment end"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    monitor-exit v13

    return-void

    :cond_4
    :goto_1
    const-string v0, "SkyTranFilter"

    const-string v1, "res decode failed"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    monitor-exit v13

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v13
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_5
    :goto_2
    return-void
.end method

.method public transferSkyForSave(Landroid/graphics/Bitmap;Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;)V
    .locals 6

    const/4 v2, 0x0

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v3, p2

    move-object v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/xiaomi/skytransfer/SkyTranFilter;->transferSky(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;Z)V

    return-void
.end method

.method public transferSkyForShow(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;)V
    .locals 6

    iget-object v4, p0, Lcom/xiaomi/skytransfer/SkyTranFilter;->mTransferTempData:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-direct/range {v0 .. v5}, Lcom/xiaomi/skytransfer/SkyTranFilter;->transferSky(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferItem;Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;Z)V

    return-void
.end method

.method public waitSegment()Z
    .locals 3

    iget-object v0, p0, Lcom/xiaomi/skytransfer/SkyTranFilter;->mTransferTempData:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/skytransfer/SkyTranFilter;->mTransferTempData:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;->mCountDownLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v2, "SkyTranFilter"

    invoke-static {v2, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    iget-object v0, p0, Lcom/xiaomi/skytransfer/SkyTranFilter;->mTransferTempData:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;

    iget v0, v0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyTransferTempData;->mSkyMode:I

    const/4 v2, 0x2

    if-eq v0, v2, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method
