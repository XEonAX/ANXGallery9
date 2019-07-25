.class Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;
.super Ljava/lang/Object;
.source "SlimController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cleaner/slim/SlimController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MediaItem"
.end annotation


# static fields
.field public static final PROJECTION:[Ljava/lang/String;


# instance fields
.field public dateTime:Ljava/lang/String;

.field public fileName:Ljava/lang/String;

.field public gpsDateStamp:Ljava/lang/String;

.field public gpsTimeStamp:Ljava/lang/String;

.field public id:I

.field public localFilePath:Ljava/lang/String;

.field public mixDateTime:J

.field public orientation:I

.field public serverType:I

.field public sha1:Ljava/lang/String;

.field public thumbnailFilePath:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 11

    const-string v0, "_id"

    const-string v1, "fileName"

    const-string v2, "sha1"

    const-string v3, "exifOrientation"

    const-string v4, "exifDateTime"

    const-string v5, "exifGPSDateStamp"

    const-string v6, "exifGPSTimeStamp"

    const-string v7, "mixedDateTime"

    const-string v8, "localFile"

    const-string v9, "thumbnailFile"

    const-string v10, "serverType"

    filled-new-array/range {v0 .. v10}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static cursorToEntity(Landroid/database/Cursor;)Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;
    .locals 4

    new-instance v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;

    invoke-direct {v0}, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;-><init>()V

    const/4 v1, 0x0

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    iput v2, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->id:I

    const/4 v2, 0x1

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->fileName:Ljava/lang/String;

    const/4 v2, 0x2

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->sha1:Ljava/lang/String;

    const/4 v2, 0x3

    invoke-interface {p0, v2}, Landroid/database/Cursor;->isNull(I)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_0

    :cond_0
    invoke-interface {p0, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    :goto_0
    iput v1, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->orientation:I

    const/4 v1, 0x4

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->dateTime:Ljava/lang/String;

    const/4 v1, 0x5

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->gpsDateStamp:Ljava/lang/String;

    const/4 v1, 0x6

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->gpsTimeStamp:Ljava/lang/String;

    const/4 v1, 0x7

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    iput-wide v1, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->mixDateTime:J

    const/16 v1, 0x8

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->localFilePath:Ljava/lang/String;

    const/16 v1, 0x9

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->thumbnailFilePath:Ljava/lang/String;

    const/16 v1, 0xa

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result p0

    iput p0, v0, Lcom/miui/gallery/cleaner/slim/SlimController$MediaItem;->serverType:I

    return-object v0
.end method
