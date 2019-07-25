.class public Lcom/miui/gallery/loader/MediaSetLoader;
.super Lcom/miui/gallery/loader/CursorSetLoader;
.source "MediaSetLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;
    }
.end annotation


# static fields
.field private static final BUCKET_PROJECTION:[Ljava/lang/String;

.field private static final PROJECTION:[Ljava/lang/String;

.field private static final sMarkDeletedIds:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mBucketIds:[Ljava/lang/String;

.field private mFromCamera:Z

.field private mInitId:J

.field private mInitPos:I

.field private mIsFromScreenshot:Z

.field private mIsInternal:Z

.field private mLimitUris:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field

.field private mProcessingIds:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private mUri:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .locals 11

    const-string v0, "_id"

    const-string v1, "_data"

    const-string v2, "_size"

    const-string v3, "mime_type"

    const-string v4, "latitude"

    const-string v5, "longitude"

    const-string v6, "datetaken"

    const-string v7, "duration"

    const-string v8, "width"

    const-string v9, "height"

    const-string v10, "orientation"

    filled-new-array/range {v0 .. v10}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/loader/MediaSetLoader;->PROJECTION:[Ljava/lang/String;

    const-string v0, "_data"

    const-string v1, "bucket_id"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/loader/MediaSetLoader;->BUCKET_PROJECTION:[Ljava/lang/String;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    sput-object v0, Lcom/miui/gallery/loader/MediaSetLoader;->sMarkDeletedIds:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/net/Uri;Landroid/os/Bundle;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/loader/CursorSetLoader;-><init>(Landroid/content/Context;)V

    const/4 p1, -0x1

    iput p1, p0, Lcom/miui/gallery/loader/MediaSetLoader;->mInitPos:I

    iput-boolean p4, p0, Lcom/miui/gallery/loader/MediaSetLoader;->mIsInternal:Z

    iput-object p2, p0, Lcom/miui/gallery/loader/MediaSetLoader;->mUri:Landroid/net/Uri;

    const-string p1, "from_MiuiCamera"

    const/4 p4, 0x0

    invoke-virtual {p3, p1, p4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, p0, Lcom/miui/gallery/loader/MediaSetLoader;->mFromCamera:Z

    const-string p1, "from_MiuiScreenShot"

    invoke-virtual {p3, p1, p4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, p0, Lcom/miui/gallery/loader/MediaSetLoader;->mIsFromScreenshot:Z

    const-string p1, "SecureUri"

    invoke-virtual {p3, p1}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/loader/MediaSetLoader;->mLimitUris:Ljava/util/ArrayList;

    const-string p1, "com.miui.gallery.extra.preview_single_item"

    invoke-virtual {p3, p1, p4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_0

    new-instance p1, Ljava/util/ArrayList;

    const/4 p4, 0x1

    invoke-direct {p1, p4}, Ljava/util/ArrayList;-><init>(I)V

    iput-object p1, p0, Lcom/miui/gallery/loader/MediaSetLoader;->mLimitUris:Ljava/util/ArrayList;

    iget-object p1, p0, Lcom/miui/gallery/loader/MediaSetLoader;->mLimitUris:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    const-string p1, "photo_transition_data"

    invoke-virtual {p3, p1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/model/ImageLoadParams;

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/model/ImageLoadParams;->getKey()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/miui/gallery/loader/MediaSetLoader;->mInitId:J

    :cond_1
    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/loader/MediaSetLoader;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/loader/MediaSetLoader;->genAllBucketIds(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/loader/MediaSetLoader;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/loader/MediaSetLoader;->mFromCamera:Z

    return p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/loader/MediaSetLoader;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/loader/MediaSetLoader;->mIsFromScreenshot:Z

    return p0
.end method

.method static synthetic access$300()Ljava/util/List;
    .locals 1

    sget-object v0, Lcom/miui/gallery/loader/MediaSetLoader;->sMarkDeletedIds:Ljava/util/List;

    return-object v0
.end method

.method private genAllBucketIds(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .locals 3

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-nez v0, :cond_2

    invoke-static {p1}, Lcom/miui/gallery/util/FileUtils;->getParentFolderPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/loader/MediaSetLoader;->needLoadAllBucket(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/loader/MediaSetLoader;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p0}, Lcom/miui/gallery/loader/MediaSetLoader;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/miui/gallery/util/StorageUtils;->getRelativePath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/miui/gallery/util/StorageUtils;->getPathsInExternalStorage(Landroid/content/Context;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p2

    if-nez p1, :cond_0

    return-object v1

    :cond_0
    array-length p1, p2

    new-array p1, p1, [Ljava/lang/String;

    :goto_0
    array-length v0, p2

    if-ge v2, v0, :cond_1

    aget-object v0, p2, v2

    invoke-static {v0}, Lcom/miui/gallery/util/FileUtils;->getBucketID(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    aput-object v0, p1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-object p1

    :cond_2
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_3

    const/4 p1, 0x1

    new-array p1, p1, [Ljava/lang/String;

    aput-object p2, p1, v2

    return-object p1

    :cond_3
    return-object v1
.end method

.method private isLimitedUris()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/loader/MediaSetLoader;->mLimitUris:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method private needLoadAllBucket(Ljava/lang/String;)Z
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/loader/MediaSetLoader;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/miui/gallery/util/StorageUtils;->getRelativePath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "DCIM/Camera"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method


# virtual methods
.method protected getOrder()Ljava/lang/String;
    .locals 1

    const-string v0, "datetaken DESC, _id DESC"

    return-object v0
.end method

.method protected getProjection()[Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/miui/gallery/loader/MediaSetLoader;->PROJECTION:[Ljava/lang/String;

    return-object v0
.end method

.method protected getSelection()Ljava/lang/String;
    .locals 7

    invoke-direct {p0}, Lcom/miui/gallery/loader/MediaSetLoader;->isLimitedUris()Z

    move-result v0

    if-eqz v0, :cond_3

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/miui/gallery/loader/MediaSetLoader;->mLimitUris:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iget-object v1, p0, Lcom/miui/gallery/loader/MediaSetLoader;->mLimitUris:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/Uri;

    if-eqz v2, :cond_0

    invoke-static {v2}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v2

    sget-object v4, Lcom/miui/gallery/loader/MediaSetLoader;->sMarkDeletedIds:Ljava/util/List;

    monitor-enter v4

    :try_start_0
    sget-object v5, Lcom/miui/gallery/loader/MediaSetLoader;->sMarkDeletedIds:Ljava/util/List;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_1
    const-string v5, "MediaSetLoader"

    const-string v6, "filter mark deleted id %d"

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v5, v6, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_1
    monitor-exit v4

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "_id in ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-static {v2, v0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "bucket_id in ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ","

    iget-object v2, p0, Lcom/miui/gallery/loader/MediaSetLoader;->mBucketIds:[Ljava/lang/String;

    invoke-static {v1, v2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " AND ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "media_type"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " in ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v2, 0x3

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/miui/gallery/loader/MediaSetLoader;->mProcessingIds:Ljava/util/List;

    invoke-static {v2}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_4

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " OR _id in ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ","

    iget-object v4, p0, Lcom/miui/gallery/loader/MediaSetLoader;->mProcessingIds:Ljava/util/List;

    invoke-static {v3, v4}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_2

    :cond_4
    const-string v2, ""

    :goto_2
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    sget-object v3, Lcom/miui/gallery/loader/MediaSetLoader;->sMarkDeletedIds:Ljava/util/List;

    monitor-enter v3

    :try_start_1
    sget-object v4, Lcom/miui/gallery/loader/MediaSetLoader;->sMarkDeletedIds:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_5

    const-string v2, ","

    sget-object v4, Lcom/miui/gallery/loader/MediaSetLoader;->sMarkDeletedIds:Ljava/util/List;

    invoke-static {v2, v4}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v2

    :cond_5
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_6

    return-object v0

    :cond_6
    const-string v3, "MediaSetLoader"

    const-string v4, "filter mark deleted ids %s"

    invoke-static {v3, v4, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "_id not in ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "(%s) AND (%s)"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v0, v5, v6

    aput-object v2, v5, v1

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :catchall_1
    move-exception v0

    :try_start_2
    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v0
.end method

.method protected getSelectionArgs()[Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getTAG()Ljava/lang/String;
    .locals 1

    const-string v0, "MediaSetLoader"

    return-object v0
.end method

.method protected getUri()Landroid/net/Uri;
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/loader/MediaSetLoader;->mIsInternal:Z

    if-eqz v0, :cond_0

    const-string v0, "internal"

    goto :goto_0

    :cond_0
    const-string v0, "external"

    :goto_0
    invoke-static {v0}, Landroid/provider/MediaStore$Files;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public loadInBackground()Lcom/miui/gallery/model/CursorDataSet;
    .locals 15

    invoke-direct {p0}, Lcom/miui/gallery/loader/MediaSetLoader;->isLimitedUris()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "MediaSetLoader_limited_load"

    goto :goto_0

    :cond_0
    const-string v0, "MediaSetLoader_load"

    :goto_0
    const-string v1, "loadInBackground"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/logger/TimingTracing;->beginTracing(Ljava/lang/String;Ljava/lang/String;)V

    const-wide/16 v1, 0x1f4

    const/4 v3, 0x0

    :try_start_0
    iget-wide v4, p0, Lcom/miui/gallery/loader/MediaSetLoader;->mInitId:J

    const-wide/16 v6, 0x0

    cmp-long v8, v4, v6

    if-lez v8, :cond_1

    iget-wide v4, p0, Lcom/miui/gallery/loader/MediaSetLoader;->mInitId:J

    goto :goto_1

    :cond_1
    iget-object v4, p0, Lcom/miui/gallery/loader/MediaSetLoader;->mUri:Landroid/net/Uri;

    invoke-static {v4}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v4

    :goto_1
    invoke-direct {p0}, Lcom/miui/gallery/loader/MediaSetLoader;->isLimitedUris()Z

    move-result v6

    const/4 v7, -0x1

    if-eqz v6, :cond_4

    invoke-super {p0}, Lcom/miui/gallery/loader/CursorSetLoader;->loadInBackground()Lcom/miui/gallery/model/CursorDataSet;

    move-result-object v6

    if-eqz v6, :cond_9

    iget v8, p0, Lcom/miui/gallery/loader/MediaSetLoader;->mInitPos:I

    if-ne v8, v7, :cond_2

    new-instance v8, Lcom/miui/gallery/model/BaseDataItem;

    invoke-direct {v8}, Lcom/miui/gallery/model/BaseDataItem;-><init>()V

    invoke-virtual {v8, v4, v5}, Lcom/miui/gallery/model/BaseDataItem;->setKey(J)Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v6, v8, v7}, Lcom/miui/gallery/model/CursorDataSet;->getIndexOfItem(Lcom/miui/gallery/model/BaseDataItem;I)I

    move-result v4

    iput v4, p0, Lcom/miui/gallery/loader/MediaSetLoader;->mInitPos:I

    :cond_2
    iget v4, p0, Lcom/miui/gallery/loader/MediaSetLoader;->mInitPos:I

    invoke-virtual {v6, v4}, Lcom/miui/gallery/model/CursorDataSet;->setInitPosition(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {v0, v3}, Lcom/miui/gallery/util/logger/TimingTracing;->stopTracing(Ljava/lang/String;Landroid/util/Printer;)J

    move-result-wide v3

    cmp-long v0, v3, v1

    if-lez v0, :cond_3

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "cost"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0}, Lcom/miui/gallery/loader/MediaSetLoader;->isLimitedUris()Z

    move-result v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v5, "_"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "load_performance"

    const-string v2, "MediaSetLoader"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_3
    return-object v6

    :cond_4
    :try_start_1
    iget-object v6, p0, Lcom/miui/gallery/loader/MediaSetLoader;->mBucketIds:[Ljava/lang/String;

    if-nez v6, :cond_6

    iget-boolean v6, p0, Lcom/miui/gallery/loader/MediaSetLoader;->mIsInternal:Z

    if-eqz v6, :cond_5

    const-string v6, "internal"

    goto :goto_2

    :cond_5
    const-string v6, "external"

    :goto_2
    invoke-static {v6}, Landroid/provider/MediaStore$Files;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v9

    invoke-virtual {p0}, Lcom/miui/gallery/loader/MediaSetLoader;->getContext()Landroid/content/Context;

    move-result-object v8

    sget-object v10, Lcom/miui/gallery/loader/MediaSetLoader;->BUCKET_PROJECTION:[Ljava/lang/String;

    const-string v11, "_id=?"

    const/4 v6, 0x1

    new-array v12, v6, [Ljava/lang/String;

    const/4 v6, 0x0

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v13

    aput-object v13, v12, v6

    const/4 v13, 0x0

    new-instance v14, Lcom/miui/gallery/loader/MediaSetLoader$1;

    invoke-direct {v14, p0}, Lcom/miui/gallery/loader/MediaSetLoader$1;-><init>(Lcom/miui/gallery/loader/MediaSetLoader;)V

    invoke-static/range {v8 .. v14}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Ljava/lang/String;

    iput-object v6, p0, Lcom/miui/gallery/loader/MediaSetLoader;->mBucketIds:[Ljava/lang/String;

    :cond_6
    iget-object v6, p0, Lcom/miui/gallery/loader/MediaSetLoader;->mBucketIds:[Ljava/lang/String;

    if-eqz v6, :cond_9

    invoke-static {}, Lcom/miui/gallery/provider/ProcessingMediaManager;->queryProcessingMediaIds()Ljava/util/List;

    move-result-object v6

    iput-object v6, p0, Lcom/miui/gallery/loader/MediaSetLoader;->mProcessingIds:Ljava/util/List;

    invoke-super {p0}, Lcom/miui/gallery/loader/CursorSetLoader;->loadInBackground()Lcom/miui/gallery/model/CursorDataSet;

    move-result-object v6

    if-eqz v6, :cond_9

    iget v8, p0, Lcom/miui/gallery/loader/MediaSetLoader;->mInitPos:I

    if-ne v8, v7, :cond_7

    new-instance v8, Lcom/miui/gallery/model/BaseDataItem;

    invoke-direct {v8}, Lcom/miui/gallery/model/BaseDataItem;-><init>()V

    invoke-virtual {v8, v4, v5}, Lcom/miui/gallery/model/BaseDataItem;->setKey(J)Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v6, v8, v7}, Lcom/miui/gallery/model/CursorDataSet;->getIndexOfItem(Lcom/miui/gallery/model/BaseDataItem;I)I

    move-result v4

    iput v4, p0, Lcom/miui/gallery/loader/MediaSetLoader;->mInitPos:I

    :cond_7
    iget v4, p0, Lcom/miui/gallery/loader/MediaSetLoader;->mInitPos:I

    invoke-virtual {v6, v4}, Lcom/miui/gallery/model/CursorDataSet;->setInitPosition(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {v0, v3}, Lcom/miui/gallery/util/logger/TimingTracing;->stopTracing(Ljava/lang/String;Landroid/util/Printer;)J

    move-result-wide v3

    cmp-long v0, v3, v1

    if-lez v0, :cond_8

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "cost"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0}, Lcom/miui/gallery/loader/MediaSetLoader;->isLimitedUris()Z

    move-result v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v5, "_"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "load_performance"

    const-string v2, "MediaSetLoader"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_8
    return-object v6

    :cond_9
    invoke-static {v0, v3}, Lcom/miui/gallery/util/logger/TimingTracing;->stopTracing(Ljava/lang/String;Landroid/util/Printer;)J

    move-result-wide v4

    cmp-long v0, v4, v1

    if-lez v0, :cond_a

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "cost"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0}, Lcom/miui/gallery/loader/MediaSetLoader;->isLimitedUris()Z

    move-result v6

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v6, "_"

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "load_performance"

    const-string v2, "MediaSetLoader"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_a
    return-object v3

    :catchall_0
    move-exception v4

    invoke-static {v0, v3}, Lcom/miui/gallery/util/logger/TimingTracing;->stopTracing(Ljava/lang/String;Landroid/util/Printer;)J

    move-result-wide v5

    cmp-long v0, v5, v1

    if-lez v0, :cond_b

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0}, Lcom/miui/gallery/loader/MediaSetLoader;->isLimitedUris()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "cost"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "load_performance"

    const-string v2, "MediaSetLoader"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_b
    throw v4
.end method

.method public bridge synthetic loadInBackground()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/loader/MediaSetLoader;->loadInBackground()Lcom/miui/gallery/model/CursorDataSet;

    move-result-object v0

    return-object v0
.end method

.method protected wrapDataSet(Landroid/database/Cursor;)Lcom/miui/gallery/model/CursorDataSet;
    .locals 1

    new-instance v0, Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;-><init>(Lcom/miui/gallery/loader/MediaSetLoader;Landroid/database/Cursor;)V

    return-object v0
.end method
