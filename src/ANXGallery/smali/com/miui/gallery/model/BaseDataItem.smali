.class public Lcom/miui/gallery/model/BaseDataItem;
.super Ljava/lang/Object;
.source "BaseDataItem.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/model/BaseDataItem$Func;,
        Lcom/miui/gallery/model/BaseDataItem$DisplayBetterPath;
    }
.end annotation


# static fields
.field private static TAG:Ljava/lang/String; = "BaseDataItem"


# instance fields
.field protected mBurstGroup:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/model/BaseDataItem;",
            ">;"
        }
    .end annotation
.end field

.field private transient mCacheLock:Ljava/util/concurrent/locks/ReentrantLock;

.field protected mContentDescription:Ljava/lang/String;

.field protected mCreateTime:J

.field private volatile transient mDisplayBetterFileSize:J

.field private volatile transient mDisplayBetterPath:Lcom/miui/gallery/model/BaseDataItem$DisplayBetterPath;

.field protected mDuration:I

.field protected mFilePath:Ljava/lang/String;

.field protected mHeight:I

.field private mIsBurstItem:Z

.field protected mIsSecret:Z

.field protected mKey:J

.field protected mLatitude:D

.field protected mLocalGroupId:J

.field protected mLocation:Ljava/lang/String;

.field protected mLongitude:D

.field protected mMicroPath:Ljava/lang/String;

.field protected mMimeType:Ljava/lang/String;

.field protected volatile mMotionOffset:J

.field protected mOrientation:I

.field protected mSecretKey:[B

.field protected mSize:J

.field protected volatile mSpecialTypeFlags:J

.field private volatile transient mSupportOperations:I

.field protected mThumbPath:Ljava/lang/String;

.field protected mTitle:Ljava/lang/String;

.field protected mWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mDuration:I

    const-wide/16 v1, -0x1

    iput-wide v1, p0, Lcom/miui/gallery/model/BaseDataItem;->mSpecialTypeFlags:J

    new-instance v3, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v3}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v3, p0, Lcom/miui/gallery/model/BaseDataItem;->mCacheLock:Ljava/util/concurrent/locks/ReentrantLock;

    new-instance v3, Lcom/miui/gallery/model/BaseDataItem$DisplayBetterPath;

    const/4 v4, 0x0

    invoke-direct {v3, p0, v4}, Lcom/miui/gallery/model/BaseDataItem$DisplayBetterPath;-><init>(Lcom/miui/gallery/model/BaseDataItem;Lcom/miui/gallery/model/BaseDataItem$1;)V

    iput-object v3, p0, Lcom/miui/gallery/model/BaseDataItem;->mDisplayBetterPath:Lcom/miui/gallery/model/BaseDataItem$DisplayBetterPath;

    iput v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mSupportOperations:I

    iput-wide v1, p0, Lcom/miui/gallery/model/BaseDataItem;->mDisplayBetterFileSize:J

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mCreateTime:J

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/model/BaseDataItem;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/model/BaseDataItem;->mSupportOperations:I

    return p0
.end method

.method static synthetic access$102(Lcom/miui/gallery/model/BaseDataItem;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/model/BaseDataItem;->mSupportOperations:I

    return p1
.end method

.method static synthetic access$200(Lcom/miui/gallery/model/BaseDataItem;)Lcom/miui/gallery/model/BaseDataItem$DisplayBetterPath;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/model/BaseDataItem;->mDisplayBetterPath:Lcom/miui/gallery/model/BaseDataItem$DisplayBetterPath;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/model/BaseDataItem;)J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mDisplayBetterFileSize:J

    return-wide v0
.end method

.method private lock()Z
    .locals 5

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->isMainThread()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/model/BaseDataItem;->mCacheLock:Ljava/util/concurrent/locks/ReentrantLock;

    const-wide/16 v2, 0xc8

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v2, v3, v4}, Ljava/util/concurrent/locks/ReentrantLock;->tryLock(JLjava/util/concurrent/TimeUnit;)Z

    move-result v1
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    move v0, v1

    goto :goto_0

    :catch_0
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    :goto_0
    sget-object v1, Lcom/miui/gallery/model/BaseDataItem;->TAG:Ljava/lang/String;

    const-string v2, "UI thread acquired %s"

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mCacheLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    const/4 v0, 0x1

    return v0
.end method

.method private refillBetterPath()V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->checkOriginalFileExist()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x3

    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/model/BaseDataItem;->setPathDisplayBetter(ILjava/lang/String;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->getThumnailPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x2

    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->getThumnailPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/model/BaseDataItem;->setPathDisplayBetter(ILjava/lang/String;)V

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->getMicroPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->getMicroPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/model/BaseDataItem;->setPathDisplayBetter(ILjava/lang/String;)V

    :cond_2
    :goto_0
    return-void
.end method

.method private safeRun(Lcom/miui/gallery/model/BaseDataItem$Func;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/miui/gallery/model/BaseDataItem$Func<",
            "TT;>;)TT;"
        }
    .end annotation

    invoke-direct {p0}, Lcom/miui/gallery/model/BaseDataItem;->lock()Z

    move-result v0

    if-eqz v0, :cond_0

    :try_start_0
    invoke-interface {p1}, Lcom/miui/gallery/model/BaseDataItem$Func;->doFunc()Ljava/lang/Object;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-direct {p0}, Lcom/miui/gallery/model/BaseDataItem;->unlock()V

    return-object p1

    :catchall_0
    move-exception p1

    invoke-direct {p0}, Lcom/miui/gallery/model/BaseDataItem;->unlock()V

    throw p1

    :cond_0
    invoke-interface {p1}, Lcom/miui/gallery/model/BaseDataItem$Func;->doFunc()Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method private unlock()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mCacheLock:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    return-void
.end method


# virtual methods
.method public checkOriginalFileExist()Z
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public createNSGifDecoder(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Lcom/miui/gallery/util/gifdecoder/NSGifDecode;
    .locals 5

    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    const/4 v0, 0x0

    if-nez p1, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->isSecret()Z

    move-result p1

    if-eqz p1, :cond_0

    :try_start_0
    new-instance p1, Ljava/io/File;

    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p1, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/high16 v1, 0x30000000

    invoke-static {p1, v1}, Landroid/os/ParcelFileDescriptor;->open(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    invoke-virtual {p1}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v1

    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->getSecretKey()[B

    move-result-object v2

    invoke-static {v1, v2}, Lcom/miui/gallery/util/gifdecoder/NSGifDecode;->create(Ljava/io/FileDescriptor;[B)Lcom/miui/gallery/util/gifdecoder/NSGifDecode;

    move-result-object v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return-object v1

    :catch_0
    move-exception v1

    goto :goto_0

    :catchall_0
    move-exception p1

    move-object v4, v0

    move-object v0, p1

    move-object p1, v4

    goto :goto_1

    :catch_1
    move-exception v1

    move-object p1, v0

    :goto_0
    :try_start_2
    sget-object v2, Lcom/miui/gallery/model/BaseDataItem;->TAG:Ljava/lang/String;

    const-string v3, "createNSGifDecoder failed %s"

    invoke-static {v2, v3, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    goto :goto_2

    :catchall_1
    move-exception v0

    :goto_1
    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    throw v0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/gifdecoder/NSGifDecode;->create(Ljava/lang/String;)Lcom/miui/gallery/util/gifdecoder/NSGifDecode;

    move-result-object p1

    return-object p1

    :cond_1
    :goto_2
    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 6

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    instance-of v1, p1, Lcom/miui/gallery/model/BaseDataItem;

    if-eqz v1, :cond_1

    check-cast p1, Lcom/miui/gallery/model/BaseDataItem;

    iget-wide v1, p0, Lcom/miui/gallery/model/BaseDataItem;->mKey:J

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getKey()J

    move-result-wide v3

    cmp-long v5, v1, v3

    if-nez v5, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/util/StringUtils;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/miui/gallery/util/StringUtils;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getThumnailPath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/StringUtils;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->getThumnailPath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/util/StringUtils;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0

    :cond_1
    return v0
.end method

.method public getBigPhotoImageSize()Lcom/nostra13/universalimageloader/core/assist/ImageSize;
    .locals 1

    sget-object v0, Lcom/miui/gallery/Config$BigPhotoConfig;->BIG_PHOTO_SIZE_DEFAULT:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    return-object v0
.end method

.method public getBurstGroup()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/model/BaseDataItem;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mBurstGroup:Ljava/util/List;

    return-object v0
.end method

.method public getBurstKeys()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mBurstGroup:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/miui/gallery/model/BaseDataItem;->mBurstGroup:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iget-object v1, p0, Lcom/miui/gallery/model/BaseDataItem;->mBurstGroup:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v2}, Lcom/miui/gallery/model/BaseDataItem;->getKey()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public getContentDescription(Landroid/content/Context;)Ljava/lang/String;
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mContentDescription:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mCreateTime:J

    iget-object v2, p0, Lcom/miui/gallery/model/BaseDataItem;->mLocation:Ljava/lang/String;

    iget-object v3, p0, Lcom/miui/gallery/model/BaseDataItem;->mMimeType:Ljava/lang/String;

    invoke-static {p1, v0, v1, v2, v3}, Lcom/miui/gallery/util/TalkBackUtil;->getContentDescriptionForImage(Landroid/content/Context;JLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/model/BaseDataItem;->mContentDescription:Ljava/lang/String;

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/model/BaseDataItem;->mContentDescription:Ljava/lang/String;

    return-object p1
.end method

.method public getContentUriForExternal()Landroid/net/Uri;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mFilePath:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/miui/gallery/model/BaseDataItem;->mFilePath:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mThumbPath:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/miui/gallery/model/BaseDataItem;->mThumbPath:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    return-object v0

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public getCoordidate([D)V
    .locals 3

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    iget-wide v1, p0, Lcom/miui/gallery/model/BaseDataItem;->mLatitude:D

    aput-wide v1, p1, v0

    const/4 v0, 0x1

    iget-wide v1, p0, Lcom/miui/gallery/model/BaseDataItem;->mLongitude:D

    aput-wide v1, p1, v0

    :cond_0
    return-void
.end method

.method public getCreateTime()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mCreateTime:J

    return-wide v0
.end method

.method public getDetailInfo(Landroid/content/Context;)Lcom/miui/gallery/model/PhotoDetailInfo;
    .locals 4

    new-instance p1, Lcom/miui/gallery/model/PhotoDetailInfo;

    invoke-direct {p1}, Lcom/miui/gallery/model/PhotoDetailInfo;-><init>()V

    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->getCreateTime()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p1, v1, v0}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V

    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0xc8

    invoke-virtual {p1, v1, v0}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V

    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/FileUtils;->getFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {p1, v1, v0}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V

    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->getSize()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    const/4 v2, 0x3

    invoke-virtual {p1, v2, v0}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V

    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->getLocation()Ljava/lang/String;

    move-result-object v0

    const/16 v2, 0x9

    invoke-virtual {p1, v2, v0}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V

    new-array v0, v1, [D

    invoke-virtual {p0, v0}, Lcom/miui/gallery/model/BaseDataItem;->getCoordidate([D)V

    const/4 v1, 0x6

    invoke-virtual {p1, v1, v0}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V

    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->isVideo()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x7

    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->getDuration()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x4

    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->getWidth()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V

    const/4 v0, 0x5

    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->getHeight()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V

    :goto_0
    return-object p1
.end method

.method public getDisplayBetterFileSize()J
    .locals 2

    new-instance v0, Lcom/miui/gallery/model/BaseDataItem$4;

    invoke-direct {v0, p0}, Lcom/miui/gallery/model/BaseDataItem$4;-><init>(Lcom/miui/gallery/model/BaseDataItem;)V

    invoke-direct {p0, v0}, Lcom/miui/gallery/model/BaseDataItem;->safeRun(Lcom/miui/gallery/model/BaseDataItem$Func;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    return-wide v0
.end method

.method public getDownloadUri()Landroid/net/Uri;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getDuration()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mDuration:I

    return v0
.end method

.method public getFavoriteInfo(Z)Lcom/miui/gallery/model/FavoriteInfo;
    .locals 0

    new-instance p1, Lcom/miui/gallery/model/FavoriteInfo;

    invoke-direct {p1}, Lcom/miui/gallery/model/FavoriteInfo;-><init>()V

    return-object p1
.end method

.method public getHeight()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mHeight:I

    return v0
.end method

.method public getKey()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mKey:J

    return-wide v0
.end method

.method public getLocalGroupId()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mLocalGroupId:J

    return-wide v0
.end method

.method public getLocation()Ljava/lang/String;
    .locals 2

    invoke-static {}, Lcom/miui/gallery/data/LocationManager;->getInstance()Lcom/miui/gallery/data/LocationManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/model/BaseDataItem;->mLocation:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/data/LocationManager;->generateTitleLine(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMicroImageSize()Lcom/nostra13/universalimageloader/core/assist/ImageSize;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v0

    iget-object v0, v0, Lcom/miui/gallery/Config$ThumbConfig;->sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    return-object v0
.end method

.method public getMicroPath()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mMicroPath:Ljava/lang/String;

    return-object v0
.end method

.method public getMimeType()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mMimeType:Ljava/lang/String;

    return-object v0
.end method

.method public getMotionOffset()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mMotionOffset:J

    return-wide v0
.end method

.method public getOrientation()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mOrientation:I

    return v0
.end method

.method public getOriginalPath()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mFilePath:Ljava/lang/String;

    return-object v0
.end method

.method public getPathDisplayBetter()Ljava/lang/String;
    .locals 1

    new-instance v0, Lcom/miui/gallery/model/BaseDataItem$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/model/BaseDataItem$3;-><init>(Lcom/miui/gallery/model/BaseDataItem;)V

    invoke-direct {p0, v0}, Lcom/miui/gallery/model/BaseDataItem;->safeRun(Lcom/miui/gallery/model/BaseDataItem$Func;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getSecretKey()[B
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mSecretKey:[B

    return-object v0
.end method

.method public getSize()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mSize:J

    return-wide v0
.end method

.method public getSpecialTypeFlags()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mSpecialTypeFlags:J

    return-wide v0
.end method

.method public getSupportOperations()I
    .locals 1

    new-instance v0, Lcom/miui/gallery/model/BaseDataItem$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/model/BaseDataItem$1;-><init>(Lcom/miui/gallery/model/BaseDataItem;)V

    invoke-direct {p0, v0}, Lcom/miui/gallery/model/BaseDataItem;->safeRun(Lcom/miui/gallery/model/BaseDataItem$Func;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getThumnailPath()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mThumbPath:Ljava/lang/String;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mTitle:Ljava/lang/String;

    return-object v0
.end method

.method public getViewSubTitle(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->getCreateTime()J

    move-result-wide v0

    const/16 p1, 0x2c

    invoke-static {v0, v1, p1}, Lmiui/date/DateUtils;->formatDateTime(JI)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getViewTitle(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->getCreateTime()J

    move-result-wide v0

    const/16 p1, 0x380

    invoke-static {v0, v1, p1}, Lmiui/date/DateUtils;->formatDateTime(JI)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getWidth()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mWidth:I

    return v0
.end method

.method public hasFace()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public hashCode()I
    .locals 3

    new-instance v0, Ljava/lang/Long;

    iget-wide v1, p0, Lcom/miui/gallery/model/BaseDataItem;->mKey:J

    invoke-direct {v0, v1, v2}, Ljava/lang/Long;-><init>(J)V

    invoke-virtual {v0}, Ljava/lang/Long;->hashCode()I

    move-result v0

    return v0
.end method

.method protected initSupportOperations()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method protected invalidCache()V
    .locals 0

    return-void
.end method

.method public isBurstItem()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mIsBurstItem:Z

    return v0
.end method

.method public isGif()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mMimeType:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mMimeType:Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/util/FileMimeUtil;->isGifFromMimeType(Ljava/lang/String;)Z

    move-result v0

    :goto_0
    return v0
.end method

.method public isImage()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mMimeType:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mMimeType:Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/util/FileMimeUtil;->isImageFromMimeType(Ljava/lang/String;)Z

    move-result v0

    :goto_0
    return v0
.end method

.method public isModified(Lcom/miui/gallery/model/BaseDataItem;)Z
    .locals 0

    if-eqz p1, :cond_0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/model/BaseDataItem;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public isMotionPhoto()Z
    .locals 5

    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->isSpecialTypeRecognized()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mSpecialTypeFlags:J

    const-wide/16 v2, 0x20

    and-long/2addr v0, v2

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isSecret()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mIsSecret:Z

    return v0
.end method

.method public isSpecialType(J)Z
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->isSpecialTypeRecognized()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mSpecialTypeFlags:J

    and-long/2addr p1, v0

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-eqz v2, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public isSpecialTypeRecognized()Z
    .locals 5

    iget-wide v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mSpecialTypeFlags:J

    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isSynced()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public isVideo()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mMimeType:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mMimeType:Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/util/FileMimeUtil;->isVideoFromMimeType(Ljava/lang/String;)Z

    move-result v0

    :goto_0
    return v0
.end method

.method protected onCacheLoaded()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mDisplayBetterPath:Lcom/miui/gallery/model/BaseDataItem$DisplayBetterPath;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem$DisplayBetterPath;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/FileUtils;->getFileSize(Ljava/lang/String;)J

    move-result-wide v1

    iput-wide v1, p0, Lcom/miui/gallery/model/BaseDataItem;->mDisplayBetterFileSize:J

    iget-object v1, p0, Lcom/miui/gallery/model/BaseDataItem;->mFilePath:Ljava/lang/String;

    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-wide v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mDisplayBetterFileSize:J

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mFilePath:Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/util/FileUtils;->getFileSize(Ljava/lang/String;)J

    move-result-wide v0

    :goto_0
    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_2

    iget-wide v2, p0, Lcom/miui/gallery/model/BaseDataItem;->mSize:J

    cmp-long v4, v0, v2

    if-nez v4, :cond_1

    iget v2, p0, Lcom/miui/gallery/model/BaseDataItem;->mWidth:I

    if-eqz v2, :cond_1

    iget v2, p0, Lcom/miui/gallery/model/BaseDataItem;->mHeight:I

    if-nez v2, :cond_2

    :cond_1
    iput-wide v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mSize:J

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mFilePath:Ljava/lang/String;

    invoke-static {v0}, Lmiui/graphics/BitmapFactory;->getBitmapSize(Ljava/lang/String;)Landroid/graphics/BitmapFactory$Options;

    move-result-object v0

    iget v1, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iput v1, p0, Lcom/miui/gallery/model/BaseDataItem;->mWidth:I

    iget v0, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    iput v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mHeight:I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    sget-object v1, Lcom/miui/gallery/model/BaseDataItem;->TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_2
    :goto_1
    return-void
.end method

.method protected onLoadCache()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/model/BaseDataItem;->refillBetterPath()V

    invoke-virtual {p0}, Lcom/miui/gallery/model/BaseDataItem;->initSupportOperations()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mSupportOperations:I

    return-void
.end method

.method public reloadCache()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/model/BaseDataItem$6;

    invoke-direct {v0, p0}, Lcom/miui/gallery/model/BaseDataItem$6;-><init>(Lcom/miui/gallery/model/BaseDataItem;)V

    invoke-direct {p0, v0}, Lcom/miui/gallery/model/BaseDataItem;->safeRun(Lcom/miui/gallery/model/BaseDataItem$Func;)Ljava/lang/Object;

    return-void
.end method

.method public removeSupportOperation(I)V
    .locals 1

    new-instance v0, Lcom/miui/gallery/model/BaseDataItem$2;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/model/BaseDataItem$2;-><init>(Lcom/miui/gallery/model/BaseDataItem;I)V

    invoke-direct {p0, v0}, Lcom/miui/gallery/model/BaseDataItem;->safeRun(Lcom/miui/gallery/model/BaseDataItem$Func;)Ljava/lang/Object;

    return-void
.end method

.method public resetSpecialTypeFlags()V
    .locals 2

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mSpecialTypeFlags:J

    return-void
.end method

.method public save(Landroid/app/Activity;Lcom/miui/gallery/ui/SaveUriDialogFragment$OnCompleteListener;)V
    .locals 0

    return-void
.end method

.method public setBurstGroup(Ljava/util/List;)Lcom/miui/gallery/model/BaseDataItem;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/model/BaseDataItem;",
            ">;)",
            "Lcom/miui/gallery/model/BaseDataItem;"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/model/BaseDataItem;->mBurstGroup:Ljava/util/List;

    return-object p0
.end method

.method public setBurstItem(Z)Lcom/miui/gallery/model/BaseDataItem;
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/model/BaseDataItem;->mIsBurstItem:Z

    return-object p0
.end method

.method public setCreateTime(J)Lcom/miui/gallery/model/BaseDataItem;
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/model/BaseDataItem;->mCreateTime:J

    return-object p0
.end method

.method public setDuration(I)Lcom/miui/gallery/model/BaseDataItem;
    .locals 0

    iput p1, p0, Lcom/miui/gallery/model/BaseDataItem;->mDuration:I

    return-object p0
.end method

.method public setFilePath(Ljava/lang/String;)Lcom/miui/gallery/model/BaseDataItem;
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/model/BaseDataItem;->mFilePath:Ljava/lang/String;

    const/4 v0, 0x3

    invoke-virtual {p0, v0, p1}, Lcom/miui/gallery/model/BaseDataItem;->setPathDisplayBetter(ILjava/lang/String;)V

    return-object p0
.end method

.method public setHeight(I)Lcom/miui/gallery/model/BaseDataItem;
    .locals 0

    iput p1, p0, Lcom/miui/gallery/model/BaseDataItem;->mHeight:I

    return-object p0
.end method

.method public setKey(J)Lcom/miui/gallery/model/BaseDataItem;
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/model/BaseDataItem;->mKey:J

    return-object p0
.end method

.method public setLatitude(D)Lcom/miui/gallery/model/BaseDataItem;
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/model/BaseDataItem;->mLatitude:D

    return-object p0
.end method

.method public setLocalGroupId(J)Lcom/miui/gallery/model/BaseDataItem;
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/model/BaseDataItem;->mLocalGroupId:J

    return-object p0
.end method

.method public setLocation(Ljava/lang/String;)Lcom/miui/gallery/model/BaseDataItem;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/model/BaseDataItem;->mLocation:Ljava/lang/String;

    return-object p0
.end method

.method public setLongitude(D)Lcom/miui/gallery/model/BaseDataItem;
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/model/BaseDataItem;->mLongitude:D

    return-object p0
.end method

.method public setMicroPath(Ljava/lang/String;)Lcom/miui/gallery/model/BaseDataItem;
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/model/BaseDataItem;->mMicroPath:Ljava/lang/String;

    const/4 v0, 0x1

    invoke-virtual {p0, v0, p1}, Lcom/miui/gallery/model/BaseDataItem;->setPathDisplayBetter(ILjava/lang/String;)V

    return-object p0
.end method

.method public setMimeType(Ljava/lang/String;)Lcom/miui/gallery/model/BaseDataItem;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/model/BaseDataItem;->mMimeType:Ljava/lang/String;

    return-object p0
.end method

.method public setMotionOffset(J)V
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/model/BaseDataItem;->mMotionOffset:J

    return-void
.end method

.method public setOrientation(I)Lcom/miui/gallery/model/BaseDataItem;
    .locals 0

    iput p1, p0, Lcom/miui/gallery/model/BaseDataItem;->mOrientation:I

    return-object p0
.end method

.method protected setPathDisplayBetter(ILjava/lang/String;)V
    .locals 1

    new-instance v0, Lcom/miui/gallery/model/BaseDataItem$5;

    invoke-direct {v0, p0, p1, p2}, Lcom/miui/gallery/model/BaseDataItem$5;-><init>(Lcom/miui/gallery/model/BaseDataItem;ILjava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/miui/gallery/model/BaseDataItem;->safeRun(Lcom/miui/gallery/model/BaseDataItem$Func;)Ljava/lang/Object;

    return-void
.end method

.method public setSecretKey([B)Lcom/miui/gallery/model/BaseDataItem;
    .locals 1

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mIsSecret:Z

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/model/BaseDataItem;->mIsSecret:Z

    :goto_0
    iput-object p1, p0, Lcom/miui/gallery/model/BaseDataItem;->mSecretKey:[B

    return-object p0
.end method

.method public setSize(J)Lcom/miui/gallery/model/BaseDataItem;
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/model/BaseDataItem;->mSize:J

    return-object p0
.end method

.method public setSpecialTypeFlags(J)V
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/model/BaseDataItem;->mSpecialTypeFlags:J

    return-void
.end method

.method public setThumbPath(Ljava/lang/String;)Lcom/miui/gallery/model/BaseDataItem;
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/model/BaseDataItem;->mThumbPath:Ljava/lang/String;

    const/4 v0, 0x2

    invoke-virtual {p0, v0, p1}, Lcom/miui/gallery/model/BaseDataItem;->setPathDisplayBetter(ILjava/lang/String;)V

    return-object p0
.end method

.method public setTitle(Ljava/lang/String;)Lcom/miui/gallery/model/BaseDataItem;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/model/BaseDataItem;->mTitle:Ljava/lang/String;

    return-object p0
.end method

.method public setWidth(I)Lcom/miui/gallery/model/BaseDataItem;
    .locals 0

    iput p1, p0, Lcom/miui/gallery/model/BaseDataItem;->mWidth:I

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "key: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/miui/gallery/model/BaseDataItem;->mKey:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, " path: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/model/BaseDataItem;->mFilePath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " thumb: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/model/BaseDataItem;->mThumbPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
