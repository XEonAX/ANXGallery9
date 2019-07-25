.class Lcom/larvalabs/svgandroid/SVGParser$f;
.super Ljava/lang/Object;
.source "SVGParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/larvalabs/svgandroid/SVGParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "f"
.end annotation


# instance fields
.field private a:I

.field private b:I

.field private c:Landroid/graphics/Shader;

.field private d:F

.field private e:Landroid/graphics/Paint$Cap;

.field private f:Landroid/graphics/Paint$Join;

.field private g:Z

.field private h:Z

.field private i:Landroid/graphics/Path$FillType;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, -0x1000000

    iput v0, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->a:I

    iput v0, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->b:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->c:Landroid/graphics/Shader;

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->d:F

    sget-object v0, Landroid/graphics/Paint$Cap;->BUTT:Landroid/graphics/Paint$Cap;

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->e:Landroid/graphics/Paint$Cap;

    sget-object v0, Landroid/graphics/Paint$Join;->MITER:Landroid/graphics/Paint$Join;

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->f:Landroid/graphics/Paint$Join;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->g:Z

    iput-boolean v0, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->h:Z

    return-void
.end method

.method public constructor <init>(Lcom/larvalabs/svgandroid/SVGParser$f;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, -0x1000000

    iput v0, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->a:I

    iput v0, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->b:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->c:Landroid/graphics/Shader;

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->d:F

    sget-object v0, Landroid/graphics/Paint$Cap;->BUTT:Landroid/graphics/Paint$Cap;

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->e:Landroid/graphics/Paint$Cap;

    sget-object v0, Landroid/graphics/Paint$Join;->MITER:Landroid/graphics/Paint$Join;

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->f:Landroid/graphics/Paint$Join;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->g:Z

    iput-boolean v0, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->h:Z

    iget v0, p1, Lcom/larvalabs/svgandroid/SVGParser$f;->a:I

    iput v0, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->a:I

    iget v0, p1, Lcom/larvalabs/svgandroid/SVGParser$f;->b:I

    iput v0, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->b:I

    iget-object v0, p1, Lcom/larvalabs/svgandroid/SVGParser$f;->c:Landroid/graphics/Shader;

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->c:Landroid/graphics/Shader;

    iget v0, p1, Lcom/larvalabs/svgandroid/SVGParser$f;->d:F

    iput v0, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->d:F

    iget-object v0, p1, Lcom/larvalabs/svgandroid/SVGParser$f;->e:Landroid/graphics/Paint$Cap;

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->e:Landroid/graphics/Paint$Cap;

    iget-object v0, p1, Lcom/larvalabs/svgandroid/SVGParser$f;->f:Landroid/graphics/Paint$Join;

    iput-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->f:Landroid/graphics/Paint$Join;

    iget-boolean v0, p1, Lcom/larvalabs/svgandroid/SVGParser$f;->g:Z

    iput-boolean v0, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->g:Z

    iget-boolean p1, p1, Lcom/larvalabs/svgandroid/SVGParser$f;->h:Z

    iput-boolean p1, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->h:Z

    return-void
.end method

.method static synthetic a(Lcom/larvalabs/svgandroid/SVGParser$f;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->h:Z

    return p1
.end method

.method static synthetic b(Lcom/larvalabs/svgandroid/SVGParser$f;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->g:Z

    return p1
.end method


# virtual methods
.method public a()Landroid/graphics/Path$FillType;
    .locals 1

    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->i:Landroid/graphics/Path$FillType;

    if-nez v0, :cond_0

    sget-object v0, Landroid/graphics/Path$FillType;->WINDING:Landroid/graphics/Path$FillType;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->i:Landroid/graphics/Path$FillType;

    :goto_0
    return-object v0
.end method

.method public a(F)V
    .locals 0

    iput p1, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->d:F

    return-void
.end method

.method public a(I)V
    .locals 0

    iput p1, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->a:I

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->c:Landroid/graphics/Shader;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->h:Z

    return-void
.end method

.method public a(Landroid/graphics/Paint$Cap;)V
    .locals 0

    iput-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->e:Landroid/graphics/Paint$Cap;

    return-void
.end method

.method public a(Landroid/graphics/Paint$Join;)V
    .locals 0

    iput-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->f:Landroid/graphics/Paint$Join;

    return-void
.end method

.method public a(Landroid/graphics/Path$FillType;)V
    .locals 0

    iput-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->i:Landroid/graphics/Path$FillType;

    return-void
.end method

.method public a(Landroid/graphics/Shader;)V
    .locals 0

    iput-object p1, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->c:Landroid/graphics/Shader;

    const/high16 p1, -0x1000000

    iput p1, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->a:I

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->h:Z

    return-void
.end method

.method public a(Landroid/graphics/Paint;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->h:Z

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->c:Landroid/graphics/Shader;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    iget v0, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->a:I

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    const/4 p1, 0x1

    return p1
.end method

.method public b(I)V
    .locals 0

    iput p1, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->b:I

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->g:Z

    return-void
.end method

.method public b(Landroid/graphics/Paint;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->g:Z

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    iget v0, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->b:I

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    iget v0, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->d:F

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->e:Landroid/graphics/Paint$Cap;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    iget-object v0, p0, Lcom/larvalabs/svgandroid/SVGParser$f;->f:Landroid/graphics/Paint$Join;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    const/4 p1, 0x1

    return p1
.end method
