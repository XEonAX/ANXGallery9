.class Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;
.super Ljava/lang/Object;
.source "MosaicRender.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "InitTask"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    const/4 v0, -0x1

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$500(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/miui/filtersdk/utils/OpenGlUtils;->loadTexture(Landroid/graphics/Bitmap;I)I

    move-result v2

    invoke-static {v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$302(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;I)I
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    const-string v2, "MosaicRender"

    const-string v3, "bitmap : isRecycled : %s config : %s"

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$500(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Landroid/graphics/Bitmap;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v5}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$500(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Landroid/graphics/Bitmap;

    move-result-object v5

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v5

    invoke-static {v2, v3, v4, v5, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v1, v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$302(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;I)I

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$600(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Landroid/graphics/Bitmap;

    move-result-object v2

    const/4 v3, 0x1

    invoke-static {v2, v0, v3}, Lcom/miui/filtersdk/utils/OpenGlUtils;->loadTexture(Landroid/graphics/Bitmap;IZ)I

    move-result v0

    invoke-static {v1, v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$402(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;I)I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    new-instance v1, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;

    invoke-direct {v1}, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;-><init>()V

    invoke-static {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$702(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;)Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLTransparentShader;

    invoke-direct {v1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLTransparentShader;-><init>()V

    invoke-static {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$202(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLTransparentShader;)Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLTransparentShader;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    new-instance v1, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$500(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$500(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$800(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)I

    move-result v4

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v5}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$900(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)I

    move-result v5

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;-><init>(IIII)V

    invoke-static {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$102(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;)Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$100(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->bind()V

    const/16 v0, 0x4100

    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$100(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->unBind()V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    new-instance v2, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$500(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$500(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Landroid/graphics/Bitmap;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v5}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$800(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)I

    move-result v5

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v6}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$900(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)I

    move-result v6

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;-><init>(IIII)V

    invoke-static {v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$002(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;)Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$000(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->bind()V

    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$000(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->unBind()V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    new-instance v2, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$500(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$500(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Landroid/graphics/Bitmap;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v5}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$800(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)I

    move-result v5

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v6}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$900(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)I

    move-result v6

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;-><init>(IIII)V

    invoke-static {v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$1002(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;)Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$1000(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->bind()V

    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$700(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$300(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;->draw(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$1000(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->unBind()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicEffectProcessor;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$500(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$500(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$800(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)I

    move-result v4

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v5}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$900(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)I

    move-result v5

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicEffectProcessor;-><init>(IIII)V

    invoke-static {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$1102(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicEffectProcessor;)Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicEffectProcessor;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$1200(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$1100(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicEffectProcessor;

    move-result-object v1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$000(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    move-result-object v2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$1200(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;

    move-result-object v3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$1000(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->getTextureId()I

    move-result v4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$300(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)I

    move-result v5

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$700(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;

    move-result-object v6

    invoke-virtual/range {v1 .. v6}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicEffectProcessor;->draw(Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicGLEntity;IILcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$500(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    int-to-float v2, v2

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender$InitTask;->this$0:Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$500(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    int-to-float v3, v3

    invoke-direct {v1, v2, v3}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;-><init>(FF)V

    invoke-static {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;->access$1302(Lcom/miui/gallery/editor/photo/core/imports/mosaic/MosaicRender;Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;)Lcom/miui/gallery/editor/photo/core/imports/mosaic/GLRectF$Iterator;

    return-void
.end method
