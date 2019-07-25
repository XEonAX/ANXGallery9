.class public Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;
.super Ljava/lang/Object;
.source "PixelBuffer.java"


# instance fields
.field mBitmap:Landroid/graphics/Bitmap;

.field mEGL:Ljavax/microedition/khronos/egl/EGL10;

.field mEGLConfig:Ljavax/microedition/khronos/egl/EGLConfig;

.field mEGLConfigs:[Ljavax/microedition/khronos/egl/EGLConfig;

.field mEGLContext:Ljavax/microedition/khronos/egl/EGLContext;

.field mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

.field mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

.field mGL:Ljavax/microedition/khronos/opengles/GL10;

.field mHeight:I

.field mRenderer:Landroid/opengl/GLSurfaceView$Renderer;

.field mThreadOwner:Ljava/lang/String;

.field mWidth:I


# direct methods
.method public constructor <init>(II)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mWidth:I

    iput p2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mHeight:I

    const/4 p1, 0x2

    new-array p2, p1, [I

    const/4 v0, 0x5

    new-array v0, v0, [I

    const/4 v1, 0x0

    const/16 v2, 0x3057

    aput v2, v0, v1

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mWidth:I

    const/4 v2, 0x1

    aput v1, v0, v2

    const/16 v1, 0x3056

    aput v1, v0, p1

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mHeight:I

    const/4 v1, 0x3

    aput p1, v0, v1

    const/4 p1, 0x4

    const/16 v2, 0x3038

    aput v2, v0, p1

    invoke-static {}, Ljavax/microedition/khronos/egl/EGLContext;->getEGL()Ljavax/microedition/khronos/egl/EGL;

    move-result-object p1

    check-cast p1, Ljavax/microedition/khronos/egl/EGL10;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_DEFAULT_DISPLAY:Ljava/lang/Object;

    invoke-interface {p1, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglGetDisplay(Ljava/lang/Object;)Ljavax/microedition/khronos/egl/EGLDisplay;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    invoke-interface {p1, v2, p2}, Ljavax/microedition/khronos/egl/EGL10;->eglInitialize(Ljavax/microedition/khronos/egl/EGLDisplay;[I)Z

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->chooseConfig()Ljavax/microedition/khronos/egl/EGLConfig;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGLConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    new-array p1, v1, [I

    fill-array-data p1, :array_0

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGLConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {p2, v1, v2, v3, p1}, Ljavax/microedition/khronos/egl/EGL10;->eglCreateContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;Ljavax/microedition/khronos/egl/EGLContext;[I)Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGLContext:Ljavax/microedition/khronos/egl/EGLContext;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGLConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    invoke-interface {p1, p2, v1, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglCreatePbufferSurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;[I)Ljavax/microedition/khronos/egl/EGLSurface;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGLContext:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {p1, p2, v0, v1, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGLContext:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-virtual {p1}, Ljavax/microedition/khronos/egl/EGLContext;->getGL()Ljavax/microedition/khronos/opengles/GL;

    move-result-object p1

    check-cast p1, Ljavax/microedition/khronos/opengles/GL10;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mGL:Ljavax/microedition/khronos/opengles/GL10;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mThreadOwner:Ljava/lang/String;

    return-void

    nop

    :array_0
    .array-data 4
        0x3098
        0x2
        0x3038
    .end array-data
.end method

.method private chooseConfig()Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 9

    const/16 v0, 0xf

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    const/4 v1, 0x1

    new-array v7, v1, [I

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v3, v0

    move-object v6, v7

    invoke-interface/range {v1 .. v6}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    const/4 v8, 0x0

    aget v5, v7, v8

    new-array v1, v5, [Ljavax/microedition/khronos/egl/EGLConfig;

    iput-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGLConfigs:[Ljavax/microedition/khronos/egl/EGLConfig;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGLConfigs:[Ljavax/microedition/khronos/egl/EGLConfig;

    invoke-interface/range {v1 .. v6}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGLConfigs:[Ljavax/microedition/khronos/egl/EGLConfig;

    aget-object v0, v0, v8

    return-object v0

    :array_0
    .array-data 4
        0x3025
        0x0
        0x3026
        0x0
        0x3024
        0x8
        0x3023
        0x8
        0x3022
        0x8
        0x3021
        0x8
        0x3040
        0x4
        0x3038
    .end array-data
.end method

.method private convertToBitmap(Landroid/graphics/Bitmap;)V
    .locals 8

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v0

    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    if-ne v0, v1, :cond_0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mBitmap:Landroid/graphics/Bitmap;

    goto :goto_0

    :cond_0
    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mWidth:I

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mHeight:I

    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, v0, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mBitmap:Landroid/graphics/Bitmap;

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getByteCount()I

    move-result p1

    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mGL:Ljavax/microedition/khronos/opengles/GL10;

    const/4 v1, 0x0

    const/4 v2, 0x0

    iget v3, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mWidth:I

    iget v4, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mHeight:I

    const/16 v5, 0x1908

    const/16 v6, 0x1401

    move-object v7, p1

    invoke-interface/range {v0 .. v7}, Ljavax/microedition/khronos/opengles/GL10;->glReadPixels(IIIIIILjava/nio/Buffer;)V

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    const-string v0, "PixelBuffer"

    const-string v1, "convertToBitmap width:%d,height:%d,byteCount:%d,capacity:%d"

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget v4, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mWidth:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget v4, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mHeight:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getByteCount()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x3

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0, p1}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mRenderer:Landroid/opengl/GLSurfaceView$Renderer;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mGL:Ljavax/microedition/khronos/opengles/GL10;

    invoke-interface {v0, v1}, Landroid/opengl/GLSurfaceView$Renderer;->onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    sget-object v2, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v3, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_SURFACE:Ljavax/microedition/khronos/egl/EGLSurface;

    sget-object v4, Ljavax/microedition/khronos/egl/EGL10;->EGL_NO_CONTEXT:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v0, v1, v2, v3, v4}, Ljavax/microedition/khronos/egl/EGL10;->eglMakeCurrent(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLSurface;Ljavax/microedition/khronos/egl/EGLContext;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    invoke-interface {v0, v1, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroySurface(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGLContext:Ljavax/microedition/khronos/egl/EGLContext;

    invoke-interface {v0, v1, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglDestroyContext(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLContext;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    invoke-interface {v0, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglTerminate(Ljavax/microedition/khronos/egl/EGLDisplay;)Z

    return-void
.end method

.method public draw()Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mRenderer:Landroid/opengl/GLSurfaceView$Renderer;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string v0, "PixelBuffer"

    const-string v2, "getBitmap: Renderer was not set."

    invoke-static {v0, v2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mThreadOwner:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "PixelBuffer"

    const-string v2, "getBitmap: This thread does not own the OpenGL context."

    invoke-static {v0, v2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mRenderer:Landroid/opengl/GLSurfaceView$Renderer;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mGL:Ljavax/microedition/khronos/opengles/GL10;

    invoke-interface {v0, v1}, Landroid/opengl/GLSurfaceView$Renderer;->onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V

    const/4 v0, 0x1

    return v0
.end method

.method public getBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mRenderer:Landroid/opengl/GLSurfaceView$Renderer;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string p1, "PixelBuffer"

    const-string v0, "getBitmap: Renderer was not set."

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    :cond_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mThreadOwner:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string p1, "PixelBuffer"

    const-string v0, "getBitmap: This thread does not own the OpenGL context."

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGL:Ljavax/microedition/khronos/egl/EGL10;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGLDisplay:Ljavax/microedition/khronos/egl/EGLDisplay;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGLSurface:Ljavax/microedition/khronos/egl/EGLSurface;

    invoke-interface {v0, v2, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglSwapBuffers(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLSurface;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mRenderer:Landroid/opengl/GLSurfaceView$Renderer;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mGL:Ljavax/microedition/khronos/opengles/GL10;

    invoke-interface {v0, v2}, Landroid/opengl/GLSurfaceView$Renderer;->onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V

    :try_start_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->convertToBitmap(Landroid/graphics/Bitmap;)V
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "PixelBuffer"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "convertToBitmap error:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mBitmap:Landroid/graphics/Bitmap;

    return-object p1

    :catch_1
    move-exception p1

    const-string v0, "PixelBuffer"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "convertToBitmap error:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/OutOfMemoryError;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    const-string v0, "type"

    const-string v2, "pixelBuffer"

    invoke-virtual {p1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "model"

    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {p1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "photo_editor"

    const-string v2, "memory_error"

    invoke-static {v0, v2, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-object v1
.end method

.method public resetSize(II)V
    .locals 2

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mWidth:I

    iput p2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mHeight:I

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mRenderer:Landroid/opengl/GLSurfaceView$Renderer;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mGL:Ljavax/microedition/khronos/opengles/GL10;

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mWidth:I

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mHeight:I

    invoke-interface {p1, p2, v0, v1}, Landroid/opengl/GLSurfaceView$Renderer;->onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V

    return-void
.end method

.method public setRenderer(Landroid/opengl/GLSurfaceView$Renderer;)V
    .locals 3

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mRenderer:Landroid/opengl/GLSurfaceView$Renderer;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mThreadOwner:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    const-string p1, "PixelBuffer"

    const-string v0, "setRenderer: This thread does not own the OpenGL context."

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mRenderer:Landroid/opengl/GLSurfaceView$Renderer;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mGL:Ljavax/microedition/khronos/opengles/GL10;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mEGLConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    invoke-interface {p1, v0, v1}, Landroid/opengl/GLSurfaceView$Renderer;->onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mRenderer:Landroid/opengl/GLSurfaceView$Renderer;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mGL:Ljavax/microedition/khronos/opengles/GL10;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mWidth:I

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/render/PixelBuffer;->mHeight:I

    invoke-interface {p1, v0, v1, v2}, Landroid/opengl/GLSurfaceView$Renderer;->onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V

    return-void
.end method
