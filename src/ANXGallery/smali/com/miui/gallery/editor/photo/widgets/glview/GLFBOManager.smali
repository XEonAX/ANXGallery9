.class public Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;
.super Ljava/lang/Object;
.source "GLFBOManager.java"


# instance fields
.field private mFramebufferId:I

.field private mHeight:I

.field private mTextureId:I

.field private mViewHeight:I

.field private mViewWidth:I

.field private mWidth:I


# direct methods
.method public constructor <init>(IIII)V
    .locals 6

    const/4 v5, 0x1

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;-><init>(IIIIZ)V

    return-void
.end method

.method public constructor <init>(IIIIZ)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->mWidth:I

    iput p2, p0, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->mHeight:I

    iput p3, p0, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->mViewWidth:I

    iput p4, p0, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->mViewHeight:I

    invoke-direct {p0, p5}, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->init(Z)V

    return-void
.end method

.method private init(Z)V
    .locals 19

    move-object/from16 v0, p0

    const/4 v1, 0x1

    new-array v2, v1, [I

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    aget v2, v2, v3

    iput v2, v0, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->mFramebufferId:I

    new-array v2, v1, [I

    invoke-static {v1, v2, v3}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    aget v1, v2, v3

    iput v1, v0, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->mTextureId:I

    iget v1, v0, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->mTextureId:I

    const/16 v2, 0xde1

    invoke-static {v2, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    const v1, 0x46180400    # 9729.0f

    const/16 v3, 0x2801

    invoke-static {v2, v3, v1}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    const/16 v3, 0x2800

    invoke-static {v2, v3, v1}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    const v1, 0x47012f00    # 33071.0f

    const/16 v3, 0x2802

    invoke-static {v2, v3, v1}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    const/16 v3, 0x2803

    invoke-static {v2, v3, v1}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    if-eqz p1, :cond_0

    const/16 v1, 0xde1

    const/4 v2, 0x0

    const/16 v3, 0x1908

    iget v4, v0, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->mWidth:I

    iget v5, v0, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->mHeight:I

    const/4 v6, 0x0

    const/16 v7, 0x1908

    const/16 v8, 0x1401

    const/4 v9, 0x0

    invoke-static/range {v1 .. v9}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    goto :goto_0

    :cond_0
    const/16 v10, 0xde1

    const/4 v11, 0x0

    const/16 v12, 0x1907

    iget v13, v0, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->mWidth:I

    iget v14, v0, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->mHeight:I

    const/4 v15, 0x0

    const/16 v16, 0x1907

    const/16 v17, 0x1401

    const/16 v18, 0x0

    invoke-static/range {v10 .. v18}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    :goto_0
    return-void
.end method


# virtual methods
.method public bind()V
    .locals 5

    iget v0, p0, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->mFramebufferId:I

    const v1, 0x8d40

    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    iget v0, p0, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->mTextureId:I

    const/16 v2, 0xde1

    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    iget v0, p0, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->mTextureId:I

    const/4 v3, 0x0

    const v4, 0x8ce0

    invoke-static {v1, v4, v2, v0, v3}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    invoke-static {v1}, Landroid/opengl/GLES20;->glCheckFramebufferStatus(I)I

    move-result v0

    const v1, 0x8cd5

    if-eq v0, v1, :cond_0

    const-string v0, "FBOManager"

    const-string v1, "Framebuffer error"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    iget v0, p0, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->mWidth:I

    iget v1, p0, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->mHeight:I

    invoke-static {v3, v3, v0, v1}, Landroid/opengl/GLES20;->glViewport(IIII)V

    return-void
.end method

.method public clear()V
    .locals 4

    const/4 v0, 0x1

    new-array v1, v0, [I

    iget v2, p0, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->mFramebufferId:I

    const/4 v3, 0x0

    aput v2, v1, v3

    invoke-static {v0, v1, v3}, Landroid/opengl/GLES20;->glDeleteFramebuffers(I[II)V

    new-array v1, v0, [I

    iget v2, p0, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->mTextureId:I

    aput v2, v1, v3

    invoke-static {v0, v1, v3}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    return-void
.end method

.method public getTextureId()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->mTextureId:I

    return v0
.end method

.method public unBind()V
    .locals 3

    const/4 v0, 0x0

    const v1, 0x8d40

    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    const/16 v1, 0xde1

    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    iget v1, p0, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->mViewWidth:I

    iget v2, p0, Lcom/miui/gallery/editor/photo/widgets/glview/GLFBOManager;->mViewHeight:I

    invoke-static {v0, v0, v1, v2}, Landroid/opengl/GLES20;->glViewport(IIII)V

    return-void
.end method
