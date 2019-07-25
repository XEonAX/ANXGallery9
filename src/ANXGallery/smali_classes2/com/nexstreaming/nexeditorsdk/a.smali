.class Lcom/nexstreaming/nexeditorsdk/a;
.super Ljava/lang/Object;
.source "nexCollageDrawInfo.java"

# interfaces
.implements Lcom/nexstreaming/nexeditorsdk/nexCollageInfo;
.implements Lcom/nexstreaming/nexeditorsdk/nexCollageInfoDraw;


# static fields
.field private static d:Ljava/lang/String; = "nexCollageDrawInfo"


# instance fields
.field protected a:Lcom/nexstreaming/nexeditorsdk/nexClip;

.field protected b:Landroid/graphics/RectF;

.field protected c:Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;

.field private e:F

.field private f:F

.field private g:Landroid/graphics/RectF;

.field private h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/graphics/PointF;",
            ">;"
        }
    .end annotation
.end field

.field private i:Ljava/lang/String;

.field private j:Ljava/lang/String;

.field private k:Ljava/lang/String;

.field private l:Ljava/lang/String;

.field private m:Ljava/lang/String;

.field private n:Ljava/lang/String;

.field private o:I

.field private p:I

.field private q:F

.field private r:Landroid/graphics/Rect;

.field private s:Landroid/graphics/RectF;

.field private t:Landroid/graphics/RectF;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->h:Ljava/util/List;

    const/4 v0, 0x0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->o:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->p:I

    return-void
.end method

.method private a(Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;Landroid/graphics/Rect;II)Landroid/graphics/Rect;
    .locals 11

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getUserTranslateX()I

    move-result v0

    mul-int v0, v0, p3

    const p3, 0x186a0

    div-int/2addr v0, p3

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getUserTranslateY()I

    move-result v1

    mul-int v1, v1, p4

    div-int/2addr v1, p3

    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    move-result p3

    int-to-float p3, p3

    const/high16 p4, 0x3f000000    # 0.5f

    mul-float p3, p3, p4

    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    move-result v2

    int-to-float v2, v2

    mul-float v2, v2, p4

    neg-float p4, p3

    neg-float v3, v2

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getUserRotateState()I

    move-result p1

    int-to-double v4, p1

    invoke-static {v4, v5}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v4

    double-to-float p1, v4

    neg-float p1, p1

    float-to-double v4, p1

    invoke-static {v4, v5}, Ljava/lang/Math;->cos(D)D

    move-result-wide v6

    double-to-float p1, v6

    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    move-result-wide v4

    double-to-float v4, v4

    mul-float v5, p1, p4

    mul-float v6, v4, v3

    sub-float v7, v5, v6

    mul-float p4, p4, v4

    mul-float v3, v3, p1

    add-float v8, p4, v3

    mul-float v9, p1, p3

    sub-float v6, v9, v6

    mul-float v10, v4, p3

    add-float/2addr v3, v10

    mul-float v4, v4, v2

    sub-float/2addr v5, v4

    mul-float p1, p1, v2

    add-float/2addr p4, p1

    sub-float/2addr v9, v4

    add-float/2addr v10, p1

    invoke-static {v7, v6}, Ljava/lang/Math;->min(FF)F

    move-result p1

    invoke-static {p1, v5}, Ljava/lang/Math;->min(FF)F

    move-result p1

    invoke-static {p1, v9}, Ljava/lang/Math;->min(FF)F

    move-result p1

    invoke-static {v8, v3}, Ljava/lang/Math;->min(FF)F

    move-result v4

    invoke-static {v4, p4}, Ljava/lang/Math;->min(FF)F

    move-result v4

    invoke-static {v4, v10}, Ljava/lang/Math;->min(FF)F

    move-result v4

    invoke-static {v7, v6}, Ljava/lang/Math;->max(FF)F

    move-result v6

    invoke-static {v6, v5}, Ljava/lang/Math;->max(FF)F

    move-result v5

    invoke-static {v5, v9}, Ljava/lang/Math;->max(FF)F

    move-result v5

    invoke-static {v8, v3}, Ljava/lang/Math;->max(FF)F

    move-result v3

    invoke-static {v3, p4}, Ljava/lang/Math;->max(FF)F

    move-result p4

    invoke-static {p4, v10}, Ljava/lang/Math;->max(FF)F

    move-result p4

    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    add-float/2addr p1, p3

    float-to-int p1, p1

    add-int/2addr p1, v0

    iget v6, p2, Landroid/graphics/Rect;->left:I

    add-int/2addr p1, v6

    iput p1, v3, Landroid/graphics/Rect;->left:I

    add-float/2addr v4, v2

    float-to-int p1, v4

    add-int/2addr p1, v1

    iget v4, p2, Landroid/graphics/Rect;->top:I

    add-int/2addr p1, v4

    iput p1, v3, Landroid/graphics/Rect;->top:I

    add-float/2addr v5, p3

    float-to-int p1, v5

    add-int/2addr p1, v0

    iget p3, p2, Landroid/graphics/Rect;->left:I

    add-int/2addr p1, p3

    iput p1, v3, Landroid/graphics/Rect;->right:I

    add-float/2addr p4, v2

    float-to-int p1, p4

    add-int/2addr p1, v1

    iget p2, p2, Landroid/graphics/Rect;->top:I

    add-int/2addr p1, p2

    iput p1, v3, Landroid/graphics/Rect;->bottom:I

    return-object v3
.end method

.method private a(Landroid/graphics/Rect;)V
    .locals 4

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->t:Landroid/graphics/RectF;

    if-nez v0, :cond_1

    new-instance v0, Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    invoke-direct {v0, v1}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->t:Landroid/graphics/RectF;

    :cond_1
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->t:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/a;->t:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    mul-float v0, v0, v1

    float-to-double v0, v0

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v2

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result p1

    mul-int v2, v2, p1

    int-to-double v2, v2

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float p1, v0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;

    invoke-virtual {v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setRealScale(F)V

    return-void

    :cond_2
    :goto_0
    return-void
.end method

.method private h()V
    .locals 12

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_0

    goto/16 :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result v1

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result v2

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRotateInMeta()I

    move-result v3

    const/16 v4, 0x5a

    if-eq v3, v4, :cond_1

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRotateInMeta()I

    move-result v3

    const/16 v4, 0x10e

    if-ne v3, v4, :cond_2

    :cond_1
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result v1

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result v2

    :cond_2
    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/a;->r:Landroid/graphics/Rect;

    if-nez v3, :cond_3

    new-instance v3, Landroid/graphics/Rect;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getStartRect()Landroid/graphics/Rect;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    iput-object v3, p0, Lcom/nexstreaming/nexeditorsdk/a;->r:Landroid/graphics/Rect;

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/a;->r:Landroid/graphics/Rect;

    invoke-static {v3, v1, v2}, Lcom/nexstreaming/nexeditorsdk/nexCollage;->a(Landroid/graphics/Rect;II)V

    :cond_3
    new-instance v3, Landroid/graphics/Rect;

    iget-object v4, p0, Lcom/nexstreaming/nexeditorsdk/a;->r:Landroid/graphics/Rect;

    invoke-direct {v3, v4}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    invoke-direct {p0, v0, v3, v1, v2}, Lcom/nexstreaming/nexeditorsdk/a;->a(Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;Landroid/graphics/Rect;II)Landroid/graphics/Rect;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v5

    invoke-virtual {v4}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v6

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v8

    int-to-float v8, v8

    const/high16 v9, 0x3f000000    # 0.5f

    mul-float v8, v8, v9

    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    move-result v10

    int-to-float v10, v10

    mul-float v10, v10, v9

    iget v11, v4, Landroid/graphics/Rect;->left:I

    if-gez v11, :cond_4

    div-float v11, v5, v8

    invoke-static {v11, v7}, Ljava/lang/Math;->min(FF)F

    move-result v7

    :cond_4
    iget v11, v4, Landroid/graphics/Rect;->right:I

    if-le v11, v1, :cond_5

    int-to-float v11, v1

    sub-float/2addr v11, v5

    div-float/2addr v11, v8

    invoke-static {v11, v7}, Ljava/lang/Math;->min(FF)F

    move-result v7

    :cond_5
    iget v5, v4, Landroid/graphics/Rect;->top:I

    if-gez v5, :cond_6

    div-float v5, v6, v10

    invoke-static {v5, v7}, Ljava/lang/Math;->min(FF)F

    move-result v7

    :cond_6
    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    if-le v4, v2, :cond_7

    int-to-float v4, v2

    sub-float/2addr v4, v6

    div-float/2addr v4, v10

    invoke-static {v4, v7}, Ljava/lang/Math;->min(FF)F

    move-result v7

    :cond_7
    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v4

    int-to-float v4, v4

    mul-float v4, v4, v9

    mul-float v4, v4, v7

    iget v5, p0, Lcom/nexstreaming/nexeditorsdk/a;->q:F

    mul-float v5, v5, v4

    invoke-virtual {v3}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v6

    invoke-virtual {v3}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v7

    iget-object v8, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    sub-float v9, v6, v5

    iput v9, v8, Landroid/graphics/RectF;->left:F

    iget-object v8, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    add-float/2addr v6, v5

    iput v6, v8, Landroid/graphics/RectF;->right:F

    iget-object v5, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    sub-float v6, v7, v4

    iput v6, v5, Landroid/graphics/RectF;->top:F

    iget-object v5, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    add-float/2addr v7, v4

    iput v7, v5, Landroid/graphics/RectF;->bottom:F

    iget-object v4, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    invoke-virtual {v4, v3}, Landroid/graphics/RectF;->round(Landroid/graphics/Rect;)V

    invoke-static {v3, v1, v2}, Lcom/nexstreaming/nexeditorsdk/nexCollage;->b(Landroid/graphics/Rect;II)V

    invoke-virtual {v0, v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setStartRect(Landroid/graphics/Rect;)V

    invoke-virtual {v0, v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setEndRect(Landroid/graphics/Rect;)V

    return-void

    :cond_8
    :goto_0
    return-void
.end method

.method private i()V
    .locals 9

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_0

    goto/16 :goto_1

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result v2

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result v3

    iget-object v4, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRotateInMeta()I

    move-result v4

    const/16 v5, 0x5a

    if-eq v4, v5, :cond_1

    iget-object v4, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRotateInMeta()I

    move-result v4

    const/16 v5, 0x10e

    if-ne v4, v5, :cond_2

    :cond_1
    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result v2

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result v3

    :cond_2
    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    iget-object v5, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->left:F

    float-to-int v5, v5

    iget-object v6, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->top:F

    float-to-int v6, v6

    iget-object v7, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    iget v7, v7, Landroid/graphics/RectF;->right:F

    float-to-int v7, v7

    iget-object v8, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    iget v8, v8, Landroid/graphics/RectF;->bottom:F

    float-to-int v8, v8

    invoke-virtual {v4, v5, v6, v7, v8}, Landroid/graphics/Rect;->set(IIII)V

    invoke-direct {p0, v0, v4, v2, v3}, Lcom/nexstreaming/nexeditorsdk/a;->a(Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;Landroid/graphics/Rect;II)Landroid/graphics/Rect;

    move-result-object v5

    iget v6, v5, Landroid/graphics/Rect;->left:I

    if-gez v6, :cond_3

    iget v6, v5, Landroid/graphics/Rect;->left:I

    rsub-int/lit8 v6, v6, 0x0

    goto :goto_0

    :cond_3
    const/4 v6, 0x0

    :goto_0
    iget v7, v5, Landroid/graphics/Rect;->right:I

    if-le v7, v2, :cond_4

    iget v7, v5, Landroid/graphics/Rect;->right:I

    sub-int/2addr v7, v2

    sub-int/2addr v6, v7

    :cond_4
    iget v7, v5, Landroid/graphics/Rect;->top:I

    if-gez v7, :cond_5

    iget v7, v5, Landroid/graphics/Rect;->top:I

    sub-int/2addr v1, v7

    :cond_5
    iget v7, v5, Landroid/graphics/Rect;->bottom:I

    if-le v7, v3, :cond_6

    iget v5, v5, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v5, v3

    sub-int/2addr v1, v5

    :cond_6
    if-nez v6, :cond_7

    if-nez v1, :cond_7

    return-void

    :cond_7
    iget-object v5, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    iget v7, v5, Landroid/graphics/RectF;->left:F

    int-to-float v6, v6

    add-float/2addr v7, v6

    iput v7, v5, Landroid/graphics/RectF;->left:F

    iget-object v5, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    iget v7, v5, Landroid/graphics/RectF;->right:F

    add-float/2addr v7, v6

    iput v7, v5, Landroid/graphics/RectF;->right:F

    iget-object v5, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    iget v6, v5, Landroid/graphics/RectF;->top:F

    int-to-float v1, v1

    add-float/2addr v6, v1

    iput v6, v5, Landroid/graphics/RectF;->top:F

    iget-object v5, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    iget v6, v5, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v6, v1

    iput v6, v5, Landroid/graphics/RectF;->bottom:F

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    invoke-virtual {v1, v4}, Landroid/graphics/RectF;->round(Landroid/graphics/Rect;)V

    invoke-static {v4, v2, v3}, Lcom/nexstreaming/nexeditorsdk/nexCollage;->b(Landroid/graphics/Rect;II)V

    invoke-virtual {v0, v4}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setStartRect(Landroid/graphics/Rect;)V

    invoke-virtual {v0, v4}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setEndRect(Landroid/graphics/Rect;)V

    return-void

    :cond_8
    :goto_1
    return-void
.end method

.method private j()Z
    .locals 8

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    const/4 v1, 0x0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_0

    goto/16 :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result v2

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result v3

    iget-object v4, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRotateInMeta()I

    move-result v4

    const/16 v5, 0x5a

    if-eq v4, v5, :cond_1

    iget-object v4, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRotateInMeta()I

    move-result v4

    const/16 v5, 0x10e

    if-ne v4, v5, :cond_2

    :cond_1
    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result v2

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result v3

    :cond_2
    new-instance v4, Landroid/graphics/Rect;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getStartRect()Landroid/graphics/Rect;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    invoke-static {v4, v2, v3}, Lcom/nexstreaming/nexeditorsdk/nexCollage;->a(Landroid/graphics/Rect;II)V

    invoke-direct {p0, v0, v4, v2, v3}, Lcom/nexstreaming/nexeditorsdk/a;->a(Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;Landroid/graphics/Rect;II)Landroid/graphics/Rect;

    move-result-object v0

    sget-object v5, Lcom/nexstreaming/nexeditorsdk/a;->d:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "aabb:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Landroid/graphics/Rect;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " width:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, " height:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, " r:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Landroid/graphics/Rect;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v4

    if-le v4, v2, :cond_3

    return v1

    :cond_3
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    if-le v0, v3, :cond_4

    return v1

    :cond_4
    sget-object v0, Lcom/nexstreaming/nexeditorsdk/a;->d:Ljava/lang/String;

    const-string v1, "aabb checkTranformOk"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    return v0

    :cond_5
    :goto_0
    return v1
.end method

.method private k()V
    .locals 8

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_0

    goto/16 :goto_1

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result v2

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result v3

    iget-object v4, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRotateInMeta()I

    move-result v4

    const/16 v5, 0x5a

    if-eq v4, v5, :cond_1

    iget-object v4, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRotateInMeta()I

    move-result v4

    const/16 v5, 0x10e

    if-ne v4, v5, :cond_2

    :cond_1
    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result v2

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result v3

    :cond_2
    new-instance v4, Landroid/graphics/Rect;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getStartRect()Landroid/graphics/Rect;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    invoke-static {v4, v2, v3}, Lcom/nexstreaming/nexeditorsdk/nexCollage;->a(Landroid/graphics/Rect;II)V

    invoke-direct {p0, v0, v4, v2, v3}, Lcom/nexstreaming/nexeditorsdk/a;->a(Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;Landroid/graphics/Rect;II)Landroid/graphics/Rect;

    move-result-object v4

    iget v5, v4, Landroid/graphics/Rect;->left:I

    if-gez v5, :cond_3

    iget v5, v4, Landroid/graphics/Rect;->left:I

    rsub-int/lit8 v5, v5, 0x0

    goto :goto_0

    :cond_3
    const/4 v5, 0x0

    :goto_0
    iget v6, v4, Landroid/graphics/Rect;->right:I

    if-le v6, v2, :cond_4

    iget v6, v4, Landroid/graphics/Rect;->right:I

    sub-int/2addr v6, v2

    sub-int/2addr v5, v6

    :cond_4
    iget v6, v4, Landroid/graphics/Rect;->top:I

    if-gez v6, :cond_5

    iget v6, v4, Landroid/graphics/Rect;->top:I

    sub-int/2addr v1, v6

    :cond_5
    iget v6, v4, Landroid/graphics/Rect;->bottom:I

    if-le v6, v3, :cond_6

    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v4, v3

    sub-int/2addr v1, v4

    :cond_6
    if-nez v5, :cond_7

    if-nez v1, :cond_7

    return-void

    :cond_7
    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getUserTranslateX()I

    move-result v4

    mul-int v4, v4, v2

    const v6, 0x186a0

    div-int/2addr v4, v6

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getUserTranslateY()I

    move-result v7

    mul-int v7, v7, v3

    div-int/2addr v7, v6

    add-int/2addr v4, v5

    mul-int v4, v4, v6

    div-int/2addr v4, v2

    add-int/2addr v7, v1

    mul-int v7, v7, v6

    div-int/2addr v7, v3

    invoke-virtual {v0, v4, v7}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setUserTranslate(II)V

    return-void

    :cond_8
    :goto_1
    return-void
.end method

.method private l()V
    .locals 4

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->t:Landroid/graphics/RectF;

    if-nez v0, :cond_1

    new-instance v0, Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    invoke-direct {v0, v1}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->t:Landroid/graphics/RectF;

    :cond_1
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->t:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/a;->t:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    mul-float v0, v0, v1

    float-to-double v0, v0

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    mul-float v2, v2, v3

    float-to-double v2, v2

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;

    invoke-virtual {v1, v0}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setRealScale(F)V

    return-void

    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method a(Landroid/graphics/PointF;Landroid/graphics/PointF;Landroid/graphics/PointF;)F
    .locals 3

    iget v0, p2, Landroid/graphics/PointF;->x:F

    iget v1, p1, Landroid/graphics/PointF;->x:F

    sub-float/2addr v0, v1

    iget v1, p3, Landroid/graphics/PointF;->y:F

    iget v2, p1, Landroid/graphics/PointF;->y:F

    sub-float/2addr v1, v2

    mul-float v0, v0, v1

    iget p3, p3, Landroid/graphics/PointF;->x:F

    iget v1, p1, Landroid/graphics/PointF;->x:F

    sub-float/2addr p3, v1

    iget p2, p2, Landroid/graphics/PointF;->y:F

    iget p1, p1, Landroid/graphics/PointF;->y:F

    sub-float/2addr p2, p1

    mul-float p3, p3, p2

    sub-float/2addr v0, p3

    return v0
.end method

.method a(Landroid/graphics/PointF;Ljava/util/List;)I
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/PointF;",
            "Ljava/util/List<",
            "Landroid/graphics/PointF;",
            ">;)I"
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-ge v0, v2, :cond_2

    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->y:F

    iget v3, p1, Landroid/graphics/PointF;->y:F

    cmpg-float v2, v2, v3

    const/4 v3, 0x0

    if-gtz v2, :cond_0

    add-int/lit8 v2, v0, 0x1

    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/graphics/PointF;

    iget v4, v4, Landroid/graphics/PointF;->y:F

    iget v5, p1, Landroid/graphics/PointF;->y:F

    cmpl-float v4, v4, v5

    if-lez v4, :cond_1

    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/graphics/PointF;

    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/PointF;

    invoke-virtual {p0, v4, v2, p1}, Lcom/nexstreaming/nexeditorsdk/a;->a(Landroid/graphics/PointF;Landroid/graphics/PointF;Landroid/graphics/PointF;)F

    move-result v2

    cmpl-float v2, v2, v3

    if-lez v2, :cond_1

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v2, v0, 0x1

    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/graphics/PointF;

    iget v4, v4, Landroid/graphics/PointF;->y:F

    iget v5, p1, Landroid/graphics/PointF;->y:F

    cmpg-float v4, v4, v5

    if-gtz v4, :cond_1

    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/graphics/PointF;

    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/PointF;

    invoke-virtual {p0, v4, v2, p1}, Lcom/nexstreaming/nexeditorsdk/a;->a(Landroid/graphics/PointF;Landroid/graphics/PointF;Landroid/graphics/PointF;)F

    move-result v2

    cmpg-float v2, v2, v3

    if-gez v2, :cond_1

    add-int/lit8 v1, v1, -0x1

    :cond_1
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return v1
.end method

.method public a(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->k:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager;->getAssetPackageMediaPath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected a(Lcom/nexstreaming/nexeditorsdk/nexProject;I)Ljava/lang/String;
    .locals 4

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->e:F

    int-to-float p2, p2

    mul-float v0, v0, p2

    float-to-int v0, v0

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/a;->f:F

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/a;->m:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/a;->m:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/a;->m:Ljava/lang/String;

    const-string v2, "none"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexProject;->updateProject()Z

    invoke-static {}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->a()Lcom/nexstreaming/kminternal/kinemaster/config/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/kinemaster/config/a;->b()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/a;->m:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager;->getAssetPackageMediaPath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getSupportedClip(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexClip;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getTotalTime()I

    move-result v2

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/a;->n:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v3

    mul-float p2, p2, v3

    float-to-int p2, p2

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/a;->i:Ljava/lang/String;

    invoke-virtual {v1, v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setCollageDrawInfoID(Ljava/lang/String;)V

    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setAssetResource(Z)V

    add-int/2addr v0, p2

    add-int/2addr v2, v0

    invoke-virtual {p1, v1, v0, v2}, Lcom/nexstreaming/nexeditorsdk/nexProject;->addAudio(Lcom/nexstreaming/nexeditorsdk/nexClip;II)I

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method protected a(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    if-eqz v0, :cond_0

    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v1, Ljava/util/Date;

    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    new-instance v0, Ljava/text/SimpleDateFormat;

    invoke-direct {v0, p1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const-string p1, ""

    return-object p1
.end method

.method a(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 9

    :try_start_0
    const-string v0, "start"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->e:F

    const-string v0, "end"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->f:F

    const-string v0, "position"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    const-string v0, "position"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, " "

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const-string p1, "Wrong position data of drawinfo"

    return-object p1

    :cond_0
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/a;->h:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    array-length v1, v0

    const/4 v2, 0x4

    const/4 v3, 0x0

    if-ne v1, v2, :cond_1

    aget-object v1, v0, v3

    invoke-static {v1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v1

    const/4 v2, 0x1

    aget-object v2, v0, v2

    invoke-static {v2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v2

    const/4 v3, 0x2

    aget-object v3, v0, v3

    invoke-static {v3}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v3

    const/4 v4, 0x3

    aget-object v0, v0, v4

    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    new-instance v4, Landroid/graphics/PointF;

    invoke-direct {v4, v1, v2}, Landroid/graphics/PointF;-><init>(FF)V

    new-instance v5, Landroid/graphics/PointF;

    invoke-direct {v5, v3, v2}, Landroid/graphics/PointF;-><init>(FF)V

    new-instance v6, Landroid/graphics/PointF;

    invoke-direct {v6, v3, v0}, Landroid/graphics/PointF;-><init>(FF)V

    new-instance v7, Landroid/graphics/PointF;

    invoke-direct {v7, v1, v0}, Landroid/graphics/PointF;-><init>(FF)V

    iget-object v8, p0, Lcom/nexstreaming/nexeditorsdk/a;->h:Ljava/util/List;

    invoke-interface {v8, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v8, p0, Lcom/nexstreaming/nexeditorsdk/a;->h:Ljava/util/List;

    invoke-interface {v8, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v5, p0, Lcom/nexstreaming/nexeditorsdk/a;->h:Ljava/util/List;

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v5, p0, Lcom/nexstreaming/nexeditorsdk/a;->h:Ljava/util/List;

    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v5, p0, Lcom/nexstreaming/nexeditorsdk/a;->h:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v4, Landroid/graphics/RectF;

    invoke-direct {v4, v1, v2, v3, v0}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object v4, p0, Lcom/nexstreaming/nexeditorsdk/a;->g:Landroid/graphics/RectF;

    goto :goto_1

    :cond_1
    const/4 v1, 0x1

    const v2, 0x7f7fffff    # Float.MAX_VALUE

    const v1, 0x7f7fffff    # Float.MAX_VALUE

    const/4 v4, 0x1

    const/4 v5, 0x1

    :goto_0
    array-length v6, v0

    if-ge v3, v6, :cond_6

    aget-object v6, v0, v3

    invoke-static {v6}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v6

    add-int/lit8 v7, v3, 0x1

    aget-object v7, v0, v7

    invoke-static {v7}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v7

    cmpl-float v8, v2, v6

    if-lez v8, :cond_2

    move v2, v6

    :cond_2
    cmpg-float v8, v4, v6

    if-gez v8, :cond_3

    move v4, v6

    :cond_3
    cmpl-float v8, v1, v7

    if-lez v8, :cond_4

    move v1, v7

    :cond_4
    cmpg-float v8, v5, v7

    if-gez v8, :cond_5

    move v5, v7

    :cond_5
    new-instance v8, Landroid/graphics/PointF;

    invoke-direct {v8, v6, v7}, Landroid/graphics/PointF;-><init>(FF)V

    iget-object v6, p0, Lcom/nexstreaming/nexeditorsdk/a;->h:Ljava/util/List;

    invoke-interface {v6, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x2

    goto :goto_0

    :cond_6
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0, v2, v1, v4, v5}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->g:Landroid/graphics/RectF;

    :cond_7
    :goto_1
    const-string v0, "draw_id"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->i:Ljava/lang/String;

    const-string v0, "source_type"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->j:Ljava/lang/String;

    const-string v0, "source_default"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->k:Ljava/lang/String;

    const-string v0, "lut"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->l:Ljava/lang/String;

    const-string v0, "audio_res"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->m:Ljava/lang/String;

    const-string v0, "audio_res_pos"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->n:Ljava/lang/String;

    const-string v0, "draw_width"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8

    const-string v0, "draw_width"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->o:I

    :cond_8
    const-string v0, "draw_height"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_9

    const-string v0, "draw_height"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/a;->p:I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_9
    const/4 p1, 0x0

    return-object p1

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    sget-object v0, Lcom/nexstreaming/nexeditorsdk/a;->d:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "parse Collage failed : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public a(F)V
    .locals 8

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_0

    goto/16 :goto_1

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result v1

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result v2

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRotateInMeta()I

    move-result v3

    const/16 v4, 0x5a

    if-eq v3, v4, :cond_1

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRotateInMeta()I

    move-result v3

    const/16 v4, 0x10e

    if-ne v3, v4, :cond_2

    :cond_1
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result v1

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result v2

    :cond_2
    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/a;->t:Landroid/graphics/RectF;

    if-nez v3, :cond_3

    new-instance v3, Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    invoke-direct {v3, v4}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    iput-object v3, p0, Lcom/nexstreaming/nexeditorsdk/a;->t:Landroid/graphics/RectF;

    :cond_3
    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/a;->t:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v3

    iget-object v4, p0, Lcom/nexstreaming/nexeditorsdk/a;->t:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v4

    mul-float v3, v3, v4

    float-to-double v3, v3

    iget-object v5, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    invoke-virtual {v5}, Landroid/graphics/RectF;->width()F

    move-result v5

    iget-object v6, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    invoke-virtual {v6}, Landroid/graphics/RectF;->height()F

    move-result v6

    mul-float v5, v5, v6

    float-to-double v5, v5

    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    invoke-static {v5, v6}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v3, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v3

    double-to-float v3, v3

    sget-object v4, Lcom/nexstreaming/nexeditorsdk/a;->d:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "scale_chk:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v6, " display_rect:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    invoke-virtual {v6}, Landroid/graphics/RectF;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v4, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->centerX()F

    move-result v4

    iget-object v5, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    invoke-virtual {v5}, Landroid/graphics/RectF;->centerY()F

    move-result v5

    iget-object v6, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    iget-object v6, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    invoke-virtual {v6}, Landroid/graphics/RectF;->height()F

    move-result v6

    const/high16 v7, 0x3f000000    # 0.5f

    mul-float v6, v6, v7

    const/4 v7, 0x0

    cmpl-float p1, p1, v7

    if-lez p1, :cond_5

    const/high16 p1, 0x40000000    # 2.0f

    cmpl-float p1, v3, p1

    if-lez p1, :cond_4

    return-void

    :cond_4
    const p1, 0x3f7851ec    # 0.97f

    mul-float v6, v6, p1

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/a;->q:F

    mul-float p1, p1, v6

    goto :goto_0

    :cond_5
    const p1, 0x3e4ccccd    # 0.2f

    cmpg-float p1, v3, p1

    if-gez p1, :cond_6

    return-void

    :cond_6
    const p1, 0x3f83d70a    # 1.03f

    mul-float v6, v6, p1

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/a;->q:F

    mul-float p1, p1, v6

    :goto_0
    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    sub-float v7, v4, p1

    iput v7, v3, Landroid/graphics/RectF;->left:F

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    add-float/2addr v4, p1

    iput v4, v3, Landroid/graphics/RectF;->right:F

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    sub-float v3, v5, v6

    iput v3, p1, Landroid/graphics/RectF;->top:F

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    add-float/2addr v5, v6

    iput v5, p1, Landroid/graphics/RectF;->bottom:F

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    invoke-virtual {v3, p1}, Landroid/graphics/RectF;->round(Landroid/graphics/Rect;)V

    invoke-static {p1, v1, v2}, Lcom/nexstreaming/nexeditorsdk/nexCollage;->b(Landroid/graphics/Rect;II)V

    invoke-virtual {v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setStartRect(Landroid/graphics/Rect;)V

    invoke-virtual {v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setEndRect(Landroid/graphics/Rect;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/a;->r:Landroid/graphics/Rect;

    return-void

    :cond_7
    :goto_1
    return-void
.end method

.method public a(Landroid/graphics/RectF;)V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->t:Landroid/graphics/RectF;

    if-eqz p1, :cond_0

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0, p1}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->t:Landroid/graphics/RectF;

    :cond_0
    return-void
.end method

.method protected a(Lcom/nexstreaming/nexeditorsdk/nexClip;)V
    .locals 4

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result v1

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRotateInMeta()I

    move-result v2

    const/16 v3, 0x5a

    if-eq v2, v3, :cond_0

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRotateInMeta()I

    move-result v2

    const/16 v3, 0x10e

    if-ne v2, v3, :cond_1

    :cond_0
    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result v0

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result v1

    :cond_1
    new-instance p1, Landroid/graphics/RectF;

    int-to-float v0, v0

    int-to-float v1, v1

    const/4 v2, 0x0

    invoke-direct {p1, v2, v2, v0, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/a;->b:Landroid/graphics/RectF;

    :cond_2
    return-void
.end method

.method protected a(Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/a;->c:Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;

    return-void
.end method

.method public a(Z)V
    .locals 20

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    if-eqz v2, :cond_6

    iget-object v2, v0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v2

    if-eqz v2, :cond_6

    iget-object v2, v0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-gtz v2, :cond_0

    goto/16 :goto_0

    :cond_0
    iget-object v2, v0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result v2

    iget-object v3, v0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result v3

    iget-object v4, v0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRotateInMeta()I

    move-result v4

    const/16 v5, 0x5a

    if-eq v4, v5, :cond_1

    iget-object v4, v0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRotateInMeta()I

    move-result v4

    const/16 v5, 0x10e

    if-ne v4, v5, :cond_2

    :cond_1
    iget-object v2, v0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result v2

    iget-object v3, v0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result v3

    :cond_2
    iget-object v4, v0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v4

    const/4 v5, 0x0

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;

    iget-object v6, v0, Lcom/nexstreaming/nexeditorsdk/a;->t:Landroid/graphics/RectF;

    if-nez v6, :cond_3

    new-instance v6, Landroid/graphics/Rect;

    invoke-direct {v6, v5, v5, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    iget v5, v0, Lcom/nexstreaming/nexeditorsdk/a;->q:F

    invoke-static {v6, v5}, Lcom/nexstreaming/nexeditorsdk/nexCollage;->a(Landroid/graphics/Rect;F)V

    new-instance v5, Landroid/graphics/RectF;

    invoke-direct {v5, v6}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    invoke-virtual {v0, v5}, Lcom/nexstreaming/nexeditorsdk/a;->a(Landroid/graphics/RectF;)V

    :cond_3
    iget-object v5, v0, Lcom/nexstreaming/nexeditorsdk/a;->t:Landroid/graphics/RectF;

    invoke-virtual {v5}, Landroid/graphics/RectF;->centerX()F

    move-result v5

    iget-object v6, v0, Lcom/nexstreaming/nexeditorsdk/a;->t:Landroid/graphics/RectF;

    invoke-virtual {v6}, Landroid/graphics/RectF;->centerY()F

    move-result v6

    new-instance v7, Landroid/graphics/Rect;

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getStartRect()Landroid/graphics/Rect;

    move-result-object v8

    invoke-direct {v7, v8}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    invoke-static {v7, v2, v3}, Lcom/nexstreaming/nexeditorsdk/nexCollage;->a(Landroid/graphics/Rect;II)V

    if-eqz p1, :cond_4

    invoke-direct {v0, v7}, Lcom/nexstreaming/nexeditorsdk/a;->a(Landroid/graphics/Rect;)V

    :cond_4
    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getRealScale()F

    move-result v8

    iget-object v9, v0, Lcom/nexstreaming/nexeditorsdk/a;->t:Landroid/graphics/RectF;

    invoke-virtual {v9}, Landroid/graphics/RectF;->width()F

    move-result v9

    div-float/2addr v9, v8

    iget-object v10, v0, Lcom/nexstreaming/nexeditorsdk/a;->t:Landroid/graphics/RectF;

    invoke-virtual {v10}, Landroid/graphics/RectF;->height()F

    move-result v10

    div-float/2addr v10, v8

    invoke-virtual {v7}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v8

    invoke-virtual {v7}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v11

    float-to-double v12, v5

    float-to-double v14, v9

    const-wide/high16 v16, 0x4000000000000000L    # 2.0

    invoke-static {v14, v15}, Ljava/lang/Double;->isNaN(D)Z

    div-double v14, v14, v16

    invoke-static {v12, v13}, Ljava/lang/Double;->isNaN(D)Z

    move-object/from16 v18, v4

    sub-double v4, v12, v14

    double-to-int v4, v4

    iput v4, v7, Landroid/graphics/Rect;->left:I

    float-to-double v4, v6

    float-to-double v9, v10

    invoke-static {v9, v10}, Ljava/lang/Double;->isNaN(D)Z

    div-double v9, v9, v16

    invoke-static {v4, v5}, Ljava/lang/Double;->isNaN(D)Z

    move/from16 v19, v2

    sub-double v1, v4, v9

    double-to-int v1, v1

    iput v1, v7, Landroid/graphics/Rect;->top:I

    invoke-static {v12, v13}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v12, v14

    double-to-int v1, v12

    iput v1, v7, Landroid/graphics/Rect;->right:I

    invoke-static {v4, v5}, Ljava/lang/Double;->isNaN(D)Z

    add-double/2addr v4, v9

    double-to-int v1, v4

    iput v1, v7, Landroid/graphics/Rect;->bottom:I

    iget v1, v0, Lcom/nexstreaming/nexeditorsdk/a;->q:F

    invoke-static {v7, v1}, Lcom/nexstreaming/nexeditorsdk/nexCollage;->a(Landroid/graphics/Rect;F)V

    invoke-virtual {v7}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v1

    sub-float/2addr v8, v1

    float-to-int v1, v8

    invoke-virtual {v7}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v2

    sub-float/2addr v11, v2

    float-to-int v2, v11

    iget v4, v7, Landroid/graphics/Rect;->left:I

    add-int/2addr v4, v1

    iput v4, v7, Landroid/graphics/Rect;->left:I

    iget v4, v7, Landroid/graphics/Rect;->right:I

    add-int/2addr v4, v1

    iput v4, v7, Landroid/graphics/Rect;->right:I

    iget v1, v7, Landroid/graphics/Rect;->top:I

    add-int/2addr v1, v2

    iput v1, v7, Landroid/graphics/Rect;->top:I

    iget v1, v7, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v1, v2

    iput v1, v7, Landroid/graphics/Rect;->bottom:I

    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1, v7}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    iput-object v1, v0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    move/from16 v2, v19

    invoke-static {v7, v2, v3}, Lcom/nexstreaming/nexeditorsdk/nexCollage;->b(Landroid/graphics/Rect;II)V

    move-object/from16 v4, v18

    invoke-virtual {v4, v7}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setStartRect(Landroid/graphics/Rect;)V

    invoke-virtual {v4, v7}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setEndRect(Landroid/graphics/Rect;)V

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/nexstreaming/nexeditorsdk/a;->r:Landroid/graphics/Rect;

    invoke-direct/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/a;->i()V

    invoke-direct/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/a;->h()V

    if-eqz p1, :cond_5

    invoke-direct/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/a;->l()V

    iput-object v1, v0, Lcom/nexstreaming/nexeditorsdk/a;->r:Landroid/graphics/Rect;

    :cond_5
    return-void

    :cond_6
    :goto_0
    return-void
.end method

.method public a()Z
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->j:Ljava/lang/String;

    const-string v1, "system"

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->j:Ljava/lang/String;

    const-string v1, "system_mt"

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x1

    return v0
.end method

.method public a(FF)Z
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->h:Ljava/util/List;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->h:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0, p1, p2}, Landroid/graphics/PointF;-><init>(FF)V

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/a;->h:Ljava/util/List;

    invoke-virtual {p0, v0, p1}, Lcom/nexstreaming/nexeditorsdk/a;->a(Landroid/graphics/PointF;Ljava/util/List;)I

    move-result p1

    if-lez p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    return v1

    :cond_1
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->g:Landroid/graphics/RectF;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->g:Landroid/graphics/RectF;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/RectF;->contains(FF)Z

    move-result p1

    return p1

    :cond_2
    return v1
.end method

.method public a(Lcom/nexstreaming/nexeditorsdk/nexClip;Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;)Z
    .locals 13

    const/4 v0, 0x0

    if-eqz p1, :cond_a

    if-eqz p2, :cond_a

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    if-eqz v1, :cond_a

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_a

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-gtz v1, :cond_0

    goto/16 :goto_1

    :cond_0
    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->clearDrawInfos()V

    invoke-virtual {p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->addDrawInfo(Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;)V

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    iget v1, v1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mStartTime:I

    iput v1, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mStartTime:I

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    iget v1, v1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mEndTime:I

    iput v1, p1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mEndTime:I

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getProjectDuration()I

    move-result v1

    invoke-virtual {p1, v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setImageClipDuration(I)V

    :cond_1
    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result v1

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result v3

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRotateInMeta()I

    move-result v4

    const/16 v5, 0x5a

    if-eq v4, v5, :cond_2

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRotateInMeta()I

    move-result v4

    const/16 v5, 0x10e

    if-ne v4, v5, :cond_3

    :cond_2
    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result v1

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result v3

    :cond_3
    new-instance v4, Landroid/graphics/RectF;

    int-to-float v5, v1

    int-to-float v6, v3

    const/4 v7, 0x0

    invoke-direct {v4, v7, v7, v5, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object v4, p0, Lcom/nexstreaming/nexeditorsdk/a;->b:Landroid/graphics/RectF;

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4, v0, v0, v1, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    new-instance v8, Landroid/graphics/Rect;

    invoke-direct {v8, v0, v0, v2, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result v9

    if-ne v9, v2, :cond_9

    new-instance v9, Landroid/graphics/RectF;

    invoke-direct {v9}, Landroid/graphics/RectF;-><init>()V

    iget-object v10, p0, Lcom/nexstreaming/nexeditorsdk/a;->c:Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;

    if-eqz v10, :cond_4

    iget-object v9, p0, Lcom/nexstreaming/nexeditorsdk/a;->c:Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v9, p1}, Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;->FaceRect(Ljava/lang/String;)Landroid/graphics/RectF;

    move-result-object v9

    :cond_4
    iget p1, v9, Landroid/graphics/RectF;->left:F

    mul-float p1, p1, v5

    float-to-int p1, p1

    iget v10, v9, Landroid/graphics/RectF;->top:F

    mul-float v10, v10, v6

    float-to-int v10, v10

    iget v11, v9, Landroid/graphics/RectF;->right:F

    mul-float v11, v11, v5

    float-to-int v11, v11

    iget v12, v9, Landroid/graphics/RectF;->bottom:F

    mul-float v12, v12, v6

    float-to-int v12, v12

    invoke-virtual {v4, p1, v10, v11, v12}, Landroid/graphics/Rect;->set(IIII)V

    invoke-virtual {v4}, Landroid/graphics/Rect;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_5

    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4, v0, v0, v1, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    goto :goto_0

    :cond_5
    iget p1, v9, Landroid/graphics/RectF;->left:F

    mul-float p1, p1, v5

    float-to-int p1, p1

    iget v10, v9, Landroid/graphics/RectF;->top:F

    mul-float v10, v10, v6

    float-to-int v10, v10

    iget v11, v9, Landroid/graphics/RectF;->right:F

    mul-float v11, v11, v5

    float-to-int v11, v11

    iget v9, v9, Landroid/graphics/RectF;->bottom:F

    mul-float v9, v9, v6

    float-to-int v9, v9

    invoke-virtual {v8, p1, v10, v11, v9}, Landroid/graphics/Rect;->set(IIII)V

    iget p1, v4, Landroid/graphics/Rect;->right:I

    iget v9, v4, Landroid/graphics/Rect;->left:I

    sub-int/2addr p1, v9

    div-int/lit8 p1, p1, 0x2

    iget v9, v4, Landroid/graphics/Rect;->left:I

    sub-int/2addr v9, p1

    iput v9, v4, Landroid/graphics/Rect;->left:I

    iget v9, v4, Landroid/graphics/Rect;->right:I

    add-int/2addr v9, p1

    iput v9, v4, Landroid/graphics/Rect;->right:I

    iget p1, v4, Landroid/graphics/Rect;->left:I

    if-gez p1, :cond_6

    iput v0, v4, Landroid/graphics/Rect;->left:I

    :cond_6
    iget p1, v4, Landroid/graphics/Rect;->right:I

    if-le p1, v1, :cond_7

    iput v1, v4, Landroid/graphics/Rect;->right:I

    :cond_7
    iget p1, v4, Landroid/graphics/Rect;->bottom:I

    iget v9, v4, Landroid/graphics/Rect;->top:I

    sub-int/2addr p1, v9

    div-int/lit8 p1, p1, 0x2

    iget v9, v4, Landroid/graphics/Rect;->top:I

    sub-int/2addr v9, p1

    iput v9, v4, Landroid/graphics/Rect;->top:I

    iget v9, v4, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v9, p1

    iput v9, v4, Landroid/graphics/Rect;->bottom:I

    iget p1, v4, Landroid/graphics/Rect;->top:I

    if-gez p1, :cond_8

    iput v0, v4, Landroid/graphics/Rect;->top:I

    :cond_8
    iget p1, v4, Landroid/graphics/Rect;->bottom:I

    if-le p1, v3, :cond_9

    iput v3, v4, Landroid/graphics/Rect;->bottom:I

    :cond_9
    :goto_0
    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/a;->q:F

    invoke-static {v4, p1}, Lcom/nexstreaming/nexeditorsdk/nexCollage;->a(Landroid/graphics/Rect;F)V

    invoke-static {v4, v1, v3}, Lcom/nexstreaming/nexeditorsdk/nexCollage;->b(Landroid/graphics/Rect;II)V

    invoke-static {v8, v1, v3}, Lcom/nexstreaming/nexeditorsdk/nexCollage;->b(Landroid/graphics/Rect;II)V

    invoke-virtual {p2, v4}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setStartRect(Landroid/graphics/Rect;)V

    invoke-virtual {p2, v4}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setEndRect(Landroid/graphics/Rect;)V

    invoke-virtual {p2, v8}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setFaceRect(Landroid/graphics/Rect;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/a;->r:Landroid/graphics/Rect;

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    new-instance p2, Landroid/graphics/RectF;

    invoke-direct {p2, v7, v7, v5, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object p2, p0, Lcom/nexstreaming/nexeditorsdk/a;->b:Landroid/graphics/RectF;

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/a;->t:Landroid/graphics/RectF;

    invoke-virtual {p0, v0}, Lcom/nexstreaming/nexeditorsdk/a;->a(Z)V

    return v2

    :cond_a
    :goto_1
    return v0
.end method

.method protected b(F)V
    .locals 0

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/a;->q:F

    return-void
.end method

.method public b()Z
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->j:Ljava/lang/String;

    const-string v1, "system_mt"

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public c()F
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->e:F

    return v0
.end method

.method public changeSource(Lcom/nexstreaming/nexeditorsdk/nexClip;)Z
    .locals 16

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    const/4 v3, 0x0

    if-eqz v2, :cond_e

    iget-object v2, v0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v2

    if-eqz v2, :cond_e

    iget-object v2, v0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-gtz v2, :cond_0

    goto/16 :goto_3

    :cond_0
    iget-object v2, v0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;

    if-nez v2, :cond_1

    return v3

    :cond_1
    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->clearDrawInfos()V

    invoke-virtual {v1, v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->addDrawInfo(Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;)V

    iget-object v4, v0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    iget v4, v4, Lcom/nexstreaming/nexeditorsdk/nexClip;->mStartTime:I

    iput v4, v1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mStartTime:I

    iget-object v4, v0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    iget v4, v4, Lcom/nexstreaming/nexeditorsdk/nexClip;->mEndTime:I

    iput v4, v1, Lcom/nexstreaming/nexeditorsdk/nexClip;->mEndTime:I

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result v4

    const/4 v5, 0x4

    const/4 v6, 0x1

    if-ne v4, v5, :cond_2

    invoke-virtual {v1, v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setAudioOnOff(Z)V

    goto :goto_0

    :cond_2
    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result v4

    if-ne v4, v6, :cond_d

    iget-object v4, v0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getProjectDuration()I

    move-result v4

    invoke-virtual {v1, v4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setImageClipDuration(I)V

    :goto_0
    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result v4

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result v7

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRotateInMeta()I

    move-result v8

    const/16 v9, 0x5a

    if-eq v8, v9, :cond_3

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRotateInMeta()I

    move-result v8

    const/16 v9, 0x10e

    if-ne v8, v9, :cond_4

    :cond_3
    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result v4

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result v7

    :cond_4
    new-instance v8, Landroid/graphics/Rect;

    invoke-direct {v8, v3, v3, v4, v7}, Landroid/graphics/Rect;-><init>(IIII)V

    new-instance v9, Landroid/graphics/Rect;

    invoke-direct {v9, v3, v3, v6, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result v10

    if-ne v10, v6, :cond_a

    new-instance v10, Landroid/graphics/RectF;

    invoke-direct {v10}, Landroid/graphics/RectF;-><init>()V

    iget-object v11, v0, Lcom/nexstreaming/nexeditorsdk/a;->c:Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;

    if-eqz v11, :cond_5

    iget-object v10, v0, Lcom/nexstreaming/nexeditorsdk/a;->c:Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getPath()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v10, v11}, Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;->FaceRect(Ljava/lang/String;)Landroid/graphics/RectF;

    move-result-object v10

    :cond_5
    iget v11, v10, Landroid/graphics/RectF;->left:F

    int-to-float v12, v4

    mul-float v11, v11, v12

    float-to-int v11, v11

    iget v13, v10, Landroid/graphics/RectF;->top:F

    int-to-float v14, v7

    mul-float v13, v13, v14

    float-to-int v13, v13

    iget v15, v10, Landroid/graphics/RectF;->right:F

    mul-float v15, v15, v12

    float-to-int v15, v15

    iget v6, v10, Landroid/graphics/RectF;->bottom:F

    mul-float v6, v6, v14

    float-to-int v6, v6

    invoke-virtual {v8, v11, v13, v15, v6}, Landroid/graphics/Rect;->set(IIII)V

    invoke-virtual {v8}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_6

    new-instance v8, Landroid/graphics/Rect;

    invoke-direct {v8, v3, v3, v4, v7}, Landroid/graphics/Rect;-><init>(IIII)V

    goto :goto_1

    :cond_6
    iget v6, v10, Landroid/graphics/RectF;->left:F

    mul-float v6, v6, v12

    float-to-int v6, v6

    iget v11, v10, Landroid/graphics/RectF;->top:F

    mul-float v11, v11, v14

    float-to-int v11, v11

    iget v13, v10, Landroid/graphics/RectF;->right:F

    mul-float v13, v13, v12

    float-to-int v12, v13

    iget v10, v10, Landroid/graphics/RectF;->bottom:F

    mul-float v10, v10, v14

    float-to-int v10, v10

    invoke-virtual {v9, v6, v11, v12, v10}, Landroid/graphics/Rect;->set(IIII)V

    iget v6, v8, Landroid/graphics/Rect;->right:I

    iget v10, v8, Landroid/graphics/Rect;->left:I

    sub-int/2addr v6, v10

    div-int/lit8 v6, v6, 0x2

    iget v10, v8, Landroid/graphics/Rect;->left:I

    sub-int/2addr v10, v6

    iput v10, v8, Landroid/graphics/Rect;->left:I

    iget v10, v8, Landroid/graphics/Rect;->right:I

    add-int/2addr v10, v6

    iput v10, v8, Landroid/graphics/Rect;->right:I

    iget v6, v8, Landroid/graphics/Rect;->left:I

    if-gez v6, :cond_7

    iput v3, v8, Landroid/graphics/Rect;->left:I

    :cond_7
    iget v6, v8, Landroid/graphics/Rect;->right:I

    if-le v6, v4, :cond_8

    iput v4, v8, Landroid/graphics/Rect;->right:I

    :cond_8
    iget v6, v8, Landroid/graphics/Rect;->bottom:I

    iget v10, v8, Landroid/graphics/Rect;->top:I

    sub-int/2addr v6, v10

    div-int/lit8 v6, v6, 0x2

    iget v10, v8, Landroid/graphics/Rect;->top:I

    sub-int/2addr v10, v6

    iput v10, v8, Landroid/graphics/Rect;->top:I

    iget v10, v8, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v10, v6

    iput v10, v8, Landroid/graphics/Rect;->bottom:I

    iget v6, v8, Landroid/graphics/Rect;->top:I

    if-gez v6, :cond_9

    iput v3, v8, Landroid/graphics/Rect;->top:I

    :cond_9
    iget v6, v8, Landroid/graphics/Rect;->bottom:I

    if-le v6, v7, :cond_a

    iput v7, v8, Landroid/graphics/Rect;->bottom:I

    :cond_a
    :goto_1
    iget v6, v0, Lcom/nexstreaming/nexeditorsdk/a;->q:F

    invoke-static {v8, v6}, Lcom/nexstreaming/nexeditorsdk/nexCollage;->a(Landroid/graphics/Rect;F)V

    invoke-static {v8, v4, v7}, Lcom/nexstreaming/nexeditorsdk/nexCollage;->b(Landroid/graphics/Rect;II)V

    invoke-static {v9, v4, v7}, Lcom/nexstreaming/nexeditorsdk/nexCollage;->b(Landroid/graphics/Rect;II)V

    invoke-virtual {v2, v8}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setStartRect(Landroid/graphics/Rect;)V

    invoke-virtual {v2, v8}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setEndRect(Landroid/graphics/Rect;)V

    invoke-virtual {v2, v9}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setFaceRect(Landroid/graphics/Rect;)V

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result v6

    if-ne v6, v5, :cond_b

    invoke-virtual/range {p1 .. p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRotateInMeta()I

    move-result v5

    invoke-virtual {v2, v5}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setRotateState(I)V

    goto :goto_2

    :cond_b
    invoke-virtual {v2, v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setRotateState(I)V

    :goto_2
    invoke-virtual {v2, v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setUserRotateState(I)V

    invoke-virtual {v2, v3, v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setUserTranslate(II)V

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-virtual {v2, v5}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setRealScale(F)V

    invoke-virtual {v2, v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setBrightness(I)V

    const/4 v2, 0x0

    iput-object v2, v0, Lcom/nexstreaming/nexeditorsdk/a;->r:Landroid/graphics/Rect;

    iput-object v2, v0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    new-instance v5, Landroid/graphics/RectF;

    int-to-float v4, v4

    int-to-float v6, v7

    const/4 v7, 0x0

    invoke-direct {v5, v7, v7, v4, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object v5, v0, Lcom/nexstreaming/nexeditorsdk/a;->b:Landroid/graphics/RectF;

    iget-object v4, v0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    iput-object v1, v0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    iput-object v2, v0, Lcom/nexstreaming/nexeditorsdk/a;->t:Landroid/graphics/RectF;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/nexstreaming/nexeditorsdk/a;->a(Z)V

    iget-object v2, v0, Lcom/nexstreaming/nexeditorsdk/a;->c:Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;

    if-eqz v2, :cond_c

    iget-object v2, v0, Lcom/nexstreaming/nexeditorsdk/a;->c:Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;

    iget-object v3, v0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-interface {v2, v4, v3}, Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;->SourceChanged(Lcom/nexstreaming/nexeditorsdk/nexClip;Lcom/nexstreaming/nexeditorsdk/nexClip;)V

    return v1

    :cond_c
    return v3

    :cond_d
    return v3

    :cond_e
    :goto_3
    return v3
.end method

.method public d()F
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->f:F

    return v0
.end method

.method public e()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->l:Ljava/lang/String;

    return-object v0
.end method

.method f()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->o:I

    return v0
.end method

.method g()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->p:I

    return v0
.end method

.method public getBindSource()Lcom/nexstreaming/nexeditorsdk/nexClip;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    return-object v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->i:Ljava/lang/String;

    return-object v0
.end method

.method public getLut()Ljava/lang/String;
    .locals 3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    const/4 v2, 0x0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getUserLUT()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_1
    return-object v1

    :cond_2
    :goto_0
    return-object v1
.end method

.method public getPositions()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/graphics/PointF;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->h:Ljava/util/List;

    return-object v0
.end method

.method public getRectangle()Landroid/graphics/RectF;
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->g:Landroid/graphics/RectF;

    return-object v0
.end method

.method public getRotate()I
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getUserRotateState()I

    move-result v0

    return v0

    :cond_1
    :goto_0
    return v1
.end method

.method public getTagID()I
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getID()I

    move-result v0

    return v0

    :cond_1
    :goto_0
    return v1
.end method

.method public getVisible()Z
    .locals 3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getBrightness()I

    move-result v0

    const/16 v2, -0xff

    if-ne v0, v2, :cond_1

    return v1

    :cond_1
    const/4 v0, 0x1

    return v0

    :cond_2
    return v1

    :cond_3
    :goto_0
    return v1
.end method

.method public setAudioVolume(I)Z
    .locals 3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getClipType()I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_1

    return v1

    :cond_1
    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {p1, v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setAudioOnOff(Z)V

    return v2

    :cond_2
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0, v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setAudioOnOff(Z)V

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->setClipVolume(I)Z

    return v2

    :cond_3
    :goto_0
    return v1
.end method

.method public setFlip(I)Z
    .locals 5

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    const/4 v1, 0x0

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_0

    goto :goto_2

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getRotateState()I

    move-result v1

    const/4 v2, 0x1

    if-nez p1, :cond_1

    const p1, -0x30001

    and-int/2addr p1, v1

    goto :goto_1

    :cond_1
    and-int/lit8 v3, p1, 0x1

    if-ne v3, v2, :cond_3

    const/high16 v3, 0x10000

    and-int v4, v1, v3

    if-ne v4, v3, :cond_2

    const v3, -0x10001

    and-int/2addr v1, v3

    goto :goto_0

    :cond_2
    or-int/2addr v1, v3

    :cond_3
    :goto_0
    const/4 v3, 0x2

    and-int/2addr p1, v3

    if-ne p1, v3, :cond_5

    const/high16 p1, 0x20000

    and-int v3, v1, p1

    if-ne v3, p1, :cond_4

    const p1, -0x20001

    and-int/2addr p1, v1

    goto :goto_1

    :cond_4
    or-int/2addr p1, v1

    goto :goto_1

    :cond_5
    move p1, v1

    :goto_1
    invoke-virtual {v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setRotateState(I)V

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/a;->c:Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;

    if-eqz p1, :cond_6

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/a;->c:Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;

    invoke-interface {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;->DrawInfoChanged(Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;)V

    :cond_6
    return v2

    :cond_7
    :goto_2
    return v1
.end method

.method public setLut(Ljava/lang/String;)Z
    .locals 5

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    const/4 v1, 0x0

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_0

    goto/16 :goto_2

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz p1, :cond_9

    const-string v4, "none"

    invoke-virtual {p1, v4}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v4

    if-nez v4, :cond_1

    goto :goto_1

    :cond_1
    const-string v4, "default"

    invoke-virtual {p1, v4}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v4

    if-nez v4, :cond_5

    invoke-virtual {v0, v2}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setUserLUT(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/a;->e()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_2

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/a;->e()Ljava/lang/String;

    move-result-object p1

    const-string v2, "none"

    invoke-virtual {p1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p1

    if-eqz p1, :cond_2

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/a;->e()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->getLutColorEffect(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    move-result-object p1

    if-eqz p1, :cond_3

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->getLUTId()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setLUT(I)V

    goto :goto_0

    :cond_2
    invoke-virtual {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setLUT(I)V

    :cond_3
    :goto_0
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/a;->c:Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/a;->c:Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;

    invoke-interface {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;->DrawInfoChanged(Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;)V

    :cond_4
    return v3

    :cond_5
    const-string v2, "none"

    invoke-virtual {p1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_6

    const-string v2, "null"

    invoke-virtual {p1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-eqz v2, :cond_8

    :cond_6
    invoke-static {p1}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->getLutColorEffect(Ljava/lang/String;)Lcom/nexstreaming/nexeditorsdk/nexColorEffect;

    move-result-object v2

    if-eqz v2, :cond_8

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexColorEffect;->getLUTId()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setLUT(I)V

    invoke-virtual {v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setUserLUT(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/a;->c:Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;

    if-eqz p1, :cond_7

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/a;->c:Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;

    invoke-interface {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;->DrawInfoChanged(Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;)V

    :cond_7
    return v3

    :cond_8
    return v1

    :cond_9
    :goto_1
    invoke-virtual {v0, v2}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setUserLUT(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setLUT(I)V

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/a;->c:Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;

    if-eqz p1, :cond_a

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/a;->c:Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;

    invoke-interface {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;->DrawInfoChanged(Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;)V

    :cond_a
    return v3

    :cond_b
    :goto_2
    return v1
.end method

.method public setRotate(II)Z
    .locals 7

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    const/4 v1, 0x0

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_0

    goto/16 :goto_1

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;

    sget-object v2, Lcom/nexstreaming/nexeditorsdk/a;->d:Ljava/lang/String;

    const-string v3, "setRotate: %d %d"

    const/4 v4, 0x2

    new-array v5, v4, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v6, 0x1

    aput-object v1, v5, v6

    invoke-static {v3, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eq p1, v6, :cond_6

    if-ne p1, v4, :cond_1

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    if-nez p1, :cond_4

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result p1

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result v1

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRotateInMeta()I

    move-result v2

    const/16 v3, 0x5a

    if-eq v2, v3, :cond_2

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRotateInMeta()I

    move-result v2

    const/16 v3, 0x10e

    if-ne v2, v3, :cond_3

    :cond_2
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {p1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result p1

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result v1

    :cond_3
    new-instance v2, Landroid/graphics/Rect;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getStartRect()Landroid/graphics/Rect;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    invoke-static {v2, p1, v1}, Lcom/nexstreaming/nexeditorsdk/nexCollage;->a(Landroid/graphics/Rect;II)V

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1, v2}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    :cond_4
    invoke-virtual {v0, p2}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setUserRotateState(I)V

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/a;->h()V

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/a;->l()V

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/a;->c:Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/a;->c:Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;

    invoke-interface {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;->DrawInfoChanged(Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;)V

    :cond_5
    return v6

    :cond_6
    :goto_0
    return v6

    :cond_7
    :goto_1
    return v1
.end method

.method public setScale(F)Z
    .locals 6

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    const/4 v1, 0x0

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_0

    goto/16 :goto_0

    :cond_0
    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    const/4 v2, 0x1

    if-nez v0, :cond_1

    return v2

    :cond_1
    sget-object v0, Lcom/nexstreaming/nexeditorsdk/a;->d:Ljava/lang/String;

    const-string v3, "setScale %f"

    new-array v4, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    aput-object v5, v4, v1

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    if-nez v1, :cond_4

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result v1

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result v3

    iget-object v4, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRotateInMeta()I

    move-result v4

    const/16 v5, 0x5a

    if-eq v4, v5, :cond_2

    iget-object v4, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRotateInMeta()I

    move-result v4

    const/16 v5, 0x10e

    if-ne v4, v5, :cond_3

    :cond_2
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v1}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result v1

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result v3

    :cond_3
    new-instance v4, Landroid/graphics/Rect;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getStartRect()Landroid/graphics/Rect;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    invoke-static {v4, v1, v3}, Lcom/nexstreaming/nexeditorsdk/nexCollage;->a(Landroid/graphics/Rect;II)V

    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1, v4}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    new-instance v1, Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    invoke-direct {v1, v3}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/a;->t:Landroid/graphics/RectF;

    :cond_4
    new-instance v1, Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    invoke-direct {v1, v3}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    new-instance v3, Landroid/graphics/Rect;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getStartRect()Landroid/graphics/Rect;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getUserTranslateX()I

    move-result v4

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getUserTranslateY()I

    move-result v5

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/a;->a(F)V

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/a;->k()V

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/a;->j()Z

    move-result p1

    if-nez p1, :cond_5

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    invoke-virtual {v0, v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setStartRect(Landroid/graphics/Rect;)V

    invoke-virtual {v0, v3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setEndRect(Landroid/graphics/Rect;)V

    invoke-virtual {v0, v4, v5}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setUserTranslate(II)V

    :cond_5
    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/a;->l()V

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/a;->c:Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;

    if-eqz p1, :cond_6

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/a;->c:Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;

    invoke-interface {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;->DrawInfoChanged(Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;)V

    :cond_6
    return v2

    :cond_7
    :goto_0
    return v1
.end method

.method public setTranslate(IIII)Z
    .locals 6

    iget-object p3, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    const/4 p4, 0x0

    if-eqz p3, :cond_5

    iget-object p3, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {p3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object p3

    if-eqz p3, :cond_5

    iget-object p3, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {p3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object p3

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result p3

    if-gtz p3, :cond_0

    goto/16 :goto_0

    :cond_0
    iget-object p3, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {p3}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object p3

    invoke-interface {p3, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;

    invoke-virtual {p3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getUserRotateState()I

    move-result p4

    int-to-double v0, p4

    invoke-static {v0, v1}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v0

    double-to-float p4, v0

    neg-float p4, p4

    float-to-double v0, p4

    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    move-result-wide v2

    double-to-float p4, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    move-result-wide v0

    double-to-float v0, v0

    int-to-float p1, p1

    mul-float v1, p1, p4

    int-to-float p2, p2

    mul-float v2, p2, v0

    sub-float/2addr v1, v2

    mul-float p1, p1, v0

    mul-float p2, p2, p4

    add-float/2addr p1, p2

    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {p2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result p2

    iget-object p4, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {p4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result p4

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRotateInMeta()I

    move-result v0

    const/16 v2, 0x5a

    if-eq v0, v2, :cond_1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getRotateInMeta()I

    move-result v0

    const/16 v2, 0x10e

    if-ne v0, v2, :cond_2

    :cond_1
    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {p2}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getHeight()I

    move-result p2

    iget-object p4, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {p4}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getWidth()I

    move-result p4

    :cond_2
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    if-nez v0, :cond_3

    new-instance v0, Landroid/graphics/Rect;

    invoke-virtual {p3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getStartRect()Landroid/graphics/Rect;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    invoke-static {v0, p2, p4}, Lcom/nexstreaming/nexeditorsdk/nexCollage;->a(Landroid/graphics/Rect;II)V

    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2, v0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    :cond_3
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/a;->s:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v2

    mul-float v0, v0, v2

    float-to-double v2, v0

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->o:I

    iget v4, p0, Lcom/nexstreaming/nexeditorsdk/a;->p:I

    mul-int v0, v0, v4

    int-to-double v4, v0

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    invoke-static {v4, v5}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v2

    double-to-float v0, v2

    mul-float v1, v1, v0

    float-to-int v1, v1

    mul-float p1, p1, v0

    float-to-int p1, p1

    const v0, 0x186a0

    mul-int v1, v1, v0

    div-int/2addr v1, p2

    invoke-virtual {p3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getUserTranslateX()I

    move-result p2

    add-int/2addr v1, p2

    mul-int p1, p1, v0

    div-int/2addr p1, p4

    invoke-virtual {p3}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->getUserTranslateY()I

    move-result p2

    add-int/2addr p1, p2

    invoke-virtual {p3, v1, p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setUserTranslate(II)V

    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/a;->k()V

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/a;->c:Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/a;->c:Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;

    invoke-interface {p1, p3}, Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;->DrawInfoChanged(Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;)V

    :cond_4
    const/4 p1, 0x1

    return p1

    :cond_5
    :goto_0
    return p4
.end method

.method public setVisible(Z)Z
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    const/4 v1, 0x0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/a;->a:Lcom/nexstreaming/nexeditorsdk/nexClip;

    invoke-virtual {v0}, Lcom/nexstreaming/nexeditorsdk/nexClip;->getDrawInfos()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;

    if-eqz v0, :cond_3

    if-eqz p1, :cond_1

    invoke-virtual {v0, v1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setBrightness(I)V

    goto :goto_0

    :cond_1
    const/16 p1, -0xff

    invoke-virtual {v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;->setBrightness(I)V

    :goto_0
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/a;->c:Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/a;->c:Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;

    invoke-interface {p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexCollage$CollageInfoChangedListener;->DrawInfoChanged(Lcom/nexstreaming/nexeditorsdk/nexDrawInfo;)V

    :cond_2
    const/4 p1, 0x1

    return p1

    :cond_3
    return v1

    :cond_4
    :goto_1
    return v1
.end method
