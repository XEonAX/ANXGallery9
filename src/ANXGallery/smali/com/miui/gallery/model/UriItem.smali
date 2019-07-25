.class public Lcom/miui/gallery/model/UriItem;
.super Lcom/miui/gallery/model/BaseDataItem;
.source "UriItem.java"


# instance fields
.field private mCacheFile:Ljava/io/File;

.field private transient mUri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Landroid/net/Uri;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/model/BaseDataItem;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/model/UriItem;->mUri:Landroid/net/Uri;

    return-void
.end method

.method private isCacheValidate()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/model/UriItem;->mCacheFile:Ljava/io/File;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/model/UriItem;->mCacheFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private openOrDownloadInner()Landroid/os/ParcelFileDescriptor;
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/model/UriItem;->mUri:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string v1, "content"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "android.resource"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "file"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    :try_start_0
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/model/UriItem;->mUri:Landroid/net/Uri;

    const-string v2, "r"

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    const-string v1, "UriItem"

    const-string v2, "fail to open %s %s"

    iget-object v3, p0, Lcom/miui/gallery/model/UriItem;->mUri:Landroid/net/Uri;

    invoke-static {v1, v2, v3, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/model/UriItem;->mUri:Landroid/net/Uri;

    return-void
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    iget-object v0, p0, Lcom/miui/gallery/model/UriItem;->mUri:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public checkOriginalFileExist()Z
    .locals 3

    invoke-direct {p0}, Lcom/miui/gallery/model/UriItem;->isCacheValidate()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/model/UriItem;->mUri:Landroid/net/Uri;

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/model/UriItem;->openOrDownloadInner()Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    if-eqz v0, :cond_1

    :try_start_0
    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string v0, "UriItem"

    const-string v2, "File descriptor close failed"

    invoke-static {v0, v2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return v1

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public createNSGifDecoder(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Lcom/miui/gallery/util/gifdecoder/NSGifDecode;
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/model/UriItem;->isCacheValidate()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/model/UriItem;->mCacheFile:Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/gifdecoder/NSGifDecode;->create(Ljava/lang/String;)Lcom/miui/gallery/util/gifdecoder/NSGifDecode;

    move-result-object p1

    return-object p1

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/model/UriItem;->openOrDownloadInner()Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    :try_start_0
    invoke-interface {p1}, Lcom/miui/gallery/threadpool/ThreadPool$JobContext;->isCancelled()Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p1, :cond_1

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return-object v1

    :cond_1
    :try_start_1
    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object p1

    invoke-static {p1, v1}, Lcom/miui/gallery/util/gifdecoder/NSGifDecode;->create(Ljava/io/FileDescriptor;[B)Lcom/miui/gallery/util/gifdecoder/NSGifDecode;

    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return-object p1

    :catchall_0
    move-exception p1

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    throw p1

    :cond_2
    return-object v1
.end method

.method public getDetailInfo(Landroid/content/Context;)Lcom/miui/gallery/model/PhotoDetailInfo;
    .locals 6

    invoke-super {p0, p1}, Lcom/miui/gallery/model/BaseDataItem;->getDetailInfo(Landroid/content/Context;)Lcom/miui/gallery/model/PhotoDetailInfo;

    move-result-object v0

    const-string v1, "file"

    iget-object v2, p0, Lcom/miui/gallery/model/UriItem;->mUri:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/model/UriItem;->mUri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/model/UriItem;->isCacheValidate()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/model/UriItem;->mCacheFile:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_1
    move-object v1, v2

    :goto_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v3, 0x1

    if-nez v1, :cond_3

    invoke-virtual {p0}, Lcom/miui/gallery/model/UriItem;->isVideo()Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/model/UriItem;->getOriginalPath()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/model/PhotoDetailInfo;->extractVideoAttr(Lcom/miui/gallery/model/PhotoDetailInfo;Ljava/lang/String;)V

    goto :goto_3

    :cond_2
    invoke-virtual {p0}, Lcom/miui/gallery/model/UriItem;->getOriginalPath()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1, v3}, Lcom/miui/gallery/model/PhotoDetailInfo;->extractExifInfo(Lcom/miui/gallery/model/PhotoDetailInfo;Ljava/lang/String;Z)V

    goto :goto_3

    :cond_3
    invoke-virtual {p0}, Lcom/miui/gallery/model/UriItem;->isVideo()Z

    move-result v1

    if-nez v1, :cond_4

    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    iget-object v1, p0, Lcom/miui/gallery/model/UriItem;->mUri:Landroid/net/Uri;

    invoke-virtual {p1, v1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    invoke-virtual {p1}, Ljava/io/InputStream;->available()I

    move-result v1

    int-to-long v4, v1

    new-instance v1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    iput v3, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    iput-boolean v3, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    invoke-static {p1, v2, v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    const/4 v2, 0x3

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V

    const/4 v2, 0x4

    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V

    const/4 v2, 0x5

    iget v1, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    goto :goto_3

    :catchall_0
    move-exception v0

    goto :goto_2

    :catch_0
    move-exception v1

    move-object v2, p1

    goto :goto_1

    :catchall_1
    move-exception v0

    move-object p1, v2

    goto :goto_2

    :catch_1
    move-exception v1

    :goto_1
    :try_start_2
    const-string p1, "UriItem"

    invoke-static {p1, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    invoke-static {v2}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    goto :goto_3

    :goto_2
    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    throw v0

    :cond_4
    :goto_3
    return-object v0
.end method

.method public getOriginalPath()Ljava/lang/String;
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/model/UriItem;->isCacheValidate()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/model/UriItem;->mCacheFile:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/model/UriItem;->mUri:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getViewSubTitle(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/model/UriItem;->mUri:Landroid/net/Uri;

    invoke-static {v0}, Lcom/miui/gallery/util/UriUtil;->isNetUri(Landroid/net/Uri;)Z

    move-result v0

    if-eqz v0, :cond_0

    const v0, 0x7f10077d

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    invoke-super {p0, p1}, Lcom/miui/gallery/model/BaseDataItem;->getViewSubTitle(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getViewTitle(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/model/UriItem;->mUri:Landroid/net/Uri;

    invoke-static {v0}, Lcom/miui/gallery/util/UriUtil;->isNetUri(Landroid/net/Uri;)Z

    move-result v0

    if-eqz v0, :cond_0

    const v0, 0x7f100510

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    invoke-super {p0, p1}, Lcom/miui/gallery/model/BaseDataItem;->getViewTitle(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public initSupportOperations()I
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/model/UriItem;->getMimeType()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/BitmapUtils;->isSupportedByRegionDecoder(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const v0, 0x80040

    goto :goto_0

    :cond_0
    const/high16 v0, 0x80000

    :goto_0
    return v0
.end method

.method public save(Landroid/app/Activity;Lcom/miui/gallery/ui/SaveUriDialogFragment$OnCompleteListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/model/UriItem;->mUri:Landroid/net/Uri;

    invoke-static {p1, v0, p2}, Lcom/miui/gallery/ui/SaveUriDialogFragment;->show(Landroid/app/Activity;Landroid/net/Uri;Lcom/miui/gallery/ui/SaveUriDialogFragment$OnCompleteListener;)V

    return-void
.end method
