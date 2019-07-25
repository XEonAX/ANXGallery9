.class Lcom/nexstreaming/nexeditorsdk/b;
.super Ljava/lang/Object;
.source "nexObserver.java"


# instance fields
.field protected mClipTimeUpdated:Z

.field protected mEffectLoad2Engine:I

.field protected mNeedLoadList:Z


# direct methods
.method constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/b;->mClipTimeUpdated:Z

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/b;->mNeedLoadList:Z

    return-void
.end method


# virtual methods
.method setEffectLoad(I)Z
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/b;->mEffectLoad2Engine:I

    if-ne v0, p1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/b;->mEffectLoad2Engine:I

    const/4 p1, 0x1

    return p1
.end method

.method updateTimeLine(Z)V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/b;->mNeedLoadList:Z

    if-nez p1, :cond_0

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/b;->mClipTimeUpdated:Z

    :cond_0
    return-void
.end method
