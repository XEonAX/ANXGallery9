.class public Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginInfo;
.super Ljava/lang/Object;
.source "OriginUrlRequestor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/picker/uri/OriginUrlRequestor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "OriginInfo"
.end annotation


# static fields
.field private static FILE_SHA1:Ljava/lang/String; = "sha1"

.field private static FILE_URI:Ljava/lang/String; = "file_uri"

.field private static ORIGIN_DOWNLOAD_INFO:Ljava/lang/String; = "origin_download_info"

.field private static ORIGIN_HEIGHT:Ljava/lang/String; = "origin_height"

.field private static ORIGIN_WIDTH:Ljava/lang/String; = "origin_width"


# instance fields
.field private mFileUri:Landroid/net/Uri;

.field private mHeight:I

.field private mOriginDownloadInfo:Lorg/json/JSONObject;

.field private mSha1:Ljava/lang/String;

.field private mWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/net/Uri;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginInfo;->mFileUri:Landroid/net/Uri;

    iput-object p2, p0, Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginInfo;->mSha1:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public setOriginDownloadInfo(Lorg/json/JSONObject;II)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginInfo;->mOriginDownloadInfo:Lorg/json/JSONObject;

    iput p2, p0, Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginInfo;->mHeight:I

    iput p3, p0, Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginInfo;->mWidth:I

    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 3

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    sget-object v1, Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginInfo;->FILE_URI:Ljava/lang/String;

    iget-object v2, p0, Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginInfo;->mFileUri:Landroid/net/Uri;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    sget-object v1, Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginInfo;->FILE_SHA1:Ljava/lang/String;

    iget-object v2, p0, Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginInfo;->mSha1:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-object v1, p0, Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginInfo;->mOriginDownloadInfo:Lorg/json/JSONObject;

    if-eqz v1, :cond_0

    sget-object v1, Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginInfo;->ORIGIN_DOWNLOAD_INFO:Ljava/lang/String;

    iget-object v2, p0, Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginInfo;->mOriginDownloadInfo:Lorg/json/JSONObject;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    sget-object v1, Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginInfo;->ORIGIN_HEIGHT:Ljava/lang/String;

    iget v2, p0, Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginInfo;->mHeight:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    sget-object v1, Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginInfo;->ORIGIN_WIDTH:Ljava/lang/String;

    iget v2, p0, Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginInfo;->mWidth:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    :cond_0
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    const-string v0, "OriginUrlRequestor"

    const-string v1, "originInfo to json error"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    return-object v0
.end method
