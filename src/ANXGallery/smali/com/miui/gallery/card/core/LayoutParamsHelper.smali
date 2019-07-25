.class public Lcom/miui/gallery/card/core/LayoutParamsHelper;
.super Ljava/lang/Object;
.source "LayoutParamsHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;
    }
.end annotation


# instance fields
.field private mItemMaxHeight:I

.field private mItemMinHeight:I

.field private mLayoutSizes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0604a0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v1

    iput v1, p0, Lcom/miui/gallery/card/core/LayoutParamsHelper;->mItemMinHeight:I

    const v1, 0x7f06049f

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/card/core/LayoutParamsHelper;->mItemMaxHeight:I

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/card/core/LayoutParamsHelper;->mLayoutSizes:Ljava/util/List;

    return-void
.end method

.method private getImageSizeGuaranteed(Ljava/util/List;III)Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;",
            ">;III)",
            "Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;"
        }
    .end annotation

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_0

    if-ltz p2, :cond_0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-ge p2, v0, :cond_0

    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    if-nez p1, :cond_1

    new-instance p1, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;

    const/4 p2, 0x0

    invoke-direct {p1, p2, p2}, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;-><init>(II)V

    :cond_1
    iget p2, p1, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;->mWidth:I

    if-lez p2, :cond_2

    iget p2, p1, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;->mHeight:I

    if-gtz p2, :cond_3

    :cond_2
    sub-int/2addr p3, p4

    div-int/lit8 p3, p3, 0x2

    iput p3, p1, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;->mWidth:I

    iget p2, p1, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;->mWidth:I

    iput p2, p1, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;->mHeight:I

    :cond_3
    return-object p1
.end method

.method private getRatio(Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;)F
    .locals 5

    const/high16 v0, 0x3f800000    # 1.0f

    :try_start_0
    iget v1, p1, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;->mWidth:I

    int-to-float v1, v1

    iget p1, p1, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;->mHeight:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    int-to-float p1, p1

    div-float p1, v1, p1

    const/4 v1, 0x0

    :try_start_1
    invoke-static {p1, v1}, Ljava/lang/Float;->compare(FF)I

    move-result v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    if-nez v1, :cond_0

    const/high16 p1, 0x3f800000    # 1.0f

    :cond_0
    return p1

    :catch_0
    move-exception v0

    move-object v4, v0

    move v0, p1

    move-object p1, v4

    goto :goto_0

    :catch_1
    move-exception p1

    :goto_0
    const-string v1, "LayoutParamsHelper"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getRatio error:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v0
.end method


# virtual methods
.method public getLayoutSize(I)Lcom/nostra13/universalimageloader/core/assist/ImageSize;
    .locals 3

    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/card/core/LayoutParamsHelper;->mLayoutSizes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    new-instance v0, Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    iget-object v1, p0, Lcom/miui/gallery/card/core/LayoutParamsHelper;->mLayoutSizes:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;

    iget v1, v1, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;->mWidth:I

    iget-object v2, p0, Lcom/miui/gallery/card/core/LayoutParamsHelper;->mLayoutSizes:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;

    iget p1, p1, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;->mHeight:I

    invoke-direct {v0, v1, p1}, Lcom/nostra13/universalimageloader/core/assist/ImageSize;-><init>(II)V

    return-object v0

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public updateLayoutSizes(Ljava/util/List;II)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;",
            ">;II)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/card/core/LayoutParamsHelper;->mLayoutSizes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_b

    const-string v2, "LayoutParamsHelper"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Row index:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    add-int/lit8 v1, v1, 0x1

    new-instance v2, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;

    invoke-direct {v2}, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;-><init>()V

    new-instance v3, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;

    invoke-direct {v3}, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;-><init>()V

    new-instance v4, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;

    invoke-direct {v4}, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;-><init>()V

    invoke-direct {p0, p1, v0, p2, p3}, Lcom/miui/gallery/card/core/LayoutParamsHelper;->getImageSizeGuaranteed(Ljava/util/List;III)Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;

    move-result-object v5

    iput p2, v2, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;->mWidth:I

    iget v6, v2, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;->mWidth:I

    int-to-float v6, v6

    invoke-direct {p0, v5}, Lcom/miui/gallery/card/core/LayoutParamsHelper;->getRatio(Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;)F

    move-result v7

    div-float/2addr v6, v7

    float-to-int v6, v6

    iput v6, v2, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;->mHeight:I

    iget v6, v2, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;->mHeight:I

    int-to-float v6, v6

    iget v7, p0, Lcom/miui/gallery/card/core/LayoutParamsHelper;->mItemMinHeight:I

    int-to-float v7, v7

    const/high16 v8, 0x3f800000    # 1.0f

    mul-float v7, v7, v8

    cmpg-float v6, v6, v7

    if-gez v6, :cond_1

    iget v3, p0, Lcom/miui/gallery/card/core/LayoutParamsHelper;->mItemMinHeight:I

    int-to-float v3, v3

    mul-float v3, v3, v8

    float-to-int v3, v3

    iput v3, v2, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;->mHeight:I

    iget-object v3, p0, Lcom/miui/gallery/card/core/LayoutParamsHelper;->mLayoutSizes:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string v3, "LayoutParamsHelper"

    invoke-static {v3, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_3

    :cond_1
    add-int/lit8 v0, v0, 0x1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v6

    if-ne v0, v6, :cond_3

    iget p1, v2, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;->mHeight:I

    iget p2, p0, Lcom/miui/gallery/card/core/LayoutParamsHelper;->mItemMaxHeight:I

    if-le p1, p2, :cond_2

    iget p1, p0, Lcom/miui/gallery/card/core/LayoutParamsHelper;->mItemMaxHeight:I

    iput p1, v2, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;->mHeight:I

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/card/core/LayoutParamsHelper;->mLayoutSizes:Ljava/util/List;

    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string p1, "LayoutParamsHelper"

    invoke-static {p1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_4

    :cond_3
    invoke-direct {p0, p1, v0, p2, p3}, Lcom/miui/gallery/card/core/LayoutParamsHelper;->getImageSizeGuaranteed(Ljava/util/List;III)Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;

    move-result-object v6

    invoke-direct {p0, v5}, Lcom/miui/gallery/card/core/LayoutParamsHelper;->getRatio(Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;)F

    move-result v5

    invoke-direct {p0, v6}, Lcom/miui/gallery/card/core/LayoutParamsHelper;->getRatio(Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;)F

    move-result v6

    sub-int v7, p2, p3

    int-to-float v7, v7

    add-float v8, v5, v6

    div-float/2addr v7, v8

    float-to-int v7, v7

    int-to-float v9, v7

    iget v10, p0, Lcom/miui/gallery/card/core/LayoutParamsHelper;->mItemMinHeight:I

    int-to-float v10, v10

    const v11, 0x3f8ccccd    # 1.1f

    mul-float v10, v10, v11

    cmpg-float v10, v9, v10

    if-gez v10, :cond_5

    iget v3, v2, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;->mHeight:I

    iget v4, p0, Lcom/miui/gallery/card/core/LayoutParamsHelper;->mItemMaxHeight:I

    if-le v3, v4, :cond_4

    iget v3, p0, Lcom/miui/gallery/card/core/LayoutParamsHelper;->mItemMaxHeight:I

    goto :goto_1

    :cond_4
    iget v3, v2, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;->mHeight:I

    :goto_1
    iput v3, v2, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;->mHeight:I

    iget-object v3, p0, Lcom/miui/gallery/card/core/LayoutParamsHelper;->mLayoutSizes:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, -0x1

    const-string v3, "LayoutParamsHelper"

    invoke-static {v3, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_3

    :cond_5
    iput v7, v2, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;->mHeight:I

    mul-float v10, v9, v5

    float-to-int v10, v10

    iput v10, v2, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;->mWidth:I

    iput v7, v3, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;->mHeight:I

    mul-float v9, v9, v6

    float-to-int v7, v9

    iput v7, v3, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;->mWidth:I

    add-int/lit8 v0, v0, 0x1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v7

    if-ne v0, v7, :cond_7

    iget p1, v2, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;->mHeight:I

    iget p2, p0, Lcom/miui/gallery/card/core/LayoutParamsHelper;->mItemMaxHeight:I

    if-le p1, p2, :cond_6

    iget p1, p0, Lcom/miui/gallery/card/core/LayoutParamsHelper;->mItemMaxHeight:I

    iput p1, v2, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;->mHeight:I

    iget p1, p0, Lcom/miui/gallery/card/core/LayoutParamsHelper;->mItemMaxHeight:I

    iput p1, v3, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;->mHeight:I

    :cond_6
    iget-object p1, p0, Lcom/miui/gallery/card/core/LayoutParamsHelper;->mLayoutSizes:Ljava/util/List;

    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object p1, p0, Lcom/miui/gallery/card/core/LayoutParamsHelper;->mLayoutSizes:Ljava/util/List;

    invoke-interface {p1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string p1, "LayoutParamsHelper"

    invoke-static {p1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/Object;)V

    const-string p1, "LayoutParamsHelper"

    invoke-static {p1, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_4

    :cond_7
    invoke-direct {p0, p1, v0, p2, p3}, Lcom/miui/gallery/card/core/LayoutParamsHelper;->getImageSizeGuaranteed(Ljava/util/List;III)Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/miui/gallery/card/core/LayoutParamsHelper;->getRatio(Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;)F

    move-result v7

    mul-int/lit8 v9, p3, 0x2

    sub-int v9, p2, v9

    int-to-float v9, v9

    add-float/2addr v8, v7

    div-float/2addr v9, v8

    float-to-int v8, v9

    int-to-float v9, v8

    iget v10, p0, Lcom/miui/gallery/card/core/LayoutParamsHelper;->mItemMinHeight:I

    int-to-float v10, v10

    const v11, 0x3f99999a    # 1.2f

    mul-float v10, v10, v11

    cmpg-float v10, v9, v10

    if-gez v10, :cond_9

    iget v4, v2, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;->mHeight:I

    iget v5, p0, Lcom/miui/gallery/card/core/LayoutParamsHelper;->mItemMaxHeight:I

    if-le v4, v5, :cond_8

    iget v4, p0, Lcom/miui/gallery/card/core/LayoutParamsHelper;->mItemMaxHeight:I

    iput v4, v2, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;->mHeight:I

    iget v4, p0, Lcom/miui/gallery/card/core/LayoutParamsHelper;->mItemMaxHeight:I

    iput v4, v3, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;->mHeight:I

    :cond_8
    iget-object v4, p0, Lcom/miui/gallery/card/core/LayoutParamsHelper;->mLayoutSizes:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v4, p0, Lcom/miui/gallery/card/core/LayoutParamsHelper;->mLayoutSizes:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, -0x1

    const-string v4, "LayoutParamsHelper"

    invoke-static {v4, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v2, "LayoutParamsHelper"

    invoke-static {v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_3

    :cond_9
    iget v10, p0, Lcom/miui/gallery/card/core/LayoutParamsHelper;->mItemMaxHeight:I

    if-le v8, v10, :cond_a

    iget v8, p0, Lcom/miui/gallery/card/core/LayoutParamsHelper;->mItemMaxHeight:I

    iput v8, v2, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;->mHeight:I

    iget v8, p0, Lcom/miui/gallery/card/core/LayoutParamsHelper;->mItemMaxHeight:I

    iput v8, v3, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;->mHeight:I

    iget v8, p0, Lcom/miui/gallery/card/core/LayoutParamsHelper;->mItemMaxHeight:I

    iput v8, v4, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;->mHeight:I

    goto :goto_2

    :cond_a
    iput v8, v2, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;->mHeight:I

    iput v8, v3, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;->mHeight:I

    iput v8, v4, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;->mHeight:I

    :goto_2
    mul-float v5, v5, v9

    float-to-int v5, v5

    iput v5, v2, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;->mWidth:I

    mul-float v6, v6, v9

    float-to-int v5, v6

    iput v5, v3, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;->mWidth:I

    mul-float v9, v9, v7

    float-to-int v5, v9

    iput v5, v4, Lcom/miui/gallery/card/core/LayoutParamsHelper$Size;->mWidth:I

    iget-object v5, p0, Lcom/miui/gallery/card/core/LayoutParamsHelper;->mLayoutSizes:Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v5, p0, Lcom/miui/gallery/card/core/LayoutParamsHelper;->mLayoutSizes:Ljava/util/List;

    invoke-interface {v5, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v5, p0, Lcom/miui/gallery/card/core/LayoutParamsHelper;->mLayoutSizes:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string v5, "LayoutParamsHelper"

    invoke-static {v5, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v2, "LayoutParamsHelper"

    invoke-static {v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v2, "LayoutParamsHelper"

    invoke-static {v2, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/Object;)V

    :goto_3
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    :cond_b
    :goto_4
    return-void
.end method
