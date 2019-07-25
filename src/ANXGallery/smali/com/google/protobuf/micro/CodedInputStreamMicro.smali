.class public final Lcom/google/protobuf/micro/CodedInputStreamMicro;
.super Ljava/lang/Object;
.source "CodedInputStreamMicro.java"


# static fields
.field private static final BUFFER_SIZE:I = 0x1000

.field private static final DEFAULT_RECURSION_LIMIT:I = 0x40

.field private static final DEFAULT_SIZE_LIMIT:I = 0x4000000


# instance fields
.field private final buffer:[B

.field private bufferPos:I

.field private bufferSize:I

.field private bufferSizeAfterLimit:I

.field private currentLimit:I

.field private final input:Ljava/io/InputStream;

.field private lastTag:I

.field private recursionDepth:I

.field private recursionLimit:I

.field private sizeLimit:I

.field private totalBytesRetired:I


# direct methods
.method private constructor <init>(Ljava/io/InputStream;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const v0, 0x7fffffff

    iput v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->currentLimit:I

    const/16 v0, 0x40

    iput v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->recursionLimit:I

    const/high16 v0, 0x4000000

    iput v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->sizeLimit:I

    const/16 v0, 0x1000

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->buffer:[B

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferSize:I

    iput v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferPos:I

    iput-object p1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->input:Ljava/io/InputStream;

    return-void
.end method

.method private constructor <init>([BII)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const v0, 0x7fffffff

    iput v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->currentLimit:I

    const/16 v0, 0x40

    iput v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->recursionLimit:I

    const/high16 v0, 0x4000000

    iput v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->sizeLimit:I

    iput-object p1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->buffer:[B

    add-int/2addr p3, p2

    iput p3, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferSize:I

    iput p2, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferPos:I

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->input:Ljava/io/InputStream;

    return-void
.end method

.method public static decodeZigZag32(I)I
    .locals 1

    ushr-int/lit8 v0, p0, 0x1

    and-int/lit8 p0, p0, 0x1

    neg-int p0, p0

    xor-int/2addr p0, v0

    return p0
.end method

.method public static decodeZigZag64(J)J
    .locals 4

    const/4 v0, 0x1

    ushr-long v0, p0, v0

    const-wide/16 v2, 0x1

    and-long/2addr p0, v2

    neg-long p0, p0

    xor-long/2addr p0, v0

    return-wide p0
.end method

.method public static newInstance(Ljava/io/InputStream;)Lcom/google/protobuf/micro/CodedInputStreamMicro;
    .locals 1

    new-instance v0, Lcom/google/protobuf/micro/CodedInputStreamMicro;

    invoke-direct {v0, p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;-><init>(Ljava/io/InputStream;)V

    return-object v0
.end method

.method public static newInstance([B)Lcom/google/protobuf/micro/CodedInputStreamMicro;
    .locals 2

    array-length v0, p0

    const/4 v1, 0x0

    invoke-static {p0, v1, v0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->newInstance([BII)Lcom/google/protobuf/micro/CodedInputStreamMicro;

    move-result-object p0

    return-object p0
.end method

.method public static newInstance([BII)Lcom/google/protobuf/micro/CodedInputStreamMicro;
    .locals 1

    new-instance v0, Lcom/google/protobuf/micro/CodedInputStreamMicro;

    invoke-direct {v0, p0, p1, p2}, Lcom/google/protobuf/micro/CodedInputStreamMicro;-><init>([BII)V

    return-object v0
.end method

.method static readRawVarint32(Ljava/io/InputStream;)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    const/16 v2, 0x20

    const/4 v3, -0x1

    if-ge v0, v2, :cond_2

    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v2

    if-eq v2, v3, :cond_1

    and-int/lit8 v3, v2, 0x7f

    shl-int/2addr v3, v0

    or-int/2addr v1, v3

    and-int/lit16 v2, v2, 0x80

    if-nez v2, :cond_0

    return v1

    :cond_0
    add-int/lit8 v0, v0, 0x7

    goto :goto_0

    :cond_1
    invoke-static {}, Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;->truncatedMessage()Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;

    move-result-object p0

    throw p0

    :cond_2
    :goto_1
    const/16 v2, 0x40

    if-ge v0, v2, :cond_5

    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result v2

    if-eq v2, v3, :cond_4

    and-int/lit16 v2, v2, 0x80

    if-nez v2, :cond_3

    return v1

    :cond_3
    add-int/lit8 v0, v0, 0x7

    goto :goto_1

    :cond_4
    invoke-static {}, Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;->truncatedMessage()Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;

    move-result-object p0

    throw p0

    :cond_5
    invoke-static {}, Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;->malformedVarint()Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;

    move-result-object p0

    throw p0
.end method

.method private recomputeBufferSizeAfterLimit()V
    .locals 2

    iget v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferSize:I

    iget v1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferSizeAfterLimit:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferSize:I

    iget v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->totalBytesRetired:I

    iget v1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferSize:I

    add-int/2addr v0, v1

    iget v1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->currentLimit:I

    if-le v0, v1, :cond_0

    iget v1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->currentLimit:I

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferSizeAfterLimit:I

    iget v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferSize:I

    iget v1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferSizeAfterLimit:I

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferSize:I

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    iput v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferSizeAfterLimit:I

    :goto_0
    return-void
.end method

.method private refillBuffer(Z)Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferPos:I

    iget v1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferSize:I

    if-lt v0, v1, :cond_7

    iget v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->totalBytesRetired:I

    iget v1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferSize:I

    add-int/2addr v0, v1

    iget v1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->currentLimit:I

    const/4 v2, 0x0

    if-ne v0, v1, :cond_1

    if-nez p1, :cond_0

    return v2

    :cond_0
    invoke-static {}, Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;->truncatedMessage()Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;

    move-result-object p1

    throw p1

    :cond_1
    iget v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->totalBytesRetired:I

    iget v1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferSize:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->totalBytesRetired:I

    iput v2, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferPos:I

    iget-object v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->input:Ljava/io/InputStream;

    const/4 v1, -0x1

    if-nez v0, :cond_2

    const/4 v0, -0x1

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->input:Ljava/io/InputStream;

    iget-object v3, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->buffer:[B

    invoke-virtual {v0, v3}, Ljava/io/InputStream;->read([B)I

    move-result v0

    :goto_0
    iput v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferSize:I

    iget v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferSize:I

    if-eqz v0, :cond_6

    iget v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferSize:I

    if-lt v0, v1, :cond_6

    iget v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferSize:I

    if-ne v0, v1, :cond_4

    iput v2, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferSize:I

    if-nez p1, :cond_3

    return v2

    :cond_3
    invoke-static {}, Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;->truncatedMessage()Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;

    move-result-object p1

    throw p1

    :cond_4
    invoke-direct {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->recomputeBufferSizeAfterLimit()V

    iget p1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->totalBytesRetired:I

    iget v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferSize:I

    add-int/2addr p1, v0

    iget v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferSizeAfterLimit:I

    add-int/2addr p1, v0

    iget v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->sizeLimit:I

    if-gt p1, v0, :cond_5

    if-ltz p1, :cond_5

    const/4 p1, 0x1

    return p1

    :cond_5
    invoke-static {}, Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;->sizeLimitExceeded()Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;

    move-result-object p1

    throw p1

    :cond_6
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "InputStream#read(byte[]) returned invalid result: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferSize:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "\nThe InputStream implementation is buggy."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_7
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "refillBuffer() called when buffer wasn\'t empty."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public checkLastTagWas(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;
        }
    .end annotation

    iget v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->lastTag:I

    if-ne v0, p1, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;->invalidEndTag()Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;

    move-result-object p1

    throw p1
.end method

.method public getBytesUntilLimit()I
    .locals 2

    iget v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->currentLimit:I

    const v1, 0x7fffffff

    if-ne v0, v1, :cond_0

    const/4 v0, -0x1

    return v0

    :cond_0
    iget v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->totalBytesRetired:I

    iget v1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferPos:I

    add-int/2addr v0, v1

    iget v1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->currentLimit:I

    sub-int/2addr v1, v0

    return v1
.end method

.method public isAtEnd()Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferPos:I

    iget v1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferSize:I

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    invoke-direct {p0, v2}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->refillBuffer(Z)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v2, 0x1

    :cond_0
    return v2
.end method

.method public popLimit(I)V
    .locals 0

    iput p1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->currentLimit:I

    invoke-direct {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->recomputeBufferSizeAfterLimit()V

    return-void
.end method

.method public pushLimit(I)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;
        }
    .end annotation

    if-ltz p1, :cond_1

    iget v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->totalBytesRetired:I

    iget v1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferPos:I

    add-int/2addr v0, v1

    add-int/2addr p1, v0

    iget v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->currentLimit:I

    if-gt p1, v0, :cond_0

    iput p1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->currentLimit:I

    invoke-direct {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->recomputeBufferSizeAfterLimit()V

    return v0

    :cond_0
    invoke-static {}, Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;->truncatedMessage()Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;

    move-result-object p1

    throw p1

    :cond_1
    invoke-static {}, Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;->negativeSize()Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;

    move-result-object p1

    throw p1
.end method

.method public readBool()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawVarint32()I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public readBytes()Lcom/google/protobuf/micro/ByteStringMicro;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawVarint32()I

    move-result v0

    iget v1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferSize:I

    iget v2, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferPos:I

    sub-int/2addr v1, v2

    if-gt v0, v1, :cond_0

    if-lez v0, :cond_0

    iget-object v1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->buffer:[B

    iget v2, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferPos:I

    invoke-static {v1, v2, v0}, Lcom/google/protobuf/micro/ByteStringMicro;->copyFrom([BII)Lcom/google/protobuf/micro/ByteStringMicro;

    move-result-object v1

    iget v2, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferPos:I

    add-int/2addr v2, v0

    iput v2, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferPos:I

    return-object v1

    :cond_0
    invoke-virtual {p0, v0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawBytes(I)[B

    move-result-object v0

    invoke-static {v0}, Lcom/google/protobuf/micro/ByteStringMicro;->copyFrom([B)Lcom/google/protobuf/micro/ByteStringMicro;

    move-result-object v0

    return-object v0
.end method

.method public readDouble()D
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawLittleEndian64()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->longBitsToDouble(J)D

    move-result-wide v0

    return-wide v0
.end method

.method public readEnum()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawVarint32()I

    move-result v0

    return v0
.end method

.method public readFixed32()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawLittleEndian32()I

    move-result v0

    return v0
.end method

.method public readFixed64()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawLittleEndian64()J

    move-result-wide v0

    return-wide v0
.end method

.method public readFloat()F
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawLittleEndian32()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v0

    return v0
.end method

.method public readGroup(Lcom/google/protobuf/micro/MessageMicro;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->recursionDepth:I

    iget v1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->recursionLimit:I

    if-ge v0, v1, :cond_0

    iget v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->recursionDepth:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->recursionDepth:I

    invoke-virtual {p1, p0}, Lcom/google/protobuf/micro/MessageMicro;->mergeFrom(Lcom/google/protobuf/micro/CodedInputStreamMicro;)Lcom/google/protobuf/micro/MessageMicro;

    const/4 p1, 0x4

    invoke-static {p2, p1}, Lcom/google/protobuf/micro/WireFormatMicro;->makeTag(II)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->checkLastTagWas(I)V

    iget p1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->recursionDepth:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->recursionDepth:I

    return-void

    :cond_0
    invoke-static {}, Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;->recursionLimitExceeded()Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;

    move-result-object p1

    throw p1
.end method

.method public readInt32()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawVarint32()I

    move-result v0

    return v0
.end method

.method public readInt64()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawVarint64()J

    move-result-wide v0

    return-wide v0
.end method

.method public readMessage(Lcom/google/protobuf/micro/MessageMicro;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawVarint32()I

    move-result v0

    iget v1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->recursionDepth:I

    iget v2, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->recursionLimit:I

    if-ge v1, v2, :cond_0

    invoke-virtual {p0, v0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->pushLimit(I)I

    move-result v0

    iget v1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->recursionDepth:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->recursionDepth:I

    invoke-virtual {p1, p0}, Lcom/google/protobuf/micro/MessageMicro;->mergeFrom(Lcom/google/protobuf/micro/CodedInputStreamMicro;)Lcom/google/protobuf/micro/MessageMicro;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->checkLastTagWas(I)V

    iget p1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->recursionDepth:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->recursionDepth:I

    invoke-virtual {p0, v0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->popLimit(I)V

    return-void

    :cond_0
    invoke-static {}, Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;->recursionLimitExceeded()Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;

    move-result-object p1

    throw p1
.end method

.method public readRawByte()B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferPos:I

    iget v1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferSize:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->refillBuffer(Z)Z

    :cond_0
    iget-object v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->buffer:[B

    iget v1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferPos:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferPos:I

    aget-byte v0, v0, v1

    return v0
.end method

.method public readRawBytes(I)[B
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-ltz p1, :cond_9

    iget v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->totalBytesRetired:I

    iget v1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferPos:I

    add-int/2addr v0, v1

    add-int/2addr v0, p1

    iget v1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->currentLimit:I

    if-gt v0, v1, :cond_8

    iget v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferSize:I

    iget v1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferPos:I

    sub-int/2addr v0, v1

    const/4 v1, 0x0

    if-gt p1, v0, :cond_0

    new-array v0, p1, [B

    iget-object v2, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->buffer:[B

    iget v3, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferPos:I

    invoke-static {v2, v3, v0, v1, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget v1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferPos:I

    add-int/2addr v1, p1

    iput v1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferPos:I

    return-object v0

    :cond_0
    const/16 v0, 0x1000

    if-ge p1, v0, :cond_2

    new-array v0, p1, [B

    iget v2, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferSize:I

    iget v3, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferPos:I

    sub-int/2addr v2, v3

    iget-object v3, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->buffer:[B

    iget v4, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferPos:I

    invoke-static {v3, v4, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget v3, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferSize:I

    iput v3, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferPos:I

    const/4 v3, 0x1

    invoke-direct {p0, v3}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->refillBuffer(Z)Z

    :goto_0
    sub-int v4, p1, v2

    iget v5, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferSize:I

    if-le v4, v5, :cond_1

    iget-object v4, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->buffer:[B

    iget v5, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferSize:I

    invoke-static {v4, v1, v0, v2, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget v4, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferSize:I

    add-int/2addr v2, v4

    iget v4, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferSize:I

    iput v4, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferPos:I

    invoke-direct {p0, v3}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->refillBuffer(Z)Z

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->buffer:[B

    invoke-static {p1, v1, v0, v2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iput v4, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferPos:I

    return-object v0

    :cond_2
    iget v2, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferPos:I

    iget v3, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferSize:I

    iget v4, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->totalBytesRetired:I

    iget v5, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferSize:I

    add-int/2addr v4, v5

    iput v4, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->totalBytesRetired:I

    iput v1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferPos:I

    iput v1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferSize:I

    sub-int/2addr v3, v2

    sub-int v4, p1, v3

    new-instance v5, Ljava/util/Vector;

    invoke-direct {v5}, Ljava/util/Vector;-><init>()V

    :goto_1
    if-lez v4, :cond_6

    invoke-static {v4, v0}, Ljava/lang/Math;->min(II)I

    move-result v6

    new-array v6, v6, [B

    const/4 v7, 0x0

    :goto_2
    array-length v8, v6

    if-ge v7, v8, :cond_5

    iget-object v8, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->input:Ljava/io/InputStream;

    const/4 v9, -0x1

    if-nez v8, :cond_3

    const/4 v8, -0x1

    goto :goto_3

    :cond_3
    iget-object v8, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->input:Ljava/io/InputStream;

    array-length v10, v6

    sub-int/2addr v10, v7

    invoke-virtual {v8, v6, v7, v10}, Ljava/io/InputStream;->read([BII)I

    move-result v8

    :goto_3
    if-eq v8, v9, :cond_4

    iget v9, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->totalBytesRetired:I

    add-int/2addr v9, v8

    iput v9, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->totalBytesRetired:I

    add-int/2addr v7, v8

    goto :goto_2

    :cond_4
    invoke-static {}, Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;->truncatedMessage()Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;

    move-result-object p1

    throw p1

    :cond_5
    array-length v7, v6

    sub-int/2addr v4, v7

    invoke-virtual {v5, v6}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    goto :goto_1

    :cond_6
    new-array p1, p1, [B

    iget-object v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->buffer:[B

    invoke-static {v0, v2, p1, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    const/4 v0, 0x0

    :goto_4
    invoke-virtual {v5}, Ljava/util/Vector;->size()I

    move-result v2

    if-ge v0, v2, :cond_7

    invoke-virtual {v5, v0}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [B

    array-length v4, v2

    invoke-static {v2, v1, p1, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v2, v2

    add-int/2addr v3, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    :cond_7
    return-object p1

    :cond_8
    iget p1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->currentLimit:I

    iget v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->totalBytesRetired:I

    sub-int/2addr p1, v0

    iget v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferPos:I

    sub-int/2addr p1, v0

    invoke-virtual {p0, p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->skipRawBytes(I)V

    invoke-static {}, Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;->truncatedMessage()Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;

    move-result-object p1

    throw p1

    :cond_9
    invoke-static {}, Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;->negativeSize()Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;

    move-result-object p1

    throw p1
.end method

.method public readRawLittleEndian32()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawByte()B

    move-result v0

    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawByte()B

    move-result v1

    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawByte()B

    move-result v2

    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawByte()B

    move-result v3

    and-int/lit16 v0, v0, 0xff

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    and-int/lit16 v1, v2, 0xff

    shl-int/lit8 v1, v1, 0x10

    or-int/2addr v0, v1

    and-int/lit16 v1, v3, 0xff

    shl-int/lit8 v1, v1, 0x18

    or-int/2addr v0, v1

    return v0
.end method

.method public readRawLittleEndian64()J
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawByte()B

    move-result v0

    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawByte()B

    move-result v1

    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawByte()B

    move-result v2

    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawByte()B

    move-result v3

    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawByte()B

    move-result v4

    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawByte()B

    move-result v5

    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawByte()B

    move-result v6

    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawByte()B

    move-result v7

    int-to-long v8, v0

    const-wide/16 v10, 0xff

    and-long/2addr v8, v10

    int-to-long v0, v1

    and-long/2addr v0, v10

    const/16 v12, 0x8

    shl-long/2addr v0, v12

    or-long/2addr v0, v8

    int-to-long v8, v2

    and-long/2addr v8, v10

    const/16 v2, 0x10

    shl-long/2addr v8, v2

    or-long/2addr v0, v8

    int-to-long v2, v3

    and-long/2addr v2, v10

    const/16 v8, 0x18

    shl-long/2addr v2, v8

    or-long/2addr v0, v2

    int-to-long v2, v4

    and-long/2addr v2, v10

    const/16 v4, 0x20

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    int-to-long v2, v5

    and-long/2addr v2, v10

    const/16 v4, 0x28

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    int-to-long v2, v6

    and-long/2addr v2, v10

    const/16 v4, 0x30

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    int-to-long v2, v7

    and-long/2addr v2, v10

    const/16 v4, 0x38

    shl-long/2addr v2, v4

    or-long/2addr v0, v2

    return-wide v0
.end method

.method public readRawVarint32()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawByte()B

    move-result v0

    if-ltz v0, :cond_0

    return v0

    :cond_0
    and-int/lit8 v0, v0, 0x7f

    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawByte()B

    move-result v1

    if-ltz v1, :cond_1

    shl-int/lit8 v1, v1, 0x7

    or-int/2addr v0, v1

    goto :goto_1

    :cond_1
    and-int/lit8 v1, v1, 0x7f

    shl-int/lit8 v1, v1, 0x7

    or-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawByte()B

    move-result v1

    if-ltz v1, :cond_2

    shl-int/lit8 v1, v1, 0xe

    or-int/2addr v0, v1

    goto :goto_1

    :cond_2
    and-int/lit8 v1, v1, 0x7f

    shl-int/lit8 v1, v1, 0xe

    or-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawByte()B

    move-result v1

    if-ltz v1, :cond_3

    shl-int/lit8 v1, v1, 0x15

    or-int/2addr v0, v1

    goto :goto_1

    :cond_3
    and-int/lit8 v1, v1, 0x7f

    shl-int/lit8 v1, v1, 0x15

    or-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawByte()B

    move-result v1

    shl-int/lit8 v2, v1, 0x1c

    or-int/2addr v0, v2

    if-gez v1, :cond_6

    const/4 v1, 0x0

    :goto_0
    const/4 v2, 0x5

    if-ge v1, v2, :cond_5

    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawByte()B

    move-result v2

    if-ltz v2, :cond_4

    return v0

    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_5
    invoke-static {}, Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;->malformedVarint()Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;

    move-result-object v0

    throw v0

    :cond_6
    :goto_1
    return v0
.end method

.method public readRawVarint64()J
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    const-wide/16 v1, 0x0

    :goto_0
    const/16 v3, 0x40

    if-ge v0, v3, :cond_1

    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawByte()B

    move-result v3

    and-int/lit8 v4, v3, 0x7f

    int-to-long v4, v4

    shl-long/2addr v4, v0

    or-long/2addr v1, v4

    and-int/lit16 v3, v3, 0x80

    if-nez v3, :cond_0

    return-wide v1

    :cond_0
    add-int/lit8 v0, v0, 0x7

    goto :goto_0

    :cond_1
    invoke-static {}, Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;->malformedVarint()Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;

    move-result-object v0

    throw v0
.end method

.method public readSFixed32()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawLittleEndian32()I

    move-result v0

    return v0
.end method

.method public readSFixed64()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawLittleEndian64()J

    move-result-wide v0

    return-wide v0
.end method

.method public readSInt32()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawVarint32()I

    move-result v0

    invoke-static {v0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->decodeZigZag32(I)I

    move-result v0

    return v0
.end method

.method public readSInt64()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawVarint64()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->decodeZigZag64(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public readString()Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawVarint32()I

    move-result v0

    iget v1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferSize:I

    iget v2, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferPos:I

    sub-int/2addr v1, v2

    if-gt v0, v1, :cond_0

    if-lez v0, :cond_0

    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->buffer:[B

    iget v3, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferPos:I

    const-string v4, "UTF-8"

    invoke-direct {v1, v2, v3, v0, v4}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    iget v2, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferPos:I

    add-int/2addr v2, v0

    iput v2, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferPos:I

    return-object v1

    :cond_0
    new-instance v1, Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawBytes(I)[B

    move-result-object v0

    const-string v2, "UTF-8"

    invoke-direct {v1, v0, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    return-object v1
.end method

.method public readTag()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->isAtEnd()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->lastTag:I

    return v0

    :cond_0
    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawVarint32()I

    move-result v0

    iput v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->lastTag:I

    iget v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->lastTag:I

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->lastTag:I

    return v0

    :cond_1
    invoke-static {}, Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;->invalidTag()Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;

    move-result-object v0

    throw v0
.end method

.method public readUInt32()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawVarint32()I

    move-result v0

    return v0
.end method

.method public readUInt64()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawVarint64()J

    move-result-wide v0

    return-wide v0
.end method

.method public resetSizeCounter()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->totalBytesRetired:I

    return-void
.end method

.method public setRecursionLimit(I)I
    .locals 3

    if-ltz p1, :cond_0

    iget v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->recursionLimit:I

    iput p1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->recursionLimit:I

    return v0

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Recursion limit cannot be negative: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setSizeLimit(I)I
    .locals 3

    if-ltz p1, :cond_0

    iget v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->sizeLimit:I

    iput p1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->sizeLimit:I

    return v0

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Size limit cannot be negative: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public skipField(I)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-static {p1}, Lcom/google/protobuf/micro/WireFormatMicro;->getTagWireType(I)I

    move-result v0

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_0

    invoke-static {}, Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;->invalidWireType()Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;

    move-result-object p1

    throw p1

    :pswitch_0
    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawLittleEndian32()I

    return v1

    :pswitch_1
    const/4 p1, 0x0

    return p1

    :pswitch_2
    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->skipMessage()V

    invoke-static {p1}, Lcom/google/protobuf/micro/WireFormatMicro;->getTagFieldNumber(I)I

    move-result p1

    const/4 v0, 0x4

    invoke-static {p1, v0}, Lcom/google/protobuf/micro/WireFormatMicro;->makeTag(II)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->checkLastTagWas(I)V

    return v1

    :pswitch_3
    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawVarint32()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->skipRawBytes(I)V

    return v1

    :pswitch_4
    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readRawLittleEndian64()J

    return v1

    :pswitch_5
    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readInt32()I

    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public skipMessage()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :cond_0
    invoke-virtual {p0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->readTag()I

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0, v0}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->skipField(I)Z

    move-result v0

    if-nez v0, :cond_0

    :cond_1
    return-void
.end method

.method public skipRawBytes(I)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-ltz p1, :cond_5

    iget v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->totalBytesRetired:I

    iget v1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferPos:I

    add-int/2addr v0, v1

    add-int/2addr v0, p1

    iget v1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->currentLimit:I

    if-gt v0, v1, :cond_4

    iget v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferSize:I

    iget v1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferPos:I

    sub-int/2addr v0, v1

    if-gt p1, v0, :cond_0

    iget v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferPos:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferPos:I

    goto :goto_2

    :cond_0
    iget v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferSize:I

    iget v1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferPos:I

    sub-int/2addr v0, v1

    iget v1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->totalBytesRetired:I

    iget v2, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferSize:I

    add-int/2addr v1, v2

    iput v1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->totalBytesRetired:I

    const/4 v1, 0x0

    iput v1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferPos:I

    iput v1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferSize:I

    :goto_0
    if-ge v0, p1, :cond_3

    iget-object v1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->input:Ljava/io/InputStream;

    if-nez v1, :cond_1

    const/4 v1, -0x1

    goto :goto_1

    :cond_1
    iget-object v1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->input:Ljava/io/InputStream;

    sub-int v2, p1, v0

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v1

    long-to-int v1, v1

    :goto_1
    if-lez v1, :cond_2

    add-int/2addr v0, v1

    iget v2, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->totalBytesRetired:I

    add-int/2addr v2, v1

    iput v2, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->totalBytesRetired:I

    goto :goto_0

    :cond_2
    invoke-static {}, Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;->truncatedMessage()Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;

    move-result-object p1

    throw p1

    :cond_3
    :goto_2
    return-void

    :cond_4
    iget p1, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->currentLimit:I

    iget v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->totalBytesRetired:I

    sub-int/2addr p1, v0

    iget v0, p0, Lcom/google/protobuf/micro/CodedInputStreamMicro;->bufferPos:I

    sub-int/2addr p1, v0

    invoke-virtual {p0, p1}, Lcom/google/protobuf/micro/CodedInputStreamMicro;->skipRawBytes(I)V

    invoke-static {}, Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;->truncatedMessage()Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;

    move-result-object p1

    throw p1

    :cond_5
    invoke-static {}, Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;->negativeSize()Lcom/google/protobuf/micro/InvalidProtocolBufferMicroException;

    move-result-object p1

    throw p1
.end method
