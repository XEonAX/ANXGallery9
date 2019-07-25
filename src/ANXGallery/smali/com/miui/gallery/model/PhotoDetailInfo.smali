.class public Lcom/miui/gallery/model/PhotoDetailInfo;
.super Ljava/lang/Object;
.source "PhotoDetailInfo.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable<",
        "Ljava/util/Map$Entry<",
        "Ljava/lang/Integer;",
        "Ljava/lang/Object;",
        ">;>;"
    }
.end annotation


# instance fields
.field private mDetails:Ljava/util/TreeMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/TreeMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/model/PhotoDetailInfo;->mDetails:Ljava/util/TreeMap;

    return-void
.end method

.method public static extractExifInfo(Lcom/miui/gallery/model/PhotoDetailInfo;Ljava/lang/String;Z)V
    .locals 6

    if-eqz p0, :cond_5

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_1

    :cond_0
    :try_start_0
    new-instance v0, Landroid/support/media/ExifInterface;

    invoke-direct {v0, p1}, Landroid/support/media/ExifInterface;-><init>(Ljava/lang/String;)V

    if-eqz p2, :cond_4

    const-string p2, "ImageWidth"

    const/4 v1, 0x0

    invoke-virtual {v0, p2, v1}, Landroid/support/media/ExifInterface;->getAttributeInt(Ljava/lang/String;I)I

    move-result p2

    const-string v2, "ImageLength"

    invoke-virtual {v0, v2, v1}, Landroid/support/media/ExifInterface;->getAttributeInt(Ljava/lang/String;I)I

    move-result v1

    if-lez p2, :cond_1

    if-gtz v1, :cond_2

    :cond_1
    invoke-static {p1}, Lmiui/graphics/BitmapFactory;->getBitmapSize(Ljava/lang/String;)Landroid/graphics/BitmapFactory$Options;

    move-result-object p2

    iget v1, p2, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget p2, p2, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    move v5, v1

    move v1, p2

    move p2, v5

    :cond_2
    const/4 v2, 0x4

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p0, v2, p2}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V

    const/4 p2, 0x5

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, p2, v1}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V

    invoke-static {v0}, Lcom/miui/gallery/util/ExifUtil;->getGpsDateTime(Landroid/support/media/ExifInterface;)J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long p2, v1, v3

    if-gtz p2, :cond_3

    new-instance p2, Ljava/io/File;

    invoke-direct {p2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/io/File;->lastModified()J

    move-result-wide v1

    :cond_3
    const/4 p1, 0x1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V

    invoke-virtual {v0}, Landroid/support/media/ExifInterface;->getLatLong()[D

    move-result-object p1

    if-eqz p1, :cond_4

    const/4 p2, 0x6

    invoke-virtual {p0, p2, p1}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V

    :cond_4
    const/16 p1, 0x65

    const-string p2, "Model"

    invoke-virtual {v0, p2}, Landroid/support/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V

    const/16 p1, 0x64

    const-string p2, "Make"

    invoke-virtual {v0, p2}, Landroid/support/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V

    const/16 p1, 0x69

    const-string p2, "FNumber"

    invoke-virtual {v0, p2}, Landroid/support/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V

    const/16 p1, 0x67

    const-string p2, "FocalLength"

    invoke-virtual {v0, p2}, Landroid/support/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/miui/gallery/model/PhotoDetailInfo;->wrapFocalLength(Ljava/lang/String;)Ljava/lang/Double;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V

    const/16 p1, 0x6b

    const-string p2, "ExposureTime"

    invoke-virtual {v0, p2}, Landroid/support/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V

    const/16 p1, 0x6c

    const-string p2, "ISOSpeedRatings"

    invoke-virtual {v0, p2}, Landroid/support/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V

    const/16 p1, 0x66

    const-string p2, "Flash"

    invoke-virtual {v0, p2}, Landroid/support/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V

    const/16 p1, 0xa

    const-string p2, "Orientation"

    invoke-virtual {v0, p2}, Landroid/support/media/ExifInterface;->getAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "PhotoDetailInfo"

    invoke-static {p1, p0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void

    :cond_5
    :goto_1
    return-void
.end method

.method public static extractVideoAttr(Lcom/miui/gallery/model/PhotoDetailInfo;Ljava/lang/String;)V
    .locals 5

    if-eqz p0, :cond_3

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    :try_start_0
    invoke-static {p1}, Lcom/miui/gallery/util/VideoAttrsReader;->read(Ljava/lang/String;)Lcom/miui/gallery/util/VideoAttrsReader;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/util/VideoAttrsReader;->getDateTaken()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_1

    const/4 v4, 0x1

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p0, v4, v0}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V

    :cond_1
    invoke-virtual {p1}, Lcom/miui/gallery/util/VideoAttrsReader;->getDuration()J

    move-result-wide v0

    cmp-long p1, v0, v2

    if-lez p1, :cond_2

    const/4 p1, 0x7

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    long-to-int v0, v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "PhotoDetailInfo"

    invoke-static {p1, p0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_2
    :goto_0
    return-void

    :cond_3
    :goto_1
    return-void
.end method

.method public static wrapFocalLength(Ljava/lang/String;)Ljava/lang/Double;
    .locals 7

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    :cond_0
    :try_start_0
    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v2, -0x1

    if-ne v0, v2, :cond_1

    return-object v1

    :cond_1
    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmpl-double v6, v2, v4

    if-nez v6, :cond_2

    return-object v1

    :cond_2
    const/4 v4, 0x0

    invoke-virtual {p0, v4, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v4

    div-double/2addr v4, v2

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    return-object v1
.end method


# virtual methods
.method public addDetail(ILjava/lang/Object;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/model/PhotoDetailInfo;->mDetails:Ljava/util/TreeMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public getDetail(I)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/model/PhotoDetailInfo;->mDetails:Ljava/util/TreeMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/model/PhotoDetailInfo;->mDetails:Ljava/util/TreeMap;

    invoke-virtual {v0}, Ljava/util/TreeMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public removeDetail(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/model/PhotoDetailInfo;->mDetails:Ljava/util/TreeMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/TreeMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
