.class public Lcom/miui/gallery/util/FileMimeUtil;
.super Lcom/miui/gallery/util/BaseFileMimeUtil;
.source "FileMimeUtil.java"


# static fields
.field private static sSupportUploadMimeTypeMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static getSupportUploadMimeType(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-static {p0}, Lcom/miui/gallery/util/MediaFile;->getMimeTypeForFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    invoke-static {v0}, Lcom/miui/gallery/util/FileMimeUtil;->isImageFromMimeType(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {v0}, Lcom/miui/gallery/util/FileMimeUtil;->isVideoFromMimeType(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    :cond_0
    const/16 v1, 0x2e

    invoke-virtual {p0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    if-ltz v1, :cond_2

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/util/FileMimeUtil;->getSupportedMimeTypeByExt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    return-object v1

    :cond_1
    invoke-static {v0}, Lcom/miui/gallery/util/FileMimeUtil;->isVideoFromMimeType(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    :try_start_0
    sget-object v0, Lcom/miui/gallery/util/FileMimeUtil;->VIDEO_MIMES:[Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;

    invoke-static {p0, v0}, Lcom/miui/gallery/util/FileMimeUtil;->rawGetMimeType(Ljava/lang/String;[Lcom/miui/gallery/util/BaseFileMimeUtil$Mime;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string v0, "BaseFileMimeUtil"

    invoke-static {v0, p0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    move-object p0, v1

    :goto_0
    if-eqz p0, :cond_2

    return-object p0

    :cond_2
    const-string p0, "*/*"

    return-object p0
.end method

.method private static getSupportedMimeTypeByExt(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/miui/gallery/util/FileMimeUtil;->sSupportUploadMimeTypeMap:Ljava/util/HashMap;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getUploadSupportedFileTypes()Ljava/util/HashMap;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/util/FileMimeUtil;->sSupportUploadMimeTypeMap:Ljava/util/HashMap;

    :cond_0
    sget-object v0, Lcom/miui/gallery/util/FileMimeUtil;->sSupportUploadMimeTypeMap:Ljava/util/HashMap;

    if-nez v0, :cond_1

    const/4 p0, 0x0

    return-object p0

    :cond_1
    sget-object v0, Lcom/miui/gallery/util/FileMimeUtil;->sSupportUploadMimeTypeMap:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method
