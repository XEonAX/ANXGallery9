.class public abstract Lcom/nexstreaming/nexeditorsdk/nexAnimate;
.super Ljava/lang/Object;
.source "nexAnimate.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;,
        Lcom/nexstreaming/nexeditorsdk/nexAnimate$Rotate;,
        Lcom/nexstreaming/nexeditorsdk/nexAnimate$Alpha;,
        Lcom/nexstreaming/nexeditorsdk/nexAnimate$Move;,
        Lcom/nexstreaming/nexeditorsdk/nexAnimate$AnimateImages;,
        Lcom/nexstreaming/nexeditorsdk/nexAnimate$MoveTrackingPath;
    }
.end annotation


# static fields
.field public static final kCoordinateX:I = 0x1

.field public static final kCoordinateY:I = 0x2

.field public static final kCoordinateZ:I = 0x3


# instance fields
.field protected mAlpha:F

.field protected mDuration:I

.field protected mRotateDegreeX:F

.field protected mRotateDegreeY:F

.field protected mRotateDegreeZ:F

.field protected mScaledX:F

.field protected mScaledY:F

.field protected mScaledZ:F

.field protected mStartTime:I

.field private mTimeInterpolator:Landroid/animation/TimeInterpolator;

.field protected mdX:I

.field protected mdY:I

.field protected mdZ:I


# direct methods
.method protected constructor <init>(II)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mdX:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mdY:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mdZ:I

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mAlpha:F

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mScaledX:F

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mScaledY:F

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mScaledZ:F

    const/4 v0, 0x0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mRotateDegreeX:F

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mRotateDegreeY:F

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mRotateDegreeZ:F

    if-lez p2, :cond_0

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mStartTime:I

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mDuration:I

    return-void

    :cond_0
    new-instance p1, Lcom/nexstreaming/nexeditorsdk/exception/InvalidRangeException;

    invoke-direct {p1, p2}, Lcom/nexstreaming/nexeditorsdk/exception/InvalidRangeException;-><init>(I)V

    throw p1
.end method

.method public static getAlpha(IIFF)Lcom/nexstreaming/nexeditorsdk/nexAnimate;
    .locals 1

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Alpha;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Alpha;-><init>(IIFF)V

    return-object v0
.end method

.method public static varargs getAnimateImages(II[I)Lcom/nexstreaming/nexeditorsdk/nexAnimate;
    .locals 1

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$AnimateImages;

    invoke-direct {v0, p0, p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexAnimate$AnimateImages;-><init>(II[I)V

    return-object v0
.end method

.method public static getMove(IILcom/nexstreaming/nexeditorsdk/nexAnimate$MoveTrackingPath;)Lcom/nexstreaming/nexeditorsdk/nexAnimate;
    .locals 1

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Move;

    invoke-direct {v0, p0, p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Move;-><init>(IILcom/nexstreaming/nexeditorsdk/nexAnimate$MoveTrackingPath;)V

    return-object v0
.end method

.method public static getRotate(IIZFLcom/nexstreaming/nexeditorsdk/nexAnimate$MoveTrackingPath;)Lcom/nexstreaming/nexeditorsdk/nexAnimate;
    .locals 8

    new-instance v7, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Rotate;

    const/4 v5, 0x3

    move-object v0, v7

    move v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move-object v6, p4

    invoke-direct/range {v0 .. v6}, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Rotate;-><init>(IIZFILcom/nexstreaming/nexeditorsdk/nexAnimate$MoveTrackingPath;)V

    return-object v7
.end method

.method public static getScale(IIFF)Lcom/nexstreaming/nexeditorsdk/nexAnimate;
    .locals 7

    new-instance v6, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;

    const/high16 v5, 0x3f800000    # 1.0f

    move-object v0, v6

    move v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;-><init>(IIFFF)V

    return-object v6
.end method

.method public static getScale(IIFFFF)Lcom/nexstreaming/nexeditorsdk/nexAnimate;
    .locals 10

    new-instance v9, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;

    const/high16 v5, 0x3f800000    # 1.0f

    const/high16 v8, 0x3f800000    # 1.0f

    move-object v0, v9

    move v1, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move v6, p4

    move v7, p5

    invoke-direct/range {v0 .. v8}, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;-><init>(IIFFFFFF)V

    return-object v9
.end method

.method public static getScale(IILcom/nexstreaming/nexeditorsdk/nexAnimate$MoveTrackingPath;)Lcom/nexstreaming/nexeditorsdk/nexAnimate;
    .locals 1

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;

    invoke-direct {v0, p0, p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Scale;-><init>(IILcom/nexstreaming/nexeditorsdk/nexAnimate$MoveTrackingPath;)V

    return-object v0
.end method


# virtual methods
.method protected getAlpha(I)F
    .locals 0

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mAlpha:F

    return p1
.end method

.method protected getAngleDegree(IFI)F
    .locals 0

    const/4 p1, 0x1

    if-ne p3, p1, :cond_0

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mRotateDegreeX:F

    return p1

    :cond_0
    const/4 p1, 0x2

    if-ne p3, p1, :cond_1

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mRotateDegreeY:F

    return p1

    :cond_1
    const/4 p1, 0x3

    if-ne p3, p1, :cond_2

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mRotateDegreeZ:F

    return p1

    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method protected getEndTime()I
    .locals 2

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mStartTime:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mDuration:I

    add-int/2addr v0, v1

    return v0
.end method

.method getImageResourceId(I)I
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method protected getScaledRatio(IFI)F
    .locals 0

    const/4 p1, 0x1

    if-ne p3, p1, :cond_0

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mScaledX:F

    return p1

    :cond_0
    const/4 p1, 0x2

    if-ne p3, p1, :cond_1

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mScaledY:F

    return p1

    :cond_1
    const/4 p1, 0x3

    if-ne p3, p1, :cond_2

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mScaledZ:F

    return p1

    :cond_2
    const/high16 p1, 0x3f800000    # 1.0f

    return p1
.end method

.method protected getTranslatePosition(II)F
    .locals 0

    const/4 p1, 0x1

    if-ne p2, p1, :cond_0

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mdX:I

    int-to-float p1, p1

    return p1

    :cond_0
    const/4 p1, 0x2

    if-ne p2, p1, :cond_1

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mdY:I

    int-to-float p1, p1

    return p1

    :cond_1
    const/4 p1, 0x3

    if-ne p2, p1, :cond_2

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mdZ:I

    int-to-float p1, p1

    return p1

    :cond_2
    const/4 p1, 0x0

    return p1
.end method

.method protected onFreeTypeAnimate(ILcom/nexstreaming/nexeditorsdk/nexOverlayItem;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public resetFreeTypeAnimate()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mdX:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mdY:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mdZ:I

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mAlpha:F

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mScaledX:F

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mScaledY:F

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mScaledZ:F

    const/4 v0, 0x0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mRotateDegreeX:F

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mRotateDegreeY:F

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mRotateDegreeZ:F

    return-void
.end method

.method public setInterpolator(Landroid/animation/TimeInterpolator;)Lcom/nexstreaming/nexeditorsdk/nexAnimate;
    .locals 0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mTimeInterpolator:Landroid/animation/TimeInterpolator;

    return-object p0
.end method

.method public setTime(II)V
    .locals 0

    if-lez p2, :cond_0

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mStartTime:I

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mDuration:I

    return-void

    :cond_0
    new-instance p1, Lcom/nexstreaming/nexeditorsdk/exception/InvalidRangeException;

    invoke-direct {p1, p2}, Lcom/nexstreaming/nexeditorsdk/exception/InvalidRangeException;-><init>(I)V

    throw p1
.end method

.method protected timeRatio(I)F
    .locals 4

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mStartTime:I

    sub-int v0, p1, v0

    int-to-float v0, v0

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mDuration:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    const-string v1, "timeRatio"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "timeRatio ="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v3, ",mTime = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/high16 p1, 0x3f800000    # 1.0f

    cmpl-float v1, v0, p1

    if-lez v1, :cond_0

    goto :goto_0

    :cond_0
    move p1, v0

    :goto_0
    const/4 v0, 0x0

    cmpg-float v1, p1, v0

    if-gez v1, :cond_1

    const/4 p1, 0x0

    :cond_1
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mTimeInterpolator:Landroid/animation/TimeInterpolator;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate;->mTimeInterpolator:Landroid/animation/TimeInterpolator;

    invoke-interface {v0, p1}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    move-result p1

    return p1

    :cond_2
    return p1
.end method
