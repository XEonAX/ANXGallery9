.class public Lcom/nexstreaming/nexeditorsdk/nexAnimate$Rotate;
.super Lcom/nexstreaming/nexeditorsdk/nexAnimate;
.source "nexAnimate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nexstreaming/nexeditorsdk/nexAnimate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "Rotate"
.end annotation


# instance fields
.field private mCenter:Lcom/nexstreaming/nexeditorsdk/nexAnimate$MoveTrackingPath;

.field private final mClockWise:Z

.field private final mXAxisRotateDegree:F

.field private final mYAxisRotateDegree:F

.field private final mZAxisRotateDegree:F


# direct methods
.method protected constructor <init>(IIZFILcom/nexstreaming/nexeditorsdk/nexAnimate$MoveTrackingPath;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;-><init>(II)V

    iput-boolean p3, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Rotate;->mClockWise:Z

    const/4 p1, 0x0

    const/4 p2, 0x1

    if-ne p5, p2, :cond_0

    iput p4, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Rotate;->mXAxisRotateDegree:F

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Rotate;->mYAxisRotateDegree:F

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Rotate;->mZAxisRotateDegree:F

    goto :goto_0

    :cond_0
    const/4 p2, 0x2

    if-ne p5, p2, :cond_1

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Rotate;->mXAxisRotateDegree:F

    iput p4, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Rotate;->mYAxisRotateDegree:F

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Rotate;->mZAxisRotateDegree:F

    goto :goto_0

    :cond_1
    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Rotate;->mXAxisRotateDegree:F

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Rotate;->mYAxisRotateDegree:F

    iput p4, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Rotate;->mZAxisRotateDegree:F

    :goto_0
    iput-object p6, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Rotate;->mCenter:Lcom/nexstreaming/nexeditorsdk/nexAnimate$MoveTrackingPath;

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Rotate;->mCenter:Lcom/nexstreaming/nexeditorsdk/nexAnimate$MoveTrackingPath;

    if-nez p1, :cond_2

    new-instance p1, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Rotate$1;

    invoke-direct {p1, p0}, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Rotate$1;-><init>(Lcom/nexstreaming/nexeditorsdk/nexAnimate$Rotate;)V

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Rotate;->mCenter:Lcom/nexstreaming/nexeditorsdk/nexAnimate$MoveTrackingPath;

    :cond_2
    return-void
.end method


# virtual methods
.method protected getAngleDegree(IFI)F
    .locals 1

    const/4 v0, 0x3

    if-ne p3, v0, :cond_0

    iget p3, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Rotate;->mZAxisRotateDegree:F

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Rotate;->timeRatio(I)F

    move-result p1

    mul-float p3, p3, p1

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    if-ne p3, v0, :cond_1

    iget p3, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Rotate;->mXAxisRotateDegree:F

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Rotate;->timeRatio(I)F

    move-result p1

    mul-float p3, p3, p1

    goto :goto_0

    :cond_1
    const/4 v0, 0x2

    if-ne p3, v0, :cond_2

    iget p3, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Rotate;->mYAxisRotateDegree:F

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Rotate;->timeRatio(I)F

    move-result p1

    mul-float p3, p3, p1

    goto :goto_0

    :cond_2
    const/4 p3, 0x0

    :goto_0
    iget-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Rotate;->mClockWise:Z

    if-nez p1, :cond_3

    const/high16 p1, -0x40800000    # -1.0f

    mul-float p3, p3, p1

    :cond_3
    add-float/2addr p2, p3

    const/high16 p1, 0x43b40000    # 360.0f

    rem-float/2addr p2, p1

    return p2
.end method

.method protected getTranslatePosition(II)F
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Rotate;->mCenter:Lcom/nexstreaming/nexeditorsdk/nexAnimate$MoveTrackingPath;

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Rotate;->timeRatio(I)F

    move-result p1

    invoke-interface {v0, p2, p1}, Lcom/nexstreaming/nexeditorsdk/nexAnimate$MoveTrackingPath;->getTranslatePosition(IF)F

    move-result p1

    return p1
.end method
