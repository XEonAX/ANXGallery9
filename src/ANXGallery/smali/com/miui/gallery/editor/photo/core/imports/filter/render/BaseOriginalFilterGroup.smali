.class public Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;
.super Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;
.source "BaseOriginalFilterGroup.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/core/imports/filter/render/IFilterEmptyValidate;
.implements Lcom/miui/gallery/editor/photo/core/imports/filter/render/ISpecialProcessFilter;


# instance fields
.field private mFilters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;",
            ">;"
        }
    .end annotation
.end field

.field private mGroupFrameBufferTextures:[I

.field private mGroupFrameBuffers:[I

.field private mGroupFrameHeight:I

.field private mGroupFrameWidth:I


# direct methods
.method public constructor <init>()V
    .locals 2

    const-string v0, ""

    const-string v1, ""

    invoke-direct {p0, v0, v1}, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mGroupFrameBuffers:[I

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mGroupFrameBufferTextures:[I

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mGroupFrameWidth:I

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mGroupFrameHeight:I

    return-void
.end method

.method public constructor <init>(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;",
            ">;)V"
        }
    .end annotation

    const-string v0, ""

    const-string v1, ""

    invoke-direct {p0, v0, v1}, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mGroupFrameBuffers:[I

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mGroupFrameBufferTextures:[I

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mGroupFrameWidth:I

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mGroupFrameHeight:I

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mFilters:Ljava/util/List;

    return-void
.end method

.method private destroyGroupFrameBuffers()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mGroupFrameBufferTextures:[I

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mGroupFrameBufferTextures:[I

    array-length v0, v0

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mGroupFrameBufferTextures:[I

    invoke-static {v0, v3, v2}, Landroid/opengl/GLES20;->glDeleteTextures(I[II)V

    iput-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mGroupFrameBufferTextures:[I

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mGroupFrameBuffers:[I

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mGroupFrameBuffers:[I

    array-length v0, v0

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mGroupFrameBuffers:[I

    invoke-static {v0, v3, v2}, Landroid/opengl/GLES20;->glDeleteFramebuffers(I[II)V

    iput-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mGroupFrameBuffers:[I

    :cond_1
    return-void
.end method


# virtual methods
.method public getSpecialBoard()I
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mFilters:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;

    instance-of v3, v2, Lcom/miui/gallery/editor/photo/core/imports/filter/render/ISpecialProcessFilter;

    if-eqz v3, :cond_0

    check-cast v2, Lcom/miui/gallery/editor/photo/core/imports/filter/render/ISpecialProcessFilter;

    invoke-interface {v2}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/ISpecialProcessFilter;->getSpecialBoard()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    goto :goto_0

    :cond_1
    return v1
.end method

.method public init()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mFilters:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;->init()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public initFrameBuffers(II)V
    .locals 2

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mFilters:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mFilters:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;

    invoke-virtual {v1, p1, p2}, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;->initFrameBuffers(II)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public isEmpty()Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mFilters:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;

    instance-of v2, v1, Lcom/miui/gallery/editor/photo/core/imports/filter/render/IFilterEmptyValidate;

    if-eqz v2, :cond_0

    check-cast v1, Lcom/miui/gallery/editor/photo/core/imports/filter/render/IFilterEmptyValidate;

    invoke-interface {v1}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/IFilterEmptyValidate;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    return v0

    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method public onDestroy()V
    .locals 2

    invoke-super {p0}, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;->onDestroy()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mFilters:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;

    invoke-virtual {v1}, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;->destroy()V

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->destroyGroupFrameBuffers()V

    return-void
.end method

.method public onDisplaySizeChanged(II)V
    .locals 2

    invoke-super {p0, p1, p2}, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;->onDisplaySizeChanged(II)V

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mFilters:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mFilters:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;

    invoke-virtual {v1, p1, p2}, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;->onDisplaySizeChanged(II)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onDrawFrame(ILjava/nio/FloatBuffer;Ljava/nio/FloatBuffer;)I
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mGroupFrameBuffers:[I

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mGroupFrameBufferTextures:[I

    if-nez v0, :cond_0

    goto :goto_3

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mFilters:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    move v2, p1

    const/4 p1, 0x0

    :goto_0
    const/4 v3, 0x1

    if-ge p1, v0, :cond_3

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mFilters:Ljava/util/List;

    invoke-interface {v4, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;

    add-int/lit8 v5, v0, -0x1

    if-ge p1, v5, :cond_1

    goto :goto_1

    :cond_1
    const/4 v3, 0x0

    :goto_1
    if-eqz v3, :cond_2

    iget v3, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mInputWidth:I

    iget v5, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mInputHeight:I

    invoke-static {v1, v1, v3, v5}, Landroid/opengl/GLES20;->glViewport(IIII)V

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mGroupFrameBuffers:[I

    aget v3, v3, p1

    const v5, 0x8d40

    invoke-static {v5, v3}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mGLCubeBuffer:Ljava/nio/FloatBuffer;

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mGLTextureBuffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v4, v2, v3, v6}, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;->onDrawFrame(ILjava/nio/FloatBuffer;Ljava/nio/FloatBuffer;)I

    invoke-static {v5, v1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mGroupFrameBufferTextures:[I

    aget v2, v2, p1

    goto :goto_2

    :cond_2
    invoke-virtual {v4, v2, p2, p3}, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;->onDrawFrame(ILjava/nio/FloatBuffer;Ljava/nio/FloatBuffer;)I

    :goto_2
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_3
    return v3

    :cond_4
    :goto_3
    const/4 p1, -0x1

    return p1
.end method

.method public onDrawToTexture(ILjava/nio/FloatBuffer;Ljava/nio/FloatBuffer;)I
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mFilters:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    move v2, p1

    const/4 p1, 0x0

    :goto_0
    if-ge p1, v0, :cond_2

    add-int/lit8 v3, v0, -0x1

    if-ge p1, v3, :cond_0

    const/4 v3, 0x1

    goto :goto_1

    :cond_0
    const/4 v3, 0x0

    :goto_1
    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mFilters:Ljava/util/List;

    invoke-interface {v4, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mGLCubeBuffer:Ljava/nio/FloatBuffer;

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mGLTextureBuffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v4, v2, v3, v5}, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;->onDrawToTexture(ILjava/nio/FloatBuffer;Ljava/nio/FloatBuffer;)I

    move-result v2

    goto :goto_2

    :cond_1
    invoke-virtual {v4, v2, p2, p3}, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;->onDrawToTexture(ILjava/nio/FloatBuffer;Ljava/nio/FloatBuffer;)I

    move-result v2

    :goto_2
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_2
    return v2
.end method

.method public onInputSizeChanged(II)V
    .locals 17

    move-object/from16 v0, p0

    move/from16 v10, p1

    move/from16 v11, p2

    invoke-super/range {p0 .. p2}, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;->onInputSizeChanged(II)V

    iget-object v1, v0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mFilters:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v12, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    iget-object v3, v0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mFilters:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;

    invoke-virtual {v3, v10, v11}, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;->onInputSizeChanged(II)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    iget-object v2, v0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mGroupFrameBuffers:[I

    if-eqz v2, :cond_2

    iget v2, v0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mGroupFrameWidth:I

    if-ne v2, v10, :cond_1

    iget v2, v0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mGroupFrameHeight:I

    if-ne v2, v11, :cond_1

    iget-object v2, v0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mGroupFrameBuffers:[I

    array-length v2, v2

    add-int/lit8 v3, v1, -0x1

    if-eq v2, v3, :cond_2

    :cond_1
    invoke-direct/range {p0 .. p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->destroyGroupFrameBuffers()V

    iput v10, v0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mGroupFrameWidth:I

    iput v11, v0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mGroupFrameHeight:I

    :cond_2
    iget-object v2, v0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mGroupFrameBuffers:[I

    if-nez v2, :cond_3

    const/4 v13, 0x1

    add-int/lit8 v14, v1, -0x1

    new-array v1, v14, [I

    iput-object v1, v0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mGroupFrameBuffers:[I

    new-array v1, v14, [I

    iput-object v1, v0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mGroupFrameBufferTextures:[I

    const/4 v15, 0x0

    :goto_1
    if-ge v15, v14, :cond_3

    iget-object v1, v0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mGroupFrameBuffers:[I

    invoke-static {v13, v1, v15}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    iget-object v1, v0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mGroupFrameBufferTextures:[I

    invoke-static {v13, v1, v15}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    iget-object v1, v0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mGroupFrameBufferTextures:[I

    aget v1, v1, v15

    const/16 v9, 0xde1

    invoke-static {v9, v1}, Landroid/opengl/GLES20;->glBindTexture(II)V

    const/16 v1, 0xde1

    const/4 v2, 0x0

    const/16 v3, 0x1908

    const/4 v6, 0x0

    const/16 v7, 0x1908

    const/16 v8, 0x1401

    const/16 v16, 0x0

    move/from16 v4, p1

    move/from16 v5, p2

    const/16 v13, 0xde1

    move-object/from16 v9, v16

    invoke-static/range {v1 .. v9}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    const/16 v1, 0x2800

    const v2, 0x46180400    # 9729.0f

    invoke-static {v13, v1, v2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    const/16 v1, 0x2801

    invoke-static {v13, v1, v2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    const/16 v1, 0x2802

    const v2, 0x47012f00    # 33071.0f

    invoke-static {v13, v1, v2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    const/16 v1, 0x2803

    invoke-static {v13, v1, v2}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    iget-object v1, v0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mGroupFrameBuffers:[I

    aget v1, v1, v15

    const v2, 0x8d40

    invoke-static {v2, v1}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    const v1, 0x8ce0

    iget-object v3, v0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mGroupFrameBufferTextures:[I

    aget v3, v3, v15

    invoke-static {v2, v1, v13, v3, v12}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    invoke-static {v13, v12}, Landroid/opengl/GLES20;->glBindTexture(II)V

    invoke-static {v2, v12}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    add-int/lit8 v15, v15, 0x1

    const/4 v13, 0x1

    goto :goto_1

    :cond_3
    return-void
.end method

.method public setBlock(Lcom/miui/gallery/editor/blocksdk/Block;I)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/BaseOriginalFilterGroup;->mFilters:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/filtersdk/filter/base/BaseOriginalFilter;

    instance-of v2, v1, Lcom/miui/gallery/editor/photo/core/imports/filter/render/ISpecialProcessFilter;

    if-eqz v2, :cond_0

    check-cast v1, Lcom/miui/gallery/editor/photo/core/imports/filter/render/ISpecialProcessFilter;

    invoke-interface {v1, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/ISpecialProcessFilter;->setBlock(Lcom/miui/gallery/editor/blocksdk/Block;I)V

    goto :goto_0

    :cond_1
    return-void
.end method
