.class public Lcom/meicam/sdk/NvsVideoTransition;
.super Lcom/meicam/sdk/NvsFx;
.source "NvsVideoTransition.java"


# static fields
.field public static final VIDEO_TRANSITION_TYPE_BUILTIN:I = 0x0

.field public static final VIDEO_TRANSITION_TYPE_PACKAGE:I = 0x1


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/meicam/sdk/NvsFx;-><init>()V

    return-void
.end method

.method private native nativeGetBuiltinVideoTransitionName(J)Ljava/lang/String;
.end method

.method private native nativeGetVideoTransitionDurationScaleFactor(J)F
.end method

.method private native nativeGetVideoTransitionPackageId(J)Ljava/lang/String;
.end method

.method private native nativeGetVideoTransitionType(J)I
.end method

.method private native nativeSetVideoTransitionDurationScaleFactor(JF)V
.end method


# virtual methods
.method public getBuiltinVideoTransitionName()Ljava/lang/String;
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsVideoTransition;->m_internalObject:J

    invoke-direct {p0, v0, v1}, Lcom/meicam/sdk/NvsVideoTransition;->nativeGetBuiltinVideoTransitionName(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getVideoTransitionDurationScaleFactor()F
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsVideoTransition;->m_internalObject:J

    invoke-direct {p0, v0, v1}, Lcom/meicam/sdk/NvsVideoTransition;->nativeGetVideoTransitionDurationScaleFactor(J)F

    move-result v0

    return v0
.end method

.method public getVideoTransitionPackageId()Ljava/lang/String;
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsVideoTransition;->m_internalObject:J

    invoke-direct {p0, v0, v1}, Lcom/meicam/sdk/NvsVideoTransition;->nativeGetVideoTransitionPackageId(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getVideoTransitionType()I
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsVideoTransition;->m_internalObject:J

    invoke-direct {p0, v0, v1}, Lcom/meicam/sdk/NvsVideoTransition;->nativeGetVideoTransitionType(J)I

    move-result v0

    return v0
.end method

.method public setVideoTransitionDurationScaleFactor(F)V
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsVideoTransition;->m_internalObject:J

    invoke-direct {p0, v0, v1, p1}, Lcom/meicam/sdk/NvsVideoTransition;->nativeSetVideoTransitionDurationScaleFactor(JF)V

    return-void
.end method
