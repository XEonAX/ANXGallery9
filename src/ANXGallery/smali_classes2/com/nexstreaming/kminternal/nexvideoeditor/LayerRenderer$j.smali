.class Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;
.super Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$o;
.source "LayerRenderer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "j"
.end annotation


# instance fields
.field final synthetic a:Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;

.field private b:I

.field private c:I

.field private d:I

.field private f:I

.field private g:I

.field private h:I

.field private i:Ljava/nio/FloatBuffer;

.field private j:Ljava/nio/FloatBuffer;

.field private k:I

.field private l:I

.field private m:[F

.field private n:F

.field private o:I

.field private p:[F

.field private q:I

.field private r:[F


# direct methods
.method constructor <init>(Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;)V
    .locals 1

    iput-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->a:Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;

    invoke-direct {p0, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$o;-><init>(Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;)V

    const/4 p1, 0x2

    new-array v0, p1, [F

    iput-object v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->p:[F

    new-array p1, p1, [F

    iput-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->r:[F

    const-string p1, "doMosaicBaseVertexWork"

    invoke-virtual {p0, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->a(Ljava/lang/String;)V

    const-string p1, "mosaicBase"

    invoke-virtual {p0, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->b(Ljava/lang/String;)V

    const-string p1, "//Base Vertex Block\nattribute vec4 a_position;\nattribute vec2 a_texCoord;uniform mat4 u_mvp_matrix;\nvarying highp vec2 v_texCoord;\nvoid doMosaicBaseVertexWork(){\n        v_texCoord = a_texCoord;\n        gl_Position = a_position * u_mvp_matrix;\n}"

    invoke-virtual {p0, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->c(Ljava/lang/String;)V

    const-string p1, "varying highp vec2 v_texCoord;\nuniform sampler2D u_textureSampler;\nuniform sampler2D u_maskSampler;\nuniform highp float u_alpha_test;\nuniform highp vec2 u_block_size;\nuniform highp vec2 u_texture_size;\nhighp vec4 mosaicBase(){\n   highp vec2 uv = v_texCoord;\n   highp vec4 mask = texture2D(u_maskSampler, uv);\n   if(mask.x == 0.0) return vec4(0, 0, 0, 0);\n   highp float dx = u_block_size.x * (1.0 / u_texture_size.x);\n   highp float dy = u_block_size.y * (1.0 / u_texture_size.y);\n   highp vec2 coord = vec2(dx*floor(uv.x / dx) + 1. / u_texture_size.x, dy*floor(uv.y / dy) + 1. / u_texture_size.y);\n   highp vec4 color = texture2D(u_textureSampler, coord);\n   if(color.a < u_alpha_test) return vec4(0,0,0,0);\n   return color;\n}"

    invoke-virtual {p0, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->d(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public a(FF)V
    .locals 7

    const/4 v0, 0x0

    cmpl-float v1, p1, v0

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/high16 v4, 0x3f800000    # 1.0f

    if-nez v1, :cond_0

    cmpl-float v0, p2, v0

    if-nez v0, :cond_0

    iget-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->p:[F

    aput v4, p1, v3

    iget-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->p:[F

    aput v4, p1, v2

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->p:[F

    const/high16 v1, 0x42440000    # 49.0f

    mul-float p1, p1, v1

    float-to-double v5, p1

    invoke-static {v5, v6}, Ljava/lang/Math;->floor(D)D

    move-result-wide v5

    double-to-float p1, v5

    add-float/2addr p1, v4

    aput p1, v0, v3

    iget-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->p:[F

    mul-float p2, p2, v1

    float-to-double v0, p2

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-float p2, v0

    add-float/2addr p2, v4

    aput p2, p1, v2

    :goto_0
    return-void
.end method

.method public a(Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$n;)V
    .locals 12

    iget-object v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->a:Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->f()F

    move-result v0

    iget-object v1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->a:Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->f()F

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->a(FF)V

    iget-object v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->a:Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;

    invoke-virtual {v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->c()F

    move-result v0

    iget-object v1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->a:Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;

    invoke-virtual {v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->d()F

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->b(FF)V

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$n;->a()I

    move-result v0

    const v1, 0x84c0

    add-int v2, v0, v1

    invoke-static {v2}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    invoke-static {}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->p()V

    iget v2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->k:I

    const/16 v3, 0xde1

    invoke-static {v3, v2}, Landroid/opengl/GLES20;->glBindTexture(II)V

    invoke-static {}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->p()V

    iget v2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->d:I

    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glUniform1i(II)V

    invoke-static {}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->p()V

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$n;->a()I

    move-result p1

    add-int/2addr v1, p1

    invoke-static {v1}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    invoke-static {}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->p()V

    iget v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->l:I

    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    invoke-static {}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->p()V

    iget v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->f:I

    invoke-static {v0, p1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    invoke-static {}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->p()V

    iget p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->h:I

    iget v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->n:F

    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glUniform1f(IF)V

    iget p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->b:I

    invoke-static {p1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    invoke-static {}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->p()V

    iget p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->c:I

    invoke-static {p1}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    invoke-static {}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->p()V

    iget-object v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->a:Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;

    iget v1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->g:I

    iget-object v4, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->m:[F

    const/4 v2, 0x1

    const/4 v3, 0x1

    const/4 v5, 0x0

    invoke-static/range {v0 .. v5}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;IIZ[FI)V

    invoke-static {}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->p()V

    iget v6, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->b:I

    iget-object v11, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->i:Ljava/nio/FloatBuffer;

    const/4 v7, 0x4

    const/16 v8, 0x1406

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-static/range {v6 .. v11}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    invoke-static {}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->p()V

    iget v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->c:I

    iget-object v5, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->j:Ljava/nio/FloatBuffer;

    const/4 v1, 0x2

    const/16 v2, 0x1406

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static/range {v0 .. v5}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZILjava/nio/Buffer;)V

    invoke-static {}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->p()V

    iget p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->o:I

    iget-object v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->p:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    iget-object v2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->p:[F

    const/4 v3, 0x1

    aget v2, v2, v3

    invoke-static {p1, v0, v2}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    iget p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->q:I

    iget-object v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->r:[F

    aget v0, v0, v1

    iget-object v1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->r:[F

    aget v1, v1, v3

    invoke-static {p1, v0, v1}, Landroid/opengl/GLES20;->glUniform2f(IFF)V

    return-void
.end method

.method public a(Ljava/nio/FloatBuffer;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->i:Ljava/nio/FloatBuffer;

    return-void
.end method

.method public a([F)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->m:[F

    return-void
.end method

.method public b(FF)V
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->r:[F

    const/4 v1, 0x0

    aput p1, v0, v1

    iget-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->r:[F

    const/4 v0, 0x1

    aput p2, p1, v0

    return-void
.end method

.method public b(I)V
    .locals 1

    const-string v0, "a_position"

    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->b:I

    const-string v0, "a_texCoord"

    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glGetAttribLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->c:I

    const-string v0, "u_mvp_matrix"

    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->g:I

    const-string v0, "u_textureSampler"

    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->d:I

    const-string v0, "u_maskSampler"

    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->f:I

    const-string v0, "u_alpha_test"

    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->h:I

    const-string v0, "u_block_size"

    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->o:I

    const-string v0, "u_texture_size"

    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->q:I

    return-void
.end method

.method public b(Ljava/nio/FloatBuffer;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->j:Ljava/nio/FloatBuffer;

    return-void
.end method

.method public c(I)V
    .locals 0

    iput p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->l:I

    return-void
.end method

.method public f_(I)V
    .locals 0

    iput p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$j;->k:I

    return-void
.end method
