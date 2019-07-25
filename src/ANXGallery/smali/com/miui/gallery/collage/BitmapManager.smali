.class public Lcom/miui/gallery/collage/BitmapManager;
.super Ljava/lang/Object;
.source "BitmapManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/collage/BitmapManager$BitmapLoaderListener;,
        Lcom/miui/gallery/collage/BitmapManager$CustomLoadListener;,
        Lcom/miui/gallery/collage/BitmapManager$DecodeBitmapTask;
    }
.end annotation


# instance fields
.field private mBitmapLoaderListener:Lcom/miui/gallery/collage/BitmapManager$BitmapLoaderListener;

.field private mBitmapUriMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Landroid/graphics/Bitmap;",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field

.field private mBitmaps:[Landroid/graphics/Bitmap;

.field private mContext:Landroid/content/Context;

.field private mDecodeTask:Lcom/miui/gallery/collage/BitmapManager$DecodeBitmapTask;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/miui/gallery/collage/BitmapManager$BitmapLoaderListener;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/collage/BitmapManager;->mBitmapUriMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/collage/BitmapManager;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/miui/gallery/collage/BitmapManager;->mBitmapLoaderListener:Lcom/miui/gallery/collage/BitmapManager$BitmapLoaderListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/collage/BitmapManager;)Ljava/util/HashMap;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/collage/BitmapManager;->mBitmapUriMap:Ljava/util/HashMap;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/collage/BitmapManager;)[Landroid/graphics/Bitmap;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/collage/BitmapManager;->mBitmaps:[Landroid/graphics/Bitmap;

    return-object p0
.end method

.method static synthetic access$102(Lcom/miui/gallery/collage/BitmapManager;[Landroid/graphics/Bitmap;)[Landroid/graphics/Bitmap;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/collage/BitmapManager;->mBitmaps:[Landroid/graphics/Bitmap;

    return-object p1
.end method

.method static synthetic access$200(Lcom/miui/gallery/collage/BitmapManager;)Lcom/miui/gallery/collage/BitmapManager$BitmapLoaderListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/collage/BitmapManager;->mBitmapLoaderListener:Lcom/miui/gallery/collage/BitmapManager$BitmapLoaderListener;

    return-object p0
.end method

.method private static loadSuitableBitmapBySize(Landroid/content/Context;IILandroid/net/Uri;)Landroid/graphics/Bitmap;
    .locals 3

    :try_start_0
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    invoke-static {p0, p3, v0}, Lcom/miui/gallery/editor/photo/utils/Bitmaps;->decodeUri(Landroid/content/Context;Landroid/net/Uri;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    div-int/2addr v2, p2

    iget p2, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    div-int/2addr p2, p1

    invoke-static {v2, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-static {p1, v1}, Ljava/lang/Math;->max(II)I

    move-result p1

    const/4 p2, 0x0

    iput-boolean p2, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inMutable:Z

    invoke-static {p1}, Ljava/lang/Integer;->highestOneBit(I)I

    move-result p1

    shl-int/2addr p1, v1

    iput p1, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    invoke-static {p0, p3}, Lcom/miui/gallery/editor/photo/utils/Bitmaps;->readExif(Landroid/content/Context;Landroid/net/Uri;)Landroid/support/media/ExifInterface;

    move-result-object p1

    invoke-static {p0, p3, v0}, Lcom/miui/gallery/editor/photo/utils/Bitmaps;->decodeUri(Landroid/content/Context;Landroid/net/Uri;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p0

    invoke-static {p1}, Lcom/miui/gallery/util/ExifUtil;->getRotationDegrees(Landroid/support/media/ExifInterface;)I

    move-result p1

    invoke-static {p0, p1, v0}, Lcom/miui/gallery/editor/photo/utils/Bitmaps;->joinExif(Landroid/graphics/Bitmap;ILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "BitmapManager"

    invoke-static {p1, p0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method

.method public static loadSuitableBitmapOnScreen(Landroid/content/Context;Landroid/net/Uri;)Landroid/graphics/Bitmap;
    .locals 2

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v1, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v0, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {p0, v1, v0, p1}, Lcom/miui/gallery/collage/BitmapManager;->loadSuitableBitmapBySize(Landroid/content/Context;IILandroid/net/Uri;)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public data()[Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/collage/BitmapManager;->mBitmaps:[Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public getOriginUriByBitmap(Landroid/graphics/Bitmap;)Landroid/net/Uri;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/collage/BitmapManager;->mBitmapUriMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/net/Uri;

    return-object p1
.end method

.method public isEmpty()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/collage/BitmapManager;->mBitmaps:[Landroid/graphics/Bitmap;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/collage/BitmapManager;->mBitmaps:[Landroid/graphics/Bitmap;

    array-length v0, v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public loadBitmapAsync([Landroid/net/Uri;)V
    .locals 3

    new-instance v0, Lcom/miui/gallery/collage/BitmapManager$DecodeBitmapTask;

    new-instance v1, Lcom/miui/gallery/collage/BitmapManager$1;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/collage/BitmapManager$1;-><init>(Lcom/miui/gallery/collage/BitmapManager;[Landroid/net/Uri;)V

    iget-object v2, p0, Lcom/miui/gallery/collage/BitmapManager;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/collage/BitmapManager$DecodeBitmapTask;-><init>(Lcom/miui/gallery/collage/BitmapManager$CustomLoadListener;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/collage/BitmapManager;->mDecodeTask:Lcom/miui/gallery/collage/BitmapManager$DecodeBitmapTask;

    iget-object v0, p0, Lcom/miui/gallery/collage/BitmapManager;->mDecodeTask:Lcom/miui/gallery/collage/BitmapManager$DecodeBitmapTask;

    sget-object v1, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    invoke-virtual {v0, v1, p1}, Lcom/miui/gallery/collage/BitmapManager$DecodeBitmapTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public loadSuitableBitmapBySize(IILandroid/net/Uri;)Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/collage/BitmapManager;->mContext:Landroid/content/Context;

    invoke-static {v0, p1, p2, p3}, Lcom/miui/gallery/collage/BitmapManager;->loadSuitableBitmapBySize(Landroid/content/Context;IILandroid/net/Uri;)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1
.end method

.method public replaceBitmap(Landroid/graphics/Bitmap;Landroid/net/Uri;)V
    .locals 3

    new-instance v0, Lcom/miui/gallery/collage/BitmapManager$DecodeBitmapTask;

    new-instance v1, Lcom/miui/gallery/collage/BitmapManager$2;

    invoke-direct {v1, p0, p1, p2}, Lcom/miui/gallery/collage/BitmapManager$2;-><init>(Lcom/miui/gallery/collage/BitmapManager;Landroid/graphics/Bitmap;Landroid/net/Uri;)V

    iget-object p1, p0, Lcom/miui/gallery/collage/BitmapManager;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1, p1}, Lcom/miui/gallery/collage/BitmapManager$DecodeBitmapTask;-><init>(Lcom/miui/gallery/collage/BitmapManager$CustomLoadListener;Landroid/content/Context;)V

    sget-object p1, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v1, 0x1

    new-array v1, v1, [Landroid/net/Uri;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/collage/BitmapManager$DecodeBitmapTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public setBitmapLoaderListener(Lcom/miui/gallery/collage/BitmapManager$BitmapLoaderListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/collage/BitmapManager;->mBitmapLoaderListener:Lcom/miui/gallery/collage/BitmapManager$BitmapLoaderListener;

    return-void
.end method

.method public size()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/collage/BitmapManager;->mBitmaps:[Landroid/graphics/Bitmap;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/collage/BitmapManager;->mBitmaps:[Landroid/graphics/Bitmap;

    array-length v0, v0

    :goto_0
    return v0
.end method
