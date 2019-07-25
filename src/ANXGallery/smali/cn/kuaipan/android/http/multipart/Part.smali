.class public abstract Lcn/kuaipan/android/http/multipart/Part;
.super Ljava/lang/Object;
.source "Part.java"


# static fields
.field protected static final BOUNDARY_BYTES:[B

.field protected static final CHARSET_BYTES:[B

.field protected static final CONTENT_DISPOSITION_BYTES:[B

.field protected static final CONTENT_TRANSFER_ENCODING_BYTES:[B

.field protected static final CONTENT_TYPE_BYTES:[B

.field protected static final CRLF_BYTES:[B

.field private static final DEFAULT_BOUNDARY_BYTES:[B

.field protected static final EXTRA_BYTES:[B

.field protected static final QUOTE_BYTES:[B


# instance fields
.field private boundaryBytes:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "----------------314159265358979323846"

    invoke-static {v0}, Lorg/apache/http/util/EncodingUtils;->getAsciiBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcn/kuaipan/android/http/multipart/Part;->BOUNDARY_BYTES:[B

    sget-object v0, Lcn/kuaipan/android/http/multipart/Part;->BOUNDARY_BYTES:[B

    sput-object v0, Lcn/kuaipan/android/http/multipart/Part;->DEFAULT_BOUNDARY_BYTES:[B

    const-string v0, "\r\n"

    invoke-static {v0}, Lorg/apache/http/util/EncodingUtils;->getAsciiBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcn/kuaipan/android/http/multipart/Part;->CRLF_BYTES:[B

    const-string v0, "\""

    invoke-static {v0}, Lorg/apache/http/util/EncodingUtils;->getAsciiBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcn/kuaipan/android/http/multipart/Part;->QUOTE_BYTES:[B

    const-string v0, "--"

    invoke-static {v0}, Lorg/apache/http/util/EncodingUtils;->getAsciiBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcn/kuaipan/android/http/multipart/Part;->EXTRA_BYTES:[B

    const-string v0, "Content-Disposition: form-data; name="

    invoke-static {v0}, Lorg/apache/http/util/EncodingUtils;->getAsciiBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcn/kuaipan/android/http/multipart/Part;->CONTENT_DISPOSITION_BYTES:[B

    const-string v0, "Content-Type: "

    invoke-static {v0}, Lorg/apache/http/util/EncodingUtils;->getAsciiBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcn/kuaipan/android/http/multipart/Part;->CONTENT_TYPE_BYTES:[B

    const-string v0, "; charset="

    invoke-static {v0}, Lorg/apache/http/util/EncodingUtils;->getAsciiBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcn/kuaipan/android/http/multipart/Part;->CHARSET_BYTES:[B

    const-string v0, "Content-Transfer-Encoding: "

    invoke-static {v0}, Lorg/apache/http/util/EncodingUtils;->getAsciiBytes(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lcn/kuaipan/android/http/multipart/Part;->CONTENT_TRANSFER_ENCODING_BYTES:[B

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getLengthOfParts([Lcn/kuaipan/android/http/multipart/Part;[B)J
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-eqz p0, :cond_2

    const/4 v0, 0x0

    const-wide/16 v1, 0x0

    move-wide v3, v1

    :goto_0
    array-length v5, p0

    if-ge v0, v5, :cond_1

    aget-object v5, p0, v0

    invoke-virtual {v5, p1}, Lcn/kuaipan/android/http/multipart/Part;->setPartBoundary([B)V

    aget-object v5, p0, v0

    invoke-virtual {v5}, Lcn/kuaipan/android/http/multipart/Part;->length()J

    move-result-wide v5

    cmp-long v7, v5, v1

    if-gez v7, :cond_0

    const-wide/16 p0, -0x1

    return-wide p0

    :cond_0
    const/4 v7, 0x0

    add-long/2addr v3, v5

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    sget-object p0, Lcn/kuaipan/android/http/multipart/Part;->EXTRA_BYTES:[B

    array-length p0, p0

    int-to-long v0, p0

    add-long/2addr v3, v0

    array-length p0, p1

    int-to-long p0, p0

    add-long/2addr v3, p0

    sget-object p0, Lcn/kuaipan/android/http/multipart/Part;->EXTRA_BYTES:[B

    array-length p0, p0

    int-to-long p0, p0

    add-long/2addr v3, p0

    sget-object p0, Lcn/kuaipan/android/http/multipart/Part;->CRLF_BYTES:[B

    array-length p0, p0

    int-to-long p0, p0

    add-long/2addr v3, p0

    return-wide v3

    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Parts may not be null"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static sendParts(Ljava/io/OutputStream;[Lcn/kuaipan/android/http/multipart/Part;[B)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-eqz p1, :cond_2

    if-eqz p2, :cond_1

    array-length v0, p2

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    aget-object v1, p1, v0

    invoke-virtual {v1, p2}, Lcn/kuaipan/android/http/multipart/Part;->setPartBoundary([B)V

    aget-object v1, p1, v0

    invoke-virtual {v1, p0}, Lcn/kuaipan/android/http/multipart/Part;->send(Ljava/io/OutputStream;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    sget-object p1, Lcn/kuaipan/android/http/multipart/Part;->EXTRA_BYTES:[B

    invoke-virtual {p0, p1}, Ljava/io/OutputStream;->write([B)V

    invoke-virtual {p0, p2}, Ljava/io/OutputStream;->write([B)V

    sget-object p1, Lcn/kuaipan/android/http/multipart/Part;->EXTRA_BYTES:[B

    invoke-virtual {p0, p1}, Ljava/io/OutputStream;->write([B)V

    sget-object p1, Lcn/kuaipan/android/http/multipart/Part;->CRLF_BYTES:[B

    invoke-virtual {p0, p1}, Ljava/io/OutputStream;->write([B)V

    return-void

    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "partBoundary may not be empty"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Parts may not be null"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public abstract getCharSet()Ljava/lang/String;
.end method

.method public abstract getContentType()Ljava/lang/String;
.end method

.method public abstract getName()Ljava/lang/String;
.end method

.method protected getPartBoundary()[B
    .locals 1

    iget-object v0, p0, Lcn/kuaipan/android/http/multipart/Part;->boundaryBytes:[B

    if-nez v0, :cond_0

    sget-object v0, Lcn/kuaipan/android/http/multipart/Part;->DEFAULT_BOUNDARY_BYTES:[B

    return-object v0

    :cond_0
    iget-object v0, p0, Lcn/kuaipan/android/http/multipart/Part;->boundaryBytes:[B

    return-object v0
.end method

.method public abstract getTransferEncoding()Ljava/lang/String;
.end method

.method public isRepeatable()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public length()J
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcn/kuaipan/android/http/multipart/Part;->lengthOfData()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-gez v4, :cond_0

    const-wide/16 v0, -0x1

    return-wide v0

    :cond_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    invoke-virtual {p0, v0}, Lcn/kuaipan/android/http/multipart/Part;->sendStart(Ljava/io/OutputStream;)V

    invoke-virtual {p0, v0}, Lcn/kuaipan/android/http/multipart/Part;->sendDispositionHeader(Ljava/io/OutputStream;)V

    invoke-virtual {p0, v0}, Lcn/kuaipan/android/http/multipart/Part;->sendContentTypeHeader(Ljava/io/OutputStream;)V

    invoke-virtual {p0, v0}, Lcn/kuaipan/android/http/multipart/Part;->sendTransferEncodingHeader(Ljava/io/OutputStream;)V

    invoke-virtual {p0, v0}, Lcn/kuaipan/android/http/multipart/Part;->sendEndOfHeader(Ljava/io/OutputStream;)V

    invoke-virtual {p0, v0}, Lcn/kuaipan/android/http/multipart/Part;->sendEnd(Ljava/io/OutputStream;)V

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v0

    int-to-long v0, v0

    invoke-virtual {p0}, Lcn/kuaipan/android/http/multipart/Part;->lengthOfData()J

    move-result-wide v2

    add-long/2addr v0, v2

    return-wide v0
.end method

.method protected abstract lengthOfData()J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public send(Ljava/io/OutputStream;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcn/kuaipan/android/http/multipart/Part;->sendStart(Ljava/io/OutputStream;)V

    invoke-virtual {p0, p1}, Lcn/kuaipan/android/http/multipart/Part;->sendDispositionHeader(Ljava/io/OutputStream;)V

    invoke-virtual {p0, p1}, Lcn/kuaipan/android/http/multipart/Part;->sendContentTypeHeader(Ljava/io/OutputStream;)V

    invoke-virtual {p0, p1}, Lcn/kuaipan/android/http/multipart/Part;->sendTransferEncodingHeader(Ljava/io/OutputStream;)V

    invoke-virtual {p0, p1}, Lcn/kuaipan/android/http/multipart/Part;->sendEndOfHeader(Ljava/io/OutputStream;)V

    invoke-virtual {p0, p1}, Lcn/kuaipan/android/http/multipart/Part;->sendData(Ljava/io/OutputStream;)V

    invoke-virtual {p0, p1}, Lcn/kuaipan/android/http/multipart/Part;->sendEnd(Ljava/io/OutputStream;)V

    return-void
.end method

.method protected sendContentTypeHeader(Ljava/io/OutputStream;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcn/kuaipan/android/http/multipart/Part;->getContentType()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    sget-object v1, Lcn/kuaipan/android/http/multipart/Part;->CRLF_BYTES:[B

    invoke-virtual {p1, v1}, Ljava/io/OutputStream;->write([B)V

    sget-object v1, Lcn/kuaipan/android/http/multipart/Part;->CONTENT_TYPE_BYTES:[B

    invoke-virtual {p1, v1}, Ljava/io/OutputStream;->write([B)V

    invoke-static {v0}, Lorg/apache/http/util/EncodingUtils;->getAsciiBytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    invoke-virtual {p0}, Lcn/kuaipan/android/http/multipart/Part;->getCharSet()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    sget-object v1, Lcn/kuaipan/android/http/multipart/Part;->CHARSET_BYTES:[B

    invoke-virtual {p1, v1}, Ljava/io/OutputStream;->write([B)V

    invoke-static {v0}, Lorg/apache/http/util/EncodingUtils;->getAsciiBytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    :cond_0
    return-void
.end method

.method protected abstract sendData(Ljava/io/OutputStream;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected sendDispositionHeader(Ljava/io/OutputStream;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcn/kuaipan/android/http/multipart/Part;->CONTENT_DISPOSITION_BYTES:[B

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    sget-object v0, Lcn/kuaipan/android/http/multipart/Part;->QUOTE_BYTES:[B

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    invoke-virtual {p0}, Lcn/kuaipan/android/http/multipart/Part;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/http/util/EncodingUtils;->getAsciiBytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    sget-object v0, Lcn/kuaipan/android/http/multipart/Part;->QUOTE_BYTES:[B

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    return-void
.end method

.method protected sendEnd(Ljava/io/OutputStream;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcn/kuaipan/android/http/multipart/Part;->CRLF_BYTES:[B

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    return-void
.end method

.method protected sendEndOfHeader(Ljava/io/OutputStream;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcn/kuaipan/android/http/multipart/Part;->CRLF_BYTES:[B

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    sget-object v0, Lcn/kuaipan/android/http/multipart/Part;->CRLF_BYTES:[B

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    return-void
.end method

.method protected sendStart(Ljava/io/OutputStream;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcn/kuaipan/android/http/multipart/Part;->EXTRA_BYTES:[B

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    invoke-virtual {p0}, Lcn/kuaipan/android/http/multipart/Part;->getPartBoundary()[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    sget-object v0, Lcn/kuaipan/android/http/multipart/Part;->CRLF_BYTES:[B

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    return-void
.end method

.method protected sendTransferEncodingHeader(Ljava/io/OutputStream;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcn/kuaipan/android/http/multipart/Part;->getTransferEncoding()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    sget-object v1, Lcn/kuaipan/android/http/multipart/Part;->CRLF_BYTES:[B

    invoke-virtual {p1, v1}, Ljava/io/OutputStream;->write([B)V

    sget-object v1, Lcn/kuaipan/android/http/multipart/Part;->CONTENT_TRANSFER_ENCODING_BYTES:[B

    invoke-virtual {p1, v1}, Ljava/io/OutputStream;->write([B)V

    invoke-static {v0}, Lorg/apache/http/util/EncodingUtils;->getAsciiBytes(Ljava/lang/String;)[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    :cond_0
    return-void
.end method

.method setPartBoundary([B)V
    .locals 0

    iput-object p1, p0, Lcn/kuaipan/android/http/multipart/Part;->boundaryBytes:[B

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Lcn/kuaipan/android/http/multipart/Part;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
