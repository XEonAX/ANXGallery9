.class public Lcom/larvalabs/svgandroid/SVGParser$c;
.super Ljava/lang/Object;
.source "SVGParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/larvalabs/svgandroid/SVGParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# instance fields
.field private a:Z

.field private b:I

.field private c:Z

.field private d:I

.field private e:F

.field private f:I

.field private g:I

.field private h:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private i:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private j:I


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->a:Z

    iput v0, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->b:I

    iput-boolean v0, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->c:Z

    iput v0, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->d:I

    const/4 v1, 0x0

    iput v1, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->e:F

    iput v0, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->f:I

    iput v0, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->g:I

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->i:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>(Lcom/larvalabs/svgandroid/SVGParser$c;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->a:Z

    iput v0, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->b:I

    iput-boolean v0, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->c:Z

    iput v0, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->d:I

    const/4 v1, 0x0

    iput v1, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->e:F

    iput v0, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->f:I

    iput v0, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->g:I

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->i:Ljava/util/Set;

    if-eqz p1, :cond_1

    iget-boolean v0, p1, Lcom/larvalabs/svgandroid/SVGParser$c;->a:Z

    iput-boolean v0, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->a:Z

    iget v0, p1, Lcom/larvalabs/svgandroid/SVGParser$c;->b:I

    iput v0, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->b:I

    iget-boolean v0, p1, Lcom/larvalabs/svgandroid/SVGParser$c;->c:Z

    iput-boolean v0, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->c:Z

    iget v0, p1, Lcom/larvalabs/svgandroid/SVGParser$c;->d:I

    iput v0, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->d:I

    iget v0, p1, Lcom/larvalabs/svgandroid/SVGParser$c;->e:F

    iput v0, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->e:F

    iget v0, p1, Lcom/larvalabs/svgandroid/SVGParser$c;->f:I

    iput v0, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->f:I

    iget v0, p1, Lcom/larvalabs/svgandroid/SVGParser$c;->g:I

    iput v0, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->g:I

    iget-object v0, p1, Lcom/larvalabs/svgandroid/SVGParser$c;->h:Ljava/util/Map;

    if-eqz v0, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->h:Ljava/util/Map;

    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->h:Ljava/util/Map;

    iget-object v1, p1, Lcom/larvalabs/svgandroid/SVGParser$c;->h:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    :cond_0
    iget v0, p1, Lcom/larvalabs/svgandroid/SVGParser$c;->j:I

    iput v0, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->j:I

    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->i:Ljava/util/Set;

    iget-object p1, p1, Lcom/larvalabs/svgandroid/SVGParser$c;->i:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    :cond_1
    return-void
.end method

.method private a(I)I
    .locals 7

    const-string v0, "SVGAndroid"

    const-string v1, "mapColor"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->h:Ljava/util/Map;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->h:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "SVGAndroid"

    const-string v1, "mapColor : EXACT"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->h:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    return p1

    :cond_0
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->h:Ljava/util/Map;

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->j:I

    if-lez v0, :cond_2

    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->h:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v2}, Landroid/graphics/Color;->red(I)I

    move-result v3

    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v4

    sub-int/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    invoke-static {v2}, Landroid/graphics/Color;->green(I)I

    move-result v4

    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v5

    sub-int/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-static {v2}, Landroid/graphics/Color;->blue(I)I

    move-result v4

    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result v5

    sub-int/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    iget v4, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->j:I

    if-gt v3, v4, :cond_1

    const-string v0, "SVGAndroid"

    const-string v3, "mapColor : SIMILAR"

    invoke-static {v0, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v1

    invoke-static {v2}, Landroid/graphics/Color;->red(I)I

    move-result v3

    sub-int/2addr v1, v3

    invoke-static {v0}, Landroid/graphics/Color;->red(I)I

    move-result v3

    add-int/2addr v1, v3

    const/16 v3, 0xff

    invoke-static {v3, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    const/4 v4, 0x0

    invoke-static {v4, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v5

    invoke-static {v2}, Landroid/graphics/Color;->green(I)I

    move-result v6

    sub-int/2addr v5, v6

    invoke-static {v0}, Landroid/graphics/Color;->green(I)I

    move-result v6

    add-int/2addr v5, v6

    invoke-static {v3, v5}, Ljava/lang/Math;->min(II)I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result p1

    invoke-static {v2}, Landroid/graphics/Color;->blue(I)I

    move-result v2

    sub-int/2addr p1, v2

    invoke-static {v0}, Landroid/graphics/Color;->blue(I)I

    move-result v0

    add-int/2addr p1, v0

    invoke-static {v3, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-static {v4, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-static {v1, v5, p1}, Landroid/graphics/Color;->rgb(III)I

    move-result p1

    return p1

    :cond_2
    const-string v0, "SVGAndroid"

    const-string v1, "mapColor : NO CHANGE"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return p1
.end method

.method static synthetic a(Lcom/larvalabs/svgandroid/SVGParser$c;I)I
    .locals 0

    invoke-direct {p0, p1}, Lcom/larvalabs/svgandroid/SVGParser$c;->a(I)I

    move-result p0

    return p0
.end method

.method static synthetic a(Lcom/larvalabs/svgandroid/SVGParser$c;)Ljava/util/Set;
    .locals 0

    iget-object p0, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->i:Ljava/util/Set;

    return-object p0
.end method

.method static synthetic b(Lcom/larvalabs/svgandroid/SVGParser$c;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->a:Z

    return p0
.end method

.method static synthetic c(Lcom/larvalabs/svgandroid/SVGParser$c;)I
    .locals 0

    iget p0, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->b:I

    return p0
.end method

.method static synthetic d(Lcom/larvalabs/svgandroid/SVGParser$c;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->c:Z

    return p0
.end method

.method static synthetic e(Lcom/larvalabs/svgandroid/SVGParser$c;)I
    .locals 0

    iget p0, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->d:I

    return p0
.end method

.method static synthetic f(Lcom/larvalabs/svgandroid/SVGParser$c;)F
    .locals 0

    iget p0, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->e:F

    return p0
.end method

.method static synthetic g(Lcom/larvalabs/svgandroid/SVGParser$c;)I
    .locals 0

    iget p0, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->f:I

    return p0
.end method

.method static synthetic h(Lcom/larvalabs/svgandroid/SVGParser$c;)I
    .locals 0

    iget p0, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->g:I

    return p0
.end method

.method static synthetic i(Lcom/larvalabs/svgandroid/SVGParser$c;)Ljava/util/Map;
    .locals 0

    iget-object p0, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->h:Ljava/util/Map;

    return-object p0
.end method


# virtual methods
.method public a(Ljava/util/Map;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;I)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->h:Ljava/util/Map;

    iput p2, p0, Lcom/larvalabs/svgandroid/SVGParser$c;->j:I

    return-void
.end method
