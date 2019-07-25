.class public Lcn/kuaipan/android/kss/upload/ServerExpect;
.super Ljava/lang/Object;
.source "ServerExpect.java"

# interfaces
.implements Lcn/kuaipan/android/kss/KssDef;


# instance fields
.field public factoryMode:Z

.field public nextChunkSize:J

.field public uploadDelay:I


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcn/kuaipan/android/kss/upload/ServerExpect;->factoryMode:Z

    const/4 v0, -0x1

    iput v0, p0, Lcn/kuaipan/android/kss/upload/ServerExpect;->uploadDelay:I

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcn/kuaipan/android/kss/upload/ServerExpect;->nextChunkSize:J

    return-void
.end method

.method private static getInt(Lorg/apache/http/Header;)I
    .locals 4

    const/4 v0, -0x1

    if-nez p0, :cond_0

    return v0

    :cond_0
    :try_start_0
    invoke-interface {p0}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move v0, v1

    goto :goto_0

    :catch_0
    const-string v1, "ServerExpect"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed parser header: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return v0
.end method

.method public static getServerExpect(Lcn/kuaipan/android/http/KscHttpResponse;)Lcn/kuaipan/android/kss/upload/ServerExpect;
    .locals 5

    const/4 v0, 0x0

    if-nez p0, :cond_0

    move-object p0, v0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcn/kuaipan/android/http/KscHttpResponse;->getResponse()Lorg/apache/http/HttpResponse;

    move-result-object p0

    :goto_0
    if-nez p0, :cond_1

    return-object v0

    :cond_1
    new-instance v1, Lcn/kuaipan/android/kss/upload/ServerExpect;

    invoke-direct {v1}, Lcn/kuaipan/android/kss/upload/ServerExpect;-><init>()V

    const-string v2, "X-Factory-Mode"

    invoke-interface {p0, v2}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_3

    invoke-static {v2}, Lcn/kuaipan/android/kss/upload/ServerExpect;->getInt(Lorg/apache/http/Header;)I

    move-result v2

    if-ne v2, v4, :cond_2

    const/4 v3, 0x1

    :cond_2
    iput-boolean v3, v1, Lcn/kuaipan/android/kss/upload/ServerExpect;->factoryMode:Z

    const/4 v3, 0x1

    :cond_3
    const-string v2, "X-Upload-Delay"

    invoke-interface {p0, v2}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v2

    if-eqz v2, :cond_4

    invoke-static {v2}, Lcn/kuaipan/android/kss/upload/ServerExpect;->getInt(Lorg/apache/http/Header;)I

    move-result v2

    iput v2, v1, Lcn/kuaipan/android/kss/upload/ServerExpect;->uploadDelay:I

    const/4 v3, 0x1

    :cond_4
    const-string v2, "X-Next-Chunk-Size"

    invoke-interface {p0, v2}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object p0

    if-eqz p0, :cond_5

    invoke-static {p0}, Lcn/kuaipan/android/kss/upload/ServerExpect;->getInt(Lorg/apache/http/Header;)I

    move-result p0

    int-to-long v2, p0

    iput-wide v2, v1, Lcn/kuaipan/android/kss/upload/ServerExpect;->nextChunkSize:J

    const/4 v3, 0x1

    :cond_5
    if-eqz v3, :cond_6

    move-object v0, v1

    :cond_6
    return-object v0
.end method


# virtual methods
.method public validate()V
    .locals 6

    iget-wide v0, p0, Lcn/kuaipan/android/kss/upload/ServerExpect;->nextChunkSize:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-ltz v4, :cond_0

    iget-wide v0, p0, Lcn/kuaipan/android/kss/upload/ServerExpect;->nextChunkSize:J

    iget-wide v2, p0, Lcn/kuaipan/android/kss/upload/ServerExpect;->nextChunkSize:J

    const-wide/32 v4, 0x10000

    rem-long/2addr v2, v4

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lcn/kuaipan/android/kss/upload/ServerExpect;->nextChunkSize:J

    iget-wide v0, p0, Lcn/kuaipan/android/kss/upload/ServerExpect;->nextChunkSize:J

    sget-wide v2, Lcn/kuaipan/android/kss/upload/ServerExpect;->MAX_CHUNKSIZE:J

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    iput-wide v0, p0, Lcn/kuaipan/android/kss/upload/ServerExpect;->nextChunkSize:J

    iget-wide v0, p0, Lcn/kuaipan/android/kss/upload/ServerExpect;->nextChunkSize:J

    invoke-static {v0, v1, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    iput-wide v0, p0, Lcn/kuaipan/android/kss/upload/ServerExpect;->nextChunkSize:J

    :cond_0
    iget v0, p0, Lcn/kuaipan/android/kss/upload/ServerExpect;->uploadDelay:I

    if-lez v0, :cond_1

    iget-boolean v0, p0, Lcn/kuaipan/android/kss/upload/ServerExpect;->factoryMode:Z

    if-nez v0, :cond_1

    iget v0, p0, Lcn/kuaipan/android/kss/upload/ServerExpect;->uploadDelay:I

    const/16 v1, 0x12c

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Lcn/kuaipan/android/kss/upload/ServerExpect;->uploadDelay:I

    :cond_1
    return-void
.end method
