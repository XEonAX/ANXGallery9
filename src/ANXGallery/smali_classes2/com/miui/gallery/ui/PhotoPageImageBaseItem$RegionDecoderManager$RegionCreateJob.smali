.class Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$RegionCreateJob;
.super Ljava/lang/Object;
.source "PhotoPageImageBaseItem.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RegionCreateJob"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
        "Lcom/miui/gallery/util/photoview/TileBitProvider;",
        ">;"
    }
.end annotation


# instance fields
.field private mLocalPath:Ljava/lang/String;

.field private mSecretKey:[B

.field final synthetic this$1:Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;Ljava/lang/String;[B)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$RegionCreateJob;->this$1:Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$RegionCreateJob;->mLocalPath:Ljava/lang/String;

    iput-object p3, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$RegionCreateJob;->mSecretKey:[B

    return-void
.end method


# virtual methods
.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Lcom/miui/gallery/util/photoview/TileBitProvider;
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$RegionCreateJob;->mLocalPath:Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Lcom/miui/gallery/threadpool/ThreadPool$JobContext;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_2

    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v2, 0x1

    iput-boolean v2, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$RegionCreateJob;->mLocalPath:Ljava/lang/String;

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$RegionCreateJob;->mSecretKey:[B

    invoke-static {v2, v0, v3}, Lcom/miui/gallery/util/BitmapUtils;->safeDecodeBitmap(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;[B)Landroid/graphics/Bitmap;

    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v3, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-static {v2, v3}, Lcom/miui/gallery/Config$TileConfig;->needUseTile(II)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p1}, Lcom/miui/gallery/threadpool/ThreadPool$JobContext;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_2

    new-instance v0, Lcom/miui/gallery/util/photoview/TileBitProviderRegion;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$RegionCreateJob;->mLocalPath:Ljava/lang/String;

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$RegionCreateJob;->mSecretKey:[B

    invoke-direct {v0, v2, v3}, Lcom/miui/gallery/util/photoview/TileBitProviderRegion;-><init>(Ljava/lang/String;[B)V

    invoke-interface {p1}, Lcom/miui/gallery/threadpool/ThreadPool$JobContext;->isCancelled()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-interface {v0}, Lcom/miui/gallery/util/photoview/TileBitProvider;->release()V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$RegionCreateJob;->this$1:Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;

    invoke-static {p1, v1}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->access$502(Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;Ljava/lang/String;)Ljava/lang/String;

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$RegionCreateJob;->this$1:Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$RegionCreateJob;->this$1:Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$RegionCreateJob;->mLocalPath:Ljava/lang/String;

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$RegionCreateJob;->mLocalPath:Ljava/lang/String;

    invoke-static {v3}, Lcom/miui/gallery/util/FileUtils;->getFileSize(Ljava/lang/String;)J

    move-result-wide v3

    invoke-static {v1, v2, v3, v4}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->access$600(Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;Ljava/lang/String;J)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->access$502(Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;Ljava/lang/String;)Ljava/lang/String;

    return-object v0

    :cond_1
    const-string p1, "PhotoPageImageBaseItem"

    const-string v2, "not need use tile [width %d, height %d]"

    iget v3, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iget v0, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {p1, v2, v3, v0}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_2
    :goto_0
    return-object v1
.end method

.method public bridge synthetic run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager$RegionCreateJob;->run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Lcom/miui/gallery/util/photoview/TileBitProvider;

    move-result-object p1

    return-object p1
.end method
