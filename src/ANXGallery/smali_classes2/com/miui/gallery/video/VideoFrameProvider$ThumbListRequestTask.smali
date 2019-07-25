.class Lcom/miui/gallery/video/VideoFrameProvider$ThumbListRequestTask;
.super Lcom/miui/gallery/video/VideoFrameProvider$RequestTask;
.source "VideoFrameProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/video/VideoFrameProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ThumbListRequestTask"
.end annotation


# instance fields
.field private mVideoDuration:I

.field private mVideoHeight:I

.field private mVideoWidth:I

.field final synthetic this$0:Lcom/miui/gallery/video/VideoFrameProvider;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/video/VideoFrameProvider;Ljava/lang/String;II)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListRequestTask;->this$0:Lcom/miui/gallery/video/VideoFrameProvider;

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/miui/gallery/video/VideoFrameProvider$RequestTask;-><init>(Lcom/miui/gallery/video/VideoFrameProvider;Ljava/lang/String;II)V

    return-void
.end method

.method private extractVideoMetadata(Ljava/lang/String;)V
    .locals 3

    new-instance v0, Landroid/media/MediaMetadataRetriever;

    invoke-direct {v0}, Landroid/media/MediaMetadataRetriever;-><init>()V

    :try_start_0
    invoke-virtual {v0, p1}, Landroid/media/MediaMetadataRetriever;->setDataSource(Ljava/lang/String;)V

    const/16 p1, 0x9

    invoke-virtual {v0, p1}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListRequestTask;->mVideoDuration:I

    const/16 p1, 0x12

    invoke-virtual {v0, p1}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListRequestTask;->mVideoWidth:I

    const/16 p1, 0x13

    invoke-virtual {v0, p1}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListRequestTask;->mVideoHeight:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception p1

    :try_start_1
    const-string v1, "VideoFrameProvider"

    const-string v2, "extractVideoMetadata error\n"

    invoke-static {v1, v2, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    invoke-virtual {v0}, Landroid/media/MediaMetadataRetriever;->release()V

    return-void

    :goto_1
    invoke-virtual {v0}, Landroid/media/MediaMetadataRetriever;->release()V

    throw p1
.end method


# virtual methods
.method public handle(Lcom/miui/video/localvideoplayer/VideoFrameInterface;)V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListRequestTask;->mPath:Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListRequestTask;->extractVideoMetadata(Ljava/lang/String;)V

    iget v2, p0, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListRequestTask;->mVideoWidth:I

    if-lez v2, :cond_7

    iget v2, p0, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListRequestTask;->mVideoHeight:I

    if-gtz v2, :cond_0

    goto/16 :goto_3

    :cond_0
    iget v2, p0, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListRequestTask;->mVideoWidth:I

    int-to-float v2, v2

    const/high16 v3, 0x3f800000    # 1.0f

    mul-float v2, v2, v3

    iget v4, p0, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListRequestTask;->mVideoHeight:I

    int-to-float v4, v4

    div-float/2addr v2, v4

    iget v4, p0, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListRequestTask;->mRequestWidth:I

    int-to-float v4, v4

    mul-float v4, v4, v3

    iget v5, p0, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListRequestTask;->mRequestHeight:I

    int-to-float v5, v5

    div-float/2addr v4, v5

    cmpl-float v2, v2, v4

    if-lez v2, :cond_1

    iget v2, p0, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListRequestTask;->mRequestHeight:I

    int-to-float v4, v2

    mul-float v4, v4, v3

    iget v3, p0, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListRequestTask;->mVideoWidth:I

    int-to-float v3, v3

    mul-float v4, v4, v3

    iget v3, p0, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListRequestTask;->mVideoHeight:I

    int-to-float v3, v3

    div-float/2addr v4, v3

    float-to-int v3, v4

    move v11, v3

    move v3, v2

    move v2, v11

    goto :goto_0

    :cond_1
    iget v2, p0, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListRequestTask;->mRequestWidth:I

    int-to-float v4, v2

    mul-float v4, v4, v3

    iget v3, p0, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListRequestTask;->mVideoHeight:I

    int-to-float v3, v3

    mul-float v4, v4, v3

    iget v3, p0, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListRequestTask;->mVideoWidth:I

    int-to-float v3, v3

    div-float/2addr v4, v3

    float-to-int v3, v4

    :goto_0
    iget-object v4, p0, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListRequestTask;->mPath:Ljava/lang/String;

    invoke-interface {p1, v4, v2, v3}, Lcom/miui/video/localvideoplayer/VideoFrameInterface;->getFrameList(Ljava/lang/String;II)Lcom/miui/video/localvideoplayer/FrameParams;

    move-result-object p1

    if-nez p1, :cond_2

    const-string p1, "VideoFrameProvider"

    const-string v0, "request thumbList params null"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_2
    invoke-virtual {p1}, Lcom/miui/video/localvideoplayer/FrameParams;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v2

    if-nez v2, :cond_3

    const-string p1, "VideoFrameProvider"

    const-string v0, "request thumbList fd null"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_3
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v2}, Lcom/miui/gallery/video/VideoFrameProvider;->readRemoteData(Ljava/io/FileDescriptor;)[B

    move-result-object v2

    if-eqz v2, :cond_5

    invoke-virtual {p1}, Lcom/miui/video/localvideoplayer/FrameParams;->getWidth()I

    move-result v4

    invoke-virtual {p1}, Lcom/miui/video/localvideoplayer/FrameParams;->getHeight()I

    move-result v5

    mul-int v6, v4, v5

    mul-int/lit8 v6, v6, 0x4

    const/4 v7, 0x0

    invoke-virtual {p1}, Lcom/miui/video/localvideoplayer/FrameParams;->getCount()I

    move-result v8

    :goto_1
    if-ge v7, v8, :cond_5

    mul-int v9, v6, v7

    invoke-virtual {p1}, Lcom/miui/video/localvideoplayer/FrameParams;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v10

    invoke-static {v2, v9, v4, v5, v10}, Lcom/miui/gallery/video/VideoFrameProvider;->createBitmap([BIIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v9

    if-eqz v9, :cond_4

    invoke-interface {v3, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_4
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    :cond_5
    invoke-static {v3}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result p1

    if-eqz p1, :cond_6

    new-instance p1, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListInfo;

    iget-object v4, p0, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListRequestTask;->mPath:Ljava/lang/String;

    iget v5, p0, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListRequestTask;->mVideoWidth:I

    iget v6, p0, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListRequestTask;->mVideoHeight:I

    iget v2, p0, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListRequestTask;->mVideoDuration:I

    int-to-long v7, v2

    move-object v2, p1

    invoke-direct/range {v2 .. v8}, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListInfo;-><init>(Ljava/util/List;Ljava/lang/String;IIJ)V

    iget-object v2, p0, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListRequestTask;->this$0:Lcom/miui/gallery/video/VideoFrameProvider;

    iget-object v3, p0, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListRequestTask;->mPath:Ljava/lang/String;

    invoke-static {v2, v3, p1}, Lcom/miui/gallery/video/VideoFrameProvider;->access$100(Lcom/miui/gallery/video/VideoFrameProvider;Ljava/lang/String;Lcom/miui/gallery/video/VideoFrameProvider$ThumbListInfo;)V

    iget-object v2, p0, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListRequestTask;->this$0:Lcom/miui/gallery/video/VideoFrameProvider;

    invoke-static {v2}, Lcom/miui/gallery/video/VideoFrameProvider;->access$200(Lcom/miui/gallery/video/VideoFrameProvider;)Landroid/util/LruCache;

    move-result-object v2

    monitor-enter v2

    :try_start_0
    iget-object v3, p0, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListRequestTask;->this$0:Lcom/miui/gallery/video/VideoFrameProvider;

    invoke-static {v3}, Lcom/miui/gallery/video/VideoFrameProvider;->access$200(Lcom/miui/gallery/video/VideoFrameProvider;)Landroid/util/LruCache;

    move-result-object v3

    iget-object v4, p0, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListRequestTask;->mPath:Ljava/lang/String;

    invoke-virtual {v3, v4, p1}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v2

    goto :goto_2

    :catchall_0
    move-exception p1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_6
    const-string p1, "VideoFrameProvider"

    const-string v2, "request thumbList empty"

    invoke-static {p1, v2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    :goto_2
    const-string p1, "VideoFrameProvider"

    const-string v2, "request thumb list cost %d"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, v0

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {p1, v2, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    :cond_7
    :goto_3
    const-string p1, "VideoFrameProvider"

    const-string v0, "request thumbList width height invalid"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
