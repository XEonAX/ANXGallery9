.class final Lcom/miui/gallery/util/ExifUtil$3;
.super Ljava/lang/Object;
.source "ExifUtil.java"

# interfaces
.implements Lcom/miui/gallery/util/ExifUtil$ExifCreator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/util/ExifUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/util/ExifUtil$ExifCreator<",
        "Lcom/miui/gallery3d/exif/ExifInterface;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create(Ljava/io/FileDescriptor;)Lcom/miui/gallery3d/exif/ExifInterface;
    .locals 1

    const-string p1, "ExifUtil"

    const-string v0, "Not support create com.miui.gallery3d.exif.ExifInterface from fileDescriptor"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    return-object p1
.end method

.method public create(Ljava/io/InputStream;)Lcom/miui/gallery3d/exif/ExifInterface;
    .locals 4

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    :cond_0
    :try_start_0
    new-instance v1, Lcom/miui/gallery3d/exif/ExifInterface;

    invoke-direct {v1}, Lcom/miui/gallery3d/exif/ExifInterface;-><init>()V

    invoke-virtual {v1, p1}, Lcom/miui/gallery3d/exif/ExifInterface;->readExif(Ljava/io/InputStream;)V
    :try_end_0
    .catch Lcom/miui/gallery3d/exif/ExifInvalidFormatException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception v1

    const-string v2, "ExifUtil"

    const-string v3, "failed to create exif interface from %s, %s"

    invoke-static {v2, v3, p1, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    :catch_1
    move-exception v1

    const-string v2, "ExifUtil"

    const-string v3, "failed to create exif interface from %s, %s"

    invoke-static {v2, v3, p1, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_0
    return-object v0
.end method

.method public create(Ljava/lang/String;)Lcom/miui/gallery3d/exif/ExifInterface;
    .locals 4

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    :cond_0
    :try_start_0
    new-instance v0, Lcom/miui/gallery3d/exif/ExifInterface;

    invoke-direct {v0}, Lcom/miui/gallery3d/exif/ExifInterface;-><init>()V

    invoke-virtual {v0, p1}, Lcom/miui/gallery3d/exif/ExifInterface;->readExif(Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/miui/gallery3d/exif/ExifInvalidFormatException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    const-string v2, "ExifUtil"

    const-string v3, "failed to create exif interface from %s, %s"

    invoke-static {v2, v3, p1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    :catch_1
    move-exception v0

    const-string v2, "ExifUtil"

    const-string v3, "failed to create exif interface from %s, %s"

    invoke-static {v2, v3, p1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_0
    return-object v1
.end method

.method public bridge synthetic create(Ljava/io/FileDescriptor;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/util/ExifUtil$3;->create(Ljava/io/FileDescriptor;)Lcom/miui/gallery3d/exif/ExifInterface;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic create(Ljava/io/InputStream;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/util/ExifUtil$3;->create(Ljava/io/InputStream;)Lcom/miui/gallery3d/exif/ExifInterface;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic create(Ljava/lang/String;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/util/ExifUtil$3;->create(Ljava/lang/String;)Lcom/miui/gallery3d/exif/ExifInterface;

    move-result-object p1

    return-object p1
.end method
