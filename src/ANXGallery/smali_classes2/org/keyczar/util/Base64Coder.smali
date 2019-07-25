.class public Lorg/keyczar/util/Base64Coder;
.super Ljava/lang/Object;
.source "Base64Coder.java"


# static fields
.field private static final ALPHABET:[C

.field private static final DECODE:[B

.field private static final WHITESPACE:[C


# direct methods
.method static constructor <clinit>()V
    .locals 5

    const/16 v0, 0x40

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lorg/keyczar/util/Base64Coder;->ALPHABET:[C

    const/16 v0, 0x80

    new-array v0, v0, [B

    sput-object v0, Lorg/keyczar/util/Base64Coder;->DECODE:[B

    const/4 v0, 0x5

    new-array v0, v0, [C

    fill-array-data v0, :array_1

    sput-object v0, Lorg/keyczar/util/Base64Coder;->WHITESPACE:[C

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    sget-object v2, Lorg/keyczar/util/Base64Coder;->DECODE:[B

    array-length v2, v2

    if-ge v1, v2, :cond_0

    sget-object v2, Lorg/keyczar/util/Base64Coder;->DECODE:[B

    const/4 v3, -0x1

    aput-byte v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_1
    sget-object v2, Lorg/keyczar/util/Base64Coder;->WHITESPACE:[C

    array-length v2, v2

    if-ge v1, v2, :cond_1

    sget-object v2, Lorg/keyczar/util/Base64Coder;->DECODE:[B

    sget-object v3, Lorg/keyczar/util/Base64Coder;->WHITESPACE:[C

    aget-char v3, v3, v1

    const/4 v4, -0x2

    aput-byte v4, v2, v3

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_1
    :goto_2
    sget-object v1, Lorg/keyczar/util/Base64Coder;->ALPHABET:[C

    array-length v1, v1

    if-ge v0, v1, :cond_2

    sget-object v1, Lorg/keyczar/util/Base64Coder;->DECODE:[B

    sget-object v2, Lorg/keyczar/util/Base64Coder;->ALPHABET:[C

    aget-char v2, v2, v0

    int-to-byte v3, v0

    aput-byte v3, v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_2
    return-void

    :array_0
    .array-data 2
        0x41s
        0x42s
        0x43s
        0x44s
        0x45s
        0x46s
        0x47s
        0x48s
        0x49s
        0x4as
        0x4bs
        0x4cs
        0x4ds
        0x4es
        0x4fs
        0x50s
        0x51s
        0x52s
        0x53s
        0x54s
        0x55s
        0x56s
        0x57s
        0x58s
        0x59s
        0x5as
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
        0x67s
        0x68s
        0x69s
        0x6as
        0x6bs
        0x6cs
        0x6ds
        0x6es
        0x6fs
        0x70s
        0x71s
        0x72s
        0x73s
        0x74s
        0x75s
        0x76s
        0x77s
        0x78s
        0x79s
        0x7as
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x2ds
        0x5fs
    .end array-data

    :array_1
    .array-data 2
        0x9s
        0xas
        0xds
        0x20s
        0xcs
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static decode(Ljava/lang/String;)[B
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/Base64DecodingException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-static {p0}, Lorg/keyczar/util/Base64Coder;->decodeWebSafe(Ljava/lang/String;)[B

    move-result-object p0

    return-object p0
.end method

.method public static decodeMime(Ljava/lang/String;)[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/Base64DecodingException;
        }
    .end annotation

    const/16 v0, 0x2b

    const/16 v1, 0x2d

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    const/16 v0, 0x2f

    const/16 v1, 0x5f

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lorg/keyczar/util/Base64Coder;->decodeWebSafe(Ljava/lang/String;)[B

    move-result-object p0

    return-object p0
.end method

.method public static decodeWebSafe(Ljava/lang/String;)[B
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/Base64DecodingException;
        }
    .end annotation

    invoke-virtual {p0}, Ljava/lang/String;->toCharArray()[C

    move-result-object p0

    array-length v0, p0

    add-int/lit8 v1, v0, -0x1

    aget-char v1, p0, v1

    const/16 v2, 0x3d

    if-ne v1, v2, :cond_0

    add-int/lit8 v0, v0, -0x1

    :cond_0
    add-int/lit8 v1, v0, -0x1

    aget-char v1, p0, v1

    if-ne v1, v2, :cond_1

    add-int/lit8 v0, v0, -0x1

    :cond_1
    array-length v1, p0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v3, v1, :cond_3

    aget-char v5, p0, v3

    invoke-static {v5}, Lorg/keyczar/util/Base64Coder;->isWhiteSpace(I)Z

    move-result v5

    if-eqz v5, :cond_2

    add-int/lit8 v4, v4, 0x1

    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_3
    sub-int/2addr v0, v4

    div-int/lit8 v1, v0, 0x4

    rem-int/lit8 v3, v0, 0x4

    mul-int/lit8 v1, v1, 0x3

    packed-switch v3, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    add-int/lit8 v1, v1, 0x2

    goto :goto_1

    :pswitch_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :pswitch_2
    new-instance p0, Lorg/keyczar/exceptions/Base64DecodingException;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v1, v2

    const-string v0, "Base64Coder.IllegalLength"

    invoke-static {v0, v1}, Lorg/keyczar/i18n/Messages;->getString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/keyczar/exceptions/Base64DecodingException;-><init>(Ljava/lang/String;)V

    throw p0

    :goto_1
    new-array v1, v1, [B

    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    :goto_2
    add-int v8, v0, v4

    const/4 v9, 0x4

    if-ge v3, v8, :cond_6

    aget-char v8, p0, v3

    invoke-static {v8}, Lorg/keyczar/util/Base64Coder;->isWhiteSpace(I)Z

    move-result v8

    if-nez v8, :cond_4

    shl-int/lit8 v6, v6, 0x6

    aget-char v8, p0, v3

    invoke-static {v8}, Lorg/keyczar/util/Base64Coder;->getByte(I)B

    move-result v8

    or-int/2addr v6, v8

    add-int/lit8 v5, v5, 0x1

    :cond_4
    if-ne v5, v9, :cond_5

    add-int/lit8 v5, v7, 0x1

    shr-int/lit8 v8, v6, 0x10

    int-to-byte v8, v8

    aput-byte v8, v1, v7

    add-int/lit8 v7, v5, 0x1

    shr-int/lit8 v8, v6, 0x8

    int-to-byte v8, v8

    aput-byte v8, v1, v5

    add-int/lit8 v5, v7, 0x1

    int-to-byte v6, v6

    aput-byte v6, v1, v7

    move v7, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    :cond_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_6
    packed-switch v5, :pswitch_data_1

    goto :goto_3

    :pswitch_3
    add-int/lit8 p0, v7, 0x1

    shr-int/lit8 v0, v6, 0xa

    int-to-byte v0, v0

    aput-byte v0, v1, v7

    shr-int/lit8 v0, v6, 0x2

    int-to-byte v0, v0

    aput-byte v0, v1, p0

    goto :goto_3

    :pswitch_4
    shr-int/lit8 p0, v6, 0x4

    int-to-byte p0, p0

    aput-byte p0, v1, v7

    :goto_3
    return-object v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x2
        :pswitch_4
        :pswitch_3
    .end packed-switch
.end method

.method public static encode([B)Ljava/lang/String;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-static {p0}, Lorg/keyczar/util/Base64Coder;->encodeWebSafe([B)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static encodeMime([BZ)Ljava/lang/String;
    .locals 1

    invoke-static {p0}, Lorg/keyczar/util/Base64Coder;->encodeWebSafe([B)Ljava/lang/String;

    move-result-object p0

    const/16 p1, 0x2d

    const/16 v0, 0x2b

    invoke-virtual {p0, p1, v0}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    const/16 p1, 0x5f

    const/16 v0, 0x2f

    invoke-virtual {p0, p1, v0}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p1

    rem-int/lit8 p1, p1, 0x4

    if-eqz p1, :cond_0

    packed-switch p1, :pswitch_data_0

    new-instance p0, Ljava/lang/RuntimeException;

    const-string p1, "Bug in Base64 encoder"

    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0

    :pswitch_0
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "="

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_1
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "=="

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    return-object p0

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static encodeWebSafe([B)Ljava/lang/String;
    .locals 10

    array-length v0, p0

    div-int/lit8 v0, v0, 0x3

    array-length v1, p0

    rem-int/lit8 v1, v1, 0x3

    mul-int/lit8 v2, v0, 0x4

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    add-int/lit8 v2, v2, 0x3

    goto :goto_0

    :pswitch_1
    add-int/lit8 v2, v2, 0x2

    :goto_0
    new-array v2, v2, [C

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_1
    if-ge v3, v0, :cond_0

    add-int/lit8 v6, v4, 0x1

    aget-byte v4, p0, v4

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0x10

    add-int/lit8 v7, v6, 0x1

    aget-byte v6, p0, v6

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x8

    or-int/2addr v4, v6

    add-int/lit8 v6, v7, 0x1

    aget-byte v7, p0, v7

    and-int/lit16 v7, v7, 0xff

    or-int/2addr v4, v7

    add-int/lit8 v7, v5, 0x1

    sget-object v8, Lorg/keyczar/util/Base64Coder;->ALPHABET:[C

    shr-int/lit8 v9, v4, 0x12

    and-int/lit8 v9, v9, 0x3f

    aget-char v8, v8, v9

    aput-char v8, v2, v5

    add-int/lit8 v5, v7, 0x1

    sget-object v8, Lorg/keyczar/util/Base64Coder;->ALPHABET:[C

    shr-int/lit8 v9, v4, 0xc

    and-int/lit8 v9, v9, 0x3f

    aget-char v8, v8, v9

    aput-char v8, v2, v7

    add-int/lit8 v7, v5, 0x1

    sget-object v8, Lorg/keyczar/util/Base64Coder;->ALPHABET:[C

    shr-int/lit8 v9, v4, 0x6

    and-int/lit8 v9, v9, 0x3f

    aget-char v8, v8, v9

    aput-char v8, v2, v5

    add-int/lit8 v5, v7, 0x1

    sget-object v8, Lorg/keyczar/util/Base64Coder;->ALPHABET:[C

    and-int/lit8 v4, v4, 0x3f

    aget-char v4, v8, v4

    aput-char v4, v2, v7

    add-int/lit8 v3, v3, 0x1

    move v4, v6

    goto :goto_1

    :cond_0
    if-lez v1, :cond_2

    add-int/lit8 v0, v4, 0x1

    aget-byte v3, p0, v4

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x10

    const/4 v4, 0x2

    if-ne v1, v4, :cond_1

    aget-byte p0, p0, v0

    and-int/lit16 p0, p0, 0xff

    shl-int/lit8 p0, p0, 0x8

    or-int/2addr v3, p0

    :cond_1
    add-int/lit8 p0, v5, 0x1

    sget-object v0, Lorg/keyczar/util/Base64Coder;->ALPHABET:[C

    shr-int/lit8 v6, v3, 0x12

    and-int/lit8 v6, v6, 0x3f

    aget-char v0, v0, v6

    aput-char v0, v2, v5

    add-int/lit8 v0, p0, 0x1

    sget-object v5, Lorg/keyczar/util/Base64Coder;->ALPHABET:[C

    shr-int/lit8 v6, v3, 0xc

    and-int/lit8 v6, v6, 0x3f

    aget-char v5, v5, v6

    aput-char v5, v2, p0

    if-ne v1, v4, :cond_2

    sget-object p0, Lorg/keyczar/util/Base64Coder;->ALPHABET:[C

    shr-int/lit8 v1, v3, 0x6

    and-int/lit8 v1, v1, 0x3f

    aget-char p0, p0, v1

    aput-char p0, v2, v0

    :cond_2
    new-instance p0, Ljava/lang/String;

    invoke-direct {p0, v2}, Ljava/lang/String;-><init>([C)V

    return-object p0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static getByte(I)B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/keyczar/exceptions/Base64DecodingException;
        }
    .end annotation

    if-ltz p0, :cond_0

    const/16 v0, 0x7f

    if-gt p0, v0, :cond_0

    sget-object v0, Lorg/keyczar/util/Base64Coder;->DECODE:[B

    aget-byte v0, v0, p0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    sget-object v0, Lorg/keyczar/util/Base64Coder;->DECODE:[B

    aget-byte p0, v0, p0

    return p0

    :cond_0
    new-instance v0, Lorg/keyczar/exceptions/Base64DecodingException;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    aput-object p0, v1, v2

    const-string p0, "Base64Coder.IllegalCharacter"

    invoke-static {p0, v1}, Lorg/keyczar/i18n/Messages;->getString(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lorg/keyczar/exceptions/Base64DecodingException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static isWhiteSpace(I)Z
    .locals 1

    sget-object v0, Lorg/keyczar/util/Base64Coder;->DECODE:[B

    aget-byte p0, v0, p0

    const/4 v0, -0x2

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method
