.class public Lcom/nexstreaming/checkcaps/a;
.super Ljava/lang/Object;
.source "Checker.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nexstreaming/checkcaps/a$b;,
        Lcom/nexstreaming/checkcaps/a$a;
    }
.end annotation


# static fields
.field private static a:Ljava/lang/String; = "CapChecker"


# instance fields
.field private b:Z

.field private c:Lcom/nexstreaming/checkcaps/b;

.field private d:Lcom/nexstreaming/checkcaps/a$a;

.field private e:Landroid/media/MediaCodec;

.field private f:Landroid/media/MediaCodec$BufferInfo;

.field private g:Landroid/media/MediaFormat;

.field private h:[Ljava/nio/ByteBuffer;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nexstreaming/checkcaps/a;->b:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nexstreaming/checkcaps/a;->c:Lcom/nexstreaming/checkcaps/b;

    iput-object v0, p0, Lcom/nexstreaming/checkcaps/a;->e:Landroid/media/MediaCodec;

    iput-object v0, p0, Lcom/nexstreaming/checkcaps/a;->f:Landroid/media/MediaCodec$BufferInfo;

    iput-object v0, p0, Lcom/nexstreaming/checkcaps/a;->g:Landroid/media/MediaFormat;

    iput-object v0, p0, Lcom/nexstreaming/checkcaps/a;->h:[Ljava/nio/ByteBuffer;

    iput-boolean p1, p0, Lcom/nexstreaming/checkcaps/a;->b:Z

    return-void
.end method

.method static synthetic a(Lcom/nexstreaming/checkcaps/a;II)I
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/nexstreaming/checkcaps/a;->b(II)I

    move-result p0

    return p0
.end method

.method private static a(Ljava/lang/String;)I
    .locals 7

    invoke-static {}, Landroid/media/MediaCodecList;->getCodecCount()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v2, v0, :cond_3

    invoke-static {v2}, Landroid/media/MediaCodecList;->getCodecInfoAt(I)Landroid/media/MediaCodecInfo;

    move-result-object v4

    invoke-virtual {v4}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    move-result v5

    if-nez v5, :cond_0

    goto :goto_2

    :cond_0
    invoke-virtual {v4}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    :goto_1
    array-length v6, v4

    if-ge v5, v6, :cond_2

    aget-object v6, v4, v5

    invoke-virtual {v6, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_2
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    return v3
.end method

.method private a(Landroid/media/MediaCodecInfo;Landroid/media/MediaFormat;Ljava/util/concurrent/atomic/AtomicReference;)Landroid/media/MediaCodec;
    .locals 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/media/MediaCodecInfo;",
            "Landroid/media/MediaFormat;",
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Landroid/view/Surface;",
            ">;)",
            "Landroid/media/MediaCodec;"
        }
    .end annotation

    const/4 v0, 0x1

    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p1}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/media/MediaCodec;->createByCodecName(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v2, 0x0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    move-object p1, v1

    const/4 v2, 0x1

    :goto_0
    if-eqz v2, :cond_0

    return-object v1

    :cond_0
    :try_start_1
    invoke-virtual {p1, p2, v1, v1, v0}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V
    :try_end_1
    .catch Landroid/media/MediaCodec$CodecException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_1

    move v0, v2

    goto :goto_1

    :catch_1
    move-exception p2

    invoke-virtual {p2}, Ljava/lang/RuntimeException;->printStackTrace()V

    :catch_2
    :goto_1
    if-eqz v0, :cond_1

    return-object v1

    :cond_1
    invoke-virtual {p1}, Landroid/media/MediaCodec;->createInputSurface()Landroid/view/Surface;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    invoke-virtual {p1}, Landroid/media/MediaCodec;->start()V

    return-object p1
.end method

.method static synthetic a(Lcom/nexstreaming/checkcaps/a;)Lcom/nexstreaming/checkcaps/a$a;
    .locals 0

    iget-object p0, p0, Lcom/nexstreaming/checkcaps/a;->d:Lcom/nexstreaming/checkcaps/a$a;

    return-object p0
.end method

.method private b(II)I
    .locals 6
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    const-string v0, "video/avc"

    invoke-static {v0}, Lcom/nexstreaming/checkcaps/a;->b(Ljava/lang/String;)[Landroid/media/MediaCodecInfo;

    move-result-object v0

    iget-object v1, p0, Lcom/nexstreaming/checkcaps/a;->d:Lcom/nexstreaming/checkcaps/a$a;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/nexstreaming/checkcaps/a;->d:Lcom/nexstreaming/checkcaps/a$a;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "The count of \'video/avc\' Encoder : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v4, v0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, p0, v3}, Lcom/nexstreaming/checkcaps/a$a;->a(Lcom/nexstreaming/checkcaps/a;Ljava/lang/String;)V

    const/4 v1, 0x0

    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_0

    iget-object v3, p0, Lcom/nexstreaming/checkcaps/a;->d:Lcom/nexstreaming/checkcaps/a$a;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " th encoder\'s name is \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v5, v0, v1

    invoke-virtual {v5}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, p0, v4}, Lcom/nexstreaming/checkcaps/a$a;->a(Lcom/nexstreaming/checkcaps/a;Ljava/lang/String;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    const-string v1, "video/avc"

    invoke-static {v1, p1, p2}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    move-result-object p1

    const-string p2, "color-format"

    const v1, 0x7f000789

    invoke-virtual {p1, p2, v1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    const-string p2, "bitrate"

    const v1, 0x2dc6c0

    invoke-virtual {p1, p2, v1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    const-string p2, "frame-rate"

    const/16 v1, 0x1e

    invoke-virtual {p1, p2, v1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    const-string p2, "i-frame-interval"

    const/4 v1, 0x2

    invoke-virtual {p1, p2, v1}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    iget-object p2, p0, Lcom/nexstreaming/checkcaps/a;->d:Lcom/nexstreaming/checkcaps/a$a;

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/nexstreaming/checkcaps/a;->d:Lcom/nexstreaming/checkcaps/a$a;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Video Format of Encoder : "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p2, p0, v1}, Lcom/nexstreaming/checkcaps/a$a;->a(Lcom/nexstreaming/checkcaps/a;Ljava/lang/String;)V

    :cond_1
    new-instance p2, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {p2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    aget-object v0, v0, v2

    invoke-direct {p0, v0, p1, p2}, Lcom/nexstreaming/checkcaps/a;->a(Landroid/media/MediaCodecInfo;Landroid/media/MediaFormat;Ljava/util/concurrent/atomic/AtomicReference;)Landroid/media/MediaCodec;

    move-result-object p1

    iput-object p1, p0, Lcom/nexstreaming/checkcaps/a;->e:Landroid/media/MediaCodec;

    iget-object p1, p0, Lcom/nexstreaming/checkcaps/a;->e:Landroid/media/MediaCodec;

    if-eqz p1, :cond_2

    new-instance p1, Lcom/nexstreaming/checkcaps/b;

    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/Surface;

    invoke-direct {p1, p2}, Lcom/nexstreaming/checkcaps/b;-><init>(Landroid/view/Surface;)V

    iput-object p1, p0, Lcom/nexstreaming/checkcaps/a;->c:Lcom/nexstreaming/checkcaps/b;

    iget-object p1, p0, Lcom/nexstreaming/checkcaps/a;->c:Lcom/nexstreaming/checkcaps/b;

    invoke-virtual {p1}, Lcom/nexstreaming/checkcaps/b;->b()V

    iget-object p1, p0, Lcom/nexstreaming/checkcaps/a;->e:Landroid/media/MediaCodec;

    invoke-virtual {p1}, Landroid/media/MediaCodec;->stop()V

    iget-object p1, p0, Lcom/nexstreaming/checkcaps/a;->e:Landroid/media/MediaCodec;

    invoke-virtual {p1}, Landroid/media/MediaCodec;->release()V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/nexstreaming/checkcaps/a;->e:Landroid/media/MediaCodec;

    iget-object p2, p0, Lcom/nexstreaming/checkcaps/a;->c:Lcom/nexstreaming/checkcaps/b;

    invoke-virtual {p2}, Lcom/nexstreaming/checkcaps/b;->a()V

    iput-object p1, p0, Lcom/nexstreaming/checkcaps/a;->c:Lcom/nexstreaming/checkcaps/b;

    return v2

    :cond_2
    const/4 p1, -0x1

    return p1
.end method

.method private static b(Ljava/lang/String;)[Landroid/media/MediaCodecInfo;
    .locals 9

    invoke-static {p0}, Lcom/nexstreaming/checkcaps/a;->a(Ljava/lang/String;)I

    move-result v0

    new-array v1, v0, [Landroid/media/MediaCodecInfo;

    if-nez v0, :cond_0

    return-object v1

    :cond_0
    invoke-static {}, Landroid/media/MediaCodecList;->getCodecCount()I

    move-result v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v3, v0, :cond_4

    invoke-static {v3}, Landroid/media/MediaCodecList;->getCodecInfoAt(I)Landroid/media/MediaCodecInfo;

    move-result-object v5

    invoke-virtual {v5}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    move-result v6

    if-nez v6, :cond_1

    goto :goto_2

    :cond_1
    invoke-virtual {v5}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    :goto_1
    array-length v8, v6

    if-ge v7, v8, :cond_3

    aget-object v8, v6, v7

    invoke-virtual {v8, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2

    add-int/lit8 v6, v4, 0x1

    aput-object v5, v1, v4

    move v4, v6

    goto :goto_2

    :cond_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    :cond_3
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_4
    return-object v1
.end method


# virtual methods
.method public a(II)V
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "command"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "width"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "height"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Ljava/util/AbstractMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {p0, v0}, Lcom/nexstreaming/checkcaps/a$b;->a(Lcom/nexstreaming/checkcaps/a;Ljava/util/AbstractMap;)V

    return-void
.end method

.method public a(Lcom/nexstreaming/checkcaps/a$a;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/checkcaps/a;->d:Lcom/nexstreaming/checkcaps/a$a;

    return-void
.end method
