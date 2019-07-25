.class public Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLShaderGroup;
.super Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLTextureSizeShader;
.source "GLShaderGroup.java"


# instance fields
.field private mGLFBOManagers:[Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

.field protected mShaders:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;",
            ">;"
        }
    .end annotation
.end field

.field protected mTextureHeight:I

.field protected mTextureWidth:I

.field private mViewHeight:I

.field private mViewWidth:I


# direct methods
.method public constructor <init>(IIII)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0, v0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/mosaic/shader/GLTextureSizeShader;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLShaderGroup;->mShaders:Ljava/util/List;

    iput p1, p0, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLShaderGroup;->mTextureWidth:I

    iput p2, p0, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLShaderGroup;->mTextureHeight:I

    iput p3, p0, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLShaderGroup;->mViewWidth:I

    iput p4, p0, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLShaderGroup;->mViewHeight:I

    return-void
.end method


# virtual methods
.method protected addShader(Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLShaderGroup;->mShaders:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public destroy()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLShaderGroup;->mShaders:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;->destroy()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLShaderGroup;->mGLFBOManagers:[Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLShaderGroup;->mGLFBOManagers:[Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_1
    if-ge v2, v1, :cond_2

    aget-object v3, v0, v2

    if-eqz v3, :cond_1

    invoke-virtual {v3}, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->clear()V

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    return-void
.end method

.method public draw(I[F[F)V
    .locals 0

    return-void
.end method

.method public getEffectedTexture(I)I
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLShaderGroup;->onPreDraw()V

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLShaderGroup;->mShaders:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLShaderGroup;->mShaders:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLShaderGroup;->mGLFBOManagers:[Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->bind()V

    const/16 v2, 0x4100

    invoke-static {v2}, Landroid/opengl/GLES20;->glClear(I)V

    add-int/lit8 v2, v0, -0x1

    if-ltz v2, :cond_0

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLShaderGroup;->mGLFBOManagers:[Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    aget-object v2, v3, v2

    invoke-virtual {v2}, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->getTextureId()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;->drawFBO(I)V

    goto :goto_1

    :cond_0
    invoke-virtual {v1, p1}, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLTextureShader;->draw(I)V

    :goto_1
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLShaderGroup;->mGLFBOManagers:[Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->unBind()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLShaderGroup;->mGLFBOManagers:[Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLShaderGroup;->mGLFBOManagers:[Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    aget-object p1, p1, v0

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->getTextureId()I

    move-result p1

    return p1
.end method

.method protected init(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method protected notifyShaderAdded()V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLShaderGroup;->mShaders:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLShaderGroup;->mGLFBOManagers:[Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLShaderGroup;->mGLFBOManagers:[Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLShaderGroup;->mGLFBOManagers:[Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    new-instance v2, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;

    iget v3, p0, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLShaderGroup;->mTextureWidth:I

    iget v4, p0, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLShaderGroup;->mTextureHeight:I

    iget v5, p0, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLShaderGroup;->mViewWidth:I

    iget v6, p0, Lcom/miui/gallery/editor/photo/widgets/glview/shader/GLShaderGroup;->mViewHeight:I

    invoke-direct {v2, v3, v4, v5, v6}, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;-><init>(IIII)V

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method protected onPreDraw()V
    .locals 0

    return-void
.end method
