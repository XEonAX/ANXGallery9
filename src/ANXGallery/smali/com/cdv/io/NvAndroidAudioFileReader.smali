.class public Lcom/cdv/io/NvAndroidAudioFileReader;
.super Ljava/lang/Object;
.source "NvAndroidAudioFileReader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cdv/io/NvAndroidAudioFileReader$AudioFrame;
    }
.end annotation


# static fields
.field private static final ERROR_EOF:I = 0x1

.field private static final ERROR_FAIL:I = 0x2

.field private static final ERROR_OK:I = 0x0

.field private static final TAG:Ljava/lang/String; = "NvAndroidAudioFileReader"

.field private static final m_verbose:Z = false


# instance fields
.field private m_audioTrackIndex:I

.field private m_bufferInfo:Landroid/media/MediaCodec$BufferInfo;

.field private m_channelCount:I

.field private m_decoder:Landroid/media/MediaCodec;

.field m_decoderInputBuffers:[Ljava/nio/ByteBuffer;

.field m_decoderOutputBuffers:[Ljava/nio/ByteBuffer;

.field private m_decoderSetupFailed:Z

.field private m_decoderStarted:Z

.field private m_duration:J

.field private m_extractor:Landroid/media/MediaExtractor;

.field private m_format:Landroid/media/MediaFormat;

.field private m_inputBufferQueued:Z

.field private m_pendingInputFrameCount:I

.field private m_sampleRate:I

.field private m_sawInputEOS:Z

.field private m_sawOutputEOS:Z


# direct methods
.method constructor <init>()V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_extractor:Landroid/media/MediaExtractor;

    const/4 v1, -0x1

    iput v1, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_audioTrackIndex:I

    iput-object v0, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_format:Landroid/media/MediaFormat;

    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_duration:J

    const/4 v1, 0x1

    iput v1, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_channelCount:I

    const v1, 0xac44

    iput v1, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_sampleRate:I

    iput-object v0, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iput-object v0, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_decoder:Landroid/media/MediaCodec;

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_decoderSetupFailed:Z

    iput-boolean v1, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_decoderStarted:Z

    iput-object v0, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_decoderInputBuffers:[Ljava/nio/ByteBuffer;

    iput-object v0, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_decoderOutputBuffers:[Ljava/nio/ByteBuffer;

    iput-boolean v1, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_inputBufferQueued:Z

    iput v1, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_pendingInputFrameCount:I

    iput-boolean v1, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_sawInputEOS:Z

    iput-boolean v1, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_sawOutputEOS:Z

    new-instance v0, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v0}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    iput-object v0, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    return-void
.end method

.method private cleanupDecoder()V
    .locals 6

    iget-object v0, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_decoder:Landroid/media/MediaCodec;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_decoderStarted:Z

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    :try_start_0
    iget-boolean v0, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_inputBufferQueued:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    if-eqz v0, :cond_0

    :try_start_1
    iget-object v0, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_decoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->flush()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    :try_start_2
    iput-boolean v1, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_inputBufferQueued:Z

    :cond_0
    iget-object v0, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_decoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    :catch_1
    move-exception v0

    const-string v3, "NvAndroidAudioFileReader"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    iput-boolean v1, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_decoderStarted:Z

    iput-object v2, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_decoderInputBuffers:[Ljava/nio/ByteBuffer;

    :cond_1
    iget-object v0, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_decoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V

    iput-object v2, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_decoder:Landroid/media/MediaCodec;

    :cond_2
    iput v1, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_pendingInputFrameCount:I

    iput-boolean v1, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_sawInputEOS:Z

    iput-boolean v1, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_sawOutputEOS:Z

    return-void
.end method

.method private decodeNextFrame()Lcom/cdv/io/NvAndroidAudioFileReader$AudioFrame;
    .locals 17

    move-object/from16 v1, p0

    iget-object v0, v1, Lcom/cdv/io/NvAndroidAudioFileReader;->m_decoderInputBuffers:[Ljava/nio/ByteBuffer;

    array-length v0, v0

    div-int/lit8 v0, v0, 0x3

    const/4 v2, 0x2

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v3

    new-instance v4, Lcom/cdv/io/NvAndroidAudioFileReader$AudioFrame;

    invoke-direct {v4}, Lcom/cdv/io/NvAndroidAudioFileReader$AudioFrame;-><init>()V

    const/4 v5, 0x0

    const/4 v0, 0x0

    :goto_0
    iget-boolean v6, v1, Lcom/cdv/io/NvAndroidAudioFileReader;->m_sawOutputEOS:Z

    const/4 v7, 0x1

    if-nez v6, :cond_e

    iget-boolean v6, v1, Lcom/cdv/io/NvAndroidAudioFileReader;->m_sawInputEOS:Z

    if-nez v6, :cond_2

    iget-object v6, v1, Lcom/cdv/io/NvAndroidAudioFileReader;->m_decoder:Landroid/media/MediaCodec;

    const-wide/16 v8, 0x1f4

    invoke-virtual {v6, v8, v9}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    move-result v11

    if-ltz v11, :cond_2

    iget-object v6, v1, Lcom/cdv/io/NvAndroidAudioFileReader;->m_decoderInputBuffers:[Ljava/nio/ByteBuffer;

    aget-object v6, v6, v11

    iget-object v8, v1, Lcom/cdv/io/NvAndroidAudioFileReader;->m_extractor:Landroid/media/MediaExtractor;

    invoke-virtual {v8, v6, v5}, Landroid/media/MediaExtractor;->readSampleData(Ljava/nio/ByteBuffer;I)I

    move-result v13

    if-gez v13, :cond_0

    iget-object v10, v1, Lcom/cdv/io/NvAndroidAudioFileReader;->m_decoder:Landroid/media/MediaCodec;

    const/4 v12, 0x0

    const/4 v13, 0x0

    const-wide/16 v14, 0x0

    const/16 v16, 0x4

    invoke-virtual/range {v10 .. v16}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    iput-boolean v7, v1, Lcom/cdv/io/NvAndroidAudioFileReader;->m_sawInputEOS:Z

    goto :goto_1

    :cond_0
    iget-object v6, v1, Lcom/cdv/io/NvAndroidAudioFileReader;->m_extractor:Landroid/media/MediaExtractor;

    invoke-virtual {v6}, Landroid/media/MediaExtractor;->getSampleTrackIndex()I

    move-result v6

    iget v8, v1, Lcom/cdv/io/NvAndroidAudioFileReader;->m_audioTrackIndex:I

    if-eq v6, v8, :cond_1

    const-string v6, "NvAndroidAudioFileReader"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "WEIRD: got sample from track "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v9, v1, Lcom/cdv/io/NvAndroidAudioFileReader;->m_extractor:Landroid/media/MediaExtractor;

    invoke-virtual {v9}, Landroid/media/MediaExtractor;->getSampleTrackIndex()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v9, ", expected "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v9, v1, Lcom/cdv/io/NvAndroidAudioFileReader;->m_audioTrackIndex:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    iget-object v6, v1, Lcom/cdv/io/NvAndroidAudioFileReader;->m_extractor:Landroid/media/MediaExtractor;

    invoke-virtual {v6}, Landroid/media/MediaExtractor;->getSampleTime()J

    move-result-wide v14

    iget-object v10, v1, Lcom/cdv/io/NvAndroidAudioFileReader;->m_decoder:Landroid/media/MediaCodec;

    const/4 v12, 0x0

    const/16 v16, 0x0

    invoke-virtual/range {v10 .. v16}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    iput-boolean v7, v1, Lcom/cdv/io/NvAndroidAudioFileReader;->m_inputBufferQueued:Z

    iget v6, v1, Lcom/cdv/io/NvAndroidAudioFileReader;->m_pendingInputFrameCount:I

    add-int/2addr v6, v7

    iput v6, v1, Lcom/cdv/io/NvAndroidAudioFileReader;->m_pendingInputFrameCount:I

    iget-object v6, v1, Lcom/cdv/io/NvAndroidAudioFileReader;->m_extractor:Landroid/media/MediaExtractor;

    invoke-virtual {v6}, Landroid/media/MediaExtractor;->advance()Z

    :cond_2
    :goto_1
    iget v6, v1, Lcom/cdv/io/NvAndroidAudioFileReader;->m_pendingInputFrameCount:I

    if-gt v6, v3, :cond_4

    iget-boolean v6, v1, Lcom/cdv/io/NvAndroidAudioFileReader;->m_sawInputEOS:Z

    if-eqz v6, :cond_3

    goto :goto_2

    :cond_3
    const/4 v6, 0x0

    goto :goto_3

    :cond_4
    :goto_2
    const/16 v6, 0x1f4

    :goto_3
    iget-object v8, v1, Lcom/cdv/io/NvAndroidAudioFileReader;->m_decoder:Landroid/media/MediaCodec;

    iget-object v9, v1, Lcom/cdv/io/NvAndroidAudioFileReader;->m_bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    int-to-long v10, v6

    invoke-virtual {v8, v9, v10, v11}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    move-result v6

    add-int/lit8 v8, v0, 0x1

    const/4 v0, -0x1

    const/4 v9, 0x0

    if-ne v6, v0, :cond_5

    goto/16 :goto_7

    :cond_5
    const/4 v0, -0x3

    if-ne v6, v0, :cond_6

    iget-object v0, v1, Lcom/cdv/io/NvAndroidAudioFileReader;->m_decoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, v1, Lcom/cdv/io/NvAndroidAudioFileReader;->m_decoderOutputBuffers:[Ljava/nio/ByteBuffer;

    goto/16 :goto_7

    :cond_6
    const/4 v0, -0x2

    if-ne v6, v0, :cond_7

    iget-object v0, v1, Lcom/cdv/io/NvAndroidAudioFileReader;->m_decoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/cdv/io/NvAndroidAudioFileReader;->parseMediaFormat(Landroid/media/MediaFormat;)V

    goto/16 :goto_7

    :cond_7
    if-gez v6, :cond_8

    const-string v0, "NvAndroidAudioFileReader"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unexpected result from decoder.dequeueOutputBuffer: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v9

    :cond_8
    iget-object v0, v1, Lcom/cdv/io/NvAndroidAudioFileReader;->m_bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v0, v0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_9

    iput-boolean v7, v1, Lcom/cdv/io/NvAndroidAudioFileReader;->m_sawOutputEOS:Z

    goto :goto_4

    :cond_9
    iget v0, v1, Lcom/cdv/io/NvAndroidAudioFileReader;->m_pendingInputFrameCount:I

    sub-int/2addr v0, v7

    iput v0, v1, Lcom/cdv/io/NvAndroidAudioFileReader;->m_pendingInputFrameCount:I

    :goto_4
    iget-object v0, v1, Lcom/cdv/io/NvAndroidAudioFileReader;->m_bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v0, v0, Landroid/media/MediaCodec$BufferInfo;->size:I

    if-eqz v0, :cond_a

    goto :goto_5

    :cond_a
    const/4 v7, 0x0

    :goto_5
    if-eqz v7, :cond_b

    iget v0, v1, Lcom/cdv/io/NvAndroidAudioFileReader;->m_channelCount:I

    iput v0, v4, Lcom/cdv/io/NvAndroidAudioFileReader$AudioFrame;->channelCount:I

    iget v0, v1, Lcom/cdv/io/NvAndroidAudioFileReader;->m_sampleRate:I

    iput v0, v4, Lcom/cdv/io/NvAndroidAudioFileReader$AudioFrame;->sampleRate:I

    const/16 v0, 0x10

    iput v0, v4, Lcom/cdv/io/NvAndroidAudioFileReader$AudioFrame;->sampleSize:I

    iget v0, v4, Lcom/cdv/io/NvAndroidAudioFileReader$AudioFrame;->sampleSize:I

    div-int/lit8 v0, v0, 0x8

    iget v10, v4, Lcom/cdv/io/NvAndroidAudioFileReader$AudioFrame;->channelCount:I

    mul-int v0, v0, v10

    iget-object v10, v1, Lcom/cdv/io/NvAndroidAudioFileReader;->m_bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v10, v10, Landroid/media/MediaCodec$BufferInfo;->size:I

    div-int/2addr v10, v0

    iput v10, v4, Lcom/cdv/io/NvAndroidAudioFileReader$AudioFrame;->sampleCount:I

    :try_start_0
    iget-object v0, v1, Lcom/cdv/io/NvAndroidAudioFileReader;->m_decoderOutputBuffers:[Ljava/nio/ByteBuffer;

    aget-object v0, v0, v6

    invoke-virtual {v0, v5}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    iget-object v10, v1, Lcom/cdv/io/NvAndroidAudioFileReader;->m_bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v10, v10, Landroid/media/MediaCodec$BufferInfo;->size:I

    invoke-virtual {v0, v10}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    iget-object v10, v1, Lcom/cdv/io/NvAndroidAudioFileReader;->m_bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v10, v10, Landroid/media/MediaCodec$BufferInfo;->size:I

    invoke-static {v10}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v10

    invoke-virtual {v10, v0}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    iput-object v10, v4, Lcom/cdv/io/NvAndroidAudioFileReader$AudioFrame;->audioFrame:Ljava/nio/ByteBuffer;

    iget-object v0, v1, Lcom/cdv/io/NvAndroidAudioFileReader;->m_bufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget-wide v10, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    iput-wide v10, v4, Lcom/cdv/io/NvAndroidAudioFileReader$AudioFrame;->pts:J

    iput v5, v4, Lcom/cdv/io/NvAndroidAudioFileReader$AudioFrame;->retCode:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_6

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    iput v2, v4, Lcom/cdv/io/NvAndroidAudioFileReader$AudioFrame;->retCode:I

    const/4 v7, 0x0

    :cond_b
    :goto_6
    iget-object v0, v1, Lcom/cdv/io/NvAndroidAudioFileReader;->m_decoder:Landroid/media/MediaCodec;

    invoke-virtual {v0, v6, v5}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    if-eqz v7, :cond_c

    return-object v4

    :cond_c
    :goto_7
    const/16 v0, 0x64

    if-le v8, v0, :cond_d

    const-string v0, "NvAndroidAudioFileReader"

    const-string v2, "We have tried too many times and can\'t decode a frame!"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v9

    :cond_d
    move v0, v8

    goto/16 :goto_0

    :cond_e
    iput v7, v4, Lcom/cdv/io/NvAndroidAudioFileReader$AudioFrame;->retCode:I

    return-object v4
.end method

.method private isValid()Z
    .locals 1

    iget-object v0, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_decoder:Landroid/media/MediaCodec;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private parseMediaFormat(Landroid/media/MediaFormat;)V
    .locals 1

    const-string v0, "channel-count"

    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "channel-count"

    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_channelCount:I

    :cond_0
    const-string v0, "sample-rate"

    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "sample-rate"

    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_sampleRate:I

    :cond_1
    return-void
.end method

.method private setupDecoder(Ljava/lang/String;)Z
    .locals 4

    const/4 v0, 0x0

    :try_start_0
    invoke-static {p1}, Landroid/media/MediaCodec;->createDecoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object p1

    iput-object p1, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_decoder:Landroid/media/MediaCodec;

    iget-object p1, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_decoder:Landroid/media/MediaCodec;

    iget-object v1, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_format:Landroid/media/MediaFormat;

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2, v2, v0}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    iget-object p1, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_decoder:Landroid/media/MediaCodec;

    invoke-virtual {p1}, Landroid/media/MediaCodec;->start()V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_decoderStarted:Z

    iget-object v1, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_decoder:Landroid/media/MediaCodec;

    invoke-virtual {v1}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v1

    iput-object v1, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_decoderInputBuffers:[Ljava/nio/ByteBuffer;

    iget-object v1, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_decoder:Landroid/media/MediaCodec;

    invoke-virtual {v1}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v1

    iput-object v1, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_decoderOutputBuffers:[Ljava/nio/ByteBuffer;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception p1

    const-string v1, "NvAndroidAudioFileReader"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    invoke-direct {p0}, Lcom/cdv/io/NvAndroidAudioFileReader;->cleanupDecoder()V

    return v0
.end method


# virtual methods
.method public closeFile()V
    .locals 2

    invoke-direct {p0}, Lcom/cdv/io/NvAndroidAudioFileReader;->cleanupDecoder()V

    iget-object v0, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_extractor:Landroid/media/MediaExtractor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_extractor:Landroid/media/MediaExtractor;

    invoke-virtual {v0}, Landroid/media/MediaExtractor;->release()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_extractor:Landroid/media/MediaExtractor;

    const/4 v1, -0x1

    iput v1, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_audioTrackIndex:I

    iput-object v0, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_format:Landroid/media/MediaFormat;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_duration:J

    :cond_0
    return-void
.end method

.method public getNextAudioFrameForPlayback()Lcom/cdv/io/NvAndroidAudioFileReader$AudioFrame;
    .locals 4

    invoke-direct {p0}, Lcom/cdv/io/NvAndroidAudioFileReader;->isValid()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Lcom/cdv/io/NvAndroidAudioFileReader$AudioFrame;

    invoke-direct {v0}, Lcom/cdv/io/NvAndroidAudioFileReader$AudioFrame;-><init>()V

    const/4 v1, 0x1

    iput v1, v0, Lcom/cdv/io/NvAndroidAudioFileReader$AudioFrame;->retCode:I

    return-object v0

    :cond_0
    :try_start_0
    invoke-direct {p0}, Lcom/cdv/io/NvAndroidAudioFileReader;->decodeNextFrame()Lcom/cdv/io/NvAndroidAudioFileReader$AudioFrame;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    const-string v1, "NvAndroidAudioFileReader"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    invoke-direct {p0}, Lcom/cdv/io/NvAndroidAudioFileReader;->cleanupDecoder()V

    const/4 v0, 0x0

    return-object v0
.end method

.method public hasDecoderSetupFailed()Z
    .locals 1

    iget-boolean v0, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_decoderSetupFailed:Z

    return v0
.end method

.method public openFile(Ljava/lang/String;Landroid/content/res/AssetManager;)Z
    .locals 8

    invoke-direct {p0}, Lcom/cdv/io/NvAndroidAudioFileReader;->isValid()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const-string p1, "NvAndroidAudioFileReader"

    const-string p2, "You can\'t call OpenFile() twice!"

    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_0
    :try_start_0
    new-instance v0, Landroid/media/MediaExtractor;

    invoke-direct {v0}, Landroid/media/MediaExtractor;-><init>()V

    iput-object v0, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_extractor:Landroid/media/MediaExtractor;

    if-nez p2, :cond_1

    iget-object p2, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_extractor:Landroid/media/MediaExtractor;

    invoke-virtual {p2, p1}, Landroid/media/MediaExtractor;->setDataSource(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    invoke-virtual {p2, p1}, Landroid/content/res/AssetManager;->openFd(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object p2

    iget-object v2, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_extractor:Landroid/media/MediaExtractor;

    invoke-virtual {p2}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v3

    invoke-virtual {p2}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v4

    invoke-virtual {p2}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v6

    invoke-virtual/range {v2 .. v7}, Landroid/media/MediaExtractor;->setDataSource(Ljava/io/FileDescriptor;JJ)V

    invoke-virtual {p2}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    iget-object p2, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_extractor:Landroid/media/MediaExtractor;

    invoke-virtual {p2}, Landroid/media/MediaExtractor;->getTrackCount()I

    move-result p2

    const/4 v0, 0x0

    :goto_1
    if-ge v0, p2, :cond_3

    iget-object v2, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_extractor:Landroid/media/MediaExtractor;

    invoke-virtual {v2, v0}, Landroid/media/MediaExtractor;->getTrackFormat(I)Landroid/media/MediaFormat;

    move-result-object v2

    const-string v3, "mime"

    invoke-virtual {v2, v3}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "audio/"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    iput v0, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_audioTrackIndex:I

    goto :goto_2

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3
    :goto_2
    iget p2, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_audioTrackIndex:I

    if-gez p2, :cond_4

    const-string p2, "NvAndroidAudioFileReader"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to find a audio track from "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/cdv/io/NvAndroidAudioFileReader;->closeFile()V

    return v1

    :cond_4
    iget-object p1, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_extractor:Landroid/media/MediaExtractor;

    iget p2, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_audioTrackIndex:I

    invoke-virtual {p1, p2}, Landroid/media/MediaExtractor;->selectTrack(I)V

    iget-object p1, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_extractor:Landroid/media/MediaExtractor;

    iget p2, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_audioTrackIndex:I

    invoke-virtual {p1, p2}, Landroid/media/MediaExtractor;->getTrackFormat(I)Landroid/media/MediaFormat;

    move-result-object p1

    iput-object p1, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_format:Landroid/media/MediaFormat;

    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    iget-object p1, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_format:Landroid/media/MediaFormat;

    const-string p2, "durationUs"

    invoke-virtual {p1, p2}, Landroid/media/MediaFormat;->getLong(Ljava/lang/String;)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_duration:J

    iget-object p1, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_format:Landroid/media/MediaFormat;

    const-string p2, "mime"

    invoke-virtual {p1, p2}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-boolean v1, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_decoderSetupFailed:Z

    invoke-direct {p0, p1}, Lcom/cdv/io/NvAndroidAudioFileReader;->setupDecoder(Ljava/lang/String;)Z

    move-result p1

    const/4 p2, 0x1

    if-nez p1, :cond_5

    iput-boolean p2, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_decoderSetupFailed:Z

    invoke-virtual {p0}, Lcom/cdv/io/NvAndroidAudioFileReader;->closeFile()V

    return v1

    :cond_5
    return p2

    :catch_0
    move-exception p1

    const-string p2, "NvAndroidAudioFileReader"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    invoke-virtual {p0}, Lcom/cdv/io/NvAndroidAudioFileReader;->closeFile()V

    return v1
.end method

.method public startPlayback(J)I
    .locals 4

    invoke-direct {p0}, Lcom/cdv/io/NvAndroidAudioFileReader;->isValid()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    return v1

    :cond_0
    const-wide/16 v2, 0x0

    invoke-static {p1, p2, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p1

    iget-wide v2, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_duration:J

    cmp-long v0, p1, v2

    if-ltz v0, :cond_1

    return v1

    :cond_1
    const/4 v0, 0x2

    :try_start_0
    iget-object v1, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_extractor:Landroid/media/MediaExtractor;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, p2, v2}, Landroid/media/MediaExtractor;->seekTo(JI)V

    iget-boolean p1, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_sawInputEOS:Z

    if-nez p1, :cond_3

    iget-boolean p1, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_sawOutputEOS:Z

    if-eqz p1, :cond_2

    goto :goto_0

    :cond_2
    iget-boolean p1, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_inputBufferQueued:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    if-eqz p1, :cond_4

    :try_start_1
    iget-object p1, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_decoder:Landroid/media/MediaCodec;

    invoke-virtual {p1}, Landroid/media/MediaCodec;->flush()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    :try_start_2
    iput-boolean v2, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_inputBufferQueued:Z

    iput v2, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_pendingInputFrameCount:I

    goto :goto_1

    :cond_3
    :goto_0
    invoke-direct {p0}, Lcom/cdv/io/NvAndroidAudioFileReader;->cleanupDecoder()V

    iget-object p1, p0, Lcom/cdv/io/NvAndroidAudioFileReader;->m_format:Landroid/media/MediaFormat;

    const-string p2, "mime"

    invoke-virtual {p1, p2}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/cdv/io/NvAndroidAudioFileReader;->setupDecoder(Ljava/lang/String;)Z

    move-result p1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    if-nez p1, :cond_4

    return v0

    :cond_4
    :goto_1
    return v2

    :catch_1
    move-exception p1

    const-string p2, "NvAndroidAudioFileReader"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p2, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    return v0
.end method
