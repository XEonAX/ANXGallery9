.class public Lcom/miui/gallery/data/GifCvtJpegCache;
.super Ljava/lang/Object;
.source "GifCvtJpegCache.java"


# instance fields
.field private mCurrentLoopPosition:I

.field private final mDestinations:[Ljava/lang/String;

.field private final mInitSuccess:Z

.field private final mSize:I

.field private final mSources:[Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/io/File;I)V
    .locals 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/data/GifCvtJpegCache;->mCurrentLoopPosition:I

    const/4 v1, 0x1

    if-lez p2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    invoke-static {v2}, Lcom/miui/gallery/util/Utils;->assertTrue(Z)V

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {p1}, Ljava/io/File;->mkdirs()Z

    move-result v2

    if-eqz v2, :cond_2

    :cond_1
    invoke-virtual {p1}, Ljava/io/File;->canWrite()Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_1

    :cond_2
    const/4 v1, 0x0

    :goto_1
    iput-boolean v1, p0, Lcom/miui/gallery/data/GifCvtJpegCache;->mInitSuccess:Z

    iput p2, p0, Lcom/miui/gallery/data/GifCvtJpegCache;->mSize:I

    new-array v1, p2, [Ljava/lang/String;

    iput-object v1, p0, Lcom/miui/gallery/data/GifCvtJpegCache;->mSources:[Ljava/lang/String;

    new-array v1, p2, [Ljava/lang/String;

    iput-object v1, p0, Lcom/miui/gallery/data/GifCvtJpegCache;->mDestinations:[Ljava/lang/String;

    :goto_2
    if-ge v0, p2, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/data/GifCvtJpegCache;->mDestinations:[Ljava/lang/String;

    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "gif_cvt"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ".jpg"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, p1, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_3
    return-void
.end method
