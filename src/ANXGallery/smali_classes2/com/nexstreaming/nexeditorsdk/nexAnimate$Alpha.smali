.class public Lcom/nexstreaming/nexeditorsdk/nexAnimate$Alpha;
.super Lcom/nexstreaming/nexeditorsdk/nexAnimate;
.source "nexAnimate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nexstreaming/nexeditorsdk/nexAnimate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "Alpha"
.end annotation


# instance fields
.field private final mEnd:F

.field private final mStart:F


# direct methods
.method protected constructor <init>(IIFF)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;-><init>(II)V

    iput p3, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Alpha;->mStart:F

    iput p4, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Alpha;->mEnd:F

    return-void
.end method


# virtual methods
.method protected getAlpha(I)F
    .locals 3

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Alpha;->mEnd:F

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Alpha;->mStart:F

    sub-float/2addr v0, v1

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Alpha;->timeRatio(I)F

    move-result p1

    mul-float v0, v0, p1

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Alpha;->mStart:F

    add-float/2addr v0, p1

    const/high16 p1, 0x3f800000    # 1.0f

    cmpl-float v1, v0, p1

    const/4 v2, 0x0

    if-lez v1, :cond_0

    goto :goto_0

    :cond_0
    cmpg-float p1, v0, v2

    if-gez p1, :cond_1

    const/4 p1, 0x0

    goto :goto_0

    :cond_1
    move p1, v0

    :goto_0
    return p1
.end method
