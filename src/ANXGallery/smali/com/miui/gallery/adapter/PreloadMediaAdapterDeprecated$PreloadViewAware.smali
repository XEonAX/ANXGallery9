.class Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated$PreloadViewAware;
.super Lcom/nostra13/universalimageloader/core/imageaware/NonViewAware;
.source "PreloadMediaAdapterDeprecated.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PreloadViewAware"
.end annotation


# instance fields
.field protected position:I


# direct methods
.method public constructor <init>(Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/nostra13/universalimageloader/core/imageaware/NonViewAware;-><init>(Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;)V

    return-void
.end method


# virtual methods
.method public setImageSize(Lcom/nostra13/universalimageloader/core/assist/ImageSize;)Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated$PreloadViewAware;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated$PreloadViewAware;->imageSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    return-object p0
.end method

.method public setImageUri(Ljava/lang/String;)Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated$PreloadViewAware;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated$PreloadViewAware;->imageUri:Ljava/lang/String;

    return-object p0
.end method

.method public setPosition(I)Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated$PreloadViewAware;
    .locals 0

    iput p1, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated$PreloadViewAware;->position:I

    return-object p0
.end method

.method public setScaleType(Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;)Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated$PreloadViewAware;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated$PreloadViewAware;->scaleType:Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;

    return-object p0
.end method
