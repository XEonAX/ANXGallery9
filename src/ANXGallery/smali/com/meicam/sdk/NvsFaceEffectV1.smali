.class public Lcom/meicam/sdk/NvsFaceEffectV1;
.super Ljava/lang/Object;
.source "NvsFaceEffectV1.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static done()V
    .locals 0

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    invoke-static {}, Lcom/meicam/sdk/NvsFaceEffectV1;->nativeDone()V

    return-void
.end method

.method private static native nativeDone()V
.end method

.method private static native nativeSetMaxFaces(I)V
.end method

.method private static native nativeSetup(Ljava/lang/String;[B)V
.end method

.method public static setMaxFaces(I)V
    .locals 0

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    invoke-static {p0}, Lcom/meicam/sdk/NvsFaceEffectV1;->nativeSetMaxFaces(I)V

    return-void
.end method

.method public static setup(Ljava/lang/String;[B)V
    .locals 0

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    invoke-static {p0, p1}, Lcom/meicam/sdk/NvsFaceEffectV1;->nativeSetup(Ljava/lang/String;[B)V

    return-void
.end method
