.class public Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;
.super Lcom/nexstreaming/nexeditorsdk/nexAnimate;
.source "nexAnimate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nexstreaming/nexeditorsdk/nexAnimate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "Scale"
.end annotation


# instance fields
.field protected final mLastScaledX:F

.field protected final mLastScaledY:F

.field protected final mLastScaledZ:F

.field private mPath:Lcom/nexstreaming/nexeditorsdk/nexAnimate$MoveTrackingPath;

.field protected final mSetStart:Z

.field protected final mStartScaledX:F

.field protected final mStartScaledY:F

.field protected final mStartScaledZ:F


# direct methods
.method protected constructor <init>(IIFFF)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;-><init>(II)V

    const/4 p1, 0x0

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;->mStartScaledX:F

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;->mStartScaledY:F

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;->mStartScaledZ:F

    iput p3, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;->mLastScaledX:F

    iput p4, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;->mLastScaledY:F

    iput p5, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;->mLastScaledZ:F

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;->mSetStart:Z

    return-void
.end method

.method protected constructor <init>(IIFFFFFF)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;-><init>(II)V

    iput p3, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;->mStartScaledX:F

    iput p4, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;->mStartScaledY:F

    iput p5, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;->mStartScaledZ:F

    iput p6, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;->mLastScaledX:F

    iput p7, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;->mLastScaledY:F

    iput p8, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;->mLastScaledZ:F

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;->mSetStart:Z

    return-void
.end method

.method protected constructor <init>(IILcom/nexstreaming/nexeditorsdk/nexAnimate$MoveTrackingPath;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;-><init>(II)V

    const/4 p1, 0x0

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;->mStartScaledX:F

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;->mStartScaledY:F

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;->mStartScaledZ:F

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;->mLastScaledX:F

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;->mLastScaledY:F

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;->mLastScaledZ:F

    iput-object p3, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;->mPath:Lcom/nexstreaming/nexeditorsdk/nexAnimate$MoveTrackingPath;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;->mSetStart:Z

    return-void
.end method


# virtual methods
.method protected getScaledRatio(IFI)F
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;->mPath:Lcom/nexstreaming/nexeditorsdk/nexAnimate$MoveTrackingPath;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;->mPath:Lcom/nexstreaming/nexeditorsdk/nexAnimate$MoveTrackingPath;

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;->timeRatio(I)F

    move-result p1

    invoke-interface {v0, p3, p1}, Lcom/nexstreaming/nexeditorsdk/nexAnimate$MoveTrackingPath;->getTranslatePosition(IF)F

    move-result p1

    add-float/2addr p2, p1

    return p2

    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x1

    if-ne p3, v1, :cond_1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;->mLastScaledX:F

    iget-boolean p3, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;->mSetStart:Z

    if-eqz p3, :cond_3

    iget p2, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;->mStartScaledX:F

    goto :goto_0

    :cond_1
    const/4 v1, 0x2

    if-ne p3, v1, :cond_2

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;->mLastScaledY:F

    iget-boolean p3, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;->mSetStart:Z

    if-eqz p3, :cond_3

    iget p2, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;->mStartScaledY:F

    goto :goto_0

    :cond_2
    const/4 v1, 0x3

    if-ne p3, v1, :cond_3

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;->mLastScaledZ:F

    iget-boolean p3, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;->mSetStart:Z

    if-eqz p3, :cond_3

    iget p2, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;->mStartScaledZ:F

    :cond_3
    :goto_0
    cmpl-float p3, v0, p2

    if-lez p3, :cond_4

    sub-float/2addr v0, p2

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;->timeRatio(I)F

    move-result p1

    mul-float v0, v0, p1

    add-float/2addr p2, v0

    return p2

    :cond_4
    sub-float p3, p2, v0

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;->timeRatio(I)F

    move-result p1

    mul-float p3, p3, p1

    sub-float/2addr p2, p3

    return p2
.end method
