.class public Lcom/miui/gallery/editor/photo/app/XmpExtraManager;
.super Ljava/lang/Object;
.source "XmpExtraManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;
    }
.end annotation


# instance fields
.field private mOriginHeight:I

.field private mOriginRotationDegree:I

.field private mOriginWidth:I

.field private mSubImage:Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private calculateIntersectPercent(Landroid/graphics/RectF;Landroid/graphics/RectF;)F
    .locals 1

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0, p1}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    invoke-virtual {v0, p2}, Landroid/graphics/RectF;->intersect(Landroid/graphics/RectF;)Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result p2

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    mul-float p2, p2, v0

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v0

    div-float/2addr p2, v0

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result p1

    div-float/2addr p2, p1

    return p2

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private extraSubImageData(Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 6

    new-instance v0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;-><init>(Lcom/miui/gallery/editor/photo/app/XmpExtraManager$1;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->mSubImage:Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    invoke-interface {p1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, -0x1

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v5

    sparse-switch v5, :sswitch_data_0

    goto :goto_1

    :sswitch_0
    const-string v5, "paddingy"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x3

    goto :goto_2

    :sswitch_1
    const-string v5, "paddingx"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x2

    goto :goto_2

    :sswitch_2
    const-string v5, "width"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x4

    goto :goto_2

    :sswitch_3
    const-string v5, "offset"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x0

    goto :goto_2

    :sswitch_4
    const-string v5, "length"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x1

    goto :goto_2

    :sswitch_5
    const-string v5, "height"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x5

    goto :goto_2

    :cond_0
    :goto_1
    const/4 v3, -0x1

    :goto_2
    packed-switch v3, :pswitch_data_0

    goto :goto_3

    :pswitch_0
    iget-object v3, p0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->mSubImage:Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;

    invoke-interface {p1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    iput v4, v3, Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;->height:I

    goto :goto_3

    :pswitch_1
    iget-object v3, p0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->mSubImage:Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;

    invoke-interface {p1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    iput v4, v3, Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;->width:I

    goto :goto_3

    :pswitch_2
    iget-object v3, p0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->mSubImage:Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;

    invoke-interface {p1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    iput v4, v3, Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;->paddingY:I

    goto :goto_3

    :pswitch_3
    iget-object v3, p0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->mSubImage:Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;

    invoke-interface {p1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    iput v4, v3, Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;->paddingX:I

    goto :goto_3

    :pswitch_4
    iget-object v3, p0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->mSubImage:Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;

    invoke-interface {p1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    iput v4, v3, Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;->length:I

    goto :goto_3

    :pswitch_5
    iget-object v3, p0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->mSubImage:Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;

    invoke-interface {p1, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    iput v4, v3, Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;->offset:I

    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    :cond_1
    return-void

    :sswitch_data_0
    .sparse-switch
        -0x48c76ed9 -> :sswitch_5
        -0x41f1c51a -> :sswitch_4
        -0x3cc89b6d -> :sswitch_3
        0x6be2dc6 -> :sswitch_2
        0x2e174687 -> :sswitch_1
        0x2e174688 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private extraXmlMetaData(Ljava/lang/String;)V
    .locals 4

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v0

    :try_start_0
    new-instance v1, Ljava/io/StringReader;

    invoke-direct {v1, p1}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/Reader;)V

    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result p1

    :goto_0
    const/4 v1, 0x1

    if-eq p1, v1, :cond_6

    const/4 v1, 0x2

    if-eq p1, v1, :cond_1

    goto :goto_2

    :cond_1
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_2

    :cond_2
    const/4 v1, -0x1

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v2

    const v3, -0x7b6a2ce5

    if-eq v2, v3, :cond_3

    goto :goto_1

    :cond_3
    const-string v2, "subimage"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    const/4 v1, 0x0

    :cond_4
    :goto_1
    if-eqz v1, :cond_5

    goto :goto_2

    :cond_5
    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->extraSubImageData(Lorg/xmlpull/v1/XmlPullParser;)V

    :goto_2
    invoke-interface {v0}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result p1
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_3

    :catch_1
    move-exception p1

    invoke-virtual {p1}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    :cond_6
    :goto_3
    return-void
.end method

.method private extraXmpMetaData(Lcom/adobe/xmp/XMPMeta;)V
    .locals 2

    :try_start_0
    const-string v0, "http://ns.xiaomi.com/photos/1.0/camera/"

    const-string v1, "XMPMeta"

    invoke-interface {p1, v0, v1}, Lcom/adobe/xmp/XMPMeta;->getPropertyString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->extraXmlMetaData(Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/adobe/xmp/XMPException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Lcom/adobe/xmp/XMPException;->printStackTrace()V

    :goto_0
    return-void
.end method


# virtual methods
.method public decodeXmpData(Ljava/io/InputStream;III)V
    .locals 1

    sget-boolean v0, Lcom/miui/os/Rom;->IS_STABLE:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iput p2, p0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->mOriginWidth:I

    iput p3, p0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->mOriginHeight:I

    iput p4, p0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->mOriginRotationDegree:I

    invoke-static {p1}, Lcom/miui/gallery/util/XmpHelper;->extractXMPMeta(Ljava/io/InputStream;)Lcom/adobe/xmp/XMPMeta;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->extraXmpMetaData(Lcom/adobe/xmp/XMPMeta;)V

    :cond_1
    return-void
.end method

.method public getWatermarkRect(II)Landroid/graphics/RectF;
    .locals 8

    new-instance v0, Landroid/graphics/RectF;

    iget v1, p0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->mOriginWidth:I

    int-to-float v1, v1

    iget v2, p0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->mOriginHeight:I

    int-to-float v2, v2

    const/4 v3, 0x0

    invoke-direct {v0, v3, v3, v1, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    new-instance v1, Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->mSubImage:Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;

    iget v2, v2, Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;->paddingX:I

    int-to-float v2, v2

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->mSubImage:Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;

    iget v4, v4, Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;->paddingY:I

    int-to-float v4, v4

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->mSubImage:Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;

    iget v5, v5, Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;->paddingX:I

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->mSubImage:Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;

    iget v6, v6, Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;->width:I

    add-int/2addr v5, v6

    int-to-float v5, v5

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->mSubImage:Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;

    iget v6, v6, Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;->paddingY:I

    iget-object v7, p0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->mSubImage:Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;

    iget v7, v7, Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;->height:I

    add-int/2addr v6, v7

    int-to-float v6, v6

    invoke-direct {v1, v2, v4, v5, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    iget v4, p0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->mOriginRotationDegree:I

    int-to-float v4, v4

    invoke-virtual {v2, v4}, Landroid/graphics/Matrix;->postRotate(F)Z

    invoke-virtual {v2, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    invoke-virtual {v2, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    new-instance v4, Landroid/graphics/RectF;

    int-to-float p1, p1

    int-to-float p2, p2

    invoke-direct {v4, v3, v3, p1, p2}, Landroid/graphics/RectF;-><init>(FFFF)V

    sget-object p1, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v2, v0, v4, p1}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    invoke-virtual {v2, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    const-string p1, "XmpExtraManager"

    const-string p2, "watermarkRect :%s"

    invoke-virtual {v1}, Landroid/graphics/RectF;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v1
.end method

.method public isRemoveWatermarkEnable()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->mSubImage:Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isRemoveWatermarkShow(Landroid/graphics/Bitmap;Ljava/util/List;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Bitmap;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/RenderData;",
            ">;)Z"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->isRemoveWatermarkEnable()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    invoke-virtual {p0, v0, v2}, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->getWatermarkRect(II)Landroid/graphics/RectF;

    move-result-object v0

    new-instance v2, Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p1

    int-to-float p1, p1

    const/4 v4, 0x0

    invoke-direct {v2, v4, v4, v3, p1}, Landroid/graphics/RectF;-><init>(FFFF)V

    const/high16 p1, 0x3f800000    # 1.0f

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_1
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/editor/photo/core/RenderData;

    instance-of v4, v3, Lcom/miui/gallery/editor/photo/core/common/model/IPositionChangeData;

    if-eqz v4, :cond_1

    check-cast v3, Lcom/miui/gallery/editor/photo/core/common/model/IPositionChangeData;

    invoke-interface {v3, v2, v0}, Lcom/miui/gallery/editor/photo/core/common/model/IPositionChangeData;->refreshTargetAreaPosition(Landroid/graphics/RectF;Landroid/graphics/RectF;)V

    invoke-direct {p0, v0, v2}, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->calculateIntersectPercent(Landroid/graphics/RectF;Landroid/graphics/RectF;)F

    move-result p1

    const-string v3, "XmpExtraManager"

    const-string v4, "intersectPercent:%f"

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :cond_2
    const p2, 0x3ecccccd    # 0.4f

    cmpl-float p1, p1, p2

    if-lez p1, :cond_3

    const/4 v1, 0x1

    :cond_3
    return v1
.end method

.method public sweepImage(Landroid/graphics/Bitmap;Ljava/io/InputStream;)V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->mSubImage:Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->mSubImage:Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;->renderBitmap:Landroid/graphics/Bitmap;

    if-nez v0, :cond_1

    :try_start_0
    invoke-virtual {p2}, Ljava/io/InputStream;->available()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->mSubImage:Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;

    iget v1, v1, Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;->offset:I

    sub-int/2addr v0, v1

    int-to-long v0, v0

    invoke-virtual {p2, v0, v1}, Ljava/io/InputStream;->skip(J)J

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->mSubImage:Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;

    invoke-static {p2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;->renderBitmap:Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception v0

    :try_start_1
    const-string v1, "XmpExtraManager"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    const-string v0, "XmpExtraManager"

    invoke-static {v0, p2}, Lcom/miui/gallery/editor/photo/utils/IoUtils;->close(Ljava/lang/String;Ljava/io/Closeable;)V

    goto :goto_2

    :goto_1
    const-string v0, "XmpExtraManager"

    invoke-static {v0, p2}, Lcom/miui/gallery/editor/photo/utils/IoUtils;->close(Ljava/lang/String;Ljava/io/Closeable;)V

    throw p1

    :cond_1
    const-string v0, "XmpExtraManager"

    invoke-static {v0, p2}, Lcom/miui/gallery/editor/photo/utils/IoUtils;->close(Ljava/lang/String;Ljava/io/Closeable;)V

    :goto_2
    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->mSubImage:Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;

    iget-object p2, p2, Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;->renderBitmap:Landroid/graphics/Bitmap;

    if-nez p2, :cond_2

    return-void

    :cond_2
    new-instance p2, Landroid/graphics/RectF;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->mSubImage:Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;->renderBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    int-to-float v0, v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->mSubImage:Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;

    iget-object v1, v1, Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;->renderBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    int-to-float v1, v1

    const/4 v2, 0x0

    invoke-direct {p2, v2, v2, v0, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    new-instance v0, Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->mSubImage:Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;

    iget v1, v1, Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;->width:I

    int-to-float v1, v1

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->mSubImage:Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;

    iget v3, v3, Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;->height:I

    int-to-float v3, v3

    invoke-direct {v0, v2, v2, v1, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    new-instance v1, Landroid/graphics/RectF;

    iget v3, p0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->mOriginWidth:I

    int-to-float v3, v3

    iget v4, p0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->mOriginHeight:I

    int-to-float v4, v4

    invoke-direct {v1, v2, v2, v3, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    new-instance v3, Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    int-to-float v5, v5

    invoke-direct {v3, v2, v2, v4, v5}, Landroid/graphics/RectF;-><init>(FFFF)V

    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    iget v4, p0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->mOriginRotationDegree:I

    int-to-float v4, v4

    invoke-virtual {v2, v4}, Landroid/graphics/Matrix;->postRotate(F)Z

    invoke-virtual {v2, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    new-instance v4, Landroid/graphics/Matrix;

    invoke-direct {v4}, Landroid/graphics/Matrix;-><init>()V

    sget-object v5, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v4, p2, v0, v5}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    new-instance p2, Landroid/graphics/Matrix;

    invoke-direct {p2}, Landroid/graphics/Matrix;-><init>()V

    sget-object v0, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {p2, v1, v3, v0}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    invoke-virtual {p2, v2}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->mSubImage:Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;

    iget v0, v0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;->paddingX:I

    int-to-float v0, v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->mSubImage:Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;

    iget v1, v1, Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;->paddingY:I

    int-to-float v1, v1

    invoke-virtual {p2, v0, v1}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    invoke-virtual {p2, v4}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, p1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/XmpExtraManager;->mSubImage:Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;

    iget-object p1, p1, Lcom/miui/gallery/editor/photo/app/XmpExtraManager$SubImage;->renderBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1, p1, p2, v0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    return-void
.end method
