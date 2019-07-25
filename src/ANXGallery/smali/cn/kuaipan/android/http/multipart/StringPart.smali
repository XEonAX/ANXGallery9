.class public Lcn/kuaipan/android/http/multipart/StringPart;
.super Lcn/kuaipan/android/http/multipart/PartBase;
.source "StringPart.java"


# instance fields
.field private content:[B

.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    const-string v0, "text/plain"

    if-nez p3, :cond_0

    const-string p3, "US-ASCII"

    :cond_0
    const-string v1, "8bit"

    invoke-direct {p0, p1, v0, p3, v1}, Lcn/kuaipan/android/http/multipart/PartBase;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p2, :cond_2

    const/4 p1, 0x0

    invoke-virtual {p2, p1}, Ljava/lang/String;->indexOf(I)I

    move-result p1

    const/4 p3, -0x1

    if-ne p1, p3, :cond_1

    iput-object p2, p0, Lcn/kuaipan/android/http/multipart/StringPart;->value:Ljava/lang/String;

    return-void

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "NULs may not be present in string parts"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Value may not be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private getContent()[B
    .locals 2

    iget-object v0, p0, Lcn/kuaipan/android/http/multipart/StringPart;->content:[B

    if-nez v0, :cond_0

    iget-object v0, p0, Lcn/kuaipan/android/http/multipart/StringPart;->value:Ljava/lang/String;

    invoke-virtual {p0}, Lcn/kuaipan/android/http/multipart/StringPart;->getCharSet()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/apache/http/util/EncodingUtils;->getBytes(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v0

    iput-object v0, p0, Lcn/kuaipan/android/http/multipart/StringPart;->content:[B

    :cond_0
    iget-object v0, p0, Lcn/kuaipan/android/http/multipart/StringPart;->content:[B

    return-object v0
.end method


# virtual methods
.method protected lengthOfData()J
    .locals 2

    invoke-direct {p0}, Lcn/kuaipan/android/http/multipart/StringPart;->getContent()[B

    move-result-object v0

    array-length v0, v0

    int-to-long v0, v0

    return-wide v0
.end method

.method protected sendData(Ljava/io/OutputStream;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0}, Lcn/kuaipan/android/http/multipart/StringPart;->getContent()[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    return-void
.end method
