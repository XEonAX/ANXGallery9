.class public Lcom/miui/gallery/util/MediaFile;
.super Ljava/lang/Object;
.source "MediaFile.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/util/MediaFile$MediaFileType;
    }
.end annotation


# static fields
.field private static final sFileTypeMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/util/MediaFile$MediaFileType;",
            ">;"
        }
    .end annotation
.end field

.field private static final sFileTypeToFormatMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final sFormatToMimeTypeMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final sMimeTypeMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final sMimeTypeToFormatMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 5

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/miui/gallery/util/MediaFile;->sFileTypeMap:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/miui/gallery/util/MediaFile;->sMimeTypeMap:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/miui/gallery/util/MediaFile;->sFileTypeToFormatMap:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/miui/gallery/util/MediaFile;->sMimeTypeToFormatMap:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/miui/gallery/util/MediaFile;->sFormatToMimeTypeMap:Ljava/util/HashMap;

    const-string v0, "MP3"

    const-string v1, "audio/mpeg"

    const/16 v2, 0x3009

    const/4 v3, 0x1

    invoke-static {v0, v3, v1, v2}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;I)V

    const-string v0, "MPGA"

    const-string v1, "audio/mpeg"

    invoke-static {v0, v3, v1, v2}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;I)V

    const-string v0, "M4A"

    const-string v1, "audio/mp4"

    const/16 v2, 0x300b

    const/4 v3, 0x2

    invoke-static {v0, v3, v1, v2}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;I)V

    const-string v0, "WAV"

    const-string v1, "audio/x-wav"

    const/4 v3, 0x3

    const/16 v4, 0x3008

    invoke-static {v0, v3, v1, v4}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;I)V

    const-string v0, "AMR"

    const-string v1, "audio/amr"

    const/4 v3, 0x4

    invoke-static {v0, v3, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "AWB"

    const-string v1, "audio/amr-wb"

    const/4 v3, 0x5

    invoke-static {v0, v3, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "WMA"

    const-string v1, "audio/x-ms-wma"

    const/4 v3, 0x6

    const v4, 0xb901

    invoke-static {v0, v3, v1, v4}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;I)V

    const-string v0, "OGG"

    const-string v1, "audio/ogg"

    const v3, 0xb902

    const/4 v4, 0x7

    invoke-static {v0, v4, v1, v3}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;I)V

    const-string v0, "OGG"

    const-string v1, "application/ogg"

    invoke-static {v0, v4, v1, v3}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;I)V

    const-string v0, "OGA"

    const-string v1, "application/ogg"

    invoke-static {v0, v4, v1, v3}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;I)V

    const-string v0, "AAC"

    const-string v1, "audio/aac"

    const v3, 0xb903

    const/16 v4, 0x8

    invoke-static {v0, v4, v1, v3}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;I)V

    const-string v0, "AAC"

    const-string v1, "audio/aac-adts"

    invoke-static {v0, v4, v1, v3}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;I)V

    const-string v0, "MKA"

    const-string v1, "audio/x-matroska"

    const/16 v3, 0x9

    invoke-static {v0, v3, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "MID"

    const-string v1, "audio/midi"

    const/16 v3, 0xb

    invoke-static {v0, v3, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "MIDI"

    const-string v1, "audio/midi"

    invoke-static {v0, v3, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "XMF"

    const-string v1, "audio/midi"

    invoke-static {v0, v3, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "RTTTL"

    const-string v1, "audio/midi"

    invoke-static {v0, v3, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "SMF"

    const-string v1, "audio/sp-midi"

    const/16 v4, 0xc

    invoke-static {v0, v4, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "IMY"

    const-string v1, "audio/imelody"

    const/16 v4, 0xd

    invoke-static {v0, v4, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "RTX"

    const-string v1, "audio/midi"

    invoke-static {v0, v3, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "OTA"

    const-string v1, "audio/midi"

    invoke-static {v0, v3, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "MXMF"

    const-string v1, "audio/midi"

    invoke-static {v0, v3, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "MPEG"

    const-string v1, "video/mpeg"

    const/16 v3, 0x15

    invoke-static {v0, v3, v1, v2}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;I)V

    const-string v0, "MPG"

    const-string v1, "video/mpeg"

    invoke-static {v0, v3, v1, v2}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;I)V

    const-string v0, "MP4"

    const-string v1, "video/mp4"

    invoke-static {v0, v3, v1, v2}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;I)V

    const-string v0, "M4V"

    const-string v1, "video/mp4"

    const/16 v3, 0x16

    invoke-static {v0, v3, v1, v2}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;I)V

    const-string v0, "3GP"

    const-string v1, "video/3gpp"

    const/16 v2, 0x17

    const v3, 0xb984

    invoke-static {v0, v2, v1, v3}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;I)V

    const-string v0, "3GPP"

    const-string v1, "video/3gpp"

    invoke-static {v0, v2, v1, v3}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;I)V

    const-string v0, "3G2"

    const-string v1, "video/3gpp2"

    const/16 v2, 0x18

    invoke-static {v0, v2, v1, v3}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;I)V

    const-string v0, "3GPP2"

    const-string v1, "video/3gpp2"

    invoke-static {v0, v2, v1, v3}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;I)V

    const-string v0, "MKV"

    const-string v1, "video/x-matroska"

    const/16 v2, 0x1b

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "WEBM"

    const-string v1, "video/webm"

    const/16 v2, 0x1e

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "TS"

    const-string v1, "video/mp2ts"

    const/16 v2, 0x1c

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "AVI"

    const-string v1, "video/avi"

    const/16 v2, 0x1d

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "WMV"

    const-string v1, "video/x-ms-wmv"

    const/16 v2, 0x19

    const v3, 0xb981

    invoke-static {v0, v2, v1, v3}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;I)V

    const-string v0, "ASF"

    const-string v1, "video/x-ms-asf"

    const/16 v2, 0x1a

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "JPG"

    const-string v1, "image/jpeg"

    const/16 v2, 0x3801

    const/16 v3, 0x1f

    invoke-static {v0, v3, v1, v2}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;I)V

    const-string v0, "JPEG"

    const-string v1, "image/jpeg"

    invoke-static {v0, v3, v1, v2}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;I)V

    const-string v0, "GIF"

    const-string v1, "image/gif"

    const/16 v2, 0x20

    const/16 v3, 0x3807

    invoke-static {v0, v2, v1, v3}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;I)V

    const-string v0, "PNG"

    const-string v1, "image/png"

    const/16 v2, 0x21

    const/16 v3, 0x380b

    invoke-static {v0, v2, v1, v3}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;I)V

    const-string v0, "BMP"

    const-string v1, "image/x-ms-bmp"

    const/16 v2, 0x22

    const/16 v3, 0x3804

    invoke-static {v0, v2, v1, v3}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;I)V

    const-string v0, "WBMP"

    const-string v1, "image/vnd.wap.wbmp"

    const/16 v2, 0x23

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "WEBP"

    const-string v1, "image/webp"

    const/16 v2, 0x24

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "M3U"

    const-string v1, "audio/x-mpegurl"

    const/16 v2, 0x29

    const v3, 0xba11

    invoke-static {v0, v2, v1, v3}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;I)V

    const-string v0, "M3U"

    const-string v1, "application/x-mpegurl"

    invoke-static {v0, v2, v1, v3}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;I)V

    const-string v0, "PLS"

    const-string v1, "audio/x-scpls"

    const/16 v2, 0x2a

    const v3, 0xba14

    invoke-static {v0, v2, v1, v3}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;I)V

    const-string v0, "WPL"

    const-string v1, "application/vnd.ms-wpl"

    const/16 v2, 0x2b

    const v3, 0xba10

    invoke-static {v0, v2, v1, v3}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;I)V

    const-string v0, "M3U8"

    const-string v1, "application/vnd.apple.mpegurl"

    const/16 v2, 0x2c

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "M3U8"

    const-string v1, "audio/mpegurl"

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "M3U8"

    const-string v1, "audio/x-mpegurl"

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "FL"

    const-string v1, "application/x-android-drm-fl"

    const/16 v2, 0x33

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "DCF"

    const-string v1, "application/vnd.oma.drm.content"

    const/16 v2, 0x34

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "TXT"

    const-string v1, "text/plain"

    const/16 v2, 0x64

    const/16 v3, 0x3004

    invoke-static {v0, v2, v1, v3}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;I)V

    const-string v0, "HTM"

    const-string v1, "text/html"

    const/16 v2, 0x65

    const/16 v3, 0x3005

    invoke-static {v0, v2, v1, v3}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;I)V

    const-string v0, "HTML"

    const-string v1, "text/html"

    invoke-static {v0, v2, v1, v3}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;I)V

    const-string v0, "PDF"

    const-string v1, "application/pdf"

    const/16 v2, 0x66

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "DOC"

    const-string v1, "application/msword"

    const/16 v2, 0x68

    const v3, 0xba83

    invoke-static {v0, v2, v1, v3}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;I)V

    const-string v0, "XLS"

    const-string v1, "application/vnd.ms-excel"

    const/16 v2, 0x69

    const v3, 0xba85

    invoke-static {v0, v2, v1, v3}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;I)V

    const-string v0, "PPT"

    const-string v1, "application/mspowerpoint"

    const/16 v2, 0x6a

    const v3, 0xba86

    invoke-static {v0, v2, v1, v3}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;I)V

    const-string v0, "FLAC"

    const-string v1, "audio/flac"

    const/16 v2, 0xa

    const v3, 0xb906

    invoke-static {v0, v2, v1, v3}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;I)V

    const-string v0, "ZIP"

    const-string v1, "application/zip"

    const/16 v2, 0x6b

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "MPG"

    const-string v1, "video/mp2p"

    const/16 v2, 0xc8

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "MPEG"

    const-string v1, "video/mp2p"

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "DIVX"

    const-string v1, "video/divx"

    const/16 v2, 0xc9

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "FLV"

    const-string v1, "video/flv"

    const/16 v2, 0xca

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "MPD"

    const-string v1, "application/dash+xml"

    const/16 v2, 0x2d

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "QCP"

    const-string v1, "audio/qcelp"

    const/16 v2, 0x12f

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "AC3"

    const-string v1, "audio/ac3"

    const/16 v2, 0x12e

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "EC3"

    const-string v1, "audio/eac3"

    const/16 v2, 0x131

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "AIF"

    const-string v1, "audio/x-aiff"

    const/16 v2, 0x132

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "AIFF"

    const-string v1, "audio/x-aiff"

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "APE"

    const-string v1, "audio/x-ape"

    const/16 v2, 0x133

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/util/MediaFile;->addMiuiFileType()V

    return-void
.end method

.method static addFileType(Ljava/lang/String;ILjava/lang/String;)V
    .locals 2

    sget-object v0, Lcom/miui/gallery/util/MediaFile;->sFileTypeMap:Ljava/util/HashMap;

    new-instance v1, Lcom/miui/gallery/util/MediaFile$MediaFileType;

    invoke-direct {v1, p1, p2}, Lcom/miui/gallery/util/MediaFile$MediaFileType;-><init>(ILjava/lang/String;)V

    invoke-virtual {v0, p0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lcom/miui/gallery/util/MediaFile;->sMimeTypeMap:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method static addFileType(Ljava/lang/String;ILjava/lang/String;I)V
    .locals 1

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    sget-object p1, Lcom/miui/gallery/util/MediaFile;->sFileTypeToFormatMap:Ljava/util/HashMap;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p1, p0, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lcom/miui/gallery/util/MediaFile;->sMimeTypeToFormatMap:Ljava/util/HashMap;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lcom/miui/gallery/util/MediaFile;->sFormatToMimeTypeMap:Ljava/util/HashMap;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private static addMiuiFileType()V
    .locals 3

    const-string v0, "FLV"

    const-string v1, "video/x-flv"

    const/16 v2, 0x7d0

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "RM"

    const-string v1, "video/x-pn-realvideo"

    const/16 v2, 0x7d1

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "RMVB"

    const-string v1, "video/x-pn-realvideo"

    const/16 v2, 0x7d2

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "MOV"

    const-string v1, "video/quicktime"

    const/16 v2, 0x7d3

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "VOB"

    const-string v1, "video/mpeg"

    const/16 v2, 0x7d4

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "F4V"

    const-string v1, "video/mp4"

    const/16 v2, 0x7d5

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    const-string v0, "3G2B"

    const-string v1, "video/3gpp"

    const/16 v2, 0x7d6

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/MediaFile;->addFileType(Ljava/lang/String;ILjava/lang/String;)V

    return-void
.end method

.method public static getFileType(Ljava/lang/String;)Lcom/miui/gallery/util/MediaFile$MediaFileType;
    .locals 2

    const/16 v0, 0x2e

    invoke-virtual {p0, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    if-gez v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    sget-object v1, Lcom/miui/gallery/util/MediaFile;->sFileTypeMap:Ljava/util/HashMap;

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    sget-object v0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v0}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/util/MediaFile$MediaFileType;

    return-object p0
.end method

.method public static getMimeTypeForFile(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-static {p0}, Lcom/miui/gallery/util/MediaFile;->getFileType(Ljava/lang/String;)Lcom/miui/gallery/util/MediaFile$MediaFileType;

    move-result-object p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    iget-object p0, p0, Lcom/miui/gallery/util/MediaFile$MediaFileType;->mimeType:Ljava/lang/String;

    :goto_0
    return-object p0
.end method
