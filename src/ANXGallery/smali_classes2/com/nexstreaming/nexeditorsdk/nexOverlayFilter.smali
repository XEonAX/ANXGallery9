.class public Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;
.super Ljava/lang/Object;
.source "nexOverlayFilter.java"


# static fields
.field private static final kMaxStringTrackCount:I = 0x8


# instance fields
.field private cacheEncodeOption:Ljava/lang/String;

.field private cachedOverlayAsset:Lcom/nexstreaming/app/common/nexasset/overlay/OverlayAsset;

.field private height:I

.field private id:Ljava/lang/String;

.field private isRelativeHeight:Z

.field private isRelativeWidth:Z

.field private mTitles:[Ljava/lang/String;

.field private option:Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;

.field private relativeHeight:F

.field private relativeWidth:F

.field private updateBound:Z

.field private updateOption:Z

.field private width:I


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->cacheEncodeOption:Ljava/lang/String;

    const/16 v0, 0x2bc

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->width:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->height:I

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->relativeWidth:F

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->relativeHeight:F

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->isRelativeWidth:Z

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->isRelativeHeight:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->mTitles:[Ljava/lang/String;

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->id:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method getBound(Landroid/graphics/Rect;)V
    .locals 1

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->getWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    rsub-int/lit8 v0, v0, 0x0

    iput v0, p1, Landroid/graphics/Rect;->left:I

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->getHeight()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    rsub-int/lit8 v0, v0, 0x0

    iput v0, p1, Landroid/graphics/Rect;->top:I

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->getWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    add-int/lit8 v0, v0, 0x0

    iput v0, p1, Landroid/graphics/Rect;->right:I

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->getHeight()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    add-int/lit8 v0, v0, 0x0

    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    return-void
.end method

.method public getEffectOption()Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;
    .locals 3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->option:Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->a()Lcom/nexstreaming/kminternal/kinemaster/config/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->b()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEffectLibrary;->getEffectLibrary(Landroid/content/Context;)Lcom/nexstreaming/nexeditorsdk/nexEffectLibrary;

    move-result-object v0

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->a()Lcom/nexstreaming/kminternal/kinemaster/config/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->b()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->id:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/nexstreaming/nexeditorsdk/nexEffectLibrary;->getEffectOptions(Landroid/content/Context;Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->option:Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->option:Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->setEffectType(I)V

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->updateOption:Z

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->option:Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;

    return-object v0
.end method

.method getEncodedEffectOptions()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->option:Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;

    if-nez v0, :cond_0

    const-string v0, ""

    return-object v0

    :cond_0
    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->updateOption:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->updateOption:Z

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->option:Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->clearUpadted()V

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->option:Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexEffect;->getTitleOptions(Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->cacheEncodeOption:Ljava/lang/String;

    :cond_1
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->cacheEncodeOption:Ljava/lang/String;

    return-object v0
.end method

.method public getHeight()I
    .locals 2

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->isRelativeWidth:Z

    if-nez v0, :cond_0

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->height:I

    return v0

    :cond_0
    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectProfile()Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;->getHeight()I

    move-result v0

    int-to-float v0, v0

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->relativeHeight:F

    mul-float v0, v0, v1

    float-to-int v0, v0

    return v0
.end method

.method public getIcon()Landroid/graphics/Bitmap;
    .locals 3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->id:Ljava/lang/String;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a()Lcom/nexstreaming/app/common/nexasset/assetpackage/c;

    move-result-object v0

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->c(Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/assetpackage/f;

    move-result-object v0

    if-eqz v0, :cond_0

    :try_start_0
    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->a()Lcom/nexstreaming/kminternal/kinemaster/config/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->b()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v1, v0, v2, v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/e;->a(Landroid/content/Context;Lcom/nexstreaming/app/common/nexasset/assetpackage/f;II)Landroid/graphics/Bitmap;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getName(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    invoke-static {}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a()Lcom/nexstreaming/app/common/nexasset/assetpackage/c;

    move-result-object p1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->id:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->c(Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/assetpackage/f;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-interface {p1}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getLabel()Ljava/util/Map;

    move-result-object p1

    const-string v0, "en"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method getOverlayAssetFilter()Lcom/nexstreaming/app/common/nexasset/overlay/OverlayAsset;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->cachedOverlayAsset:Lcom/nexstreaming/app/common/nexasset/overlay/OverlayAsset;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->id:Ljava/lang/String;

    invoke-static {v0}, Lcom/nexstreaming/app/common/nexasset/overlay/OverlayAssetFactory;->forItem(Ljava/lang/String;)Lcom/nexstreaming/app/common/nexasset/overlay/OverlayAsset;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->cachedOverlayAsset:Lcom/nexstreaming/app/common/nexasset/overlay/OverlayAsset;

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->cachedOverlayAsset:Lcom/nexstreaming/app/common/nexasset/overlay/OverlayAsset;

    return-object v0
.end method

.method public getRelativeHeight()F
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->relativeHeight:F

    return v0
.end method

.method public getRelativeWidth()F
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->relativeWidth:F

    return v0
.end method

.method public getTitle(I)Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->mTitles:[Ljava/lang/String;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    :cond_0
    const/16 v0, 0x8

    if-ge p1, v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->mTitles:[Ljava/lang/String;

    aget-object p1, v0, p1

    return-object p1

    :cond_1
    return-object v1
.end method

.method getTitles()[Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->mTitles:[Ljava/lang/String;

    return-object v0
.end method

.method public getWidth()I
    .locals 2

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->isRelativeWidth:Z

    if-nez v0, :cond_0

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->width:I

    return v0

    :cond_0
    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectProfile()Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexAspectProfile;->getWidth()I

    move-result v0

    int-to-float v0, v0

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->relativeWidth:F

    mul-float v0, v0, v1

    float-to-int v0, v0

    return v0
.end method

.method isUpdated()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->updateBound:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->option:Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;

    if-nez v0, :cond_1

    const/4 v0, 0x0

    return v0

    :cond_1
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->option:Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexEffectOptions;->isUpdated()Z

    move-result v0

    return v0
.end method

.method public setHeight(I)V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->isRelativeHeight:Z

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->height:I

    if-eq v0, p1, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->updateBound:Z

    :cond_0
    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->height:I

    return-void
.end method

.method public setRelativeHeight(F)V
    .locals 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->isRelativeHeight:Z

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->relativeHeight:F

    cmpl-float v1, v1, p1

    if-eqz v1, :cond_0

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->updateBound:Z

    :cond_0
    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->relativeHeight:F

    return-void
.end method

.method public setRelativeWidth(F)V
    .locals 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->isRelativeWidth:Z

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->relativeWidth:F

    cmpl-float v1, v1, p1

    if-eqz v1, :cond_0

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->updateBound:Z

    :cond_0
    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->relativeWidth:F

    return-void
.end method

.method public setTitle(ILjava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->mTitles:[Ljava/lang/String;

    const/16 v1, 0x8

    if-nez v0, :cond_0

    new-array v0, v1, [Ljava/lang/String;

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->mTitles:[Ljava/lang/String;

    :cond_0
    if-ge p1, v1, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->mTitles:[Ljava/lang/String;

    aput-object p2, v0, p1

    :cond_1
    return-void
.end method

.method public setWidth(I)V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->isRelativeWidth:Z

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->width:I

    if-eq v0, p1, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->updateBound:Z

    :cond_0
    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayFilter;->width:I

    return-void
.end method
