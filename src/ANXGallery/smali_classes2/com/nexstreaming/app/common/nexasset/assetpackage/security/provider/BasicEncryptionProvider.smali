.class public Lcom/nexstreaming/app/common/nexasset/assetpackage/security/provider/BasicEncryptionProvider;
.super Ljava/lang/Object;
.source "BasicEncryptionProvider.java"

# interfaces
.implements Lcom/nexstreaming/app/common/nexasset/assetpackage/security/b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nexstreaming/app/common/nexasset/assetpackage/security/provider/BasicEncryptionProvider$ProviderSpecificDataJSON;
    }
.end annotation


# instance fields
.field private final a:[I

.field private final b:[Ljava/lang/String;

.field private c:Lorg/keyczar/interfaces/KeyczarReader;


# direct methods
.method public constructor <init>([I[Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/nexstreaming/app/common/nexasset/assetpackage/security/provider/BasicEncryptionProvider$1;

    invoke-direct {v0, p0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/security/provider/BasicEncryptionProvider$1;-><init>(Lcom/nexstreaming/app/common/nexasset/assetpackage/security/provider/BasicEncryptionProvider;)V

    iput-object v0, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/security/provider/BasicEncryptionProvider;->c:Lorg/keyczar/interfaces/KeyczarReader;

    iput-object p1, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/security/provider/BasicEncryptionProvider;->a:[I

    iput-object p2, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/security/provider/BasicEncryptionProvider;->b:[Ljava/lang/String;

    return-void
.end method

.method private a(Ljava/lang/String;II)I
    .locals 4

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge p2, p3, :cond_3

    if-ge p2, v0, :cond_3

    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    mul-int/lit8 v1, v1, 0x10

    const/16 v3, 0x30

    if-lt v2, v3, :cond_0

    const/16 v3, 0x39

    if-gt v2, v3, :cond_0

    add-int/lit8 v2, v2, -0x30

    add-int/2addr v1, v2

    goto :goto_1

    :cond_0
    const/16 v3, 0x61

    if-lt v2, v3, :cond_1

    const/16 v3, 0x66

    if-gt v2, v3, :cond_1

    add-int/lit8 v2, v2, -0x61

    add-int/lit8 v2, v2, 0xa

    add-int/2addr v1, v2

    goto :goto_1

    :cond_1
    const/16 v3, 0x41

    if-lt v2, v3, :cond_2

    const/16 v3, 0x46

    if-gt v2, v3, :cond_2

    add-int/lit8 v2, v2, -0x41

    add-int/lit8 v2, v2, 0xa

    add-int/2addr v1, v2

    :cond_2
    :goto_1
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_3
    return v1
.end method

.method private a(I)Ljava/lang/String;
    .locals 5

    iget-object v0, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/security/provider/BasicEncryptionProvider;->b:[Ljava/lang/String;

    aget-object p1, v0, p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-direct {p0, p1, v1, v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/security/provider/BasicEncryptionProvider;->a(Ljava/lang/String;II)I

    move-result v3

    xor-int/lit8 v3, v3, 0x20

    sub-int/2addr v0, v2

    div-int/2addr v0, v2

    new-array v0, v0, [B

    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    mul-int/lit8 v2, v1, 0x2

    add-int/lit8 v4, v2, 0x2

    add-int/lit8 v2, v2, 0x4

    invoke-direct {p0, p1, v4, v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/security/provider/BasicEncryptionProvider;->a(Ljava/lang/String;II)I

    move-result v2

    int-to-byte v2, v2

    shr-int/lit8 v4, v2, 0x4

    and-int/lit8 v4, v4, 0xf

    shl-int/lit8 v2, v2, 0x4

    and-int/lit16 v2, v2, 0xf0

    or-int/2addr v2, v4

    xor-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/String;

    invoke-direct {p1, v0}, Ljava/lang/String;-><init>([B)V

    return-object p1
.end method

.method static synthetic a(Lcom/nexstreaming/app/common/nexasset/assetpackage/security/provider/BasicEncryptionProvider;I)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/security/provider/BasicEncryptionProvider;->a(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    const-string p2, ":"

    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    const-string p2, "\""

    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p2

    add-int/lit8 p2, p2, 0x1

    invoke-virtual {p1, p2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    const-string p2, "\""

    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p2

    const/4 v0, 0x0

    invoke-virtual {p1, v0, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private b(Ljava/lang/String;)Ljava/lang/String;
    .locals 9

    sget-object v0, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    const/16 v1, 0xee

    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    add-int/lit8 v0, v0, 0x11

    const-string v1, "%02X"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    xor-int/lit8 v4, v0, 0x20

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    array-length v3, p1

    move-object v4, v1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v3, :cond_0

    aget-byte v6, p1, v1

    xor-int/2addr v6, v0

    int-to-byte v6, v6

    shr-int/lit8 v7, v6, 0x4

    and-int/lit8 v7, v7, 0xf

    shl-int/lit8 v6, v6, 0x4

    and-int/lit16 v6, v6, 0xf0

    or-int/2addr v6, v7

    int-to-byte v6, v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "%02X"

    new-array v8, v2, [Ljava/lang/Object;

    invoke-static {v6}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v6

    aput-object v6, v8, v5

    invoke-static {v4, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v4
.end method


# virtual methods
.method public a(Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/assetpackage/security/a;
    .locals 2

    new-instance v0, Lcom/google/gson_nex/Gson;

    invoke-direct {v0}, Lcom/google/gson_nex/Gson;-><init>()V

    const-class v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/security/provider/BasicEncryptionProvider$ProviderSpecificDataJSON;

    invoke-virtual {v0, p1, v1}, Lcom/google/gson_nex/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/nexstreaming/app/common/nexasset/assetpackage/security/provider/BasicEncryptionProvider$ProviderSpecificDataJSON;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iget-object v1, p1, Lcom/nexstreaming/app/common/nexasset/assetpackage/security/provider/BasicEncryptionProvider$ProviderSpecificDataJSON;->f:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    iget p1, p1, Lcom/nexstreaming/app/common/nexasset/assetpackage/security/provider/BasicEncryptionProvider$ProviderSpecificDataJSON;->v:I

    :try_start_0
    new-instance p1, Lorg/keyczar/Crypter;

    iget-object v1, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/security/provider/BasicEncryptionProvider;->c:Lorg/keyczar/interfaces/KeyczarReader;

    invoke-direct {p1, v1}, Lorg/keyczar/Crypter;-><init>(Lorg/keyczar/interfaces/KeyczarReader;)V
    :try_end_0
    .catch Lorg/keyczar/exceptions/KeyczarException; {:try_start_0 .. :try_end_0} :catch_0

    new-instance v1, Lcom/nexstreaming/app/common/nexasset/assetpackage/security/provider/BasicEncryptionProvider$2;

    invoke-direct {v1, p0, v0, p1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/security/provider/BasicEncryptionProvider$2;-><init>(Lcom/nexstreaming/app/common/nexasset/assetpackage/security/provider/BasicEncryptionProvider;Ljava/util/Set;Lorg/keyczar/Crypter;)V

    return-object v1

    :catch_0
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1}, Ljava/lang/IllegalStateException;-><init>()V

    throw p1
.end method

.method public a()Ljava/lang/String;
    .locals 3

    iget-object v0, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/security/provider/BasicEncryptionProvider;->a:[I

    array-length v0, v0

    new-array v0, v0, [C

    const/4 v1, 0x0

    :goto_0
    iget-object v2, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/security/provider/BasicEncryptionProvider;->a:[I

    array-length v2, v2

    if-ge v1, v2, :cond_0

    iget-object v2, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/security/provider/BasicEncryptionProvider;->a:[I

    aget v2, v2, v1

    xor-int/lit8 v2, v2, 0x5a

    int-to-char v2, v2

    aput-char v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1, v0}, Ljava/lang/String;-><init>([C)V

    return-object v1
.end method

.method public b()[Ljava/lang/String;
    .locals 8

    const/16 v0, 0xc

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    const/4 v3, 0x6

    if-ge v1, v3, :cond_2

    :try_start_0
    iget-object v3, p0, Lcom/nexstreaming/app/common/nexasset/assetpackage/security/provider/BasicEncryptionProvider;->c:Lorg/keyczar/interfaces/KeyczarReader;

    add-int/lit8 v1, v1, 0x1

    invoke-interface {v3, v1}, Lorg/keyczar/interfaces/KeyczarReader;->getKey(I)Ljava/lang/String;

    move-result-object v3
    :try_end_0
    .catch Lorg/keyczar/exceptions/KeyczarException; {:try_start_0 .. :try_end_0} :catch_0

    const-string v4, "hmacKeyString"

    invoke-direct {p0, v3, v4}, Lcom/nexstreaming/app/common/nexasset/assetpackage/security/provider/BasicEncryptionProvider;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    const/16 v6, 0x10

    if-le v5, v6, :cond_0

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    sub-int/2addr v5, v6

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {v4, v5, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    :cond_0
    add-int/lit8 v5, v2, 0x1

    invoke-direct {p0, v4}, Lcom/nexstreaming/app/common/nexasset/assetpackage/security/provider/BasicEncryptionProvider;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v0, v2

    const-string v2, "aesKeyString"

    invoke-direct {p0, v3, v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/security/provider/BasicEncryptionProvider;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-le v3, v6, :cond_1

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    sub-int/2addr v3, v6

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    :cond_1
    add-int/lit8 v3, v5, 0x1

    invoke-direct {p0, v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/security/provider/BasicEncryptionProvider;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v5

    move v2, v3

    goto :goto_0

    :catch_0
    :cond_2
    return-object v0
.end method
