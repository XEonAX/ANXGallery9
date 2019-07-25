.class Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper$FileEntry;
.super Ljava/lang/Object;
.source "MediaScanner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FileEntry"
.end annotation


# instance fields
.field mDateModified:J

.field mFileSize:J

.field mIsThumbnail:Z


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/scanner/MediaScanner$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper$FileEntry;-><init>()V

    return-void
.end method
