.class public Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;
.super Ljava/lang/Object;
.source "ImageFeatureCacheManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "GroupBestImage"
.end annotation


# instance fields
.field mBestImage:Lcom/miui/gallery/assistant/model/TinyImageFeature;

.field volatile mGroupId:J

.field mImageCount:Ljava/util/concurrent/atomic/AtomicInteger;

.field mImageFeatureInGroup:Ljava/util/TreeSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/TreeSet<",
            "Lcom/miui/gallery/assistant/model/TinyImageFeature;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(JILcom/miui/gallery/assistant/model/TinyImageFeature;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/TreeSet;

    invoke-direct {v0}, Ljava/util/TreeSet;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;->mImageFeatureInGroup:Ljava/util/TreeSet;

    iput-wide p1, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;->mGroupId:J

    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {p1, p3}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object p1, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;->mImageCount:Ljava/util/concurrent/atomic/AtomicInteger;

    if-eqz p4, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;->mImageFeatureInGroup:Ljava/util/TreeSet;

    invoke-virtual {p1, p4}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    invoke-virtual {p4}, Lcom/miui/gallery/assistant/model/TinyImageFeature;->isPoorImage()Z

    move-result p1

    if-nez p1, :cond_0

    iput-object p4, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;->mBestImage:Lcom/miui/gallery/assistant/model/TinyImageFeature;

    :cond_0
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;->mImageCount:Ljava/util/concurrent/atomic/AtomicInteger;

    iget-object v1, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;->mImageCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;->mBestImage:Lcom/miui/gallery/assistant/model/TinyImageFeature;

    iget-object v0, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;->mImageFeatureInGroup:Ljava/util/TreeSet;

    invoke-virtual {v0}, Ljava/util/TreeSet;->clear()V

    return-void
.end method

.method public getBestImage()Lcom/miui/gallery/assistant/model/TinyImageFeature;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;->mBestImage:Lcom/miui/gallery/assistant/model/TinyImageFeature;

    return-object v0
.end method

.method public getGroupId()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;->mGroupId:J

    return-wide v0
.end method

.method public getImageCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;->mImageCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    return v0
.end method

.method public getImageFeatureInGroup()Ljava/util/TreeSet;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/TreeSet<",
            "Lcom/miui/gallery/assistant/model/TinyImageFeature;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;->mImageFeatureInGroup:Ljava/util/TreeSet;

    return-object v0
.end method

.method public increase()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;->mImageCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v0

    return v0
.end method

.method public tryReplace(Lcom/miui/gallery/assistant/model/TinyImageFeature;)V
    .locals 5

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;->mImageFeatureInGroup:Ljava/util/TreeSet;

    invoke-virtual {v0, p1}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/model/TinyImageFeature;->isPoorImage()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;->mBestImage:Lcom/miui/gallery/assistant/model/TinyImageFeature;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;->mBestImage:Lcom/miui/gallery/assistant/model/TinyImageFeature;

    invoke-virtual {v0}, Lcom/miui/gallery/assistant/model/TinyImageFeature;->getScore()D

    move-result-wide v0

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/model/TinyImageFeature;->getScore()D

    move-result-wide v2

    cmpg-double v4, v0, v2

    if-ltz v4, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;->mBestImage:Lcom/miui/gallery/assistant/model/TinyImageFeature;

    invoke-virtual {v0}, Lcom/miui/gallery/assistant/model/TinyImageFeature;->getImageId()J

    move-result-wide v0

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/model/TinyImageFeature;->getImageId()J

    move-result-wide v2

    cmp-long v4, v0, v2

    if-nez v4, :cond_1

    :cond_0
    iput-object p1, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;->mBestImage:Lcom/miui/gallery/assistant/model/TinyImageFeature;

    :cond_1
    return-void
.end method
