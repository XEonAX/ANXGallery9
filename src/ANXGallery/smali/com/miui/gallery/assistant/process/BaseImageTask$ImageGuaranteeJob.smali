.class Lcom/miui/gallery/assistant/process/BaseImageTask$ImageGuaranteeJob;
.super Ljava/lang/Object;
.source "BaseImageTask.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/assistant/process/BaseImageTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ImageGuaranteeJob"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field private final mDownloadType:Lcom/miui/gallery/sdk/download/DownloadType;

.field private final mIsDownloadCloudImage:Z

.field private final mMediaFeatureItem:Lcom/miui/gallery/assistant/model/MediaFeatureItem;


# direct methods
.method constructor <init>(Lcom/miui/gallery/assistant/model/MediaFeatureItem;Lcom/miui/gallery/sdk/download/DownloadType;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/assistant/process/BaseImageTask$ImageGuaranteeJob;->mMediaFeatureItem:Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    iput-object p2, p0, Lcom/miui/gallery/assistant/process/BaseImageTask$ImageGuaranteeJob;->mDownloadType:Lcom/miui/gallery/sdk/download/DownloadType;

    iput-boolean p3, p0, Lcom/miui/gallery/assistant/process/BaseImageTask$ImageGuaranteeJob;->mIsDownloadCloudImage:Z

    return-void
.end method


# virtual methods
.method public bridge synthetic run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/assistant/process/BaseImageTask$ImageGuaranteeJob;->run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/String;
    .locals 6

    iget-object p1, p0, Lcom/miui/gallery/assistant/process/BaseImageTask$ImageGuaranteeJob;->mMediaFeatureItem:Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    const/4 v0, 0x0

    if-eqz p1, :cond_e

    iget-object p1, p0, Lcom/miui/gallery/assistant/process/BaseImageTask$ImageGuaranteeJob;->mMediaFeatureItem:Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getMicroThumbnailPath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/assistant/process/BaseImageTask$ImageGuaranteeJob;->mMediaFeatureItem:Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getMicroThumbnailPath()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    move-object p1, v0

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/assistant/process/BaseImageTask$ImageGuaranteeJob;->mMediaFeatureItem:Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    invoke-virtual {v1}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getThumbnailPath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/assistant/process/BaseImageTask$ImageGuaranteeJob;->mMediaFeatureItem:Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    invoke-virtual {v1}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getThumbnailPath()Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    :cond_1
    move-object v1, v0

    :goto_1
    iget-object v2, p0, Lcom/miui/gallery/assistant/process/BaseImageTask$ImageGuaranteeJob;->mMediaFeatureItem:Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    invoke-virtual {v2}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getOriginPath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/miui/gallery/assistant/process/BaseImageTask$ImageGuaranteeJob;->mMediaFeatureItem:Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    invoke-virtual {v2}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getOriginPath()Ljava/lang/String;

    move-result-object v2

    goto :goto_2

    :cond_2
    move-object v2, v0

    :goto_2
    :try_start_0
    iget-boolean v3, p0, Lcom/miui/gallery/assistant/process/BaseImageTask$ImageGuaranteeJob;->mIsDownloadCloudImage:Z

    if-nez v3, :cond_5

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_3

    goto :goto_3

    :cond_3
    move-object p1, v2

    goto :goto_3

    :cond_4
    move-object p1, v1

    :goto_3
    return-object p1

    :cond_5
    iget-object v3, p0, Lcom/miui/gallery/assistant/process/BaseImageTask$ImageGuaranteeJob;->mDownloadType:Lcom/miui/gallery/sdk/download/DownloadType;

    sget-object v4, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN:Lcom/miui/gallery/sdk/download/DownloadType;

    if-ne v3, v4, :cond_7

    if-eqz v2, :cond_6

    goto :goto_5

    :cond_6
    iget-object p1, p0, Lcom/miui/gallery/assistant/process/BaseImageTask$ImageGuaranteeJob;->mMediaFeatureItem:Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getId()J

    move-result-wide v1

    iget-object p1, p0, Lcom/miui/gallery/assistant/process/BaseImageTask$ImageGuaranteeJob;->mDownloadType:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-static {v1, v2, p1}, Lcom/miui/gallery/assistant/process/BaseImageTask;->access$000(JLcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    iget-object v0, p0, Lcom/miui/gallery/assistant/process/BaseImageTask$ImageGuaranteeJob;->mMediaFeatureItem:Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->setOriginPath(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_7

    :catch_0
    move-exception v0

    move-object v5, v0

    move-object v0, p1

    move-object p1, v5

    goto :goto_6

    :cond_7
    :try_start_2
    iget-object v3, p0, Lcom/miui/gallery/assistant/process/BaseImageTask$ImageGuaranteeJob;->mDownloadType:Lcom/miui/gallery/sdk/download/DownloadType;

    sget-object v4, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL:Lcom/miui/gallery/sdk/download/DownloadType;

    if-ne v3, v4, :cond_a

    if-eqz v1, :cond_8

    goto :goto_4

    :cond_8
    if-eqz v2, :cond_9

    goto :goto_5

    :cond_9
    iget-object p1, p0, Lcom/miui/gallery/assistant/process/BaseImageTask$ImageGuaranteeJob;->mMediaFeatureItem:Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getId()J

    move-result-wide v1

    iget-object p1, p0, Lcom/miui/gallery/assistant/process/BaseImageTask$ImageGuaranteeJob;->mDownloadType:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-static {v1, v2, p1}, Lcom/miui/gallery/assistant/process/BaseImageTask;->access$000(JLcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object p1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    :try_start_3
    iget-object v0, p0, Lcom/miui/gallery/assistant/process/BaseImageTask$ImageGuaranteeJob;->mMediaFeatureItem:Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->setThumbnailPath(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_7

    :cond_a
    if-eqz p1, :cond_b

    goto :goto_7

    :cond_b
    if-eqz v1, :cond_c

    :goto_4
    move-object p1, v1

    goto :goto_7

    :cond_c
    if-eqz v2, :cond_d

    :goto_5
    move-object p1, v2

    goto :goto_7

    :cond_d
    :try_start_4
    iget-object p1, p0, Lcom/miui/gallery/assistant/process/BaseImageTask$ImageGuaranteeJob;->mMediaFeatureItem:Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getId()J

    move-result-wide v1

    iget-object p1, p0, Lcom/miui/gallery/assistant/process/BaseImageTask$ImageGuaranteeJob;->mDownloadType:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-static {v1, v2, p1}, Lcom/miui/gallery/assistant/process/BaseImageTask;->access$000(JLcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object p1
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    :try_start_5
    iget-object v0, p0, Lcom/miui/gallery/assistant/process/BaseImageTask$ImageGuaranteeJob;->mMediaFeatureItem:Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->setMicroThumbnailPath(Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    goto :goto_7

    :catch_1
    move-exception p1

    :goto_6
    const-string v1, "ImageGuaranteeJob"

    const-string v2, "downloadImage occur error.\n"

    invoke-static {v1, v2, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    move-object p1, v0

    :goto_7
    return-object p1

    :cond_e
    return-object v0
.end method
