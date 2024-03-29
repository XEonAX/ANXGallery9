.class public Lorg/keyczar/RsaPublicKey;
.super Lorg/keyczar/KeyczarPublicKey;
.source "RsaPublicKey.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/keyczar/RsaPublicKey$RsaStream;
    }
.end annotation


# static fields
.field private static final KEY_GEN_ALGORITHM:Ljava/lang/String; = "RSA"

.field private static final SIG_ALGORITHM:Ljava/lang/String; = "SHA1withRSA"


# instance fields
.field private final hash:[B

.field private jcePublicKey:Ljava/security/interfaces/RSAPublicKey;

.field final modulus:Ljava/lang/String;
    .annotation runtime Lcom/google/gson_nex/annotations/Expose;
    .end annotation
.end field

.field final padding:Lorg/keyczar/enums/RsaPadding;
    .annotation runtime Lcom/google/gson_nex/annotations/Expose;
    .end annotation
.end field

.field final publicExponent:Ljava/lang/String;
    .annotation runtime Lcom/google/gson_nex/annotations/Expose;
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/keyczar/KeyczarPublicKey;-><init>(I)V

    const/4 v0, 0x4

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/keyczar/RsaPublicKey;->hash:[B

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/keyczar/RsaPublicKey;->publicExponent:Ljava/lang/String;

    iput-object v0, p0, Lorg/keyczar/RsaPublicKey;->modulus:Ljava/lang/String;

    iput-object v0, p0, Lorg/keyczar/RsaPublicKey;->padding:Lorg/keyczar/enums/RsaPadding;

    return-void
.end method

.method private constructor <init>(Ljava/math/BigInteger;Ljava/math/BigInteger;Lorg/keyczar/enums/RsaPadding;)V
    .locals 1

    invoke-virtual {p1}, Ljava/math/BigInteger;->bitLength()I

    move-result v0

    invoke-direct {p0, v0}, Lorg/keyczar/KeyczarPublicKey;-><init>(I)V

    const/4 v0, 0x4

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/keyczar/RsaPublicKey;->hash:[B

    invoke-static {p1}, Lorg/keyczar/util/Util;->encodeBigInteger(Ljava/math/BigInteger;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/keyczar/RsaPublicKey;->modulus:Ljava/lang/String;

    invoke-static {p2}, Lorg/keyczar/util/Util;->encodeBigInteger(Ljava/math/BigInteger;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/keyczar/RsaPublicKey;->publicExponent:Ljava/lang/String;

    sget-object p1, Lorg/keyczar/enums/RsaPadding;->PKCS:Lorg/keyczar/enums/RsaPadding;

    if-ne p3, p1, :cond_0

    sget-object p1, Lorg/keyczar/enums/RsaPadding;->PKCS:Lorg/keyczar/enums/RsaPadding;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-object p1, p0, Lorg/keyczar/RsaPublicKey;->padding:Lorg/keyczar/enums/RsaPadding;

    return-void
.end method

.method constructor <init>(Ljava/security/interfaces/RSAPrivateCrtKey;Lorg/keyczar/enums/RsaPadding;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    invoke-interface {p1}, Ljava/security/interfaces/RSAPrivateCrtKey;->getModulus()Ljava/math/BigInteger;

    move-result-object v0

    invoke-interface {p1}, Ljava/security/interfaces/RSAPrivateCrtKey;->getPublicExponent()Ljava/math/BigInteger;

    move-result-object v1

    invoke-direct {p0, v0, v1, p2}, Lorg/keyczar/RsaPublicKey;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;Lorg/keyczar/enums/RsaPadding;)V

    invoke-interface {p1}, Ljava/security/interfaces/RSAPrivateCrtKey;->getModulus()Ljava/math/BigInteger;

    move-result-object p2

    invoke-interface {p1}, Ljava/security/interfaces/RSAPrivateCrtKey;->getPublicExponent()Ljava/math/BigInteger;

    move-result-object p1

    invoke-direct {p0, p2, p1}, Lorg/keyczar/RsaPublicKey;->initializeJceKey(Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    invoke-direct {p0}, Lorg/keyczar/RsaPublicKey;->initializeHash()V

    return-void
.end method

.method constructor <init>(Ljava/security/interfaces/RSAPublicKey;Lorg/keyczar/enums/RsaPadding;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    invoke-interface {p1}, Ljava/security/interfaces/RSAPublicKey;->getModulus()Ljava/math/BigInteger;

    move-result-object v0

    invoke-interface {p1}, Ljava/security/interfaces/RSAPublicKey;->getPublicExponent()Ljava/math/BigInteger;

    move-result-object v1

    invoke-direct {p0, v0, v1, p2}, Lorg/keyczar/RsaPublicKey;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;Lorg/keyczar/enums/RsaPadding;)V

    iput-object p1, p0, Lorg/keyczar/RsaPublicKey;->jcePublicKey:Ljava/security/interfaces/RSAPublicKey;

    invoke-direct {p0}, Lorg/keyczar/RsaPublicKey;->initializeHash()V

    return-void
.end method

.method static synthetic access$000(Lorg/keyczar/RsaPublicKey;)Ljava/security/interfaces/RSAPublicKey;
    .locals 0

    iget-object p0, p0, Lorg/keyczar/RsaPublicKey;->jcePublicKey:Ljava/security/interfaces/RSAPublicKey;

    return-object p0
.end method

.method private initializeHash()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    invoke-virtual {p0}, Lorg/keyczar/RsaPublicKey;->getPadding()Lorg/keyczar/enums/RsaPadding;

    move-result-object v0

    iget-object v1, p0, Lorg/keyczar/RsaPublicKey;->jcePublicKey:Ljava/security/interfaces/RSAPublicKey;

    invoke-virtual {v0, v1}, Lorg/keyczar/enums/RsaPadding;->computeFullHash(Ljava/security/interfaces/RSAPublicKey;)[B

    move-result-object v0

    iget-object v1, p0, Lorg/keyczar/RsaPublicKey;->hash:[B

    iget-object v2, p0, Lorg/keyczar/RsaPublicKey;->hash:[B

    array-length v2, v2

    const/4 v3, 0x0

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-void
.end method

.method private initializeJceKey(Ljava/math/BigInteger;Ljava/math/BigInteger;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    :try_start_0
    new-instance v0, Ljava/security/spec/RSAPublicKeySpec;

    invoke-direct {v0, p1, p2}, Ljava/security/spec/RSAPublicKeySpec;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    const-string p1, "RSA"

    invoke-static {p1}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/security/KeyFactory;->generatePublic(Ljava/security/spec/KeySpec;)Ljava/security/PublicKey;

    move-result-object p1

    check-cast p1, Ljava/security/interfaces/RSAPublicKey;

    iput-object p1, p0, Lorg/keyczar/RsaPublicKey;->jcePublicKey:Ljava/security/interfaces/RSAPublicKey;
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    new-instance p2, Lorg/keyczar/exceptions/KeyczarException;

    invoke-direct {p2, p1}, Lorg/keyczar/exceptions/KeyczarException;-><init>(Ljava/lang/Throwable;)V

    throw p2
.end method

.method static read(Ljava/lang/String;)Lorg/keyczar/RsaPublicKey;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    invoke-static {}, Lorg/keyczar/util/Util;->gson()Lcom/google/gson_nex/Gson;

    move-result-object v0

    const-class v1, Lorg/keyczar/RsaPublicKey;

    invoke-virtual {v0, p0, v1}, Lcom/google/gson_nex/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/keyczar/RsaPublicKey;

    invoke-virtual {p0}, Lorg/keyczar/RsaPublicKey;->getType()Lorg/keyczar/interfaces/KeyType;

    move-result-object v0

    sget-object v1, Lorg/keyczar/DefaultKeyType;->RSA_PUB:Lorg/keyczar/DefaultKeyType;

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Lorg/keyczar/RsaPublicKey;->initFromJson()Lorg/keyczar/RsaPublicKey;

    move-result-object p0

    return-object p0

    :cond_0
    new-instance v0, Lorg/keyczar/exceptions/UnsupportedTypeException;

    invoke-virtual {p0}, Lorg/keyczar/RsaPublicKey;->getType()Lorg/keyczar/interfaces/KeyType;

    move-result-object p0

    invoke-direct {v0, p0}, Lorg/keyczar/exceptions/UnsupportedTypeException;-><init>(Lorg/keyczar/interfaces/KeyType;)V

    throw v0
.end method


# virtual methods
.method protected bridge synthetic getJceKey()Ljava/security/Key;
    .locals 1

    invoke-virtual {p0}, Lorg/keyczar/RsaPublicKey;->getJceKey()Ljava/security/interfaces/RSAPublicKey;

    move-result-object v0

    return-object v0
.end method

.method protected getJceKey()Ljava/security/interfaces/RSAPublicKey;
    .locals 1

    iget-object v0, p0, Lorg/keyczar/RsaPublicKey;->jcePublicKey:Ljava/security/interfaces/RSAPublicKey;

    return-object v0
.end method

.method public getPadding()Lorg/keyczar/enums/RsaPadding;
    .locals 2

    iget-object v0, p0, Lorg/keyczar/RsaPublicKey;->padding:Lorg/keyczar/enums/RsaPadding;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lorg/keyczar/RsaPublicKey;->padding:Lorg/keyczar/enums/RsaPadding;

    sget-object v1, Lorg/keyczar/enums/RsaPadding;->OAEP:Lorg/keyczar/enums/RsaPadding;

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    sget-object v0, Lorg/keyczar/enums/RsaPadding;->PKCS:Lorg/keyczar/enums/RsaPadding;

    return-object v0

    :cond_1
    :goto_0
    sget-object v0, Lorg/keyczar/enums/RsaPadding;->OAEP:Lorg/keyczar/enums/RsaPadding;

    return-object v0
.end method

.method protected getStream()Lorg/keyczar/interfaces/Stream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    new-instance v0, Lorg/keyczar/RsaPublicKey$RsaStream;

    invoke-direct {v0, p0}, Lorg/keyczar/RsaPublicKey$RsaStream;-><init>(Lorg/keyczar/RsaPublicKey;)V

    return-object v0
.end method

.method public getType()Lorg/keyczar/interfaces/KeyType;
    .locals 1

    sget-object v0, Lorg/keyczar/DefaultKeyType;->RSA_PUB:Lorg/keyczar/DefaultKeyType;

    return-object v0
.end method

.method public hash()[B
    .locals 1

    iget-object v0, p0, Lorg/keyczar/RsaPublicKey;->hash:[B

    return-object v0
.end method

.method initFromJson()Lorg/keyczar/RsaPublicKey;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    iget-object v0, p0, Lorg/keyczar/RsaPublicKey;->modulus:Ljava/lang/String;

    invoke-static {v0}, Lorg/keyczar/util/Util;->decodeBigInteger(Ljava/lang/String;)Ljava/math/BigInteger;

    move-result-object v0

    iget-object v1, p0, Lorg/keyczar/RsaPublicKey;->publicExponent:Ljava/lang/String;

    invoke-static {v1}, Lorg/keyczar/util/Util;->decodeBigInteger(Ljava/lang/String;)Ljava/math/BigInteger;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lorg/keyczar/RsaPublicKey;->initializeJceKey(Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    invoke-direct {p0}, Lorg/keyczar/RsaPublicKey;->initializeHash()V

    return-object p0
.end method

.method protected isSecret()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
