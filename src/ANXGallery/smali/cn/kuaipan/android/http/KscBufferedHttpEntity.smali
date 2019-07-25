.class public Lcn/kuaipan/android/http/KscBufferedHttpEntity;
.super Lorg/apache/http/entity/HttpEntityWrapper;
.source "KscBufferedHttpEntity.java"


# instance fields
.field private final buffer:Lcn/kuaipan/android/http/RandomInputBuffer;

.field private final err:Ljava/io/IOException;


# direct methods
.method public constructor <init>(Lorg/apache/http/HttpEntity;Lcn/kuaipan/android/http/NetCacheManager;)V
    .locals 6

    invoke-direct {p0, p1}, Lorg/apache/http/entity/HttpEntityWrapper;-><init>(Lorg/apache/http/HttpEntity;)V

    invoke-interface {p1}, Lorg/apache/http/HttpEntity;->isRepeatable()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-gez v0, :cond_0

    goto :goto_0

    :cond_0
    iput-object v1, p0, Lcn/kuaipan/android/http/KscBufferedHttpEntity;->buffer:Lcn/kuaipan/android/http/RandomInputBuffer;

    goto :goto_2

    :cond_1
    :goto_0
    :try_start_0
    new-instance v0, Lcn/kuaipan/android/http/RandomInputBuffer;

    invoke-interface {p1}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object p1

    invoke-direct {v0, p1, p2}, Lcn/kuaipan/android/http/RandomInputBuffer;-><init>(Ljava/io/InputStream;Lcn/kuaipan/android/http/NetCacheManager;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    move-object v0, v1

    move-object v1, p1

    :goto_1
    iput-object v0, p0, Lcn/kuaipan/android/http/KscBufferedHttpEntity;->buffer:Lcn/kuaipan/android/http/RandomInputBuffer;

    :goto_2
    iput-object v1, p0, Lcn/kuaipan/android/http/KscBufferedHttpEntity;->err:Ljava/io/IOException;

    return-void
.end method


# virtual methods
.method public consumeContent()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcn/kuaipan/android/http/KscBufferedHttpEntity;->buffer:Lcn/kuaipan/android/http/RandomInputBuffer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/kuaipan/android/http/KscBufferedHttpEntity;->buffer:Lcn/kuaipan/android/http/RandomInputBuffer;

    invoke-virtual {v0}, Lcn/kuaipan/android/http/RandomInputBuffer;->close()V

    :cond_0
    invoke-super {p0}, Lorg/apache/http/entity/HttpEntityWrapper;->consumeContent()V

    return-void
.end method

.method public getContent()Ljava/io/InputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcn/kuaipan/android/http/KscBufferedHttpEntity;->buffer:Lcn/kuaipan/android/http/RandomInputBuffer;

    if-eqz v0, :cond_0

    new-instance v0, Lcn/kuaipan/android/http/BufferInputStream;

    iget-object v1, p0, Lcn/kuaipan/android/http/KscBufferedHttpEntity;->buffer:Lcn/kuaipan/android/http/RandomInputBuffer;

    invoke-direct {v0, v1}, Lcn/kuaipan/android/http/BufferInputStream;-><init>(Lcn/kuaipan/android/http/RandomInputBuffer;)V

    return-object v0

    :cond_0
    iget-object v0, p0, Lcn/kuaipan/android/http/KscBufferedHttpEntity;->err:Ljava/io/IOException;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcn/kuaipan/android/http/KscBufferedHttpEntity;->wrappedEntity:Lorg/apache/http/HttpEntity;

    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v0

    return-object v0

    :cond_1
    iget-object v0, p0, Lcn/kuaipan/android/http/KscBufferedHttpEntity;->err:Ljava/io/IOException;

    throw v0
.end method

.method public getContentLength()J
    .locals 2

    iget-object v0, p0, Lcn/kuaipan/android/http/KscBufferedHttpEntity;->wrappedEntity:Lorg/apache/http/HttpEntity;

    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v0

    return-wide v0
.end method

.method public isChunked()Z
    .locals 1

    iget-object v0, p0, Lcn/kuaipan/android/http/KscBufferedHttpEntity;->buffer:Lcn/kuaipan/android/http/RandomInputBuffer;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcn/kuaipan/android/http/KscBufferedHttpEntity;->wrappedEntity:Lorg/apache/http/HttpEntity;

    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->isChunked()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isRepeatable()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public isStreaming()Z
    .locals 1

    iget-object v0, p0, Lcn/kuaipan/android/http/KscBufferedHttpEntity;->buffer:Lcn/kuaipan/android/http/RandomInputBuffer;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcn/kuaipan/android/http/KscBufferedHttpEntity;->wrappedEntity:Lorg/apache/http/HttpEntity;

    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->isStreaming()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public writeTo(Ljava/io/OutputStream;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-eqz p1, :cond_4

    iget-object v0, p0, Lcn/kuaipan/android/http/KscBufferedHttpEntity;->buffer:Lcn/kuaipan/android/http/RandomInputBuffer;

    if-eqz v0, :cond_2

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Lcn/kuaipan/android/http/KscBufferedHttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/16 v0, 0x1000

    :try_start_1
    new-array v0, v0, [B

    :goto_0
    invoke-virtual {v1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    const/4 v3, 0x0

    invoke-virtual {p1, v0, v3, v2}, Ljava/io/OutputStream;->write([BII)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :cond_0
    if-eqz v1, :cond_3

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    goto :goto_2

    :catchall_0
    move-exception p1

    goto :goto_1

    :catchall_1
    move-exception p1

    move-object v1, v0

    :goto_1
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    :cond_1
    throw p1

    :cond_2
    iget-object v0, p0, Lcn/kuaipan/android/http/KscBufferedHttpEntity;->wrappedEntity:Lorg/apache/http/HttpEntity;

    invoke-interface {v0, p1}, Lorg/apache/http/HttpEntity;->writeTo(Ljava/io/OutputStream;)V

    :cond_3
    :goto_2
    return-void

    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Output stream may not be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
