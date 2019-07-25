.class Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$i;
.super Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$o;
.source "LayerRenderer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "i"
.end annotation


# instance fields
.field a:I

.field final synthetic b:Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;

.field private c:I


# direct methods
.method constructor <init>(Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;)V
    .locals 1

    iput-object p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$i;->b:Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;

    invoke-direct {p0, p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$o;-><init>(Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;)V

    const-string v0, "maskWork"

    invoke-virtual {p0, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$i;->a(Ljava/lang/String;)V

    const-string v0, "applyMask"

    invoke-virtual {p0, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$i;->b(Ljava/lang/String;)V

    const-string v0, "\nvarying highp vec2 v_texCoord_for_mask;\nvoid maskWork() {\nv_texCoord_for_mask = gl_Position.xy / gl_Position.w * 0.5 + 0.5;\n}\n"

    invoke-virtual {p0, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$i;->c(Ljava/lang/String;)V

    const-string v0, "\nvarying highp vec2 v_texCoord_for_mask;\nuniform sampler2D u_textureSampler_for_mask;\nhighp vec4 applyMask(highp vec4 color) {\nhighp vec4 mask = (texture2D(u_textureSampler_for_mask, v_texCoord_for_mask)).rgba;\ncolor *= mask.r;\nreturn color;\n}\n"

    invoke-virtual {p0, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$i;->d(Ljava/lang/String;)V

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, v0}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->a(F)V

    return-void
.end method


# virtual methods
.method public a(Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$n;)V
    .locals 2

    invoke-virtual {p1}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$n;->a()I

    move-result p1

    const v0, 0x84c0

    add-int/2addr v0, p1

    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    invoke-static {}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->p()V

    iget v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$i;->c:I

    const/16 v1, 0xde1

    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    invoke-static {}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->p()V

    iget v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$i;->a:I

    invoke-static {v0, p1}, Landroid/opengl/GLES20;->glUniform1i(II)V

    invoke-static {}, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;->p()V

    return-void
.end method

.method public b(I)V
    .locals 1

    const-string v0, "u_textureSampler_for_mask"

    invoke-static {p1, v0}, Landroid/opengl/GLES20;->glGetUniformLocation(ILjava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$i;->a:I

    return-void
.end method

.method e_(I)V
    .locals 0

    iput p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer$i;->c:I

    return-void
.end method
