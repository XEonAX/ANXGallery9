.class public Lcom/nexstreaming/app/common/nexasset/store/AssetStoreClient;
.super Ljava/lang/Object;
.source "AssetStoreClient.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "AssetStoreClient"

.field private static cipher:Lcom/nexstreaming/app/common/localprotocol/a; = null

.field private static m_configLock:Ljava/lang/Object; = null

.field public static final none:Ljava/lang/String; = "nonedata"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/nexstreaming/app/common/nexasset/store/AssetStoreClient;->m_configLock:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static getDataSync2([Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)I
    .locals 8

    sget-object v0, Lcom/nexstreaming/app/common/nexasset/store/AssetStoreClient;->cipher:Lcom/nexstreaming/app/common/localprotocol/a;

    const/4 v1, -0x1

    if-nez v0, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x0

    new-instance v2, Ljava/security/SecureRandom;

    invoke-direct {v2}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {v2}, Ljava/security/SecureRandom;->nextInt()I

    move-result v2

    sget-object v3, Lcom/nexstreaming/app/common/nexasset/store/AssetStoreClient;->cipher:Lcom/nexstreaming/app/common/localprotocol/a;

    invoke-virtual {v3}, Lcom/nexstreaming/app/common/localprotocol/a;->b()[B

    move-result-object v3

    invoke-static {v3, v2}, Lcom/nexstreaming/app/common/nexasset/store/AssetStoreSock;->Start([BI)Lcom/nexstreaming/app/common/localprotocol/c$a;

    move-result-object v3

    if-nez v3, :cond_1

    const-string p0, "AssetStoreClient"

    const-string p1, "start is null"

    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_1
    iget v4, v3, Lcom/nexstreaming/app/common/localprotocol/c$a;->f:I

    sget-object v5, Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;->OK:Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;

    invoke-virtual {v5}, Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;->getValue()I

    move-result v5

    if-eq v4, v5, :cond_2

    const-string p0, "AssetStoreClient"

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "start is error="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p2, v3, Lcom/nexstreaming/app/common/localprotocol/c$a;->f:I

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_2
    iget-object v4, v3, Lcom/nexstreaming/app/common/localprotocol/c$a;->a:[B

    invoke-static {v4}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v5

    xor-int/2addr v2, v5

    const-string v5, "AssetStoreClient"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "newSSID="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v3, v3, Lcom/nexstreaming/app/common/localprotocol/c$a;->a:[B

    array-length v3, v3

    add-int/lit8 v3, v3, -0x4

    new-array v3, v3, [B

    invoke-virtual {v4, v3}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    const-string v4, "AssetStoreClient"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "encCommkey="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v6, v3

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    sget-object v4, Lcom/nexstreaming/app/common/nexasset/store/AssetStoreClient;->cipher:Lcom/nexstreaming/app/common/localprotocol/a;

    invoke-virtual {v4, v3}, Lcom/nexstreaming/app/common/localprotocol/a;->b([B)[B

    move-result-object v3
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/security/NoSuchProviderException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljavax/crypto/BadPaddingException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v3

    goto :goto_0

    :catch_0
    move-exception v3

    invoke-virtual {v3}, Ljavax/crypto/BadPaddingException;->printStackTrace()V

    goto :goto_0

    :catch_1
    move-exception v3

    invoke-virtual {v3}, Ljavax/crypto/IllegalBlockSizeException;->printStackTrace()V

    goto :goto_0

    :catch_2
    move-exception v3

    invoke-virtual {v3}, Ljava/security/InvalidKeyException;->printStackTrace()V

    goto :goto_0

    :catch_3
    move-exception v3

    invoke-virtual {v3}, Ljavax/crypto/NoSuchPaddingException;->printStackTrace()V

    goto :goto_0

    :catch_4
    move-exception v3

    invoke-virtual {v3}, Ljava/security/NoSuchProviderException;->printStackTrace()V

    goto :goto_0

    :catch_5
    move-exception v3

    invoke-virtual {v3}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    :goto_0
    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_1
    array-length v5, p0

    if-ge v4, v5, :cond_5

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v6, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v6, p0, v4

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Lcom/nexstreaming/app/common/nexasset/store/AssetStoreSock;->requestSECUseCommKey(ILjava/lang/String;)Lcom/nexstreaming/app/common/localprotocol/c$a;

    move-result-object v5

    if-nez v5, :cond_3

    const-string v5, "nonedata"

    aput-object v5, p1, v4

    goto :goto_2

    :cond_3
    iget v6, v5, Lcom/nexstreaming/app/common/localprotocol/c$a;->f:I

    sget-object v7, Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;->OK:Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;

    invoke-virtual {v7}, Lcom/nexstreaming/app/common/localprotocol/nexProtoErrorCode;->getValue()I

    move-result v7

    if-eq v6, v7, :cond_4

    const-string p0, "AssetStoreClient"

    const-string p1, "enckey is fail!"

    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_4
    :try_start_1
    iget-object v5, v5, Lcom/nexstreaming/app/common/localprotocol/c$a;->a:[B

    invoke-static {v5, v0}, Lcom/nexstreaming/app/common/localprotocol/a;->a([B[B)[B

    move-result-object v5

    new-instance v6, Ljava/lang/String;

    invoke-direct {v6, v5}, Ljava/lang/String;-><init>([B)V

    aput-object v6, p1, v4
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_6

    goto :goto_2

    :catch_6
    move-exception v5

    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_5
    return v3
.end method

.method public static makeConfig()V
    .locals 2

    const-string v0, "AssetStoreClient"

    const-string v1, "makeConfig in"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lcom/nexstreaming/app/common/nexasset/store/AssetStoreClient;->m_configLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/nexstreaming/app/common/nexasset/store/AssetStoreClient;->cipher:Lcom/nexstreaming/app/common/localprotocol/a;

    if-nez v1, :cond_0

    new-instance v1, Lcom/nexstreaming/app/common/localprotocol/a;

    invoke-direct {v1}, Lcom/nexstreaming/app/common/localprotocol/a;-><init>()V

    sput-object v1, Lcom/nexstreaming/app/common/nexasset/store/AssetStoreClient;->cipher:Lcom/nexstreaming/app/common/localprotocol/a;

    sget-object v1, Lcom/nexstreaming/app/common/nexasset/store/AssetStoreClient;->cipher:Lcom/nexstreaming/app/common/localprotocol/a;

    invoke-virtual {v1}, Lcom/nexstreaming/app/common/localprotocol/a;->a()V

    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v0, "AssetStoreClient"

    const-string v1, "makeConfig out"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method
