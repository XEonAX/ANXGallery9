.class Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f$1;
.super Ljava/lang/Object;
.source "ThumbnailConversionTask.java"

# interfaces
.implements Lcom/nexstreaming/kminternal/kinemaster/mediainfo/d;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f;->a(Ljava/io/InputStream;)Lcom/nexstreaming/app/common/task/Task$TaskError;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field a:I

.field b:I

.field c:Landroid/graphics/Bitmap;

.field d:Landroid/graphics/Canvas;

.field e:Landroid/graphics/Rect;

.field f:Landroid/graphics/Paint;

.field final synthetic g:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f;


# direct methods
.method constructor <init>(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f$1;->g:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/Bitmap;III)V
    .locals 7

    const/4 v0, 0x1

    const/16 v1, 0xa0

    const/4 v2, 0x0

    if-nez p2, :cond_0

    const/16 v3, 0x5a

    iput v3, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f$1;->a:I

    mul-int/lit16 v4, p3, 0xa0

    iput v4, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f$1;->b:I

    iget v4, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f$1;->b:I

    iget v5, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f$1;->a:I

    sget-object v6, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-static {v4, v5, v6}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v4

    iput-object v4, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f$1;->c:Landroid/graphics/Bitmap;

    iget-object v4, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f$1;->g:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f;

    iget-object v5, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f$1;->c:Landroid/graphics/Bitmap;

    invoke-static {v4, v5}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f;->a(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    new-instance v4, Landroid/graphics/Canvas;

    iget-object v5, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f$1;->c:Landroid/graphics/Bitmap;

    invoke-direct {v4, v5}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v4, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f$1;->d:Landroid/graphics/Canvas;

    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4, v2, v2, v1, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v4, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f$1;->e:Landroid/graphics/Rect;

    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    iput-object v3, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f$1;->f:Landroid/graphics/Paint;

    iget-object v3, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f$1;->f:Landroid/graphics/Paint;

    invoke-virtual {v3, v0}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    iget-object v3, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f$1;->g:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f;

    new-array v4, p3, [I

    invoke-static {v3, v4}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f;->a(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f;[I)[I

    const-string v3, "KMMediaInfo_ThumbConv"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "processRawFile : totalCount="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget-object v3, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f$1;->g:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f;

    invoke-static {v3}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f;->a(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f;)[I

    move-result-object v3

    aput p4, v3, p2

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f$1;->e:Landroid/graphics/Rect;

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Rect;->offset(II)V

    return-void

    :cond_1
    const/4 p4, 0x0

    const/16 v1, 0x168

    const/16 v3, 0x280

    if-nez p2, :cond_2

    const-string p2, "KMMediaInfo_ThumbConv"

    const-string p3, "Make large thumnail at i==0"

    invoke-static {p2, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object p2, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v1, p2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p2

    new-instance p3, Landroid/graphics/Canvas;

    invoke-direct {p3, p2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0, v2, v2, v3, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    iget-object v1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f$1;->f:Landroid/graphics/Paint;

    invoke-virtual {p3, p1, p4, v0, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    iget-object p3, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f$1;->g:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f;

    invoke-static {p3, p2}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f;->b(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    goto :goto_0

    :cond_2
    sub-int/2addr p3, v0

    if-ne p2, p3, :cond_3

    const-string p3, "KMMediaInfo_ThumbConv"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Make large end thumnail at i=="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p3, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object p2, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v1, p2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p2

    new-instance p3, Landroid/graphics/Canvas;

    invoke-direct {p3, p2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0, v2, v2, v3, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    iget-object v1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f$1;->f:Landroid/graphics/Paint;

    invoke-virtual {p3, p1, p4, v0, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    iget-object p3, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f$1;->g:Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f;

    invoke-static {p3, p2}, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f;->c(Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    :cond_3
    :goto_0
    iget-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f$1;->d:Landroid/graphics/Canvas;

    invoke-virtual {p2}, Landroid/graphics/Canvas;->save()I

    iget-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f$1;->d:Landroid/graphics/Canvas;

    const/high16 p3, 0x42a00000    # 80.0f

    const/high16 v0, 0x42340000    # 45.0f

    const/high16 v1, -0x40800000    # -1.0f

    invoke-virtual {p2, v1, v1, p3, v0}, Landroid/graphics/Canvas;->scale(FFFF)V

    iget-object p2, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f$1;->d:Landroid/graphics/Canvas;

    iget-object p3, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f$1;->e:Landroid/graphics/Rect;

    iget-object v0, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f$1;->f:Landroid/graphics/Paint;

    invoke-virtual {p2, p1, p4, p3, v0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    iget-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f$1;->d:Landroid/graphics/Canvas;

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    iget-object p1, p0, Lcom/nexstreaming/kminternal/kinemaster/mediainfo/f$1;->d:Landroid/graphics/Canvas;

    const/high16 p2, 0x43200000    # 160.0f

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3}, Landroid/graphics/Canvas;->translate(FF)V

    return-void
.end method
