.class public Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;
.super Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/a;
.source "WrapMediaEncoder.java"


# instance fields
.field private a:Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/d;

.field private b:Landroid/media/MediaCodec;

.field private c:[B

.field private d:[B

.field private e:[Ljava/nio/ByteBuffer;

.field private f:[Ljava/nio/ByteBuffer;


# direct methods
.method public constructor <init>()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/a;-><init>()V

    const-string v0, "video/avc"

    invoke-static {v0}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->b:Landroid/media/MediaCodec;

    const-string v0, "video/avc"

    const/16 v1, 0x500

    const/16 v2, 0x2d0

    invoke-static {v0, v1, v2}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    move-result-object v0

    const-string v1, "bitrate"

    const v2, 0x1e848

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    const-string v1, "frame-rate"

    const/16 v2, 0x1e

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    const-string v1, "color-format"

    const/16 v2, 0x15

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    const-string v1, "i-frame-interval"

    const/4 v2, 0x5

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    iget-object v1, p0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->b:Landroid/media/MediaCodec;

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {v1, v0, v2, v2, v3}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->b:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->start()V

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->b:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->e:[Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->b:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->f:[Ljava/nio/ByteBuffer;

    return-void
.end method

.method public constructor <init>(II)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/a;-><init>()V

    const-string v0, "video/avc"

    invoke-static {v0}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->b:Landroid/media/MediaCodec;

    const-string v0, "video/avc"

    invoke-static {v0, p1, p2}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    move-result-object p1

    const-string p2, "bitrate"

    const v0, 0x1e848

    invoke-virtual {p1, p2, v0}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    const-string p2, "frame-rate"

    const/16 v0, 0x1e

    invoke-virtual {p1, p2, v0}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    const-string p2, "color-format"

    const/16 v0, 0x15

    invoke-virtual {p1, p2, v0}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    const-string p2, "i-frame-interval"

    const/4 v0, 0x5

    invoke-virtual {p1, p2, v0}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    iget-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->b:Landroid/media/MediaCodec;

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-virtual {p2, p1, v0, v0, v1}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    iget-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->b:Landroid/media/MediaCodec;

    invoke-virtual {p1}, Landroid/media/MediaCodec;->start()V

    iget-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->b:Landroid/media/MediaCodec;

    invoke-virtual {p1}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object p1

    iput-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->e:[Ljava/nio/ByteBuffer;

    iget-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->b:Landroid/media/MediaCodec;

    invoke-virtual {p1}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object p1

    iput-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->f:[Ljava/nio/ByteBuffer;

    return-void
.end method


# virtual methods
.method public a()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->b:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->b:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V

    return-void
.end method

.method public a(Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/d;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->a:Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/d;

    return-void
.end method

.method public a([BJ)Z
    .locals 18

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->b:Landroid/media/MediaCodec;

    const/4 v3, 0x0

    if-eqz v2, :cond_b

    iget-object v2, v0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->e:[Ljava/nio/ByteBuffer;

    if-eqz v2, :cond_b

    iget-object v2, v0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->f:[Ljava/nio/ByteBuffer;

    if-eqz v2, :cond_b

    iget-object v2, v0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->a:Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/d;

    if-nez v2, :cond_0

    goto/16 :goto_4

    :cond_0
    iget-object v2, v0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->b:Landroid/media/MediaCodec;

    invoke-virtual {v2}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v2

    iget-object v4, v0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->b:Landroid/media/MediaCodec;

    invoke-virtual {v4}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v4

    iget-object v5, v0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->b:Landroid/media/MediaCodec;

    const-wide/16 v6, -0x1

    invoke-virtual {v5, v6, v7}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    move-result v9

    if-ltz v9, :cond_2

    aget-object v2, v2, v9

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    if-eqz v1, :cond_1

    invoke-virtual {v2, v1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    iget-object v8, v0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->b:Landroid/media/MediaCodec;

    const/4 v10, 0x0

    array-length v11, v1

    const/4 v14, 0x0

    move-wide/from16 v12, p2

    invoke-virtual/range {v8 .. v14}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    goto :goto_0

    :cond_1
    iget-object v8, v0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->b:Landroid/media/MediaCodec;

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v14, 0x4

    move-wide/from16 v12, p2

    invoke-virtual/range {v8 .. v14}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    :cond_2
    :goto_0
    new-instance v1, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v1}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    iget-object v2, v0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->b:Landroid/media/MediaCodec;

    const-wide/16 v5, 0x2710

    invoke-virtual {v2, v1, v5, v6}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    move-result v2

    const/4 v7, 0x3

    const/4 v8, 0x2

    const/4 v9, 0x1

    packed-switch v2, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    const-string v1, "WrapMediaEncoder"

    const-string v2, "dequeueOutputBuffer timed out!"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, v0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->a:Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/d;

    invoke-interface {v1, v7}, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/d;->a(I)Z

    goto/16 :goto_3

    :pswitch_1
    const-string v1, "WrapMediaEncoder"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "New format "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->b:Landroid/media/MediaCodec;

    invoke-virtual {v3}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, v0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->a:Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/d;

    invoke-interface {v1, v8}, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/d;->a(I)Z

    goto/16 :goto_3

    :pswitch_2
    const-string v1, "WrapMediaEncoder"

    const-string v2, "INFO_OUTPUT_BUFFERS_CHANGED"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, v0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->b:Landroid/media/MediaCodec;

    invoke-virtual {v1}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    iget-object v1, v0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->a:Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/d;

    invoke-interface {v1, v9}, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/d;->a(I)Z

    goto/16 :goto_3

    :goto_1
    if-ltz v2, :cond_a

    iget v10, v1, Landroid/media/MediaCodec$BufferInfo;->flags:I

    const/4 v11, 0x4

    and-int/2addr v10, v11

    if-eqz v10, :cond_3

    const-string v10, "WrapMediaEncoder"

    const-string v12, "OutputBuffer BUFFER_FLAG_END_OF_STREAM"

    invoke-static {v10, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v10, v0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->a:Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/d;

    invoke-interface {v10, v11}, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/d;->a(I)Z

    :cond_3
    aget-object v10, v4, v2

    if-nez v10, :cond_4

    const-string v1, "WrapMediaEncoder"

    const-string v2, "Output buffer is null!"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_3

    :cond_4
    iget v12, v1, Landroid/media/MediaCodec$BufferInfo;->size:I

    if-gtz v12, :cond_5

    const-string v1, "WrapMediaEncoder"

    const-string v2, "Output was not available!"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_3

    :cond_5
    const-string v12, "WrapMediaEncoder"

    const-string v13, "Output was available Falg:%d Size:%d"

    new-array v14, v8, [Ljava/lang/Object;

    iget v15, v1, Landroid/media/MediaCodec$BufferInfo;->flags:I

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v14, v3

    iget v15, v1, Landroid/media/MediaCodec$BufferInfo;->size:I

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v14, v9

    invoke-static {v13, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v12, v1, Landroid/media/MediaCodec$BufferInfo;->offset:I

    invoke-virtual {v10, v12}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    iget v12, v1, Landroid/media/MediaCodec$BufferInfo;->offset:I

    iget v13, v1, Landroid/media/MediaCodec$BufferInfo;->size:I

    add-int/2addr v12, v13

    invoke-virtual {v10, v12}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    iget v12, v1, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/2addr v12, v8

    if-eqz v12, :cond_9

    const-string v12, "WrapMediaEncoder"

    const-string v13, "OutputBuffer BUFFER_FLAG_CODEC_CONFIG"

    invoke-static {v12, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v12, v1, Landroid/media/MediaCodec$BufferInfo;->size:I

    new-array v12, v12, [B

    invoke-virtual {v10, v12}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    invoke-static {v12}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v10

    if-ne v10, v9, :cond_6

    sget-object v10, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v14, "parsing sps/pps"

    invoke-virtual {v10, v14}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_2

    :cond_6
    sget-object v10, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v14, "something is amiss?"

    invoke-virtual {v10, v14}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    :cond_7
    :goto_2
    invoke-virtual {v13}, Ljava/nio/ByteBuffer;->get()B

    move-result v10

    if-nez v10, :cond_7

    invoke-virtual {v13}, Ljava/nio/ByteBuffer;->get()B

    move-result v10

    if-nez v10, :cond_7

    invoke-virtual {v13}, Ljava/nio/ByteBuffer;->get()B

    move-result v10

    if-nez v10, :cond_7

    invoke-virtual {v13}, Ljava/nio/ByteBuffer;->get()B

    move-result v10

    if-eq v10, v9, :cond_8

    goto :goto_2

    :cond_8
    invoke-virtual {v13}, Ljava/nio/ByteBuffer;->position()I

    move-result v10

    add-int/lit8 v13, v10, -0x8

    add-int/2addr v13, v11

    new-array v13, v13, [B

    iput-object v13, v0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->c:[B

    iget-object v13, v0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->c:[B

    aput-byte v3, v13, v3

    iget-object v13, v0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->c:[B

    aput-byte v3, v13, v9

    iget-object v13, v0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->c:[B

    aput-byte v3, v13, v8

    iget-object v13, v0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->c:[B

    aput-byte v9, v13, v7

    iget-object v13, v0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->c:[B

    iget-object v14, v0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->c:[B

    array-length v14, v14

    sub-int/2addr v14, v11

    invoke-static {v12, v11, v13, v11, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v13, v12

    sub-int/2addr v13, v10

    add-int/2addr v13, v11

    new-array v13, v13, [B

    iput-object v13, v0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->d:[B

    iget-object v13, v0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->d:[B

    aput-byte v3, v13, v3

    iget-object v13, v0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->d:[B

    aput-byte v3, v13, v9

    iget-object v13, v0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->d:[B

    aput-byte v3, v13, v8

    iget-object v13, v0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->d:[B

    aput-byte v9, v13, v7

    iget-object v13, v0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->d:[B

    iget-object v14, v0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->d:[B

    array-length v14, v14

    sub-int/2addr v14, v11

    invoke-static {v12, v10, v13, v11, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget-object v10, v0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->a:Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/d;

    iget-object v11, v0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->c:[B

    iget-object v12, v0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->d:[B

    invoke-interface {v10, v11, v12}, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/d;->a([B[B)Z

    iget-object v10, v0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->b:Landroid/media/MediaCodec;

    invoke-virtual {v10, v2, v3}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    iget-object v2, v0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->b:Landroid/media/MediaCodec;

    invoke-virtual {v2, v1, v5, v6}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    move-result v2

    goto/16 :goto_1

    :cond_9
    iget v11, v1, Landroid/media/MediaCodec$BufferInfo;->size:I

    new-array v13, v11, [B

    invoke-virtual {v10, v13}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    iget-object v12, v0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->a:Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/d;

    const/4 v14, 0x0

    array-length v15, v13

    iget-wide v10, v1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    move-wide/from16 v16, v10

    invoke-interface/range {v12 .. v17}, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/d;->a([BIIJ)Z

    iget-object v10, v0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->b:Landroid/media/MediaCodec;

    invoke-virtual {v10, v2, v3}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    iget-object v2, v0, Lcom/nexstreaming/kminternal/kinemaster/codeccolorformat/c;->b:Landroid/media/MediaCodec;

    invoke-virtual {v2, v1, v5, v6}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    move-result v2

    goto/16 :goto_1

    :cond_a
    :goto_3
    return v9

    :cond_b
    :goto_4
    const-string v1, "WrapMediaEncoder"

    const-string v2, "Media codec did not initailize"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v3

    nop

    :pswitch_data_0
    .packed-switch -0x3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
