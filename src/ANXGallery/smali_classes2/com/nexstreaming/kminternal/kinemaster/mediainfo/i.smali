.class public Lcom/nexstreaming/kminternal/kinemaster/mediainfo/i;
.super Ljava/lang/Object;
.source "ThumbnailsImpl.java"

# interfaces
.implements Lcom/nexstreaming/kminternal/kinemaster/mediainfo/h;


# instance fields
.field private final a:Landroid/graphics/Bitmap;

.field private final b:I

.field private final c:I

.field private final d:I

.field private final e:[I


# direct methods
.method constructor <init>(Landroid/graphics/Bitmap;II[I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/i;->a:Landroid/graphics/Bitmap;

    iput p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/i;->b:I

    iput p3, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/i;->c:I

    iput-object p4, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/i;->e:[I

    if-eqz p1, :cond_1

    if-eqz p4, :cond_0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p1

    iget p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/i;->b:I

    div-int/2addr p1, p2

    array-length p2, p4

    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result p1

    iput p1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/i;->d:I

    return-void

    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "thumbnailTime is null"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "bm is null"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private b(IIZZ)Landroid/graphics/Bitmap;
    .locals 7

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    iget v4, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/i;->d:I

    if-ge v1, v4, :cond_2

    iget-object v4, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/i;->e:[I

    aget v4, v4, v1

    sub-int/2addr v4, p2

    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v4

    if-eqz v1, :cond_0

    if-ge v4, v3, :cond_1

    :cond_0
    move v2, v1

    move v3, v4

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    new-instance p2, Landroid/graphics/Rect;

    iget v1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/i;->b:I

    mul-int v1, v1, v2

    iget v3, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/i;->b:I

    mul-int v2, v2, v3

    iget v3, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/i;->b:I

    add-int/2addr v2, v3

    iget v3, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/i;->c:I

    invoke-direct {p2, v1, v0, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    const/16 v1, 0xb4

    const/4 v2, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    const/high16 v4, -0x40800000    # -1.0f

    if-ne p1, v1, :cond_6

    iget p1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/i;->b:I

    iget v1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/i;->c:I

    sget-object v5, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, v1, v5}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, p1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    if-eqz p3, :cond_3

    if-eqz p4, :cond_3

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p3

    div-int/lit8 p3, p3, 0x2

    int-to-float p3, p3

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p4

    div-int/lit8 p4, p4, 0x2

    int-to-float p4, p4

    invoke-virtual {v1, v4, v4, p3, p4}, Landroid/graphics/Canvas;->scale(FFFF)V

    goto :goto_1

    :cond_3
    if-eqz p3, :cond_4

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p3

    div-int/lit8 p3, p3, 0x2

    int-to-float p3, p3

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p4

    div-int/lit8 p4, p4, 0x2

    int-to-float p4, p4

    invoke-virtual {v1, v4, v3, p3, p4}, Landroid/graphics/Canvas;->scale(FFFF)V

    goto :goto_1

    :cond_4
    if-eqz p4, :cond_5

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p3

    div-int/lit8 p3, p3, 0x2

    int-to-float p3, p3

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p4

    div-int/lit8 p4, p4, 0x2

    int-to-float p4, p4

    invoke-virtual {v1, v3, v4, p3, p4}, Landroid/graphics/Canvas;->scale(FFFF)V

    :cond_5
    :goto_1
    iget-object p3, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/i;->a:Landroid/graphics/Bitmap;

    new-instance p4, Landroid/graphics/Rect;

    iget v3, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/i;->b:I

    iget v4, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/i;->c:I

    invoke-direct {p4, v0, v0, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {v1, p3, p2, p4, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    return-object p1

    :cond_6
    if-nez p1, :cond_a

    iget p1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/i;->b:I

    iget v1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/i;->c:I

    sget-object v5, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, v1, v5}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, p1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    if-eqz p3, :cond_7

    if-eqz p4, :cond_7

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p3

    div-int/lit8 p3, p3, 0x2

    int-to-float p3, p3

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p4

    div-int/lit8 p4, p4, 0x2

    int-to-float p4, p4

    invoke-virtual {v1, v4, v4, p3, p4}, Landroid/graphics/Canvas;->scale(FFFF)V

    goto :goto_2

    :cond_7
    if-eqz p3, :cond_8

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p3

    div-int/lit8 p3, p3, 0x2

    int-to-float p3, p3

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p4

    div-int/lit8 p4, p4, 0x2

    int-to-float p4, p4

    invoke-virtual {v1, v4, v3, p3, p4}, Landroid/graphics/Canvas;->scale(FFFF)V

    goto :goto_2

    :cond_8
    if-eqz p4, :cond_9

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p3

    div-int/lit8 p3, p3, 0x2

    int-to-float p3, p3

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p4

    div-int/lit8 p4, p4, 0x2

    int-to-float p4, p4

    invoke-virtual {v1, v3, v4, p3, p4}, Landroid/graphics/Canvas;->scale(FFFF)V

    :cond_9
    :goto_2
    const/high16 p3, 0x43340000    # 180.0f

    iget p4, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/i;->b:I

    div-int/lit8 p4, p4, 0x2

    int-to-float p4, p4

    iget v3, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/i;->c:I

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    invoke-virtual {v1, p3, p4, v3}, Landroid/graphics/Canvas;->rotate(FFF)V

    iget-object p3, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/i;->a:Landroid/graphics/Bitmap;

    new-instance p4, Landroid/graphics/Rect;

    iget v3, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/i;->b:I

    iget v4, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/i;->c:I

    invoke-direct {p4, v0, v0, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {v1, p3, p2, p4, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    return-object p1

    :cond_a
    const/16 v1, 0x5a

    const/4 v5, 0x0

    if-ne p1, v1, :cond_e

    iget p1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/i;->c:I

    iget v1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/i;->b:I

    sget-object v6, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, v1, v6}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, p1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    if-eqz p3, :cond_b

    if-eqz p4, :cond_b

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p3

    div-int/lit8 p3, p3, 0x2

    int-to-float p3, p3

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p4

    div-int/lit8 p4, p4, 0x2

    int-to-float p4, p4

    invoke-virtual {v1, v4, v4, p3, p4}, Landroid/graphics/Canvas;->scale(FFFF)V

    goto :goto_3

    :cond_b
    if-eqz p3, :cond_c

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p3

    div-int/lit8 p3, p3, 0x2

    int-to-float p3, p3

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p4

    div-int/lit8 p4, p4, 0x2

    int-to-float p4, p4

    invoke-virtual {v1, v3, v4, p3, p4}, Landroid/graphics/Canvas;->scale(FFFF)V

    goto :goto_3

    :cond_c
    if-eqz p4, :cond_d

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p3

    div-int/lit8 p3, p3, 0x2

    int-to-float p3, p3

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p4

    div-int/lit8 p4, p4, 0x2

    int-to-float p4, p4

    invoke-virtual {v1, v4, v3, p3, p4}, Landroid/graphics/Canvas;->scale(FFFF)V

    :cond_d
    :goto_3
    const/high16 p3, 0x42b40000    # 90.0f

    invoke-virtual {v1, p3, v5, v5}, Landroid/graphics/Canvas;->rotate(FFF)V

    iget-object p3, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/i;->a:Landroid/graphics/Bitmap;

    new-instance p4, Landroid/graphics/Rect;

    iget v3, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/i;->c:I

    neg-int v3, v3

    iget v4, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/i;->b:I

    invoke-direct {p4, v0, v3, v4, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {v1, p3, p2, p4, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    return-object p1

    :cond_e
    const/16 v1, 0x10e

    if-ne p1, v1, :cond_12

    iget p1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/i;->c:I

    iget v1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/i;->b:I

    sget-object v6, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, v1, v6}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, p1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    if-eqz p3, :cond_f

    if-eqz p4, :cond_f

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p3

    div-int/lit8 p3, p3, 0x2

    int-to-float p3, p3

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p4

    div-int/lit8 p4, p4, 0x2

    int-to-float p4, p4

    invoke-virtual {v1, v4, v4, p3, p4}, Landroid/graphics/Canvas;->scale(FFFF)V

    goto :goto_4

    :cond_f
    if-eqz p3, :cond_10

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p3

    div-int/lit8 p3, p3, 0x2

    int-to-float p3, p3

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p4

    div-int/lit8 p4, p4, 0x2

    int-to-float p4, p4

    invoke-virtual {v1, v3, v4, p3, p4}, Landroid/graphics/Canvas;->scale(FFFF)V

    goto :goto_4

    :cond_10
    if-eqz p4, :cond_11

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p3

    div-int/lit8 p3, p3, 0x2

    int-to-float p3, p3

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p4

    div-int/lit8 p4, p4, 0x2

    int-to-float p4, p4

    invoke-virtual {v1, v4, v3, p3, p4}, Landroid/graphics/Canvas;->scale(FFFF)V

    :cond_11
    :goto_4
    const/high16 p3, 0x43870000    # 270.0f

    invoke-virtual {v1, p3, v5, v5}, Landroid/graphics/Canvas;->rotate(FFF)V

    iget-object p3, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/i;->a:Landroid/graphics/Bitmap;

    new-instance p4, Landroid/graphics/Rect;

    iget v3, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/i;->b:I

    neg-int v3, v3

    iget v4, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/i;->c:I

    invoke-direct {p4, v3, v0, v0, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {v1, p3, p2, p4, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    return-object p1

    :cond_12
    return-object v2
.end method


# virtual methods
.method public a(IIZZ)Landroid/graphics/Bitmap;
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/i;->b(IIZZ)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1
.end method

.method public b()[I
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/i;->e:[I

    return-object v0
.end method
