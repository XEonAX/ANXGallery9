.class public Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;
.super Ljava/lang/Object;
.source "PhotoPageImageBaseItem.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/FutureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageImageBaseItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "RegionDecoderManager"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$RegionReleaseJob;,
        Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$RegionCreateJob;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/FutureListener<",
        "Lcom/miui/gallery/util/photoview/TileBitProvider;",
        ">;"
    }
.end annotation


# instance fields
.field private mDecoderProvider:Lcom/miui/gallery/util/photoview/TileBitProvider;

.field private mFileKey:Ljava/lang/String;

.field private mRegionCreateFuture:Lcom/miui/gallery/threadpool/Future;

.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageImageBaseItem;


# direct methods
.method protected constructor <init>(Lcom/miui/gallery/ui/PhotoPageImageBaseItem;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageBaseItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->release()V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->create()V

    return-void
.end method

.method static synthetic access$302(Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;Lcom/miui/gallery/util/photoview/TileBitProvider;)Lcom/miui/gallery/util/photoview/TileBitProvider;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->mDecoderProvider:Lcom/miui/gallery/util/photoview/TileBitProvider;

    return-object p1
.end method

.method static synthetic access$502(Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->mFileKey:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$600(Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;Ljava/lang/String;J)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->genFileKey(Ljava/lang/String;J)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private canSupportRegion()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageBaseItem;

    iget-boolean v0, v0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->mIsSupportRegion:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageBaseItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageBaseItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getMimeType()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/FileMimeUtil;->isImageFromMimeType(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageBaseItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getMimeType()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/FileMimeUtil;->isGifFromMimeType(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private create()V
    .locals 4

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->release()V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->canSupportRegion()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$RegionCreateJob;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageBaseItem;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v2}, Lcom/miui/gallery/model/BaseDataItem;->getPathDisplayBetter()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageBaseItem;

    iget-object v3, v3, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v3}, Lcom/miui/gallery/model/BaseDataItem;->getSecretKey()[B

    move-result-object v3

    invoke-direct {v1, p0, v2, v3}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$RegionCreateJob;-><init>(Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;Ljava/lang/String;[B)V

    invoke-virtual {v0, v1, p0}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/threadpool/FutureListener;)Lcom/miui/gallery/threadpool/Future;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->mRegionCreateFuture:Lcom/miui/gallery/threadpool/Future;

    :cond_0
    return-void
.end method

.method private genFileKey(Ljava/lang/String;J)Ljava/lang/String;
    .locals 4

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%s_%d"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 p1, 0x1

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    aput-object p2, v2, p1

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private isFileChanged()Z
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageBaseItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    const/4 v1, 0x1

    if-nez v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageBaseItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getPathDisplayBetter()Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageBaseItem;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v2}, Lcom/miui/gallery/model/BaseDataItem;->getDisplayBetterFileSize()J

    move-result-wide v2

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2

    invoke-direct {p0, v0, v2, v3}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->genFileKey(Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->mFileKey:Ljava/lang/String;

    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :cond_2
    :goto_0
    return v1
.end method

.method private release()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->mRegionCreateFuture:Lcom/miui/gallery/threadpool/Future;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->mRegionCreateFuture:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/Future;->cancel()V

    iput-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->mRegionCreateFuture:Lcom/miui/gallery/threadpool/Future;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->mDecoderProvider:Lcom/miui/gallery/util/photoview/TileBitProvider;

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v2, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$RegionReleaseJob;

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->mDecoderProvider:Lcom/miui/gallery/util/photoview/TileBitProvider;

    invoke-direct {v2, p0, v3}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$RegionReleaseJob;-><init>(Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;Lcom/miui/gallery/util/photoview/TileBitProvider;)V

    invoke-virtual {v0, v2}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    iput-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->mDecoderProvider:Lcom/miui/gallery/util/photoview/TileBitProvider;

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageBaseItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoView;->releaseTile()V

    return-void
.end method


# virtual methods
.method public onFutureDone(Lcom/miui/gallery/threadpool/Future;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/threadpool/Future<",
            "Lcom/miui/gallery/util/photoview/TileBitProvider;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p1}, Lcom/miui/gallery/threadpool/Future;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/util/photoview/TileBitProvider;

    if-eqz v0, :cond_2

    invoke-interface {v0}, Lcom/miui/gallery/util/photoview/TileBitProvider;->getImageWidth()I

    move-result v1

    if-lez v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageBaseItem;

    const/4 v2, 0x1

    iput-boolean v2, v1, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->mIsSupportRegion:Z

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageBaseItem;

    new-instance v2, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$2;

    invoke-direct {v2, p0, p1, v0}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$2;-><init>(Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;Lcom/miui/gallery/threadpool/Future;Lcom/miui/gallery/util/photoview/TileBitProvider;)V

    invoke-virtual {v1, v2}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->post(Ljava/lang/Runnable;)Z

    goto :goto_1

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageBaseItem;

    const/4 v0, 0x0

    iput-boolean v0, p1, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->mIsSupportRegion:Z

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageBaseItem;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageBaseItem;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "PhotoPageImageBaseItem"

    const-string v1, "not support region %s"

    invoke-static {p1}, Lcom/miui/gallery/util/MediaFile;->getMimeTypeForFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageBaseItem;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/ImageLoader;->cancelDisplayTask(Landroid/widget/ImageView;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageBaseItem;

    new-instance v1, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$3;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$3;-><init>(Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->post(Ljava/lang/Runnable;)Z

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "type"

    invoke-static {p1}, Lcom/miui/gallery/util/MediaFile;->getMimeTypeForFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "photo"

    const-string v1, "photo_not_support_region"

    invoke-static {p1, v1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_2
    :goto_1
    return-void
.end method

.method public onSelected()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->create()V

    return-void
.end method

.method public onUnSelected()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->release()V

    return-void
.end method

.method public resetRegionDecoderIfNeeded()V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->isFileChanged()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageBaseItem;

    new-instance v1, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$1;-><init>(Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
