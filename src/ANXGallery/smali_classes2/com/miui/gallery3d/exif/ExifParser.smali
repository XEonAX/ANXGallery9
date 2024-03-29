.class Lcom/miui/gallery3d/exif/ExifParser;
.super Ljava/lang/Object;
.source "ExifParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery3d/exif/ExifParser$ExifTagEvent;,
        Lcom/miui/gallery3d/exif/ExifParser$IfdEvent;,
        Lcom/miui/gallery3d/exif/ExifParser$ImageEvent;
    }
.end annotation


# static fields
.field private static final TAG_EXIF_IFD:S

.field private static final TAG_GPS_IFD:S

.field private static final TAG_INTEROPERABILITY_IFD:S

.field private static final TAG_JPEG_INTERCHANGE_FORMAT:S

.field private static final TAG_JPEG_INTERCHANGE_FORMAT_LENGTH:S

.field private static final TAG_STRIP_BYTE_COUNTS:S

.field private static final TAG_STRIP_OFFSETS:S

.field private static final US_ASCII:Ljava/nio/charset/Charset;


# instance fields
.field private mApp1End:I

.field private mContainExifData:Z

.field private final mCorrespondingEvent:Ljava/util/TreeMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/TreeMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private mDataAboveIfd0:[B

.field private mIfd0Position:I

.field private mIfdStartOffset:I

.field private mIfdType:I

.field private mImageEvent:Lcom/miui/gallery3d/exif/ExifParser$ImageEvent;

.field private final mInterface:Lcom/miui/gallery3d/exif/ExifInterface;

.field private mJpegSizeTag:Lcom/miui/gallery3d/exif/ExifTag;

.field private mNeedToParseOffsetsInCurrentIfd:Z

.field private mNumOfTagInIfd:I

.field private mOffsetToApp1EndFromSOF:I

.field private final mOptions:I

.field private mStripSizeTag:Lcom/miui/gallery3d/exif/ExifTag;

.field private mTag:Lcom/miui/gallery3d/exif/ExifTag;

.field private mTiffStartPosition:I

.field private final mTiffStream:Lcom/miui/gallery3d/exif/CountedDataInputStream;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "US-ASCII"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery3d/exif/ExifParser;->US_ASCII:Ljava/nio/charset/Charset;

    sget v0, Lcom/miui/gallery3d/exif/ExifInterface;->TAG_EXIF_IFD:I

    invoke-static {v0}, Lcom/miui/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v0

    sput-short v0, Lcom/miui/gallery3d/exif/ExifParser;->TAG_EXIF_IFD:S

    sget v0, Lcom/miui/gallery3d/exif/ExifInterface;->TAG_GPS_IFD:I

    invoke-static {v0}, Lcom/miui/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v0

    sput-short v0, Lcom/miui/gallery3d/exif/ExifParser;->TAG_GPS_IFD:S

    sget v0, Lcom/miui/gallery3d/exif/ExifInterface;->TAG_INTEROPERABILITY_IFD:I

    invoke-static {v0}, Lcom/miui/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v0

    sput-short v0, Lcom/miui/gallery3d/exif/ExifParser;->TAG_INTEROPERABILITY_IFD:S

    sget v0, Lcom/miui/gallery3d/exif/ExifInterface;->TAG_JPEG_INTERCHANGE_FORMAT:I

    invoke-static {v0}, Lcom/miui/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v0

    sput-short v0, Lcom/miui/gallery3d/exif/ExifParser;->TAG_JPEG_INTERCHANGE_FORMAT:S

    sget v0, Lcom/miui/gallery3d/exif/ExifInterface;->TAG_JPEG_INTERCHANGE_FORMAT_LENGTH:I

    invoke-static {v0}, Lcom/miui/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v0

    sput-short v0, Lcom/miui/gallery3d/exif/ExifParser;->TAG_JPEG_INTERCHANGE_FORMAT_LENGTH:S

    sget v0, Lcom/miui/gallery3d/exif/ExifInterface;->TAG_STRIP_OFFSETS:I

    invoke-static {v0}, Lcom/miui/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v0

    sput-short v0, Lcom/miui/gallery3d/exif/ExifParser;->TAG_STRIP_OFFSETS:S

    sget v0, Lcom/miui/gallery3d/exif/ExifInterface;->TAG_STRIP_BYTE_COUNTS:I

    invoke-static {v0}, Lcom/miui/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v0

    sput-short v0, Lcom/miui/gallery3d/exif/ExifParser;->TAG_STRIP_BYTE_COUNTS:S

    return-void
.end method

.method private constructor <init>(Ljava/io/InputStream;ILcom/miui/gallery3d/exif/ExifInterface;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/miui/gallery3d/exif/ExifInvalidFormatException;
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mIfdStartOffset:I

    iput v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mNumOfTagInIfd:I

    iput-boolean v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mContainExifData:Z

    iput v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mOffsetToApp1EndFromSOF:I

    new-instance v1, Ljava/util/TreeMap;

    invoke-direct {v1}, Ljava/util/TreeMap;-><init>()V

    iput-object v1, p0, Lcom/miui/gallery3d/exif/ExifParser;->mCorrespondingEvent:Ljava/util/TreeMap;

    if-eqz p1, :cond_4

    iput-object p3, p0, Lcom/miui/gallery3d/exif/ExifParser;->mInterface:Lcom/miui/gallery3d/exif/ExifInterface;

    invoke-direct {p0, p1}, Lcom/miui/gallery3d/exif/ExifParser;->seekTiffData(Ljava/io/InputStream;)Z

    move-result p3

    iput-boolean p3, p0, Lcom/miui/gallery3d/exif/ExifParser;->mContainExifData:Z

    new-instance p3, Lcom/miui/gallery3d/exif/CountedDataInputStream;

    invoke-direct {p3, p1}, Lcom/miui/gallery3d/exif/CountedDataInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object p3, p0, Lcom/miui/gallery3d/exif/ExifParser;->mTiffStream:Lcom/miui/gallery3d/exif/CountedDataInputStream;

    iput p2, p0, Lcom/miui/gallery3d/exif/ExifParser;->mOptions:I

    iget-boolean p1, p0, Lcom/miui/gallery3d/exif/ExifParser;->mContainExifData:Z

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery3d/exif/ExifParser;->parseTiffHeader()V

    iget-object p1, p0, Lcom/miui/gallery3d/exif/ExifParser;->mTiffStream:Lcom/miui/gallery3d/exif/CountedDataInputStream;

    invoke-virtual {p1}, Lcom/miui/gallery3d/exif/CountedDataInputStream;->readUnsignedInt()J

    move-result-wide p1

    const-wide/32 v1, 0x7fffffff

    cmp-long p3, p1, v1

    if-gtz p3, :cond_3

    long-to-int p3, p1

    iput p3, p0, Lcom/miui/gallery3d/exif/ExifParser;->mIfd0Position:I

    iput v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mIfdType:I

    invoke-direct {p0, v0}, Lcom/miui/gallery3d/exif/ExifParser;->isIfdRequested(I)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery3d/exif/ExifParser;->needToParseOffsetsInCurrentIfd()Z

    move-result v1

    if-eqz v1, :cond_2

    :cond_1
    invoke-direct {p0, v0, p1, p2}, Lcom/miui/gallery3d/exif/ExifParser;->registerIfd(IJ)V

    const-wide/16 v0, 0x8

    cmp-long v2, p1, v0

    if-eqz v2, :cond_2

    add-int/lit8 p3, p3, -0x8

    new-array p1, p3, [B

    iput-object p1, p0, Lcom/miui/gallery3d/exif/ExifParser;->mDataAboveIfd0:[B

    iget-object p1, p0, Lcom/miui/gallery3d/exif/ExifParser;->mDataAboveIfd0:[B

    invoke-virtual {p0, p1}, Lcom/miui/gallery3d/exif/ExifParser;->read([B)I

    :cond_2
    return-void

    :cond_3
    new-instance p3, Lcom/miui/gallery3d/exif/ExifInvalidFormatException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Invalid offset "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p3, p1}, Lcom/miui/gallery3d/exif/ExifInvalidFormatException;-><init>(Ljava/lang/String;)V

    throw p3

    :cond_4
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Null argument inputStream to ExifParser"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private checkAllowed(II)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mInterface:Lcom/miui/gallery3d/exif/ExifInterface;

    invoke-virtual {v0}, Lcom/miui/gallery3d/exif/ExifInterface;->getTagInfo()Landroid/util/SparseIntArray;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/util/SparseIntArray;->get(I)I

    move-result p2

    if-nez p2, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-static {p2, p1}, Lcom/miui/gallery3d/exif/ExifInterface;->isIfdAllowed(II)Z

    move-result p1

    return p1
.end method

.method private checkOffsetOrImageTag(Lcom/miui/gallery3d/exif/ExifTag;)V
    .locals 5

    invoke-virtual {p1}, Lcom/miui/gallery3d/exif/ExifTag;->getComponentCount()I

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/miui/gallery3d/exif/ExifTag;->getTagId()S

    move-result v0

    invoke-virtual {p1}, Lcom/miui/gallery3d/exif/ExifTag;->getIfd()I

    move-result v1

    sget-short v2, Lcom/miui/gallery3d/exif/ExifParser;->TAG_EXIF_IFD:S

    const/4 v3, 0x3

    const/4 v4, 0x0

    if-ne v0, v2, :cond_2

    sget v2, Lcom/miui/gallery3d/exif/ExifInterface;->TAG_EXIF_IFD:I

    invoke-direct {p0, v1, v2}, Lcom/miui/gallery3d/exif/ExifParser;->checkAllowed(II)Z

    move-result v2

    if-eqz v2, :cond_2

    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/miui/gallery3d/exif/ExifParser;->isIfdRequested(I)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-direct {p0, v3}, Lcom/miui/gallery3d/exif/ExifParser;->isIfdRequested(I)Z

    move-result v1

    if-eqz v1, :cond_a

    :cond_1
    invoke-virtual {p1, v4}, Lcom/miui/gallery3d/exif/ExifTag;->getValueAt(I)J

    move-result-wide v1

    invoke-direct {p0, v0, v1, v2}, Lcom/miui/gallery3d/exif/ExifParser;->registerIfd(IJ)V

    goto/16 :goto_2

    :cond_2
    sget-short v2, Lcom/miui/gallery3d/exif/ExifParser;->TAG_GPS_IFD:S

    if-ne v0, v2, :cond_3

    sget v2, Lcom/miui/gallery3d/exif/ExifInterface;->TAG_GPS_IFD:I

    invoke-direct {p0, v1, v2}, Lcom/miui/gallery3d/exif/ExifParser;->checkAllowed(II)Z

    move-result v2

    if-eqz v2, :cond_3

    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lcom/miui/gallery3d/exif/ExifParser;->isIfdRequested(I)Z

    move-result v1

    if-eqz v1, :cond_a

    invoke-virtual {p1, v4}, Lcom/miui/gallery3d/exif/ExifTag;->getValueAt(I)J

    move-result-wide v1

    invoke-direct {p0, v0, v1, v2}, Lcom/miui/gallery3d/exif/ExifParser;->registerIfd(IJ)V

    goto/16 :goto_2

    :cond_3
    sget-short v2, Lcom/miui/gallery3d/exif/ExifParser;->TAG_INTEROPERABILITY_IFD:S

    if-ne v0, v2, :cond_4

    sget v2, Lcom/miui/gallery3d/exif/ExifInterface;->TAG_INTEROPERABILITY_IFD:I

    invoke-direct {p0, v1, v2}, Lcom/miui/gallery3d/exif/ExifParser;->checkAllowed(II)Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-direct {p0, v3}, Lcom/miui/gallery3d/exif/ExifParser;->isIfdRequested(I)Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-virtual {p1, v4}, Lcom/miui/gallery3d/exif/ExifTag;->getValueAt(I)J

    move-result-wide v0

    invoke-direct {p0, v3, v0, v1}, Lcom/miui/gallery3d/exif/ExifParser;->registerIfd(IJ)V

    goto/16 :goto_2

    :cond_4
    sget-short v2, Lcom/miui/gallery3d/exif/ExifParser;->TAG_JPEG_INTERCHANGE_FORMAT:S

    if-ne v0, v2, :cond_5

    sget v2, Lcom/miui/gallery3d/exif/ExifInterface;->TAG_JPEG_INTERCHANGE_FORMAT:I

    invoke-direct {p0, v1, v2}, Lcom/miui/gallery3d/exif/ExifParser;->checkAllowed(II)Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-direct {p0}, Lcom/miui/gallery3d/exif/ExifParser;->isThumbnailRequested()Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-virtual {p1, v4}, Lcom/miui/gallery3d/exif/ExifTag;->getValueAt(I)J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery3d/exif/ExifParser;->registerCompressedImage(J)V

    goto/16 :goto_2

    :cond_5
    sget-short v2, Lcom/miui/gallery3d/exif/ExifParser;->TAG_JPEG_INTERCHANGE_FORMAT_LENGTH:S

    if-ne v0, v2, :cond_6

    sget v2, Lcom/miui/gallery3d/exif/ExifInterface;->TAG_JPEG_INTERCHANGE_FORMAT_LENGTH:I

    invoke-direct {p0, v1, v2}, Lcom/miui/gallery3d/exif/ExifParser;->checkAllowed(II)Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-direct {p0}, Lcom/miui/gallery3d/exif/ExifParser;->isThumbnailRequested()Z

    move-result v0

    if-eqz v0, :cond_a

    iput-object p1, p0, Lcom/miui/gallery3d/exif/ExifParser;->mJpegSizeTag:Lcom/miui/gallery3d/exif/ExifTag;

    goto :goto_2

    :cond_6
    sget-short v2, Lcom/miui/gallery3d/exif/ExifParser;->TAG_STRIP_OFFSETS:S

    if-ne v0, v2, :cond_9

    sget v2, Lcom/miui/gallery3d/exif/ExifInterface;->TAG_STRIP_OFFSETS:I

    invoke-direct {p0, v1, v2}, Lcom/miui/gallery3d/exif/ExifParser;->checkAllowed(II)Z

    move-result v2

    if-eqz v2, :cond_9

    invoke-direct {p0}, Lcom/miui/gallery3d/exif/ExifParser;->isThumbnailRequested()Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-virtual {p1}, Lcom/miui/gallery3d/exif/ExifTag;->hasValue()Z

    move-result v0

    if-eqz v0, :cond_8

    :goto_0
    invoke-virtual {p1}, Lcom/miui/gallery3d/exif/ExifTag;->getComponentCount()I

    move-result v0

    if-ge v4, v0, :cond_a

    invoke-virtual {p1}, Lcom/miui/gallery3d/exif/ExifTag;->getDataType()S

    move-result v0

    if-ne v0, v3, :cond_7

    invoke-virtual {p1, v4}, Lcom/miui/gallery3d/exif/ExifTag;->getValueAt(I)J

    move-result-wide v0

    invoke-direct {p0, v4, v0, v1}, Lcom/miui/gallery3d/exif/ExifParser;->registerUncompressedStrip(IJ)V

    goto :goto_1

    :cond_7
    invoke-virtual {p1, v4}, Lcom/miui/gallery3d/exif/ExifTag;->getValueAt(I)J

    move-result-wide v0

    invoke-direct {p0, v4, v0, v1}, Lcom/miui/gallery3d/exif/ExifParser;->registerUncompressedStrip(IJ)V

    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_8
    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mCorrespondingEvent:Ljava/util/TreeMap;

    invoke-virtual {p1}, Lcom/miui/gallery3d/exif/ExifTag;->getOffset()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery3d/exif/ExifParser$ExifTagEvent;

    invoke-direct {v2, p1, v4}, Lcom/miui/gallery3d/exif/ExifParser$ExifTagEvent;-><init>(Lcom/miui/gallery3d/exif/ExifTag;Z)V

    invoke-virtual {v0, v1, v2}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    :cond_9
    sget-short v2, Lcom/miui/gallery3d/exif/ExifParser;->TAG_STRIP_BYTE_COUNTS:S

    if-ne v0, v2, :cond_a

    sget v0, Lcom/miui/gallery3d/exif/ExifInterface;->TAG_STRIP_BYTE_COUNTS:I

    invoke-direct {p0, v1, v0}, Lcom/miui/gallery3d/exif/ExifParser;->checkAllowed(II)Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-direct {p0}, Lcom/miui/gallery3d/exif/ExifParser;->isThumbnailRequested()Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-virtual {p1}, Lcom/miui/gallery3d/exif/ExifTag;->hasValue()Z

    move-result v0

    if-eqz v0, :cond_a

    iput-object p1, p0, Lcom/miui/gallery3d/exif/ExifParser;->mStripSizeTag:Lcom/miui/gallery3d/exif/ExifTag;

    :cond_a
    :goto_2
    return-void
.end method

.method private isIfdRequested(I)Z
    .locals 2

    const/4 v0, 0x1

    const/4 v1, 0x0

    packed-switch p1, :pswitch_data_0

    return v1

    :pswitch_0
    iget p1, p0, Lcom/miui/gallery3d/exif/ExifParser;->mOptions:I

    and-int/lit8 p1, p1, 0x8

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0

    :pswitch_1
    iget p1, p0, Lcom/miui/gallery3d/exif/ExifParser;->mOptions:I

    and-int/lit8 p1, p1, 0x10

    if-eqz p1, :cond_1

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    :goto_1
    return v0

    :pswitch_2
    iget p1, p0, Lcom/miui/gallery3d/exif/ExifParser;->mOptions:I

    and-int/lit8 p1, p1, 0x4

    if-eqz p1, :cond_2

    goto :goto_2

    :cond_2
    const/4 v0, 0x0

    :goto_2
    return v0

    :pswitch_3
    iget p1, p0, Lcom/miui/gallery3d/exif/ExifParser;->mOptions:I

    and-int/lit8 p1, p1, 0x2

    if-eqz p1, :cond_3

    goto :goto_3

    :cond_3
    const/4 v0, 0x0

    :goto_3
    return v0

    :pswitch_4
    iget p1, p0, Lcom/miui/gallery3d/exif/ExifParser;->mOptions:I

    and-int/2addr p1, v0

    if-eqz p1, :cond_4

    goto :goto_4

    :cond_4
    const/4 v0, 0x0

    :goto_4
    return v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private isThumbnailRequested()Z
    .locals 1

    iget v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mOptions:I

    and-int/lit8 v0, v0, 0x20

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private needToParseOffsetsInCurrentIfd()Z
    .locals 4

    iget v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mIfdType:I

    const/4 v1, 0x3

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_0

    return v2

    :pswitch_0
    invoke-direct {p0, v1}, Lcom/miui/gallery3d/exif/ExifParser;->isIfdRequested(I)Z

    move-result v0

    return v0

    :pswitch_1
    invoke-direct {p0}, Lcom/miui/gallery3d/exif/ExifParser;->isThumbnailRequested()Z

    move-result v0

    return v0

    :pswitch_2
    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/miui/gallery3d/exif/ExifParser;->isIfdRequested(I)Z

    move-result v0

    const/4 v3, 0x1

    if-nez v0, :cond_0

    const/4 v0, 0x4

    invoke-direct {p0, v0}, Lcom/miui/gallery3d/exif/ExifParser;->isIfdRequested(I)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0, v1}, Lcom/miui/gallery3d/exif/ExifParser;->isIfdRequested(I)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0, v3}, Lcom/miui/gallery3d/exif/ExifParser;->isIfdRequested(I)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v2, 0x1

    :cond_1
    return v2

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected static parse(Ljava/io/InputStream;Lcom/miui/gallery3d/exif/ExifInterface;)Lcom/miui/gallery3d/exif/ExifParser;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/miui/gallery3d/exif/ExifInvalidFormatException;
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery3d/exif/ExifParser;

    const/16 v1, 0x3f

    invoke-direct {v0, p0, v1, p1}, Lcom/miui/gallery3d/exif/ExifParser;-><init>(Ljava/io/InputStream;ILcom/miui/gallery3d/exif/ExifInterface;)V

    return-object v0
.end method

.method private parseTiffHeader()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/miui/gallery3d/exif/ExifInvalidFormatException;
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mTiffStream:Lcom/miui/gallery3d/exif/CountedDataInputStream;

    invoke-virtual {v0}, Lcom/miui/gallery3d/exif/CountedDataInputStream;->readShort()S

    move-result v0

    const/16 v1, 0x4949

    if-ne v1, v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mTiffStream:Lcom/miui/gallery3d/exif/CountedDataInputStream;

    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Lcom/miui/gallery3d/exif/CountedDataInputStream;->setByteOrder(Ljava/nio/ByteOrder;)V

    goto :goto_0

    :cond_0
    const/16 v1, 0x4d4d

    if-ne v1, v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mTiffStream:Lcom/miui/gallery3d/exif/CountedDataInputStream;

    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {v0, v1}, Lcom/miui/gallery3d/exif/CountedDataInputStream;->setByteOrder(Ljava/nio/ByteOrder;)V

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mTiffStream:Lcom/miui/gallery3d/exif/CountedDataInputStream;

    invoke-virtual {v0}, Lcom/miui/gallery3d/exif/CountedDataInputStream;->readShort()S

    move-result v0

    const/16 v1, 0x2a

    if-ne v0, v1, :cond_1

    return-void

    :cond_1
    new-instance v0, Lcom/miui/gallery3d/exif/ExifInvalidFormatException;

    const-string v1, "Invalid TIFF header"

    invoke-direct {v0, v1}, Lcom/miui/gallery3d/exif/ExifInvalidFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    new-instance v0, Lcom/miui/gallery3d/exif/ExifInvalidFormatException;

    const-string v1, "Invalid TIFF header"

    invoke-direct {v0, v1}, Lcom/miui/gallery3d/exif/ExifInvalidFormatException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private readTag()Lcom/miui/gallery3d/exif/ExifTag;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/miui/gallery3d/exif/ExifInvalidFormatException;
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mTiffStream:Lcom/miui/gallery3d/exif/CountedDataInputStream;

    invoke-virtual {v0}, Lcom/miui/gallery3d/exif/CountedDataInputStream;->readShort()S

    move-result v2

    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mTiffStream:Lcom/miui/gallery3d/exif/CountedDataInputStream;

    invoke-virtual {v0}, Lcom/miui/gallery3d/exif/CountedDataInputStream;->readShort()S

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery3d/exif/ExifParser;->mTiffStream:Lcom/miui/gallery3d/exif/CountedDataInputStream;

    invoke-virtual {v1}, Lcom/miui/gallery3d/exif/CountedDataInputStream;->readUnsignedInt()J

    move-result-wide v3

    const-wide/32 v5, 0x186a0

    cmp-long v1, v3, v5

    const/4 v5, 0x2

    const/4 v6, 0x1

    const/4 v7, 0x0

    if-gtz v1, :cond_5

    invoke-static {v0}, Lcom/miui/gallery3d/exif/ExifTag;->isValidType(S)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "ExifParser"

    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v4, "Tag %04x: Invalid data type %d"

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v2

    aput-object v2, v5, v7

    invoke-static {v0}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v0

    aput-object v0, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mTiffStream:Lcom/miui/gallery3d/exif/CountedDataInputStream;

    const-wide/16 v1, 0x4

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery3d/exif/CountedDataInputStream;->skip(J)J

    const/4 v0, 0x0

    return-object v0

    :cond_0
    new-instance v8, Lcom/miui/gallery3d/exif/ExifTag;

    long-to-int v9, v3

    iget v5, p0, Lcom/miui/gallery3d/exif/ExifParser;->mIfdType:I

    if-eqz v9, :cond_1

    goto :goto_0

    :cond_1
    const/4 v6, 0x0

    :goto_0
    move-object v1, v8

    move v3, v0

    move v4, v9

    invoke-direct/range {v1 .. v6}, Lcom/miui/gallery3d/exif/ExifTag;-><init>(SSIIZ)V

    invoke-virtual {v8}, Lcom/miui/gallery3d/exif/ExifTag;->getDataSize()I

    move-result v1

    const/4 v2, 0x4

    if-le v1, v2, :cond_4

    iget-object v1, p0, Lcom/miui/gallery3d/exif/ExifParser;->mTiffStream:Lcom/miui/gallery3d/exif/CountedDataInputStream;

    invoke-virtual {v1}, Lcom/miui/gallery3d/exif/CountedDataInputStream;->readUnsignedInt()J

    move-result-wide v1

    const-wide/32 v3, 0x7fffffff

    cmp-long v5, v1, v3

    if-gtz v5, :cond_3

    iget v3, p0, Lcom/miui/gallery3d/exif/ExifParser;->mIfd0Position:I

    int-to-long v3, v3

    cmp-long v5, v1, v3

    if-gez v5, :cond_2

    const/4 v3, 0x7

    if-ne v0, v3, :cond_2

    new-array v0, v9, [B

    iget-object v3, p0, Lcom/miui/gallery3d/exif/ExifParser;->mDataAboveIfd0:[B

    long-to-int v1, v1

    add-int/lit8 v1, v1, -0x8

    invoke-static {v3, v1, v0, v7, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    invoke-virtual {v8, v0}, Lcom/miui/gallery3d/exif/ExifTag;->setValue([B)Z

    goto :goto_1

    :cond_2
    long-to-int v0, v1

    invoke-virtual {v8, v0}, Lcom/miui/gallery3d/exif/ExifTag;->setOffset(I)V

    goto :goto_1

    :cond_3
    new-instance v0, Lcom/miui/gallery3d/exif/ExifInvalidFormatException;

    const-string v1, "offset is larger then Integer.MAX_VALUE"

    invoke-direct {v0, v1}, Lcom/miui/gallery3d/exif/ExifInvalidFormatException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_4
    invoke-virtual {v8}, Lcom/miui/gallery3d/exif/ExifTag;->hasDefinedCount()Z

    move-result v0

    invoke-virtual {v8, v7}, Lcom/miui/gallery3d/exif/ExifTag;->setHasDefinedCount(Z)V

    invoke-virtual {p0, v8}, Lcom/miui/gallery3d/exif/ExifParser;->readFullTagValue(Lcom/miui/gallery3d/exif/ExifTag;)V

    invoke-virtual {v8, v0}, Lcom/miui/gallery3d/exif/ExifTag;->setHasDefinedCount(Z)V

    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mTiffStream:Lcom/miui/gallery3d/exif/CountedDataInputStream;

    rsub-int/lit8 v1, v1, 0x4

    int-to-long v3, v1

    invoke-virtual {v0, v3, v4}, Lcom/miui/gallery3d/exif/CountedDataInputStream;->skip(J)J

    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mTiffStream:Lcom/miui/gallery3d/exif/CountedDataInputStream;

    invoke-virtual {v0}, Lcom/miui/gallery3d/exif/CountedDataInputStream;->getReadByteCount()I

    move-result v0

    sub-int/2addr v0, v2

    invoke-virtual {v8, v0}, Lcom/miui/gallery3d/exif/ExifTag;->setOffset(I)V

    :goto_1
    return-object v8

    :cond_5
    new-instance v0, Lcom/miui/gallery3d/exif/ExifInvalidFormatException;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v8, 0x3

    new-array v8, v8, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v2

    aput-object v2, v8, v7

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v8, v6

    const v2, 0x186a0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v8, v5

    const-string v2, "Number of component of tag %d [%d] is larger than [%d]"

    invoke-static {v1, v2, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/miui/gallery3d/exif/ExifInvalidFormatException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private registerCompressedImage(J)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mCorrespondingEvent:Ljava/util/TreeMap;

    long-to-int p1, p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    new-instance p2, Lcom/miui/gallery3d/exif/ExifParser$ImageEvent;

    const/4 v1, 0x3

    invoke-direct {p2, v1}, Lcom/miui/gallery3d/exif/ExifParser$ImageEvent;-><init>(I)V

    invoke-virtual {v0, p1, p2}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private registerIfd(IJ)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mCorrespondingEvent:Ljava/util/TreeMap;

    long-to-int p2, p2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    new-instance p3, Lcom/miui/gallery3d/exif/ExifParser$IfdEvent;

    invoke-direct {p0, p1}, Lcom/miui/gallery3d/exif/ExifParser;->isIfdRequested(I)Z

    move-result v1

    invoke-direct {p3, p1, v1}, Lcom/miui/gallery3d/exif/ExifParser$IfdEvent;-><init>(IZ)V

    invoke-virtual {v0, p2, p3}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private registerUncompressedStrip(IJ)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mCorrespondingEvent:Ljava/util/TreeMap;

    long-to-int p2, p2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    new-instance p3, Lcom/miui/gallery3d/exif/ExifParser$ImageEvent;

    const/4 v1, 0x4

    invoke-direct {p3, v1, p1}, Lcom/miui/gallery3d/exif/ExifParser$ImageEvent;-><init>(II)V

    invoke-virtual {v0, p2, p3}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private seekTiffData(Ljava/io/InputStream;)Z
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/miui/gallery3d/exif/ExifInvalidFormatException;
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery3d/exif/CountedDataInputStream;

    invoke-direct {v0, p1}, Lcom/miui/gallery3d/exif/CountedDataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v0}, Lcom/miui/gallery3d/exif/CountedDataInputStream;->readShort()S

    move-result p1

    const/16 v1, -0x28

    if-ne p1, v1, :cond_4

    invoke-virtual {v0}, Lcom/miui/gallery3d/exif/CountedDataInputStream;->readShort()S

    move-result p1

    :goto_0
    const/16 v1, -0x27

    const/4 v2, 0x0

    if-eq p1, v1, :cond_3

    invoke-static {p1}, Lcom/miui/gallery3d/exif/JpegHeader;->isSofMarker(S)Z

    move-result v1

    if-nez v1, :cond_3

    invoke-virtual {v0}, Lcom/miui/gallery3d/exif/CountedDataInputStream;->readUnsignedShort()I

    move-result v1

    const/16 v3, -0x1f

    if-ne p1, v3, :cond_0

    const/16 p1, 0x8

    if-lt v1, p1, :cond_0

    invoke-virtual {v0}, Lcom/miui/gallery3d/exif/CountedDataInputStream;->readInt()I

    move-result p1

    invoke-virtual {v0}, Lcom/miui/gallery3d/exif/CountedDataInputStream;->readShort()S

    move-result v3

    add-int/lit8 v1, v1, -0x6

    const v4, 0x45786966

    if-ne p1, v4, :cond_0

    if-nez v3, :cond_0

    invoke-virtual {v0}, Lcom/miui/gallery3d/exif/CountedDataInputStream;->getReadByteCount()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery3d/exif/ExifParser;->mTiffStartPosition:I

    iput v1, p0, Lcom/miui/gallery3d/exif/ExifParser;->mApp1End:I

    iget p1, p0, Lcom/miui/gallery3d/exif/ExifParser;->mTiffStartPosition:I

    iget v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mApp1End:I

    add-int/2addr p1, v0

    iput p1, p0, Lcom/miui/gallery3d/exif/ExifParser;->mOffsetToApp1EndFromSOF:I

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x2

    if-lt v1, p1, :cond_2

    add-int/lit8 v1, v1, -0x2

    int-to-long v3, v1

    invoke-virtual {v0, v3, v4}, Lcom/miui/gallery3d/exif/CountedDataInputStream;->skip(J)J

    move-result-wide v5

    cmp-long p1, v3, v5

    if-eqz p1, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {v0}, Lcom/miui/gallery3d/exif/CountedDataInputStream;->readShort()S

    move-result p1

    goto :goto_0

    :cond_2
    :goto_1
    const-string p1, "ExifParser"

    const-string v0, "Invalid JPEG format."

    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    :cond_3
    return v2

    :cond_4
    new-instance p1, Lcom/miui/gallery3d/exif/ExifInvalidFormatException;

    const-string v0, "Invalid JPEG format"

    invoke-direct {p1, v0}, Lcom/miui/gallery3d/exif/ExifInvalidFormatException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private skipTo(I)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mTiffStream:Lcom/miui/gallery3d/exif/CountedDataInputStream;

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery3d/exif/CountedDataInputStream;->skipTo(J)V

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mCorrespondingEvent:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mCorrespondingEvent:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->firstKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ge v0, p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mCorrespondingEvent:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->pollFirstEntry()Ljava/util/Map$Entry;

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method protected getByteOrder()Ljava/nio/ByteOrder;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mTiffStream:Lcom/miui/gallery3d/exif/CountedDataInputStream;

    invoke-virtual {v0}, Lcom/miui/gallery3d/exif/CountedDataInputStream;->getByteOrder()Ljava/nio/ByteOrder;

    move-result-object v0

    return-object v0
.end method

.method protected getCompressedImageSize()I
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mJpegSizeTag:Lcom/miui/gallery3d/exif/ExifTag;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mJpegSizeTag:Lcom/miui/gallery3d/exif/ExifTag;

    invoke-virtual {v0, v1}, Lcom/miui/gallery3d/exif/ExifTag;->getValueAt(I)J

    move-result-wide v0

    long-to-int v0, v0

    return v0
.end method

.method protected getCurrentIfd()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mIfdType:I

    return v0
.end method

.method protected getStripIndex()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mImageEvent:Lcom/miui/gallery3d/exif/ExifParser$ImageEvent;

    iget v0, v0, Lcom/miui/gallery3d/exif/ExifParser$ImageEvent;->stripIndex:I

    return v0
.end method

.method protected getStripSize()I
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mStripSizeTag:Lcom/miui/gallery3d/exif/ExifTag;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mStripSizeTag:Lcom/miui/gallery3d/exif/ExifTag;

    invoke-virtual {v0, v1}, Lcom/miui/gallery3d/exif/ExifTag;->getValueAt(I)J

    move-result-wide v0

    long-to-int v0, v0

    return v0
.end method

.method protected getTag()Lcom/miui/gallery3d/exif/ExifTag;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mTag:Lcom/miui/gallery3d/exif/ExifTag;

    return-object v0
.end method

.method protected next()I
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/miui/gallery3d/exif/ExifInvalidFormatException;
        }
    .end annotation

    iget-boolean v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mContainExifData:Z

    const/4 v1, 0x5

    if-nez v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mTiffStream:Lcom/miui/gallery3d/exif/CountedDataInputStream;

    invoke-virtual {v0}, Lcom/miui/gallery3d/exif/CountedDataInputStream;->getReadByteCount()I

    move-result v0

    iget v2, p0, Lcom/miui/gallery3d/exif/ExifParser;->mIfdStartOffset:I

    const/4 v3, 0x2

    add-int/2addr v2, v3

    iget v4, p0, Lcom/miui/gallery3d/exif/ExifParser;->mNumOfTagInIfd:I

    mul-int/lit8 v4, v4, 0xc

    add-int/2addr v2, v4

    const/4 v4, 0x1

    if-ge v0, v2, :cond_3

    invoke-direct {p0}, Lcom/miui/gallery3d/exif/ExifParser;->readTag()Lcom/miui/gallery3d/exif/ExifTag;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mTag:Lcom/miui/gallery3d/exif/ExifTag;

    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mTag:Lcom/miui/gallery3d/exif/ExifTag;

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery3d/exif/ExifParser;->next()I

    move-result v0

    return v0

    :cond_1
    iget-boolean v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mNeedToParseOffsetsInCurrentIfd:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mTag:Lcom/miui/gallery3d/exif/ExifTag;

    invoke-direct {p0, v0}, Lcom/miui/gallery3d/exif/ExifParser;->checkOffsetOrImageTag(Lcom/miui/gallery3d/exif/ExifTag;)V

    :cond_2
    return v4

    :cond_3
    if-ne v0, v2, :cond_8

    iget v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mIfdType:I

    const-wide/16 v5, 0x0

    if-nez v0, :cond_5

    invoke-virtual {p0}, Lcom/miui/gallery3d/exif/ExifParser;->readUnsignedLong()J

    move-result-wide v7

    invoke-direct {p0, v4}, Lcom/miui/gallery3d/exif/ExifParser;->isIfdRequested(I)Z

    move-result v0

    if-nez v0, :cond_4

    invoke-direct {p0}, Lcom/miui/gallery3d/exif/ExifParser;->isThumbnailRequested()Z

    move-result v0

    if-eqz v0, :cond_8

    :cond_4
    cmp-long v0, v7, v5

    if-eqz v0, :cond_8

    invoke-direct {p0, v4, v7, v8}, Lcom/miui/gallery3d/exif/ExifParser;->registerIfd(IJ)V

    goto :goto_1

    :cond_5
    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mCorrespondingEvent:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->size()I

    move-result v0

    const/4 v2, 0x4

    if-lez v0, :cond_6

    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mCorrespondingEvent:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->firstEntry()Ljava/util/Map$Entry;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget-object v4, p0, Lcom/miui/gallery3d/exif/ExifParser;->mTiffStream:Lcom/miui/gallery3d/exif/CountedDataInputStream;

    invoke-virtual {v4}, Lcom/miui/gallery3d/exif/CountedDataInputStream;->getReadByteCount()I

    move-result v4

    sub-int/2addr v0, v4

    goto :goto_0

    :cond_6
    const/4 v0, 0x4

    :goto_0
    if-ge v0, v2, :cond_7

    const-string v2, "ExifParser"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Invalid size of link to next IFD: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_7
    invoke-virtual {p0}, Lcom/miui/gallery3d/exif/ExifParser;->readUnsignedLong()J

    move-result-wide v7

    cmp-long v0, v7, v5

    if-eqz v0, :cond_8

    const-string v0, "ExifParser"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid link to next IFD: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_8
    :goto_1
    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mCorrespondingEvent:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->size()I

    move-result v0

    if-eqz v0, :cond_e

    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mCorrespondingEvent:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->pollFirstEntry()Ljava/util/Map$Entry;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    :try_start_0
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-direct {p0, v4}, Lcom/miui/gallery3d/exif/ExifParser;->skipTo(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    instance-of v4, v2, Lcom/miui/gallery3d/exif/ExifParser$IfdEvent;

    if-eqz v4, :cond_b

    check-cast v2, Lcom/miui/gallery3d/exif/ExifParser$IfdEvent;

    iget v4, v2, Lcom/miui/gallery3d/exif/ExifParser$IfdEvent;->ifd:I

    iput v4, p0, Lcom/miui/gallery3d/exif/ExifParser;->mIfdType:I

    iget-object v4, p0, Lcom/miui/gallery3d/exif/ExifParser;->mTiffStream:Lcom/miui/gallery3d/exif/CountedDataInputStream;

    invoke-virtual {v4}, Lcom/miui/gallery3d/exif/CountedDataInputStream;->readUnsignedShort()I

    move-result v4

    iput v4, p0, Lcom/miui/gallery3d/exif/ExifParser;->mNumOfTagInIfd:I

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mIfdStartOffset:I

    iget v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mNumOfTagInIfd:I

    mul-int/lit8 v0, v0, 0xc

    iget v4, p0, Lcom/miui/gallery3d/exif/ExifParser;->mIfdStartOffset:I

    add-int/2addr v0, v4

    add-int/2addr v0, v3

    iget v4, p0, Lcom/miui/gallery3d/exif/ExifParser;->mApp1End:I

    if-le v0, v4, :cond_9

    const-string v0, "ExifParser"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid size of IFD "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/miui/gallery3d/exif/ExifParser;->mIfdType:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_9
    invoke-direct {p0}, Lcom/miui/gallery3d/exif/ExifParser;->needToParseOffsetsInCurrentIfd()Z

    move-result v0

    iput-boolean v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mNeedToParseOffsetsInCurrentIfd:Z

    iget-boolean v0, v2, Lcom/miui/gallery3d/exif/ExifParser$IfdEvent;->isRequested:Z

    if-eqz v0, :cond_a

    const/4 v0, 0x0

    return v0

    :cond_a
    invoke-virtual {p0}, Lcom/miui/gallery3d/exif/ExifParser;->skipRemainingTagsInCurrentIfd()V

    goto :goto_1

    :cond_b
    instance-of v0, v2, Lcom/miui/gallery3d/exif/ExifParser$ImageEvent;

    if-eqz v0, :cond_c

    check-cast v2, Lcom/miui/gallery3d/exif/ExifParser$ImageEvent;

    iput-object v2, p0, Lcom/miui/gallery3d/exif/ExifParser;->mImageEvent:Lcom/miui/gallery3d/exif/ExifParser$ImageEvent;

    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mImageEvent:Lcom/miui/gallery3d/exif/ExifParser$ImageEvent;

    iget v0, v0, Lcom/miui/gallery3d/exif/ExifParser$ImageEvent;->type:I

    return v0

    :cond_c
    check-cast v2, Lcom/miui/gallery3d/exif/ExifParser$ExifTagEvent;

    iget-object v0, v2, Lcom/miui/gallery3d/exif/ExifParser$ExifTagEvent;->tag:Lcom/miui/gallery3d/exif/ExifTag;

    iput-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mTag:Lcom/miui/gallery3d/exif/ExifTag;

    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mTag:Lcom/miui/gallery3d/exif/ExifTag;

    invoke-virtual {v0}, Lcom/miui/gallery3d/exif/ExifTag;->getDataType()S

    move-result v0

    const/4 v4, 0x7

    if-eq v0, v4, :cond_d

    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mTag:Lcom/miui/gallery3d/exif/ExifTag;

    invoke-virtual {p0, v0}, Lcom/miui/gallery3d/exif/ExifParser;->readFullTagValue(Lcom/miui/gallery3d/exif/ExifTag;)V

    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mTag:Lcom/miui/gallery3d/exif/ExifTag;

    invoke-direct {p0, v0}, Lcom/miui/gallery3d/exif/ExifParser;->checkOffsetOrImageTag(Lcom/miui/gallery3d/exif/ExifTag;)V

    :cond_d
    iget-boolean v0, v2, Lcom/miui/gallery3d/exif/ExifParser$ExifTagEvent;->isRequested:Z

    if-eqz v0, :cond_8

    return v3

    :catch_0
    const-string v4, "ExifParser"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to skip to data at: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, " for "

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ", the file may be broken."

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    :cond_e
    return v1
.end method

.method protected read([B)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mTiffStream:Lcom/miui/gallery3d/exif/CountedDataInputStream;

    invoke-virtual {v0, p1}, Lcom/miui/gallery3d/exif/CountedDataInputStream;->read([B)I

    move-result p1

    return p1
.end method

.method protected readFullTagValue(Lcom/miui/gallery3d/exif/ExifTag;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/miui/gallery3d/exif/ExifInvalidFormatException;
        }
    .end annotation

    invoke-virtual {p1}, Lcom/miui/gallery3d/exif/ExifTag;->getDataType()S

    move-result v0

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eq v0, v1, :cond_0

    const/4 v3, 0x7

    if-eq v0, v3, :cond_0

    if-ne v0, v2, :cond_4

    :cond_0
    invoke-virtual {p1}, Lcom/miui/gallery3d/exif/ExifTag;->getComponentCount()I

    move-result v0

    iget-object v3, p0, Lcom/miui/gallery3d/exif/ExifParser;->mCorrespondingEvent:Ljava/util/TreeMap;

    invoke-virtual {v3}, Ljava/util/TreeMap;->size()I

    move-result v3

    if-lez v3, :cond_4

    iget-object v3, p0, Lcom/miui/gallery3d/exif/ExifParser;->mCorrespondingEvent:Ljava/util/TreeMap;

    invoke-virtual {v3}, Ljava/util/TreeMap;->firstEntry()Ljava/util/Map$Entry;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iget-object v4, p0, Lcom/miui/gallery3d/exif/ExifParser;->mTiffStream:Lcom/miui/gallery3d/exif/CountedDataInputStream;

    invoke-virtual {v4}, Lcom/miui/gallery3d/exif/CountedDataInputStream;->getReadByteCount()I

    move-result v4

    add-int/2addr v4, v0

    if-ge v3, v4, :cond_4

    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mCorrespondingEvent:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->firstEntry()Ljava/util/Map$Entry;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    instance-of v3, v0, Lcom/miui/gallery3d/exif/ExifParser$ImageEvent;

    if-eqz v3, :cond_1

    const-string v0, "ExifParser"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Thumbnail overlaps value for tag: \n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/miui/gallery3d/exif/ExifTag;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mCorrespondingEvent:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->pollFirstEntry()Ljava/util/Map$Entry;

    move-result-object v0

    const-string v3, "ExifParser"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Invalid thumbnail offset: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    :cond_1
    instance-of v3, v0, Lcom/miui/gallery3d/exif/ExifParser$IfdEvent;

    if-eqz v3, :cond_2

    const-string v3, "ExifParser"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Ifd "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    check-cast v0, Lcom/miui/gallery3d/exif/ExifParser$IfdEvent;

    iget v0, v0, Lcom/miui/gallery3d/exif/ExifParser$IfdEvent;->ifd:I

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " overlaps value for tag: \n"

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/miui/gallery3d/exif/ExifTag;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_2
    instance-of v3, v0, Lcom/miui/gallery3d/exif/ExifParser$ExifTagEvent;

    if-eqz v3, :cond_3

    const-string v3, "ExifParser"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Tag value for tag: \n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    check-cast v0, Lcom/miui/gallery3d/exif/ExifParser$ExifTagEvent;

    iget-object v0, v0, Lcom/miui/gallery3d/exif/ExifParser$ExifTagEvent;->tag:Lcom/miui/gallery3d/exif/ExifTag;

    invoke-virtual {v0}, Lcom/miui/gallery3d/exif/ExifTag;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " overlaps value for tag: \n"

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/miui/gallery3d/exif/ExifTag;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mCorrespondingEvent:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->firstEntry()Ljava/util/Map$Entry;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget-object v3, p0, Lcom/miui/gallery3d/exif/ExifParser;->mTiffStream:Lcom/miui/gallery3d/exif/CountedDataInputStream;

    invoke-virtual {v3}, Lcom/miui/gallery3d/exif/CountedDataInputStream;->getReadByteCount()I

    move-result v3

    sub-int/2addr v0, v3

    const-string v3, "ExifParser"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Invalid size of tag: \n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/miui/gallery3d/exif/ExifTag;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " setting count to: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1, v0}, Lcom/miui/gallery3d/exif/ExifTag;->forceSetComponentCount(I)V

    :cond_4
    :goto_1
    invoke-virtual {p1}, Lcom/miui/gallery3d/exif/ExifTag;->getComponentCount()I

    move-result v0

    const/4 v3, 0x0

    if-ltz v0, :cond_a

    invoke-virtual {p1}, Lcom/miui/gallery3d/exif/ExifTag;->getDataType()S

    move-result v1

    packed-switch v1, :pswitch_data_0

    :pswitch_0
    goto/16 :goto_7

    :pswitch_1
    new-array v0, v0, [Lcom/miui/gallery3d/exif/Rational;

    array-length v1, v0

    :goto_2
    if-ge v3, v1, :cond_5

    invoke-virtual {p0}, Lcom/miui/gallery3d/exif/ExifParser;->readRational()Lcom/miui/gallery3d/exif/Rational;

    move-result-object v2

    aput-object v2, v0, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_5
    invoke-virtual {p1, v0}, Lcom/miui/gallery3d/exif/ExifTag;->setValue([Lcom/miui/gallery3d/exif/Rational;)Z

    goto :goto_7

    :pswitch_2
    new-array v0, v0, [I

    array-length v1, v0

    :goto_3
    if-ge v3, v1, :cond_6

    invoke-virtual {p0}, Lcom/miui/gallery3d/exif/ExifParser;->readLong()I

    move-result v2

    aput v2, v0, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    :cond_6
    invoke-virtual {p1, v0}, Lcom/miui/gallery3d/exif/ExifTag;->setValue([I)Z

    goto :goto_7

    :pswitch_3
    new-array v0, v0, [Lcom/miui/gallery3d/exif/Rational;

    array-length v1, v0

    :goto_4
    if-ge v3, v1, :cond_7

    invoke-virtual {p0}, Lcom/miui/gallery3d/exif/ExifParser;->readUnsignedRational()Lcom/miui/gallery3d/exif/Rational;

    move-result-object v2

    aput-object v2, v0, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    :cond_7
    invoke-virtual {p1, v0}, Lcom/miui/gallery3d/exif/ExifTag;->setValue([Lcom/miui/gallery3d/exif/Rational;)Z

    goto :goto_7

    :pswitch_4
    new-array v0, v0, [J

    array-length v1, v0

    :goto_5
    if-ge v3, v1, :cond_8

    invoke-virtual {p0}, Lcom/miui/gallery3d/exif/ExifParser;->readUnsignedLong()J

    move-result-wide v4

    aput-wide v4, v0, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    :cond_8
    invoke-virtual {p1, v0}, Lcom/miui/gallery3d/exif/ExifTag;->setValue([J)Z

    goto :goto_7

    :pswitch_5
    new-array v0, v0, [I

    array-length v1, v0

    :goto_6
    if-ge v3, v1, :cond_9

    invoke-virtual {p0}, Lcom/miui/gallery3d/exif/ExifParser;->readUnsignedShort()I

    move-result v2

    aput v2, v0, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    :cond_9
    invoke-virtual {p1, v0}, Lcom/miui/gallery3d/exif/ExifTag;->setValue([I)Z

    goto :goto_7

    :pswitch_6
    invoke-virtual {p0, v0}, Lcom/miui/gallery3d/exif/ExifParser;->readString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery3d/exif/ExifTag;->setValue(Ljava/lang/String;)Z

    goto :goto_7

    :pswitch_7
    new-array v0, v0, [B

    invoke-virtual {p0, v0}, Lcom/miui/gallery3d/exif/ExifParser;->read([B)I

    invoke-virtual {p1, v0}, Lcom/miui/gallery3d/exif/ExifTag;->setValue([B)Z

    :goto_7
    return-void

    :cond_a
    new-instance v4, Lcom/miui/gallery3d/exif/ExifInvalidFormatException;

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v1, v3

    aput-object p1, v1, v2

    const-string p1, "Invalid size [%d] of tag [%s]"

    invoke-static {v5, p1, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v4, p1}, Lcom/miui/gallery3d/exif/ExifInvalidFormatException;-><init>(Ljava/lang/String;)V

    throw v4

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_0
        :pswitch_7
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method protected readLong()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mTiffStream:Lcom/miui/gallery3d/exif/CountedDataInputStream;

    invoke-virtual {v0}, Lcom/miui/gallery3d/exif/CountedDataInputStream;->readInt()I

    move-result v0

    return v0
.end method

.method protected readRational()Lcom/miui/gallery3d/exif/Rational;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/miui/gallery3d/exif/ExifParser;->readLong()I

    move-result v0

    invoke-virtual {p0}, Lcom/miui/gallery3d/exif/ExifParser;->readLong()I

    move-result v1

    new-instance v2, Lcom/miui/gallery3d/exif/Rational;

    int-to-long v3, v0

    int-to-long v0, v1

    invoke-direct {v2, v3, v4, v0, v1}, Lcom/miui/gallery3d/exif/Rational;-><init>(JJ)V

    return-object v2
.end method

.method protected readString(I)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery3d/exif/ExifParser;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery3d/exif/ExifParser;->readString(ILjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected readString(ILjava/nio/charset/Charset;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-lez p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mTiffStream:Lcom/miui/gallery3d/exif/CountedDataInputStream;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery3d/exif/CountedDataInputStream;->readString(ILjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const-string p1, ""

    return-object p1
.end method

.method protected readUnsignedLong()J
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/miui/gallery3d/exif/ExifParser;->readLong()I

    move-result v0

    int-to-long v0, v0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    return-wide v0
.end method

.method protected readUnsignedRational()Lcom/miui/gallery3d/exif/Rational;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/miui/gallery3d/exif/ExifParser;->readUnsignedLong()J

    move-result-wide v0

    invoke-virtual {p0}, Lcom/miui/gallery3d/exif/ExifParser;->readUnsignedLong()J

    move-result-wide v2

    new-instance v4, Lcom/miui/gallery3d/exif/Rational;

    invoke-direct {v4, v0, v1, v2, v3}, Lcom/miui/gallery3d/exif/Rational;-><init>(JJ)V

    return-object v4
.end method

.method protected readUnsignedShort()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mTiffStream:Lcom/miui/gallery3d/exif/CountedDataInputStream;

    invoke-virtual {v0}, Lcom/miui/gallery3d/exif/CountedDataInputStream;->readShort()S

    move-result v0

    const v1, 0xffff

    and-int/2addr v0, v1

    return v0
.end method

.method protected registerForTagValue(Lcom/miui/gallery3d/exif/ExifTag;)V
    .locals 4

    invoke-virtual {p1}, Lcom/miui/gallery3d/exif/ExifTag;->getOffset()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery3d/exif/ExifParser;->mTiffStream:Lcom/miui/gallery3d/exif/CountedDataInputStream;

    invoke-virtual {v1}, Lcom/miui/gallery3d/exif/CountedDataInputStream;->getReadByteCount()I

    move-result v1

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mCorrespondingEvent:Ljava/util/TreeMap;

    invoke-virtual {p1}, Lcom/miui/gallery3d/exif/ExifTag;->getOffset()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery3d/exif/ExifParser$ExifTagEvent;

    const/4 v3, 0x1

    invoke-direct {v2, p1, v3}, Lcom/miui/gallery3d/exif/ExifParser$ExifTagEvent;-><init>(Lcom/miui/gallery3d/exif/ExifTag;Z)V

    invoke-virtual {v0, v1, v2}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method protected skipRemainingTagsInCurrentIfd()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/miui/gallery3d/exif/ExifInvalidFormatException;
        }
    .end annotation

    iget v0, p0, Lcom/miui/gallery3d/exif/ExifParser;->mIfdStartOffset:I

    add-int/lit8 v0, v0, 0x2

    iget v1, p0, Lcom/miui/gallery3d/exif/ExifParser;->mNumOfTagInIfd:I

    mul-int/lit8 v1, v1, 0xc

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/miui/gallery3d/exif/ExifParser;->mTiffStream:Lcom/miui/gallery3d/exif/CountedDataInputStream;

    invoke-virtual {v1}, Lcom/miui/gallery3d/exif/CountedDataInputStream;->getReadByteCount()I

    move-result v1

    if-le v1, v0, :cond_0

    return-void

    :cond_0
    iget-boolean v2, p0, Lcom/miui/gallery3d/exif/ExifParser;->mNeedToParseOffsetsInCurrentIfd:Z

    if-eqz v2, :cond_2

    :goto_0
    if-ge v1, v0, :cond_3

    invoke-direct {p0}, Lcom/miui/gallery3d/exif/ExifParser;->readTag()Lcom/miui/gallery3d/exif/ExifTag;

    move-result-object v2

    iput-object v2, p0, Lcom/miui/gallery3d/exif/ExifParser;->mTag:Lcom/miui/gallery3d/exif/ExifTag;

    add-int/lit8 v1, v1, 0xc

    iget-object v2, p0, Lcom/miui/gallery3d/exif/ExifParser;->mTag:Lcom/miui/gallery3d/exif/ExifTag;

    if-nez v2, :cond_1

    goto :goto_0

    :cond_1
    iget-object v2, p0, Lcom/miui/gallery3d/exif/ExifParser;->mTag:Lcom/miui/gallery3d/exif/ExifTag;

    invoke-direct {p0, v2}, Lcom/miui/gallery3d/exif/ExifParser;->checkOffsetOrImageTag(Lcom/miui/gallery3d/exif/ExifTag;)V

    goto :goto_0

    :cond_2
    invoke-direct {p0, v0}, Lcom/miui/gallery3d/exif/ExifParser;->skipTo(I)V

    :cond_3
    invoke-virtual {p0}, Lcom/miui/gallery3d/exif/ExifParser;->readUnsignedLong()J

    move-result-wide v0

    iget v2, p0, Lcom/miui/gallery3d/exif/ExifParser;->mIfdType:I

    if-nez v2, :cond_5

    const/4 v2, 0x1

    invoke-direct {p0, v2}, Lcom/miui/gallery3d/exif/ExifParser;->isIfdRequested(I)Z

    move-result v3

    if-nez v3, :cond_4

    invoke-direct {p0}, Lcom/miui/gallery3d/exif/ExifParser;->isThumbnailRequested()Z

    move-result v3

    if-eqz v3, :cond_5

    :cond_4
    const-wide/16 v3, 0x0

    cmp-long v5, v0, v3

    if-lez v5, :cond_5

    invoke-direct {p0, v2, v0, v1}, Lcom/miui/gallery3d/exif/ExifParser;->registerIfd(IJ)V

    :cond_5
    return-void
.end method
