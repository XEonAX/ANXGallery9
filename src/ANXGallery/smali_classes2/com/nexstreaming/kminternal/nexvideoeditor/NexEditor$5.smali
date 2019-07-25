.class Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$5;
.super Ljava/lang/Object;
.source "NexEditor.java"

# interfaces
.implements Landroid/media/ImageReader$OnImageAvailableListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(IIILcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$e;)Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;


# direct methods
.method constructor <init>(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$5;->a:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onImageAvailable(Landroid/media/ImageReader;)V
    .locals 10

    const-string v0, "NexEditor"

    const-string v1, "image Capture setOnImageAvailableListener jpeg == "

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p1}, Landroid/media/ImageReader;->acquireLatestImage()Landroid/media/Image;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_3

    :try_start_1
    invoke-virtual {v1}, Landroid/media/Image;->getPlanes()[Landroid/media/Image$Plane;

    move-result-object v2

    const/4 v3, 0x0

    aget-object v4, v2, v3

    invoke-virtual {v4}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v4

    if-nez v4, :cond_1

    iget-object v2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$5;->a:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    sget-object v3, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->UNKNOWN:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    invoke-virtual {v2, v3}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->e(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/media/Image;->close()V

    :cond_0
    invoke-virtual {p1}, Landroid/media/ImageReader;->close()V

    iget-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$5;->a:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-static {p1, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;Landroid/media/ImageReader;)Landroid/media/ImageReader;

    return-void

    :cond_1
    :try_start_2
    invoke-virtual {v1}, Landroid/media/Image;->getWidth()I

    move-result v4

    invoke-virtual {v1}, Landroid/media/Image;->getHeight()I

    move-result v5

    aget-object v6, v2, v3

    invoke-virtual {v6}, Landroid/media/Image$Plane;->getRowStride()I

    move-result v6

    mul-int/lit8 v7, v4, 0x4

    mul-int v8, v4, v5

    mul-int/lit8 v8, v8, 0x4

    new-array v8, v8, [B

    aget-object v2, v2, v3

    invoke-virtual {v2}, Landroid/media/Image$Plane;->getBuffer()Ljava/nio/ByteBuffer;

    move-result-object v2

    :goto_0
    if-ge v3, v5, :cond_2

    mul-int v9, v4, v3

    mul-int/lit8 v9, v9, 0x4

    invoke-virtual {v2, v8, v9, v7}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    add-int/lit8 v3, v3, 0x1

    mul-int v9, v6, v3

    invoke-virtual {v2, v9}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    goto :goto_0

    :cond_2
    const-string v2, "NexEditor"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "image Capture prepareSurface = "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$5;->a:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-static {v6}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->c(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;)Landroid/view/Surface;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$5;->a:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    iget-object v3, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$5;->a:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-static {v3}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->c(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;)Landroid/view/Surface;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;Landroid/view/Surface;)I

    iget-object v3, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$5;->a:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    array-length v6, v8

    const/4 v2, 0x0

    move-object v7, v8

    move v8, v2

    invoke-virtual/range {v3 .. v8}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(III[BZ)V

    invoke-virtual {v1}, Landroid/media/Image;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    move-object v1, v0

    goto :goto_1

    :catch_0
    move-exception v2

    goto :goto_3

    :cond_3
    :goto_1
    if-eqz v1, :cond_4

    :goto_2
    invoke-virtual {v1}, Landroid/media/Image;->close()V

    :cond_4
    invoke-virtual {p1}, Landroid/media/ImageReader;->close()V

    iget-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$5;->a:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-static {p1, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;Landroid/media/ImageReader;)Landroid/media/ImageReader;

    goto :goto_4

    :catchall_0
    move-exception v2

    move-object v1, v0

    goto :goto_5

    :catch_1
    move-exception v2

    move-object v1, v0

    :goto_3
    :try_start_3
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    const-string v2, "NexEditor"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "image Capture prepareSurface(exception) = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$5;->a:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-static {v4}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->c(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;)Landroid/view/Surface;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$5;->a:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    iget-object v3, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$5;->a:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-static {v3}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->c(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;)Landroid/view/Surface;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;Landroid/view/Surface;)I

    iget-object v2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$5;->a:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    sget-object v3, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;->UNKNOWN:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;

    invoke-virtual {v2, v3}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->e(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$ErrorCode;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz v1, :cond_4

    goto :goto_2

    :goto_4
    return-void

    :catchall_1
    move-exception v2

    :goto_5
    if-eqz v1, :cond_5

    invoke-virtual {v1}, Landroid/media/Image;->close()V

    :cond_5
    invoke-virtual {p1}, Landroid/media/ImageReader;->close()V

    iget-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor$5;->a:Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;

    invoke-static {p1, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/NexEditor;Landroid/media/ImageReader;)Landroid/media/ImageReader;

    throw v2
.end method
