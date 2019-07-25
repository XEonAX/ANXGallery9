.class public Lorg/keyczar/Crypter;
.super Lorg/keyczar/Encrypter;
.source "Crypter.java"


# static fields
.field private static final DECRYPT_CHUNK_SIZE:I = 0x400


# instance fields
.field private final CRYPT_CACHE:Lorg/keyczar/StreamCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/keyczar/StreamCache<",
            "Lorg/keyczar/interfaces/DecryptingStream;",
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

    invoke-direct {p0, p1}, Lorg/keyczar/Encrypter;-><init>(Ljava/lang/String;)V

    new-instance p1, Lorg/keyczar/StreamCache;

    invoke-direct {p1}, Lorg/keyczar/StreamCache;-><init>()V

    iput-object p1, p0, Lorg/keyczar/Crypter;->CRYPT_CACHE:Lorg/keyczar/StreamCache;

    return-void
.end method

.method public constructor <init>(Lorg/keyczar/interfaces/KeyczarReader;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    invoke-direct {p0, p1}, Lorg/keyczar/Encrypter;-><init>(Lorg/keyczar/interfaces/KeyczarReader;)V

    new-instance p1, Lorg/keyczar/StreamCache;

    invoke-direct {p1}, Lorg/keyczar/StreamCache;-><init>()V

    iput-object p1, p0, Lorg/keyczar/Crypter;->CRYPT_CACHE:Lorg/keyczar/StreamCache;

    return-void
.end method


# virtual methods
.method public decrypt(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    new-instance v0, Ljava/lang/String;

    invoke-static {p1}, Lorg/keyczar/util/Base64Coder;->decodeWebSafe(Ljava/lang/String;)[B

    move-result-object p1

    invoke-virtual {p0, p1}, Lorg/keyczar/Crypter;->decrypt([B)[B

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/String;-><init>([B)V

    return-object v0
.end method

.method public decrypt(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->asReadOnlyBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v1

    const/4 v2, 0x5

    if-lt v1, v2, :cond_6

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    if-nez v1, :cond_5

    const/4 v1, 0x4

    new-array v1, v1, [B

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    invoke-virtual {p0, v1}, Lorg/keyczar/Crypter;->getKey([B)Lorg/keyczar/KeyczarKey;

    move-result-object v2

    if-eqz v2, :cond_4

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->mark()Ljava/nio/Buffer;

    iget-object v1, p0, Lorg/keyczar/Crypter;->CRYPT_CACHE:Lorg/keyczar/StreamCache;

    invoke-virtual {v1, v2}, Lorg/keyczar/StreamCache;->get(Lorg/keyczar/KeyczarKey;)Lorg/keyczar/interfaces/Stream;

    move-result-object v1

    check-cast v1, Lorg/keyczar/interfaces/DecryptingStream;

    if-nez v1, :cond_0

    invoke-virtual {v2}, Lorg/keyczar/KeyczarKey;->getStream()Lorg/keyczar/interfaces/Stream;

    move-result-object v1

    check-cast v1, Lorg/keyczar/interfaces/DecryptingStream;

    :cond_0
    invoke-interface {v1}, Lorg/keyczar/interfaces/DecryptingStream;->getVerifyingStream()Lorg/keyczar/interfaces/VerifyingStream;

    move-result-object v3

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v4

    invoke-interface {v3}, Lorg/keyczar/interfaces/VerifyingStream;->digestSize()I

    move-result v5

    if-lt v4, v5, :cond_3

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v4

    invoke-interface {v3}, Lorg/keyczar/interfaces/VerifyingStream;->digestSize()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->reset()Ljava/nio/Buffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v5

    invoke-interface {v3}, Lorg/keyczar/interfaces/VerifyingStream;->digestSize()I

    move-result v6

    sub-int/2addr v5, v6

    invoke-virtual {v0, v5}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    invoke-interface {v1, v0}, Lorg/keyczar/interfaces/DecryptingStream;->initDecrypt(Ljava/nio/ByteBuffer;)V

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->asReadOnlyBuffer()Ljava/nio/ByteBuffer;

    move-result-object p1

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v5

    invoke-virtual {p1, v5}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    invoke-interface {v3}, Lorg/keyczar/interfaces/VerifyingStream;->initVerify()V

    invoke-interface {v3, p1}, Lorg/keyczar/interfaces/VerifyingStream;->updateVerify(Ljava/nio/ByteBuffer;)V

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->mark()Ljava/nio/Buffer;

    :goto_0
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result p1

    const/16 v5, 0x400

    if-le p1, v5, :cond_1

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object p1

    invoke-virtual {p1, v5}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    invoke-interface {v1, p1, p2}, Lorg/keyczar/interfaces/DecryptingStream;->updateDecrypt(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)I

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    invoke-interface {v3, p1}, Lorg/keyczar/interfaces/VerifyingStream;->updateVerify(Ljava/nio/ByteBuffer;)V

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result p1

    add-int/2addr p1, v5

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->mark()Ljava/nio/Buffer;

    invoke-interface {v3, v0}, Lorg/keyczar/interfaces/VerifyingStream;->updateVerify(Ljava/nio/ByteBuffer;)V

    invoke-interface {v3, v4}, Lorg/keyczar/interfaces/VerifyingStream;->verify(Ljava/nio/ByteBuffer;)Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->reset()Ljava/nio/Buffer;

    invoke-interface {v1, v0, p2}, Lorg/keyczar/interfaces/DecryptingStream;->doFinalDecrypt(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)I

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->position()I

    move-result p1

    invoke-virtual {p2, p1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    iget-object p1, p0, Lorg/keyczar/Crypter;->CRYPT_CACHE:Lorg/keyczar/StreamCache;

    invoke-virtual {p1, v2, v1}, Lorg/keyczar/StreamCache;->put(Lorg/keyczar/KeyczarKey;Lorg/keyczar/interfaces/Stream;)V

    return-void

    :cond_2
    new-instance p1, Lorg/keyczar/exceptions/InvalidSignatureException;

    invoke-direct {p1}, Lorg/keyczar/exceptions/InvalidSignatureException;-><init>()V

    throw p1

    :cond_3
    new-instance p1, Lorg/keyczar/exceptions/ShortCiphertextException;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result p2

    invoke-direct {p1, p2}, Lorg/keyczar/exceptions/ShortCiphertextException;-><init>(I)V

    throw p1

    :cond_4
    new-instance p1, Lorg/keyczar/exceptions/KeyNotFoundException;

    invoke-direct {p1, v1}, Lorg/keyczar/exceptions/KeyNotFoundException;-><init>([B)V

    throw p1

    :cond_5
    new-instance p1, Lorg/keyczar/exceptions/BadVersionException;

    invoke-direct {p1, v1}, Lorg/keyczar/exceptions/BadVersionException;-><init>(B)V

    throw p1

    :cond_6
    new-instance p1, Lorg/keyczar/exceptions/ShortCiphertextException;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result p2

    invoke-direct {p1, p2}, Lorg/keyczar/exceptions/ShortCiphertextException;-><init>(I)V

    throw p1
.end method

.method public decrypt([B)[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    array-length v0, p1

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p1

    invoke-virtual {p0, p1, v0}, Lorg/keyczar/Crypter;->decrypt(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)V

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->reset()Ljava/nio/Buffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result p1

    new-array p1, p1, [B

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    return-object p1
.end method

.method isAcceptablePurpose(Lorg/keyczar/enums/KeyPurpose;)Z
    .locals 1

    sget-object v0, Lorg/keyczar/enums/KeyPurpose;->DECRYPT_AND_ENCRYPT:Lorg/keyczar/enums/KeyPurpose;

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method
