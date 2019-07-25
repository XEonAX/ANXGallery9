.class public final enum Lcom/edmodo/cropper/cropwindow/edge/Edge;
.super Ljava/lang/Enum;
.source "Edge.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/edmodo/cropper/cropwindow/edge/Edge;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/edmodo/cropper/cropwindow/edge/Edge;

.field public static final enum BOTTOM:Lcom/edmodo/cropper/cropwindow/edge/Edge;

.field public static final enum LEFT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

.field public static final enum RIGHT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

.field public static final enum TOP:Lcom/edmodo/cropper/cropwindow/edge/Edge;


# instance fields
.field private mCoordinate:F


# direct methods
.method static constructor <clinit>()V
    .locals 6

    new-instance v0, Lcom/edmodo/cropper/cropwindow/edge/Edge;

    const-string v1, "LEFT"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/edmodo/cropper/cropwindow/edge/Edge;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    new-instance v0, Lcom/edmodo/cropper/cropwindow/edge/Edge;

    const-string v1, "TOP"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3}, Lcom/edmodo/cropper/cropwindow/edge/Edge;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    new-instance v0, Lcom/edmodo/cropper/cropwindow/edge/Edge;

    const-string v1, "RIGHT"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lcom/edmodo/cropper/cropwindow/edge/Edge;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    new-instance v0, Lcom/edmodo/cropper/cropwindow/edge/Edge;

    const-string v1, "BOTTOM"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v5}, Lcom/edmodo/cropper/cropwindow/edge/Edge;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    const/4 v0, 0x4

    new-array v0, v0, [Lcom/edmodo/cropper/cropwindow/edge/Edge;

    sget-object v1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    aput-object v1, v0, v2

    sget-object v1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    aput-object v1, v0, v3

    sget-object v1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    aput-object v1, v0, v4

    sget-object v1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    aput-object v1, v0, v5

    sput-object v0, Lcom/edmodo/cropper/cropwindow/edge/Edge;->$VALUES:[Lcom/edmodo/cropper/cropwindow/edge/Edge;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method private static adjustBottom(FLandroid/graphics/RectF;FF)F
    .locals 3

    iget v0, p1, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v0, p0

    cmpg-float p2, v0, p2

    if-gez p2, :cond_0

    iget p0, p1, Landroid/graphics/RectF;->bottom:F

    goto :goto_1

    :cond_0
    sget-object p2, Lcom/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p2}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result p2

    const/high16 v0, 0x42200000    # 40.0f

    add-float/2addr p2, v0

    cmpg-float p2, p0, p2

    const/high16 v1, -0x800000    # Float.NEGATIVE_INFINITY

    if-gtz p2, :cond_1

    sget-object p2, Lcom/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p2}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result p2

    add-float/2addr p2, v0

    goto :goto_0

    :cond_1
    const/high16 p2, -0x800000    # Float.NEGATIVE_INFINITY

    :goto_0
    sget-object v2, Lcom/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v2}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v2

    sub-float v2, p0, v2

    mul-float v2, v2, p3

    cmpg-float v2, v2, v0

    if-gtz v2, :cond_2

    sget-object v1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v1

    div-float/2addr v0, p3

    add-float/2addr v1, v0

    :cond_2
    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    invoke-static {v1, p2}, Ljava/lang/Math;->max(FF)F

    move-result p2

    invoke-static {p0, p2}, Ljava/lang/Math;->max(FF)F

    move-result p0

    invoke-static {p1, p0}, Ljava/lang/Math;->min(FF)F

    move-result p0

    :goto_1
    return p0
.end method

.method private static adjustLeft(FLandroid/graphics/RectF;FF)F
    .locals 3

    iget v0, p1, Landroid/graphics/RectF;->left:F

    sub-float v0, p0, v0

    cmpg-float p2, v0, p2

    if-gez p2, :cond_0

    iget p0, p1, Landroid/graphics/RectF;->left:F

    goto :goto_1

    :cond_0
    sget-object p2, Lcom/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p2}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result p2

    const/high16 v0, 0x42200000    # 40.0f

    sub-float/2addr p2, v0

    cmpl-float p2, p0, p2

    const/high16 v1, 0x7f800000    # Float.POSITIVE_INFINITY

    if-ltz p2, :cond_1

    sget-object p2, Lcom/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p2}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result p2

    sub-float/2addr p2, v0

    goto :goto_0

    :cond_1
    const/high16 p2, 0x7f800000    # Float.POSITIVE_INFINITY

    :goto_0
    sget-object v2, Lcom/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v2}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v2

    sub-float/2addr v2, p0

    div-float/2addr v2, p3

    cmpg-float v2, v2, v0

    if-gtz v2, :cond_2

    sget-object v1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v1

    mul-float p3, p3, v0

    sub-float/2addr v1, p3

    :cond_2
    iget p1, p1, Landroid/graphics/RectF;->left:F

    invoke-static {p2, v1}, Ljava/lang/Math;->min(FF)F

    move-result p2

    invoke-static {p0, p2}, Ljava/lang/Math;->min(FF)F

    move-result p0

    invoke-static {p1, p0}, Ljava/lang/Math;->max(FF)F

    move-result p0

    :goto_1
    return p0
.end method

.method private static adjustRight(FLandroid/graphics/RectF;FF)F
    .locals 3

    iget v0, p1, Landroid/graphics/RectF;->right:F

    sub-float/2addr v0, p0

    cmpg-float p2, v0, p2

    if-gez p2, :cond_0

    iget p0, p1, Landroid/graphics/RectF;->right:F

    goto :goto_1

    :cond_0
    sget-object p2, Lcom/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p2}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result p2

    const/high16 v0, 0x42200000    # 40.0f

    add-float/2addr p2, v0

    cmpg-float p2, p0, p2

    const/high16 v1, -0x800000    # Float.NEGATIVE_INFINITY

    if-gtz p2, :cond_1

    sget-object p2, Lcom/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p2}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result p2

    add-float/2addr p2, v0

    goto :goto_0

    :cond_1
    const/high16 p2, -0x800000    # Float.NEGATIVE_INFINITY

    :goto_0
    sget-object v2, Lcom/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v2}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v2

    sub-float v2, p0, v2

    div-float/2addr v2, p3

    cmpg-float v2, v2, v0

    if-gtz v2, :cond_2

    sget-object v1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v1

    mul-float p3, p3, v0

    add-float/2addr v1, p3

    :cond_2
    iget p1, p1, Landroid/graphics/RectF;->right:F

    invoke-static {p2, v1}, Ljava/lang/Math;->max(FF)F

    move-result p2

    invoke-static {p0, p2}, Ljava/lang/Math;->max(FF)F

    move-result p0

    invoke-static {p1, p0}, Ljava/lang/Math;->min(FF)F

    move-result p0

    :goto_1
    return p0
.end method

.method private static adjustTop(FLandroid/graphics/RectF;FF)F
    .locals 3

    iget v0, p1, Landroid/graphics/RectF;->top:F

    sub-float v0, p0, v0

    cmpg-float p2, v0, p2

    if-gez p2, :cond_0

    iget p0, p1, Landroid/graphics/RectF;->top:F

    goto :goto_1

    :cond_0
    sget-object p2, Lcom/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p2}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result p2

    const/high16 v0, 0x42200000    # 40.0f

    sub-float/2addr p2, v0

    cmpl-float p2, p0, p2

    const/high16 v1, 0x7f800000    # Float.POSITIVE_INFINITY

    if-ltz p2, :cond_1

    sget-object p2, Lcom/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p2}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result p2

    sub-float/2addr p2, v0

    goto :goto_0

    :cond_1
    const/high16 p2, 0x7f800000    # Float.POSITIVE_INFINITY

    :goto_0
    sget-object v2, Lcom/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v2}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v2

    sub-float/2addr v2, p0

    mul-float v2, v2, p3

    cmpg-float v2, v2, v0

    if-gtz v2, :cond_2

    sget-object v1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v1

    div-float/2addr v0, p3

    sub-float/2addr v1, v0

    :cond_2
    iget p1, p1, Landroid/graphics/RectF;->top:F

    invoke-static {p2, v1}, Ljava/lang/Math;->min(FF)F

    move-result p2

    invoke-static {p0, p2}, Ljava/lang/Math;->min(FF)F

    move-result p0

    invoke-static {p1, p0}, Ljava/lang/Math;->max(FF)F

    move-result p0

    :goto_1
    return p0
.end method

.method public static getHeight()F
    .locals 2

    sget-object v0, Lcom/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v0}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v0

    sget-object v1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v1

    sub-float/2addr v0, v1

    return v0
.end method

.method public static getWidth()F
    .locals 2

    sget-object v0, Lcom/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v0}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v0

    sget-object v1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v1

    sub-float/2addr v0, v1

    return v0
.end method

.method private isOutOfBounds(FFFFLandroid/graphics/RectF;)Z
    .locals 1

    iget v0, p5, Landroid/graphics/RectF;->top:F

    cmpg-float p1, p1, v0

    if-ltz p1, :cond_1

    iget p1, p5, Landroid/graphics/RectF;->left:F

    cmpg-float p1, p2, p1

    if-ltz p1, :cond_1

    iget p1, p5, Landroid/graphics/RectF;->bottom:F

    cmpl-float p1, p3, p1

    if-gtz p1, :cond_1

    iget p1, p5, Landroid/graphics/RectF;->right:F

    cmpl-float p1, p4, p1

    if-lez p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/edmodo/cropper/cropwindow/edge/Edge;
    .locals 1

    const-class v0, Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/edmodo/cropper/cropwindow/edge/Edge;

    return-object p0
.end method

.method public static values()[Lcom/edmodo/cropper/cropwindow/edge/Edge;
    .locals 1

    sget-object v0, Lcom/edmodo/cropper/cropwindow/edge/Edge;->$VALUES:[Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v0}, [Lcom/edmodo/cropper/cropwindow/edge/Edge;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/edmodo/cropper/cropwindow/edge/Edge;

    return-object v0
.end method


# virtual methods
.method public adjustCoordinate(F)V
    .locals 6

    sget-object v0, Lcom/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v0}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v0

    sget-object v1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v1

    sget-object v2, Lcom/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v2}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v2

    sget-object v3, Lcom/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v3}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v3

    sget-object v4, Lcom/edmodo/cropper/cropwindow/edge/Edge$1;->$SwitchMap$com$edmodo$cropper$cropwindow$edge$Edge:[I

    invoke-virtual {p0}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-static {v0, v1, v2, p1}, Lcom/edmodo/cropper/util/AspectRatioUtil;->calculateBottom(FFFF)F

    move-result p1

    iput p1, p0, Lcom/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    goto :goto_0

    :pswitch_1
    invoke-static {v0, v1, v3, p1}, Lcom/edmodo/cropper/util/AspectRatioUtil;->calculateRight(FFFF)F

    move-result p1

    iput p1, p0, Lcom/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    goto :goto_0

    :pswitch_2
    invoke-static {v0, v2, v3, p1}, Lcom/edmodo/cropper/util/AspectRatioUtil;->calculateTop(FFFF)F

    move-result p1

    iput p1, p0, Lcom/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    goto :goto_0

    :pswitch_3
    invoke-static {v1, v2, v3, p1}, Lcom/edmodo/cropper/util/AspectRatioUtil;->calculateLeft(FFFF)F

    move-result p1

    iput p1, p0, Lcom/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public adjustCoordinate(FFLandroid/graphics/RectF;FF)V
    .locals 2

    sget-object v0, Lcom/edmodo/cropper/cropwindow/edge/Edge$1;->$SwitchMap$com$edmodo$cropper$cropwindow$edge$Edge:[I

    invoke-virtual {p0}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-static {p2, p3, p4, p5}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->adjustBottom(FLandroid/graphics/RectF;FF)F

    move-result p1

    iput p1, p0, Lcom/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    goto :goto_0

    :pswitch_1
    invoke-static {p1, p3, p4, p5}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->adjustRight(FLandroid/graphics/RectF;FF)F

    move-result p1

    iput p1, p0, Lcom/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    goto :goto_0

    :pswitch_2
    invoke-static {p2, p3, p4, p5}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->adjustTop(FLandroid/graphics/RectF;FF)F

    move-result p1

    iput p1, p0, Lcom/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    goto :goto_0

    :pswitch_3
    invoke-static {p1, p3, p4, p5}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->adjustLeft(FLandroid/graphics/RectF;FF)F

    move-result p1

    iput p1, p0, Lcom/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getCoordinate()F
    .locals 1

    iget v0, p0, Lcom/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    return v0
.end method

.method public isNewRectangleOutOfBounds(Lcom/edmodo/cropper/cropwindow/edge/Edge;Landroid/graphics/RectF;F)Z
    .locals 8

    invoke-virtual {p1, p2}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->snapOffset(Landroid/graphics/RectF;)F

    move-result v0

    sget-object v1, Lcom/edmodo/cropper/cropwindow/edge/Edge$1;->$SwitchMap$com$edmodo$cropper$cropwindow$edge$Edge:[I

    invoke-virtual {p0}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    goto/16 :goto_0

    :pswitch_0
    sget-object v1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p1, v1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget v4, p2, Landroid/graphics/RectF;->left:F

    sget-object p1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result p1

    sub-float v6, p1, v0

    sget-object p1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v3

    invoke-static {v4, v3, v6, p3}, Lcom/edmodo/cropper/util/AspectRatioUtil;->calculateBottom(FFFF)F

    move-result v5

    move-object v2, p0

    move-object v7, p2

    invoke-direct/range {v2 .. v7}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->isOutOfBounds(FFFFLandroid/graphics/RectF;)Z

    move-result p1

    return p1

    :cond_0
    sget-object v1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p1, v1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    iget v5, p2, Landroid/graphics/RectF;->right:F

    sget-object p1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result p1

    sub-float v3, p1, v0

    sget-object p1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v2

    invoke-static {v3, v2, v5, p3}, Lcom/edmodo/cropper/util/AspectRatioUtil;->calculateBottom(FFFF)F

    move-result v4

    move-object v1, p0

    move-object v6, p2

    invoke-direct/range {v1 .. v6}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->isOutOfBounds(FFFFLandroid/graphics/RectF;)Z

    move-result p1

    return p1

    :pswitch_1
    sget-object v1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p1, v1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget v3, p2, Landroid/graphics/RectF;->top:F

    sget-object p1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result p1

    sub-float v5, p1, v0

    sget-object p1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v4

    invoke-static {v4, v3, v5, p3}, Lcom/edmodo/cropper/util/AspectRatioUtil;->calculateRight(FFFF)F

    move-result v6

    move-object v2, p0

    move-object v7, p2

    invoke-direct/range {v2 .. v7}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->isOutOfBounds(FFFFLandroid/graphics/RectF;)Z

    move-result p1

    return p1

    :cond_1
    sget-object v1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p1, v1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    iget v4, p2, Landroid/graphics/RectF;->bottom:F

    sget-object p1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result p1

    sub-float v2, p1, v0

    sget-object p1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v3

    invoke-static {v3, v2, v4, p3}, Lcom/edmodo/cropper/util/AspectRatioUtil;->calculateRight(FFFF)F

    move-result v5

    move-object v1, p0

    move-object v6, p2

    invoke-direct/range {v1 .. v6}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->isOutOfBounds(FFFFLandroid/graphics/RectF;)Z

    move-result p1

    return p1

    :pswitch_2
    sget-object v1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p1, v1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget v4, p2, Landroid/graphics/RectF;->left:F

    sget-object p1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result p1

    sub-float v6, p1, v0

    sget-object p1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v5

    invoke-static {v4, v6, v5, p3}, Lcom/edmodo/cropper/util/AspectRatioUtil;->calculateTop(FFFF)F

    move-result v3

    move-object v2, p0

    move-object v7, p2

    invoke-direct/range {v2 .. v7}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->isOutOfBounds(FFFFLandroid/graphics/RectF;)Z

    move-result p1

    return p1

    :cond_2
    sget-object v1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p1, v1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    iget v5, p2, Landroid/graphics/RectF;->right:F

    sget-object p1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result p1

    sub-float v3, p1, v0

    sget-object p1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v4

    invoke-static {v3, v5, v4, p3}, Lcom/edmodo/cropper/util/AspectRatioUtil;->calculateTop(FFFF)F

    move-result v2

    move-object v1, p0

    move-object v6, p2

    invoke-direct/range {v1 .. v6}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->isOutOfBounds(FFFFLandroid/graphics/RectF;)Z

    move-result p1

    return p1

    :pswitch_3
    sget-object v1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p1, v1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    iget v3, p2, Landroid/graphics/RectF;->top:F

    sget-object p1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result p1

    sub-float v5, p1, v0

    sget-object p1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v6

    invoke-static {v3, v6, v5, p3}, Lcom/edmodo/cropper/util/AspectRatioUtil;->calculateLeft(FFFF)F

    move-result v4

    move-object v2, p0

    move-object v7, p2

    invoke-direct/range {v2 .. v7}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->isOutOfBounds(FFFFLandroid/graphics/RectF;)Z

    move-result p1

    return p1

    :cond_3
    sget-object v1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p1, v1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    iget v4, p2, Landroid/graphics/RectF;->bottom:F

    sget-object p1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result p1

    sub-float v2, p1, v0

    sget-object p1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v5

    invoke-static {v2, v5, v4, p3}, Lcom/edmodo/cropper/util/AspectRatioUtil;->calculateLeft(FFFF)F

    move-result v3

    move-object v1, p0

    move-object v6, p2

    invoke-direct/range {v1 .. v6}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->isOutOfBounds(FFFFLandroid/graphics/RectF;)Z

    move-result p1

    return p1

    :cond_4
    :goto_0
    const/4 p1, 0x1

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public isOutsideMargin(Landroid/graphics/RectF;F)Z
    .locals 3

    sget-object v0, Lcom/edmodo/cropper/cropwindow/edge/Edge$1;->$SwitchMap$com$edmodo$cropper$cropwindow$edge$Edge:[I

    invoke-virtual {p0}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x0

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_0

    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    iget v0, p0, Lcom/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    sub-float/2addr p1, v0

    cmpg-float p1, p1, p2

    if-gez p1, :cond_0

    goto :goto_0

    :pswitch_0
    iget p1, p1, Landroid/graphics/RectF;->right:F

    iget v0, p0, Lcom/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    sub-float/2addr p1, v0

    cmpg-float p1, p1, p2

    if-gez p1, :cond_0

    :goto_0
    const/4 v1, 0x1

    goto :goto_1

    :pswitch_1
    iget v0, p0, Lcom/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    iget p1, p1, Landroid/graphics/RectF;->top:F

    sub-float/2addr v0, p1

    cmpg-float p1, v0, p2

    if-gez p1, :cond_0

    goto :goto_0

    :pswitch_2
    iget v0, p0, Lcom/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    iget p1, p1, Landroid/graphics/RectF;->left:F

    sub-float/2addr v0, p1

    cmpg-float p1, v0, p2

    if-gez p1, :cond_0

    goto :goto_0

    :cond_0
    :goto_1
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public offset(F)V
    .locals 1

    iget v0, p0, Lcom/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    return-void
.end method

.method public setCoordinate(F)V
    .locals 0

    iput p1, p0, Lcom/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    return-void
.end method

.method public snapOffset(Landroid/graphics/RectF;)F
    .locals 3

    iget v0, p0, Lcom/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    sget-object v1, Lcom/edmodo/cropper/cropwindow/edge/Edge$1;->$SwitchMap$com$edmodo$cropper$cropwindow$edge$Edge:[I

    invoke-virtual {p0}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    goto :goto_0

    :pswitch_0
    iget p1, p1, Landroid/graphics/RectF;->right:F

    goto :goto_0

    :pswitch_1
    iget p1, p1, Landroid/graphics/RectF;->top:F

    goto :goto_0

    :pswitch_2
    iget p1, p1, Landroid/graphics/RectF;->left:F

    :goto_0
    sub-float/2addr p1, v0

    return p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public snapToRect(Landroid/graphics/RectF;)F
    .locals 3

    iget v0, p0, Lcom/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    sget-object v1, Lcom/edmodo/cropper/cropwindow/edge/Edge$1;->$SwitchMap$com$edmodo$cropper$cropwindow$edge$Edge:[I

    invoke-virtual {p0}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    iput p1, p0, Lcom/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    goto :goto_0

    :pswitch_1
    iget p1, p1, Landroid/graphics/RectF;->right:F

    iput p1, p0, Lcom/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    goto :goto_0

    :pswitch_2
    iget p1, p1, Landroid/graphics/RectF;->top:F

    iput p1, p0, Lcom/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    goto :goto_0

    :pswitch_3
    iget p1, p1, Landroid/graphics/RectF;->left:F

    iput p1, p0, Lcom/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    :goto_0
    iget p1, p0, Lcom/edmodo/cropper/cropwindow/edge/Edge;->mCoordinate:F

    sub-float/2addr p1, v0

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
