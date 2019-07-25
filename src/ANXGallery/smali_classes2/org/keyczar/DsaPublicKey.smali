.class public Lorg/keyczar/DsaPublicKey;
.super Lorg/keyczar/KeyczarPublicKey;
.source "DsaPublicKey.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/keyczar/DsaPublicKey$DsaVerifyingStream;
    }
.end annotation


# static fields
.field private static final KEY_GEN_ALGORITHM:Ljava/lang/String; = "DSA"

.field private static final SIG_ALGORITHM:Ljava/lang/String; = "SHA1withDSA"


# instance fields
.field final g:Ljava/lang/String;
    .annotation runtime Lcom/google/gson_nex/annotations/Expose;
    .end annotation
.end field

.field private final hash:[B

.field private jcePublicKey:Ljava/security/interfaces/DSAPublicKey;

.field final p:Ljava/lang/String;
    .annotation runtime Lcom/google/gson_nex/annotations/Expose;
    .end annotation
.end field

.field final q:Ljava/lang/String;
    .annotation runtime Lcom/google/gson_nex/annotations/Expose;
    .end annotation
.end field

.field final y:Ljava/lang/String;
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

    iput-object v0, p0, Lorg/keyczar/DsaPublicKey;->hash:[B

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/keyczar/DsaPublicKey;->jcePublicKey:Ljava/security/interfaces/DSAPublicKey;

    iput-object v0, p0, Lorg/keyczar/DsaPublicKey;->g:Ljava/lang/String;

    iput-object v0, p0, Lorg/keyczar/DsaPublicKey;->q:Ljava/lang/String;

    iput-object v0, p0, Lorg/keyczar/DsaPublicKey;->p:Ljava/lang/String;

    iput-object v0, p0, Lorg/keyczar/DsaPublicKey;->y:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Ljava/math/BigInteger;Ljava/security/interfaces/DSAParams;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/math/BigInteger;->bitLength()I

    move-result v0

    invoke-direct {p0, v0}, Lorg/keyczar/KeyczarPublicKey;-><init>(I)V

    const/4 v0, 0x4

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/keyczar/DsaPublicKey;->hash:[B

    invoke-interface {p2}, Ljava/security/interfaces/DSAParams;->getP()Ljava/math/BigInteger;

    move-result-object v0

    invoke-interface {p2}, Ljava/security/interfaces/DSAParams;->getQ()Ljava/math/BigInteger;

    move-result-object v1

    invoke-interface {p2}, Ljava/security/interfaces/DSAParams;->getG()Ljava/math/BigInteger;

    move-result-object p2

    invoke-virtual {p1}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v2

    invoke-static {v2}, Lorg/keyczar/util/Base64Coder;->encodeWebSafe([B)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/keyczar/DsaPublicKey;->y:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v2

    invoke-static {v2}, Lorg/keyczar/util/Base64Coder;->encodeWebSafe([B)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/keyczar/DsaPublicKey;->p:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v2

    invoke-static {v2}, Lorg/keyczar/util/Base64Coder;->encodeWebSafe([B)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/keyczar/DsaPublicKey;->q:Ljava/lang/String;

    invoke-virtual {p2}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v2

    invoke-static {v2}, Lorg/keyczar/util/Base64Coder;->encodeWebSafe([B)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lorg/keyczar/DsaPublicKey;->g:Ljava/lang/String;

    invoke-direct {p0, p1, v0, v1, p2}, Lorg/keyczar/DsaPublicKey;->initializeJceKey(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    invoke-direct {p0}, Lorg/keyczar/DsaPublicKey;->initializeHash()V

    return-void
.end method

.method constructor <init>(Ljava/security/interfaces/DSAPrivateKey;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    invoke-static {p1}, Lorg/keyczar/DsaPublicKey;->computeY(Ljava/security/interfaces/DSAPrivateKey;)Ljava/math/BigInteger;

    move-result-object v0

    invoke-interface {p1}, Ljava/security/interfaces/DSAPrivateKey;->getParams()Ljava/security/interfaces/DSAParams;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lorg/keyczar/DsaPublicKey;-><init>(Ljava/math/BigInteger;Ljava/security/interfaces/DSAParams;)V

    return-void
.end method

.method constructor <init>(Ljava/security/interfaces/DSAPublicKey;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    invoke-interface {p1}, Ljava/security/interfaces/DSAPublicKey;->getY()Ljava/math/BigInteger;

    move-result-object v0

    invoke-interface {p1}, Ljava/security/interfaces/DSAPublicKey;->getParams()Ljava/security/interfaces/DSAParams;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lorg/keyczar/DsaPublicKey;-><init>(Ljava/math/BigInteger;Ljava/security/interfaces/DSAParams;)V

    return-void
.end method

.method static synthetic access$000(Lorg/keyczar/DsaPublicKey;)Ljava/security/interfaces/DSAPublicKey;
    .locals 0

    iget-object p0, p0, Lorg/keyczar/DsaPublicKey;->jcePublicKey:Ljava/security/interfaces/DSAPublicKey;

    return-object p0
.end method

.method private static computeY(Ljava/security/interfaces/DSAPrivateKey;)Ljava/math/BigInteger;
    .locals 2

    invoke-interface {p0}, Ljava/security/interfaces/DSAPrivateKey;->getParams()Ljava/security/interfaces/DSAParams;

    move-result-object v0

    invoke-interface {v0}, Ljava/security/interfaces/DSAParams;->getP()Ljava/math/BigInteger;

    move-result-object v0

    invoke-interface {p0}, Ljava/security/interfaces/DSAPrivateKey;->getParams()Ljava/security/interfaces/DSAParams;

    move-result-object v1

    invoke-interface {v1}, Ljava/security/interfaces/DSAParams;->getG()Ljava/math/BigInteger;

    move-result-object v1

    invoke-interface {p0}, Ljava/security/interfaces/DSAPrivateKey;->getX()Ljava/math/BigInteger;

    move-result-object p0

    invoke-virtual {v1, p0, v0}, Ljava/math/BigInteger;->modPow(Ljava/math/BigInteger;Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object p0

    return-object p0
.end method

.method private initializeHash()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    iget-object v0, p0, Lorg/keyczar/DsaPublicKey;->jcePublicKey:Ljava/security/interfaces/DSAPublicKey;

    invoke-interface {v0}, Ljava/security/interfaces/DSAPublicKey;->getParams()Ljava/security/interfaces/DSAParams;

    move-result-object v0

    const/4 v1, 0x4

    new-array v1, v1, [[B

    invoke-interface {v0}, Ljava/security/interfaces/DSAParams;->getP()Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v2}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v2

    invoke-static {v2}, Lorg/keyczar/util/Util;->stripLeadingZeros([B)[B

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-interface {v0}, Ljava/security/interfaces/DSAParams;->getQ()Ljava/math/BigInteger;

    move-result-object v2

    invoke-virtual {v2}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v2

    invoke-static {v2}, Lorg/keyczar/util/Util;->stripLeadingZeros([B)[B

    move-result-object v2

    const/4 v4, 0x1

    aput-object v2, v1, v4

    invoke-interface {v0}, Ljava/security/interfaces/DSAParams;->getG()Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v0

    invoke-static {v0}, Lorg/keyczar/util/Util;->stripLeadingZeros([B)[B

    move-result-object v0

    const/4 v2, 0x2

    aput-object v0, v1, v2

    iget-object v0, p0, Lorg/keyczar/DsaPublicKey;->jcePublicKey:Ljava/security/interfaces/DSAPublicKey;

    invoke-interface {v0}, Ljava/security/interfaces/DSAPublicKey;->getY()Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v0

    invoke-static {v0}, Lorg/keyczar/util/Util;->stripLeadingZeros([B)[B

    move-result-object v0

    const/4 v2, 0x3

    aput-object v0, v1, v2

    invoke-static {v1}, Lorg/keyczar/util/Util;->prefixHash([[B)[B

    move-result-object v0

    iget-object v1, p0, Lorg/keyczar/DsaPublicKey;->hash:[B

    iget-object v2, p0, Lorg/keyczar/DsaPublicKey;->hash:[B

    array-length v2, v2

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-void
.end method

.method private initializeJceKey(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    :try_start_0
    const-string v0, "DSA"

    invoke-static {v0}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    move-result-object v0

    new-instance v1, Ljava/security/spec/DSAPublicKeySpec;

    invoke-direct {v1, p1, p2, p3, p4}, Ljava/security/spec/DSAPublicKeySpec;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    invoke-virtual {v0, v1}, Ljava/security/KeyFactory;->generatePublic(Ljava/security/spec/KeySpec;)Ljava/security/PublicKey;

    move-result-object p1

    check-cast p1, Ljava/security/interfaces/DSAPublicKey;

    iput-object p1, p0, Lorg/keyczar/DsaPublicKey;->jcePublicKey:Ljava/security/interfaces/DSAPublicKey;
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    new-instance p2, Lorg/keyczar/exceptions/KeyczarException;

    invoke-direct {p2, p1}, Lorg/keyczar/exceptions/KeyczarException;-><init>(Ljava/lang/Throwable;)V

    throw p2
.end method

.method static read(Ljava/lang/String;)Lorg/keyczar/DsaPublicKey;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    invoke-static {}, Lorg/keyczar/util/Util;->gson()Lcom/google/gson_nex/Gson;

    move-result-object v0

    const-class v1, Lorg/keyczar/DsaPublicKey;

    invoke-virtual {v0, p0, v1}, Lcom/google/gson_nex/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/keyczar/DsaPublicKey;

    invoke-virtual {p0}, Lorg/keyczar/DsaPublicKey;->initFromJson()V

    return-object p0
.end method


# virtual methods
.method protected bridge synthetic getJceKey()Ljava/security/Key;
    .locals 1

    invoke-virtual {p0}, Lorg/keyczar/DsaPublicKey;->getJceKey()Ljava/security/PublicKey;

    move-result-object v0

    return-object v0
.end method

.method protected getJceKey()Ljava/security/PublicKey;
    .locals 1

    iget-object v0, p0, Lorg/keyczar/DsaPublicKey;->jcePublicKey:Ljava/security/interfaces/DSAPublicKey;

    return-object v0
.end method

.method protected getStream()Lorg/keyczar/interfaces/Stream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    new-instance v0, Lorg/keyczar/DsaPublicKey$DsaVerifyingStream;

    invoke-direct {v0, p0}, Lorg/keyczar/DsaPublicKey$DsaVerifyingStream;-><init>(Lorg/keyczar/DsaPublicKey;)V

    return-object v0
.end method

.method public getType()Lorg/keyczar/interfaces/KeyType;
    .locals 1

    sget-object v0, Lorg/keyczar/DefaultKeyType;->DSA_PUB:Lorg/keyczar/DefaultKeyType;

    return-object v0
.end method

.method public hash()[B
    .locals 1

    iget-object v0, p0, Lorg/keyczar/DsaPublicKey;->hash:[B

    return-object v0
.end method

.method initFromJson()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    new-instance v0, Ljava/math/BigInteger;

    iget-object v1, p0, Lorg/keyczar/DsaPublicKey;->y:Ljava/lang/String;

    invoke-static {v1}, Lorg/keyczar/util/Base64Coder;->decodeWebSafe(Ljava/lang/String;)[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/math/BigInteger;-><init>([B)V

    new-instance v1, Ljava/math/BigInteger;

    iget-object v2, p0, Lorg/keyczar/DsaPublicKey;->p:Ljava/lang/String;

    invoke-static {v2}, Lorg/keyczar/util/Base64Coder;->decodeWebSafe(Ljava/lang/String;)[B

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/math/BigInteger;-><init>([B)V

    new-instance v2, Ljava/math/BigInteger;

    iget-object v3, p0, Lorg/keyczar/DsaPublicKey;->q:Ljava/lang/String;

    invoke-static {v3}, Lorg/keyczar/util/Base64Coder;->decodeWebSafe(Ljava/lang/String;)[B

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/math/BigInteger;-><init>([B)V

    new-instance v3, Ljava/math/BigInteger;

    iget-object v4, p0, Lorg/keyczar/DsaPublicKey;->g:Ljava/lang/String;

    invoke-static {v4}, Lorg/keyczar/util/Base64Coder;->decodeWebSafe(Ljava/lang/String;)[B

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/math/BigInteger;-><init>([B)V

    invoke-direct {p0, v0, v1, v2, v3}, Lorg/keyczar/DsaPublicKey;->initializeJceKey(Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    invoke-direct {p0}, Lorg/keyczar/DsaPublicKey;->initializeHash()V

    return-void
.end method

.method protected isSecret()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
