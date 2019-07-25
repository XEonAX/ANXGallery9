.class public Lcom/miui/gallery/editor/photo/app/DraftManager;
.super Ljava/lang/Object;
.source "DraftManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/app/DraftManager$OnPreviewRefreshListener;,
        Lcom/miui/gallery/editor/photo/app/DraftManager$PreviewRenderTask;,
        Lcom/miui/gallery/editor/photo/app/DraftManager$ReRenderTask;
    }
.end annotation


# instance fields
.field private mBackgroundTask:Landroid/os/AsyncTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/AsyncTask<",
            "Ljava/lang/Void;",
            "Ljava/lang/Void;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private mBundle:Landroid/os/Bundle;

.field private mContext:Landroid/content/Context;

.field private mEngines:[Lcom/miui/gallery/editor/photo/core/RenderEngine;

.field private mExif:Lcom/miui/gallery3d/exif/ExifInterface;

.field private mExportedHeight:I

.field private mExportedWidth:I

.field private mInSampleSize:I

.field private mIsPreviewSameWithOrigin:Z

.field private mIsScreenshot:Z

.field private mMimeType:Ljava/lang/String;

.field private mOnPreviewRefreshListener:Lcom/miui/gallery/editor/photo/app/DraftManager$OnPreviewRefreshListener;

.field private mOriginHeight:I

.field private mOriginWidth:I

.field private mPreferHeight:I

.field private mPreferWidth:I

.field private mPreview:Landroid/graphics/Bitmap;

.field private volatile mPreviewEnable:Z

.field private mPreviewOriginal:Landroid/graphics/Bitmap;

.field private mRenderDataList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/RenderData;",
            ">;"
        }
    .end annotation
.end field

.field private mSecretInfo:Lcom/miui/gallery/model/SecretInfo;

.field private mSource:Landroid/net/Uri;

.field private volatile mWithWatermark:Z

.field private mXmpExtraManager:Lcom/miui/gallery/editor/photo/app/XmpExtraManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/net/Uri;Landroid/os/Bundle;)V
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/miui/gallery/editor/photo/app/DraftManager;-><init>(Landroid/content/Context;Landroid/net/Uri;Landroid/os/Bundle;Z)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/net/Uri;Landroid/os/Bundle;Z)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lcom/miui/gallery/editor/photo/core/Effect;->values()[Lcom/miui/gallery/editor/photo/core/Effect;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [Lcom/miui/gallery/editor/photo/core/RenderEngine;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mEngines:[Lcom/miui/gallery/editor/photo/core/RenderEngine;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mRenderDataList:Ljava/util/List;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mXmpExtraManager:Lcom/miui/gallery/editor/photo/app/XmpExtraManager;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mWithWatermark:Z

    new-instance v1, Lcom/miui/gallery/editor/photo/app/DraftManager$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/editor/photo/app/DraftManager$1;-><init>(Lcom/miui/gallery/editor/photo/app/DraftManager;)V

    iput-object v1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mBackgroundTask:Landroid/os/AsyncTask;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mSource:Landroid/net/Uri;

    iput-object p3, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mBundle:Landroid/os/Bundle;

    iput-boolean p4, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mWithWatermark:Z

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p2, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    iput p2, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mPreferWidth:I

    iget p1, p1, Landroid/util/DisplayMetrics;->heightPixels:I

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mContext:Landroid/content/Context;

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p4, 0x7f060339

    invoke-virtual {p2, p4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    sub-int/2addr p1, p2

    iput p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mPreferHeight:I

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mSource:Landroid/net/Uri;

    invoke-static {p1}, Lcom/miui/gallery/util/FileUtils;->isScreenShot(Landroid/net/Uri;)Z

    move-result p1

    if-nez p1, :cond_1

    if-eqz p3, :cond_0

    sget-object p1, Lcom/miui/gallery/sdk/editor/Constants;->EXTRA_IS_SCREENSHOT:Ljava/lang/String;

    invoke-virtual {p3, p1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :cond_1
    :goto_0
    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mIsScreenshot:Z

    new-instance p1, Lcom/miui/gallery/model/SecretInfo;

    invoke-direct {p1}, Lcom/miui/gallery/model/SecretInfo;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mSecretInfo:Lcom/miui/gallery/model/SecretInfo;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mSecretInfo:Lcom/miui/gallery/model/SecretInfo;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mSource:Landroid/net/Uri;

    invoke-virtual {p2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p1, Lcom/miui/gallery/model/SecretInfo;->mSecretPath:Ljava/lang/String;

    if-eqz p3, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mSecretInfo:Lcom/miui/gallery/model/SecretInfo;

    const-string p2, "extra_is_secret"

    invoke-virtual {p3, p2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p2

    iput-boolean p2, p1, Lcom/miui/gallery/model/SecretInfo;->mIsSecret:Z

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mSecretInfo:Lcom/miui/gallery/model/SecretInfo;

    const-string p2, "extra_secret_key"

    invoke-virtual {p3, p2}, Landroid/os/Bundle;->getByteArray(Ljava/lang/String;)[B

    move-result-object p2

    iput-object p2, p1, Lcom/miui/gallery/model/SecretInfo;->mSecretKey:[B

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mSecretInfo:Lcom/miui/gallery/model/SecretInfo;

    const-string p2, "photo_secret_id"

    invoke-virtual {p3, p2}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide p2

    iput-wide p2, p1, Lcom/miui/gallery/model/SecretInfo;->mSecretId:J

    :cond_2
    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/app/DraftManager;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mInSampleSize:I

    return p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/app/DraftManager;)Lcom/miui/gallery3d/exif/ExifInterface;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mExif:Lcom/miui/gallery3d/exif/ExifInterface;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/miui/gallery/editor/photo/app/DraftManager;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mRenderDataList:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$1100(Lcom/miui/gallery/editor/photo/app/DraftManager;)[Lcom/miui/gallery/editor/photo/core/RenderEngine;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mEngines:[Lcom/miui/gallery/editor/photo/core/RenderEngine;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/app/DraftManager;Landroid/graphics/BitmapFactory$Options;I)Landroid/graphics/Bitmap;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/DraftManager;->decodeBitmap(Landroid/graphics/BitmapFactory$Options;I)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/editor/photo/app/DraftManager;)Landroid/graphics/Bitmap;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mPreview:Landroid/graphics/Bitmap;

    return-object p0
.end method

.method static synthetic access$302(Lcom/miui/gallery/editor/photo/app/DraftManager;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mPreview:Landroid/graphics/Bitmap;

    return-object p1
.end method

.method static synthetic access$400(Lcom/miui/gallery/editor/photo/app/DraftManager;)Lcom/miui/gallery/editor/photo/app/DraftManager$OnPreviewRefreshListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mOnPreviewRefreshListener:Lcom/miui/gallery/editor/photo/app/DraftManager$OnPreviewRefreshListener;

    return-object p0
.end method

.method static synthetic access$502(Lcom/miui/gallery/editor/photo/app/DraftManager;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mPreviewEnable:Z

    return p1
.end method

.method static synthetic access$600(Lcom/miui/gallery/editor/photo/app/DraftManager;)Landroid/graphics/Bitmap;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mPreviewOriginal:Landroid/graphics/Bitmap;

    return-object p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/editor/photo/app/DraftManager;)Ljava/io/InputStream;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->getInputStream()Ljava/io/InputStream;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/editor/photo/app/DraftManager;)Lcom/miui/gallery/editor/photo/app/XmpExtraManager;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mXmpExtraManager:Lcom/miui/gallery/editor/photo/app/XmpExtraManager;

    return-object p0
.end method

.method static synthetic access$900(Lcom/miui/gallery/editor/photo/app/DraftManager;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method private checkSecretInfo()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mSecretInfo:Lcom/miui/gallery/model/SecretInfo;

    iget-object v0, v0, Lcom/miui/gallery/model/SecretInfo;->mSecretPath:Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mSecretInfo:Lcom/miui/gallery/model/SecretInfo;

    iget-wide v1, v1, Lcom/miui/gallery/model/SecretInfo;->mSecretId:J

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mSecretInfo:Lcom/miui/gallery/model/SecretInfo;

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/provider/CloudUtils;->getSecretInfo(Landroid/content/Context;JLcom/miui/gallery/model/SecretInfo;)Lcom/miui/gallery/model/SecretInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mSecretInfo:Lcom/miui/gallery/model/SecretInfo;

    :cond_0
    return-void
.end method

.method private decodeBitmap(Landroid/graphics/BitmapFactory$Options;I)Landroid/graphics/Bitmap;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/miui/gallery/editor/photo/utils/Bitmaps;->decodeStream(Ljava/io/InputStream;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-static {v0, p2, p1}, Lcom/miui/gallery/editor/photo/utils/Bitmaps;->joinExif(Landroid/graphics/Bitmap;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/utils/Bitmaps;->setConfig(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1
.end method

.method private getInputStream()Ljava/io/InputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->isSecret()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->checkSecretInfo()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mContext:Landroid/content/Context;

    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mSecretInfo:Lcom/miui/gallery/model/SecretInfo;

    iget-object v2, v2, Lcom/miui/gallery/model/SecretInfo;->mSecretPath:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/editor/photo/utils/IoUtils;->openInputStream(Landroid/content/Context;Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mSecretInfo:Lcom/miui/gallery/model/SecretInfo;

    iget-object v1, v1, Lcom/miui/gallery/model/SecretInfo;->mSecretKey:[B

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mSecretInfo:Lcom/miui/gallery/model/SecretInfo;

    iget-object v1, v1, Lcom/miui/gallery/model/SecretInfo;->mSecretKey:[B

    invoke-static {v0, v1}, Lcom/miui/gallery/util/CryptoUtil;->getDecryptCipherInputStream(Ljava/io/InputStream;[B)Ljavax/crypto/CipherInputStream;

    move-result-object v0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mSource:Landroid/net/Uri;

    invoke-static {v0, v1}, Lcom/miui/gallery/editor/photo/utils/IoUtils;->openInputStream(Landroid/content/Context;Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v0

    :cond_1
    :goto_0
    return-object v0
.end method

.method private getOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;
    .locals 2

    :try_start_0
    const-string v0, "DraftManager"

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mContext:Landroid/content/Context;

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/editor/photo/utils/IoUtils;->openOutputStream(Ljava/lang/String;Landroid/content/Context;Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    const-string v0, "DraftManager"

    invoke-static {v0, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p1, 0x0

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/utils/IoUtils;->close(Ljava/io/Closeable;)V

    return-object p1
.end method

.method private initForBitmapInfo()V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    const-string v0, "DraftManager"

    const-string v1, "decoding bitmap size:%d*%d"

    iget v2, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mOriginHeight:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget v3, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mOriginWidth:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->isSecret()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->checkSecretInfo()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mSource:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mSecretInfo:Lcom/miui/gallery/model/SecretInfo;

    iget-object v1, v1, Lcom/miui/gallery/model/SecretInfo;->mSecretKey:[B

    sget-object v2, Lcom/miui/gallery/util/ExifUtil;->sGallery3DExifCreator:Lcom/miui/gallery/util/ExifUtil$ExifCreator;

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/ExifUtil;->createExifInterface(Ljava/lang/String;[BLcom/miui/gallery/util/ExifUtil$ExifCreator;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery3d/exif/ExifInterface;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mExif:Lcom/miui/gallery3d/exif/ExifInterface;

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/miui/gallery/util/ExifUtil;->sGallery3DExifCreator:Lcom/miui/gallery/util/ExifUtil$ExifCreator;

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/miui/gallery/util/ExifUtil$ExifCreator;->create(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery3d/exif/ExifInterface;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mExif:Lcom/miui/gallery3d/exif/ExifInterface;

    :goto_0
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/miui/gallery/editor/photo/utils/Bitmaps;->decodeStream(Ljava/io/InputStream;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    iget v1, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mExif:Lcom/miui/gallery3d/exif/ExifInterface;

    invoke-static {v3}, Lcom/miui/gallery/util/ExifUtil;->getRotationDegrees(Lcom/miui/gallery3d/exif/ExifInterface;)I

    move-result v3

    const/4 v4, 0x0

    invoke-static {v4, v3, v0}, Lcom/miui/gallery/editor/photo/utils/Bitmaps;->joinExif(Landroid/graphics/Bitmap;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    iget-object v5, v0, Landroid/graphics/BitmapFactory$Options;->outMimeType:Ljava/lang/String;

    iput-object v5, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mMimeType:Ljava/lang/String;

    iget v5, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iput v5, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mOriginWidth:I

    iget v0, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    iput v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mOriginHeight:I

    const-string v0, "DraftManager"

    const-string v5, "decoding bitmap size:%d*%d"

    iget v6, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mOriginHeight:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    iget v7, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mOriginWidth:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v0, v5, v6, v7}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    :try_start_0
    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->getInputStream()Ljava/io/InputStream;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iget-object v4, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mXmpExtraManager:Lcom/miui/gallery/editor/photo/app/XmpExtraManager;

    invoke-virtual {v4, v0, v1, v2, v3}, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->decodeXmpData(Ljava/io/InputStream;III)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const-string v1, "DraftManager"

    invoke-static {v1, v0}, Lcom/miui/gallery/editor/photo/utils/IoUtils;->close(Ljava/lang/String;Ljava/io/Closeable;)V

    const-string v0, "DraftManager"

    const-string v1, "decodeXmpData coast : %s"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v2, v5

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    :catchall_0
    move-exception v1

    goto :goto_1

    :catchall_1
    move-exception v1

    move-object v0, v4

    :goto_1
    const-string v2, "DraftManager"

    invoke-static {v2, v0}, Lcom/miui/gallery/editor/photo/utils/IoUtils;->close(Ljava/lang/String;Ljava/io/Closeable;)V

    throw v1
.end method


# virtual methods
.method public decodeOrigin()Landroid/graphics/Bitmap;
    .locals 4

    :try_start_0
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inMutable:Z

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mContext:Landroid/content/Context;

    iget v2, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mOriginWidth:I

    iget v3, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mOriginHeight:I

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/editor/photo/utils/BigBitmapLoadUtils;->calculateInSampleSize(Landroid/content/Context;II)I

    move-result v1

    iput v1, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mExif:Lcom/miui/gallery3d/exif/ExifInterface;

    invoke-static {v1}, Lcom/miui/gallery/util/ExifUtil;->getRotationDegrees(Lcom/miui/gallery3d/exif/ExifInterface;)I

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/editor/photo/app/DraftManager;->decodeBitmap(Landroid/graphics/BitmapFactory$Options;I)Landroid/graphics/Bitmap;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    const-string v1, "DraftManager"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :catch_1
    move-exception v0

    const-string v1, "DraftManager"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public enqueue(Lcom/miui/gallery/editor/photo/core/RenderData;Lcom/miui/gallery/editor/photo/utils/Callback;)V
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/app/DraftManager$PreviewRenderTask;

    invoke-direct {v0, p0, p2, p1}, Lcom/miui/gallery/editor/photo/app/DraftManager$PreviewRenderTask;-><init>(Lcom/miui/gallery/editor/photo/app/DraftManager;Lcom/miui/gallery/editor/photo/utils/Callback;Lcom/miui/gallery/editor/photo/core/RenderData;)V

    const/4 p1, 0x0

    new-array p1, p1, [Lcom/miui/gallery/editor/photo/core/RenderData;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/app/DraftManager$PreviewRenderTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public export(Landroid/graphics/Bitmap;Landroid/net/Uri;)Z
    .locals 6

    const/4 v0, 0x0

    if-eqz p1, :cond_9

    if-nez p2, :cond_0

    goto/16 :goto_7

    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    iput v1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mExportedWidth:I

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    iput v1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mExportedHeight:I

    invoke-direct {p0, p2}, Lcom/miui/gallery/editor/photo/app/DraftManager;->getOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    move-result-object p2

    if-nez p2, :cond_1

    return v0

    :cond_1
    const/4 v1, 0x0

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mExif:Lcom/miui/gallery3d/exif/ExifInterface;

    if-eqz v2, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mExif:Lcom/miui/gallery3d/exif/ExifInterface;

    invoke-virtual {v1}, Lcom/miui/gallery3d/exif/ExifInterface;->getAllTags()Ljava/util/List;

    move-result-object v1

    :cond_2
    if-eqz v1, :cond_6

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_3

    goto/16 :goto_1

    :cond_3
    const-string v2, "DraftManager"

    const-string v3, "filter exif"

    invoke-static {v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v2, Lcom/miui/gallery3d/exif/ExifInterface;

    invoke-direct {v2}, Lcom/miui/gallery3d/exif/ExifInterface;-><init>()V

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery3d/exif/ExifTag;

    invoke-virtual {v3}, Lcom/miui/gallery3d/exif/ExifTag;->getTagId()S

    move-result v4

    sget v5, Lcom/miui/gallery3d/exif/ExifInterface;->TAG_ORIENTATION:I

    invoke-static {v5}, Lcom/miui/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v5

    if-eq v4, v5, :cond_4

    sget v5, Lcom/miui/gallery3d/exif/ExifInterface;->TAG_IMAGE_WIDTH:I

    invoke-static {v5}, Lcom/miui/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v5

    if-eq v4, v5, :cond_4

    sget v5, Lcom/miui/gallery3d/exif/ExifInterface;->TAG_IMAGE_LENGTH:I

    invoke-static {v5}, Lcom/miui/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v5

    if-eq v4, v5, :cond_4

    sget v5, Lcom/miui/gallery3d/exif/ExifInterface;->TAG_XIAOMI_COMMENT:I

    invoke-static {v5}, Lcom/miui/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v5

    if-eq v4, v5, :cond_4

    sget v5, Lcom/miui/gallery3d/exif/ExifInterface;->TAG_USER_COMMENT:I

    invoke-static {v5}, Lcom/miui/gallery3d/exif/ExifInterface;->getTrueTagKey(I)S

    move-result v5

    if-eq v4, v5, :cond_4

    const/16 v5, -0x7770

    if-eq v4, v5, :cond_4

    const/16 v5, -0x7768

    if-eq v4, v5, :cond_4

    const/16 v5, -0x7769

    if-eq v4, v5, :cond_4

    const/16 v5, -0x5afd

    if-eq v4, v5, :cond_4

    invoke-virtual {v2, v3}, Lcom/miui/gallery3d/exif/ExifInterface;->setTag(Lcom/miui/gallery3d/exif/ExifTag;)Lcom/miui/gallery3d/exif/ExifTag;

    goto :goto_0

    :cond_4
    const-string v3, "DraftManager"

    const-string v4, "skip user comment"

    invoke-static {v3, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_5
    sget v1, Lcom/miui/gallery3d/exif/ExifInterface;->TAG_ORIENTATION:I

    invoke-static {v0}, Lcom/miui/gallery3d/exif/ExifInterface;->getOrientationValueForRotation(I)S

    move-result v3

    invoke-static {v3}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Lcom/miui/gallery3d/exif/ExifInterface;->buildTag(ILjava/lang/Object;)Lcom/miui/gallery3d/exif/ExifTag;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/miui/gallery3d/exif/ExifInterface;->setTag(Lcom/miui/gallery3d/exif/ExifTag;)Lcom/miui/gallery3d/exif/ExifTag;

    sget v1, Lcom/miui/gallery3d/exif/ExifInterface;->TAG_IMAGE_WIDTH:I

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Lcom/miui/gallery3d/exif/ExifInterface;->buildTag(ILjava/lang/Object;)Lcom/miui/gallery3d/exif/ExifTag;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/miui/gallery3d/exif/ExifInterface;->setTag(Lcom/miui/gallery3d/exif/ExifTag;)Lcom/miui/gallery3d/exif/ExifTag;

    sget v1, Lcom/miui/gallery3d/exif/ExifInterface;->TAG_IMAGE_LENGTH:I

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Lcom/miui/gallery3d/exif/ExifInterface;->buildTag(ILjava/lang/Object;)Lcom/miui/gallery3d/exif/ExifTag;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/miui/gallery3d/exif/ExifInterface;->setTag(Lcom/miui/gallery3d/exif/ExifTag;)Lcom/miui/gallery3d/exif/ExifTag;

    invoke-virtual {v2, p2}, Lcom/miui/gallery3d/exif/ExifInterface;->getExifWriterStream(Ljava/io/OutputStream;)Ljava/io/OutputStream;

    move-result-object p2

    goto :goto_2

    :cond_6
    :goto_1
    const-string v1, "DraftManager"

    const-string v2, "no exif found in source image"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    :goto_2
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->isSavedAsPng()Z

    move-result v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    if-eqz v1, :cond_7

    :try_start_0
    sget-object v4, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    goto :goto_3

    :catchall_0
    move-exception p1

    goto :goto_6

    :catch_0
    move-exception p1

    goto :goto_4

    :cond_7
    sget-object v4, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    :goto_3
    const/16 v5, 0x64

    invoke-virtual {p1, v4, v5, p2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    move-result p1

    if-eqz p1, :cond_8

    invoke-virtual {p2}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_8
    const-string v0, "DraftManager"

    invoke-static {v0, p2}, Lcom/miui/gallery/editor/photo/utils/IoUtils;->close(Ljava/lang/String;Ljava/io/Closeable;)V

    goto :goto_5

    :goto_4
    :try_start_1
    const-string v4, "DraftManager"

    invoke-static {v4, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const-string p1, "DraftManager"

    invoke-static {p1, p2}, Lcom/miui/gallery/editor/photo/utils/IoUtils;->close(Ljava/lang/String;Ljava/io/Closeable;)V

    const/4 p1, 0x0

    :goto_5
    const-string p2, "DraftManager"

    const-string v0, "saved as png %b, compress cost %d"

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v2

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {p2, v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return p1

    :goto_6
    const-string v0, "DraftManager"

    invoke-static {v0, p2}, Lcom/miui/gallery/editor/photo/utils/IoUtils;->close(Ljava/lang/String;Ljava/io/Closeable;)V

    throw p1

    :cond_9
    :goto_7
    return v0
.end method

.method public export(Landroid/net/Uri;)Z
    .locals 6

    const-string v0, "DraftManager"

    const-string v1, "exporting"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    iget v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mOriginHeight:I

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mOriginWidth:I

    if-nez v0, :cond_2

    :cond_1
    :try_start_0
    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->initForBitmapInfo()V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_2

    :cond_2
    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mIsPreviewSameWithOrigin:Z

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mPreview:Landroid/graphics/Bitmap;

    const-string v2, "DraftManager"

    const-string v3, "origin is preview,bmp is empty:%b"

    if-nez v0, :cond_3

    const/4 v4, 0x1

    goto :goto_0

    :cond_3
    const/4 v4, 0x0

    :goto_0
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_5

    :cond_4
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->decodeOrigin()Landroid/graphics/Bitmap;

    move-result-object v0

    iget-boolean v2, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mWithWatermark:Z

    if-nez v2, :cond_5

    const/4 v2, 0x0

    :try_start_1
    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->getInputStream()Ljava/io/InputStream;

    move-result-object v3
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mXmpExtraManager:Lcom/miui/gallery/editor/photo/app/XmpExtraManager;

    invoke-virtual {v2, v0, v3}, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->sweepImage(Landroid/graphics/Bitmap;Ljava/io/InputStream;)V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2

    :catchall_0
    move-exception p1

    goto :goto_3

    :catch_0
    move-exception v2

    goto :goto_1

    :catchall_1
    move-exception p1

    move-object v3, v2

    goto :goto_3

    :catch_1
    move-exception v3

    move-object v5, v3

    move-object v3, v2

    move-object v2, v5

    :goto_1
    :try_start_3
    invoke-virtual {v2}, Ljava/io/FileNotFoundException;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :goto_2
    invoke-static {v3}, Lcom/miui/gallery/editor/photo/utils/IoUtils;->close(Ljava/io/Closeable;)V

    goto :goto_4

    :goto_3
    invoke-static {v3}, Lcom/miui/gallery/editor/photo/utils/IoUtils;->close(Ljava/io/Closeable;)V

    throw p1

    :cond_5
    :goto_4
    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mRenderDataList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_6

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mRenderDataList:Ljava/util/List;

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mEngines:[Lcom/miui/gallery/editor/photo/core/RenderEngine;

    invoke-static {v2, v0, v3, v4}, Lcom/miui/gallery/editor/photo/core/RenderEngine;->render(Landroid/content/Context;Landroid/graphics/Bitmap;Ljava/util/List;[Lcom/miui/gallery/editor/photo/core/RenderEngine;)Landroid/graphics/Bitmap;

    move-result-object v0

    :cond_6
    :goto_5
    if-nez v0, :cond_7

    return v1

    :cond_7
    invoke-virtual {p0, v0, p1}, Lcom/miui/gallery/editor/photo/app/DraftManager;->export(Landroid/graphics/Bitmap;Landroid/net/Uri;)Z

    move-result p1

    return p1

    :catch_2
    move-exception p1

    const-string v0, "DraftManager"

    invoke-static {v0, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    return v1

    :catch_3
    move-exception p1

    const-string v0, "DraftManager"

    invoke-static {v0, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    return v1
.end method

.method public getBundle()Landroid/os/Bundle;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mBundle:Landroid/os/Bundle;

    return-object v0
.end method

.method public getExportFileSuffix()Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->isSavedAsPng()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "png"

    goto :goto_0

    :cond_0
    const-string v0, "jpg"

    :goto_0
    return-object v0
.end method

.method public getExportedHeight()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mExportedHeight:I

    return v0
.end method

.method public getExportedWidth()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mExportedWidth:I

    return v0
.end method

.method public getPreview()Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mPreview:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getPreviewOriginal()Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mPreviewOriginal:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getRenderData(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/RenderData;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mRenderDataList:Ljava/util/List;

    invoke-interface {p1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    return-void
.end method

.method public getRenderDataList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/RenderData;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mRenderDataList:Ljava/util/List;

    return-object v0
.end method

.method public getStepCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mRenderDataList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public initializeForPreview(Z)Z
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;,
            Ljava/lang/SecurityException;
        }
    .end annotation

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/DraftManager;->initForBitmapInfo()V

    iget v2, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mOriginHeight:I

    iget v3, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mPreferHeight:I

    div-int/2addr v2, v3

    iget v3, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mOriginWidth:I

    iget v4, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mPreferWidth:I

    div-int/2addr v3, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    const/4 v3, 0x1

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->highestOneBit(I)I

    move-result v2

    iput v2, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mInSampleSize:I

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mSource:Landroid/net/Uri;

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/nostra13/universalimageloader/utils/MemoryCacheUtils;->generatePreviewPhotoKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/nostra13/universalimageloader/core/ImageLoader;->loadFromMemoryCache(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    iget v4, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mOriginWidth:I

    iget v5, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mInSampleSize:I

    div-int/2addr v4, v5

    if-lt v2, v4, :cond_0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    iget v4, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mOriginHeight:I

    iget v5, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mInSampleSize:I

    div-int/2addr v4, v5

    if-lt v2, v4, :cond_0

    iput-boolean v3, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mPreviewEnable:Z

    :cond_0
    const-string v2, "DraftManager"

    const-string v4, "load preview from cache"

    invoke-static {v2, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/utils/Bitmaps;->copyBitmapInCaseOfRecycle(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mPreview:Landroid/graphics/Bitmap;

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mPreview:Landroid/graphics/Bitmap;

    if-nez p1, :cond_2

    new-instance p1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {p1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    iget v2, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mInSampleSize:I

    iput v2, p1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mExif:Lcom/miui/gallery3d/exif/ExifInterface;

    invoke-static {v2}, Lcom/miui/gallery/util/ExifUtil;->getRotationDegrees(Lcom/miui/gallery3d/exif/ExifInterface;)I

    move-result v2

    invoke-direct {p0, p1, v2}, Lcom/miui/gallery/editor/photo/app/DraftManager;->decodeBitmap(Landroid/graphics/BitmapFactory$Options;I)Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mPreview:Landroid/graphics/Bitmap;

    iput-boolean v3, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mPreviewEnable:Z

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mPreview:Landroid/graphics/Bitmap;

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p1

    iget v2, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mOriginWidth:I

    if-ne p1, v2, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mPreview:Landroid/graphics/Bitmap;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p1

    iget v2, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mOriginHeight:I

    if-ne p1, v2, :cond_3

    iput-boolean v3, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mIsPreviewSameWithOrigin:Z

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mPreview:Landroid/graphics/Bitmap;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mPreviewOriginal:Landroid/graphics/Bitmap;

    const-string p1, "DraftManager"

    const-string v2, "initialize costs %dms same:%b, previewEnable:%b"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v0

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iget-boolean v1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mIsPreviewSameWithOrigin:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iget-boolean v4, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mPreviewEnable:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {p1, v2, v0, v1, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-boolean p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mPreviewEnable:Z

    const/4 v0, 0x0

    if-nez p1, :cond_4

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mBackgroundTask:Landroid/os/AsyncTask;

    sget-object v1, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    new-array v2, v0, [Ljava/lang/Void;

    invoke-virtual {p1, v1, v2}, Landroid/os/AsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    :cond_4
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mPreview:Landroid/graphics/Bitmap;

    if-eqz p1, :cond_5

    const/4 v0, 0x1

    :cond_5
    return v0
.end method

.method public isEmpty()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mRenderDataList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mWithWatermark:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isPreviewEnable()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mPreviewEnable:Z

    return v0
.end method

.method public isPreviewSameWithOrigin()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mIsPreviewSameWithOrigin:Z

    return v0
.end method

.method public isRemoveWatermarkEnable()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mXmpExtraManager:Lcom/miui/gallery/editor/photo/app/XmpExtraManager;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->isRemoveWatermarkEnable()Z

    move-result v0

    return v0
.end method

.method public isRemoveWatermarkShow()Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mXmpExtraManager:Lcom/miui/gallery/editor/photo/app/XmpExtraManager;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mPreviewOriginal:Landroid/graphics/Bitmap;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mRenderDataList:Ljava/util/List;

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->isRemoveWatermarkShow(Landroid/graphics/Bitmap;Ljava/util/List;)Z

    move-result v0

    return v0
.end method

.method public isSavedAsPng()Z
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mIsScreenshot:Z

    if-nez v0, :cond_0

    const-string v0, "image/png"

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mMimeType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isSecret()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mSecretInfo:Lcom/miui/gallery/model/SecretInfo;

    iget-boolean v0, v0, Lcom/miui/gallery/model/SecretInfo;->mIsSecret:Z

    return v0
.end method

.method public isWithWatermark()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mWithWatermark:Z

    return v0
.end method

.method public reRender(ZLcom/miui/gallery/editor/photo/utils/Callback;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Lcom/miui/gallery/editor/photo/utils/Callback<",
            "Landroid/graphics/Bitmap;",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mWithWatermark:Z

    new-instance v0, Lcom/miui/gallery/editor/photo/app/DraftManager$ReRenderTask;

    invoke-direct {v0, p0, p2}, Lcom/miui/gallery/editor/photo/app/DraftManager$ReRenderTask;-><init>(Lcom/miui/gallery/editor/photo/app/DraftManager;Lcom/miui/gallery/editor/photo/utils/Callback;)V

    sget-object p2, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Boolean;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, p2, v1}, Lcom/miui/gallery/editor/photo/app/DraftManager$ReRenderTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public release()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mRenderDataList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/core/RenderData;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/RenderData;->release()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mEngines:[Lcom/miui/gallery/editor/photo/core/RenderEngine;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_1
    if-ge v2, v1, :cond_2

    aget-object v3, v0, v2

    if-eqz v3, :cond_1

    invoke-virtual {v3}, Lcom/miui/gallery/editor/photo/core/RenderEngine;->release()V

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    return-void
.end method

.method public setOnPreviewRefreshListener(Lcom/miui/gallery/editor/photo/app/DraftManager$OnPreviewRefreshListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mOnPreviewRefreshListener:Lcom/miui/gallery/editor/photo/app/DraftManager$OnPreviewRefreshListener;

    return-void
.end method

.method public setRenderDataList(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/RenderData;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/DraftManager;->mRenderDataList:Ljava/util/List;

    return-void
.end method
