.class public Lcn/kuaipan/android/http/multipart/FileValuePair;
.super Ljava/lang/Object;
.source "FileValuePair.java"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Lorg/apache/http/NameValuePair;


# instance fields
.field private final file:Ljava/io/File;

.field private final name:Ljava/lang/String;


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x1

    if-ne p0, p1, :cond_1

    return v1

    :cond_1
    instance-of v2, p1, Lcn/kuaipan/android/http/multipart/FileValuePair;

    if-eqz v2, :cond_3

    check-cast p1, Lcn/kuaipan/android/http/multipart/FileValuePair;

    iget-object v2, p0, Lcn/kuaipan/android/http/multipart/FileValuePair;->name:Ljava/lang/String;

    iget-object v3, p1, Lcn/kuaipan/android/http/multipart/FileValuePair;->name:Ljava/lang/String;

    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcn/kuaipan/android/http/multipart/FileValuePair;->file:Ljava/io/File;

    iget-object p1, p1, Lcn/kuaipan/android/http/multipart/FileValuePair;->file:Ljava/io/File;

    invoke-static {v2, p1}, Lorg/apache/http/util/LangUtils;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    const/4 v0, 0x1

    :cond_2
    return v0

    :cond_3
    return v0
.end method

.method public getFile()Ljava/io/File;
    .locals 1

    iget-object v0, p0, Lcn/kuaipan/android/http/multipart/FileValuePair;->file:Ljava/io/File;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcn/kuaipan/android/http/multipart/FileValuePair;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcn/kuaipan/android/http/multipart/FileValuePair;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lcn/kuaipan/android/http/multipart/FileValuePair;->name:Ljava/lang/String;

    const/16 v1, 0x11

    invoke-static {v1, v0}, Lorg/apache/http/util/LangUtils;->hashCode(ILjava/lang/Object;)I

    move-result v0

    iget-object v1, p0, Lcn/kuaipan/android/http/multipart/FileValuePair;->file:Ljava/io/File;

    invoke-static {v0, v1}, Lorg/apache/http/util/LangUtils;->hashCode(ILjava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcn/kuaipan/android/http/multipart/FileValuePair;->name:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    iget-object v1, p0, Lcn/kuaipan/android/http/multipart/FileValuePair;->file:Ljava/io/File;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcn/kuaipan/android/http/multipart/FileValuePair;->file:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, 0xc

    add-int/2addr v0, v1

    :cond_0
    new-instance v1, Lorg/apache/http/util/CharArrayBuffer;

    invoke-direct {v1, v0}, Lorg/apache/http/util/CharArrayBuffer;-><init>(I)V

    iget-object v0, p0, Lcn/kuaipan/android/http/multipart/FileValuePair;->name:Ljava/lang/String;

    invoke-virtual {v1, v0}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    iget-object v0, p0, Lcn/kuaipan/android/http/multipart/FileValuePair;->file:Ljava/io/File;

    if-eqz v0, :cond_1

    const-string v0, "=File[path="

    invoke-virtual {v1, v0}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    iget-object v0, p0, Lcn/kuaipan/android/http/multipart/FileValuePair;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    const-string v0, "]"

    invoke-virtual {v1, v0}, Lorg/apache/http/util/CharArrayBuffer;->append(Ljava/lang/String;)V

    :cond_1
    invoke-virtual {v1}, Lorg/apache/http/util/CharArrayBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
