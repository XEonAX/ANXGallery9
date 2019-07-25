.class public Lcom/meicam/sdk/NvsARFaceContext;
.super Ljava/lang/Object;
.source "NvsARFaceContext.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/meicam/sdk/NvsARFaceContext$NvsARFaceContextCallback;,
        Lcom/meicam/sdk/NvsARFaceContext$RunnableExt;
    }
.end annotation


# instance fields
.field m_callback:Lcom/meicam/sdk/NvsARFaceContext$NvsARFaceContextCallback;

.field m_callbackinternal:Lcom/meicam/sdk/NvsARFaceContext$NvsARFaceContextCallback;

.field private m_contextInterface:J

.field mainHandler:Landroid/os/Handler;


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/meicam/sdk/NvsARFaceContext;->m_callbackinternal:Lcom/meicam/sdk/NvsARFaceContext$NvsARFaceContextCallback;

    iput-object v0, p0, Lcom/meicam/sdk/NvsARFaceContext;->m_callback:Lcom/meicam/sdk/NvsARFaceContext$NvsARFaceContextCallback;

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/meicam/sdk/NvsARFaceContext;->mainHandler:Landroid/os/Handler;

    return-void
.end method

.method private native nativeCleanup(J)V
.end method

.method private native nativeIsFaceTracking(J)Z
.end method

.method private native nativeSetARFaceCallback(JLcom/meicam/sdk/NvsARFaceContext$NvsARFaceContextCallback;)V
.end method

.method private native nativeSetDualBufferInputUsed(JZ)V
.end method


# virtual methods
.method protected finalize()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    iget-wide v0, p0, Lcom/meicam/sdk/NvsARFaceContext;->m_contextInterface:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    iget-wide v0, p0, Lcom/meicam/sdk/NvsARFaceContext;->m_contextInterface:J

    invoke-direct {p0, v0, v1}, Lcom/meicam/sdk/NvsARFaceContext;->nativeCleanup(J)V

    iput-wide v2, p0, Lcom/meicam/sdk/NvsARFaceContext;->m_contextInterface:J

    :cond_0
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method

.method public isFaceTracking()Z
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsARFaceContext;->m_contextInterface:J

    invoke-direct {p0, v0, v1}, Lcom/meicam/sdk/NvsARFaceContext;->nativeIsFaceTracking(J)Z

    move-result v0

    return v0
.end method

.method public setContextCallback(Lcom/meicam/sdk/NvsARFaceContext$NvsARFaceContextCallback;)V
    .locals 2

    iput-object p1, p0, Lcom/meicam/sdk/NvsARFaceContext;->m_callback:Lcom/meicam/sdk/NvsARFaceContext$NvsARFaceContextCallback;

    iget-object p1, p0, Lcom/meicam/sdk/NvsARFaceContext;->m_callback:Lcom/meicam/sdk/NvsARFaceContext$NvsARFaceContextCallback;

    if-eqz p1, :cond_0

    new-instance p1, Lcom/meicam/sdk/NvsARFaceContext$1;

    invoke-direct {p1, p0}, Lcom/meicam/sdk/NvsARFaceContext$1;-><init>(Lcom/meicam/sdk/NvsARFaceContext;)V

    iput-object p1, p0, Lcom/meicam/sdk/NvsARFaceContext;->m_callbackinternal:Lcom/meicam/sdk/NvsARFaceContext$NvsARFaceContextCallback;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/meicam/sdk/NvsARFaceContext;->m_callbackinternal:Lcom/meicam/sdk/NvsARFaceContext$NvsARFaceContextCallback;

    :goto_0
    iget-wide v0, p0, Lcom/meicam/sdk/NvsARFaceContext;->m_contextInterface:J

    iget-object p1, p0, Lcom/meicam/sdk/NvsARFaceContext;->m_callbackinternal:Lcom/meicam/sdk/NvsARFaceContext$NvsARFaceContextCallback;

    invoke-direct {p0, v0, v1, p1}, Lcom/meicam/sdk/NvsARFaceContext;->nativeSetARFaceCallback(JLcom/meicam/sdk/NvsARFaceContext$NvsARFaceContextCallback;)V

    return-void
.end method

.method protected setContextInterface(J)V
    .locals 0

    iput-wide p1, p0, Lcom/meicam/sdk/NvsARFaceContext;->m_contextInterface:J

    return-void
.end method

.method public setDualBufferInputUsed(Z)V
    .locals 2

    iget-wide v0, p0, Lcom/meicam/sdk/NvsARFaceContext;->m_contextInterface:J

    invoke-direct {p0, v0, v1, p1}, Lcom/meicam/sdk/NvsARFaceContext;->nativeSetDualBufferInputUsed(JZ)V

    return-void
.end method
