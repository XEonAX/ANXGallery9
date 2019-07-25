.class public Lcom/miui/gallery/assistant/jni/score/QualityScore;
.super Ljava/lang/Object;
.source "QualityScore.java"


# instance fields
.field private iqaBala:D

.field private iqaBlur:D

.field private iqaBlurType:D

.field private iqaComp:D

.field private iqaExpo:D

.field private iqaHaze:D

.field private iqaNima:D

.field private iqaNois:D

.field private iqaSatu:D


# direct methods
.method public constructor <init>([D)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    array-length v0, p1

    const/16 v1, 0x9

    if-ge v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    aget-wide v0, p1, v0

    iput-wide v0, p0, Lcom/miui/gallery/assistant/jni/score/QualityScore;->iqaExpo:D

    const/4 v0, 0x1

    aget-wide v0, p1, v0

    iput-wide v0, p0, Lcom/miui/gallery/assistant/jni/score/QualityScore;->iqaSatu:D

    const/4 v0, 0x2

    aget-wide v0, p1, v0

    iput-wide v0, p0, Lcom/miui/gallery/assistant/jni/score/QualityScore;->iqaBala:D

    const/4 v0, 0x3

    aget-wide v0, p1, v0

    iput-wide v0, p0, Lcom/miui/gallery/assistant/jni/score/QualityScore;->iqaHaze:D

    const/4 v0, 0x4

    aget-wide v0, p1, v0

    iput-wide v0, p0, Lcom/miui/gallery/assistant/jni/score/QualityScore;->iqaNois:D

    const/4 v0, 0x5

    aget-wide v0, p1, v0

    iput-wide v0, p0, Lcom/miui/gallery/assistant/jni/score/QualityScore;->iqaBlur:D

    const/4 v0, 0x6

    aget-wide v0, p1, v0

    iput-wide v0, p0, Lcom/miui/gallery/assistant/jni/score/QualityScore;->iqaComp:D

    const/4 v0, 0x7

    aget-wide v0, p1, v0

    iput-wide v0, p0, Lcom/miui/gallery/assistant/jni/score/QualityScore;->iqaNima:D

    const/16 v0, 0x8

    aget-wide v0, p1, v0

    iput-wide v0, p0, Lcom/miui/gallery/assistant/jni/score/QualityScore;->iqaBlurType:D

    return-void

    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public getIqaBala()D
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/assistant/jni/score/QualityScore;->iqaBala:D

    return-wide v0
.end method

.method public getIqaBlur()D
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/assistant/jni/score/QualityScore;->iqaBlur:D

    return-wide v0
.end method

.method public getIqaBlurType()D
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/assistant/jni/score/QualityScore;->iqaBlurType:D

    return-wide v0
.end method

.method public getIqaComp()D
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/assistant/jni/score/QualityScore;->iqaComp:D

    return-wide v0
.end method

.method public getIqaExpo()D
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/assistant/jni/score/QualityScore;->iqaExpo:D

    return-wide v0
.end method

.method public getIqaHaze()D
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/assistant/jni/score/QualityScore;->iqaHaze:D

    return-wide v0
.end method

.method public getIqaNima()D
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/assistant/jni/score/QualityScore;->iqaNima:D

    return-wide v0
.end method

.method public getIqaNois()D
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/assistant/jni/score/QualityScore;->iqaNois:D

    return-wide v0
.end method

.method public getIqaSatu()D
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/assistant/jni/score/QualityScore;->iqaSatu:D

    return-wide v0
.end method
