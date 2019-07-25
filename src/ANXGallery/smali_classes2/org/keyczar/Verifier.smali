.class public Lorg/keyczar/Verifier;
.super Lorg/keyczar/Keyczar;
.source "Verifier.java"


# instance fields
.field private final VERIFY_CACHE:Lorg/keyczar/StreamCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/keyczar/StreamCache<",
            "Lorg/keyczar/interfaces/VerifyingStream;",
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

    invoke-direct {p0, p1}, Lorg/keyczar/Keyczar;-><init>(Ljava/lang/String;)V

    new-instance p1, Lorg/keyczar/StreamCache;

    invoke-direct {p1}, Lorg/keyczar/StreamCache;-><init>()V

    iput-object p1, p0, Lorg/keyczar/Verifier;->VERIFY_CACHE:Lorg/keyczar/StreamCache;

    return-void
.end method

.method public constructor <init>(Lorg/keyczar/interfaces/KeyczarReader;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    invoke-direct {p0, p1}, Lorg/keyczar/Keyczar;-><init>(Lorg/keyczar/interfaces/KeyczarReader;)V

    new-instance p1, Lorg/keyczar/StreamCache;

    invoke-direct {p1}, Lorg/keyczar/StreamCache;-><init>()V

    iput-object p1, p0, Lorg/keyczar/Verifier;->VERIFY_CACHE:Lorg/keyczar/StreamCache;

    return-void
.end method

.method private checkFormatAndGetHash(Ljava/nio/ByteBuffer;)[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/BadVersionException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x4

    new-array v0, v0, [B

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    return-object v0

    :cond_0
    new-instance p1, Lorg/keyczar/exceptions/BadVersionException;

    invoke-direct {p1, v0}, Lorg/keyczar/exceptions/BadVersionException;-><init>(B)V

    throw p1
.end method

.method private getVerifyingKey([B)Lorg/keyczar/KeyczarKey;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyNotFoundException;
        }
    .end annotation

    invoke-virtual {p0, p1}, Lorg/keyczar/Verifier;->getKey([B)Lorg/keyczar/KeyczarKey;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    new-instance v0, Lorg/keyczar/exceptions/KeyNotFoundException;

    invoke-direct {v0, p1}, Lorg/keyczar/exceptions/KeyNotFoundException;-><init>([B)V

    throw v0
.end method


# virtual methods
.method public attachedVerify([B[B)Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/keyczar/Verifier;->checkFormatAndGetHash(Ljava/nio/ByteBuffer;)[B

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/keyczar/Verifier;->getVerifyingKey([B)Lorg/keyczar/KeyczarKey;

    move-result-object v0

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v1

    new-array v1, v1, [B

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    new-array v2, v2, [B

    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    const/4 p1, 0x0

    invoke-static {p1}, Lorg/keyczar/util/Util;->fromInt(I)[B

    move-result-object p1

    array-length v3, p2

    if-lez v3, :cond_0

    invoke-static {p2}, Lorg/keyczar/util/Util;->lenPrefix([B)[B

    move-result-object p1

    :cond_0
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p2

    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p1

    invoke-static {v2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {p0, v0, p2, p1, v1}, Lorg/keyczar/Verifier;->rawVerify(Lorg/keyczar/KeyczarKey;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)Z

    move-result p1

    return p1
.end method

.method public getAttachedData([B[B)[B
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lorg/keyczar/Verifier;->attachedVerify([B[B)Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-virtual {p0, p1}, Lorg/keyczar/Verifier;->getAttachedDataWithoutVerifying([B)[B

    move-result-object p1

    return-object p1

    :cond_0
    new-instance p1, Lorg/keyczar/exceptions/KeyczarException;

    const-string p2, "Attached signature failed to verify. Unable to return signed data."

    invoke-direct {p1, p2}, Lorg/keyczar/exceptions/KeyczarException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public getAttachedDataWithoutVerifying([B)[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/keyczar/Verifier;->checkFormatAndGetHash(Ljava/nio/ByteBuffer;)[B

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/keyczar/Verifier;->getVerifyingKey([B)Lorg/keyczar/KeyczarKey;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    new-array v0, v0, [B

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    return-object v0
.end method

.method isAcceptablePurpose(Lorg/keyczar/enums/KeyPurpose;)Z
    .locals 1

    sget-object v0, Lorg/keyczar/enums/KeyPurpose;->VERIFY:Lorg/keyczar/enums/KeyPurpose;

    if-eq p1, v0, :cond_1

    sget-object v0, Lorg/keyczar/enums/KeyPurpose;->SIGN_AND_VERIFY:Lorg/keyczar/enums/KeyPurpose;

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method rawVerify(Lorg/keyczar/KeyczarKey;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    iget-object v0, p0, Lorg/keyczar/Verifier;->VERIFY_CACHE:Lorg/keyczar/StreamCache;

    invoke-virtual {v0, p1}, Lorg/keyczar/StreamCache;->get(Lorg/keyczar/KeyczarKey;)Lorg/keyczar/interfaces/Stream;

    move-result-object v0

    check-cast v0, Lorg/keyczar/interfaces/VerifyingStream;

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lorg/keyczar/KeyczarKey;->getStream()Lorg/keyczar/interfaces/Stream;

    move-result-object v0

    check-cast v0, Lorg/keyczar/interfaces/VerifyingStream;

    :cond_0
    invoke-interface {v0}, Lorg/keyczar/interfaces/VerifyingStream;->initVerify()V

    invoke-interface {v0, p2}, Lorg/keyczar/interfaces/VerifyingStream;->updateVerify(Ljava/nio/ByteBuffer;)V

    if-eqz p3, :cond_1

    invoke-interface {v0, p3}, Lorg/keyczar/interfaces/VerifyingStream;->updateVerify(Ljava/nio/ByteBuffer;)V

    :cond_1
    sget-object p2, Lorg/keyczar/Verifier;->FORMAT_BYTES:[B

    invoke-static {p2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p2

    invoke-interface {v0, p2}, Lorg/keyczar/interfaces/VerifyingStream;->updateVerify(Ljava/nio/ByteBuffer;)V

    invoke-interface {v0, p4}, Lorg/keyczar/interfaces/VerifyingStream;->verify(Ljava/nio/ByteBuffer;)Z

    move-result p2

    iget-object p3, p0, Lorg/keyczar/Verifier;->VERIFY_CACHE:Lorg/keyczar/StreamCache;

    invoke-virtual {p3, p1, v0}, Lorg/keyczar/StreamCache;->put(Lorg/keyczar/KeyczarKey;Lorg/keyczar/interfaces/Stream;)V

    return p2
.end method

.method public verify(Ljava/lang/String;Ljava/lang/String;)Z
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

    invoke-static {p2}, Lorg/keyczar/util/Base64Coder;->decodeWebSafe(Ljava/lang/String;)[B

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lorg/keyczar/Verifier;->verify([B[B)Z

    move-result p1
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception p1

    new-instance p2, Lorg/keyczar/exceptions/KeyczarException;

    invoke-direct {p2, p1}, Lorg/keyczar/exceptions/KeyczarException;-><init>(Ljava/lang/Throwable;)V

    throw p2
.end method

.method public verify(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, p2}, Lorg/keyczar/Verifier;->verify(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)Z

    move-result p1

    return p1
.end method

.method verify(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    const/4 v1, 0x5

    if-lt v0, v1, :cond_3

    invoke-direct {p0, p3}, Lorg/keyczar/Verifier;->checkFormatAndGetHash(Ljava/nio/ByteBuffer;)[B

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/keyczar/Verifier;->getVerifyingKey([B)Lorg/keyczar/KeyczarKey;

    move-result-object v1

    if-eqz v1, :cond_2

    iget-object v0, p0, Lorg/keyczar/Verifier;->VERIFY_CACHE:Lorg/keyczar/StreamCache;

    invoke-virtual {v0, v1}, Lorg/keyczar/StreamCache;->get(Lorg/keyczar/KeyczarKey;)Lorg/keyczar/interfaces/Stream;

    move-result-object v0

    check-cast v0, Lorg/keyczar/interfaces/VerifyingStream;

    if-nez v0, :cond_0

    invoke-virtual {v1}, Lorg/keyczar/KeyczarKey;->getStream()Lorg/keyczar/interfaces/Stream;

    move-result-object v0

    check-cast v0, Lorg/keyczar/interfaces/VerifyingStream;

    :cond_0
    invoke-interface {v0}, Lorg/keyczar/interfaces/VerifyingStream;->initVerify()V

    if-eqz p2, :cond_1

    invoke-interface {v0, p2}, Lorg/keyczar/interfaces/VerifyingStream;->updateVerify(Ljava/nio/ByteBuffer;)V

    :cond_1
    invoke-interface {v0, p1}, Lorg/keyczar/interfaces/VerifyingStream;->updateVerify(Ljava/nio/ByteBuffer;)V

    sget-object p1, Lorg/keyczar/Verifier;->FORMAT_BYTES:[B

    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p1

    invoke-interface {v0, p1}, Lorg/keyczar/interfaces/VerifyingStream;->updateVerify(Ljava/nio/ByteBuffer;)V

    invoke-interface {v0, p3}, Lorg/keyczar/interfaces/VerifyingStream;->verify(Ljava/nio/ByteBuffer;)Z

    move-result p1

    iget-object p2, p0, Lorg/keyczar/Verifier;->VERIFY_CACHE:Lorg/keyczar/StreamCache;

    invoke-virtual {p2, v1, v0}, Lorg/keyczar/StreamCache;->put(Lorg/keyczar/KeyczarKey;Lorg/keyczar/interfaces/Stream;)V

    return p1

    :cond_2
    new-instance p1, Lorg/keyczar/exceptions/KeyNotFoundException;

    invoke-direct {p1, v0}, Lorg/keyczar/exceptions/KeyNotFoundException;-><init>([B)V

    throw p1

    :cond_3
    new-instance p1, Lorg/keyczar/exceptions/ShortSignatureException;

    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->remaining()I

    move-result p2

    invoke-direct {p1, p2}, Lorg/keyczar/exceptions/ShortSignatureException;-><init>(I)V

    throw p1
.end method

.method public verify([B[B)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p1

    invoke-static {p2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lorg/keyczar/Verifier;->verify(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)Z

    move-result p1

    return p1
.end method
