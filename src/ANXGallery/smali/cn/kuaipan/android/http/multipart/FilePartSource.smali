.class public Lcn/kuaipan/android/http/multipart/FilePartSource;
.super Ljava/lang/Object;
.source "FilePartSource.java"

# interfaces
.implements Lcn/kuaipan/android/http/multipart/PartSource;


# instance fields
.field private file:Ljava/io/File;

.field private fileName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcn/kuaipan/android/http/multipart/FilePartSource;->file:Ljava/io/File;

    iput-object v0, p0, Lcn/kuaipan/android/http/multipart/FilePartSource;->fileName:Ljava/lang/String;

    iput-object p1, p0, Lcn/kuaipan/android/http/multipart/FilePartSource;->file:Ljava/io/File;

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Ljava/io/File;->canRead()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcn/kuaipan/android/http/multipart/FilePartSource;->fileName:Ljava/lang/String;

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/io/FileNotFoundException;

    const-string v0, "File is not readable."

    invoke-direct {p1, v0}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/io/FileNotFoundException;

    const-string v0, "File is not a normal file."

    invoke-direct {p1, v0}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method public createInputStream()Ljava/io/InputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    iget-object v0, p0, Lcn/kuaipan/android/http/multipart/FilePartSource;->file:Ljava/io/File;

    if-eqz v0, :cond_0

    new-instance v0, Ljava/io/FileInputStream;

    iget-object v1, p0, Lcn/kuaipan/android/http/multipart/FilePartSource;->file:Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    return-object v0

    :cond_0
    new-instance v0, Ljava/io/ByteArrayInputStream;

    const/4 v1, 0x0

    new-array v1, v1, [B

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    return-object v0
.end method

.method public getFileName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcn/kuaipan/android/http/multipart/FilePartSource;->fileName:Ljava/lang/String;

    if-nez v0, :cond_0

    const-string v0, "noname"

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcn/kuaipan/android/http/multipart/FilePartSource;->fileName:Ljava/lang/String;

    :goto_0
    return-object v0
.end method

.method public getLength()J
    .locals 2

    iget-object v0, p0, Lcn/kuaipan/android/http/multipart/FilePartSource;->file:Ljava/io/File;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcn/kuaipan/android/http/multipart/FilePartSource;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    return-wide v0

    :cond_0
    const-wide/16 v0, 0x0

    return-wide v0
.end method
