.class public Lcom/miui/gallery/editor/photo/core/imports/filter/render/GLESUtils;
.super Ljava/lang/Object;
.source "GLESUtils.java"


# direct methods
.method public static getMaxTextureSize()I
    .locals 10

    invoke-static {}, Ljavax/microedition/khronos/egl/EGLContext;->getEGL()Ljavax/microedition/khronos/egl/EGL;

    move-result-object v0

    check-cast v0, Ljavax/microedition/khronos/egl/EGL10;

    sget-object v1, Ljavax/microedition/khronos/egl/EGL10;->EGL_DEFAULT_DISPLAY:Ljava/lang/Object;

    invoke-interface {v0, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglGetDisplay(Ljava/lang/Object;)Ljavax/microedition/khronos/egl/EGLDisplay;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [I

    invoke-interface {v0, v1, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglInitialize(Ljavax/microedition/khronos/egl/EGLDisplay;[I)Z

    const/4 v2, 0x1

    new-array v3, v2, [I

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-interface {v0, v1, v5, v4, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigs(Ljavax/microedition/khronos/egl/EGLDisplay;[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    aget v5, v3, v4

    new-array v5, v5, [Ljavax/microedition/khronos/egl/EGLConfig;

    aget v6, v3, v4

    invoke-interface {v0, v1, v5, v6, v3}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigs(Ljavax/microedition/khronos/egl/EGLDisplay;[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    new-array v2, v2, [I

    const/4 v6, 0x0

    const/4 v7, 0x0

    :goto_0
    aget v8, v3, v4

    if-ge v6, v8, :cond_1

    aget-object v8, v5, v6

    const/16 v9, 0x302c

    invoke-interface {v0, v1, v8, v9, v2}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    aget v8, v2, v4

    if-ge v7, v8, :cond_0

    aget v7, v2, v4

    :cond_0
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :cond_1
    invoke-interface {v0, v1}, Ljavax/microedition/khronos/egl/EGL10;->eglTerminate(Ljavax/microedition/khronos/egl/EGLDisplay;)Z

    const/16 v0, 0x800

    invoke-static {v7, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method
