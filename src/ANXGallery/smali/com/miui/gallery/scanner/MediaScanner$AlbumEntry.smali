.class Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;
.super Ljava/lang/Object;
.source "MediaScanner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/scanner/MediaScanner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AlbumEntry"
.end annotation


# instance fields
.field isModified:Z

.field isOnlyLinkFolder:Z

.field isShareAlbum:Z

.field mAlbumName:Ljava/lang/String;

.field mAttributes:I

.field mDateModified:J

.field mEditedColumns:Ljava/lang/String;

.field mID:J

.field mLocalFlag:I

.field mServerID:Ljava/lang/String;

.field mServerStatus:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mEditedColumns:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/scanner/MediaScanner$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;-><init>()V

    return-void
.end method

.method public static isSyncable(I)Z
    .locals 4

    int-to-long v0, p0

    const-wide/16 v2, 0x1

    and-long/2addr v0, v2

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static shouldScan(Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;)Z
    .locals 2

    if-eqz p0, :cond_0

    iget v0, p0, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mLocalFlag:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mServerStatus:Ljava/lang/String;

    const-string v1, "deleted"

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object p0, p0, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mServerStatus:Ljava/lang/String;

    const-string v0, "purged"

    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method
