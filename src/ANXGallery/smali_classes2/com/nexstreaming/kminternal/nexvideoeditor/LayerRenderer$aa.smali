.class Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$aa;
.super Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$o;
.source "LayerRenderer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "aa"
.end annotation


# instance fields
.field a:F

.field final synthetic b:Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;

.field private c:I


# direct methods
.method constructor <init>(Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$aa;->b:Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;

    invoke-direct {p0, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$o;-><init>(Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;)V

    const-string p1, ""

    invoke-virtual {p0, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$aa;->a(Ljava/lang/String;)V

    const-string p1, "applyUserAlpha"

    invoke-virtual {p0, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$aa;->b(Ljava/lang/String;)V

    const-string p1, ""

    invoke-virtual {p0, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$aa;->c(Ljava/lang/String;)V

    const-string p1, "uniform highp float u_alpha;\nhighp vec4 applyUserAlpha(highp vec4 color){\n        return color * u_alpha;\n}"

    invoke-virtual {p0, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$aa;->d(Ljava/lang/String;)V

    const/high16 p1, 0x3f800000    # 1.0f

    invoke-virtual {p0, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$aa;->a(F)V

    return-void
.end method


# virtual methods
.method a(F)V
    .locals 0

    iput p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$aa;->a:F

    return-void
.end method

.method public a(Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$n;)V
    .locals 1

    iget p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$aa;->c:I

    iget v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$aa;->a:F

    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    return-void
.end method

.method public b(I)V
    .locals 1

    const-string v0, "u_alpha"

    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$aa;->c:I

    return-void
.end method
