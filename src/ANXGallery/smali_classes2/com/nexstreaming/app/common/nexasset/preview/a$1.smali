.class Lcom/nexstreaming/app/common/nexasset/preview/a$1;
.super Ljava/lang/Object;
.source "AssetPreviewView.java"

# interfaces
.implements Landroid/opengl/GLSurfaceView$EGLConfigChooser;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/nexstreaming/app/common/nexasset/preview/a;->init(ZII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;

.field final synthetic b:Lcom/nexstreaming/app/common/nexasset/preview/a;


# direct methods
.method constructor <init>(Lcom/nexstreaming/app/common/nexasset/preview/a;Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;)V
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/app/common/nexasset/preview/a$1;->b:Lcom/nexstreaming/app/common/nexasset/preview/a;

    iput-object p2, p0, Lcom/nexstreaming/app/common/nexasset/preview/a$1;->a:Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public chooseConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;)Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 16

    move-object/from16 v0, p0

    const/16 v1, 0x13

    new-array v1, v1, [I

    const/4 v8, 0x0

    const/16 v2, 0x3040

    aput v2, v1, v8

    const/4 v2, 0x4

    const/4 v9, 0x1

    aput v2, v1, v9

    const/4 v3, 0x2

    const/16 v4, 0x3024

    aput v4, v1, v3

    const/16 v4, 0x8

    const/4 v5, 0x3

    aput v4, v1, v5

    const/16 v5, 0x3023

    aput v5, v1, v2

    const/4 v2, 0x5

    aput v4, v1, v2

    const/4 v2, 0x6

    const/16 v5, 0x3022

    aput v5, v1, v2

    const/4 v2, 0x7

    aput v4, v1, v2

    const/16 v2, 0x3021

    aput v2, v1, v4

    const/16 v2, 0x9

    aput v4, v1, v2

    const/16 v2, 0xa

    const/16 v4, 0x3026

    aput v4, v1, v2

    const/16 v2, 0xb

    aput v9, v1, v2

    const/16 v2, 0xc

    const/16 v4, 0x3032

    aput v4, v1, v2

    iget-object v2, v0, Lcom/nexstreaming/app/common/nexasset/preview/a$1;->a:Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;

    invoke-virtual {v2}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->getGLMultisample()Z

    move-result v2

    const/16 v4, 0xd

    aput v2, v1, v4

    const/16 v2, 0xe

    const/16 v5, 0x3031

    aput v5, v1, v2

    const/16 v2, 0xf

    iget-object v5, v0, Lcom/nexstreaming/app/common/nexasset/preview/a$1;->a:Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;

    invoke-virtual {v5}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->getGLMultisample()Z

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    aput v3, v1, v2

    const/16 v2, 0x10

    const/16 v3, 0x3025

    aput v3, v1, v2

    const/16 v2, 0x11

    iget-object v3, v0, Lcom/nexstreaming/app/common/nexasset/preview/a$1;->a:Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;

    invoke-virtual {v3}, Lcom/nexstreaming/kminternal/kinemaster/config/NexEditorDeviceProfile;->getGLDepthBufferBits()I

    move-result v3

    aput v3, v1, v2

    const/16 v2, 0x12

    const/16 v3, 0x3038

    aput v3, v1, v2

    new-array v15, v4, [I

    fill-array-data v15, :array_0

    new-array v14, v9, [I

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object v4, v1

    move-object v7, v14

    invoke-interface/range {v2 .. v7}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    aget v2, v14, v8

    if-ge v2, v9, :cond_1

    const/4 v13, 0x0

    const/4 v1, 0x0

    move-object/from16 v10, p1

    move-object/from16 v11, p2

    move-object v12, v15

    move-object v7, v14

    move v14, v1

    move-object v1, v15

    move-object v15, v7

    invoke-interface/range {v10 .. v15}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    goto :goto_1

    :cond_1
    move-object v7, v14

    :goto_1
    move-object v4, v1

    aget v1, v7, v8

    new-array v1, v1, [Ljavax/microedition/khronos/egl/EGLConfig;

    array-length v6, v1

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object v5, v1

    invoke-interface/range {v2 .. v7}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    aget-object v1, v1, v8

    return-object v1

    nop

    :array_0
    .array-data 4
        0x3040
        0x4
        0x3024
        0x8
        0x3023
        0x8
        0x3022
        0x8
        0x3021
        0x8
        0x3026
        0x8
        0x3038
    .end array-data
.end method
