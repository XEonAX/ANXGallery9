.class public Lcom/meicam/sdk/NvsTimelineAnimatedSticker;
.super Lcom/meicam/sdk/NvsFx;
.source "NvsTimelineAnimatedSticker.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/meicam/sdk/NvsFx;-><init>()V

    return-void
.end method

.method private native nativeChangeInPoint(JJ)J
.end method

.method private native nativeChangeOutPoint(JJ)J
.end method

.method private native nativeGetAnimatedStickerPackageId(J)Ljava/lang/String;
.end method

.method private native nativeGetBoundingRectangleVertices(J)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Ljava/util/List<",
            "Landroid/graphics/PointF;",
            ">;"
        }
    .end annotation
.end method

.method private native nativeGetCenterAzimuthAngle(J)F
.end method

.method private native nativeGetCenterPolarAngle(J)F
.end method

.method private native nativeGetClipAffinityEnabled(J)Z
.end method

.method private native nativeGetDefaultDuration(J)J
.end method

.method private native nativeGetHorizontalFlip(J)Z
.end method

.method private native nativeGetInPoint(J)J
.end method

.method private native nativeGetOriginalBoundingRect(J)Landroid/graphics/RectF;
.end method

.method private native nativeGetOrthoAngleRange(J)F
.end method

.method private native nativeGetOutPoint(J)J
.end method

.method private native nativeGetPolarAngleRange(J)F
.end method

.method private native nativeGetRotationZ(J)F
.end method

.method private native nativeGetScale(J)F
.end method

.method private native nativeGetTranslation(J)Landroid/graphics/PointF;
.end method

.method private native nativeGetVerticalFlip(J)Z
.end method

.method private native nativeGetVolumeGain(J)Lcom/meicam/sdk/NvsVolume;
.end method

.method private native nativeGetZValue(J)F
.end method

.method private native nativeHasAudio(J)Z
.end method

.method private native nativeIsPanoramic(J)Z
.end method

.method private native nativeMovePosition(JJ)V
.end method

.method private native nativeRotateAnimatedSticker(JFLandroid/graphics/PointF;)V
.end method

.method private native nativeScaleAnimatedSticker(JFLandroid/graphics/PointF;)V
.end method

.method private native nativeSetCenterAzimuthAngle(JF)V
.end method

.method private native nativeSetCenterPolarAngle(JF)V
.end method

.method private native nativeSetClipAffinityEnabled(JZ)V
.end method

.method private native nativeSetHorizontalFlip(JZ)V
.end method

.method private native nativeSetPolarAngleRange(JF)V
.end method

.method private native nativeSetRotationZ(JF)V
.end method

.method private native nativeSetScale(JF)V
.end method

.method private native nativeSetTranslation(JLandroid/graphics/PointF;)V
.end method

.method private native nativeSetVerticalFlip(JZ)V
.end method

.method private native nativeSetVolumeGain(JFF)V
.end method

.method private native nativeSetZValue(JF)V
.end method

.method private native nativeTranslateAnimatedSticker(JLandroid/graphics/PointF;)V
.end method


# virtual methods
.method public changeInPoint(J)J
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->m_internalObject:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->nativeChangeInPoint(JJ)J

    move-result-wide p1

    return-wide p1
.end method

.method public changeOutPoint(J)J
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->m_internalObject:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->nativeChangeOutPoint(JJ)J

    move-result-wide p1

    return-wide p1
.end method

.method public getAnimatedStickerPackageId()Ljava/lang/String;
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->m_internalObject:J

    invoke-direct {p0, v0, v1}, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->nativeGetAnimatedStickerPackageId(J)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getBoundingRectangleVertices()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/graphics/PointF;",
            ">;"
        }
    .end annotation

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->m_internalObject:J

    invoke-direct {p0, v0, v1}, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->nativeGetBoundingRectangleVertices(J)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getCenterAzimuthAngle()F
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->m_internalObject:J

    invoke-direct {p0, v0, v1}, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->nativeGetCenterAzimuthAngle(J)F

    move-result v0

    return v0
.end method

.method public getCenterPolarAngle()F
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->m_internalObject:J

    invoke-direct {p0, v0, v1}, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->nativeGetCenterPolarAngle(J)F

    move-result v0

    return v0
.end method

.method public getClipAffinityEnabled()Z
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->m_internalObject:J

    invoke-direct {p0, v0, v1}, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->nativeGetClipAffinityEnabled(J)Z

    move-result v0

    return v0
.end method

.method public getDefaultDuration()J
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->m_internalObject:J

    invoke-direct {p0, v0, v1}, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->nativeGetDefaultDuration(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getHorizontalFlip()Z
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->m_internalObject:J

    invoke-direct {p0, v0, v1}, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->nativeGetHorizontalFlip(J)Z

    move-result v0

    return v0
.end method

.method public getInPoint()J
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->m_internalObject:J

    invoke-direct {p0, v0, v1}, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->nativeGetInPoint(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getOriginalBoundingRect()Landroid/graphics/RectF;
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->m_internalObject:J

    invoke-direct {p0, v0, v1}, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->nativeGetOriginalBoundingRect(J)Landroid/graphics/RectF;

    move-result-object v0

    return-object v0
.end method

.method public getOrthoAngleRange()F
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->m_internalObject:J

    invoke-direct {p0, v0, v1}, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->nativeGetOrthoAngleRange(J)F

    move-result v0

    return v0
.end method

.method public getOutPoint()J
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->m_internalObject:J

    invoke-direct {p0, v0, v1}, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->nativeGetOutPoint(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getPolarAngleRange()F
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->m_internalObject:J

    invoke-direct {p0, v0, v1}, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->nativeGetPolarAngleRange(J)F

    move-result v0

    return v0
.end method

.method public getRotationZ()F
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->m_internalObject:J

    invoke-direct {p0, v0, v1}, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->nativeGetRotationZ(J)F

    move-result v0

    return v0
.end method

.method public getScale()F
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->m_internalObject:J

    invoke-direct {p0, v0, v1}, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->nativeGetScale(J)F

    move-result v0

    return v0
.end method

.method public getTranslation()Landroid/graphics/PointF;
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->m_internalObject:J

    invoke-direct {p0, v0, v1}, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->nativeGetTranslation(J)Landroid/graphics/PointF;

    move-result-object v0

    return-object v0
.end method

.method public getVerticalFlip()Z
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->m_internalObject:J

    invoke-direct {p0, v0, v1}, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->nativeGetVerticalFlip(J)Z

    move-result v0

    return v0
.end method

.method public getVolumeGain()Lcom/meicam/sdk/NvsVolume;
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->m_internalObject:J

    invoke-direct {p0, v0, v1}, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->nativeGetVolumeGain(J)Lcom/meicam/sdk/NvsVolume;

    move-result-object v0

    return-object v0
.end method

.method public getZValue()F
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->m_internalObject:J

    invoke-direct {p0, v0, v1}, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->nativeGetZValue(J)F

    move-result v0

    return v0
.end method

.method public hasAudio()Z
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->m_internalObject:J

    invoke-direct {p0, v0, v1}, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->nativeHasAudio(J)Z

    move-result v0

    return v0
.end method

.method public isPanoramic()Z
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->m_internalObject:J

    invoke-direct {p0, v0, v1}, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->nativeIsPanoramic(J)Z

    move-result v0

    return v0
.end method

.method public movePosition(J)V
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->m_internalObject:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->nativeMovePosition(JJ)V

    return-void
.end method

.method public rotateAnimatedSticker(F)V
    .locals 8

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    invoke-virtual {p0}, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->getBoundingRectangleVertices()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/PointF;

    iget v2, v1, Landroid/graphics/PointF;->x:F

    iget v1, v1, Landroid/graphics/PointF;->y:F

    const/4 v3, 0x1

    move v4, v1

    move v5, v4

    move v1, v2

    :goto_0
    const/4 v6, 0x4

    if-ge v3, v6, :cond_4

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/graphics/PointF;

    iget v7, v6, Landroid/graphics/PointF;->x:F

    cmpg-float v7, v7, v2

    if-gez v7, :cond_0

    iget v2, v6, Landroid/graphics/PointF;->x:F

    goto :goto_1

    :cond_0
    iget v7, v6, Landroid/graphics/PointF;->x:F

    cmpl-float v7, v7, v1

    if-lez v7, :cond_1

    iget v1, v6, Landroid/graphics/PointF;->x:F

    :cond_1
    :goto_1
    iget v7, v6, Landroid/graphics/PointF;->y:F

    cmpg-float v7, v7, v5

    if-gez v7, :cond_2

    iget v5, v6, Landroid/graphics/PointF;->y:F

    goto :goto_2

    :cond_2
    iget v7, v6, Landroid/graphics/PointF;->y:F

    cmpl-float v7, v7, v4

    if-lez v7, :cond_3

    iget v4, v6, Landroid/graphics/PointF;->y:F

    :cond_3
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_4
    new-instance v0, Landroid/graphics/PointF;

    add-float/2addr v2, v1

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v2, v1

    add-float/2addr v4, v5

    div-float/2addr v4, v1

    invoke-direct {v0, v2, v4}, Landroid/graphics/PointF;-><init>(FF)V

    invoke-virtual {p0, p1, v0}, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->rotateAnimatedSticker(FLandroid/graphics/PointF;)V

    return-void
.end method

.method public rotateAnimatedSticker(FLandroid/graphics/PointF;)V
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->m_internalObject:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->nativeRotateAnimatedSticker(JFLandroid/graphics/PointF;)V

    return-void
.end method

.method public scaleAnimatedSticker(FLandroid/graphics/PointF;)V
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->m_internalObject:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->nativeScaleAnimatedSticker(JFLandroid/graphics/PointF;)V

    return-void
.end method

.method public setCenterAzimuthAngle(F)V
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->m_internalObject:J

    invoke-direct {p0, v0, v1, p1}, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->nativeSetCenterAzimuthAngle(JF)V

    return-void
.end method

.method public setCenterPolarAngle(F)V
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->m_internalObject:J

    invoke-direct {p0, v0, v1, p1}, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->nativeSetCenterPolarAngle(JF)V

    return-void
.end method

.method public setClipAffinityEnabled(Z)V
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->m_internalObject:J

    invoke-direct {p0, v0, v1, p1}, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->nativeSetClipAffinityEnabled(JZ)V

    return-void
.end method

.method public setHorizontalFlip(Z)V
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->m_internalObject:J

    invoke-direct {p0, v0, v1, p1}, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->nativeSetHorizontalFlip(JZ)V

    return-void
.end method

.method public setPolarAngleRange(F)V
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->m_internalObject:J

    invoke-direct {p0, v0, v1, p1}, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->nativeSetPolarAngleRange(JF)V

    return-void
.end method

.method public setRotationZ(F)V
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->m_internalObject:J

    invoke-direct {p0, v0, v1, p1}, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->nativeSetRotationZ(JF)V

    return-void
.end method

.method public setScale(F)V
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->m_internalObject:J

    invoke-direct {p0, v0, v1, p1}, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->nativeSetScale(JF)V

    return-void
.end method

.method public setTranslation(Landroid/graphics/PointF;)V
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->m_internalObject:J

    invoke-direct {p0, v0, v1, p1}, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->nativeSetTranslation(JLandroid/graphics/PointF;)V

    return-void
.end method

.method public setVerticalFlip(Z)V
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->m_internalObject:J

    invoke-direct {p0, v0, v1, p1}, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->nativeSetVerticalFlip(JZ)V

    return-void
.end method

.method public setVolumeGain(FF)V
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->m_internalObject:J

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->nativeSetVolumeGain(JFF)V

    return-void
.end method

.method public setZValue(F)V
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->m_internalObject:J

    invoke-direct {p0, v0, v1, p1}, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->nativeSetZValue(JF)V

    return-void
.end method

.method public translateAnimatedSticker(Landroid/graphics/PointF;)V
    .locals 2

    invoke-static {}, Lcom/meicam/sdk/NvsUtils;->checkFunctionInMainThread()Z

    iget-wide v0, p0, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->m_internalObject:J

    invoke-direct {p0, v0, v1, p1}, Lcom/meicam/sdk/NvsTimelineAnimatedSticker;->nativeTranslateAnimatedSticker(JLandroid/graphics/PointF;)V

    return-void
.end method
