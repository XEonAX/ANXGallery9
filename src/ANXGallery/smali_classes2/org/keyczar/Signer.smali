.class public Lorg/keyczar/Signer;
.super Lorg/keyczar/Verifier;
.source "Signer.java"


# static fields
.field static final TIMESTAMP_SIZE:I = 0x8


# instance fields
.field private final SIGN_QUEUE:Lorg/keyczar/StreamQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/keyczar/StreamQueue<",
            "Lorg/keyczar/interfaces/SigningStream;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    invoke-direct {p0, p1}, Lorg/keyczar/Verifier;-><init>(Ljava/lang/String;)V

    new-instance p1, Lorg/keyczar/StreamQueue;

    invoke-direct {p1}, Lorg/keyczar/StreamQueue;-><init>()V

    iput-object p1, p0, Lorg/keyczar/Signer;->SIGN_QUEUE:Lorg/keyczar/StreamQueue;

    return-void
.end method

.method public constructor <init>(Lorg/keyczar/interfaces/KeyczarReader;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    invoke-direct {p0, p1}, Lorg/keyczar/Verifier;-><init>(Lorg/keyczar/interfaces/KeyczarReader;)V

    new-instance p1, Lorg/keyczar/StreamQueue;

    invoke-direct {p1}, Lorg/keyczar/StreamQueue;-><init>()V

    iput-object p1, p0, Lorg/keyczar/Signer;->SIGN_QUEUE:Lorg/keyczar/StreamQueue;

    return-void
.end method


# virtual methods
.method public attachedSign([B[B)[B
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    invoke-virtual {p0}, Lorg/keyczar/Signer;->getPrimaryKey()Lorg/keyczar/KeyczarKey;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v1, p0, Lorg/keyczar/Signer;->SIGN_QUEUE:Lorg/keyczar/StreamQueue;

    invoke-virtual {v1}, Lorg/keyczar/StreamQueue;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/keyczar/interfaces/SigningStream;

    if-nez v1, :cond_0

    invoke-virtual {v0}, Lorg/keyczar/KeyczarKey;->getStream()Lorg/keyczar/interfaces/Stream;

    move-result-object v1

    check-cast v1, Lorg/keyczar/interfaces/SigningStream;

    :cond_0
    invoke-interface {v1}, Lorg/keyczar/interfaces/SigningStream;->initSign()V

    const/4 v2, 0x0

    invoke-static {v2}, Lorg/keyczar/util/Util;->fromInt(I)[B

    move-result-object v3

    array-length v4, p2

    if-lez v4, :cond_1

    invoke-static {p2}, Lorg/keyczar/util/Util;->lenPrefix([B)[B

    move-result-object v3

    :cond_1
    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p2

    invoke-interface {v1, p2}, Lorg/keyczar/interfaces/SigningStream;->updateSign(Ljava/nio/ByteBuffer;)V

    invoke-static {v3}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p2

    invoke-interface {v1, p2}, Lorg/keyczar/interfaces/SigningStream;->updateSign(Ljava/nio/ByteBuffer;)V

    sget-object p2, Lorg/keyczar/Signer;->FORMAT_BYTES:[B

    invoke-static {p2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p2

    invoke-interface {v1, p2}, Lorg/keyczar/interfaces/SigningStream;->updateSign(Ljava/nio/ByteBuffer;)V

    invoke-virtual {p0}, Lorg/keyczar/Signer;->digestSize()I

    move-result p2

    invoke-static {p2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object p2

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->mark()Ljava/nio/Buffer;

    invoke-interface {v1, p2}, Lorg/keyczar/interfaces/SigningStream;->sign(Ljava/nio/ByteBuffer;)V

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    invoke-virtual {p2, v3}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    const/4 v3, 0x4

    new-array v3, v3, [[B

    sget-object v4, Lorg/keyczar/Signer;->FORMAT_BYTES:[B

    aput-object v4, v3, v2

    const/4 v2, 0x1

    invoke-virtual {v0}, Lorg/keyczar/KeyczarKey;->hash()[B

    move-result-object v0

    aput-object v0, v3, v2

    const/4 v0, 0x2

    invoke-static {p1}, Lorg/keyczar/util/Util;->lenPrefix([B)[B

    move-result-object p1

    aput-object p1, v3, v0

    const/4 p1, 0x3

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p2

    aput-object p2, v3, p1

    invoke-static {v3}, Lorg/keyczar/util/Util;->cat([[B)[B

    move-result-object p1

    iget-object p2, p0, Lorg/keyczar/Signer;->SIGN_QUEUE:Lorg/keyczar/StreamQueue;

    invoke-virtual {p2, v1}, Lorg/keyczar/StreamQueue;->add(Ljava/lang/Object;)Z

    return-object p1

    :cond_2
    new-instance p1, Lorg/keyczar/exceptions/NoPrimaryKeyException;

    invoke-direct {p1}, Lorg/keyczar/exceptions/NoPrimaryKeyException;-><init>()V

    throw p1
.end method

.method public digestSize()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    invoke-virtual {p0}, Lorg/keyczar/Signer;->getPrimaryKey()Lorg/keyczar/KeyczarKey;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/keyczar/KeyczarKey;->getStream()Lorg/keyczar/interfaces/Stream;

    move-result-object v0

    check-cast v0, Lorg/keyczar/interfaces/SigningStream;

    invoke-interface {v0}, Lorg/keyczar/interfaces/SigningStream;->digestSize()I

    move-result v0

    add-int/lit8 v0, v0, 0x5

    return v0

    :cond_0
    new-instance v0, Lorg/keyczar/exceptions/NoPrimaryKeyException;

    invoke-direct {v0}, Lorg/keyczar/exceptions/NoPrimaryKeyException;-><init>()V

    throw v0
.end method

.method isAcceptablePurpose(Lorg/keyczar/enums/KeyPurpose;)Z
    .locals 1

    sget-object v0, Lorg/keyczar/enums/KeyPurpose;->SIGN_AND_VERIFY:Lorg/keyczar/enums/KeyPurpose;

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public sign(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    :try_start_0
    const-string v0, "UTF-8"

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/keyczar/Signer;->sign([B)[B

    move-result-object p1

    invoke-static {p1}, Lorg/keyczar/util/Base64Coder;->encodeWebSafe([B)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    new-instance v0, Lorg/keyczar/exceptions/KeyczarException;

    invoke-direct {v0, p1}, Lorg/keyczar/exceptions/KeyczarException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method public sign(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    const/4 v2, 0x0

    const-wide/16 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v5, p2

    invoke-virtual/range {v0 .. v5}, Lorg/keyczar/Signer;->sign(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;JLjava/nio/ByteBuffer;)V

    return-void
.end method

.method sign(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;JLjava/nio/ByteBuffer;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    invoke-virtual {p0}, Lorg/keyczar/Signer;->getPrimaryKey()Lorg/keyczar/KeyczarKey;

    move-result-object v0

    if-eqz v0, :cond_5

    iget-object v1, p0, Lorg/keyczar/Signer;->SIGN_QUEUE:Lorg/keyczar/StreamQueue;

    invoke-virtual {v1}, Lorg/keyczar/StreamQueue;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/keyczar/interfaces/SigningStream;

    if-nez v1, :cond_0

    invoke-virtual {v0}, Lorg/keyczar/KeyczarKey;->getStream()Lorg/keyczar/interfaces/Stream;

    move-result-object v1

    check-cast v1, Lorg/keyczar/interfaces/SigningStream;

    :cond_0
    invoke-virtual {p0}, Lorg/keyczar/Signer;->digestSize()I

    move-result v2

    const-wide/16 v3, 0x0

    cmp-long v5, p3, v3

    if-lez v5, :cond_1

    add-int/lit8 v2, v2, 0x8

    :cond_1
    invoke-virtual {p5}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v5

    if-lt v5, v2, :cond_4

    const/4 v2, 0x5

    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/keyczar/KeyczarKey;->copyHeader(Ljava/nio/ByteBuffer;)V

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    invoke-interface {v1}, Lorg/keyczar/interfaces/SigningStream;->initSign()V

    invoke-virtual {p5}, Ljava/nio/ByteBuffer;->mark()Ljava/nio/Buffer;

    invoke-virtual {p5, v2}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    cmp-long v0, p3, v3

    if-lez v0, :cond_2

    invoke-static {p3, p4}, Lorg/keyczar/util/Util;->fromLong(J)[B

    move-result-object p3

    invoke-static {p3}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p3

    invoke-virtual {p5, p3}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    invoke-interface {v1, p3}, Lorg/keyczar/interfaces/SigningStream;->updateSign(Ljava/nio/ByteBuffer;)V

    :cond_2
    if-eqz p2, :cond_3

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->remaining()I

    move-result p3

    if-lez p3, :cond_3

    invoke-interface {v1, p2}, Lorg/keyczar/interfaces/SigningStream;->updateSign(Ljava/nio/ByteBuffer;)V

    :cond_3
    invoke-interface {v1, p1}, Lorg/keyczar/interfaces/SigningStream;->updateSign(Ljava/nio/ByteBuffer;)V

    sget-object p1, Lorg/keyczar/Signer;->FORMAT_BYTES:[B

    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p1

    invoke-interface {v1, p1}, Lorg/keyczar/interfaces/SigningStream;->updateSign(Ljava/nio/ByteBuffer;)V

    invoke-interface {v1, p5}, Lorg/keyczar/interfaces/SigningStream;->sign(Ljava/nio/ByteBuffer;)V

    invoke-virtual {p5}, Ljava/nio/ByteBuffer;->position()I

    move-result p1

    invoke-virtual {p5, p1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    iget-object p1, p0, Lorg/keyczar/Signer;->SIGN_QUEUE:Lorg/keyczar/StreamQueue;

    invoke-virtual {p1, v1}, Lorg/keyczar/StreamQueue;->add(Ljava/lang/Object;)Z

    return-void

    :cond_4
    new-instance p1, Lorg/keyczar/exceptions/ShortBufferException;

    invoke-virtual {p5}, Ljava/nio/ByteBuffer;->capacity()I

    move-result p2

    invoke-direct {p1, p2, v2}, Lorg/keyczar/exceptions/ShortBufferException;-><init>(II)V

    throw p1

    :cond_5
    new-instance p1, Lorg/keyczar/exceptions/NoPrimaryKeyException;

    invoke-direct {p1}, Lorg/keyczar/exceptions/NoPrimaryKeyException;-><init>()V

    throw p1
.end method

.method public sign([B)[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    invoke-virtual {p0}, Lorg/keyczar/Signer;->digestSize()I

    move-result v0

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p1

    invoke-virtual {p0, p1, v0}, Lorg/keyczar/Signer;->sign(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)V

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->reset()Ljava/nio/Buffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result p1

    new-array p1, p1, [B

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    return-object p1
.end method
