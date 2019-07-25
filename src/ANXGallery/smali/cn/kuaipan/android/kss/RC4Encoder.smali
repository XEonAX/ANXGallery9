.class public Lcn/kuaipan/android/kss/RC4Encoder;
.super Ljava/lang/Object;
.source "RC4Encoder.java"

# interfaces
.implements Lcn/kuaipan/android/http/IKscDecoder;


# instance fields
.field private buf:[B

.field private bufUsed:I

.field private final key:[B

.field private final rc4:Lcn/kuaipan/android/utils/RC4;


# direct methods
.method public constructor <init>([B)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidKeyException;
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcn/kuaipan/android/kss/RC4Encoder;->bufUsed:I

    iput-object p1, p0, Lcn/kuaipan/android/kss/RC4Encoder;->key:[B

    new-instance v0, Lcn/kuaipan/android/utils/RC4;

    invoke-direct {v0}, Lcn/kuaipan/android/utils/RC4;-><init>()V

    iput-object v0, p0, Lcn/kuaipan/android/kss/RC4Encoder;->rc4:Lcn/kuaipan/android/utils/RC4;

    iget-object v0, p0, Lcn/kuaipan/android/kss/RC4Encoder;->rc4:Lcn/kuaipan/android/utils/RC4;

    invoke-virtual {v0, p1}, Lcn/kuaipan/android/utils/RC4;->makeKey([B)V

    const/16 p1, 0x2000

    new-array p1, p1, [B

    iput-object p1, p0, Lcn/kuaipan/android/kss/RC4Encoder;->buf:[B

    return-void
.end method


# virtual methods
.method public canEnd()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public clone()Lcn/kuaipan/android/kss/RC4Encoder;
    .locals 2

    :try_start_0
    new-instance v0, Lcn/kuaipan/android/kss/RC4Encoder;

    iget-object v1, p0, Lcn/kuaipan/android/kss/RC4Encoder;->key:[B

    invoke-direct {v0, v1}, Lcn/kuaipan/android/kss/RC4Encoder;-><init>([B)V
    :try_end_0
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    invoke-virtual {p0}, Lcn/kuaipan/android/kss/RC4Encoder;->clone()Lcn/kuaipan/android/kss/RC4Encoder;

    move-result-object v0

    return-object v0
.end method

.method public end()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcn/kuaipan/android/kss/RC4Encoder;->bufUsed:I

    return-void
.end method

.method public declared-synchronized fillData([BII)V
    .locals 7

    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcn/kuaipan/android/kss/RC4Encoder;->bufUsed:I

    add-int/2addr v0, p3

    iget-object v1, p0, Lcn/kuaipan/android/kss/RC4Encoder;->buf:[B

    array-length v1, v1

    if-le v0, v1, :cond_1

    iget-object v1, p0, Lcn/kuaipan/android/kss/RC4Encoder;->buf:[B

    array-length v2, v1

    shl-int/lit8 v2, v2, 0x1

    :goto_0
    if-le v0, v2, :cond_0

    shl-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    new-array v2, v2, [B

    iput-object v2, p0, Lcn/kuaipan/android/kss/RC4Encoder;->buf:[B

    iget-object v2, p0, Lcn/kuaipan/android/kss/RC4Encoder;->buf:[B

    iget v3, p0, Lcn/kuaipan/android/kss/RC4Encoder;->bufUsed:I

    const/4 v4, 0x0

    invoke-static {v1, v4, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_1
    iget-object v1, p0, Lcn/kuaipan/android/kss/RC4Encoder;->rc4:Lcn/kuaipan/android/utils/RC4;

    move-object v2, p1

    move v3, p2

    move v4, p3

    move-object v5, p1

    move v6, p2

    invoke-virtual/range {v1 .. v6}, Lcn/kuaipan/android/utils/RC4;->genRC4([BII[BI)V

    iget-object v1, p0, Lcn/kuaipan/android/kss/RC4Encoder;->buf:[B

    iget v2, p0, Lcn/kuaipan/android/kss/RC4Encoder;->bufUsed:I

    invoke-static {p1, p2, v1, v2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iput v0, p0, Lcn/kuaipan/android/kss/RC4Encoder;->bufUsed:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public init()V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcn/kuaipan/android/kss/RC4Encoder;->rc4:Lcn/kuaipan/android/utils/RC4;

    iget-object v1, p0, Lcn/kuaipan/android/kss/RC4Encoder;->key:[B

    invoke-virtual {v0, v1}, Lcn/kuaipan/android/utils/RC4;->makeKey([B)V

    const/4 v0, 0x0

    iput v0, p0, Lcn/kuaipan/android/kss/RC4Encoder;->bufUsed:I
    :try_end_0
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method public needFill()I
    .locals 2

    iget v0, p0, Lcn/kuaipan/android/kss/RC4Encoder;->bufUsed:I

    rsub-int v0, v0, 0x2000

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method public declared-synchronized readDecodeData([BII)I
    .locals 2

    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcn/kuaipan/android/kss/RC4Encoder;->bufUsed:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, 0x0

    if-gtz v0, :cond_0

    monitor-exit p0

    return v1

    :cond_0
    :try_start_1
    iget v0, p0, Lcn/kuaipan/android/kss/RC4Encoder;->bufUsed:I

    invoke-static {v0, p3}, Ljava/lang/Math;->min(II)I

    move-result p3

    array-length v0, p1

    sub-int/2addr v0, p2

    invoke-static {p3, v0}, Ljava/lang/Math;->min(II)I

    move-result p3

    iget-object v0, p0, Lcn/kuaipan/android/kss/RC4Encoder;->buf:[B

    invoke-static {v0, v1, p1, p2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget p1, p0, Lcn/kuaipan/android/kss/RC4Encoder;->bufUsed:I

    sub-int/2addr p1, p3

    if-lez p1, :cond_1

    iget-object p2, p0, Lcn/kuaipan/android/kss/RC4Encoder;->buf:[B

    iget-object v0, p0, Lcn/kuaipan/android/kss/RC4Encoder;->buf:[B

    invoke-static {p2, p3, v0, v1, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_1
    iput p1, p0, Lcn/kuaipan/android/kss/RC4Encoder;->bufUsed:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return p3

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public skip(J)V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcn/kuaipan/android/kss/RC4Encoder;->rc4:Lcn/kuaipan/android/utils/RC4;

    iget-object v1, p0, Lcn/kuaipan/android/kss/RC4Encoder;->key:[B

    invoke-virtual {v0, v1}, Lcn/kuaipan/android/utils/RC4;->makeKey([B)V

    const/4 v0, 0x0

    iput v0, p0, Lcn/kuaipan/android/kss/RC4Encoder;->bufUsed:I

    iget-object v0, p0, Lcn/kuaipan/android/kss/RC4Encoder;->rc4:Lcn/kuaipan/android/utils/RC4;

    invoke-virtual {v0, p1, p2}, Lcn/kuaipan/android/utils/RC4;->skip(J)V
    :try_end_0
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method public supportRepeat()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
