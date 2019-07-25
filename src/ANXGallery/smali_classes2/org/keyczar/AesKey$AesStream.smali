.class Lorg/keyczar/AesKey$AesStream;
.super Ljava/lang/Object;
.source "AesKey.java"

# interfaces
.implements Lorg/keyczar/interfaces/DecryptingStream;
.implements Lorg/keyczar/interfaces/EncryptingStream;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/keyczar/AesKey;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AesStream"
.end annotation


# instance fields
.field private final decryptingCipher:Ljavax/crypto/Cipher;

.field private final encryptingCipher:Ljavax/crypto/Cipher;

.field ivRead:Z

.field private final signStream:Lorg/keyczar/interfaces/SigningStream;

.field final synthetic this$0:Lorg/keyczar/AesKey;


# direct methods
.method public constructor <init>(Lorg/keyczar/AesKey;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    iput-object p1, p0, Lorg/keyczar/AesKey$AesStream;->this$0:Lorg/keyczar/AesKey;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/keyczar/AesKey$AesStream;->ivRead:Z

    new-instance v0, Ljavax/crypto/spec/IvParameterSpec;

    const/16 v1, 0x10

    new-array v1, v1, [B

    invoke-direct {v0, v1}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    :try_start_0
    invoke-static {p1}, Lorg/keyczar/AesKey;->access$000(Lorg/keyczar/AesKey;)Lorg/keyczar/enums/CipherMode;

    move-result-object v1

    invoke-virtual {v1}, Lorg/keyczar/enums/CipherMode;->getMode()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v1

    iput-object v1, p0, Lorg/keyczar/AesKey$AesStream;->encryptingCipher:Ljavax/crypto/Cipher;

    iget-object v1, p0, Lorg/keyczar/AesKey$AesStream;->encryptingCipher:Ljavax/crypto/Cipher;

    const/4 v2, 0x1

    invoke-static {p1}, Lorg/keyczar/AesKey;->access$100(Lorg/keyczar/AesKey;)Ljavax/crypto/SecretKey;

    move-result-object v3

    invoke-virtual {v1, v2, v3, v0}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    invoke-static {p1}, Lorg/keyczar/AesKey;->access$000(Lorg/keyczar/AesKey;)Lorg/keyczar/enums/CipherMode;

    move-result-object v1

    invoke-virtual {v1}, Lorg/keyczar/enums/CipherMode;->getMode()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v1

    iput-object v1, p0, Lorg/keyczar/AesKey$AesStream;->decryptingCipher:Ljavax/crypto/Cipher;

    iget-object v1, p0, Lorg/keyczar/AesKey$AesStream;->decryptingCipher:Ljavax/crypto/Cipher;

    const/4 v2, 0x2

    invoke-static {p1}, Lorg/keyczar/AesKey;->access$100(Lorg/keyczar/AesKey;)Ljavax/crypto/SecretKey;

    move-result-object v3

    invoke-virtual {v1, v2, v3, v0}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    invoke-static {p1}, Lorg/keyczar/AesKey;->access$200(Lorg/keyczar/AesKey;)Lorg/keyczar/HmacKey;

    move-result-object p1

    invoke-virtual {p1}, Lorg/keyczar/HmacKey;->getStream()Lorg/keyczar/interfaces/Stream;

    move-result-object p1

    check-cast p1, Lorg/keyczar/interfaces/SigningStream;

    iput-object p1, p0, Lorg/keyczar/AesKey$AesStream;->signStream:Lorg/keyczar/interfaces/SigningStream;
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    new-instance v0, Lorg/keyczar/exceptions/KeyczarException;

    invoke-direct {v0, p1}, Lorg/keyczar/exceptions/KeyczarException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method


# virtual methods
.method public doFinalDecrypt(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    iget-boolean v0, p0, Lorg/keyczar/AesKey$AesStream;->ivRead:Z

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    const/16 v0, 0x10

    new-array v0, v0, [B

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    iget-object v2, p0, Lorg/keyczar/AesKey$AesStream;->decryptingCipher:Ljavax/crypto/Cipher;

    invoke-virtual {v2, v0}, Ljavax/crypto/Cipher;->update([B)[B

    iput-boolean v1, p0, Lorg/keyczar/AesKey$AesStream;->ivRead:Z

    :cond_1
    :try_start_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    if-nez v0, :cond_2

    iget-object p1, p0, Lorg/keyczar/AesKey$AesStream;->decryptingCipher:Ljavax/crypto/Cipher;

    invoke-virtual {p1}, Ljavax/crypto/Cipher;->doFinal()[B

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    array-length p1, p1

    return p1

    :cond_2
    iget-object v0, p0, Lorg/keyczar/AesKey$AesStream;->decryptingCipher:Ljavax/crypto/Cipher;

    invoke-virtual {v0, p1, p2}, Ljavax/crypto/Cipher;->doFinal(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)I

    move-result p1
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception p1

    new-instance p2, Lorg/keyczar/exceptions/KeyczarException;

    invoke-direct {p2, p1}, Lorg/keyczar/exceptions/KeyczarException;-><init>(Ljava/lang/Throwable;)V

    throw p2
.end method

.method public doFinalEncrypt(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Lorg/keyczar/AesKey$AesStream;->encryptingCipher:Ljavax/crypto/Cipher;

    invoke-virtual {v0, p1, p2}, Ljavax/crypto/Cipher;->doFinal(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)I

    move-result p1
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception p1

    new-instance p2, Lorg/keyczar/exceptions/KeyczarException;

    invoke-direct {p2, p1}, Lorg/keyczar/exceptions/KeyczarException;-><init>(Ljava/lang/Throwable;)V

    throw p2
.end method

.method public getSigningStream()Lorg/keyczar/interfaces/SigningStream;
    .locals 1

    iget-object v0, p0, Lorg/keyczar/AesKey$AesStream;->signStream:Lorg/keyczar/interfaces/SigningStream;

    return-object v0
.end method

.method public getVerifyingStream()Lorg/keyczar/interfaces/VerifyingStream;
    .locals 1

    iget-object v0, p0, Lorg/keyczar/AesKey$AesStream;->signStream:Lorg/keyczar/interfaces/SigningStream;

    check-cast v0, Lorg/keyczar/interfaces/VerifyingStream;

    return-object v0
.end method

.method public initDecrypt(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/16 v0, 0x10

    new-array v0, v0, [B

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    iget-object p1, p0, Lorg/keyczar/AesKey$AesStream;->decryptingCipher:Ljavax/crypto/Cipher;

    invoke-virtual {p1, v0}, Ljavax/crypto/Cipher;->update([B)[B

    const/4 p1, 0x1

    iput-boolean p1, p0, Lorg/keyczar/AesKey$AesStream;->ivRead:Z

    return-void
.end method

.method public initEncrypt(Ljava/nio/ByteBuffer;)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    const/16 v0, 0x10

    new-array v0, v0, [B

    invoke-static {v0}, Lorg/keyczar/util/Util;->rand([B)V

    :try_start_0
    iget-object v1, p0, Lorg/keyczar/AesKey$AesStream;->encryptingCipher:Ljavax/crypto/Cipher;

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v1, v0, p1}, Ljavax/crypto/Cipher;->update(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)I

    move-result p1
    :try_end_0
    .catch Ljavax/crypto/ShortBufferException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception p1

    new-instance v0, Lorg/keyczar/exceptions/ShortBufferException;

    invoke-direct {v0, p1}, Lorg/keyczar/exceptions/ShortBufferException;-><init>(Ljava/lang/Throwable;)V

    throw v0
.end method

.method public maxOutputSize(I)I
    .locals 2

    iget-object v0, p0, Lorg/keyczar/AesKey$AesStream;->this$0:Lorg/keyczar/AesKey;

    invoke-static {v0}, Lorg/keyczar/AesKey;->access$000(Lorg/keyczar/AesKey;)Lorg/keyczar/enums/CipherMode;

    move-result-object v0

    const/16 v1, 0x10

    invoke-virtual {v0, v1, p1}, Lorg/keyczar/enums/CipherMode;->getOutputSize(II)I

    move-result p1

    return p1
.end method

.method public updateDecrypt(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    iget-boolean v0, p0, Lorg/keyczar/AesKey$AesStream;->ivRead:Z

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    const/16 v1, 0x10

    if-lt v0, v1, :cond_0

    new-array v0, v1, [B

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    iget-object v1, p0, Lorg/keyczar/AesKey$AesStream;->decryptingCipher:Ljavax/crypto/Cipher;

    invoke-virtual {v1, v0}, Ljavax/crypto/Cipher;->update([B)[B

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/keyczar/AesKey$AesStream;->ivRead:Z

    :cond_0
    :try_start_0
    iget-object v0, p0, Lorg/keyczar/AesKey$AesStream;->decryptingCipher:Ljavax/crypto/Cipher;

    invoke-virtual {v0, p1, p2}, Ljavax/crypto/Cipher;->update(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)I

    move-result p1
    :try_end_0
    .catch Ljavax/crypto/ShortBufferException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception p1

    new-instance p2, Lorg/keyczar/exceptions/ShortBufferException;

    invoke-direct {p2, p1}, Lorg/keyczar/exceptions/ShortBufferException;-><init>(Ljava/lang/Throwable;)V

    throw p2
.end method

.method public updateEncrypt(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    :try_start_0
    iget-object v0, p0, Lorg/keyczar/AesKey$AesStream;->encryptingCipher:Ljavax/crypto/Cipher;

    invoke-virtual {v0, p1, p2}, Ljavax/crypto/Cipher;->update(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)I

    move-result p1
    :try_end_0
    .catch Ljavax/crypto/ShortBufferException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception p1

    new-instance p2, Lorg/keyczar/exceptions/ShortBufferException;

    invoke-direct {p2, p1}, Lorg/keyczar/exceptions/ShortBufferException;-><init>(Ljava/lang/Throwable;)V

    throw p2
.end method
