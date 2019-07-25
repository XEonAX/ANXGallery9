.class Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;
.super Lcom/miui/gallery/editor/photo/core/common/provider/AbstractStickerProvider;
.source "StickerProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider$InstallTask;,
        Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider$InitializeException;
    }
.end annotation


# static fields
.field static final INSTANCE:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;


# instance fields
.field private mCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerItem;",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/graphics/Bitmap;",
            ">;>;"
        }
    .end annotation
.end field

.field private mCategories:Landroid/util/LongSparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LongSparseArray<",
            "Lcom/miui/gallery/editor/photo/core/imports/sticker/CategoryData;",
            ">;"
        }
    .end annotation
.end field

.field private mHistory:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque<",
            "Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerItem;",
            ">;"
        }
    .end annotation
.end field

.field private mIndexFile:Ljava/io/File;

.field private mRecentFile:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;-><init>()V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->INSTANCE:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;

    sget-object v0, Lcom/miui/gallery/editor/photo/core/SdkManager;->INSTANCE:Lcom/miui/gallery/editor/photo/core/SdkManager;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->INSTANCE:Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/SdkManager;->register(Lcom/miui/gallery/editor/photo/core/SdkProvider;)V

    return-void
.end method

.method protected constructor <init>()V
    .locals 1

    sget-object v0, Lcom/miui/gallery/editor/photo/core/Effect;->STICKER:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/core/common/provider/AbstractStickerProvider;-><init>(Lcom/miui/gallery/editor/photo/core/Effect;)V

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->mHistory:Ljava/util/Deque;

    new-instance v0, Landroid/util/LongSparseArray;

    invoke-direct {v0}, Landroid/util/LongSparseArray;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->mCategories:Landroid/util/LongSparseArray;

    new-instance v0, Landroid/util/ArrayMap;

    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->mCache:Ljava/util/Map;

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;)Z
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->doInstall()Z

    move-result p0

    return p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;)Landroid/util/LongSparseArray;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->mCategories:Landroid/util/LongSparseArray;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->notifyInitializeFinish()V

    return-void
.end method

.method private checkResourceVersion(Lorg/json/JSONObject;)Z
    .locals 5

    const/4 v0, 0x1

    const/4 v1, 0x0

    :try_start_0
    const-string v2, "version"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result p1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v2, 0x4

    if-ne p1, v2, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v2, "StickerProvider"

    invoke-static {v2, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    const/4 p1, 0x0

    :goto_0
    if-nez p1, :cond_1

    new-instance v2, Ljava/io/File;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->getApplicationContext()Landroid/app/Application;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Application;->getFilesDir()Ljava/io/File;

    move-result-object v3

    const-string v4, "photo_editor/stickers/"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_1

    sget-object v3, Lcom/miui/gallery/util/MediaFileUtils$FileType;->NORMAL:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-array v0, v0, [Ljava/io/File;

    aput-object v2, v0, v1

    invoke-static {v3, v0}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/io/File;)I

    :cond_1
    return p1
.end method

.method private deleteIndexFile()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->mIndexFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "StickerProvider"

    const-string v1, "index file not found"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->mIndexFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "StickerProvider"

    const-string v1, "delete index file failed"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void
.end method

.method private doInstall()Z
    .locals 10

    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->mIndexFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->loadPackageInfo()Ljava/lang/String;

    move-result-object v1

    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v3}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->checkResourceVersion(Lorg/json/JSONObject;)Z

    move-result v1

    xor-int/2addr v1, v2

    goto :goto_0

    :cond_0
    const-string v1, "StickerProvider"

    const-string v3, "index file not exist"

    invoke-static {v1, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    move-object v3, v0

    const/4 v1, 0x1

    :goto_0
    if-eqz v1, :cond_2

    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->getApplicationContext()Landroid/app/Application;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Application;->getCacheDir()Ljava/io/File;

    move-result-object v3

    const-string v4, "stickers.zip"

    invoke-direct {v1, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider$InitializeException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    invoke-direct {p0, v1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->releaseZip(Ljava/io/File;)V

    invoke-direct {p0, v1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->unzipData(Ljava/io/File;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->mRecentFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->mRecentFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "StickerProvider"

    const-string v3, "delete recent stickers failed"

    invoke-static {v0, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->loadPackageInfo()Ljava/lang/String;

    move-result-object v0

    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider$InitializeException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v0, v1

    goto :goto_1

    :catchall_0
    move-exception v0

    move-object v9, v1

    move-object v1, v0

    move-object v0, v9

    goto/16 :goto_5

    :catch_0
    move-exception v0

    move-object v9, v1

    move-object v1, v0

    move-object v0, v9

    goto :goto_2

    :catch_1
    move-exception v0

    move-object v9, v1

    move-object v1, v0

    move-object v0, v9

    goto :goto_3

    :cond_2
    :goto_1
    :try_start_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-direct {p0, v3}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->loadData(Lorg/json/JSONObject;)V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->readRecentFromFile()V

    const-string v1, "StickerProvider"

    const-string v3, "load package info costs %dms"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    const/4 v8, 0x0

    sub-long/2addr v6, v4

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-static {v1, v3, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_2
    .catch Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider$InitializeException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_3

    const-string v0, "StickerProvider"

    const-string v1, "delete zip file failed"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    return v2

    :catchall_1
    move-exception v1

    goto :goto_5

    :catch_2
    move-exception v1

    :goto_2
    :try_start_3
    const-string v2, "StickerProvider"

    invoke-static {v2, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->deleteIndexFile()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz v0, :cond_4

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_4

    goto :goto_4

    :catch_3
    move-exception v1

    :goto_3
    :try_start_4
    const-string v2, "StickerProvider"

    invoke-static {v2, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->deleteIndexFile()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    if-eqz v0, :cond_4

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_4

    :goto_4
    const-string v0, "StickerProvider"

    const-string v1, "delete zip file failed"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    :cond_4
    const/4 v0, 0x0

    return v0

    :goto_5
    if-eqz v0, :cond_5

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_5

    const-string v0, "StickerProvider"

    const-string v2, "delete zip file failed"

    invoke-static {v0, v2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    :cond_5
    throw v1
.end method

.method private fillRecent(Lorg/json/JSONArray;)V
    .locals 3

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->mHistory:Ljava/util/Deque;

    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerItem;->fromJson(Lorg/json/JSONObject;)Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerItem;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v1

    const-string v2, "StickerProvider"

    invoke-static {v2, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    const-string p1, "StickerProvider"

    const-string v0, "read %d recent items from file"

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->mHistory:Ljava/util/Deque;

    invoke-interface {v1}, Ljava/util/Deque;->size()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method private loadData(Lorg/json/JSONObject;)V
    .locals 22
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider$InitializeException;
        }
    .end annotation

    move-object/from16 v1, p0

    :try_start_0
    const-string v0, "categories"

    move-object/from16 v2, p1

    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    invoke-static {}, Lcom/miui/settings/Settings;->getRegion()Ljava/lang/String;

    move-result-object v2

    const-string v3, "@string/"

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->getApplicationContext()Landroid/app/Application;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/Application;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_0
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v6, v7, :cond_6

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    const-string v8, "region"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_0

    invoke-virtual {v8, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_0

    goto/16 :goto_3

    :cond_0
    const-string v8, "name"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "@string/"

    invoke-virtual {v8, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_5

    invoke-virtual {v8, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    const-string v9, "id"

    invoke-virtual {v7, v9}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v9

    const-string v10, "string"

    const-string v11, "com.miui.gallery"

    invoke-virtual {v4, v8, v10, v11}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v10

    if-nez v10, :cond_1

    const-string v7, "StickerProvider"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "not valid category name string resource:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_3

    :cond_1
    const-string v10, "items"

    invoke-virtual {v7, v10}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v7

    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    const/4 v13, 0x0

    :goto_1
    invoke-virtual {v7}, Lorg/json/JSONArray;->length()I

    move-result v10

    if-ge v13, v10, :cond_4

    invoke-virtual {v7, v13}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v10

    const-string v11, "id"

    invoke-virtual {v10, v11}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v11

    const-string v12, "main"

    invoke-virtual {v10, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v12

    invoke-virtual {v12}, Landroid/net/Uri;->isRelative()Z

    move-result v12

    if-eqz v12, :cond_3

    new-instance v12, Ljava/io/File;

    iget-object v14, v1, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->mIndexFile:Ljava/io/File;

    invoke-virtual {v14}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v14

    invoke-direct {v12, v14, v10}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v12}, Ljava/io/File;->exists()Z

    move-result v14

    if-eqz v14, :cond_2

    invoke-virtual {v12}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v10

    goto :goto_2

    :cond_2
    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider$InitializeException;

    const-string v2, "main url is not found %s"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v10, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider$InitializeException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3
    :goto_2
    move-object/from16 v16, v10

    new-instance v14, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerItem;

    const/4 v12, 0x0

    const/16 v17, 0x0

    int-to-long v10, v11

    move-wide/from16 v18, v10

    move-object v10, v14

    move v11, v12

    move-object/from16 v12, v17

    move/from16 v20, v13

    move-object v5, v14

    move-wide/from16 v13, v18

    move-object/from16 v21, v15

    move-object/from16 v15, v16

    move-object/from16 v17, v8

    invoke-direct/range {v10 .. v17}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerItem;-><init>(SLjava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v10, v21

    invoke-interface {v10, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v13, v20, 0x1

    move-object v15, v10

    const/4 v5, 0x0

    goto :goto_1

    :cond_4
    move-object v10, v15

    new-instance v5, Lcom/miui/gallery/editor/photo/core/imports/sticker/CategoryData;

    const/4 v7, -0x1

    invoke-direct {v5, v9, v7, v8, v10}, Lcom/miui/gallery/editor/photo/core/imports/sticker/CategoryData;-><init>(ISLjava/lang/String;Ljava/util/List;)V

    iget-object v7, v1, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->mCategories:Landroid/util/LongSparseArray;

    int-to-long v8, v9

    invoke-virtual {v7, v8, v9, v5}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    goto :goto_3

    :cond_5
    const-string v5, "StickerProvider"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "not string type category name: "

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_3
    add-int/lit8 v6, v6, 0x1

    const/4 v5, 0x0

    goto/16 :goto_0

    :cond_6
    return-void

    :catch_0
    move-exception v0

    new-instance v2, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider$InitializeException;

    const-string v3, "package info missing"

    invoke-direct {v2, v3, v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider$InitializeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method private loadPackageInfo()Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider$InitializeException;
        }
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    :try_start_0
    new-instance v2, Ljava/io/FileReader;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->mIndexFile:Ljava/io/File;

    invoke-direct {v2, v3}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/16 v1, 0x400

    :try_start_1
    new-array v1, v1, [C

    :goto_0
    invoke-virtual {v2, v1}, Ljava/io/FileReader;->read([C)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append([C)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "StickerProvider"

    const-string v3, "load pkg info finished"

    invoke-static {v1, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    invoke-virtual {v2}, Ljava/io/FileReader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1

    :catch_0
    move-exception v1

    const-string v2, "StickerProvider"

    invoke-static {v2, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_1
    return-object v0

    :catchall_0
    move-exception v0

    move-object v1, v2

    goto :goto_4

    :catch_1
    move-exception v0

    move-object v1, v2

    goto :goto_2

    :catch_2
    move-object v1, v2

    goto :goto_3

    :catchall_1
    move-exception v0

    goto :goto_4

    :catch_3
    move-exception v0

    :goto_2
    :try_start_3
    new-instance v2, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider$InitializeException;

    const-string v3, "read index file failed"

    invoke-direct {v2, v3, v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider$InitializeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    :catch_4
    :goto_3
    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider$InitializeException;

    const-string v2, "index file is not found"

    invoke-direct {v0, v2}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider$InitializeException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :goto_4
    if-eqz v1, :cond_1

    :try_start_4
    invoke-virtual {v1}, Ljava/io/FileReader;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_5

    goto :goto_5

    :catch_5
    move-exception v1

    const-string v2, "StickerProvider"

    invoke-static {v2, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1
    :goto_5
    throw v0
.end method

.method private readRecentFromFile()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->mRecentFile:Ljava/io/File;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/utils/IoUtils;->openReader(Ljava/io/File;)Ljava/io/Reader;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/16 v1, 0x80

    :try_start_0
    new-array v1, v1, [C

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    :goto_0
    invoke-virtual {v0, v1}, Ljava/io/Reader;->read([C)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_1

    const/4 v4, 0x0

    invoke-virtual {v2, v1, v4, v3}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_1
    new-instance v1, Lorg/json/JSONArray;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->fillRecent(Lorg/json/JSONArray;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v1

    goto :goto_2

    :catch_0
    move-exception v1

    :try_start_1
    const-string v2, "StickerProvider"

    invoke-static {v2, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    :catch_1
    move-exception v1

    const-string v2, "StickerProvider"

    invoke-static {v2, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_1
    const-string v1, "StickerProvider"

    invoke-static {v1, v0}, Lcom/miui/gallery/editor/photo/utils/IoUtils;->close(Ljava/lang/String;Ljava/io/Closeable;)V

    return-void

    :goto_2
    const-string v2, "StickerProvider"

    invoke-static {v2, v0}, Lcom/miui/gallery/editor/photo/utils/IoUtils;->close(Ljava/lang/String;Ljava/io/Closeable;)V

    throw v1
.end method

.method private releaseZip(Ljava/io/File;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider$InitializeException;
        }
    .end annotation

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->getApplicationContext()Landroid/app/Application;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Application;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    const-string v2, "stickers.zip"

    invoke-virtual {v1, v2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    :try_start_1
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    const/16 p1, 0x1000

    :try_start_2
    new-array p1, p1, [B
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_0
    :try_start_3
    invoke-virtual {v1, p1}, Ljava/io/InputStream;->read([B)I

    move-result v0

    const/4 v3, -0x1

    if-eq v0, v3, :cond_0

    const/4 v3, 0x0

    invoke-virtual {v2, p1, v3, v0}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0

    :cond_0
    invoke-virtual {v2}, Ljava/io/OutputStream;->flush()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    const-string p1, "StickerProvider"

    invoke-static {p1, v1}, Lcom/miui/gallery/editor/photo/utils/IoUtils;->close(Ljava/lang/String;Ljava/io/Closeable;)V

    const-string p1, "StickerProvider"

    invoke-static {p1, v2}, Lcom/miui/gallery/editor/photo/utils/IoUtils;->close(Ljava/lang/String;Ljava/io/Closeable;)V

    return-void

    :catch_0
    move-exception p1

    :try_start_4
    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider$InitializeException;

    const-string v3, "release failed during release zip file"

    invoke-direct {v0, v3, p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider$InitializeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :catchall_0
    move-exception p1

    move-object v0, v2

    goto :goto_1

    :catchall_1
    move-exception p1

    goto :goto_1

    :catch_1
    move-exception p1

    :try_start_5
    new-instance v2, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider$InitializeException;

    const-string v3, "release assets\'s zip file failed"

    invoke-direct {v2, v3, p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider$InitializeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :catchall_2
    move-exception p1

    move-object v1, v0

    goto :goto_1

    :catch_2
    move-exception p1

    :try_start_6
    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider$InitializeException;

    const-string v2, "missing assets file"

    invoke-direct {v1, v2, p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider$InitializeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    :goto_1
    const-string v2, "StickerProvider"

    invoke-static {v2, v1}, Lcom/miui/gallery/editor/photo/utils/IoUtils;->close(Ljava/lang/String;Ljava/io/Closeable;)V

    const-string v1, "StickerProvider"

    invoke-static {v1, v0}, Lcom/miui/gallery/editor/photo/utils/IoUtils;->close(Ljava/lang/String;Ljava/io/Closeable;)V

    throw p1
.end method

.method private unzipData(Ljava/io/File;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider$InitializeException;
        }
    .end annotation

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_3

    new-instance v2, Ljava/io/File;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->getApplicationContext()Landroid/app/Application;

    move-result-object v3

    invoke-virtual {v3}, Landroid/app/Application;->getFilesDir()Ljava/io/File;

    move-result-object v3

    const-string v4, "photo_editor/stickers/"

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_0

    sget-object v3, Lcom/miui/gallery/util/MediaFileUtils$FileType;->NORMAL:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/io/File;

    const/4 v5, 0x0

    aput-object v2, v4, v5

    invoke-static {v3, v4}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/io/File;)I

    :cond_0
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_1

    const-string v3, "StickerProvider"

    const-string v4, "delete folder failed"

    invoke-static {v3, v4}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    move-result v3

    if-eqz v3, :cond_2

    :goto_0
    :try_start_0
    invoke-static {p1, v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/ZipUtils;->unzip(Ljava/io/File;Ljava/io/File;)V

    const-string p1, "StickerProvider"

    const-string v2, "unzip files finish, costs %dms"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    const/4 v5, 0x0

    sub-long/2addr v3, v0

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {p1, v2, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider$InitializeException;

    const-string v1, "copy directory failed"

    invoke-direct {v0, v1, p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider$InitializeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    :cond_2
    new-instance p1, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider$InitializeException;

    const-string v0, "create folder stickers/ failed"

    invoke-direct {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider$InitializeException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    new-instance p1, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider$InitializeException;

    const-string v0, "resource missing"

    invoke-direct {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider$InitializeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public createEngine(Landroid/content/Context;)Lcom/miui/gallery/editor/photo/core/RenderEngine;
    .locals 0

    new-instance p1, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEngine;

    invoke-direct {p1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerEngine;-><init>()V

    return-object p1
.end method

.method fromCache(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerItem;)Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->mCache:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/ref/Reference;

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/Bitmap;

    :goto_0
    return-object p1
.end method

.method public install()V
    .locals 3

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider$InstallTask;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider$InstallTask;-><init>(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider$1;)V

    sget-object v1, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Void;

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider$InstallTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public list()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/common/model/StickerCategory;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->mCategories:Landroid/util/LongSparseArray;

    invoke-virtual {v1}, Landroid/util/LongSparseArray;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v1, 0x0

    :goto_0
    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->mCategories:Landroid/util/LongSparseArray;

    invoke-virtual {v2}, Landroid/util/LongSparseArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->mCategories:Landroid/util/LongSparseArray;

    invoke-virtual {v2, v1}, Landroid/util/LongSparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public list(J)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/common/model/StickerData;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->mCategories:Landroid/util/LongSparseArray;

    invoke-virtual {v0, p1, p2}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/imports/sticker/CategoryData;

    iget-object p1, p1, Lcom/miui/gallery/editor/photo/core/imports/sticker/CategoryData;->stickerList:Ljava/util/List;

    return-object p1
.end method

.method protected onActivityCreate()V
    .locals 3

    invoke-super {p0}, Lcom/miui/gallery/editor/photo/core/common/provider/AbstractStickerProvider;->onActivityCreate()V

    const-string v0, "StickerProvider"

    const-string v1, "perform application creating, install stickers"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->getApplicationContext()Landroid/app/Application;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Application;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "photo_editor/stickers/package.json"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->mIndexFile:Ljava/io/File;

    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->getApplicationContext()Landroid/app/Application;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Application;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "photo_editor/stickers/recent.json"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->mRecentFile:Ljava/io/File;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->install()V

    return-void
.end method

.method public bridge synthetic onCreateFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->onCreateFragment()Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;

    move-result-object v0

    return-object v0
.end method

.method public onCreateFragment()Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerFragment;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerFragment;-><init>()V

    return-object v0
.end method

.method putToCache(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerItem;Landroid/graphics/Bitmap;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->mCache:Ljava/util/Map;

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public recent()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/common/model/StickerData;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->mHistory:Ljava/util/Deque;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method touch(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerItem;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->mHistory:Ljava/util/Deque;

    invoke-interface {v0, p1}, Ljava/util/Deque;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->mHistory:Ljava/util/Deque;

    invoke-interface {v0, p1}, Ljava/util/Deque;->remove(Ljava/lang/Object;)Z

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->mHistory:Ljava/util/Deque;

    invoke-interface {v0, p1}, Ljava/util/Deque;->push(Ljava/lang/Object;)V

    return-void
.end method

.method writeRecentToFile()V
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->mHistory:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->mRecentFile:Ljava/io/File;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/utils/IoUtils;->openWriter(Ljava/io/File;)Ljava/io/Writer;

    move-result-object v2

    if-nez v2, :cond_1

    const-string v3, "StickerProvider"

    const-string v4, "open recent file failed."

    invoke-static {v3, v4}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerProvider;->mHistory:Ljava/util/Deque;

    invoke-interface {v5}, Ljava/util/Deque;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerItem;

    invoke-static {v6}, Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerItem;->toJson(Lcom/miui/gallery/editor/photo/core/imports/sticker/StickerItem;)Lorg/json/JSONObject;

    move-result-object v6

    if-nez v6, :cond_3

    const-string v6, "StickerProvider"

    const-string v7, "jsonfy failed"

    invoke-static {v6, v7}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    invoke-virtual {v3, v6}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    add-int/lit8 v4, v4, 0x1

    :goto_0
    const/16 v6, 0xa

    if-lt v4, v6, :cond_2

    :cond_4
    const-string v5, "StickerProvider"

    const-string v6, "write %d recent items to file"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v5, v6, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :try_start_0
    invoke-virtual {v3}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/Writer;->write(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_1
    const-string v3, "StickerProvider"

    invoke-static {v3, v2}, Lcom/miui/gallery/editor/photo/utils/IoUtils;->close(Ljava/lang/String;Ljava/io/Closeable;)V

    goto :goto_2

    :catchall_0
    move-exception v0

    goto :goto_3

    :catch_0
    move-exception v3

    :try_start_1
    const-string v4, "StickerProvider"

    invoke-static {v4, v3}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :goto_2
    const-string v2, "StickerProvider"

    const-string v3, "write to file costs %dms"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v0

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    :goto_3
    const-string v1, "StickerProvider"

    invoke-static {v1, v2}, Lcom/miui/gallery/editor/photo/utils/IoUtils;->close(Ljava/lang/String;Ljava/io/Closeable;)V

    throw v0
.end method
