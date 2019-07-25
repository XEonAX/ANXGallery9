.class Lcom/larvalabs/svgandroid/SVGParser$e;
.super Lorg/xml/sax/helpers/DefaultHandler;
.source "SVGParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/larvalabs/svgandroid/SVGParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "e"
.end annotation


# instance fields
.field a:Landroid/graphics/Picture;

.field b:Landroid/graphics/Canvas;

.field c:Landroid/graphics/Paint;

.field d:Landroid/graphics/RectF;

.field e:Landroid/graphics/RectF;

.field f:Landroid/graphics/RectF;

.field g:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque<",
            "Lcom/larvalabs/svgandroid/SVGParser$f;",
            ">;"
        }
    .end annotation
.end field

.field h:Lcom/larvalabs/svgandroid/SVGParser$c;

.field i:Z

.field j:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroid/graphics/Shader;",
            ">;"
        }
    .end annotation
.end field

.field k:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/larvalabs/svgandroid/SVGParser$a;",
            ">;"
        }
    .end annotation
.end field

.field l:Lcom/larvalabs/svgandroid/SVGParser$a;

.field private m:Z

.field private n:I

.field private o:Z


# direct methods
.method private constructor <init>(Landroid/graphics/Picture;Lcom/larvalabs/svgandroid/SVGParser$c;)V
    .locals 4

    invoke-direct {p0}, Lorg/xml/sax/helpers/DefaultHandler;-><init>()V

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->d:Landroid/graphics/RectF;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->e:Landroid/graphics/RectF;

    new-instance v1, Landroid/graphics/RectF;

    const/high16 v2, -0x800000    # Float.NEGATIVE_INFINITY

    const/high16 v3, 0x7f800000    # Float.POSITIVE_INFINITY

    invoke-direct {v1, v3, v3, v2, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object v1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->f:Landroid/graphics/RectF;

    new-instance v1, Ljava/util/ArrayDeque;

    invoke-direct {v1}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->g:Ljava/util/Deque;

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->i:Z

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->j:Ljava/util/HashMap;

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->k:Ljava/util/HashMap;

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    iput-boolean v1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->m:Z

    iput v1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->n:I

    iput-boolean v1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->o:Z

    const-string v0, "SVGAndroid"

    const-string v1, "SVGHandler Constructed"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iput-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->a:Landroid/graphics/Picture;

    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->c:Landroid/graphics/Paint;

    iget-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->c:Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    new-instance p1, Lcom/larvalabs/svgandroid/SVGParser$f;

    invoke-direct {p1}, Lcom/larvalabs/svgandroid/SVGParser$f;-><init>()V

    invoke-static {p1, v0}, Lcom/larvalabs/svgandroid/SVGParser$f;->a(Lcom/larvalabs/svgandroid/SVGParser$f;Z)Z

    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->g:Ljava/util/Deque;

    invoke-interface {v0, p1}, Ljava/util/Deque;->push(Ljava/lang/Object;)V

    new-instance p1, Lcom/larvalabs/svgandroid/SVGParser$c;

    invoke-direct {p1, p2}, Lcom/larvalabs/svgandroid/SVGParser$c;-><init>(Lcom/larvalabs/svgandroid/SVGParser$c;)V

    iput-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->h:Lcom/larvalabs/svgandroid/SVGParser$c;

    return-void
.end method

.method synthetic constructor <init>(Landroid/graphics/Picture;Lcom/larvalabs/svgandroid/SVGParser$c;Lcom/larvalabs/svgandroid/SVGParser$1;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/larvalabs/svgandroid/SVGParser$e;-><init>(Landroid/graphics/Picture;Lcom/larvalabs/svgandroid/SVGParser$c;)V

    return-void
.end method

.method private a(Lcom/larvalabs/svgandroid/SVGParser$d;Ljava/lang/Integer;Z)I
    .locals 4

    const-string v0, "SVGAndroid"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getColor : fillMode="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v2, " color="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v2}, Lcom/nexstreaming/app/common/util/c;->a(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz p3, :cond_0

    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->h:Lcom/larvalabs/svgandroid/SVGParser$c;

    invoke-static {v0}, Lcom/larvalabs/svgandroid/SVGParser$c;->b(Lcom/larvalabs/svgandroid/SVGParser$c;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p1, "SVGAndroid"

    const-string p2, "getColor : FILL OVERRIDE"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->h:Lcom/larvalabs/svgandroid/SVGParser$c;

    invoke-static {p1}, Lcom/larvalabs/svgandroid/SVGParser$c;->c(Lcom/larvalabs/svgandroid/SVGParser$c;)I

    move-result p1

    return p1

    :cond_0
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    const v0, 0xffffff

    and-int/2addr p2, v0

    const/high16 v1, -0x1000000

    or-int/2addr p2, v1

    iget-object v2, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->h:Lcom/larvalabs/svgandroid/SVGParser$c;

    invoke-static {v2}, Lcom/larvalabs/svgandroid/SVGParser$c;->a(Lcom/larvalabs/svgandroid/SVGParser$c;)Ljava/util/Set;

    move-result-object v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->h:Lcom/larvalabs/svgandroid/SVGParser$c;

    invoke-static {v2}, Lcom/larvalabs/svgandroid/SVGParser$c;->a(Lcom/larvalabs/svgandroid/SVGParser$c;)Ljava/util/Set;

    move-result-object v2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_1
    iget-object v2, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->h:Lcom/larvalabs/svgandroid/SVGParser$c;

    invoke-static {v2}, Lcom/larvalabs/svgandroid/SVGParser$c;->g(Lcom/larvalabs/svgandroid/SVGParser$c;)I

    move-result v2

    if-ne v2, p2, :cond_2

    const-string p2, "SVGAndroid"

    const-string v2, "getColor : REPLACE COLOR"

    invoke-static {p2, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p2, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->h:Lcom/larvalabs/svgandroid/SVGParser$c;

    invoke-static {p2}, Lcom/larvalabs/svgandroid/SVGParser$c;->h(Lcom/larvalabs/svgandroid/SVGParser$c;)I

    move-result p2

    :cond_2
    iget-object v2, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->h:Lcom/larvalabs/svgandroid/SVGParser$c;

    invoke-static {v2}, Lcom/larvalabs/svgandroid/SVGParser$c;->i(Lcom/larvalabs/svgandroid/SVGParser$c;)Ljava/util/Map;

    move-result-object v2

    if-eqz v2, :cond_3

    const-string v2, "SVGAndroid"

    const-string v3, "getColor : MAP COLOR"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v2, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->h:Lcom/larvalabs/svgandroid/SVGParser$c;

    invoke-static {v2, p2}, Lcom/larvalabs/svgandroid/SVGParser$c;->a(Lcom/larvalabs/svgandroid/SVGParser$c;I)I

    move-result p2

    :cond_3
    const-string v2, "opacity"

    invoke-virtual {p1, v2}, Lcom/larvalabs/svgandroid/SVGParser$d;->e(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v2

    if-nez v2, :cond_5

    if-eqz p3, :cond_4

    const-string p3, "fill-opacity"

    goto :goto_0

    :cond_4
    const-string p3, "stroke-opacity"

    :goto_0
    invoke-virtual {p1, p3}, Lcom/larvalabs/svgandroid/SVGParser$d;->e(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v2

    :cond_5
    if-eqz v2, :cond_6

    and-int p1, p2, v0

    const/high16 p2, 0x437f0000    # 255.0f

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result p3

    mul-float p3, p3, p2

    float-to-int p2, p3

    shl-int/lit8 p2, p2, 0x18

    and-int/2addr p2, v1

    or-int/2addr p2, p1

    :cond_6
    return p2
.end method

.method private a(ZLorg/xml/sax/Attributes;)Lcom/larvalabs/svgandroid/SVGParser$a;
    .locals 3

    const-string v0, "SVGAndroid"

    const-string v1, "doGradient : IN"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/larvalabs/svgandroid/SVGParser$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/larvalabs/svgandroid/SVGParser$a;-><init>(Lcom/larvalabs/svgandroid/SVGParser$1;)V

    const-string v1, "id"

    invoke-static {v1, p2}, Lcom/larvalabs/svgandroid/SVGParser;->a(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/larvalabs/svgandroid/SVGParser$a;->a:Ljava/lang/String;

    iput-boolean p1, v0, Lcom/larvalabs/svgandroid/SVGParser$a;->c:Z

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    const-string p1, "x1"

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-static {p1, p2, v2}, Lcom/larvalabs/svgandroid/SVGParser;->a(Ljava/lang/String;Lorg/xml/sax/Attributes;Ljava/lang/Float;)Ljava/lang/Float;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    iput p1, v0, Lcom/larvalabs/svgandroid/SVGParser$a;->d:F

    const-string p1, "x2"

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-static {p1, p2, v2}, Lcom/larvalabs/svgandroid/SVGParser;->a(Ljava/lang/String;Lorg/xml/sax/Attributes;Ljava/lang/Float;)Ljava/lang/Float;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    iput p1, v0, Lcom/larvalabs/svgandroid/SVGParser$a;->f:F

    const-string p1, "y1"

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-static {p1, p2, v2}, Lcom/larvalabs/svgandroid/SVGParser;->a(Ljava/lang/String;Lorg/xml/sax/Attributes;Ljava/lang/Float;)Ljava/lang/Float;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    iput p1, v0, Lcom/larvalabs/svgandroid/SVGParser$a;->e:F

    const-string p1, "y2"

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-static {p1, p2, v1}, Lcom/larvalabs/svgandroid/SVGParser;->a(Ljava/lang/String;Lorg/xml/sax/Attributes;Ljava/lang/Float;)Ljava/lang/Float;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    iput p1, v0, Lcom/larvalabs/svgandroid/SVGParser$a;->g:F

    goto :goto_0

    :cond_0
    const-string p1, "cx"

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-static {p1, p2, v2}, Lcom/larvalabs/svgandroid/SVGParser;->a(Ljava/lang/String;Lorg/xml/sax/Attributes;Ljava/lang/Float;)Ljava/lang/Float;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    iput p1, v0, Lcom/larvalabs/svgandroid/SVGParser$a;->h:F

    const-string p1, "cy"

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    invoke-static {p1, p2, v2}, Lcom/larvalabs/svgandroid/SVGParser;->a(Ljava/lang/String;Lorg/xml/sax/Attributes;Ljava/lang/Float;)Ljava/lang/Float;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    iput p1, v0, Lcom/larvalabs/svgandroid/SVGParser$a;->i:F

    const-string p1, "r"

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-static {p1, p2, v1}, Lcom/larvalabs/svgandroid/SVGParser;->a(Ljava/lang/String;Lorg/xml/sax/Attributes;Ljava/lang/Float;)Ljava/lang/Float;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    iput p1, v0, Lcom/larvalabs/svgandroid/SVGParser$a;->j:F

    :goto_0
    const-string p1, "gradientTransform"

    invoke-static {p1, p2}, Lcom/larvalabs/svgandroid/SVGParser;->a(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-static {p1}, Lcom/larvalabs/svgandroid/SVGParser;->b(Ljava/lang/String;)Landroid/graphics/Matrix;

    move-result-object p1

    iput-object p1, v0, Lcom/larvalabs/svgandroid/SVGParser$a;->m:Landroid/graphics/Matrix;

    :cond_1
    const-string p1, "href"

    invoke-static {p1, p2}, Lcom/larvalabs/svgandroid/SVGParser;->a(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_3

    const-string p2, "#"

    invoke-virtual {p1, p2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_2

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    :cond_2
    iput-object p1, v0, Lcom/larvalabs/svgandroid/SVGParser$a;->b:Ljava/lang/String;

    :cond_3
    return-object v0
.end method

.method private a(FF)V
    .locals 1

    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->f:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    cmpg-float v0, p1, v0

    if-gez v0, :cond_0

    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->f:Landroid/graphics/RectF;

    iput p1, v0, Landroid/graphics/RectF;->left:F

    :cond_0
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->f:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->right:F

    cmpl-float v0, p1, v0

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->f:Landroid/graphics/RectF;

    iput p1, v0, Landroid/graphics/RectF;->right:F

    :cond_1
    iget-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->f:Landroid/graphics/RectF;

    iget p1, p1, Landroid/graphics/RectF;->top:F

    cmpg-float p1, p2, p1

    if-gez p1, :cond_2

    iget-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->f:Landroid/graphics/RectF;

    iput p2, p1, Landroid/graphics/RectF;->top:F

    :cond_2
    iget-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->f:Landroid/graphics/RectF;

    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    cmpl-float p1, p2, p1

    if-lez p1, :cond_3

    iget-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->f:Landroid/graphics/RectF;

    iput p2, p1, Landroid/graphics/RectF;->bottom:F

    :cond_3
    return-void
.end method

.method private a(FFFF)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/larvalabs/svgandroid/SVGParser$e;->a(FF)V

    add-float/2addr p1, p3

    add-float/2addr p2, p4

    invoke-direct {p0, p1, p2}, Lcom/larvalabs/svgandroid/SVGParser$e;->a(FF)V

    return-void
.end method

.method private a(Landroid/graphics/Path;)V
    .locals 2

    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->d:Landroid/graphics/RectF;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    iget-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->d:Landroid/graphics/RectF;

    iget p1, p1, Landroid/graphics/RectF;->left:F

    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->d:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->top:F

    invoke-direct {p0, p1, v0}, Lcom/larvalabs/svgandroid/SVGParser$e;->a(FF)V

    iget-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->d:Landroid/graphics/RectF;

    iget p1, p1, Landroid/graphics/RectF;->right:F

    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->d:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    invoke-direct {p0, p1, v0}, Lcom/larvalabs/svgandroid/SVGParser$e;->a(FF)V

    return-void
.end method

.method private a(Lorg/xml/sax/Attributes;)V
    .locals 1

    const-string v0, "transform"

    invoke-static {v0, p1}, Lcom/larvalabs/svgandroid/SVGParser;->a(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->i:Z

    iget-boolean v0, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->i:Z

    if-eqz v0, :cond_1

    invoke-static {p1}, Lcom/larvalabs/svgandroid/SVGParser;->b(Ljava/lang/String;)Landroid/graphics/Matrix;

    move-result-object p1

    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->b:Landroid/graphics/Canvas;

    invoke-virtual {v0}, Landroid/graphics/Canvas;->save()I

    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->b:Landroid/graphics/Canvas;

    invoke-virtual {v0, p1}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    :cond_1
    return-void
.end method

.method private a(Lcom/larvalabs/svgandroid/SVGParser$d;Lcom/larvalabs/svgandroid/SVGParser$f;)Z
    .locals 4

    const-string v0, "SVGAndroid"

    const-string v1, "doStroke : IN"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "none"

    const-string v1, "display"

    invoke-virtual {p1, v1}, Lcom/larvalabs/svgandroid/SVGParser$d;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->h:Lcom/larvalabs/svgandroid/SVGParser$c;

    invoke-static {v0}, Lcom/larvalabs/svgandroid/SVGParser$c;->d(Lcom/larvalabs/svgandroid/SVGParser$c;)Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    iget-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->h:Lcom/larvalabs/svgandroid/SVGParser$c;

    invoke-static {p1}, Lcom/larvalabs/svgandroid/SVGParser$c;->e(Lcom/larvalabs/svgandroid/SVGParser$c;)I

    move-result p1

    invoke-virtual {p2, p1}, Lcom/larvalabs/svgandroid/SVGParser$f;->b(I)V

    iget-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->h:Lcom/larvalabs/svgandroid/SVGParser$c;

    invoke-static {p1}, Lcom/larvalabs/svgandroid/SVGParser$c;->f(Lcom/larvalabs/svgandroid/SVGParser$c;)F

    move-result p1

    invoke-virtual {p2, p1}, Lcom/larvalabs/svgandroid/SVGParser$f;->a(F)V

    return v2

    :cond_1
    const-string v0, "stroke"

    invoke-virtual {p1, v0}, Lcom/larvalabs/svgandroid/SVGParser$d;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    const-string v3, "none"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {p2, v1}, Lcom/larvalabs/svgandroid/SVGParser$f;->b(Lcom/larvalabs/svgandroid/SVGParser$f;Z)Z

    return v2

    :cond_2
    const-string v0, "stroke"

    invoke-virtual {p1, v0}, Lcom/larvalabs/svgandroid/SVGParser$d;->d(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_a

    invoke-direct {p0, p1, v0, v1}, Lcom/larvalabs/svgandroid/SVGParser$e;->a(Lcom/larvalabs/svgandroid/SVGParser$d;Ljava/lang/Integer;Z)I

    move-result v0

    invoke-virtual {p2, v0}, Lcom/larvalabs/svgandroid/SVGParser$f;->b(I)V

    const-string v0, "stroke-width"

    invoke-virtual {p1, v0}, Lcom/larvalabs/svgandroid/SVGParser$d;->e(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-virtual {p2, v0}, Lcom/larvalabs/svgandroid/SVGParser$f;->a(F)V

    :cond_3
    const-string v0, "stroke-linecap"

    invoke-virtual {p1, v0}, Lcom/larvalabs/svgandroid/SVGParser$d;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "round"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    sget-object v0, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {p2, v0}, Lcom/larvalabs/svgandroid/SVGParser$f;->a(Landroid/graphics/Paint$Cap;)V

    goto :goto_0

    :cond_4
    const-string v1, "square"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    sget-object v0, Landroid/graphics/Paint$Cap;->SQUARE:Landroid/graphics/Paint$Cap;

    invoke-virtual {p2, v0}, Lcom/larvalabs/svgandroid/SVGParser$f;->a(Landroid/graphics/Paint$Cap;)V

    goto :goto_0

    :cond_5
    const-string v1, "butt"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    sget-object v0, Landroid/graphics/Paint$Cap;->BUTT:Landroid/graphics/Paint$Cap;

    invoke-virtual {p2, v0}, Lcom/larvalabs/svgandroid/SVGParser$f;->a(Landroid/graphics/Paint$Cap;)V

    :cond_6
    :goto_0
    const-string v0, "stroke-linejoin"

    invoke-virtual {p1, v0}, Lcom/larvalabs/svgandroid/SVGParser$d;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "miter"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    sget-object p1, Landroid/graphics/Paint$Join;->MITER:Landroid/graphics/Paint$Join;

    invoke-virtual {p2, p1}, Lcom/larvalabs/svgandroid/SVGParser$f;->a(Landroid/graphics/Paint$Join;)V

    goto :goto_1

    :cond_7
    const-string v0, "round"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    sget-object p1, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {p2, p1}, Lcom/larvalabs/svgandroid/SVGParser$f;->a(Landroid/graphics/Paint$Join;)V

    goto :goto_1

    :cond_8
    const-string v0, "bevel"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_9

    sget-object p1, Landroid/graphics/Paint$Join;->BEVEL:Landroid/graphics/Paint$Join;

    invoke-virtual {p2, p1}, Lcom/larvalabs/svgandroid/SVGParser$f;->a(Landroid/graphics/Paint$Join;)V

    :cond_9
    :goto_1
    return v2

    :cond_a
    return v1
.end method

.method private a(Lcom/larvalabs/svgandroid/SVGParser$d;Ljava/util/HashMap;Lcom/larvalabs/svgandroid/SVGParser$f;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/larvalabs/svgandroid/SVGParser$d;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroid/graphics/Shader;",
            ">;",
            "Lcom/larvalabs/svgandroid/SVGParser$f;",
            ")Z"
        }
    .end annotation

    const-string v0, "SVGAndroid"

    const-string v1, "doFill : IN"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "none"

    const-string v1, "display"

    invoke-virtual {p1, v1}, Lcom/larvalabs/svgandroid/SVGParser$d;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    const-string v0, "fill-rule"

    invoke-virtual {p1, v0}, Lcom/larvalabs/svgandroid/SVGParser$d;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    const-string v2, "nonzero"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    sget-object v0, Landroid/graphics/Path$FillType;->WINDING:Landroid/graphics/Path$FillType;

    invoke-virtual {p3, v0}, Lcom/larvalabs/svgandroid/SVGParser$f;->a(Landroid/graphics/Path$FillType;)V

    goto :goto_0

    :cond_1
    const-string v2, "evenodd"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    sget-object v0, Landroid/graphics/Path$FillType;->EVEN_ODD:Landroid/graphics/Path$FillType;

    invoke-virtual {p3, v0}, Lcom/larvalabs/svgandroid/SVGParser$f;->a(Landroid/graphics/Path$FillType;)V

    :cond_2
    :goto_0
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->h:Lcom/larvalabs/svgandroid/SVGParser$c;

    invoke-static {v0}, Lcom/larvalabs/svgandroid/SVGParser$c;->b(Lcom/larvalabs/svgandroid/SVGParser$c;)Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_3

    iget-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->h:Lcom/larvalabs/svgandroid/SVGParser$c;

    invoke-static {p1}, Lcom/larvalabs/svgandroid/SVGParser$c;->c(Lcom/larvalabs/svgandroid/SVGParser$c;)I

    move-result p1

    invoke-virtual {p3, p1}, Lcom/larvalabs/svgandroid/SVGParser$f;->a(I)V

    return v2

    :cond_3
    const-string v0, "fill"

    invoke-virtual {p1, v0}, Lcom/larvalabs/svgandroid/SVGParser$d;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_5

    const-string v3, "url(#"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5

    const-string p1, "SVGAndroid"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "doFill :   gradient>>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string p1, "url(#"

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    sub-int/2addr v3, v2

    invoke-virtual {v0, p1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/Shader;

    if-eqz p1, :cond_4

    invoke-virtual {p3, p1}, Lcom/larvalabs/svgandroid/SVGParser$f;->a(Landroid/graphics/Shader;)V

    return v2

    :cond_4
    return v1

    :cond_5
    if-eqz v0, :cond_6

    const-string p2, "none"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_6

    const-string p1, "SVGAndroid"

    const-string p2, "doFill :   none"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p3, v1}, Lcom/larvalabs/svgandroid/SVGParser$f;->a(Lcom/larvalabs/svgandroid/SVGParser$f;Z)Z

    goto :goto_1

    :cond_6
    const-string p2, "fill"

    invoke-virtual {p1, p2}, Lcom/larvalabs/svgandroid/SVGParser$d;->d(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object p2

    if-eqz p2, :cond_7

    const-string v0, "SVGAndroid"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "doFill :   c="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-static {v3}, Lcom/nexstreaming/app/common/util/c;->a(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0, p1, p2, v2}, Lcom/larvalabs/svgandroid/SVGParser$e;->a(Lcom/larvalabs/svgandroid/SVGParser$d;Ljava/lang/Integer;Z)I

    move-result p1

    invoke-virtual {p3, p1}, Lcom/larvalabs/svgandroid/SVGParser$f;->a(I)V

    return v2

    :cond_7
    const-string p2, "fill"

    invoke-virtual {p1, p2}, Lcom/larvalabs/svgandroid/SVGParser$d;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    if-nez p2, :cond_8

    const-string p2, "stroke"

    invoke-virtual {p1, p2}, Lcom/larvalabs/svgandroid/SVGParser$d;->c(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_8

    const-string p1, "SVGAndroid"

    const-string p2, "doFill :   no fill & no stroke"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    :cond_8
    :goto_1
    const-string p1, "SVGAndroid"

    const-string p2, "doFill :   no fill"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v1
.end method

.method private b()V
    .locals 1

    iget-boolean v0, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->i:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->b:Landroid/graphics/Canvas;

    invoke-virtual {v0}, Landroid/graphics/Canvas;->restore()V

    :cond_0
    return-void
.end method


# virtual methods
.method public a()Lcom/larvalabs/svgandroid/SVGParser$c;
    .locals 1

    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->h:Lcom/larvalabs/svgandroid/SVGParser$c;

    return-object v0
.end method

.method public characters([CII)V
    .locals 0

    return-void
.end method

.method public endDocument()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    return-void
.end method

.method public endElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    const-string p1, "svg"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->a:Landroid/graphics/Picture;

    invoke-virtual {p1}, Landroid/graphics/Picture;->endRecording()V

    goto/16 :goto_4

    :cond_0
    const-string p1, "linearGradient"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    const/4 p3, 0x0

    if-eqz p1, :cond_6

    iget-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    iget-object p1, p1, Lcom/larvalabs/svgandroid/SVGParser$a;->a:Ljava/lang/String;

    if-eqz p1, :cond_e

    iget-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    iget-object p1, p1, Lcom/larvalabs/svgandroid/SVGParser$a;->b:Ljava/lang/String;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->k:Ljava/util/HashMap;

    iget-object p2, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    iget-object p2, p2, Lcom/larvalabs/svgandroid/SVGParser$a;->b:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/larvalabs/svgandroid/SVGParser$a;

    if-eqz p1, :cond_1

    iget-object p2, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    invoke-virtual {p1, p2}, Lcom/larvalabs/svgandroid/SVGParser$a;->a(Lcom/larvalabs/svgandroid/SVGParser$a;)Lcom/larvalabs/svgandroid/SVGParser$a;

    move-result-object p1

    iput-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    :cond_1
    iget-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    iget-object p1, p1, Lcom/larvalabs/svgandroid/SVGParser$a;->l:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    new-array v5, p1, [I

    const/4 p1, 0x0

    :goto_0
    array-length p2, v5

    if-ge p1, p2, :cond_2

    iget-object p2, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    iget-object p2, p2, Lcom/larvalabs/svgandroid/SVGParser$a;->l:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    aput p2, v5, p1

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    iget-object p1, p1, Lcom/larvalabs/svgandroid/SVGParser$a;->k:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    new-array v6, p1, [F

    :goto_1
    array-length p1, v6

    if-ge p3, p1, :cond_3

    iget-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    iget-object p1, p1, Lcom/larvalabs/svgandroid/SVGParser$a;->k:Ljava/util/ArrayList;

    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    aput p1, v6, p3

    add-int/lit8 p3, p3, 0x1

    goto :goto_1

    :cond_3
    array-length p1, v5

    if-nez p1, :cond_4

    const-string p1, "BAD"

    const-string p2, "BAD"

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_4
    new-instance p1, Landroid/graphics/LinearGradient;

    iget-object p2, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    iget v1, p2, Lcom/larvalabs/svgandroid/SVGParser$a;->d:F

    iget-object p2, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    iget v2, p2, Lcom/larvalabs/svgandroid/SVGParser$a;->e:F

    iget-object p2, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    iget v3, p2, Lcom/larvalabs/svgandroid/SVGParser$a;->f:F

    iget-object p2, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    iget v4, p2, Lcom/larvalabs/svgandroid/SVGParser$a;->g:F

    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    move-object v0, p1

    invoke-direct/range {v0 .. v7}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    iget-object p2, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    iget-object p2, p2, Lcom/larvalabs/svgandroid/SVGParser$a;->m:Landroid/graphics/Matrix;

    if-eqz p2, :cond_5

    iget-object p2, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    iget-object p2, p2, Lcom/larvalabs/svgandroid/SVGParser$a;->m:Landroid/graphics/Matrix;

    invoke-virtual {p1, p2}, Landroid/graphics/LinearGradient;->setLocalMatrix(Landroid/graphics/Matrix;)V

    :cond_5
    iget-object p2, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->j:Ljava/util/HashMap;

    iget-object p3, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    iget-object p3, p3, Lcom/larvalabs/svgandroid/SVGParser$a;->a:Ljava/lang/String;

    invoke-virtual {p2, p3, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->k:Ljava/util/HashMap;

    iget-object p2, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    iget-object p2, p2, Lcom/larvalabs/svgandroid/SVGParser$a;->a:Ljava/lang/String;

    iget-object p3, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    invoke-virtual {p1, p2, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_4

    :cond_6
    const-string p1, "radialGradient"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_c

    iget-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    iget-object p1, p1, Lcom/larvalabs/svgandroid/SVGParser$a;->a:Ljava/lang/String;

    if-eqz p1, :cond_e

    iget-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    iget-object p1, p1, Lcom/larvalabs/svgandroid/SVGParser$a;->b:Ljava/lang/String;

    if-eqz p1, :cond_7

    iget-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->k:Ljava/util/HashMap;

    iget-object p2, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    iget-object p2, p2, Lcom/larvalabs/svgandroid/SVGParser$a;->b:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/larvalabs/svgandroid/SVGParser$a;

    if-eqz p1, :cond_7

    iget-object p2, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    invoke-virtual {p1, p2}, Lcom/larvalabs/svgandroid/SVGParser$a;->a(Lcom/larvalabs/svgandroid/SVGParser$a;)Lcom/larvalabs/svgandroid/SVGParser$a;

    move-result-object p1

    iput-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    :cond_7
    iget-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    iget-object p1, p1, Lcom/larvalabs/svgandroid/SVGParser$a;->l:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    new-array v4, p1, [I

    const/4 p1, 0x0

    :goto_2
    array-length p2, v4

    if-ge p1, p2, :cond_8

    iget-object p2, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    iget-object p2, p2, Lcom/larvalabs/svgandroid/SVGParser$a;->l:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    aput p2, v4, p1

    add-int/lit8 p1, p1, 0x1

    goto :goto_2

    :cond_8
    iget-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    iget-object p1, p1, Lcom/larvalabs/svgandroid/SVGParser$a;->k:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    new-array v5, p1, [F

    :goto_3
    array-length p1, v5

    if-ge p3, p1, :cond_9

    iget-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    iget-object p1, p1, Lcom/larvalabs/svgandroid/SVGParser$a;->k:Ljava/util/ArrayList;

    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    aput p1, v5, p3

    add-int/lit8 p3, p3, 0x1

    goto :goto_3

    :cond_9
    iget-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    iget-object p1, p1, Lcom/larvalabs/svgandroid/SVGParser$a;->b:Ljava/lang/String;

    if-eqz p1, :cond_a

    iget-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->k:Ljava/util/HashMap;

    iget-object p2, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    iget-object p2, p2, Lcom/larvalabs/svgandroid/SVGParser$a;->b:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/larvalabs/svgandroid/SVGParser$a;

    if-eqz p1, :cond_a

    iget-object p2, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    invoke-virtual {p1, p2}, Lcom/larvalabs/svgandroid/SVGParser$a;->a(Lcom/larvalabs/svgandroid/SVGParser$a;)Lcom/larvalabs/svgandroid/SVGParser$a;

    move-result-object p1

    iput-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    :cond_a
    new-instance p1, Landroid/graphics/RadialGradient;

    iget-object p2, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    iget v1, p2, Lcom/larvalabs/svgandroid/SVGParser$a;->h:F

    iget-object p2, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    iget v2, p2, Lcom/larvalabs/svgandroid/SVGParser$a;->i:F

    iget-object p2, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    iget v3, p2, Lcom/larvalabs/svgandroid/SVGParser$a;->j:F

    sget-object v6, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    move-object v0, p1

    invoke-direct/range {v0 .. v6}, Landroid/graphics/RadialGradient;-><init>(FFF[I[FLandroid/graphics/Shader$TileMode;)V

    iget-object p2, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    iget-object p2, p2, Lcom/larvalabs/svgandroid/SVGParser$a;->m:Landroid/graphics/Matrix;

    if-eqz p2, :cond_b

    iget-object p2, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    iget-object p2, p2, Lcom/larvalabs/svgandroid/SVGParser$a;->m:Landroid/graphics/Matrix;

    invoke-virtual {p1, p2}, Landroid/graphics/RadialGradient;->setLocalMatrix(Landroid/graphics/Matrix;)V

    :cond_b
    iget-object p2, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->j:Ljava/util/HashMap;

    iget-object p3, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    iget-object p3, p3, Lcom/larvalabs/svgandroid/SVGParser$a;->a:Ljava/lang/String;

    invoke-virtual {p2, p3, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->k:Ljava/util/HashMap;

    iget-object p2, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    iget-object p2, p2, Lcom/larvalabs/svgandroid/SVGParser$a;->a:Ljava/lang/String;

    iget-object p3, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    invoke-virtual {p1, p2, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4

    :cond_c
    const-string p1, "g"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_e

    iget-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->g:Ljava/util/Deque;

    invoke-interface {p1}, Ljava/util/Deque;->pop()Ljava/lang/Object;

    iget-boolean p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->o:Z

    if-eqz p1, :cond_d

    iput-boolean p3, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->o:Z

    :cond_d
    iget-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->b:Landroid/graphics/Canvas;

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    iget-boolean p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->m:Z

    if-eqz p1, :cond_e

    iget p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->n:I

    add-int/lit8 p1, p1, -0x1

    iput p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->n:I

    iget p1, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->n:I

    if-nez p1, :cond_e

    iput-boolean p3, p0, Lcom/larvalabs/svgandroid/SVGParser$e;->m:Z

    :cond_e
    :goto_4
    return-void
.end method

.method public startDocument()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    return-void
.end method

.method public startElement(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/xml/sax/Attributes;)V
    .locals 21
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xml/sax/SAXException;
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p4

    const-string v3, "SVGAndroid"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "startElement : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " atts="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p4 .. p4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-boolean v3, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->o:Z

    const/4 v4, 0x0

    if-eqz v3, :cond_3

    const-string v3, "rect"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "x"

    invoke-static {v1, v2}, Lcom/larvalabs/svgandroid/SVGParser;->b(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v1

    if-nez v1, :cond_0

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    :cond_0
    const-string v3, "y"

    invoke-static {v3, v2}, Lcom/larvalabs/svgandroid/SVGParser;->b(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v3

    if-nez v3, :cond_1

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    :cond_1
    const-string v4, "width"

    invoke-static {v4, v2}, Lcom/larvalabs/svgandroid/SVGParser;->b(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v4

    const-string v5, "height"

    invoke-static {v5, v2}, Lcom/larvalabs/svgandroid/SVGParser;->b(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    new-instance v2, Landroid/graphics/RectF;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v5

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v6

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v7

    add-float/2addr v1, v7

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    add-float/2addr v3, v4

    invoke-direct {v2, v5, v6, v1, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object v2, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->e:Landroid/graphics/RectF;

    :cond_2
    return-void

    :cond_3
    const-string v3, "svg"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v7, 0x1

    if-eqz v3, :cond_8

    const-string v1, "width"

    invoke-static {v1, v2}, Lcom/larvalabs/svgandroid/SVGParser;->b(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v1

    const-string v3, "height"

    invoke-static {v3, v2}, Lcom/larvalabs/svgandroid/SVGParser;->b(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v3

    if-eqz v1, :cond_5

    if-nez v3, :cond_4

    goto :goto_1

    :cond_4
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    float-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v1

    double-to-int v1, v1

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v2

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-int v2, v2

    const-string v3, "SVGAndroid"

    const-string v5, "Used width, height"

    invoke-static {v3, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    const/4 v3, 0x0

    goto/16 :goto_3

    :cond_5
    :goto_1
    const-string v1, "viewBox"

    invoke-static {v1, v2}, Lcom/larvalabs/svgandroid/SVGParser;->a(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x64

    if-nez v1, :cond_6

    const-string v1, "SVGHandler"

    const-string v3, "Missing SVG bounds! Defaulting to 100x100"

    invoke-static {v1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_2
    const/16 v1, 0x64

    goto :goto_0

    :cond_6
    invoke-static {v1}, Lcom/larvalabs/svgandroid/SVGParser;->a(Ljava/lang/String;)Lcom/larvalabs/svgandroid/SVGParser$b;

    move-result-object v1

    invoke-static {v1}, Lcom/larvalabs/svgandroid/SVGParser$b;->a(Lcom/larvalabs/svgandroid/SVGParser$b;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v8, 0x4

    if-ge v3, v8, :cond_7

    const-string v1, "SVGHandler"

    const-string v3, "Malformed SVG bounds! Defaulting to 100x100"

    invoke-static {v1, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    :cond_7
    invoke-static {v1}, Lcom/larvalabs/svgandroid/SVGParser$b;->a(Lcom/larvalabs/svgandroid/SVGParser$b;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-static {v1}, Lcom/larvalabs/svgandroid/SVGParser$b;->a(Lcom/larvalabs/svgandroid/SVGParser$b;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-static {v1}, Lcom/larvalabs/svgandroid/SVGParser$b;->a(Lcom/larvalabs/svgandroid/SVGParser$b;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Float;

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    float-to-double v4, v4

    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v4

    double-to-int v4, v4

    invoke-static {v1}, Lcom/larvalabs/svgandroid/SVGParser$b;->a(Lcom/larvalabs/svgandroid/SVGParser$b;)Ljava/util/ArrayList;

    move-result-object v1

    const/4 v5, 0x3

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    float-to-double v5, v1

    invoke-static {v5, v6}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v5

    double-to-int v1, v5

    const-string v5, "SVGAndroid"

    const-string v6, "Used viewBox"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move/from16 v20, v2

    move v2, v1

    move v1, v4

    move/from16 v4, v20

    :goto_3
    const-string v5, "SVGAndroid"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "BEGIN REC: dx,dy="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v7, ","

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v7, "  w,h="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v7, ","

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v5, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->a:Landroid/graphics/Picture;

    invoke-virtual {v5, v1, v2}, Landroid/graphics/Picture;->beginRecording(II)Landroid/graphics/Canvas;

    move-result-object v1

    iput-object v1, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->b:Landroid/graphics/Canvas;

    iget-object v1, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->b:Landroid/graphics/Canvas;

    invoke-virtual {v1, v4, v3}, Landroid/graphics/Canvas;->translate(FF)V

    goto/16 :goto_c

    :cond_8
    const-string v3, "defs"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    goto/16 :goto_c

    :cond_9
    const-string v3, "linearGradient"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a

    invoke-direct {v0, v7, v2}, Lcom/larvalabs/svgandroid/SVGParser$e;->a(ZLorg/xml/sax/Attributes;)Lcom/larvalabs/svgandroid/SVGParser$a;

    move-result-object v1

    iput-object v1, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    goto/16 :goto_c

    :cond_a
    const-string v3, "radialGradient"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    invoke-direct {v0, v6, v2}, Lcom/larvalabs/svgandroid/SVGParser$e;->a(ZLorg/xml/sax/Attributes;)Lcom/larvalabs/svgandroid/SVGParser$a;

    move-result-object v1

    iput-object v1, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    goto/16 :goto_c

    :cond_b
    const-string v3, "stop"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/high16 v8, 0x437f0000    # 255.0f

    const/16 v9, 0xff

    const/4 v10, 0x0

    if-eqz v3, :cond_11

    iget-object v1, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    if-eqz v1, :cond_32

    const-string v1, "offset"

    invoke-static {v1, v2}, Lcom/larvalabs/svgandroid/SVGParser;->b(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    const-string v3, "style"

    invoke-static {v3, v2}, Lcom/larvalabs/svgandroid/SVGParser;->a(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/String;

    new-instance v3, Lcom/larvalabs/svgandroid/SVGParser$d;

    invoke-direct {v3, v2, v10}, Lcom/larvalabs/svgandroid/SVGParser$d;-><init>(Lorg/xml/sax/Attributes;Lcom/larvalabs/svgandroid/SVGParser$1;)V

    const-string v2, "stop-color"

    invoke-virtual {v3, v2}, Lcom/larvalabs/svgandroid/SVGParser$d;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const/high16 v4, -0x1000000

    if-eqz v2, :cond_d

    const-string v5, "#"

    invoke-virtual {v2, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    const/16 v6, 0x10

    if-eqz v5, :cond_c

    invoke-virtual {v2, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v2

    goto :goto_4

    :cond_c
    invoke-static {v2, v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v2

    goto :goto_4

    :cond_d
    const/high16 v2, -0x1000000

    :goto_4
    const-string v5, "stop-opacity"

    invoke-virtual {v3, v5}, Lcom/larvalabs/svgandroid/SVGParser$d;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_f

    invoke-static {v3}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v3

    mul-float v3, v3, v8

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    if-le v3, v9, :cond_e

    const/16 v3, 0xff

    :cond_e
    shl-int/lit8 v3, v3, 0x18

    or-int/2addr v2, v3

    goto :goto_5

    :cond_f
    or-int/2addr v2, v4

    :goto_5
    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    iget-object v3, v3, Lcom/larvalabs/svgandroid/SVGParser$a;->k:Ljava/util/ArrayList;

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v1, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->h:Lcom/larvalabs/svgandroid/SVGParser$c;

    invoke-static {v1}, Lcom/larvalabs/svgandroid/SVGParser$c;->a(Lcom/larvalabs/svgandroid/SVGParser$c;)Ljava/util/Set;

    move-result-object v1

    if-eqz v1, :cond_10

    iget-object v1, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->h:Lcom/larvalabs/svgandroid/SVGParser$c;

    invoke-static {v1}, Lcom/larvalabs/svgandroid/SVGParser$c;->a(Lcom/larvalabs/svgandroid/SVGParser$c;)Ljava/util/Set;

    move-result-object v1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_10
    iget-object v1, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->h:Lcom/larvalabs/svgandroid/SVGParser$c;

    invoke-static {v1, v2}, Lcom/larvalabs/svgandroid/SVGParser$c;->a(Lcom/larvalabs/svgandroid/SVGParser$c;I)I

    move-result v1

    iget-object v2, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->l:Lcom/larvalabs/svgandroid/SVGParser$a;

    iget-object v2, v2, Lcom/larvalabs/svgandroid/SVGParser$a;->l:Ljava/util/ArrayList;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_c

    :cond_11
    const-string v3, "g"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_17

    const-string v1, "bounds"

    const-string v3, "id"

    invoke-static {v3, v2}, Lcom/larvalabs/svgandroid/SVGParser;->a(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_12

    iput-boolean v7, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->o:Z

    :cond_12
    iget-boolean v1, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->m:Z

    if-eqz v1, :cond_13

    iget v1, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->n:I

    add-int/2addr v1, v7

    iput v1, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->n:I

    :cond_13
    new-instance v1, Lcom/larvalabs/svgandroid/SVGParser$f;

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->g:Ljava/util/Deque;

    invoke-interface {v3}, Ljava/util/Deque;->peek()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/larvalabs/svgandroid/SVGParser$f;

    invoke-direct {v1, v3}, Lcom/larvalabs/svgandroid/SVGParser$f;-><init>(Lcom/larvalabs/svgandroid/SVGParser$f;)V

    new-instance v3, Lcom/larvalabs/svgandroid/SVGParser$d;

    invoke-direct {v3, v2, v10}, Lcom/larvalabs/svgandroid/SVGParser$d;-><init>(Lorg/xml/sax/Attributes;Lcom/larvalabs/svgandroid/SVGParser$1;)V

    const-string v4, "opacity"

    invoke-virtual {v3, v4}, Lcom/larvalabs/svgandroid/SVGParser$d;->e(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v4

    if-nez v4, :cond_14

    const/16 v4, 0xff

    goto :goto_6

    :cond_14
    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    mul-float v4, v4, v8

    float-to-int v4, v4

    invoke-static {v9, v4}, Ljava/lang/Math;->min(II)I

    move-result v4

    invoke-static {v6, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    :goto_6
    if-ge v4, v9, :cond_15

    if-lez v4, :cond_15

    iget-object v5, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->b:Landroid/graphics/Canvas;

    const/16 v6, 0x1f

    invoke-virtual {v5, v10, v4, v6}, Landroid/graphics/Canvas;->saveLayerAlpha(Landroid/graphics/RectF;II)I

    const-string v5, "opacity"

    invoke-virtual {v3, v5}, Lcom/larvalabs/svgandroid/SVGParser$d;->a(Ljava/lang/String;)V

    goto :goto_7

    :cond_15
    iget-object v5, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->b:Landroid/graphics/Canvas;

    invoke-virtual {v5}, Landroid/graphics/Canvas;->save()I

    :goto_7
    iget-object v5, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->j:Ljava/util/HashMap;

    invoke-direct {v0, v3, v5, v1}, Lcom/larvalabs/svgandroid/SVGParser$e;->a(Lcom/larvalabs/svgandroid/SVGParser$d;Ljava/util/HashMap;Lcom/larvalabs/svgandroid/SVGParser$f;)Z

    invoke-direct {v0, v3, v1}, Lcom/larvalabs/svgandroid/SVGParser$e;->a(Lcom/larvalabs/svgandroid/SVGParser$d;Lcom/larvalabs/svgandroid/SVGParser$f;)Z

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->g:Ljava/util/Deque;

    invoke-interface {v3, v1}, Ljava/util/Deque;->push(Ljava/lang/Object;)V

    if-lez v4, :cond_16

    const-string v1, "none"

    const-string v3, "display"

    invoke-static {v3, v2}, Lcom/larvalabs/svgandroid/SVGParser;->a(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_32

    :cond_16
    iget-boolean v1, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->m:Z

    if-nez v1, :cond_32

    iput-boolean v7, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->m:Z

    iput v7, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->n:I

    goto/16 :goto_c

    :cond_17
    iget-boolean v3, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->m:Z

    if-nez v3, :cond_21

    const-string v3, "rect"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_21

    const-string v1, "x"

    invoke-static {v1, v2}, Lcom/larvalabs/svgandroid/SVGParser;->b(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v1

    if-nez v1, :cond_18

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    :cond_18
    const-string v3, "y"

    invoke-static {v3, v2}, Lcom/larvalabs/svgandroid/SVGParser;->b(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v3

    if-nez v3, :cond_19

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    :cond_19
    const-string v5, "rx"

    invoke-static {v5, v2}, Lcom/larvalabs/svgandroid/SVGParser;->b(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v5

    const-string v6, "ry"

    invoke-static {v6, v2}, Lcom/larvalabs/svgandroid/SVGParser;->b(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v6

    if-nez v5, :cond_1a

    if-nez v6, :cond_1a

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    goto :goto_8

    :cond_1a
    if-nez v5, :cond_1b

    move-object v5, v6

    goto :goto_8

    :cond_1b
    if-nez v6, :cond_1c

    move-object v6, v5

    :cond_1c
    :goto_8
    const-string v7, "width"

    invoke-static {v7, v2}, Lcom/larvalabs/svgandroid/SVGParser;->b(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v7

    const-string v8, "height"

    invoke-static {v8, v2}, Lcom/larvalabs/svgandroid/SVGParser;->b(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v8

    invoke-direct {v0, v2}, Lcom/larvalabs/svgandroid/SVGParser$e;->a(Lorg/xml/sax/Attributes;)V

    new-instance v9, Lcom/larvalabs/svgandroid/SVGParser$d;

    invoke-direct {v9, v2, v10}, Lcom/larvalabs/svgandroid/SVGParser$d;-><init>(Lorg/xml/sax/Attributes;Lcom/larvalabs/svgandroid/SVGParser$1;)V

    new-instance v2, Lcom/larvalabs/svgandroid/SVGParser$f;

    iget-object v10, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->g:Ljava/util/Deque;

    invoke-interface {v10}, Ljava/util/Deque;->peek()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/larvalabs/svgandroid/SVGParser$f;

    invoke-direct {v2, v10}, Lcom/larvalabs/svgandroid/SVGParser$f;-><init>(Lcom/larvalabs/svgandroid/SVGParser$f;)V

    iget-object v10, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->j:Ljava/util/HashMap;

    invoke-direct {v0, v9, v10, v2}, Lcom/larvalabs/svgandroid/SVGParser$e;->a(Lcom/larvalabs/svgandroid/SVGParser$d;Ljava/util/HashMap;Lcom/larvalabs/svgandroid/SVGParser$f;)Z

    invoke-direct {v0, v9, v2}, Lcom/larvalabs/svgandroid/SVGParser$e;->a(Lcom/larvalabs/svgandroid/SVGParser$d;Lcom/larvalabs/svgandroid/SVGParser$f;)Z

    iget-object v9, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->c:Landroid/graphics/Paint;

    invoke-virtual {v2, v9}, Lcom/larvalabs/svgandroid/SVGParser$f;->a(Landroid/graphics/Paint;)Z

    move-result v9

    if-eqz v9, :cond_1e

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v9

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v10

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v11

    invoke-virtual {v8}, Ljava/lang/Float;->floatValue()F

    move-result v12

    invoke-direct {v0, v9, v10, v11, v12}, Lcom/larvalabs/svgandroid/SVGParser$e;->a(FFFF)V

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v9

    cmpl-float v9, v9, v4

    if-lez v9, :cond_1d

    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    move-result v9

    cmpl-float v9, v9, v4

    if-lez v9, :cond_1d

    iget-object v9, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->b:Landroid/graphics/Canvas;

    new-instance v10, Landroid/graphics/RectF;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v11

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v12

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v13

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v14

    add-float/2addr v13, v14

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v14

    invoke-virtual {v8}, Ljava/lang/Float;->floatValue()F

    move-result v15

    add-float/2addr v14, v15

    invoke-direct {v10, v11, v12, v13, v14}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v11

    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    move-result v12

    iget-object v13, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->c:Landroid/graphics/Paint;

    invoke-virtual {v9, v10, v11, v12, v13}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    goto :goto_9

    :cond_1d
    iget-object v14, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->b:Landroid/graphics/Canvas;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v15

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v16

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v9

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v10

    add-float v17, v9, v10

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v9

    invoke-virtual {v8}, Ljava/lang/Float;->floatValue()F

    move-result v10

    add-float v18, v9, v10

    iget-object v9, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->c:Landroid/graphics/Paint;

    move-object/from16 v19, v9

    invoke-virtual/range {v14 .. v19}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    :cond_1e
    :goto_9
    iget-object v9, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->c:Landroid/graphics/Paint;

    invoke-virtual {v2, v9}, Lcom/larvalabs/svgandroid/SVGParser$f;->b(Landroid/graphics/Paint;)Z

    move-result v2

    if-eqz v2, :cond_20

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v2

    cmpl-float v2, v2, v4

    if-lez v2, :cond_1f

    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    move-result v2

    cmpl-float v2, v2, v4

    if-lez v2, :cond_1f

    iget-object v2, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->b:Landroid/graphics/Canvas;

    new-instance v4, Landroid/graphics/RectF;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v9

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v10

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v7

    add-float/2addr v1, v7

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-virtual {v8}, Ljava/lang/Float;->floatValue()F

    move-result v7

    add-float/2addr v3, v7

    invoke-direct {v4, v9, v10, v1, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    move-result v3

    iget-object v5, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->c:Landroid/graphics/Paint;

    invoke-virtual {v2, v4, v1, v3, v5}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    goto :goto_a

    :cond_1f
    iget-object v6, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->b:Landroid/graphics/Canvas;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v4

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v5

    add-float v9, v1, v5

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {v8}, Ljava/lang/Float;->floatValue()F

    move-result v3

    add-float v10, v1, v3

    iget-object v11, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->c:Landroid/graphics/Paint;

    move v7, v2

    move v8, v4

    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    :cond_20
    :goto_a
    invoke-direct/range {p0 .. p0}, Lcom/larvalabs/svgandroid/SVGParser$e;->b()V

    goto/16 :goto_c

    :cond_21
    iget-boolean v3, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->m:Z

    if-nez v3, :cond_22

    const-string v3, "line"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_22

    const-string v1, "x1"

    invoke-static {v1, v2}, Lcom/larvalabs/svgandroid/SVGParser;->b(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v1

    const-string v3, "x2"

    invoke-static {v3, v2}, Lcom/larvalabs/svgandroid/SVGParser;->b(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v3

    const-string v4, "y1"

    invoke-static {v4, v2}, Lcom/larvalabs/svgandroid/SVGParser;->b(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v4

    const-string v5, "y2"

    invoke-static {v5, v2}, Lcom/larvalabs/svgandroid/SVGParser;->b(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v5

    new-instance v6, Lcom/larvalabs/svgandroid/SVGParser$d;

    invoke-direct {v6, v2, v10}, Lcom/larvalabs/svgandroid/SVGParser$d;-><init>(Lorg/xml/sax/Attributes;Lcom/larvalabs/svgandroid/SVGParser$1;)V

    new-instance v7, Lcom/larvalabs/svgandroid/SVGParser$f;

    iget-object v8, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->g:Ljava/util/Deque;

    invoke-interface {v8}, Ljava/util/Deque;->peek()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/larvalabs/svgandroid/SVGParser$f;

    invoke-direct {v7, v8}, Lcom/larvalabs/svgandroid/SVGParser$f;-><init>(Lcom/larvalabs/svgandroid/SVGParser$f;)V

    invoke-direct {v0, v6, v7}, Lcom/larvalabs/svgandroid/SVGParser$e;->a(Lcom/larvalabs/svgandroid/SVGParser$d;Lcom/larvalabs/svgandroid/SVGParser$f;)Z

    iget-object v6, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->c:Landroid/graphics/Paint;

    invoke-virtual {v7, v6}, Lcom/larvalabs/svgandroid/SVGParser$f;->b(Landroid/graphics/Paint;)Z

    move-result v6

    if-eqz v6, :cond_32

    invoke-direct {v0, v2}, Lcom/larvalabs/svgandroid/SVGParser$e;->a(Lorg/xml/sax/Attributes;)V

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v6

    invoke-direct {v0, v2, v6}, Lcom/larvalabs/svgandroid/SVGParser$e;->a(FF)V

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v2

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v6

    invoke-direct {v0, v2, v6}, Lcom/larvalabs/svgandroid/SVGParser$e;->a(FF)V

    iget-object v7, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->b:Landroid/graphics/Canvas;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v8

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v9

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v10

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v11

    iget-object v12, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->c:Landroid/graphics/Paint;

    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    invoke-direct/range {p0 .. p0}, Lcom/larvalabs/svgandroid/SVGParser$e;->b()V

    goto/16 :goto_c

    :cond_22
    iget-boolean v3, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->m:Z

    if-nez v3, :cond_25

    const-string v3, "circle"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_25

    const-string v1, "cx"

    invoke-static {v1, v2}, Lcom/larvalabs/svgandroid/SVGParser;->b(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v1

    const-string v3, "cy"

    invoke-static {v3, v2}, Lcom/larvalabs/svgandroid/SVGParser;->b(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v3

    const-string v4, "r"

    invoke-static {v4, v2}, Lcom/larvalabs/svgandroid/SVGParser;->b(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v4

    if-eqz v1, :cond_32

    if-eqz v3, :cond_32

    if-eqz v4, :cond_32

    invoke-direct {v0, v2}, Lcom/larvalabs/svgandroid/SVGParser$e;->a(Lorg/xml/sax/Attributes;)V

    new-instance v5, Lcom/larvalabs/svgandroid/SVGParser$d;

    invoke-direct {v5, v2, v10}, Lcom/larvalabs/svgandroid/SVGParser$d;-><init>(Lorg/xml/sax/Attributes;Lcom/larvalabs/svgandroid/SVGParser$1;)V

    new-instance v2, Lcom/larvalabs/svgandroid/SVGParser$f;

    iget-object v6, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->g:Ljava/util/Deque;

    invoke-interface {v6}, Ljava/util/Deque;->peek()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/larvalabs/svgandroid/SVGParser$f;

    invoke-direct {v2, v6}, Lcom/larvalabs/svgandroid/SVGParser$f;-><init>(Lcom/larvalabs/svgandroid/SVGParser$f;)V

    iget-object v6, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->j:Ljava/util/HashMap;

    invoke-direct {v0, v5, v6, v2}, Lcom/larvalabs/svgandroid/SVGParser$e;->a(Lcom/larvalabs/svgandroid/SVGParser$d;Ljava/util/HashMap;Lcom/larvalabs/svgandroid/SVGParser$f;)Z

    invoke-direct {v0, v5, v2}, Lcom/larvalabs/svgandroid/SVGParser$e;->a(Lcom/larvalabs/svgandroid/SVGParser$d;Lcom/larvalabs/svgandroid/SVGParser$f;)Z

    iget-object v5, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->c:Landroid/graphics/Paint;

    invoke-virtual {v2, v5}, Lcom/larvalabs/svgandroid/SVGParser$f;->a(Landroid/graphics/Paint;)Z

    move-result v5

    if-eqz v5, :cond_23

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v5

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v6

    sub-float/2addr v5, v6

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v6

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v7

    sub-float/2addr v6, v7

    invoke-direct {v0, v5, v6}, Lcom/larvalabs/svgandroid/SVGParser$e;->a(FF)V

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v5

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v6

    add-float/2addr v5, v6

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v6

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v7

    add-float/2addr v6, v7

    invoke-direct {v0, v5, v6}, Lcom/larvalabs/svgandroid/SVGParser$e;->a(FF)V

    iget-object v5, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->b:Landroid/graphics/Canvas;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v6

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v7

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v8

    iget-object v9, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->c:Landroid/graphics/Paint;

    invoke-virtual {v5, v6, v7, v8, v9}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    :cond_23
    iget-object v5, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->c:Landroid/graphics/Paint;

    invoke-virtual {v2, v5}, Lcom/larvalabs/svgandroid/SVGParser$f;->b(Landroid/graphics/Paint;)Z

    move-result v2

    if-eqz v2, :cond_24

    iget-object v2, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->b:Landroid/graphics/Canvas;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    iget-object v5, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->c:Landroid/graphics/Paint;

    invoke-virtual {v2, v1, v3, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    :cond_24
    invoke-direct/range {p0 .. p0}, Lcom/larvalabs/svgandroid/SVGParser$e;->b()V

    goto/16 :goto_c

    :cond_25
    iget-boolean v3, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->m:Z

    if-nez v3, :cond_28

    const-string v3, "ellipse"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_28

    const-string v1, "cx"

    invoke-static {v1, v2}, Lcom/larvalabs/svgandroid/SVGParser;->b(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v1

    const-string v3, "cy"

    invoke-static {v3, v2}, Lcom/larvalabs/svgandroid/SVGParser;->b(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v3

    const-string v4, "rx"

    invoke-static {v4, v2}, Lcom/larvalabs/svgandroid/SVGParser;->b(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v4

    const-string v5, "ry"

    invoke-static {v5, v2}, Lcom/larvalabs/svgandroid/SVGParser;->b(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/Float;

    move-result-object v5

    if-eqz v1, :cond_32

    if-eqz v3, :cond_32

    if-eqz v4, :cond_32

    if-eqz v5, :cond_32

    invoke-direct {v0, v2}, Lcom/larvalabs/svgandroid/SVGParser$e;->a(Lorg/xml/sax/Attributes;)V

    new-instance v6, Lcom/larvalabs/svgandroid/SVGParser$d;

    invoke-direct {v6, v2, v10}, Lcom/larvalabs/svgandroid/SVGParser$d;-><init>(Lorg/xml/sax/Attributes;Lcom/larvalabs/svgandroid/SVGParser$1;)V

    new-instance v2, Lcom/larvalabs/svgandroid/SVGParser$f;

    iget-object v7, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->g:Ljava/util/Deque;

    invoke-interface {v7}, Ljava/util/Deque;->peek()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/larvalabs/svgandroid/SVGParser$f;

    invoke-direct {v2, v7}, Lcom/larvalabs/svgandroid/SVGParser$f;-><init>(Lcom/larvalabs/svgandroid/SVGParser$f;)V

    iget-object v7, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->j:Ljava/util/HashMap;

    invoke-direct {v0, v6, v7, v2}, Lcom/larvalabs/svgandroid/SVGParser$e;->a(Lcom/larvalabs/svgandroid/SVGParser$d;Ljava/util/HashMap;Lcom/larvalabs/svgandroid/SVGParser$f;)Z

    invoke-direct {v0, v6, v2}, Lcom/larvalabs/svgandroid/SVGParser$e;->a(Lcom/larvalabs/svgandroid/SVGParser$d;Lcom/larvalabs/svgandroid/SVGParser$f;)Z

    iget-object v6, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->d:Landroid/graphics/RectF;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v7

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v8

    sub-float/2addr v7, v8

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v8

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v9

    sub-float/2addr v8, v9

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v9

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v10

    add-float/2addr v9, v10

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v10

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v11

    add-float/2addr v10, v11

    invoke-virtual {v6, v7, v8, v9, v10}, Landroid/graphics/RectF;->set(FFFF)V

    iget-object v6, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->c:Landroid/graphics/Paint;

    invoke-virtual {v2, v6}, Lcom/larvalabs/svgandroid/SVGParser$f;->a(Landroid/graphics/Paint;)Z

    move-result v6

    if-eqz v6, :cond_26

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v6

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v7

    sub-float/2addr v6, v7

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v7

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v8

    sub-float/2addr v7, v8

    invoke-direct {v0, v6, v7}, Lcom/larvalabs/svgandroid/SVGParser$e;->a(FF)V

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    add-float/2addr v1, v4

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-virtual {v5}, Ljava/lang/Float;->floatValue()F

    move-result v4

    add-float/2addr v3, v4

    invoke-direct {v0, v1, v3}, Lcom/larvalabs/svgandroid/SVGParser$e;->a(FF)V

    iget-object v1, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->b:Landroid/graphics/Canvas;

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->d:Landroid/graphics/RectF;

    iget-object v4, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->c:Landroid/graphics/Paint;

    invoke-virtual {v1, v3, v4}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    :cond_26
    iget-object v1, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->c:Landroid/graphics/Paint;

    invoke-virtual {v2, v1}, Lcom/larvalabs/svgandroid/SVGParser$f;->b(Landroid/graphics/Paint;)Z

    move-result v1

    if-eqz v1, :cond_27

    iget-object v1, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->b:Landroid/graphics/Canvas;

    iget-object v2, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->d:Landroid/graphics/RectF;

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->c:Landroid/graphics/Paint;

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    :cond_27
    invoke-direct/range {p0 .. p0}, Lcom/larvalabs/svgandroid/SVGParser$e;->b()V

    goto/16 :goto_c

    :cond_28
    iget-boolean v3, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->m:Z

    if-nez v3, :cond_2e

    const-string v3, "polygon"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_29

    const-string v3, "polyline"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2e

    :cond_29
    const-string v3, "points"

    invoke-static {v3, v2}, Lcom/larvalabs/svgandroid/SVGParser;->c(Ljava/lang/String;Lorg/xml/sax/Attributes;)Lcom/larvalabs/svgandroid/SVGParser$b;

    move-result-object v3

    if-eqz v3, :cond_32

    new-instance v4, Landroid/graphics/Path;

    invoke-direct {v4}, Landroid/graphics/Path;-><init>()V

    invoke-static {v3}, Lcom/larvalabs/svgandroid/SVGParser$b;->a(Lcom/larvalabs/svgandroid/SVGParser$b;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-le v8, v7, :cond_32

    invoke-direct {v0, v2}, Lcom/larvalabs/svgandroid/SVGParser$e;->a(Lorg/xml/sax/Attributes;)V

    new-instance v8, Lcom/larvalabs/svgandroid/SVGParser$d;

    invoke-direct {v8, v2, v10}, Lcom/larvalabs/svgandroid/SVGParser$d;-><init>(Lorg/xml/sax/Attributes;Lcom/larvalabs/svgandroid/SVGParser$1;)V

    new-instance v2, Lcom/larvalabs/svgandroid/SVGParser$f;

    iget-object v9, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->g:Ljava/util/Deque;

    invoke-interface {v9}, Ljava/util/Deque;->peek()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/larvalabs/svgandroid/SVGParser$f;

    invoke-direct {v2, v9}, Lcom/larvalabs/svgandroid/SVGParser$f;-><init>(Lcom/larvalabs/svgandroid/SVGParser$f;)V

    iget-object v9, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->j:Ljava/util/HashMap;

    invoke-direct {v0, v8, v9, v2}, Lcom/larvalabs/svgandroid/SVGParser$e;->a(Lcom/larvalabs/svgandroid/SVGParser$d;Ljava/util/HashMap;Lcom/larvalabs/svgandroid/SVGParser$f;)Z

    invoke-direct {v0, v8, v2}, Lcom/larvalabs/svgandroid/SVGParser$e;->a(Lcom/larvalabs/svgandroid/SVGParser$d;Lcom/larvalabs/svgandroid/SVGParser$f;)Z

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Float;

    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    move-result v6

    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Float;

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v7

    invoke-virtual {v4, v6, v7}, Landroid/graphics/Path;->moveTo(FF)V

    :goto_b
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v5, v6, :cond_2a

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Float;

    invoke-virtual {v6}, Ljava/lang/Float;->floatValue()F

    move-result v6

    add-int/lit8 v7, v5, 0x1

    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Float;

    invoke-virtual {v7}, Ljava/lang/Float;->floatValue()F

    move-result v7

    invoke-virtual {v4, v6, v7}, Landroid/graphics/Path;->lineTo(FF)V

    add-int/lit8 v5, v5, 0x2

    goto :goto_b

    :cond_2a
    const-string v3, "polygon"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2b

    invoke-virtual {v4}, Landroid/graphics/Path;->close()V

    :cond_2b
    iget-object v1, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->c:Landroid/graphics/Paint;

    invoke-virtual {v2, v1}, Lcom/larvalabs/svgandroid/SVGParser$f;->a(Landroid/graphics/Paint;)Z

    move-result v1

    if-eqz v1, :cond_2c

    invoke-virtual {v2}, Lcom/larvalabs/svgandroid/SVGParser$f;->a()Landroid/graphics/Path$FillType;

    move-result-object v1

    invoke-virtual {v4, v1}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    invoke-direct {v0, v4}, Lcom/larvalabs/svgandroid/SVGParser$e;->a(Landroid/graphics/Path;)V

    iget-object v1, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->b:Landroid/graphics/Canvas;

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->c:Landroid/graphics/Paint;

    invoke-virtual {v1, v4, v3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    :cond_2c
    iget-object v1, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->c:Landroid/graphics/Paint;

    invoke-virtual {v2, v1}, Lcom/larvalabs/svgandroid/SVGParser$f;->b(Landroid/graphics/Paint;)Z

    move-result v1

    if-eqz v1, :cond_2d

    iget-object v1, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->b:Landroid/graphics/Canvas;

    iget-object v2, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->c:Landroid/graphics/Paint;

    invoke-virtual {v1, v4, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    :cond_2d
    invoke-direct/range {p0 .. p0}, Lcom/larvalabs/svgandroid/SVGParser$e;->b()V

    goto/16 :goto_c

    :cond_2e
    iget-boolean v3, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->m:Z

    if-nez v3, :cond_31

    const-string v3, "path"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_31

    const-string v1, "d"

    invoke-static {v1, v2}, Lcom/larvalabs/svgandroid/SVGParser;->a(Ljava/lang/String;Lorg/xml/sax/Attributes;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/larvalabs/svgandroid/SVGParser;->c(Ljava/lang/String;)Landroid/graphics/Path;

    move-result-object v1

    invoke-direct {v0, v2}, Lcom/larvalabs/svgandroid/SVGParser$e;->a(Lorg/xml/sax/Attributes;)V

    new-instance v3, Lcom/larvalabs/svgandroid/SVGParser$d;

    invoke-direct {v3, v2, v10}, Lcom/larvalabs/svgandroid/SVGParser$d;-><init>(Lorg/xml/sax/Attributes;Lcom/larvalabs/svgandroid/SVGParser$1;)V

    new-instance v2, Lcom/larvalabs/svgandroid/SVGParser$f;

    iget-object v4, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->g:Ljava/util/Deque;

    invoke-interface {v4}, Ljava/util/Deque;->peek()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/larvalabs/svgandroid/SVGParser$f;

    invoke-direct {v2, v4}, Lcom/larvalabs/svgandroid/SVGParser$f;-><init>(Lcom/larvalabs/svgandroid/SVGParser$f;)V

    iget-object v4, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->j:Ljava/util/HashMap;

    invoke-direct {v0, v3, v4, v2}, Lcom/larvalabs/svgandroid/SVGParser$e;->a(Lcom/larvalabs/svgandroid/SVGParser$d;Ljava/util/HashMap;Lcom/larvalabs/svgandroid/SVGParser$f;)Z

    invoke-direct {v0, v3, v2}, Lcom/larvalabs/svgandroid/SVGParser$e;->a(Lcom/larvalabs/svgandroid/SVGParser$d;Lcom/larvalabs/svgandroid/SVGParser$f;)Z

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->c:Landroid/graphics/Paint;

    invoke-virtual {v2, v3}, Lcom/larvalabs/svgandroid/SVGParser$f;->a(Landroid/graphics/Paint;)Z

    move-result v3

    if-eqz v3, :cond_2f

    invoke-virtual {v2}, Lcom/larvalabs/svgandroid/SVGParser$f;->a()Landroid/graphics/Path$FillType;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    invoke-direct {v0, v1}, Lcom/larvalabs/svgandroid/SVGParser$e;->a(Landroid/graphics/Path;)V

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->b:Landroid/graphics/Canvas;

    iget-object v4, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->c:Landroid/graphics/Paint;

    invoke-virtual {v3, v1, v4}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    :cond_2f
    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->c:Landroid/graphics/Paint;

    invoke-virtual {v2, v3}, Lcom/larvalabs/svgandroid/SVGParser$f;->b(Landroid/graphics/Paint;)Z

    move-result v2

    if-eqz v2, :cond_30

    iget-object v2, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->b:Landroid/graphics/Canvas;

    iget-object v3, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->c:Landroid/graphics/Paint;

    invoke-virtual {v2, v1, v3}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    :cond_30
    invoke-direct/range {p0 .. p0}, Lcom/larvalabs/svgandroid/SVGParser$e;->b()V

    goto :goto_c

    :cond_31
    iget-boolean v2, v0, Lcom/larvalabs/svgandroid/SVGParser$e;->m:Z

    if-nez v2, :cond_32

    const-string v2, "SVGAndroid"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "UNRECOGNIZED SVG COMMAND: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_32
    :goto_c
    return-void
.end method
