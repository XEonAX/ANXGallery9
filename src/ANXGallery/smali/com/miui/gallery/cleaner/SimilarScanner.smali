.class public Lcom/miui/gallery/cleaner/SimilarScanner;
.super Lcom/miui/gallery/cleaner/BaseScanner;
.source "SimilarScanner.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/cleaner/SimilarScanner$OnClusterCompletedListener;,
        Lcom/miui/gallery/cleaner/SimilarScanner$SimilarGroup;,
        Lcom/miui/gallery/cleaner/SimilarScanner$SimilarMediaItem;
    }
.end annotation


# static fields
.field public static final SIMILAR_SCAN_PROJECTION:[Ljava/lang/String;


# instance fields
.field private mCameraLocalId:J

.field private mClusterGroupId:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private mFeatureSqlStartTime:J

.field private mFurtherLoadingTask:Lcom/miui/gallery/threadpool/Future;

.field private mGroupItemCount:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mGroupStartPos:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mId2Item:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Long;",
            "Lcom/miui/gallery/cleaner/SimilarScanner$SimilarMediaItem;",
            ">;"
        }
    .end annotation
.end field

.field private volatile mIsLoadingValid:Z

.field private mOnScanResultClickListener:Lcom/miui/gallery/cleaner/ScanResult$OnScanResultClickListener;

.field private final mScanLock:Ljava/lang/Object;

.field private mScanLockCompleted:Z

.field private mSimilarGroupList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/cleaner/SimilarScanner$SimilarGroup;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 7

    const-string v0, "_id"

    const-string v1, "localFile"

    const-string v2, "thumbnailFile"

    const-string v3, "microthumbfile"

    const-string v4, "size"

    const-string v5, "alias_create_time"

    const-string v6, "sha1"

    filled-new-array/range {v0 .. v6}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/cleaner/SimilarScanner;->SIMILAR_SCAN_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method protected constructor <init>()V
    .locals 2

    const/4 v0, 0x3

    invoke-direct {p0, v0}, Lcom/miui/gallery/cleaner/BaseScanner;-><init>(I)V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mId2Item:Ljava/util/HashMap;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mSimilarGroupList:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mGroupItemCount:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mGroupStartPos:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mClusterGroupId:Ljava/util/ArrayList;

    const-wide v0, 0x7fffffffffffffffL

    iput-wide v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mFeatureSqlStartTime:J

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mIsLoadingValid:Z

    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mScanLock:Ljava/lang/Object;

    iput-boolean v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mScanLockCompleted:Z

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mCameraLocalId:J

    new-instance v0, Lcom/miui/gallery/cleaner/SimilarScanner$4;

    invoke-direct {v0, p0}, Lcom/miui/gallery/cleaner/SimilarScanner$4;-><init>(Lcom/miui/gallery/cleaner/SimilarScanner;)V

    iput-object v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mOnScanResultClickListener:Lcom/miui/gallery/cleaner/ScanResult$OnScanResultClickListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/cleaner/SimilarScanner;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mScanLock:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$102(Lcom/miui/gallery/cleaner/SimilarScanner;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mScanLockCompleted:Z

    return p1
.end method

.method static synthetic access$300(Lcom/miui/gallery/cleaner/SimilarScanner;)Ljava/util/HashMap;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mId2Item:Ljava/util/HashMap;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/cleaner/SimilarScanner;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mIsLoadingValid:Z

    return p0
.end method

.method static synthetic access$402(Lcom/miui/gallery/cleaner/SimilarScanner;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mIsLoadingValid:Z

    return p1
.end method

.method static synthetic access$500(Lcom/miui/gallery/cleaner/SimilarScanner;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/cleaner/SimilarScanner;->resetSimilarGroupList()V

    return-void
.end method

.method static synthetic access$600(Lcom/miui/gallery/cleaner/SimilarScanner;)Lcom/miui/gallery/cleaner/ScanResult;
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/cleaner/SimilarScanner;->buildScanResult()Lcom/miui/gallery/cleaner/ScanResult;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/cleaner/SimilarScanner;)J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mFeatureSqlStartTime:J

    return-wide v0
.end method

.method static synthetic access$702(Lcom/miui/gallery/cleaner/SimilarScanner;J)J
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mFeatureSqlStartTime:J

    return-wide p1
.end method

.method static synthetic access$800(Lcom/miui/gallery/cleaner/SimilarScanner;IILcom/miui/gallery/cleaner/SimilarScanner$OnClusterCompletedListener;)Z
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/cleaner/SimilarScanner;->handleImagesByLimit(IILcom/miui/gallery/cleaner/SimilarScanner$OnClusterCompletedListener;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$900(Lcom/miui/gallery/cleaner/SimilarScanner;Ljava/util/List;IILcom/miui/gallery/cleaner/SimilarScanner$OnClusterCompletedListener;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/miui/gallery/cleaner/SimilarScanner;->calculateImageFeatureAndClusterInBatch(Ljava/util/List;IILcom/miui/gallery/cleaner/SimilarScanner$OnClusterCompletedListener;)V

    return-void
.end method

.method private buildScanResult()Lcom/miui/gallery/cleaner/ScanResult;
    .locals 15

    const/4 v0, 0x4

    new-array v0, v0, [Lcom/miui/gallery/cleaner/ScanResult$ResultImage;

    iget-object v1, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mSimilarGroupList:Ljava/util/ArrayList;

    monitor-enter v1

    :try_start_0
    iget-object v2, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mGroupItemCount:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    iget-object v2, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    iget-object v2, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mClusterGroupId:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    iget-object v2, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mSimilarGroupList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v3, 0x0

    const-wide/16 v4, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/miui/gallery/cleaner/SimilarScanner$SimilarGroup;

    iget-object v9, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mClusterGroupId:Ljava/util/ArrayList;

    iget-wide v10, v8, Lcom/miui/gallery/cleaner/SimilarScanner$SimilarGroup;->mGroupId:J

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    goto :goto_0

    :cond_0
    iget-object v9, v8, Lcom/miui/gallery/cleaner/SimilarScanner$SimilarGroup;->mImageIdsInGroup:[Ljava/lang/Long;

    iget-object v10, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mGroupItemCount:Ljava/util/ArrayList;

    array-length v11, v9

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v10, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v10, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mClusterGroupId:Ljava/util/ArrayList;

    iget-wide v11, v8, Lcom/miui/gallery/cleaner/SimilarScanner$SimilarGroup;->mGroupId:J

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v10, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    array-length v8, v9

    add-int/2addr v7, v8

    move v8, v6

    move-wide v5, v4

    const/4 v4, 0x0

    :goto_1
    array-length v10, v9

    if-ge v4, v10, :cond_2

    iget-object v10, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mId2Item:Ljava/util/HashMap;

    aget-object v11, v9, v4

    invoke-virtual {v10, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/miui/gallery/cleaner/SimilarScanner$SimilarMediaItem;

    array-length v11, v0

    if-ge v8, v11, :cond_1

    new-instance v11, Lcom/miui/gallery/cleaner/ScanResult$ResultImage;

    iget-wide v12, v10, Lcom/miui/gallery/cleaner/SimilarScanner$SimilarMediaItem;->mId:J

    iget-object v14, v10, Lcom/miui/gallery/cleaner/SimilarScanner$SimilarMediaItem;->mPath:Ljava/lang/String;

    invoke-direct {v11, v12, v13, v14}, Lcom/miui/gallery/cleaner/ScanResult$ResultImage;-><init>(JLjava/lang/String;)V

    aput-object v11, v0, v8

    :cond_1
    add-int/lit8 v8, v8, 0x1

    iget-wide v10, v10, Lcom/miui/gallery/cleaner/SimilarScanner$SimilarMediaItem;->mSize:J

    const/4 v12, 0x0

    add-long/2addr v5, v10

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_2
    move-wide v4, v5

    move v6, v8

    goto :goto_0

    :cond_3
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    new-instance v1, Lcom/miui/gallery/cleaner/ScanResult$Builder;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/miui/gallery/cleaner/ScanResult$Builder;-><init>(Landroid/content/Context;)V

    iget v2, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mType:I

    invoke-virtual {v1, v2}, Lcom/miui/gallery/cleaner/ScanResult$Builder;->setType(I)Lcom/miui/gallery/cleaner/ScanResult$Builder;

    move-result-object v1

    const v2, 0x7f100287

    invoke-virtual {v1, v2}, Lcom/miui/gallery/cleaner/ScanResult$Builder;->setTitle(I)Lcom/miui/gallery/cleaner/ScanResult$Builder;

    move-result-object v1

    const v2, 0x7f100286

    invoke-virtual {v1, v2}, Lcom/miui/gallery/cleaner/ScanResult$Builder;->setDescription(I)Lcom/miui/gallery/cleaner/ScanResult$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/miui/gallery/cleaner/ScanResult$Builder;->setImages([Lcom/miui/gallery/cleaner/ScanResult$ResultImage;)Lcom/miui/gallery/cleaner/ScanResult$Builder;

    move-result-object v0

    const v1, 0x7f100285

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cleaner/ScanResult$Builder;->setAction(I)Lcom/miui/gallery/cleaner/ScanResult$Builder;

    move-result-object v0

    invoke-virtual {v0, v4, v5}, Lcom/miui/gallery/cleaner/ScanResult$Builder;->setSize(J)Lcom/miui/gallery/cleaner/ScanResult$Builder;

    move-result-object v0

    invoke-virtual {v0, v6}, Lcom/miui/gallery/cleaner/ScanResult$Builder;->setCount(I)Lcom/miui/gallery/cleaner/ScanResult$Builder;

    move-result-object v0

    const v1, 0x7f0e0035

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cleaner/ScanResult$Builder;->setCountText(I)Lcom/miui/gallery/cleaner/ScanResult$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mOnScanResultClickListener:Lcom/miui/gallery/cleaner/ScanResult$OnScanResultClickListener;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cleaner/ScanResult$Builder;->setOnScanResultClickListener(Lcom/miui/gallery/cleaner/ScanResult$OnScanResultClickListener;)Lcom/miui/gallery/cleaner/ScanResult$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cleaner/ScanResult$Builder;->build()Lcom/miui/gallery/cleaner/ScanResult;

    move-result-object v0

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private calculateImageFeatureAndCluster(Ljava/util/List;ILcom/miui/gallery/cleaner/SimilarScanner$OnClusterCompletedListener;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/assistant/model/MediaFeatureItem;",
            ">;I",
            "Lcom/miui/gallery/cleaner/SimilarScanner$OnClusterCompletedListener;",
            ")V"
        }
    .end annotation

    iget-boolean v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mIsLoadingValid:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2, p3}, Lcom/miui/gallery/cleaner/SimilarScanner;->calculateImageFeatureAndClusterInBatch(Ljava/util/List;IILcom/miui/gallery/cleaner/SimilarScanner$OnClusterCompletedListener;)V

    :cond_0
    return-void
.end method

.method private calculateImageFeatureAndClusterInBatch(Ljava/util/List;IILcom/miui/gallery/cleaner/SimilarScanner$OnClusterCompletedListener;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/assistant/model/MediaFeatureItem;",
            ">;II",
            "Lcom/miui/gallery/cleaner/SimilarScanner$OnClusterCompletedListener;",
            ")V"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_8

    iget-boolean v1, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mIsLoadingValid:Z

    if-eqz v1, :cond_8

    move v1, p2

    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x1

    if-ge p2, v2, :cond_4

    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    sub-int/2addr v2, v3

    if-ge p2, v2, :cond_0

    invoke-virtual {v1}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->isSelectionFeatureDone()Z

    move-result v2

    if-eqz v2, :cond_0

    add-int/lit8 v2, p2, 0x1

    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    invoke-virtual {v2}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->isSelectionFeatureDone()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_0
    invoke-virtual {v1}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->isSelectionFeatureDone()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    sub-int/2addr v2, v3

    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    invoke-virtual {v2}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getDateTime()J

    move-result-wide v4

    invoke-virtual {v1}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getDateTime()J

    move-result-wide v6

    const-wide/32 v8, 0x36ee80

    invoke-static/range {v4 .. v9}, Lcom/miui/gallery/card/scenario/DateUtils;->withinTime(JJJ)Z

    move-result v2

    if-eqz v2, :cond_2

    :cond_1
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-lt v1, p3, :cond_3

    move v5, p2

    goto :goto_2

    :cond_3
    add-int/lit8 v1, p2, 0x1

    move v10, v1

    move v1, p2

    move p2, v10

    goto :goto_0

    :cond_4
    move v5, v1

    :goto_2
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_5
    :goto_3
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    invoke-virtual {v1}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getImagePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {p2}, Ljava/util/Iterator;->remove()V

    goto :goto_3

    :cond_6
    iget-boolean p2, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mIsLoadingValid:Z

    if-eqz p2, :cond_7

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result p2

    if-eqz p2, :cond_7

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p2

    if-le p2, v3, :cond_7

    invoke-static {}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->getInstance()Lcom/miui/gallery/assistant/manager/ImageFeatureManager;

    move-result-object p2

    sget-object v1, Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;->PRIORITY_HIGH:Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    const/4 v0, 0x5

    new-instance v9, Lcom/miui/gallery/cleaner/SimilarScanner$7;

    move-object v2, v9

    move-object v3, p0

    move-object v4, p1

    move v6, p3

    move-object v7, p4

    invoke-direct/range {v2 .. v7}, Lcom/miui/gallery/cleaner/SimilarScanner$7;-><init>(Lcom/miui/gallery/cleaner/SimilarScanner;Ljava/util/List;IILcom/miui/gallery/cleaner/SimilarScanner$OnClusterCompletedListener;)V

    invoke-virtual {p2, v1, v8, v0, v9}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->calculateImageFeatureAndGroupAsync(Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;Ljava/util/List;ILcom/miui/gallery/assistant/manager/AlgorithmRequest$Listener;)V

    goto :goto_4

    :cond_7
    invoke-interface {p4}, Lcom/miui/gallery/cleaner/SimilarScanner$OnClusterCompletedListener;->onAllCompleted()V

    goto :goto_4

    :cond_8
    invoke-interface {p4}, Lcom/miui/gallery/cleaner/SimilarScanner$OnClusterCompletedListener;->onAllCompleted()V

    :goto_4
    return-void
.end method

.method private getImagesIdsByGroup(J)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->getInstance()Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->getImageFeaturesByGroup(J)Ljava/util/List;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/assistant/model/TinyImageFeature;

    invoke-virtual {v0}, Lcom/miui/gallery/assistant/model/TinyImageFeature;->getImageId()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-object p2
.end method

.method private getSimilarGroups()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;",
            ">;"
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->getInstance()Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->getAllGroups(Z)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Lcom/miui/gallery/cleaner/SimilarScanner$2;

    invoke-direct {v1, p0}, Lcom/miui/gallery/cleaner/SimilarScanner$2;-><init>(Lcom/miui/gallery/cleaner/SimilarScanner;)V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    :cond_0
    return-object v0
.end method

.method private handleImagesByLimit(IILcom/miui/gallery/cleaner/SimilarScanner$OnClusterCompletedListener;)Z
    .locals 10

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    invoke-static {v1, p1}, Lcom/miui/gallery/util/UriUtil;->appendLimit(Landroid/net/Uri;I)Landroid/net/Uri;

    move-result-object v1

    sget-object v2, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->PROJECTION:[Ljava/lang/String;

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\')) AND serverType=1 AND lower(mimeType) != \'image/gif\'  AND exifImageWidth > 1000 AND exifImageLength > 1000 AND localGroupId = %d AND mixedDateTime <= %s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    iget-wide v6, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mCameraLocalId:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    const/4 v7, 0x0

    aput-object v6, v5, v7

    iget-wide v8, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mFeatureSqlStartTime:J

    invoke-static {v8, v9}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    const/4 v8, 0x1

    aput-object v6, v5, v8

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const-string v5, "mixedDateTime DESC"

    new-instance v6, Lcom/miui/gallery/cleaner/SimilarScanner$6;

    invoke-direct {v6, p0, p1}, Lcom/miui/gallery/cleaner/SimilarScanner$6;-><init>(Lcom/miui/gallery/cleaner/SimilarScanner;I)V

    const/4 v4, 0x0

    invoke-static/range {v0 .. v6}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mIsLoadingValid:Z

    if-eqz v1, :cond_0

    invoke-static {v0}, Lcom/miui/gallery/card/CardUtil;->bindImageFeatures(Ljava/util/List;)V

    :cond_0
    iget-boolean v1, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mIsLoadingValid:Z

    if-eqz v1, :cond_1

    invoke-direct {p0, v0, p2, p3}, Lcom/miui/gallery/cleaner/SimilarScanner;->calculateImageFeatureAndCluster(Ljava/util/List;ILcom/miui/gallery/cleaner/SimilarScanner$OnClusterCompletedListener;)V

    :cond_1
    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p2

    if-lt p2, p1, :cond_2

    const/4 v7, 0x1

    :cond_2
    return v7
.end method

.method private handleRemainImages()V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/cleaner/SimilarScanner$5;

    invoke-direct {v1, p0}, Lcom/miui/gallery/cleaner/SimilarScanner$5;-><init>(Lcom/miui/gallery/cleaner/SimilarScanner;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mFurtherLoadingTask:Lcom/miui/gallery/threadpool/Future;

    return-void
.end method

.method private queryCameraAlbumId(Landroid/content/Context;)J
    .locals 7

    sget-object v1, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    const-string v0, "_id"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v2

    const-string v3, "serverId = 1 AND (serverType=0)"

    new-instance v6, Lcom/miui/gallery/cleaner/SimilarScanner$8;

    invoke-direct {v6, p0}, Lcom/miui/gallery/cleaner/SimilarScanner$8;-><init>(Lcom/miui/gallery/cleaner/SimilarScanner;)V

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p1

    invoke-static/range {v0 .. v6}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    return-wide v0
.end method

.method private removeItem(J)Z
    .locals 11

    iget-object v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mSimilarGroupList:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mSimilarGroupList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/cleaner/SimilarScanner$SimilarGroup;

    iget-object v5, v4, Lcom/miui/gallery/cleaner/SimilarScanner$SimilarGroup;->mImageIdsInGroup:[Ljava/lang/Long;

    const/4 v6, 0x0

    :goto_0
    array-length v7, v5

    const/4 v8, 0x1

    if-ge v6, v7, :cond_4

    aget-object v7, v5, v6

    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v9

    cmp-long v7, v9, p1

    if-nez v7, :cond_3

    array-length v3, v5

    if-ne v3, v8, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_1

    :cond_1
    array-length v3, v5

    sub-int/2addr v3, v8

    new-array v3, v3, [Ljava/lang/Long;

    invoke-static {v5, v2, v3, v2, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v7, v5

    sub-int/2addr v7, v8

    if-ge v6, v7, :cond_2

    add-int/lit8 v7, v6, 0x1

    array-length v9, v5

    sub-int/2addr v9, v6

    sub-int/2addr v9, v8

    invoke-static {v5, v7, v3, v6, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_2
    iput-object v3, v4, Lcom/miui/gallery/cleaner/SimilarScanner$SimilarGroup;->mImageIdsInGroup:[Ljava/lang/Long;

    :goto_1
    const/4 v3, 0x1

    goto :goto_2

    :cond_3
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :cond_4
    :goto_2
    if-eqz v3, :cond_0

    :cond_5
    monitor-exit v0

    return v3

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private resetIdToItemList()V
    .locals 8

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mId2Item:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-virtual {p0}, Lcom/miui/gallery/cleaner/SimilarScanner;->getScanResultIds()Ljava/util/List;

    move-result-object v2

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Long;

    invoke-interface {v1, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    invoke-static {v3}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_2

    sget-object v1, Lcom/miui/gallery/provider/GalleryContract$Media;->URI_OWNER_ALBUM_MEDIA:Landroid/net/Uri;

    sget-object v2, Lcom/miui/gallery/cleaner/SimilarScanner;->SIMILAR_SCAN_PROJECTION:[Ljava/lang/String;

    const-string v4, "%s IN (%s) AND %s = %d"

    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "_id"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, ","

    invoke-static {v7, v3}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v5, v6

    const/4 v3, 0x2

    const-string v6, "localGroupId"

    aput-object v6, v5, v3

    const/4 v3, 0x3

    iget-wide v6, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mCameraLocalId:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v5, v3

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    new-instance v6, Lcom/miui/gallery/cleaner/SimilarScanner$3;

    invoke-direct {v6, p0}, Lcom/miui/gallery/cleaner/SimilarScanner$3;-><init>(Lcom/miui/gallery/cleaner/SimilarScanner;)V

    invoke-static/range {v0 .. v6}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    :cond_2
    return-void
.end method

.method private resetSimilarGroupList()V
    .locals 13

    invoke-direct {p0}, Lcom/miui/gallery/cleaner/SimilarScanner;->getSimilarGroups()Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mSimilarGroupList:Ljava/util/ArrayList;

    monitor-enter v1

    :try_start_0
    iget-object v2, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mSimilarGroupList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const/4 v5, 0x1

    if-eqz v4, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;

    invoke-virtual {v4}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;->getGroupId()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    invoke-direct {p0, v6, v7}, Lcom/miui/gallery/cleaner/SimilarScanner;->getImagesIdsByGroup(J)Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_2
    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Long;

    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-interface {v3, v8}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->remove()V

    goto :goto_1

    :cond_3
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v7

    if-le v7, v5, :cond_0

    iget-object v5, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mSimilarGroupList:Ljava/util/ArrayList;

    new-instance v7, Lcom/miui/gallery/cleaner/SimilarScanner$SimilarGroup;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v4

    new-array v4, v4, [Ljava/lang/Long;

    invoke-interface {v6, v4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [Ljava/lang/Long;

    invoke-direct {v7, p0, v8, v9, v4}, Lcom/miui/gallery/cleaner/SimilarScanner$SimilarGroup;-><init>(Lcom/miui/gallery/cleaner/SimilarScanner;J[Ljava/lang/Long;)V

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_4
    invoke-direct {p0}, Lcom/miui/gallery/cleaner/SimilarScanner;->resetIdToItemList()V

    iget-object v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mSimilarGroupList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mId2Item:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    :cond_5
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_9

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/cleaner/SimilarScanner$SimilarGroup;

    iget-object v4, v3, Lcom/miui/gallery/cleaner/SimilarScanner$SimilarGroup;->mImageIdsInGroup:[Ljava/lang/Long;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    :goto_3
    array-length v9, v4

    if-ge v7, v9, :cond_5

    aget-object v9, v4, v7

    invoke-interface {v2, v9}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_8

    iget-object v9, v3, Lcom/miui/gallery/cleaner/SimilarScanner$SimilarGroup;->mImageIdsInGroup:[Ljava/lang/Long;

    array-length v9, v9

    const/4 v10, 0x2

    if-gt v9, v10, :cond_6

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_2

    :cond_6
    iget-object v9, v3, Lcom/miui/gallery/cleaner/SimilarScanner$SimilarGroup;->mImageIdsInGroup:[Ljava/lang/Long;

    array-length v9, v9

    sub-int/2addr v9, v5

    new-array v9, v9, [Ljava/lang/Long;

    iget-object v10, v3, Lcom/miui/gallery/cleaner/SimilarScanner$SimilarGroup;->mImageIdsInGroup:[Ljava/lang/Long;

    invoke-static {v10, v6, v9, v6, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget-object v10, v3, Lcom/miui/gallery/cleaner/SimilarScanner$SimilarGroup;->mImageIdsInGroup:[Ljava/lang/Long;

    array-length v10, v10

    sub-int/2addr v10, v5

    if-ge v8, v10, :cond_7

    iget-object v10, v3, Lcom/miui/gallery/cleaner/SimilarScanner$SimilarGroup;->mImageIdsInGroup:[Ljava/lang/Long;

    add-int/lit8 v11, v8, 0x1

    iget-object v12, v3, Lcom/miui/gallery/cleaner/SimilarScanner$SimilarGroup;->mImageIdsInGroup:[Ljava/lang/Long;

    array-length v12, v12

    sub-int/2addr v12, v8

    sub-int/2addr v12, v5

    invoke-static {v10, v11, v9, v8, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_7
    iput-object v9, v3, Lcom/miui/gallery/cleaner/SimilarScanner$SimilarGroup;->mImageIdsInGroup:[Ljava/lang/Long;

    goto :goto_4

    :cond_8
    add-int/lit8 v8, v8, 0x1

    :goto_4
    add-int/lit8 v7, v7, 0x1

    goto :goto_3

    :cond_9
    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method


# virtual methods
.method public getClusterGroupId()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mSimilarGroupList:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mClusterGroupId:Ljava/util/ArrayList;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getGroupItemCount()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mSimilarGroupList:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mGroupItemCount:Ljava/util/ArrayList;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getGroupStartPos()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mSimilarGroupList:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getScanResultIds()Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mSimilarGroupList:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iget-object v2, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mSimilarGroupList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v2, :cond_1

    iget-object v5, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mSimilarGroupList:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/miui/gallery/cleaner/SimilarScanner$SimilarGroup;

    iget-object v5, v5, Lcom/miui/gallery/cleaner/SimilarScanner$SimilarGroup;->mImageIdsInGroup:[Ljava/lang/Long;

    const/4 v6, 0x0

    :goto_1
    array-length v7, v5

    if-ge v6, v7, :cond_0

    aget-object v7, v5, v6

    invoke-interface {v1, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_1
    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public isLoadingValid()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mIsLoadingValid:Z

    return v0
.end method

.method public onMediaItemDeleted(J)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/cleaner/SimilarScanner;->removeItem(J)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/cleaner/SimilarScanner;->buildScanResult()Lcom/miui/gallery/cleaner/ScanResult;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/cleaner/SimilarScanner;->updateScanResult(Lcom/miui/gallery/cleaner/ScanResult;)V

    :cond_0
    return-void
.end method

.method protected onReset()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mSimilarGroupList:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mSimilarGroupList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    iget-object v1, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mId2Item:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    iget-object v1, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mGroupItemCount:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    iget-object v1, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    iget-object v1, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mClusterGroupId:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    const-wide v1, 0x7fffffffffffffffL

    iput-wide v1, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mFeatureSqlStartTime:J

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mIsLoadingValid:Z

    iput-boolean v1, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mScanLockCompleted:Z

    iget-object v1, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mFurtherLoadingTask:Lcom/miui/gallery/threadpool/Future;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mFurtherLoadingTask:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v1}, Lcom/miui/gallery/threadpool/Future;->cancel()V

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mFurtherLoadingTask:Lcom/miui/gallery/threadpool/Future;

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public removeItems([J)V
    .locals 6

    if-nez p1, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mSimilarGroupList:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_0
    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    aget-wide v3, p1, v2

    invoke-direct {p0, v3, v4}, Lcom/miui/gallery/cleaner/SimilarScanner;->removeItem(J)Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/cleaner/SimilarScanner;->buildScanResult()Lcom/miui/gallery/cleaner/ScanResult;

    move-result-object v5

    invoke-virtual {p0, v3, v4, v5}, Lcom/miui/gallery/cleaner/SimilarScanner;->updateScanResult(JLcom/miui/gallery/cleaner/ScanResult;)V

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public removeSingleItemGroups()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mSimilarGroupList:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mSimilarGroupList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x0

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/cleaner/SimilarScanner$SimilarGroup;

    iget-object v3, v3, Lcom/miui/gallery/cleaner/SimilarScanner$SimilarGroup;->mImageIdsInGroup:[Ljava/lang/Long;

    array-length v3, v3

    const/4 v4, 0x1

    if-gt v3, v4, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    const/4 v2, 0x1

    goto :goto_0

    :cond_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_2

    invoke-direct {p0}, Lcom/miui/gallery/cleaner/SimilarScanner;->buildScanResult()Lcom/miui/gallery/cleaner/ScanResult;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/cleaner/SimilarScanner;->updateScanResult(Lcom/miui/gallery/cleaner/ScanResult;)V

    :cond_2
    return-void

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public scan()Lcom/miui/gallery/cleaner/ScanResult;
    .locals 6

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    iget-wide v1, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mCameraLocalId:J

    const-wide/16 v3, -0x1

    cmp-long v5, v1, v3

    if-nez v5, :cond_0

    invoke-direct {p0, v0}, Lcom/miui/gallery/cleaner/SimilarScanner;->queryCameraAlbumId(Landroid/content/Context;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mCameraLocalId:J

    iget-wide v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mCameraLocalId:J

    cmp-long v2, v0, v3

    if-nez v2, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mIsLoadingValid:Z

    const-wide v0, 0x7fffffffffffffffL

    iput-wide v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mFeatureSqlStartTime:J

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/cleaner/SimilarScanner;->resetSimilarGroupList()V

    iget-object v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mSimilarGroupList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-gtz v0, :cond_3

    invoke-static {}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->getInstance()Lcom/miui/gallery/assistant/manager/ImageFeatureManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->isNewImageCalculationEnable()Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mScanLockCompleted:Z

    new-instance v0, Lcom/miui/gallery/cleaner/SimilarScanner$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/cleaner/SimilarScanner$1;-><init>(Lcom/miui/gallery/cleaner/SimilarScanner;)V

    const/16 v1, 0x1e

    invoke-direct {p0, v1, v1, v0}, Lcom/miui/gallery/cleaner/SimilarScanner;->handleImagesByLimit(IILcom/miui/gallery/cleaner/SimilarScanner$OnClusterCompletedListener;)Z

    iget-object v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mScanLock:Ljava/lang/Object;

    monitor-enter v0

    :goto_0
    :try_start_0
    iget-boolean v1, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mScanLockCompleted:Z

    if-nez v1, :cond_2

    iget-boolean v1, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mIsLoadingValid:Z

    if-eqz v1, :cond_2

    const-string v1, "SimilarScanner"

    const-string v2, "lock for similar cluster result"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mScanLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v1

    goto :goto_1

    :catch_0
    move-exception v1

    :try_start_1
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_2
    monitor-exit v0

    goto :goto_2

    :goto_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    :cond_3
    :goto_2
    iget-object v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mSimilarGroupList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const-wide/16 v1, 0x0

    if-gtz v0, :cond_4

    iget-wide v3, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mFeatureSqlStartTime:J

    cmp-long v0, v3, v1

    if-lez v0, :cond_4

    iget-boolean v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mIsLoadingValid:Z

    if-eqz v0, :cond_4

    invoke-static {}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->getInstance()Lcom/miui/gallery/assistant/manager/ImageFeatureManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->isNewImageCalculationEnable()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_4
    iget-boolean v0, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mIsLoadingValid:Z

    if-eqz v0, :cond_5

    iget-wide v3, p0, Lcom/miui/gallery/cleaner/SimilarScanner;->mFeatureSqlStartTime:J

    cmp-long v0, v3, v1

    if-lez v0, :cond_5

    invoke-static {}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->getInstance()Lcom/miui/gallery/assistant/manager/ImageFeatureManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->isNewImageCalculationEnable()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-direct {p0}, Lcom/miui/gallery/cleaner/SimilarScanner;->handleRemainImages()V

    :cond_5
    const-string v0, "SimilarScanner"

    const-string v1, "scan finish."

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/miui/gallery/cleaner/SimilarScanner;->buildScanResult()Lcom/miui/gallery/cleaner/ScanResult;

    move-result-object v0

    return-object v0
.end method
