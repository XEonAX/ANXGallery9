.class public Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntityBitmap;
.super Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity;
.source "MosaicEntityBitmap.java"


# instance fields
.field private mResourcePath:Ljava/lang/String;

.field private mTileMode:Landroid/graphics/Shader$TileMode;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Shader$TileMode;)V
    .locals 1

    sget-object v0, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;->BITMAP:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;)V

    iput-object p3, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntityBitmap;->mResourcePath:Ljava/lang/String;

    iput-object p4, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntityBitmap;->mTileMode:Landroid/graphics/Shader$TileMode;

    return-void
.end method


# virtual methods
.method public generateShader(Landroid/graphics/Bitmap;FLandroid/graphics/Matrix;)Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicShaderHolder;
    .locals 2

    const/16 p1, 0x9

    new-array p1, p1, [F

    invoke-virtual {p3, p1}, Landroid/graphics/Matrix;->getValues([F)V

    const/4 p2, 0x0

    aget p1, p1, p2

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object p2

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntityBitmap;->mResourcePath:Ljava/lang/String;

    invoke-virtual {p2, p3}, Lcom/nostra13/universalimageloader/core/ImageLoader;->loadImageSync(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object p2

    new-instance p3, Landroid/graphics/BitmapShader;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntityBitmap;->mTileMode:Landroid/graphics/Shader$TileMode;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntityBitmap;->mTileMode:Landroid/graphics/Shader$TileMode;

    invoke-direct {p3, p2, v0, v1}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    new-instance p2, Landroid/graphics/Matrix;

    invoke-direct {p2}, Landroid/graphics/Matrix;-><init>()V

    const v0, 0x3f4ccccd    # 0.8f

    div-float/2addr v0, p1

    invoke-virtual {p2, v0, v0}, Landroid/graphics/Matrix;->postScale(FF)Z

    invoke-virtual {p3, p2}, Landroid/graphics/BitmapShader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    new-instance p1, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicShaderHolder;

    sget-object p2, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;->BITMAP:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;

    invoke-direct {p1, p3, p2}, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicShaderHolder;-><init>(Landroid/graphics/BitmapShader;Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;)V

    return-object p1
.end method
