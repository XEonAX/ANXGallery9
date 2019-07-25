.class public final enum Lorg/keyczar/enums/RsaPadding;
.super Ljava/lang/Enum;
.source "RsaPadding.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/keyczar/enums/RsaPadding;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/keyczar/enums/RsaPadding;

.field public static final enum OAEP:Lorg/keyczar/enums/RsaPadding;

.field public static final enum PKCS:Lorg/keyczar/enums/RsaPadding;


# instance fields
.field private final cryptAlgorithm:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    new-instance v0, Lorg/keyczar/enums/RsaPadding;

    const-string v1, "OAEP"

    const-string v2, "RSA/ECB/OAEPWITHSHA1ANDMGF1PADDING"

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3, v2}, Lorg/keyczar/enums/RsaPadding;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/keyczar/enums/RsaPadding;->OAEP:Lorg/keyczar/enums/RsaPadding;

    new-instance v0, Lorg/keyczar/enums/RsaPadding;

    const-string v1, "PKCS"

    const-string v2, "RSA/ECB/PKCS1PADDING"

    const/4 v4, 0x1

    invoke-direct {v0, v1, v4, v2}, Lorg/keyczar/enums/RsaPadding;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lorg/keyczar/enums/RsaPadding;->PKCS:Lorg/keyczar/enums/RsaPadding;

    const/4 v0, 0x2

    new-array v0, v0, [Lorg/keyczar/enums/RsaPadding;

    sget-object v1, Lorg/keyczar/enums/RsaPadding;->OAEP:Lorg/keyczar/enums/RsaPadding;

    aput-object v1, v0, v3

    sget-object v1, Lorg/keyczar/enums/RsaPadding;->PKCS:Lorg/keyczar/enums/RsaPadding;

    aput-object v1, v0, v4

    sput-object v0, Lorg/keyczar/enums/RsaPadding;->$VALUES:[Lorg/keyczar/enums/RsaPadding;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput-object p3, p0, Lorg/keyczar/enums/RsaPadding;->cryptAlgorithm:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/keyczar/enums/RsaPadding;
    .locals 1

    const-class v0, Lorg/keyczar/enums/RsaPadding;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lorg/keyczar/enums/RsaPadding;

    return-object p0
.end method

.method public static values()[Lorg/keyczar/enums/RsaPadding;
    .locals 1

    sget-object v0, Lorg/keyczar/enums/RsaPadding;->$VALUES:[Lorg/keyczar/enums/RsaPadding;

    invoke-virtual {v0}, [Lorg/keyczar/enums/RsaPadding;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/keyczar/enums/RsaPadding;

    return-object v0
.end method


# virtual methods
.method public computeFullHash(Ljava/security/interfaces/RSAPublicKey;)[B
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/KeyczarException;
        }
    .end annotation

    sget-object v0, Lorg/keyczar/enums/RsaPadding$1;->$SwitchMap$org$keyczar$enums$RsaPadding:[I

    invoke-virtual {p0}, Lorg/keyczar/enums/RsaPadding;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x2

    packed-switch v0, :pswitch_data_0

    new-instance p1, Lorg/keyczar/exceptions/KeyczarException;

    const-string v0, "Bug! Unknown padding type"

    invoke-direct {p1, v0}, Lorg/keyczar/exceptions/KeyczarException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_0
    new-array v0, v3, [[B

    invoke-interface {p1}, Ljava/security/interfaces/RSAPublicKey;->getModulus()Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v3}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v3

    aput-object v3, v0, v2

    invoke-interface {p1}, Ljava/security/interfaces/RSAPublicKey;->getPublicExponent()Ljava/math/BigInteger;

    move-result-object p1

    invoke-virtual {p1}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object p1

    aput-object p1, v0, v1

    invoke-static {v0}, Lorg/keyczar/util/Util;->prefixHash([[B)[B

    move-result-object p1

    return-object p1

    :pswitch_1
    new-array v0, v3, [[B

    invoke-interface {p1}, Ljava/security/interfaces/RSAPublicKey;->getModulus()Ljava/math/BigInteger;

    move-result-object v3

    invoke-virtual {v3}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v3

    invoke-static {v3}, Lorg/keyczar/util/Util;->stripLeadingZeros([B)[B

    move-result-object v3

    aput-object v3, v0, v2

    invoke-interface {p1}, Ljava/security/interfaces/RSAPublicKey;->getPublicExponent()Ljava/math/BigInteger;

    move-result-object p1

    invoke-virtual {p1}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object p1

    invoke-static {p1}, Lorg/keyczar/util/Util;->stripLeadingZeros([B)[B

    move-result-object p1

    aput-object p1, v0, v1

    invoke-static {v0}, Lorg/keyczar/util/Util;->prefixHash([[B)[B

    move-result-object p1

    return-object p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getCryptAlgorithm()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lorg/keyczar/enums/RsaPadding;->cryptAlgorithm:Ljava/lang/String;

    return-object v0
.end method
