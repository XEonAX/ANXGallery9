.class public Lcom/miui/gallery/util/FileCompressTask;
.super Ljava/lang/Object;
.source "FileCompressTask.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/util/FileCompressTask$OnCompressListener;
    }
.end annotation


# instance fields
.field private mCompressFolder:Ljava/lang/String;

.field private mCompressItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mCompressListener:Lcom/miui/gallery/util/FileCompressTask$OnCompressListener;

.field private mDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;


# direct methods
.method public constructor <init>(Ljava/util/List;Lcom/miui/gallery/util/FileCompressTask$OnCompressListener;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/miui/gallery/util/FileCompressTask$OnCompressListener;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/util/FileCompressTask;->mCompressItems:Ljava/util/List;

    new-instance p1, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    sget-object v0, Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;->EXACTLY:Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageScaleType(Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    sget-object v0, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->bitmapConfig(Landroid/graphics/Bitmap$Config;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/util/FileCompressTask;->mDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    iput-object p2, p0, Lcom/miui/gallery/util/FileCompressTask;->mCompressListener:Lcom/miui/gallery/util/FileCompressTask$OnCompressListener;

    iput-object p3, p0, Lcom/miui/gallery/util/FileCompressTask;->mCompressFolder:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/util/FileCompressTask;)Lcom/miui/gallery/util/FileCompressTask$OnCompressListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/util/FileCompressTask;->mCompressListener:Lcom/miui/gallery/util/FileCompressTask$OnCompressListener;

    return-object p0
.end method


# virtual methods
.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 16

    move-object/from16 v1, p0

    iget-object v0, v1, Lcom/miui/gallery/util/FileCompressTask;->mCompressItems:Ljava/util/List;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    const/4 v2, 0x0

    if-eqz v0, :cond_7

    iget-object v0, v1, Lcom/miui/gallery/util/FileCompressTask;->mCompressItems:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    new-instance v6, Ljava/io/File;

    iget-object v0, v1, Lcom/miui/gallery/util/FileCompressTask;->mCompressFolder:Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/util/StorageUtils;->getSafePathInPriorStorageForUnadapted(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v6, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v0

    const/4 v7, 0x0

    const/4 v8, 0x1

    if-eqz v0, :cond_0

    sget-object v0, Lcom/miui/gallery/util/MediaFileUtils$FileType;->FOLDER:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-array v9, v8, [Ljava/io/File;

    aput-object v6, v9, v7

    invoke-static {v0, v9}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/io/File;)I

    :cond_0
    invoke-static {v6, v8}, Lcom/miui/gallery/util/FileUtils;->createFolder(Ljava/io/File;Z)Z

    iget-object v0, v1, Lcom/miui/gallery/util/FileCompressTask;->mCompressItems:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_1
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v10, v0

    check-cast v10, Ljava/lang/String;

    invoke-interface/range {p1 .. p1}, Lcom/miui/gallery/threadpool/ThreadPool$JobContext;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_2

    return-object v2

    :cond_2
    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    sget-object v11, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->FILE:Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;

    invoke-virtual {v11, v10}, Lcom/nostra13/universalimageloader/core/download/ImageDownloader$Scheme;->wrap(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    iget-object v12, v1, Lcom/miui/gallery/util/FileCompressTask;->mDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    invoke-virtual {v0, v11, v12}, Lcom/nostra13/universalimageloader/core/ImageLoader;->loadImageSync(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/BitmapUtils;->isValidate(Landroid/graphics/Bitmap;)Z

    move-result v11

    if-eqz v11, :cond_5

    invoke-static {v10}, Lcom/miui/gallery/util/FileUtils;->getFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lcom/miui/gallery/util/FileUtils;->getFileTitle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    new-instance v12, Ljava/io/File;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v14, ".jpg"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v6, v13}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v12}, Ljava/io/File;->exists()Z

    move-result v13

    if-eqz v13, :cond_3

    new-instance v12, Ljava/io/File;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, "_"

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    invoke-virtual {v13, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v11, ".jpg"

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v12, v6, v11}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    :cond_3
    const/high16 v11, 0x3f800000    # 1.0f

    :try_start_0
    new-instance v13, Ljava/io/FileOutputStream;

    invoke-direct {v13, v12}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    sget-object v14, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v15, 0x5a

    invoke-virtual {v0, v14, v15, v13}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    invoke-virtual {v12}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    invoke-static {v13}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    add-int/lit8 v7, v7, 0x1

    iget-object v0, v1, Lcom/miui/gallery/util/FileCompressTask;->mCompressListener:Lcom/miui/gallery/util/FileCompressTask$OnCompressListener;

    if-eqz v0, :cond_1

    int-to-float v0, v7

    mul-float v0, v0, v11

    int-to-float v10, v3

    div-float/2addr v0, v10

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v10

    new-instance v11, Lcom/miui/gallery/util/FileCompressTask$1;

    invoke-direct {v11, v1, v0}, Lcom/miui/gallery/util/FileCompressTask$1;-><init>(Lcom/miui/gallery/util/FileCompressTask;F)V

    invoke-virtual {v10, v11}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    goto/16 :goto_0

    :catch_0
    move-exception v0

    goto :goto_1

    :catchall_0
    move-exception v0

    move-object v13, v2

    goto :goto_2

    :catch_1
    move-exception v0

    move-object v13, v2

    :goto_1
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    invoke-static {v13}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    add-int/lit8 v7, v7, 0x1

    iget-object v0, v1, Lcom/miui/gallery/util/FileCompressTask;->mCompressListener:Lcom/miui/gallery/util/FileCompressTask$OnCompressListener;

    if-eqz v0, :cond_5

    int-to-float v0, v7

    mul-float v0, v0, v11

    int-to-float v11, v3

    div-float/2addr v0, v11

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v11

    new-instance v12, Lcom/miui/gallery/util/FileCompressTask$1;

    invoke-direct {v12, v1, v0}, Lcom/miui/gallery/util/FileCompressTask$1;-><init>(Lcom/miui/gallery/util/FileCompressTask;F)V

    invoke-virtual {v11, v12}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    goto :goto_3

    :catchall_1
    move-exception v0

    :goto_2
    invoke-static {v13}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    add-int/2addr v7, v8

    iget-object v2, v1, Lcom/miui/gallery/util/FileCompressTask;->mCompressListener:Lcom/miui/gallery/util/FileCompressTask$OnCompressListener;

    if-eqz v2, :cond_4

    int-to-float v2, v7

    mul-float v2, v2, v11

    int-to-float v3, v3

    div-float/2addr v2, v3

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v3

    new-instance v4, Lcom/miui/gallery/util/FileCompressTask$1;

    invoke-direct {v4, v1, v2}, Lcom/miui/gallery/util/FileCompressTask$1;-><init>(Lcom/miui/gallery/util/FileCompressTask;F)V

    invoke-virtual {v3, v4}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    :cond_4
    throw v0

    :cond_5
    :goto_3
    invoke-interface {v5, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :cond_6
    iget-object v0, v1, Lcom/miui/gallery/util/FileCompressTask;->mCompressListener:Lcom/miui/gallery/util/FileCompressTask$OnCompressListener;

    if-eqz v0, :cond_7

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    new-instance v3, Lcom/miui/gallery/util/FileCompressTask$2;

    invoke-direct {v3, v1, v4, v5}, Lcom/miui/gallery/util/FileCompressTask$2;-><init>(Lcom/miui/gallery/util/FileCompressTask;Ljava/util/List;Ljava/util/List;)V

    invoke-virtual {v0, v3}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    :cond_7
    return-object v2
.end method
