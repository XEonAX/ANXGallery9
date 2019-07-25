.class public final Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;
.super Ljava/lang/Object;
.source "NexImageLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$a;,
        Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;,
        Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$c;,
        Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$d;
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "NexImageLoader"

.field private static final MAX_USERSTRINGS:I = 0x3

.field private static final NXT_ALIGNMASK:I = 0xf

.field private static final NXT_ALIGN_CENTER:I = 0x1

.field private static final NXT_ALIGN_LEFT:I = 0x0

.field private static final NXT_ALIGN_RIGHT:I = 0x2

.field private static final NXT_BLUR_INNER:I = 0x2

.field private static final NXT_BLUR_NORMAL:I = 0x0

.field private static final NXT_BLUR_OUTER:I = 0x3

.field private static final NXT_BLUR_SOLID:I = 0x1

.field private static final NXT_LONGTEXT_CROP_END:I = 0x0

.field private static final NXT_LONGTEXT_ELLIPSIZE_END:I = 0x4

.field private static final NXT_LONGTEXT_ELLIPSIZE_MIDDLE:I = 0x3

.field private static final NXT_LONGTEXT_ELLIPSIZE_START:I = 0x2

.field private static final NXT_LONGTEXT_WRAP:I = 0x1

.field private static final NXT_TEXTFLAG_AUTOSIZE:I = 0x400

.field private static final NXT_TEXTFLAG_BOLD:I = 0x1

.field private static final NXT_TEXTFLAG_CUTOUT:I = 0x800

.field private static final NXT_TEXTFLAG_FILL:I = 0x4

.field private static final NXT_TEXTFLAG_ITALIC:I = 0x2

.field private static final NXT_TEXTFLAG_LINEAR:I = 0x200

.field private static final NXT_TEXTFLAG_SHADOW:I = 0x100

.field private static final NXT_TEXTFLAG_STRIKE:I = 0x20

.field private static final NXT_TEXTFLAG_STROKE:I = 0x8

.field private static final NXT_TEXTFLAG_STROKEBACK:I = 0x1000

.field private static final NXT_TEXTFLAG_SUBPIXEL:I = 0x80

.field private static final NXT_TEXTFLAG_UNDERLINE:I = 0x10

.field private static final NXT_VALIGNMASK:I = 0xf0

.field private static final NXT_VALIGN_BOTTOM:I = 0x20

.field private static final NXT_VALIGN_CENTER:I = 0x10

.field private static final NXT_VALIGN_TOP:I = 0x0

.field private static final TAG_Overlay:Ljava/lang/String; = "[Overlay]"

.field private static final TAG_PreviewThemeImage:Ljava/lang/String; = "[PvwThImage]"

.field private static final TAG_Text:Ljava/lang/String; = "[Text]"

.field private static final TAG_ThemeImage:Ljava/lang/String; = "[ThemeImage]"

.field private static final TYPEFACE_ASSET:Ljava/lang/String; = "asset:"

.field private static final TYPEFACE_FILE:Ljava/lang/String; = "file:"

.field private static final TYPEFACE_FONTFILE:Ljava/lang/String; = "fontfile:"

.field private static final TYPEFACE_FONTID:Ljava/lang/String; = "fontid:"

.field private static final TYPEFACE_SYSTEM:Ljava/lang/String; = "android:"

.field private static final TYPEFACE_THEME:Ljava/lang/String; = "theme:"

.field private static sBitmapCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$a;",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/graphics/Bitmap;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final sBitmapCacheLock:Ljava/lang/Object;

.field private static sCleanCacheCount:I

.field private static sLoadedBitmapCache:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/graphics/Bitmap;",
            "Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$c;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private m_assetManager:Landroid/content/res/AssetManager;

.field private m_effectResourceLoader:Lcom/nexstreaming/kminternal/nexvideoeditor/a;

.field private m_jpegMaxHeight:I

.field private m_jpegMaxSize:I

.field private m_jpegMaxWidth:I

.field private m_overlayPathResolver:Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$d;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->sBitmapCache:Ljava/util/Map;

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->sLoadedBitmapCache:Ljava/util/WeakHashMap;

    const/4 v0, 0x0

    sput v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->sCleanCacheCount:I

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->sBitmapCacheLock:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/res/Resources;Lcom/nexstreaming/kminternal/nexvideoeditor/a;Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$d;III)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-nez p1, :cond_0

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_assetManager:Landroid/content/res/AssetManager;

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p1

    iput-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_assetManager:Landroid/content/res/AssetManager;

    :goto_0
    iput-object p2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_effectResourceLoader:Lcom/nexstreaming/kminternal/nexvideoeditor/a;

    iput-object p3, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_overlayPathResolver:Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$d;

    iput p4, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_jpegMaxWidth:I

    iput p5, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_jpegMaxHeight:I

    iput p6, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_jpegMaxSize:I

    return-void
.end method

.method public static calcSampleSize(Landroid/graphics/BitmapFactory$Options;)V
    .locals 3

    const/4 v0, 0x1

    :goto_0
    const/16 v1, 0x8

    if-ge v0, v1, :cond_2

    iget v1, p0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    div-int/2addr v1, v0

    const/16 v2, 0x5a0

    if-le v1, v2, :cond_0

    iget v1, p0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    div-int/2addr v1, v0

    const/16 v2, 0x32a

    if-gt v1, v2, :cond_1

    :cond_0
    iget v1, p0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    div-int/2addr v1, v0

    iget v2, p0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    mul-int v1, v1, v2

    div-int/2addr v1, v0

    const v2, 0x16e360

    if-le v1, v2, :cond_2

    :cond_1
    mul-int/lit8 v0, v0, 0x2

    goto :goto_0

    :cond_2
    iput v0, p0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    return-void
.end method

.method public static calcSampleSize(Landroid/graphics/BitmapFactory$Options;III)V
    .locals 3

    const/4 v0, 0x1

    :goto_0
    const/16 v1, 0x8

    if-ge v0, v1, :cond_3

    iget v1, p0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    div-int/2addr v1, v0

    if-le v1, p1, :cond_0

    iget v1, p0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    div-int/2addr v1, v0

    if-gt v1, p2, :cond_2

    :cond_0
    iget v1, p0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    div-int/2addr v1, v0

    iget v2, p0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    mul-int v1, v1, v2

    div-int/2addr v1, v0

    if-lez p3, :cond_1

    move v2, p3

    goto :goto_1

    :cond_1
    const v2, 0x16e360

    :goto_1
    if-le v1, v2, :cond_3

    :cond_2
    mul-int/lit8 v0, v0, 0x2

    goto :goto_0

    :cond_3
    iput v0, p0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    return-void
.end method

.method private static copy(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x1000

    new-array v0, v0, [B

    :goto_0
    const/4 v1, -0x1

    invoke-virtual {p0, v0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    if-eq v1, v2, :cond_0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1, v2}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private static getThumbnail(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 7

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    const-string v2, "_id"

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v2

    const-string v3, "_data=?"

    const/4 v6, 0x1

    new-array v4, v6, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "_id"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    int-to-long v1, v1

    invoke-static {p0, v1, v2, v6, v0}, Landroid/provider/MediaStore$Images$Thumbnails;->getThumbnail(Landroid/content/ContentResolver;JILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0

    :cond_0
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    return-object v0
.end method

.method private static getThumbnailOrientation(Landroid/content/Context;Ljava/lang/String;)I
    .locals 13

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    const-string v2, "_id"

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v2

    const-string v3, "_data=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v6, 0x0

    aput-object p1, v4, v6

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "_id"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    sget-object v1, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    int-to-long v2, v0

    invoke-static {v1, v2, v3}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v0

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    move-object v8, v0

    if-eqz v8, :cond_1

    const-string p1, "orientation"

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object v9, p1

    invoke-virtual/range {v7 .. v12}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    if-eqz p0, :cond_1

    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_1

    aget-object p1, p1, v6

    invoke-interface {p0, p1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result p1

    invoke-interface {p0, p1}, Landroid/database/Cursor;->getInt(I)I

    move-result p0

    goto :goto_1

    :cond_1
    const/4 p0, -0x1

    :goto_1
    return p0
.end method

.method public static loadBitmap(Ljava/io/InputStream;III)Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;
    .locals 8

    new-instance v0, Ljava/io/BufferedInputStream;

    invoke-direct {v0, p0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    new-instance v1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v2, 0x1

    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    :try_start_0
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result p0

    invoke-virtual {v0, p0}, Ljava/io/BufferedInputStream;->mark(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V

    :goto_0
    const/4 p0, 0x0

    invoke-static {v0, p0, v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    :try_start_1
    invoke-virtual {v0}, Ljava/io/BufferedInputStream;->reset()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    const/4 v3, 0x0

    iput-boolean v3, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    iget v4, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v5, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    :goto_1
    const/16 v6, 0x8

    if-ge v2, v6, :cond_3

    iget v6, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    div-int/2addr v6, v2

    if-le v6, p1, :cond_0

    iget v6, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    div-int/2addr v6, v2

    if-gt v6, p2, :cond_2

    :cond_0
    iget v6, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    div-int/2addr v6, v2

    iget v7, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    mul-int v6, v6, v7

    div-int/2addr v6, v2

    if-lez p3, :cond_1

    move v7, p3

    goto :goto_2

    :cond_1
    const v7, 0x16e360

    :goto_2
    if-le v6, v7, :cond_3

    :cond_2
    mul-int/lit8 v2, v2, 0x2

    goto :goto_1

    :cond_3
    iput v2, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    const-string p1, "NexImageLoader"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "loadBitmap from stream width="

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p3, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, " height="

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p3, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, " sampleSize="

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v0, p0, v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p1

    :try_start_2
    invoke-virtual {v0}, Ljava/io/BufferedInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_3

    :catch_1
    move-exception p2

    invoke-virtual {p2}, Ljava/io/IOException;->printStackTrace()V

    :goto_3
    if-nez p1, :cond_4

    new-instance p1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;

    invoke-direct {p1, p0, v3, v3, p0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;-><init>(Landroid/graphics/Bitmap;IILcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$1;)V

    return-object p1

    :cond_4
    new-instance p2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;

    invoke-direct {p2, p1, v4, v5, p0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;-><init>(Landroid/graphics/Bitmap;IILcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$1;)V

    return-object p2

    :catch_2
    move-exception p0

    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "Failed to reset stream"

    invoke-direct {p1, p2, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1
.end method

.method public static loadBitmap(Ljava/lang/String;II)Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;
    .locals 2

    const v0, 0x7fffffff

    const/4 v1, 0x0

    invoke-static {p0, p1, p2, v0, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->loadBitmap(Ljava/lang/String;IIII)Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;

    move-result-object p0

    return-object p0
.end method

.method public static loadBitmap(Ljava/lang/String;IIII)Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;
    .locals 6

    const/4 v4, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v5, p4

    invoke-static/range {v0 .. v5}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->loadBitmap(Ljava/lang/String;IIILandroid/graphics/Bitmap$Config;I)Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;

    move-result-object p0

    return-object p0
.end method

.method public static loadBitmap(Ljava/lang/String;IIILandroid/graphics/Bitmap$Config;I)Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;
    .locals 18

    move-object/from16 v0, p0

    move-object/from16 v9, p4

    const/4 v10, 0x1

    move/from16 v1, p5

    if-ne v1, v10, :cond_0

    invoke-static/range {p0 .. p4}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->loadBitmapThumb(Ljava/lang/String;IIILandroid/graphics/Bitmap$Config;)Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;

    move-result-object v0

    return-object v0

    :cond_0
    const-string v1, "NexImageLoader"

    const-string v2, "loadBitmap"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v11, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$a;

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v1, v11

    move-object/from16 v2, p0

    move/from16 v3, p1

    move/from16 v4, p2

    move/from16 v5, p3

    move-object/from16 v6, p4

    invoke-direct/range {v1 .. v8}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$a;-><init>(Ljava/lang/String;IIILandroid/graphics/Bitmap$Config;ZLcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$1;)V

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->sBitmapCacheLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    sget-object v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->sBitmapCache:Ljava/util/Map;

    invoke-interface {v2, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    move-object v13, v2

    check-cast v13, Landroid/graphics/Bitmap;

    if-eqz v13, :cond_1

    sget-object v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->sLoadedBitmapCache:Ljava/util/WeakHashMap;

    invoke-virtual {v2, v13}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$c;

    if-eqz v2, :cond_1

    new-instance v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;

    invoke-virtual {v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$c;->a()I

    move-result v14

    invoke-virtual {v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$c;->b()I

    move-result v15

    invoke-virtual {v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$c;->c()I

    move-result v16

    const/16 v17, 0x0

    move-object v12, v4

    invoke-direct/range {v12 .. v17}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;-><init>(Landroid/graphics/Bitmap;IIILcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$1;)V

    goto :goto_0

    :cond_1
    move-object v4, v3

    :goto_0
    sget v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->sCleanCacheCount:I

    add-int/2addr v2, v10

    sput v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->sCleanCacheCount:I

    sget v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->sCleanCacheCount:I

    const/16 v5, 0x1e

    const/4 v6, 0x0

    if-le v2, v5, :cond_5

    sput v6, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->sCleanCacheCount:I

    sget-object v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->sBitmapCache:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move-object v5, v3

    :cond_2
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map$Entry;

    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/ref/WeakReference;

    invoke-virtual {v8}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v8

    if-nez v8, :cond_2

    if-nez v5, :cond_3

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    :cond_3
    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_4
    if-eqz v5, :cond_5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$a;

    sget-object v7, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->sBitmapCache:Ljava/util/Map;

    invoke-interface {v7, v5}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    :cond_5
    if-eqz v4, :cond_6

    monitor-exit v1

    return-object v4

    :cond_6
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    const-string v2, ".jpeg"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_8

    const-string v2, ".jpg"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_7

    goto :goto_3

    :catch_0
    :cond_7
    const/4 v1, 0x0

    goto :goto_4

    :cond_8
    :goto_3
    :try_start_1
    new-instance v1, Landroid/media/ExifInterface;

    invoke-direct {v1, v0}, Landroid/media/ExifInterface;-><init>(Ljava/lang/String;)V

    const-string v2, "Orientation"

    invoke-virtual {v1, v2, v6}, Landroid/media/ExifInterface;->getAttributeInt(Ljava/lang/String;I)I

    move-result v1
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    :goto_4
    new-instance v2, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    iput-boolean v10, v2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    invoke-static {v0, v2}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    iput-boolean v6, v2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    iput-object v9, v2, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    iget v4, v2, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v5, v2, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    :goto_5
    const/16 v7, 0x8

    if-ge v10, v7, :cond_c

    iget v7, v2, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    div-int/2addr v7, v10

    move/from16 v8, p1

    if-le v7, v8, :cond_9

    iget v7, v2, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    div-int/2addr v7, v10

    move/from16 v12, p2

    if-gt v7, v12, :cond_b

    goto :goto_6

    :cond_9
    move/from16 v12, p2

    :goto_6
    iget v7, v2, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    div-int/2addr v7, v10

    iget v13, v2, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    mul-int v7, v7, v13

    div-int/2addr v7, v10

    if-lez p3, :cond_a

    move/from16 v14, p3

    goto :goto_7

    :cond_a
    const v14, 0x16e360

    :goto_7
    if-le v7, v14, :cond_c

    :cond_b
    mul-int/lit8 v10, v10, 0x2

    goto :goto_5

    :cond_c
    iput v10, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    const-string v7, "NexImageLoader"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "loadBitmap width="

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v12, v2, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v12, " height="

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v12, v2, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v12, " sampleSize="

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v10, " name=\'"

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v10, "\'"

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v0, v2}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    if-nez v0, :cond_d

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;

    invoke-direct {v0, v3, v6, v6, v3}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;-><init>(Landroid/graphics/Bitmap;IILcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$1;)V

    return-object v0

    :cond_d
    const/high16 v2, 0x3f800000    # 1.0f

    const/high16 v6, -0x40800000    # -1.0f

    const/4 v7, 0x0

    packed-switch v1, :pswitch_data_0

    goto/16 :goto_8

    :pswitch_0
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    sget-object v8, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v6, v8}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    new-instance v6, Landroid/graphics/Canvas;

    invoke-direct {v6, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    new-instance v8, Landroid/graphics/Matrix;

    invoke-direct {v8}, Landroid/graphics/Matrix;-><init>()V

    const/high16 v10, 0x43870000    # 270.0f

    invoke-virtual {v8, v10}, Landroid/graphics/Matrix;->setRotate(F)V

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v10

    int-to-float v10, v10

    invoke-virtual {v8, v7, v10}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    invoke-virtual {v6, v0, v8, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    goto/16 :goto_9

    :pswitch_1
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    sget-object v8, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v6, v8}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    new-instance v6, Landroid/graphics/Canvas;

    invoke-direct {v6, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    new-instance v8, Landroid/graphics/Matrix;

    invoke-direct {v8}, Landroid/graphics/Matrix;-><init>()V

    const/high16 v10, 0x42b40000    # 90.0f

    invoke-virtual {v8, v10}, Landroid/graphics/Matrix;->setRotate(F)V

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v10

    int-to-float v10, v10

    invoke-virtual {v8, v10, v7}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    invoke-virtual {v6, v0, v8, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    goto/16 :goto_9

    :pswitch_2
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    sget-object v10, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v8, v10}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    new-instance v8, Landroid/graphics/Canvas;

    invoke-direct {v8, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    new-instance v10, Landroid/graphics/Matrix;

    invoke-direct {v10}, Landroid/graphics/Matrix;-><init>()V

    invoke-virtual {v10, v6, v6}, Landroid/graphics/Matrix;->setScale(FF)V

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v12

    int-to-float v12, v12

    invoke-virtual {v10, v6, v12}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    invoke-virtual {v8, v0, v10, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    goto :goto_9

    :pswitch_3
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v8

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v10

    sget-object v12, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v8, v10, v12}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v8

    new-instance v10, Landroid/graphics/Canvas;

    invoke-direct {v10, v8}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    new-instance v8, Landroid/graphics/Matrix;

    invoke-direct {v8}, Landroid/graphics/Matrix;-><init>()V

    invoke-virtual {v8, v6, v2}, Landroid/graphics/Matrix;->setScale(FF)V

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v12

    int-to-float v12, v12

    invoke-virtual {v8, v12, v7}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    invoke-virtual {v10, v0, v8, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    :pswitch_4
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v8

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v10

    sget-object v12, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v8, v10, v12}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v8

    new-instance v10, Landroid/graphics/Canvas;

    invoke-direct {v10, v8}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    new-instance v12, Landroid/graphics/Matrix;

    invoke-direct {v12}, Landroid/graphics/Matrix;-><init>()V

    invoke-virtual {v12, v2, v6}, Landroid/graphics/Matrix;->setScale(FF)V

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v12, v7, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    invoke-virtual {v10, v0, v12, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    move-object v2, v8

    goto :goto_9

    :goto_8
    :pswitch_5
    move-object v2, v0

    :goto_9
    if-eqz v9, :cond_e

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v0

    if-eq v0, v9, :cond_e

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    invoke-static {v0, v6, v9}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    new-instance v6, Landroid/graphics/Canvas;

    invoke-direct {v6, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {v6, v2, v7, v7, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->recycle()V

    goto :goto_a

    :cond_e
    move-object v0, v2

    :goto_a
    packed-switch v1, :pswitch_data_1

    new-instance v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;

    invoke-direct {v1, v0, v4, v5, v3}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;-><init>(Landroid/graphics/Bitmap;IILcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$1;)V

    goto :goto_b

    :pswitch_6
    new-instance v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;

    invoke-direct {v1, v0, v5, v4, v3}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;-><init>(Landroid/graphics/Bitmap;IILcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$1;)V

    :goto_b
    sget-object v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->sBitmapCache:Ljava/util/Map;

    new-instance v4, Ljava/lang/ref/WeakReference;

    invoke-direct {v4, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v2, v11, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$c;

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;->b()I

    move-result v4

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;->c()I

    move-result v5

    invoke-direct {v2, v4, v5, v3}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$c;-><init>(IILcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$1;)V

    sget-object v3, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->sLoadedBitmapCache:Ljava/util/WeakHashMap;

    invoke-virtual {v3, v0, v2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v1

    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_5
        :pswitch_3
        :pswitch_2
        :pswitch_4
        :pswitch_5
        :pswitch_1
        :pswitch_5
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x5
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_6
    .end packed-switch
.end method

.method public static loadBitmapThumb(Ljava/lang/String;IIILandroid/graphics/Bitmap$Config;)Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;
    .locals 22

    move-object/from16 v0, p0

    const-string v1, "NexImageLoader"

    const-string v2, "loadBitmapThumb"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v9, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$a;

    const/4 v7, 0x1

    const/4 v8, 0x0

    move-object v1, v9

    move-object/from16 v2, p0

    move/from16 v3, p1

    move/from16 v4, p2

    move/from16 v5, p3

    move-object/from16 v6, p4

    invoke-direct/range {v1 .. v8}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$a;-><init>(Ljava/lang/String;IIILandroid/graphics/Bitmap$Config;ZLcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$1;)V

    sget-object v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->sBitmapCacheLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    sget-object v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->sBitmapCache:Ljava/util/Map;

    invoke-interface {v2, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/ref/WeakReference;

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    move-object v11, v2

    check-cast v11, Landroid/graphics/Bitmap;

    if-eqz v11, :cond_0

    sget-object v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->sLoadedBitmapCache:Ljava/util/WeakHashMap;

    invoke-virtual {v2, v11}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$c;

    if-eqz v2, :cond_0

    new-instance v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;

    invoke-virtual {v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$c;->a()I

    move-result v12

    invoke-virtual {v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$c;->b()I

    move-result v13

    invoke-virtual {v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$c;->c()I

    move-result v14

    const/4 v15, 0x0

    move-object v10, v4

    invoke-direct/range {v10 .. v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;-><init>(Landroid/graphics/Bitmap;IIILcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$1;)V

    goto :goto_0

    :cond_0
    move-object v4, v3

    :goto_0
    sget v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->sCleanCacheCount:I

    add-int/lit8 v2, v2, 0x1

    sput v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->sCleanCacheCount:I

    sget v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->sCleanCacheCount:I

    const/16 v5, 0x1e

    if-le v2, v5, :cond_4

    const/4 v2, 0x0

    sput v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->sCleanCacheCount:I

    sget-object v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->sBitmapCache:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move-object v5, v3

    :cond_1
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/Map$Entry;

    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/ref/WeakReference;

    invoke-virtual {v7}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v7

    if-nez v7, :cond_1

    if-nez v5, :cond_2

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    :cond_2
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_3
    if-eqz v5, :cond_4

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$a;

    sget-object v6, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->sBitmapCache:Ljava/util/Map;

    invoke-interface {v6, v5}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    :cond_4
    if-eqz v4, :cond_5

    monitor-exit v1

    return-object v4

    :cond_5
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->a()Lcom/nexstreaming/kminternal/kinemaster/config/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->b()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->getThumbnail(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    if-nez v1, :cond_6

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    move-object v10, v0

    invoke-direct/range {v10 .. v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;-><init>(Landroid/graphics/Bitmap;IIILcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$1;)V

    return-object v0

    :cond_6
    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->a()Lcom/nexstreaming/kminternal/kinemaster/config/a;

    move-result-object v2

    invoke-virtual {v2}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->b()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->getThumbnailOrientation(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    const/16 v2, 0x5a

    if-eq v0, v2, :cond_9

    const/16 v2, 0xb4

    if-eq v0, v2, :cond_8

    const/16 v2, 0x10e

    if-eq v0, v2, :cond_7

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;

    const/16 v12, 0x500

    const/16 v13, 0x2d0

    const/4 v14, 0x2

    const/4 v15, 0x0

    move-object v10, v0

    move-object v11, v1

    invoke-direct/range {v10 .. v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;-><init>(Landroid/graphics/Bitmap;IIILcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$1;)V

    goto :goto_3

    :cond_7
    invoke-static {v1, v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->rotateImage(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    move-result-object v17

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;

    const/16 v18, 0x2d0

    const/16 v19, 0x500

    const/16 v20, 0x2

    const/16 v21, 0x0

    move-object/from16 v16, v0

    invoke-direct/range {v16 .. v21}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;-><init>(Landroid/graphics/Bitmap;IIILcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$1;)V

    goto :goto_3

    :cond_8
    invoke-static {v1, v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->rotateImage(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    move-result-object v11

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;

    const/16 v12, 0x500

    const/16 v13, 0x2d0

    const/4 v14, 0x2

    const/4 v15, 0x0

    move-object v10, v0

    invoke-direct/range {v10 .. v15}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;-><init>(Landroid/graphics/Bitmap;IIILcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$1;)V

    goto :goto_3

    :cond_9
    invoke-static {v1, v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->rotateImage(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    move-result-object v17

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;

    const/16 v18, 0x2d0

    const/16 v19, 0x500

    const/16 v20, 0x2

    const/16 v21, 0x0

    move-object/from16 v16, v0

    invoke-direct/range {v16 .. v21}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;-><init>(Landroid/graphics/Bitmap;IIILcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$1;)V

    :goto_3
    sget-object v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->sBitmapCache:Ljava/util/Map;

    new-instance v4, Ljava/lang/ref/WeakReference;

    invoke-direct {v4, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v2, v9, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$c;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;->b()I

    move-result v4

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;->c()I

    move-result v5

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;->d()I

    move-result v6

    invoke-direct {v2, v4, v5, v6, v3}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$c;-><init>(IIILcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$1;)V

    sget-object v3, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->sLoadedBitmapCache:Ljava/util/WeakHashMap;

    invoke-virtual {v3, v1, v2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private pdecode(Ljava/lang/String;)Ljava/lang/String;
    .locals 7

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v1, -0x1

    move-object v2, p1

    const/4 p1, -0x1

    :cond_0
    :goto_0
    const-string v3, "%"

    add-int/lit8 p1, p1, 0x1

    invoke-virtual {v0, v3, p1}, Ljava/lang/StringBuilder;->indexOf(Ljava/lang/String;I)I

    move-result p1

    if-eq p1, v1, :cond_2

    add-int/lit8 v3, p1, 0x2

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-lt v3, v4, :cond_1

    goto :goto_1

    :cond_1
    const-string v4, "0123456789ABCDEF"

    add-int/lit8 v5, p1, 0x1

    invoke-virtual {v2, v5}, Ljava/lang/String;->charAt(I)C

    move-result v6

    invoke-virtual {v4, v6}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    const-string v6, "0123456789ABCDEF"

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-virtual {v6, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v3

    if-eq v4, v1, :cond_0

    if-eq v3, v1, :cond_0

    shl-int/lit8 v2, v4, 0x4

    or-int/2addr v2, v3

    int-to-char v2, v2

    invoke-virtual {v0, p1, v2}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    add-int/lit8 v2, p1, 0x3

    invoke-virtual {v0, v5, v2}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    :cond_2
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private static relativePath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    const-string v0, ".."

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "/.."

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    const/16 v0, 0x2f

    invoke-virtual {p0, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    if-gez v0, :cond_1

    return-object p1

    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    new-instance p0, Ljava/lang/SecurityException;

    const-string p1, "Parent Path References Not Allowed"

    invoke-direct {p0, p1}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static rotateAndFlipImage(Landroid/graphics/Bitmap;IZZ)Landroid/graphics/Bitmap;
    .locals 7

    if-nez p1, :cond_0

    if-nez p2, :cond_0

    if-eqz p3, :cond_3

    :cond_0
    if-eqz p0, :cond_3

    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    int-to-float p1, p1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v2, v1

    invoke-virtual {v5, p1, v0, v2}, Landroid/graphics/Matrix;->preRotate(FFF)Z

    const/high16 p1, 0x3f800000    # 1.0f

    const/high16 v0, -0x40800000    # -1.0f

    if-eqz p2, :cond_1

    const/high16 p2, -0x40800000    # -1.0f

    goto :goto_0

    :cond_1
    const/high16 p2, 0x3f800000    # 1.0f

    :goto_0
    if-eqz p3, :cond_2

    const/high16 p1, -0x40800000    # -1.0f

    :cond_2
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p3

    int-to-float p3, p3

    div-float/2addr p3, v1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v0, v1

    invoke-virtual {v5, p2, p1, p3, v0}, Landroid/graphics/Matrix;->preScale(FFFF)Z

    const/4 v1, 0x0

    const/4 v2, 0x0

    :try_start_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    const/4 v6, 0x1

    move-object v0, p0

    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    if-eq p0, p1, :cond_3

    move-object p0, p1

    goto :goto_1

    :catch_0
    move-exception p1

    const-string p2, "NexImageLoader"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "rotateImage Error : "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    :goto_1
    return-object p0
.end method

.method public static rotateImage(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    .locals 7

    if-eqz p1, :cond_0

    if-eqz p0, :cond_0

    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    int-to-float p1, p1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v2, v1

    invoke-virtual {v5, p1, v0, v2}, Landroid/graphics/Matrix;->setRotate(FFF)V

    const/4 v1, 0x0

    const/4 v2, 0x0

    :try_start_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    const/4 v6, 0x1

    move-object v0, p0

    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    if-eq p0, p1, :cond_0

    move-object p0, p1

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "NexImageLoader"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "rotateImage Error : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    :goto_0
    return-object p0
.end method


# virtual methods
.method public callbackReadAssetItemFile(Ljava/lang/String;Ljava/lang/String;)[B
    .locals 4

    invoke-static {}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a()Lcom/nexstreaming/app/common/nexasset/assetpackage/c;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->c(Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/assetpackage/f;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string p2, "NexImageLoader"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error get assetItem id="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1

    :cond_0
    :try_start_0
    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->a()Lcom/nexstreaming/kminternal/kinemaster/config/a;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->b()Landroid/content/Context;

    move-result-object p1

    invoke-interface {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getPackageURI()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getAssetPackage()Lcom/nexstreaming/app/common/nexasset/assetpackage/b;

    move-result-object v3

    invoke-interface {v3}, Lcom/nexstreaming/app/common/nexasset/assetpackage/b;->getAssetId()Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v2, v3}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    if-eqz p2, :cond_2

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x1

    if-ge v2, v3, :cond_1

    goto :goto_0

    :cond_1
    invoke-interface {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getFilePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->relativePath(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    goto :goto_1

    :cond_2
    :goto_0
    invoke-interface {v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getFilePath()Ljava/lang/String;

    move-result-object p2

    :goto_1
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    :try_start_1
    invoke-virtual {p1, p2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->a(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    :try_start_2
    invoke-static {p1, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    return-object p1

    :catchall_0
    move-exception p2

    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    throw p2
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    :catch_0
    move-exception p1

    const-string p2, "NexImageLoader"

    const-string v0, "Error reading file"

    invoke-static {p2, v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v1

    :catch_1
    move-exception p1

    const-string p2, "NexImageLoader"

    const-string v0, "Error making reader"

    invoke-static {p2, v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v1
.end method

.method public openFile(Ljava/lang/String;I)Lcom/nexstreaming/kminternal/nexvideoeditor/NexImage;
    .locals 4

    const-string v0, "@solid:"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, ".jpg"

    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 p2, 0x7

    const/16 v0, 0xf

    invoke-virtual {p1, p2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    const/16 p2, 0x10

    invoke-static {p1, p2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide p1

    long-to-int p1, p1

    const/16 p2, 0x20

    const/16 v0, 0x12

    const/16 v1, 0x240

    new-array v1, v1, [I

    const/4 v2, 0x0

    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_0

    aput p1, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    new-instance p1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImage;

    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, p2, v0, v2}, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-direct {p1, v1, p2, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImage;-><init>(Landroid/graphics/Bitmap;II)V

    return-object p1

    :cond_1
    const-string v0, "@assetItem:"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_4

    const/16 p2, 0xb

    invoke-virtual {p1, p2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_effectResourceLoader:Lcom/nexstreaming/kminternal/nexvideoeditor/a;

    if-eqz p2, :cond_3

    :try_start_0
    iget-object p2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_effectResourceLoader:Lcom/nexstreaming/kminternal/nexvideoeditor/a;

    invoke-interface {p2, p1, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/a;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1

    iget p2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_jpegMaxWidth:I

    iget v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_jpegMaxHeight:I

    iget v2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_jpegMaxSize:I

    invoke-static {p1, p2, v0, v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->loadBitmap(Ljava/io/InputStream;III)Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;->a()Landroid/graphics/Bitmap;

    move-result-object p1

    if-eqz p1, :cond_2

    const-string p2, "NexImageLoader"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "@assetItem bitmap width="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " height="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p2

    and-int/lit8 p2, p2, -0x2

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    and-int/lit8 v0, v0, -0x2

    new-instance v2, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImage;

    invoke-direct {v2, p1, p2, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImage;-><init>(Landroid/graphics/Bitmap;II)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    :cond_2
    return-object v1

    :catch_0
    :cond_3
    return-object v1

    :cond_4
    :try_start_1
    iget v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_jpegMaxWidth:I

    iget v2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_jpegMaxHeight:I

    iget v3, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_jpegMaxSize:I

    invoke-static {p1, v0, v2, v3, p2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->loadBitmap(Ljava/lang/String;IIII)Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;->a()Landroid/graphics/Bitmap;

    move-result-object p2

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$b;->d()I

    move-result p1

    if-eqz p2, :cond_5

    const-string v0, "NexImageLoader"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Actual bitmap width="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " height="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, ", loadedtype="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    and-int/lit8 v0, v0, -0x2

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    and-int/lit8 v2, v2, -0x2

    new-instance v3, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImage;

    invoke-direct {v3, p2, v0, v2, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImage;-><init>(Landroid/graphics/Bitmap;III)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    return-object v3

    :cond_5
    return-object v1

    :catch_1
    return-object v1
.end method

.method public openThemeFile(Ljava/lang/String;)[B
    .locals 8

    const/16 v0, 0x2f

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v1, 0x0

    if-ltz v0, :cond_0

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const-string v2, ""

    :goto_0
    iget-object v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_effectResourceLoader:Lcom/nexstreaming/kminternal/nexvideoeditor/a;

    const/4 v3, 0x0

    if-eqz v0, :cond_5

    :try_start_0
    iget-object v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_effectResourceLoader:Lcom/nexstreaming/kminternal/nexvideoeditor/a;

    invoke-interface {v0, v2, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_effectResourceLoader:Lcom/nexstreaming/kminternal/nexvideoeditor/a;

    invoke-interface {v0, v2, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/a;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    const-string v4, "NexImageLoader"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "get size begin loading bitmap for effect("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ") : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v4, 0x0

    :goto_1
    const-wide/32 v5, 0x7fffffff

    invoke-virtual {v0, v5, v6}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v5

    long-to-int v5, v5

    if-lez v5, :cond_1

    add-int/2addr v4, v5

    goto :goto_1

    :cond_1
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    iget-object v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_effectResourceLoader:Lcom/nexstreaming/kminternal/nexvideoeditor/a;

    invoke-interface {v0, v2, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/a;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    const-string v5, "NexImageLoader"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "get size end loading bitmap for effect("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, ") : "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " size="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    new-array v5, v4, [B

    move v6, v4

    :cond_2
    const/4 v7, -0x1

    invoke-virtual {v0, v5, v1, v6}, Ljava/io/InputStream;->read([BII)I

    move-result v6
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    if-eq v7, v6, :cond_3

    add-int/2addr v1, v6

    sub-int v6, v4, v1

    if-gtz v6, :cond_2

    :cond_3
    return-object v5

    :catch_0
    move-exception v0

    const-string v1, "NexImageLoader"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error loading bitmap for effect("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ") : "

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :cond_4
    return-object v3

    :cond_5
    return-object v3
.end method

.method public openThemeImage(Ljava/lang/String;)Lcom/nexstreaming/kminternal/nexvideoeditor/NexImage;
    .locals 53

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    const-string v2, ".force_effect/"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, ".force_effect/"

    const-string v3, "/"

    invoke-virtual {v0, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    :cond_0
    const-string v2, "[ThemeImage]/@special:"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_61

    const-string v2, "[PvwThImage]/@special:"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    goto/16 :goto_31

    :cond_1
    const-string v2, "[Text]"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-eqz v2, :cond_49

    const-string v2, "[Text]"

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    const-string v0, ";;"

    invoke-virtual {v2, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v7

    add-int/lit8 v0, v7, 0x2

    invoke-virtual {v2, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    const/16 v0, 0x1b

    invoke-virtual {v8, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v9

    const/4 v0, -0x1

    if-le v9, v0, :cond_3

    iget-object v0, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_effectResourceLoader:Lcom/nexstreaming/kminternal/nexvideoeditor/a;

    if-eqz v0, :cond_2

    :try_start_0
    iget-object v0, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_effectResourceLoader:Lcom/nexstreaming/kminternal/nexvideoeditor/a;

    invoke-virtual {v8, v5, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v0, v10}, Lcom/nexstreaming/kminternal/nexvideoeditor/a;->a(Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v0
    :try_end_0
    .catch Lcom/nexstreaming/kminternal/kinemaster/fonts/Font$TypefaceLoadException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v10, "NexImageLoader"

    const-string v11, "typeface error"

    invoke-static {v10, v11, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_2
    const/4 v0, 0x0

    :goto_0
    add-int/2addr v9, v6

    invoke-virtual {v8, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v8

    goto :goto_1

    :cond_3
    const/4 v0, 0x0

    :goto_1
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v9

    if-ge v9, v6, :cond_4

    const-string v8, "Title Text Goes Here"

    :cond_4
    new-array v9, v6, [Ljava/lang/String;

    aput-object v8, v9, v5

    const-string v10, "NexImageLoader"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "==== User Text: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v10, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v2, v5, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    const-string v7, ";"

    invoke-virtual {v2, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    const/4 v8, 0x0

    :goto_2
    array-length v10, v2

    const/4 v11, 0x2

    if-ge v8, v10, :cond_6

    aget-object v10, v2, v8

    const-string v12, "="

    invoke-virtual {v10, v12}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v10

    array-length v12, v10

    if-ge v12, v11, :cond_5

    aget-object v10, v10, v5

    const-string v11, ""

    invoke-interface {v7, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    :cond_5
    aget-object v11, v10, v5

    aget-object v10, v10, v6

    invoke-interface {v7, v11, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_3
    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    :cond_6
    const-string v2, "flags"

    invoke-interface {v7, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    const/16 v8, 0x10

    invoke-static {v2, v8}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v12

    long-to-int v2, v12

    const-string v10, "align"

    invoke-interface {v7, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10

    const-string v12, "longtext"

    invoke-interface {v7, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    const-string v13, "width"

    invoke-interface {v7, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    invoke-static {v13}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v13

    const-string v14, "height"

    invoke-interface {v7, v14}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/String;

    invoke-static {v14}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v14

    const-string v15, "bgcolor"

    invoke-interface {v7, v15}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    invoke-static {v15, v8}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v3

    long-to-int v3, v3

    const-string v4, "fillcolor"

    invoke-interface {v7, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    move/from16 v17, v12

    invoke-static {v4, v8}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v11

    long-to-int v4, v11

    const-string v11, "strokecolor"

    invoke-interface {v7, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-static {v11, v8}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v11

    long-to-int v11, v11

    const-string v12, "shadowcolor"

    invoke-interface {v7, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    invoke-static {v12, v8}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v5

    long-to-int v5, v5

    const-string v6, "maxlines"

    invoke-interface {v7, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    move/from16 v18, v11

    invoke-static {v6, v8}, Ljava/lang/Long;->parseLong(Ljava/lang/String;I)J

    move-result-wide v11

    long-to-int v6, v11

    const-string v11, "skewx"

    invoke-interface {v7, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-static {v11}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v11

    const-string v12, "scalex"

    invoke-interface {v7, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    invoke-static {v12}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v12

    const-string v15, "size"

    invoke-interface {v7, v15}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    invoke-static {v15}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v15

    const-string v8, "strokewidth"

    invoke-interface {v7, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-static {v8}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v8

    move/from16 v19, v4

    const-string v4, "spacingmult"

    invoke-interface {v7, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v4

    move/from16 v32, v8

    const-string v8, "spacingadd"

    invoke-interface {v7, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-static {v8}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v8

    move/from16 v33, v5

    const-string v5, "shadowradius"

    invoke-interface {v7, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v5

    move/from16 v34, v5

    const-string v5, "textblur"

    invoke-interface {v7, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v5

    move/from16 v35, v5

    const-string v5, "blurtype"

    invoke-interface {v7, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    move/from16 v36, v5

    const-string v5, "margin"

    invoke-interface {v7, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    move/from16 v37, v3

    const-string v3, "shadowoffsx"

    invoke-interface {v7, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v3

    move/from16 v38, v3

    const-string v3, "shadowoffsy"

    invoke-interface {v7, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v3

    move/from16 v39, v3

    const-string v3, "text"

    invoke-interface {v7, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    move/from16 v40, v6

    const-string v6, "baseid"

    invoke-interface {v7, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-direct {v1, v3}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->pdecode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v41, v3

    and-int/lit16 v3, v10, 0xf0

    and-int/lit8 v10, v10, 0xf

    move/from16 v42, v3

    move/from16 v44, v4

    move/from16 v43, v8

    move-object/from16 v8, v41

    const/4 v3, 0x0

    :goto_4
    const/4 v4, 0x3

    move/from16 v45, v5

    if-ge v3, v4, :cond_e

    array-length v4, v9

    if-ge v3, v4, :cond_c

    aget-object v4, v9, v3

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    const-string v20, ""

    move-object/from16 v46, v9

    move/from16 v48, v10

    move/from16 v47, v14

    const/4 v9, 0x0

    const/4 v14, 0x0

    move v10, v5

    :goto_5
    if-ge v9, v5, :cond_8

    move/from16 v49, v13

    invoke-virtual {v4, v9}, Ljava/lang/String;->charAt(I)C

    move-result v13

    move/from16 v50, v15

    const/16 v15, 0x20

    if-ne v13, v15, :cond_7

    div-int/lit8 v13, v5, 0x2

    sub-int/2addr v13, v9

    invoke-static {v13}, Ljava/lang/Math;->abs(I)I

    move-result v13

    if-ge v13, v10, :cond_7

    move v14, v9

    move v10, v13

    :cond_7
    add-int/lit8 v9, v9, 0x1

    move/from16 v13, v49

    move/from16 v15, v50

    goto :goto_5

    :cond_8
    move/from16 v49, v13

    move/from16 v50, v15

    if-lez v14, :cond_9

    add-int/lit8 v9, v14, 0x1

    if-ge v9, v5, :cond_9

    const/4 v10, 0x0

    invoke-virtual {v4, v10, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v4, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v20

    goto :goto_6

    :cond_9
    move-object v13, v4

    :goto_6
    move-object/from16 v9, v20

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "%"

    invoke-virtual {v10, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v14, v3, 0x1

    invoke-virtual {v10, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v8

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "%f"

    invoke-virtual {v10, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10, v13}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v8

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "%b"

    invoke-virtual {v10, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10, v9}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v9

    const/4 v10, 0x1

    if-ne v9, v10, :cond_a

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "%s"

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const/4 v9, 0x0

    invoke-virtual {v4, v9, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v8, v5, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "%!s"

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v8, ""

    invoke-virtual {v4, v5, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "%e"

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v8, ""

    invoke-virtual {v4, v5, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "%!e"

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v8, ""

    invoke-virtual {v4, v5, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "%m"

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v8, ""

    invoke-virtual {v4, v5, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v8

    goto/16 :goto_7

    :cond_a
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v9

    const/4 v10, 0x1

    if-ge v9, v10, :cond_b

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "%s"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, ""

    invoke-virtual {v8, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "%!s"

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v8, ""

    invoke-virtual {v4, v5, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "%e"

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v8, ""

    invoke-virtual {v4, v5, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "%!e"

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v8, ""

    invoke-virtual {v4, v5, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "%m"

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v8, ""

    invoke-virtual {v4, v5, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v8

    goto/16 :goto_7

    :cond_b
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v9

    const/4 v10, 0x1

    if-le v9, v10, :cond_d

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "%s"

    invoke-virtual {v9, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    const/4 v13, 0x0

    invoke-virtual {v4, v13, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v8, v9, v15}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v8

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "%!s"

    invoke-virtual {v9, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v10, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v8, v9, v13}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v8

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "%e"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    add-int/lit8 v10, v5, -0x1

    invoke-virtual {v4, v10, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v8, v9, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v5

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "%!e"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    invoke-virtual {v4, v9, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v5, v8, v13}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v5

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "%m"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x1

    invoke-virtual {v4, v9, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v8, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v8

    goto/16 :goto_7

    :cond_c
    move-object/from16 v46, v9

    move/from16 v48, v10

    move/from16 v49, v13

    move/from16 v47, v14

    move/from16 v50, v15

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "%"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v5, v3, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v9, ""

    invoke-virtual {v8, v4, v9}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "%s"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const-string v9, ""

    invoke-virtual {v4, v8, v9}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "%!s"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const-string v9, ""

    invoke-virtual {v4, v8, v9}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "%e"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const-string v9, ""

    invoke-virtual {v4, v8, v9}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "%!e"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const-string v9, ""

    invoke-virtual {v4, v8, v9}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "%m"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v8, ""

    invoke-virtual {v4, v5, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    move-object v8, v4

    :cond_d
    :goto_7
    add-int/lit8 v3, v3, 0x1

    move/from16 v5, v45

    move-object/from16 v9, v46

    move/from16 v14, v47

    move/from16 v10, v48

    move/from16 v13, v49

    move/from16 v15, v50

    goto/16 :goto_4

    :cond_e
    move/from16 v48, v10

    move/from16 v49, v13

    move/from16 v47, v14

    move/from16 v50, v15

    const-string v3, ".*[[\\u0400-\\u052F][\\u2DE0-\\u2DFF][\\uA640-\\uA69F]].*"

    invoke-virtual {v8, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v3

    new-instance v4, Landroid/text/TextPaint;

    invoke-direct {v4}, Landroid/text/TextPaint;-><init>()V

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Landroid/text/TextPaint;->setAntiAlias(Z)V

    const-string v5, "typeface"

    invoke-interface {v7, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    if-eqz v0, :cond_f

    invoke-virtual {v4, v0}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    goto/16 :goto_d

    :cond_f
    if-eqz v3, :cond_12

    and-int/lit8 v0, v2, 0x1

    if-eqz v0, :cond_10

    const/4 v0, 0x1

    goto :goto_8

    :cond_10
    const/4 v0, 0x0

    :goto_8
    and-int/lit8 v3, v2, 0x2

    if-eqz v3, :cond_11

    or-int/lit8 v0, v0, 0x2

    :cond_11
    invoke-static {v0}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    move-result-object v0

    invoke-virtual {v4, v0}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    goto/16 :goto_d

    :cond_12
    const-string v0, "android:"

    invoke-virtual {v5, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_15

    const-string v0, "android:"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {v5, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    and-int/lit8 v3, v2, 0x1

    if-eqz v3, :cond_13

    const/4 v3, 0x1

    goto :goto_9

    :cond_13
    const/4 v3, 0x0

    :goto_9
    and-int/lit8 v5, v2, 0x2

    if-eqz v5, :cond_14

    or-int/lit8 v3, v3, 0x2

    :cond_14
    invoke-static {v0, v3}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v0

    invoke-virtual {v4, v0}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    goto/16 :goto_d

    :cond_15
    const-string v0, "file:"

    invoke-virtual {v5, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_16

    const-string v0, "file:"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {v5, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/graphics/Typeface;->createFromFile(Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v0

    invoke-virtual {v4, v0}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    goto/16 :goto_d

    :cond_16
    const-string v0, "asset:"

    invoke-virtual {v5, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_17

    const-string v0, "asset:"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {v5, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    iget-object v3, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_assetManager:Landroid/content/res/AssetManager;

    if-eqz v3, :cond_20

    iget-object v3, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_assetManager:Landroid/content/res/AssetManager;

    invoke-static {v3, v0}, Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v0

    invoke-virtual {v4, v0}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    goto/16 :goto_d

    :cond_17
    const-string v0, "theme:"

    invoke-virtual {v5, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_18

    const-string v0, "theme:"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {v5, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    iget-object v3, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_effectResourceLoader:Lcom/nexstreaming/kminternal/nexvideoeditor/a;

    if-eqz v3, :cond_20

    :try_start_1
    iget-object v3, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_effectResourceLoader:Lcom/nexstreaming/kminternal/nexvideoeditor/a;

    invoke-interface {v3, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/a;->a(Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v0

    invoke-virtual {v4, v0}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
    :try_end_1
    .catch Lcom/nexstreaming/kminternal/kinemaster/fonts/Font$TypefaceLoadException; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_d

    :catch_1
    move-exception v0

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font$TypefaceLoadException;->printStackTrace()V

    goto/16 :goto_d

    :cond_18
    const-string v0, "fontid:"

    invoke-virtual {v5, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_19

    const-string v0, "fontid:"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {v5, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/fonts/c;->a()Lcom/nexstreaming/kminternal/kinemaster/fonts/c;

    move-result-object v3

    invoke-virtual {v3, v0}, Lcom/nexstreaming/kminternal/kinemaster/fonts/c;->b(Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v0

    invoke-virtual {v4, v0}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    goto/16 :goto_d

    :cond_19
    const-string v0, "fontfile:"

    invoke-virtual {v5, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1c

    const-string v0, "fontfile:"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {v5, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    iget-object v0, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_effectResourceLoader:Lcom/nexstreaming/kminternal/nexvideoeditor/a;

    if-eqz v0, :cond_1a

    :try_start_2
    iget-object v0, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_effectResourceLoader:Lcom/nexstreaming/kminternal/nexvideoeditor/a;

    invoke-interface {v0, v6, v3}, Lcom/nexstreaming/kminternal/nexvideoeditor/a;->c(Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/Typeface;

    move-result-object v0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Lcom/nexstreaming/kminternal/kinemaster/fonts/Font$TypefaceLoadException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_b

    :catch_2
    move-exception v0

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/fonts/Font$TypefaceLoadException;->printStackTrace()V

    goto :goto_a

    :catch_3
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :cond_1a
    :goto_a
    const/4 v0, 0x0

    :goto_b
    if-eqz v0, :cond_1b

    invoke-virtual {v4, v0}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    goto :goto_d

    :cond_1b
    const-string v0, "NexImageLoader"

    const-string v5, "TYPEFACE NOT FOUND : base_id=%s, font=%s"

    const/4 v7, 0x2

    new-array v9, v7, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v6, v9, v7

    const/4 v6, 0x1

    aput-object v3, v9, v6

    invoke-static {v5, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_d

    :cond_1c
    iget-object v0, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_effectResourceLoader:Lcom/nexstreaming/kminternal/nexvideoeditor/a;

    if-eqz v0, :cond_1d

    :try_start_3
    iget-object v0, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_effectResourceLoader:Lcom/nexstreaming/kminternal/nexvideoeditor/a;

    invoke-interface {v0, v6, v5}, Lcom/nexstreaming/kminternal/nexvideoeditor/a;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v3
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_4

    goto :goto_c

    :catch_4
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :cond_1d
    const/4 v3, 0x0

    :goto_c
    if-eqz v3, :cond_1f

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_1e

    const-string v0, "NexImageLoader"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "TYPEFACE FILE DOES NOT EXIST : base_id="

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "; f="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_d

    :cond_1e
    invoke-static {v3}, Landroid/graphics/Typeface;->createFromFile(Ljava/io/File;)Landroid/graphics/Typeface;

    move-result-object v0

    invoke-virtual {v4, v0}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    goto :goto_d

    :cond_1f
    const-string v0, "NexImageLoader"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "TYPEFACE NOT FOUND : base_id="

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_20
    :goto_d
    and-int/lit8 v0, v2, 0x10

    if-eqz v0, :cond_21

    const/4 v3, 0x1

    invoke-virtual {v4, v3}, Landroid/text/TextPaint;->setUnderlineText(Z)V

    goto :goto_e

    :cond_21
    const/4 v3, 0x1

    :goto_e
    and-int/lit8 v0, v2, 0x20

    if-eqz v0, :cond_22

    invoke-virtual {v4, v3}, Landroid/text/TextPaint;->setStrikeThruText(Z)V

    :cond_22
    and-int/lit16 v0, v2, 0x80

    if-eqz v0, :cond_23

    invoke-virtual {v4, v3}, Landroid/text/TextPaint;->setSubpixelText(Z)V

    :cond_23
    and-int/lit16 v0, v2, 0x200

    if-eqz v0, :cond_24

    invoke-virtual {v4, v3}, Landroid/text/TextPaint;->setLinearText(Z)V

    :cond_24
    float-to-double v5, v12

    const-wide/16 v9, 0x0

    cmpl-double v0, v5, v9

    if-lez v0, :cond_25

    invoke-virtual {v4, v12}, Landroid/text/TextPaint;->setTextScaleX(F)V

    :cond_25
    float-to-double v5, v11

    cmpl-double v0, v5, v9

    if-lez v0, :cond_26

    invoke-virtual {v4, v11}, Landroid/text/TextPaint;->setTextSkewX(F)V

    :cond_26
    move/from16 v3, v50

    float-to-double v5, v3

    cmpl-double v0, v5, v9

    if-lez v0, :cond_27

    invoke-virtual {v4, v3}, Landroid/text/TextPaint;->setTextSize(F)V

    move v15, v3

    goto :goto_f

    :cond_27
    invoke-virtual {v4}, Landroid/text/TextPaint;->getTextSize()F

    move-result v15

    :goto_f
    and-int/lit8 v0, v2, 0xc

    if-nez v0, :cond_28

    or-int/lit8 v2, v2, 0x4

    :cond_28
    if-lez v49, :cond_3f

    if-eqz v17, :cond_29

    packed-switch v17, :pswitch_data_0

    goto :goto_10

    :pswitch_0
    sget-object v3, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    goto :goto_11

    :pswitch_1
    sget-object v3, Landroid/text/TextUtils$TruncateAt;->MIDDLE:Landroid/text/TextUtils$TruncateAt;

    goto :goto_11

    :pswitch_2
    sget-object v3, Landroid/text/TextUtils$TruncateAt;->START:Landroid/text/TextUtils$TruncateAt;

    goto :goto_11

    :cond_29
    :goto_10
    const/4 v3, 0x0

    :goto_11
    sget-object v5, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    packed-switch v48, :pswitch_data_1

    sget-object v5, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    goto :goto_12

    :pswitch_3
    sget-object v5, Landroid/text/Layout$Alignment;->ALIGN_OPPOSITE:Landroid/text/Layout$Alignment;

    goto :goto_12

    :pswitch_4
    sget-object v5, Landroid/text/Layout$Alignment;->ALIGN_CENTER:Landroid/text/Layout$Alignment;

    :goto_12
    if-lez v49, :cond_2a

    move/from16 v6, v49

    goto :goto_13

    :cond_2a
    const/16 v6, 0x800

    :goto_13
    if-lez v47, :cond_2b

    move/from16 v7, v47

    goto :goto_14

    :cond_2b
    const/16 v7, 0x800

    :goto_14
    move v10, v15

    move/from16 v9, v49

    :goto_15
    new-instance v11, Landroid/text/StaticLayout;

    const/16 v22, 0x0

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v23

    mul-int/lit8 v12, v45, 0x2

    sub-int v31, v9, v12

    const/16 v29, 0x1

    move-object/from16 v20, v11

    move-object/from16 v21, v8

    move-object/from16 v24, v4

    move/from16 v25, v31

    move-object/from16 v26, v5

    move/from16 v27, v44

    move/from16 v28, v43

    move-object/from16 v30, v3

    invoke-direct/range {v20 .. v31}, Landroid/text/StaticLayout;-><init>(Ljava/lang/CharSequence;IILandroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFZLandroid/text/TextUtils$TruncateAt;I)V

    invoke-virtual {v11}, Landroid/text/StaticLayout;->getWidth()I

    move-result v9

    add-int/2addr v9, v12

    invoke-virtual {v11}, Landroid/text/StaticLayout;->getHeight()I

    move-result v14

    add-int/2addr v14, v12

    if-gt v9, v6, :cond_2d

    if-gt v14, v7, :cond_2d

    move/from16 v12, v40

    const/4 v13, 0x1

    if-lt v12, v13, :cond_2c

    invoke-virtual {v11}, Landroid/text/StaticLayout;->getLineCount()I

    move-result v13

    if-gt v13, v12, :cond_2e

    :cond_2c
    move v13, v9

    goto :goto_17

    :cond_2d
    move/from16 v12, v40

    :cond_2e
    float-to-double v0, v10

    move/from16 v51, v12

    float-to-double v12, v15

    const-wide/high16 v20, 0x4014000000000000L    # 5.0

    invoke-static {v12, v13}, Ljava/lang/Double;->isNaN(D)Z

    div-double v12, v12, v20

    cmpl-double v17, v0, v12

    if-lez v17, :cond_2f

    const-wide/high16 v12, 0x4018000000000000L    # 6.0

    cmpl-double v17, v0, v12

    if-lez v17, :cond_2f

    const/high16 v0, 0x3f800000    # 1.0f

    const/high16 v1, 0x41400000    # 12.0f

    div-float v1, v15, v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    sub-float/2addr v10, v0

    invoke-virtual {v4, v10}, Landroid/text/TextPaint;->setTextSize(F)V

    move/from16 v40, v51

    move-object/from16 v1, p0

    goto :goto_15

    :cond_2f
    if-le v9, v6, :cond_30

    goto :goto_16

    :cond_30
    move v6, v9

    :goto_16
    if-le v14, v7, :cond_31

    move v13, v6

    move v14, v7

    goto :goto_17

    :cond_31
    move v13, v6

    :goto_17
    and-int/lit16 v0, v2, 0x400

    if-nez v0, :cond_34

    if-lez v49, :cond_34

    if-lez v47, :cond_34

    const-string v0, "NexImageLoader"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "VAlign="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v3, v42

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " originalWidth="

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v5, v49

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, " originalHeight="

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v6, v47

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, " width="

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, " height="

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v1, 0x10

    if-eq v3, v1, :cond_33

    const/16 v1, 0x20

    if-eq v3, v1, :cond_32

    const/4 v14, 0x0

    goto :goto_18

    :cond_32
    sub-int v14, v6, v14

    goto :goto_18

    :cond_33
    sub-int v14, v6, v14

    const/4 v1, 0x2

    div-int/2addr v14, v1

    :goto_18
    move v0, v14

    const/16 v1, 0x800

    move v14, v6

    goto :goto_19

    :cond_34
    move v5, v13

    const/4 v0, 0x0

    const/16 v1, 0x800

    :goto_19
    if-le v5, v1, :cond_35

    const/16 v6, 0x800

    goto :goto_1a

    :cond_35
    move v6, v5

    :goto_1a
    if-le v14, v1, :cond_36

    const/4 v1, 0x1

    const/16 v14, 0x800

    goto :goto_1b

    :cond_36
    const/4 v1, 0x1

    :goto_1b
    if-ge v6, v1, :cond_37

    const/4 v6, 0x1

    :cond_37
    if-ge v14, v1, :cond_38

    const/4 v14, 0x1

    :cond_38
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v6, v14, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    and-int/lit8 v3, v3, -0x2

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    and-int/lit8 v5, v5, -0x2

    new-instance v6, Landroid/graphics/Canvas;

    invoke-direct {v6, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    move/from16 v7, v37

    invoke-virtual {v6, v7}, Landroid/graphics/Canvas;->drawColor(I)V

    invoke-virtual {v6}, Landroid/graphics/Canvas;->save()I

    move/from16 v7, v45

    int-to-float v7, v7

    invoke-virtual {v6, v7, v7}, Landroid/graphics/Canvas;->translate(FF)V

    int-to-float v0, v0

    const/4 v7, 0x0

    invoke-virtual {v6, v7, v0}, Landroid/graphics/Canvas;->translate(FF)V

    and-int/lit16 v0, v2, 0x100

    if-eqz v0, :cond_39

    cmpl-float v0, v34, v7

    if-lez v0, :cond_39

    invoke-virtual {v6}, Landroid/graphics/Canvas;->save()I

    move/from16 v9, v38

    move/from16 v10, v39

    invoke-virtual {v6, v9, v10}, Landroid/graphics/Canvas;->translate(FF)V

    new-instance v0, Landroid/graphics/BlurMaskFilter;

    sget-object v7, Landroid/graphics/BlurMaskFilter$Blur;->SOLID:Landroid/graphics/BlurMaskFilter$Blur;

    move/from16 v12, v34

    invoke-direct {v0, v12, v7}, Landroid/graphics/BlurMaskFilter;-><init>(FLandroid/graphics/BlurMaskFilter$Blur;)V

    invoke-virtual {v4, v0}, Landroid/text/TextPaint;->setMaskFilter(Landroid/graphics/MaskFilter;)Landroid/graphics/MaskFilter;

    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v4, v0}, Landroid/text/TextPaint;->setStyle(Landroid/graphics/Paint$Style;)V

    move/from16 v7, v33

    invoke-virtual {v4, v7}, Landroid/text/TextPaint;->setColor(I)V

    invoke-virtual {v11, v6}, Landroid/text/StaticLayout;->draw(Landroid/graphics/Canvas;)V

    const/4 v7, 0x0

    invoke-virtual {v4, v7}, Landroid/text/TextPaint;->setMaskFilter(Landroid/graphics/MaskFilter;)Landroid/graphics/MaskFilter;

    invoke-virtual {v6}, Landroid/graphics/Canvas;->restore()V

    :cond_39
    and-int/lit16 v0, v2, 0x1000

    if-eqz v0, :cond_3a

    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v4, v0}, Landroid/text/TextPaint;->setStyle(Landroid/graphics/Paint$Style;)V

    move/from16 v13, v18

    invoke-virtual {v4, v13}, Landroid/text/TextPaint;->setColor(I)V

    move/from16 v14, v32

    invoke-virtual {v4, v14}, Landroid/text/TextPaint;->setStrokeWidth(F)V

    invoke-virtual {v11, v6}, Landroid/text/StaticLayout;->draw(Landroid/graphics/Canvas;)V

    goto :goto_1c

    :cond_3a
    move/from16 v13, v18

    move/from16 v14, v32

    :goto_1c
    move/from16 v7, v35

    float-to-double v8, v7

    const-wide v16, 0x3ee4f8b588e368f1L    # 1.0E-5

    cmpl-double v0, v8, v16

    if-lez v0, :cond_3b

    sget-object v0, Landroid/graphics/BlurMaskFilter$Blur;->NORMAL:Landroid/graphics/BlurMaskFilter$Blur;

    packed-switch v36, :pswitch_data_2

    goto :goto_1d

    :pswitch_5
    sget-object v0, Landroid/graphics/BlurMaskFilter$Blur;->OUTER:Landroid/graphics/BlurMaskFilter$Blur;

    goto :goto_1d

    :pswitch_6
    sget-object v0, Landroid/graphics/BlurMaskFilter$Blur;->INNER:Landroid/graphics/BlurMaskFilter$Blur;

    goto :goto_1d

    :pswitch_7
    sget-object v0, Landroid/graphics/BlurMaskFilter$Blur;->SOLID:Landroid/graphics/BlurMaskFilter$Blur;

    goto :goto_1d

    :pswitch_8
    sget-object v0, Landroid/graphics/BlurMaskFilter$Blur;->NORMAL:Landroid/graphics/BlurMaskFilter$Blur;

    :goto_1d
    new-instance v8, Landroid/graphics/BlurMaskFilter;

    invoke-direct {v8, v7, v0}, Landroid/graphics/BlurMaskFilter;-><init>(FLandroid/graphics/BlurMaskFilter$Blur;)V

    invoke-virtual {v4, v8}, Landroid/text/TextPaint;->setMaskFilter(Landroid/graphics/MaskFilter;)Landroid/graphics/MaskFilter;

    :cond_3b
    and-int/lit8 v0, v2, 0x4

    if-eqz v0, :cond_3d

    and-int/lit16 v0, v2, 0x800

    if-eqz v0, :cond_3c

    new-instance v0, Landroid/graphics/PorterDuffXfermode;

    sget-object v7, Landroid/graphics/PorterDuff$Mode;->DST_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v0, v7}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v4, v0}, Landroid/text/TextPaint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    :cond_3c
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v4, v0}, Landroid/text/TextPaint;->setStyle(Landroid/graphics/Paint$Style;)V

    move/from16 v15, v19

    invoke-virtual {v4, v15}, Landroid/text/TextPaint;->setColor(I)V

    invoke-virtual {v11, v6}, Landroid/text/StaticLayout;->draw(Landroid/graphics/Canvas;)V

    const/4 v7, 0x0

    invoke-virtual {v4, v7}, Landroid/text/TextPaint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    :cond_3d
    const/16 v7, 0x8

    and-int/lit8 v0, v2, 0x8

    if-eqz v0, :cond_3e

    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v4, v0}, Landroid/text/TextPaint;->setStyle(Landroid/graphics/Paint$Style;)V

    invoke-virtual {v4, v13}, Landroid/text/TextPaint;->setColor(I)V

    invoke-virtual {v4, v14}, Landroid/text/TextPaint;->setStrokeWidth(F)V

    invoke-virtual {v11, v6}, Landroid/text/StaticLayout;->draw(Landroid/graphics/Canvas;)V

    :cond_3e
    const/4 v2, 0x0

    invoke-virtual {v4, v2}, Landroid/text/TextPaint;->setMaskFilter(Landroid/graphics/MaskFilter;)Landroid/graphics/MaskFilter;

    invoke-virtual {v6}, Landroid/graphics/Canvas;->restore()V

    move v6, v5

    move v5, v3

    goto/16 :goto_22

    :cond_3f
    move/from16 v13, v18

    move/from16 v15, v19

    move/from16 v14, v32

    move/from16 v12, v34

    move/from16 v7, v37

    move/from16 v9, v38

    move/from16 v10, v39

    move/from16 v6, v47

    move/from16 v5, v49

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v3, 0x0

    invoke-virtual {v4, v8, v3, v1, v0}, Landroid/text/TextPaint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    iget v1, v0, Landroid/graphics/Rect;->right:I

    add-int/lit8 v1, v1, 0x14

    iput v1, v0, Landroid/graphics/Rect;->right:I

    float-to-double v11, v12

    invoke-static {v11, v12}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v11

    double-to-int v1, v11

    invoke-virtual {v4}, Landroid/text/TextPaint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    move-result-object v3

    iget v11, v3, Landroid/graphics/Paint$FontMetrics;->bottom:F

    const/high16 v12, 0x40000000    # 2.0f

    mul-float v11, v11, v12

    iget v12, v3, Landroid/graphics/Paint$FontMetrics;->top:F

    sub-float/2addr v11, v12

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v12

    int-to-float v12, v12

    invoke-static {v11, v12}, Ljava/lang/Math;->max(FF)F

    move-result v11

    float-to-int v11, v11

    const/4 v12, 0x1

    if-lt v5, v12, :cond_41

    if-ge v6, v12, :cond_40

    goto :goto_1e

    :cond_40
    const/4 v10, 0x1

    move/from16 v52, v6

    move v6, v5

    move/from16 v5, v52

    goto :goto_20

    :cond_41
    :goto_1e
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v5

    iget v0, v0, Landroid/graphics/Rect;->right:I

    invoke-static {v5, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    mul-int/lit8 v5, v1, 0x2

    add-int/2addr v0, v5

    invoke-static {v9}, Ljava/lang/Math;->abs(F)F

    move-result v6

    float-to-int v6, v6

    add-int/2addr v0, v6

    add-int/2addr v11, v5

    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    move-result v5

    float-to-int v5, v5

    add-int/2addr v11, v5

    const/16 v5, 0x800

    if-le v0, v5, :cond_42

    const/16 v0, 0x800

    :cond_42
    if-le v11, v5, :cond_43

    move v6, v0

    goto :goto_1f

    :cond_43
    move v6, v0

    move v5, v11

    :goto_1f
    const/4 v10, 0x1

    :goto_20
    if-ge v6, v10, :cond_44

    const/4 v6, 0x1

    :cond_44
    if-ge v5, v10, :cond_45

    const/4 v5, 0x1

    :cond_45
    packed-switch v48, :pswitch_data_3

    sget-object v0, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v4, v0}, Landroid/text/TextPaint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    const/high16 v0, 0x41a00000    # 20.0f

    goto :goto_21

    :pswitch_9
    sget-object v0, Landroid/graphics/Paint$Align;->RIGHT:Landroid/graphics/Paint$Align;

    invoke-virtual {v4, v0}, Landroid/text/TextPaint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    int-to-float v0, v6

    goto :goto_21

    :pswitch_a
    sget-object v0, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v4, v0}, Landroid/text/TextPaint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    div-int/lit8 v0, v6, 0x2

    int-to-float v0, v0

    :goto_21
    int-to-float v10, v5

    iget v3, v3, Landroid/graphics/Paint$FontMetrics;->ascent:F

    sub-float/2addr v10, v3

    const/high16 v3, 0x40000000    # 2.0f

    div-float v3, v10, v3

    int-to-float v1, v1

    const/4 v10, 0x0

    invoke-static {v10, v9}, Ljava/lang/Math;->min(FF)F

    move-result v9

    sub-float/2addr v1, v9

    add-float/2addr v0, v1

    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v6, v5, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    and-int/lit8 v5, v5, -0x2

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    and-int/lit8 v6, v6, -0x2

    new-instance v9, Landroid/graphics/Canvas;

    invoke-direct {v9, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {v9, v7}, Landroid/graphics/Canvas;->drawColor(I)V

    and-int/lit8 v7, v2, 0x4

    if-eqz v7, :cond_46

    sget-object v10, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v4, v10}, Landroid/text/TextPaint;->setStyle(Landroid/graphics/Paint$Style;)V

    invoke-virtual {v4, v15}, Landroid/text/TextPaint;->setColor(I)V

    invoke-virtual {v9, v8, v0, v3, v4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    :cond_46
    and-int/lit8 v10, v2, 0x8

    if-eqz v10, :cond_48

    if-eqz v7, :cond_47

    and-int/lit16 v2, v2, 0x100

    if-eqz v2, :cond_47

    const/4 v2, 0x0

    const/4 v7, 0x0

    invoke-virtual {v4, v7, v7, v7, v2}, Landroid/text/TextPaint;->setShadowLayer(FFFI)V

    :cond_47
    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v4, v2}, Landroid/text/TextPaint;->setStyle(Landroid/graphics/Paint$Style;)V

    invoke-virtual {v4, v13}, Landroid/text/TextPaint;->setColor(I)V

    invoke-virtual {v4, v14}, Landroid/text/TextPaint;->setStrokeWidth(F)V

    new-instance v2, Landroid/graphics/Path;

    invoke-direct {v2}, Landroid/graphics/Path;-><init>()V

    const/16 v22, 0x0

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v23

    move-object/from16 v20, v4

    move-object/from16 v21, v8

    move/from16 v24, v0

    move/from16 v25, v3

    move-object/from16 v26, v2

    invoke-virtual/range {v20 .. v26}, Landroid/text/TextPaint;->getTextPath(Ljava/lang/String;IIFFLandroid/graphics/Path;)V

    invoke-virtual {v9, v2, v4}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    :cond_48
    :goto_22
    move-object v3, v1

    move v10, v5

    move-object/from16 v1, p0

    goto/16 :goto_30

    :cond_49
    const-string v1, "[ThemeImage]"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const/16 v2, 0x2f

    if-eqz v1, :cond_4e

    const-string v1, "[ThemeImage]"

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-ltz v1, :cond_4a

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    const/4 v2, 0x1

    add-int/2addr v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    :goto_23
    move-object v2, v0

    move-object/from16 v1, p0

    goto :goto_24

    :cond_4a
    const-string v3, ""

    goto :goto_23

    :goto_24
    iget-object v0, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_effectResourceLoader:Lcom/nexstreaming/kminternal/nexvideoeditor/a;

    if-eqz v0, :cond_4b

    :try_start_4
    iget-object v0, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_effectResourceLoader:Lcom/nexstreaming/kminternal/nexvideoeditor/a;

    invoke-interface {v0, v3, v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/a;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v0
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_5

    goto :goto_25

    :catch_5
    move-exception v0

    const-string v4, "NexImageLoader"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Error loading bitmap for effect("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ") : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :cond_4b
    const/4 v0, 0x0

    :goto_25
    if-nez v0, :cond_4c

    iget-object v4, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_assetManager:Landroid/content/res/AssetManager;

    if-eqz v4, :cond_4c

    :try_start_5
    iget-object v0, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_assetManager:Landroid/content/res/AssetManager;

    invoke-virtual {v0, v2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v0
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_6

    goto :goto_26

    :catch_6
    move-exception v0

    const-string v4, "NexImageLoader"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Error loading bitmap (general asset mode) for effect("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ") : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    const/4 v0, 0x0

    :cond_4c
    :goto_26
    if-eqz v0, :cond_4d

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    new-instance v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImage;

    invoke-direct {v4, v0, v2, v3}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImage;-><init>(Landroid/graphics/Bitmap;II)V

    return-object v4

    :cond_4d
    const-string v4, "NexImageLoader"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Bitmap failed to load for effect("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ") : "

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v3, v0

    goto :goto_27

    :cond_4e
    move-object/from16 v1, p0

    const-string v3, "[Overlay]"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_52

    iget-object v2, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_overlayPathResolver:Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$d;

    if-nez v2, :cond_4f

    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    const/16 v2, 0x8

    invoke-static {v2, v2, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    new-instance v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImage;

    invoke-direct {v4, v0, v2, v3}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImage;-><init>(Landroid/graphics/Bitmap;II)V

    return-object v4

    :cond_4f
    const-string v2, "[Overlay]"

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    iget-object v2, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_overlayPathResolver:Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$d;

    invoke-virtual {v2, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$d;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_50

    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    const/16 v2, 0x8

    invoke-static {v2, v2, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    new-instance v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImage;

    invoke-direct {v4, v0, v2, v3}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImage;-><init>(Landroid/graphics/Bitmap;II)V

    return-object v4

    :cond_50
    new-instance v2, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v3, 0x1

    iput-boolean v3, v2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    invoke-static {v0, v2}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    const/4 v4, 0x0

    iput-boolean v4, v2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    iput v3, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    invoke-static {v0, v2}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v3

    if-eqz v3, :cond_51

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    new-instance v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImage;

    invoke-direct {v4, v3, v0, v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImage;-><init>(Landroid/graphics/Bitmap;II)V

    return-object v4

    :cond_51
    :goto_27
    const/4 v6, 0x0

    const/4 v10, 0x0

    goto/16 :goto_30

    :cond_52
    const-string v3, "[PvwThImage]"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_57

    const-string v3, "[ThemeImage]"

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-ltz v2, :cond_53

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    const/4 v3, 0x1

    add-int/2addr v2, v3

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    :goto_28
    move-object v2, v0

    goto :goto_29

    :cond_53
    const-string v4, ""

    goto :goto_28

    :goto_29
    new-instance v3, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v3}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    iget-object v0, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_effectResourceLoader:Lcom/nexstreaming/kminternal/nexvideoeditor/a;

    if-eqz v0, :cond_54

    :try_start_6
    iget-object v0, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_effectResourceLoader:Lcom/nexstreaming/kminternal/nexvideoeditor/a;

    invoke-interface {v0, v4, v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/a;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    const/4 v5, 0x0

    invoke-static {v0, v5, v3}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_7

    goto :goto_2a

    :catch_7
    move-exception v0

    const-string v5, "NexImageLoader"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Error loading bitmap for effect("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, ") : "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :cond_54
    const/4 v0, 0x0

    :goto_2a
    if-nez v0, :cond_55

    iget-object v5, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_assetManager:Landroid/content/res/AssetManager;

    if-eqz v5, :cond_55

    :try_start_7
    iget-object v0, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_assetManager:Landroid/content/res/AssetManager;

    invoke-virtual {v0, v2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    const/4 v5, 0x0

    invoke-static {v0, v5, v3}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_8

    goto :goto_2b

    :catch_8
    move-exception v0

    const-string v3, "NexImageLoader"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Error loading bitmap (general asset mode) for effect("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ") : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    const/4 v3, 0x0

    goto :goto_2c

    :cond_55
    :goto_2b
    move-object v3, v0

    :goto_2c
    if-eqz v3, :cond_56

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    new-instance v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImage;

    invoke-direct {v4, v3, v0, v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImage;-><init>(Landroid/graphics/Bitmap;II)V

    return-object v4

    :cond_56
    const-string v0, "NexImageLoader"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Bitmap failed to load for effect("

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ") : "

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_27

    :cond_57
    const-string v2, "[Overlay]"

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5a

    iget-object v2, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_overlayPathResolver:Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$d;

    if-nez v2, :cond_58

    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    const/16 v2, 0x8

    invoke-static {v2, v2, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    new-instance v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImage;

    invoke-direct {v4, v0, v2, v3}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImage;-><init>(Landroid/graphics/Bitmap;II)V

    return-object v4

    :cond_58
    const-string v2, "[Overlay]"

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    iget-object v2, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_overlayPathResolver:Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$d;

    invoke-virtual {v2, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader$d;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_59

    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    const/16 v2, 0x8

    invoke-static {v2, v2, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    new-instance v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImage;

    invoke-direct {v4, v0, v2, v3}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImage;-><init>(Landroid/graphics/Bitmap;II)V

    return-object v4

    :cond_59
    new-instance v2, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v3, 0x1

    iput-boolean v3, v2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    invoke-static {v0, v2}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    const/4 v10, 0x0

    iput-boolean v10, v2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    iput v3, v2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    invoke-static {v0, v2}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v3

    if-eqz v3, :cond_5f

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    new-instance v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImage;

    invoke-direct {v4, v3, v0, v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImage;-><init>(Landroid/graphics/Bitmap;II)V

    return-object v4

    :cond_5a
    const/4 v10, 0x0

    const-string v2, "["

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_5e

    iget-object v2, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_assetManager:Landroid/content/res/AssetManager;

    if-eqz v2, :cond_5d

    :try_start_8
    const-string v2, "placeholder1.jpg"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-eqz v2, :cond_5c

    const-string v2, "placeholder2.jpg"

    invoke-virtual {v0, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_5b

    goto :goto_2d

    :cond_5b
    iget-object v2, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_assetManager:Landroid/content/res/AssetManager;

    invoke-virtual {v2, v0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_2e

    :cond_5c
    :goto_2d
    iget-object v2, v1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_assetManager:Landroid/content/res/AssetManager;

    invoke-virtual {v2, v0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v0
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_9

    :goto_2e
    move-object v3, v0

    goto :goto_2f

    :catch_9
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :cond_5d
    const/4 v3, 0x0

    :goto_2f
    if-eqz v3, :cond_5f

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    new-instance v4, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImage;

    invoke-direct {v4, v3, v0, v2}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImage;-><init>(Landroid/graphics/Bitmap;II)V

    return-object v4

    :cond_5e
    const/4 v3, 0x0

    :cond_5f
    const/4 v6, 0x0

    :goto_30
    if-eqz v3, :cond_60

    if-lez v10, :cond_60

    if-lez v6, :cond_60

    new-instance v0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImage;

    invoke-direct {v0, v3, v10, v6}, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImage;-><init>(Landroid/graphics/Bitmap;II)V

    return-object v0

    :cond_60
    const/4 v2, 0x0

    return-object v2

    :cond_61
    :goto_31
    const/4 v2, 0x0

    return-object v2

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x0
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x1
        :pswitch_a
        :pswitch_9
    .end packed-switch
.end method

.method public setResources(Landroid/content/res/Resources;)V
    .locals 0

    if-nez p1, :cond_0

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_assetManager:Landroid/content/res/AssetManager;

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/content/res/Resources;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p1

    iput-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexImageLoader;->m_assetManager:Landroid/content/res/AssetManager;

    :goto_0
    return-void
.end method
