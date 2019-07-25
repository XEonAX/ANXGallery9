.class Lcom/larvalabs/svgandroid/SVGParser$a;
.super Ljava/lang/Object;
.source "SVGParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/larvalabs/svgandroid/SVGParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "a"
.end annotation


# instance fields
.field a:Ljava/lang/String;

.field b:Ljava/lang/String;

.field c:Z

.field d:F

.field e:F

.field f:F

.field g:F

.field h:F

.field i:F

.field j:F

.field k:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field l:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field m:Landroid/graphics/Matrix;


# direct methods
.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$a;->k:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$a;->l:Ljava/util/ArrayList;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$a;->m:Landroid/graphics/Matrix;

    return-void
.end method

.method synthetic constructor <init>(Lcom/larvalabs/svgandroid/SVGParser$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/larvalabs/svgandroid/SVGParser$a;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lcom/larvalabs/svgandroid/SVGParser$a;)Lcom/larvalabs/svgandroid/SVGParser$a;
    .locals 3

    new-instance v0, Lcom/larvalabs/svgandroid/SVGParser$a;

    invoke-direct {v0}, Lcom/larvalabs/svgandroid/SVGParser$a;-><init>()V

    iget-object v1, p1, Lcom/larvalabs/svgandroid/SVGParser$a;->a:Ljava/lang/String;

    iput-object v1, v0, Lcom/larvalabs/svgandroid/SVGParser$a;->a:Ljava/lang/String;

    iget-object v1, p0, Lcom/larvalabs/svgandroid/SVGParser$a;->a:Ljava/lang/String;

    iput-object v1, v0, Lcom/larvalabs/svgandroid/SVGParser$a;->b:Ljava/lang/String;

    iget-boolean v1, p1, Lcom/larvalabs/svgandroid/SVGParser$a;->c:Z

    iput-boolean v1, v0, Lcom/larvalabs/svgandroid/SVGParser$a;->c:Z

    iget v1, p1, Lcom/larvalabs/svgandroid/SVGParser$a;->d:F

    iput v1, v0, Lcom/larvalabs/svgandroid/SVGParser$a;->d:F

    iget v1, p1, Lcom/larvalabs/svgandroid/SVGParser$a;->f:F

    iput v1, v0, Lcom/larvalabs/svgandroid/SVGParser$a;->f:F

    iget v1, p1, Lcom/larvalabs/svgandroid/SVGParser$a;->e:F

    iput v1, v0, Lcom/larvalabs/svgandroid/SVGParser$a;->e:F

    iget v1, p1, Lcom/larvalabs/svgandroid/SVGParser$a;->g:F

    iput v1, v0, Lcom/larvalabs/svgandroid/SVGParser$a;->g:F

    iget v1, p1, Lcom/larvalabs/svgandroid/SVGParser$a;->h:F

    iput v1, v0, Lcom/larvalabs/svgandroid/SVGParser$a;->h:F

    iget v1, p1, Lcom/larvalabs/svgandroid/SVGParser$a;->i:F

    iput v1, v0, Lcom/larvalabs/svgandroid/SVGParser$a;->i:F

    iget v1, p1, Lcom/larvalabs/svgandroid/SVGParser$a;->j:F

    iput v1, v0, Lcom/larvalabs/svgandroid/SVGParser$a;->j:F

    iget-object v1, p0, Lcom/larvalabs/svgandroid/SVGParser$a;->k:Ljava/util/ArrayList;

    iput-object v1, v0, Lcom/larvalabs/svgandroid/SVGParser$a;->k:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/larvalabs/svgandroid/SVGParser$a;->l:Ljava/util/ArrayList;

    iput-object v1, v0, Lcom/larvalabs/svgandroid/SVGParser$a;->l:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/larvalabs/svgandroid/SVGParser$a;->m:Landroid/graphics/Matrix;

    iput-object v1, v0, Lcom/larvalabs/svgandroid/SVGParser$a;->m:Landroid/graphics/Matrix;

    iget-object v1, p1, Lcom/larvalabs/svgandroid/SVGParser$a;->m:Landroid/graphics/Matrix;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/larvalabs/svgandroid/SVGParser$a;->m:Landroid/graphics/Matrix;

    if-nez v1, :cond_0

    iget-object p1, p1, Lcom/larvalabs/svgandroid/SVGParser$a;->m:Landroid/graphics/Matrix;

    iput-object p1, v0, Lcom/larvalabs/svgandroid/SVGParser$a;->m:Landroid/graphics/Matrix;

    goto :goto_0

    :cond_0
    new-instance v1, Landroid/graphics/Matrix;

    iget-object v2, p0, Lcom/larvalabs/svgandroid/SVGParser$a;->m:Landroid/graphics/Matrix;

    invoke-direct {v1, v2}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    iget-object p1, p1, Lcom/larvalabs/svgandroid/SVGParser$a;->m:Landroid/graphics/Matrix;

    invoke-virtual {v1, p1}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    iput-object v1, v0, Lcom/larvalabs/svgandroid/SVGParser$a;->m:Landroid/graphics/Matrix;

    :cond_1
    :goto_0
    return-object v0
.end method
