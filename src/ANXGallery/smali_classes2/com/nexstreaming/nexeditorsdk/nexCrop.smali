.class public final Lcom/nexstreaming/nexeditorsdk/nexCrop;
.super Ljava/lang/Object;
.source "nexCrop.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;
    }
.end annotation


# static fields
.field public static final ABSTRACT_DIMENSION:I = 0x186a0

.field static final TAG:Ljava/lang/String; = "nexCrop"


# instance fields
.field private clip_druation:I

.field private facedetect_speed:I

.field private m_endLock:Z

.field private m_endMatrix:[F

.field m_endPositionBottom:I

.field m_endPositionLeft:I

.field m_endPositionRight:I

.field m_endPositionTop:I

.field private m_faceBounds_bottom:F

.field private m_faceBounds_left:F

.field private m_faceBounds_right:F

.field private m_faceBounds_set:Z

.field private m_faceBounds_top:F

.field m_facePositionBottom:I

.field m_facePositionLeft:I

.field m_facePositionRight:I

.field m_facePositionTop:I

.field private m_height:I

.field private final m_mediaPath:Ljava/lang/String;

.field m_rotatedEndPositionBottom:I

.field m_rotatedEndPositionLeft:I

.field m_rotatedEndPositionRight:I

.field m_rotatedEndPositionTop:I

.field m_rotatedFacePositionBottom:I

.field m_rotatedFacePositionLeft:I

.field m_rotatedFacePositionRight:I

.field m_rotatedFacePositionTop:I

.field m_rotatedStartPositionBottom:I

.field m_rotatedStartPositionLeft:I

.field m_rotatedStartPositionRight:I

.field m_rotatedStartPositionTop:I

.field m_rotation:I

.field private m_startLock:Z

.field private m_startMatrix:[F

.field m_startPositionBottom:I

.field m_startPositionLeft:I

.field m_startPositionRight:I

.field m_startPositionTop:I

.field private m_width:I


# direct methods
.method constructor <init>(Ljava/lang/String;IIII)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionLeft:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionBottom:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionRight:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionTop:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endPositionLeft:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endPositionBottom:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endPositionRight:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endPositionTop:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionLeft:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionBottom:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionRight:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionTop:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedEndPositionLeft:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedEndPositionBottom:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedEndPositionRight:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedEndPositionTop:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_facePositionLeft:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_facePositionTop:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_facePositionRight:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_facePositionBottom:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedFacePositionLeft:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedFacePositionTop:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedFacePositionRight:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedFacePositionBottom:I

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startLock:Z

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endLock:Z

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotation:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_width:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_height:I

    const/16 v1, 0x65

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->facedetect_speed:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->clip_druation:I

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_mediaPath:Ljava/lang/String;

    iput p2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_width:I

    iput p3, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_height:I

    iput p4, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotation:I

    iput p5, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->clip_druation:I

    sget-object p1, Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;->PAN_RAND:Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;

    invoke-virtual {p0, v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->randomizeStartEndPosition(ZLcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;)V

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionLeft:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionBottom:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionRight:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionTop:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endPositionLeft:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endPositionBottom:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endPositionRight:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endPositionTop:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionLeft:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionBottom:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionRight:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionTop:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedEndPositionLeft:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedEndPositionBottom:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedEndPositionRight:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedEndPositionTop:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_facePositionLeft:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_facePositionTop:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_facePositionRight:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_facePositionBottom:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedFacePositionLeft:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedFacePositionTop:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedFacePositionRight:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedFacePositionBottom:I

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startLock:Z

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endLock:Z

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotation:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_width:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_height:I

    const/16 v1, 0x65

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->facedetect_speed:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->clip_druation:I

    iget v0, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_startPositionLeft:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionLeft:I

    iget v0, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_startPositionBottom:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionBottom:I

    iget v0, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_startPositionRight:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionRight:I

    iget v0, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_startPositionTop:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionTop:I

    iget v0, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_endPositionLeft:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endPositionLeft:I

    iget v0, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_endPositionBottom:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endPositionBottom:I

    iget v0, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_endPositionRight:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endPositionRight:I

    iget v0, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_endPositionTop:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endPositionTop:I

    iget v0, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_rotatedStartPositionLeft:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionLeft:I

    iget v0, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_rotatedStartPositionBottom:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionBottom:I

    iget v0, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_rotatedStartPositionRight:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionRight:I

    iget v0, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_rotatedStartPositionTop:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionTop:I

    iget v0, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_rotatedEndPositionLeft:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedEndPositionLeft:I

    iget v0, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_rotatedEndPositionBottom:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedEndPositionBottom:I

    iget v0, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_rotatedEndPositionRight:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedEndPositionRight:I

    iget v0, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_rotatedEndPositionTop:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedEndPositionTop:I

    iget v0, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_facePositionLeft:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_facePositionLeft:I

    iget v0, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_facePositionTop:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_facePositionTop:I

    iget v0, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_facePositionRight:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_facePositionRight:I

    iget v0, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_facePositionBottom:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_facePositionBottom:I

    iget v0, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_rotatedFacePositionLeft:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedFacePositionLeft:I

    iget v0, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_rotatedFacePositionTop:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedFacePositionTop:I

    iget v0, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_rotatedFacePositionRight:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedFacePositionRight:I

    iget v0, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_rotatedFacePositionBottom:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedFacePositionBottom:I

    iget v0, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_rotation:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotation:I

    iget v0, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_width:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_width:I

    iget v0, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_height:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_height:I

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_mediaPath:Ljava/lang/String;

    iget p1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_faceBounds_left:F

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_faceBounds_left:F

    iget p1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_faceBounds_top:F

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_faceBounds_top:F

    iget p1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_faceBounds_right:F

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_faceBounds_right:F

    iget p1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_faceBounds_bottom:F

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_faceBounds_bottom:F

    iget-boolean p1, p2, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_faceBounds_set:Z

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_faceBounds_set:Z

    return-void
.end method

.method private calculateFaceBounds()V
    .locals 19

    move-object/from16 v0, p0

    iget-boolean v1, v0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_faceBounds_set:Z

    if-eqz v1, :cond_0

    return-void

    :cond_0
    invoke-direct/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->loadImageForFaceRecognition()Landroid/graphics/Bitmap;

    move-result-object v1

    if-nez v1, :cond_1

    return-void

    :cond_1
    const/16 v2, 0x20

    new-array v3, v2, [Landroid/media/FaceDetector$Face;

    new-instance v4, Landroid/media/FaceDetector;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    invoke-direct {v4, v5, v6, v2}, Landroid/media/FaceDetector;-><init>(III)V

    invoke-virtual {v4, v1, v3}, Landroid/media/FaceDetector;->findFaces(Landroid/graphics/Bitmap;[Landroid/media/FaceDetector$Face;)I

    move-result v2

    new-instance v4, Landroid/graphics/RectF;

    invoke-direct {v4}, Landroid/graphics/RectF;-><init>()V

    new-instance v5, Landroid/graphics/RectF;

    invoke-direct {v5}, Landroid/graphics/RectF;-><init>()V

    new-instance v6, Landroid/graphics/PointF;

    invoke-direct {v6}, Landroid/graphics/PointF;-><init>()V

    invoke-virtual/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getWidth()I

    move-result v7

    int-to-float v7, v7

    invoke-virtual/range {p0 .. p0}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getHeight()I

    move-result v8

    int-to-float v8, v8

    const/high16 v9, 0x41f00000    # 30.0f

    div-float v10, v7, v9

    div-float v9, v8, v9

    const/4 v11, 0x0

    :goto_0
    const/high16 v12, 0x40000000    # 2.0f

    if-ge v11, v2, :cond_5

    const-string v13, "nexCrop"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "face : "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v15, " c="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v15, v3, v11

    invoke-virtual {v15}, Landroid/media/FaceDetector$Face;->confidence()F

    move-result v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v15, " e="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v15, v3, v11

    invoke-virtual {v15}, Landroid/media/FaceDetector$Face;->eyesDistance()F

    move-result v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v15, " faceMinWidth="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v15, " faceMinHeight="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    aget-object v13, v3, v11

    invoke-virtual {v13}, Landroid/media/FaceDetector$Face;->confidence()F

    move-result v13

    float-to-double v13, v13

    const-wide v15, 0x3fd999999999999aL    # 0.4

    cmpg-double v17, v13, v15

    if-gez v17, :cond_3

    :cond_2
    :goto_1
    move/from16 v18, v2

    goto :goto_2

    :cond_3
    aget-object v13, v3, v11

    invoke-virtual {v13, v6}, Landroid/media/FaceDetector$Face;->getMidPoint(Landroid/graphics/PointF;)V

    aget-object v13, v3, v11

    invoke-virtual {v13}, Landroid/media/FaceDetector$Face;->eyesDistance()F

    move-result v13

    cmpg-float v14, v13, v10

    if-ltz v14, :cond_2

    cmpg-float v14, v13, v9

    if-gez v14, :cond_4

    goto :goto_1

    :cond_4
    iget v14, v6, Landroid/graphics/PointF;->x:F

    div-float v15, v13, v12

    sub-float/2addr v14, v15

    div-float/2addr v14, v7

    iget v12, v6, Landroid/graphics/PointF;->y:F

    const/high16 v16, 0x40400000    # 3.0f

    div-float v13, v13, v16

    sub-float/2addr v12, v13

    div-float/2addr v12, v8

    move/from16 v18, v2

    iget v2, v6, Landroid/graphics/PointF;->x:F

    add-float/2addr v2, v15

    div-float/2addr v2, v7

    iget v15, v6, Landroid/graphics/PointF;->y:F

    const/high16 v16, 0x40000000    # 2.0f

    mul-float v13, v13, v16

    add-float/2addr v15, v13

    div-float/2addr v15, v8

    invoke-virtual {v5, v14, v12, v2, v15}, Landroid/graphics/RectF;->set(FFFF)V

    invoke-virtual {v4, v5}, Landroid/graphics/RectF;->union(Landroid/graphics/RectF;)V

    :goto_2
    add-int/lit8 v11, v11, 0x1

    move/from16 v2, v18

    goto/16 :goto_0

    :cond_5
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    const-string v1, "nexCrop"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "face bounds : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v4}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_7

    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v1

    const v3, 0x3f19999a    # 0.6f

    sub-float v1, v3, v1

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v5

    sub-float/2addr v3, v5

    cmpl-float v5, v1, v2

    if-lez v5, :cond_6

    iget v5, v4, Landroid/graphics/RectF;->left:F

    const/high16 v6, 0x40000000    # 2.0f

    div-float/2addr v1, v6

    sub-float/2addr v5, v1

    iput v5, v4, Landroid/graphics/RectF;->left:F

    iget v5, v4, Landroid/graphics/RectF;->right:F

    add-float/2addr v5, v1

    iput v5, v4, Landroid/graphics/RectF;->right:F

    goto :goto_3

    :cond_6
    const/high16 v6, 0x40000000    # 2.0f

    :goto_3
    cmpl-float v1, v3, v2

    if-lez v1, :cond_7

    iget v1, v4, Landroid/graphics/RectF;->top:F

    div-float/2addr v3, v6

    sub-float/2addr v1, v3

    iput v1, v4, Landroid/graphics/RectF;->top:F

    iget v1, v4, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v1, v3

    iput v1, v4, Landroid/graphics/RectF;->bottom:F

    :cond_7
    const-string v1, "nexCrop"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "face bounds (final) : "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_faceBounds_set:Z

    iget v1, v4, Landroid/graphics/RectF;->left:F

    invoke-static {v2, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_faceBounds_left:F

    iget v1, v4, Landroid/graphics/RectF;->top:F

    invoke-static {v2, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_faceBounds_top:F

    iget v1, v4, Landroid/graphics/RectF;->right:F

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_faceBounds_right:F

    iget v1, v4, Landroid/graphics/RectF;->bottom:F

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_faceBounds_bottom:F

    return-void
.end method

.method protected static clone(Lcom/nexstreaming/nexeditorsdk/nexCrop;)Lcom/nexstreaming/nexeditorsdk/nexCrop;
    .locals 0

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/CloneNotSupportedException;->printStackTrace()V

    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method

.method static enhancedCrop(Landroid/graphics/Rect;IIFF)V
    .locals 11

    iget p1, p0, Landroid/graphics/Rect;->left:I

    iget p3, p0, Landroid/graphics/Rect;->top:I

    iget v0, p0, Landroid/graphics/Rect;->right:I

    iget v1, p0, Landroid/graphics/Rect;->bottom:I

    iget v2, p0, Landroid/graphics/Rect;->top:I

    if-nez v2, :cond_0

    return-void

    :cond_0
    sub-int/2addr v1, p3

    int-to-float v1, v1

    div-float p4, v1, p4

    int-to-float p2, p2

    const/high16 v2, 0x3f800000    # 1.0f

    div-float p2, v2, p2

    const v3, 0x47c35000    # 100000.0f

    mul-float p2, p2, v3

    div-float p2, p4, p2

    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    move-result p3

    int-to-float p3, p3

    div-float/2addr p3, p4

    float-to-int p3, p3

    int-to-float v3, p3

    const/high16 v4, 0x41200000    # 10.0f

    div-float/2addr v3, v4

    float-to-int v3, v3

    add-int v4, p3, v3

    sub-int/2addr p3, v3

    move v3, p3

    :goto_0
    if-ge p3, v4, :cond_2

    int-to-float v5, p3

    mul-float v5, v5, p2

    float-to-double v5, v5

    invoke-static {v5, v6}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v7

    invoke-static {v5, v6}, Ljava/lang/Double;->isNaN(D)Z

    sub-double/2addr v7, v5

    invoke-static {v5, v6}, Ljava/lang/Math;->floor(D)D

    move-result-wide v9

    invoke-static {v5, v6}, Ljava/lang/Double;->isNaN(D)Z

    sub-double/2addr v5, v9

    invoke-static {v7, v8, v5, v6}, Ljava/lang/Math;->min(DD)D

    move-result-wide v5

    double-to-float v5, v5

    cmpl-float v6, v2, v5

    if-lez v6, :cond_1

    move v3, p3

    move v2, v5

    :cond_1
    add-int/lit8 p3, p3, 0x1

    goto :goto_0

    :cond_2
    int-to-float p2, v3

    mul-float p4, p4, p2

    invoke-static {p4}, Ljava/lang/Math;->round(F)I

    move-result p2

    mul-int/lit8 p2, p2, -0x1

    int-to-float p3, p2

    add-float/2addr v1, p3

    float-to-int p3, v1

    invoke-virtual {p0, p1, p2, v0, p3}, Landroid/graphics/Rect;->set(IIII)V

    const-string p1, "nexCrop"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "enhancedCrop() highQuality="

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, ", q="

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/graphics/Rect;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private static getFitRwaPosition(IIFFZ)Landroid/graphics/Rect;
    .locals 6

    new-instance v0, Landroid/graphics/Rect;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1, p0, p1}, Landroid/graphics/Rect;-><init>(IIII)V

    div-float v1, p2, p3

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v2, v3

    cmpg-float v2, v2, v1

    if-gez v2, :cond_0

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v2

    int-to-float v2, v2

    mul-float v2, v2, v1

    float-to-int v1, v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    move-result v2

    div-int/lit8 v3, v1, 0x2

    sub-int/2addr v2, v3

    iput v2, v0, Landroid/graphics/Rect;->left:I

    iget v2, v0, Landroid/graphics/Rect;->left:I

    add-int/2addr v2, v1

    iput v2, v0, Landroid/graphics/Rect;->right:I

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v2, v1

    float-to-int v1, v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerY()I

    move-result v2

    div-int/lit8 v3, v1, 0x2

    sub-int/2addr v2, v3

    iput v2, v0, Landroid/graphics/Rect;->top:I

    iget v2, v0, Landroid/graphics/Rect;->top:I

    add-int/2addr v2, v1

    iput v2, v0, Landroid/graphics/Rect;->bottom:I

    :goto_0
    iget v1, v0, Landroid/graphics/Rect;->bottom:I

    const v2, 0x186a0

    mul-int v1, v1, v2

    div-int/2addr v1, p1

    iget v3, v0, Landroid/graphics/Rect;->left:I

    mul-int v3, v3, v2

    div-int/2addr v3, p0

    iget v4, v0, Landroid/graphics/Rect;->right:I

    mul-int v4, v4, v2

    div-int/2addr v4, p0

    iget v5, v0, Landroid/graphics/Rect;->top:I

    mul-int v5, v5, v2

    div-int/2addr v5, p1

    invoke-virtual {v0, v3, v5, v4, v1}, Landroid/graphics/Rect;->set(IIII)V

    if-nez v5, :cond_1

    const-string p0, "nexCrop"

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "getFitRwaPosition() raw="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Landroid/graphics/Rect;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0

    :cond_1
    if-eqz p4, :cond_2

    invoke-static {v0, p0, p1, p2, p3}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->enhancedCrop(Landroid/graphics/Rect;IIFF)V

    :cond_2
    return-object v0
.end method

.method private isSolid()Z
    .locals 2

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_mediaPath:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_mediaPath:Ljava/lang/String;

    const-string v1, "@solid:"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_mediaPath:Ljava/lang/String;

    const-string v1, ".jpg"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private loadImageForFaceRecognition()Landroid/graphics/Bitmap;
    .locals 11

    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_mediaPath:Ljava/lang/String;

    invoke-static {v2, v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    const/4 v2, 0x0

    iput-boolean v2, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    sget-object v2, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    iput-object v2, v0, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    const/4 v3, 0x0

    if-lt v2, v1, :cond_5

    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-ge v2, v1, :cond_0

    goto/16 :goto_2

    :cond_0
    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    const/16 v4, 0x2d0

    mul-int/lit16 v2, v2, 0x2d0

    iget v5, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    div-int/2addr v2, v5

    iput v1, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    :goto_0
    iget v1, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    iget v5, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    div-int/2addr v1, v5

    int-to-double v5, v1

    int-to-double v7, v2

    const-wide/high16 v9, 0x3ff8000000000000L    # 1.5

    invoke-static {v7, v8}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v7, v7, v9

    cmpl-double v1, v5, v7

    if-gtz v1, :cond_4

    iget v1, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v5, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    div-int/2addr v1, v5

    int-to-double v5, v1

    int-to-double v7, v4

    invoke-static {v7, v8}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v7, v7, v9

    cmpl-double v1, v5, v7

    if-lez v1, :cond_1

    goto :goto_1

    :cond_1
    const-string v1, "nexCrop"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "loadImageForFaceRecognition:   bounds decoded : width,height="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v6, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ","

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v6, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, "; target w,h="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ","

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "; sampleSize="

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_mediaPath:Ljava/lang/String;

    invoke-static {v1, v0}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    if-nez v0, :cond_2

    return-object v3

    :cond_2
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v1

    sget-object v2, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    if-eq v1, v2, :cond_3

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    sget-object v4, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v2, v4}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    new-instance v2, Landroid/graphics/Canvas;

    invoke-direct {v2, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    const/4 v4, 0x0

    invoke-virtual {v2, v0, v4, v4, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    move-object v0, v1

    :cond_3
    return-object v0

    :cond_4
    :goto_1
    iget v1, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    mul-int/lit8 v1, v1, 0x2

    iput v1, v0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    goto/16 :goto_0

    :cond_5
    :goto_2
    return-object v3
.end method

.method private matrixForRect(FFFF)Landroid/graphics/Matrix;
    .locals 3

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    neg-float v1, p1

    neg-float v2, p2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    sub-float/2addr p3, p1

    const p1, 0x3fe38e39

    div-float/2addr p1, p3

    sub-float/2addr p4, p2

    const/high16 p2, 0x3f800000    # 1.0f

    div-float/2addr p2, p4

    invoke-virtual {v0, p1, p2}, Landroid/graphics/Matrix;->postScale(FF)Z

    return-object v0
.end method

.method private matrixForRect(Landroid/graphics/Rect;)Landroid/graphics/Matrix;
    .locals 3

    iget v0, p1, Landroid/graphics/Rect;->left:I

    int-to-float v0, v0

    iget v1, p1, Landroid/graphics/Rect;->top:I

    int-to-float v1, v1

    iget v2, p1, Landroid/graphics/Rect;->right:I

    int-to-float v2, v2

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    int-to-float p1, p1

    invoke-direct {p0, v0, v1, v2, p1}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->matrixForRect(FFFF)Landroid/graphics/Matrix;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public applyCropSpeed(Landroid/graphics/Rect;Landroid/graphics/Rect;IIII)V
    .locals 8

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getEndPosionLock()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    invoke-virtual {p2, v1, v1, p3, p4}, Landroid/graphics/Rect;->intersect(IIII)Z

    move-result v0

    if-nez v0, :cond_0

    mul-int/lit8 v0, p3, 0x2

    div-int/lit8 v0, v0, 0x3

    mul-int/lit8 v2, p4, 0x2

    div-int/lit8 v2, v2, 0x3

    invoke-virtual {p2, v1, v1, v0, v2}, Landroid/graphics/Rect;->set(IIII)V

    int-to-double v2, p3

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v4

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v2, v2, v4

    const-wide/high16 v4, 0x4008000000000000L    # 3.0

    div-double/2addr v2, v4

    double-to-int v0, v2

    int-to-double v2, p4

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v6

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v2, v2, v6

    div-double/2addr v2, v4

    double-to-int v2, v2

    invoke-virtual {p2, v0, v2}, Landroid/graphics/Rect;->offset(II)V

    :cond_0
    int-to-double v2, p5

    int-to-float p6, p6

    float-to-double v4, p6

    const-wide/high16 v6, 0x3fe0000000000000L    # 0.5

    invoke-static {v4, v5}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v4, v4, v6

    const-wide v6, 0x408f400000000000L    # 1000.0

    div-double/2addr v4, v6

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v2, v2, v4

    double-to-int p6, v2

    const/16 v0, 0x65

    if-ge p5, v0, :cond_1

    iget p5, p2, Landroid/graphics/Rect;->left:I

    mul-int v0, p3, p6

    div-int/lit16 v0, v0, 0x3e8

    sub-int/2addr p5, v0

    iget v2, p2, Landroid/graphics/Rect;->top:I

    mul-int p6, p6, p4

    div-int/lit16 p6, p6, 0x3e8

    sub-int/2addr v2, p6

    iget v3, p2, Landroid/graphics/Rect;->right:I

    add-int/2addr v3, v0

    iget p2, p2, Landroid/graphics/Rect;->bottom:I

    mul-int/lit8 p6, p6, 0x3

    add-int/2addr p2, p6

    invoke-virtual {p1, p5, v2, v3, p2}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_0

    :cond_1
    iget p5, p2, Landroid/graphics/Rect;->left:I

    div-int/lit8 p6, p3, 0x4

    sub-int/2addr p5, p6

    iget v0, p2, Landroid/graphics/Rect;->top:I

    div-int/lit8 v2, p4, 0x4

    sub-int/2addr v0, v2

    iget v3, p2, Landroid/graphics/Rect;->right:I

    add-int/2addr v3, p6

    iget p2, p2, Landroid/graphics/Rect;->bottom:I

    add-int/2addr p2, v2

    invoke-virtual {p1, p5, v0, v3, p2}, Landroid/graphics/Rect;->set(IIII)V

    :goto_0
    invoke-virtual {p1, v1, v1, p3, p4}, Landroid/graphics/Rect;->intersect(IIII)Z

    move-result p2

    if-nez p2, :cond_2

    mul-int/lit8 p2, p3, 0x3

    div-int/lit8 p2, p2, 0x4

    mul-int/lit8 p5, p4, 0x3

    div-int/lit8 p5, p5, 0x4

    invoke-virtual {p1, v1, v1, p2, p5}, Landroid/graphics/Rect;->set(IIII)V

    int-to-double p2, p3

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide p5

    invoke-static {p2, p3}, Ljava/lang/Double;->isNaN(D)Z

    mul-double p2, p2, p5

    const-wide/high16 p5, 0x4010000000000000L    # 4.0

    div-double/2addr p2, p5

    double-to-int p2, p2

    int-to-double p3, p4

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v0

    invoke-static {p3, p4}, Ljava/lang/Double;->isNaN(D)Z

    mul-double p3, p3, v0

    div-double/2addr p3, p5

    double-to-int p3, p3

    invoke-virtual {p1, p2, p3}, Landroid/graphics/Rect;->offset(II)V

    :cond_2
    return-void
.end method

.method fitStartEndPosition(II)V
    .locals 4

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getHeight()I

    move-result v1

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotation:I

    const/16 v3, 0x5a

    if-eq v2, v3, :cond_0

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotation:I

    const/16 v3, 0x10e

    if-ne v2, v3, :cond_1

    :cond_0
    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getHeight()I

    move-result v0

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getWidth()I

    move-result v1

    :cond_1
    new-instance v2, Landroid/graphics/Rect;

    const/4 v3, 0x0

    invoke-direct {v2, v3, v3, v0, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    int-to-float p1, p1

    int-to-float p2, p2

    div-float/2addr p1, p2

    invoke-virtual {p0, v2, p1}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->growToAspect(Landroid/graphics/Rect;F)V

    invoke-virtual {p0, v2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setStartPosition(Landroid/graphics/Rect;)V

    invoke-virtual {p0, v2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setEndPosition(Landroid/graphics/Rect;)V

    return-void
.end method

.method public getClipDuration()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->clip_druation:I

    return v0
.end method

.method public getEndPosionLock()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endLock:Z

    return v0
.end method

.method public getEndPosition(Landroid/graphics/Rect;)V
    .locals 3

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotation:I

    const v1, 0x186a0

    const/16 v2, 0x5a

    if-eq v0, v2, :cond_1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotation:I

    const/16 v2, 0x10e

    if-ne v0, v2, :cond_0

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endPositionBottom:I

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_height:I

    mul-int v0, v0, v2

    div-int/2addr v0, v1

    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endPositionLeft:I

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_width:I

    mul-int v0, v0, v2

    div-int/2addr v0, v1

    iput v0, p1, Landroid/graphics/Rect;->left:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endPositionRight:I

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_width:I

    mul-int v0, v0, v2

    div-int/2addr v0, v1

    iput v0, p1, Landroid/graphics/Rect;->right:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endPositionTop:I

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_height:I

    mul-int v0, v0, v2

    div-int/2addr v0, v1

    iput v0, p1, Landroid/graphics/Rect;->top:I

    goto :goto_1

    :cond_1
    :goto_0
    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedEndPositionBottom:I

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_width:I

    mul-int v0, v0, v2

    div-int/2addr v0, v1

    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedEndPositionLeft:I

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_height:I

    mul-int v0, v0, v2

    div-int/2addr v0, v1

    iput v0, p1, Landroid/graphics/Rect;->left:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedEndPositionRight:I

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_height:I

    mul-int v0, v0, v2

    div-int/2addr v0, v1

    iput v0, p1, Landroid/graphics/Rect;->right:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedEndPositionTop:I

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_width:I

    mul-int v0, v0, v2

    div-int/2addr v0, v1

    iput v0, p1, Landroid/graphics/Rect;->top:I

    :goto_1
    return-void
.end method

.method public getEndPositionRaw(Landroid/graphics/Rect;)V
    .locals 2

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotation:I

    const/16 v1, 0x5a

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotation:I

    const/16 v1, 0x10e

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endPositionBottom:I

    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endPositionLeft:I

    iput v0, p1, Landroid/graphics/Rect;->left:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endPositionRight:I

    iput v0, p1, Landroid/graphics/Rect;->right:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endPositionTop:I

    iput v0, p1, Landroid/graphics/Rect;->top:I

    goto :goto_1

    :cond_1
    :goto_0
    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedEndPositionBottom:I

    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedEndPositionLeft:I

    iput v0, p1, Landroid/graphics/Rect;->left:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedEndPositionRight:I

    iput v0, p1, Landroid/graphics/Rect;->right:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedEndPositionTop:I

    iput v0, p1, Landroid/graphics/Rect;->top:I

    :goto_1
    return-void
.end method

.method public getFaceBounds(Landroid/graphics/Rect;Landroid/content/Context;)V
    .locals 5

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_mediaPath:Ljava/lang/String;

    invoke-static {v0}, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->a(Ljava/lang/String;)Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "nexCrop"

    const-string v1, "Second face detection with use filter"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;

    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_mediaPath:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2, p2}, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;-><init>(Ljava/io/File;ZLandroid/content/Context;)V

    :cond_0
    if-eqz v0, :cond_1

    new-instance p2, Landroid/graphics/RectF;

    invoke-direct {p2}, Landroid/graphics/RectF;-><init>()V

    invoke-virtual {v0, p2}, Lcom/nexstreaming/kminternal/kinemaster/utils/facedetect/a;->a(Landroid/graphics/RectF;)V

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getHeight()I

    move-result v1

    int-to-float v1, v1

    iget v2, p2, Landroid/graphics/RectF;->left:F

    mul-float v2, v2, v0

    float-to-int v2, v2

    iget v3, p2, Landroid/graphics/RectF;->top:F

    mul-float v3, v3, v1

    float-to-int v3, v3

    iget v4, p2, Landroid/graphics/RectF;->right:F

    mul-float v4, v4, v0

    float-to-int v0, v4

    iget p2, p2, Landroid/graphics/RectF;->bottom:F

    mul-float p2, p2, v1

    float-to-int p2, p2

    invoke-virtual {p1, v2, v3, v0, p2}, Landroid/graphics/Rect;->set(IIII)V

    return-void

    :cond_1
    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->calculateFaceBounds()V

    iget-boolean p2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_faceBounds_set:Z

    if-nez p2, :cond_2

    invoke-virtual {p1}, Landroid/graphics/Rect;->setEmpty()V

    return-void

    :cond_2
    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getWidth()I

    move-result p2

    int-to-float p2, p2

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getHeight()I

    move-result v0

    int-to-float v0, v0

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_faceBounds_left:F

    mul-float v1, v1, p2

    float-to-int v1, v1

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_faceBounds_top:F

    mul-float v2, v2, v0

    float-to-int v2, v2

    iget v3, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_faceBounds_right:F

    mul-float v3, v3, p2

    float-to-int p2, v3

    iget v3, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_faceBounds_bottom:F

    mul-float v3, v3, v0

    float-to-int v0, v3

    invoke-virtual {p1, v1, v2, p2, v0}, Landroid/graphics/Rect;->set(IIII)V

    return-void
.end method

.method public getFaceDetectSpeed()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->facedetect_speed:I

    return v0
.end method

.method public getFacePositionRaw(Landroid/graphics/Rect;)V
    .locals 2

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotation:I

    const/16 v1, 0x5a

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotation:I

    const/16 v1, 0x10e

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_facePositionLeft:I

    iput v0, p1, Landroid/graphics/Rect;->left:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_facePositionTop:I

    iput v0, p1, Landroid/graphics/Rect;->top:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_facePositionRight:I

    iput v0, p1, Landroid/graphics/Rect;->right:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_facePositionBottom:I

    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    goto :goto_1

    :cond_1
    :goto_0
    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedFacePositionLeft:I

    iput v0, p1, Landroid/graphics/Rect;->left:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedFacePositionTop:I

    iput v0, p1, Landroid/graphics/Rect;->top:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedFacePositionRight:I

    iput v0, p1, Landroid/graphics/Rect;->right:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedFacePositionBottom:I

    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    :goto_1
    return-void
.end method

.method public getHeight()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_height:I

    return v0
.end method

.method public getRotate()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotation:I

    return v0
.end method

.method getSaveData()Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;
    .locals 2

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;

    invoke-direct {v0}, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;-><init>()V

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionLeft:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_startPositionLeft:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionBottom:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_startPositionBottom:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionRight:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_startPositionRight:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionTop:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_startPositionTop:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endPositionLeft:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_endPositionLeft:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endPositionBottom:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_endPositionBottom:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endPositionRight:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_endPositionRight:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endPositionTop:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_endPositionTop:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionLeft:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_rotatedStartPositionLeft:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionBottom:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_rotatedStartPositionBottom:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionRight:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_rotatedStartPositionRight:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionTop:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_rotatedStartPositionTop:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedEndPositionLeft:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_rotatedEndPositionLeft:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedEndPositionBottom:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_rotatedEndPositionBottom:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedEndPositionRight:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_rotatedEndPositionRight:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedEndPositionTop:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_rotatedEndPositionTop:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_facePositionLeft:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_facePositionLeft:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_facePositionTop:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_facePositionTop:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_facePositionRight:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_facePositionRight:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_facePositionBottom:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_facePositionBottom:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedFacePositionLeft:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_rotatedFacePositionLeft:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedFacePositionTop:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_rotatedFacePositionTop:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedFacePositionRight:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_rotatedFacePositionRight:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedFacePositionBottom:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_rotatedFacePositionBottom:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotation:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_rotation:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_width:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_width:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_height:I

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_height:I

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_faceBounds_left:F

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_faceBounds_left:F

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_faceBounds_top:F

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_faceBounds_top:F

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_faceBounds_right:F

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_faceBounds_right:F

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_faceBounds_bottom:F

    iput v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_faceBounds_bottom:F

    iget-boolean v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_faceBounds_set:Z

    iput-boolean v1, v0, Lcom/nexstreaming/nexeditorsdk/nexSaveDataFormat$nexCropOf;->m_faceBounds_set:Z

    return-object v0
.end method

.method public getStartPosionLock()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startLock:Z

    return v0
.end method

.method public getStartPosition(Landroid/graphics/Rect;)V
    .locals 3

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotation:I

    const v1, 0x186a0

    const/16 v2, 0x5a

    if-eq v0, v2, :cond_1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotation:I

    const/16 v2, 0x10e

    if-ne v0, v2, :cond_0

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionBottom:I

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_height:I

    mul-int v0, v0, v2

    div-int/2addr v0, v1

    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionLeft:I

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_width:I

    mul-int v0, v0, v2

    div-int/2addr v0, v1

    iput v0, p1, Landroid/graphics/Rect;->left:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionRight:I

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_width:I

    mul-int v0, v0, v2

    div-int/2addr v0, v1

    iput v0, p1, Landroid/graphics/Rect;->right:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionTop:I

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_height:I

    mul-int v0, v0, v2

    div-int/2addr v0, v1

    iput v0, p1, Landroid/graphics/Rect;->top:I

    goto :goto_1

    :cond_1
    :goto_0
    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionBottom:I

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_width:I

    mul-int v0, v0, v2

    div-int/2addr v0, v1

    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionLeft:I

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_height:I

    mul-int v0, v0, v2

    div-int/2addr v0, v1

    iput v0, p1, Landroid/graphics/Rect;->left:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionRight:I

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_height:I

    mul-int v0, v0, v2

    div-int/2addr v0, v1

    iput v0, p1, Landroid/graphics/Rect;->right:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionTop:I

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_width:I

    mul-int v0, v0, v2

    div-int/2addr v0, v1

    iput v0, p1, Landroid/graphics/Rect;->top:I

    :goto_1
    return-void
.end method

.method public getStartPositionRaw(Landroid/graphics/Rect;)V
    .locals 2

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotation:I

    const/16 v1, 0x5a

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotation:I

    const/16 v1, 0x10e

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionBottom:I

    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionLeft:I

    iput v0, p1, Landroid/graphics/Rect;->left:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionRight:I

    iput v0, p1, Landroid/graphics/Rect;->right:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionTop:I

    iput v0, p1, Landroid/graphics/Rect;->top:I

    goto :goto_1

    :cond_1
    :goto_0
    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionBottom:I

    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionLeft:I

    iput v0, p1, Landroid/graphics/Rect;->left:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionRight:I

    iput v0, p1, Landroid/graphics/Rect;->right:I

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionTop:I

    iput v0, p1, Landroid/graphics/Rect;->top:I

    :goto_1
    return-void
.end method

.method public getWidth()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_width:I

    return v0
.end method

.method public growToAspect(Landroid/graphics/Rect;F)V
    .locals 2

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v0, v1

    cmpg-float v0, v0, p2

    if-gez v0, :cond_0

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-float v0, v0

    mul-float v0, v0, p2

    float-to-int p2, v0

    invoke-virtual {p1}, Landroid/graphics/Rect;->centerX()I

    move-result v0

    div-int/lit8 v1, p2, 0x2

    sub-int/2addr v0, v1

    iput v0, p1, Landroid/graphics/Rect;->left:I

    iget v0, p1, Landroid/graphics/Rect;->left:I

    add-int/2addr v0, p2

    iput v0, p1, Landroid/graphics/Rect;->right:I

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v0, p2

    float-to-int p2, v0

    invoke-virtual {p1}, Landroid/graphics/Rect;->centerY()I

    move-result v0

    div-int/lit8 v1, p2, 0x2

    sub-int/2addr v0, v1

    iput v0, p1, Landroid/graphics/Rect;->top:I

    iget v0, p1, Landroid/graphics/Rect;->top:I

    add-int/2addr v0, p2

    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    :goto_0
    return-void
.end method

.method public randomizeStartEndPosition(ZLcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;)V
    .locals 12

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getStartPosition(Landroid/graphics/Rect;)V

    invoke-virtual {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getEndPosition(Landroid/graphics/Rect;)V

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotation:I

    const/16 v0, 0x5a

    if-eq p1, v0, :cond_1

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotation:I

    const/16 v0, 0x10e

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getWidth()I

    move-result p1

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getHeight()I

    move-result v0

    goto :goto_1

    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getHeight()I

    move-result p1

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getWidth()I

    move-result v0

    :goto_1
    move v4, p1

    move v5, v0

    const/4 p1, 0x1

    if-lt v4, p1, :cond_11

    if-ge v5, p1, :cond_2

    goto/16 :goto_6

    :cond_2
    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->isSolid()Z

    move-result p1

    const/4 v0, 0x2

    if-eqz p1, :cond_3

    new-instance p1, Landroid/graphics/Rect;

    sub-int/2addr v4, v0

    sub-int/2addr v5, v0

    invoke-direct {p1, v0, v0, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setStartPosition(Landroid/graphics/Rect;)V

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setEndPosition(Landroid/graphics/Rect;)V

    return-void

    :cond_3
    sget-object p1, Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;->FILL:Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;

    const/4 v1, 0x0

    if-ne p2, p1, :cond_4

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1, v1, v1, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectRatio()F

    move-result p2

    invoke-virtual {p0, p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->shrinkToAspect(Landroid/graphics/Rect;F)V

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setStartPosition(Landroid/graphics/Rect;)V

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setEndPosition(Landroid/graphics/Rect;)V

    return-void

    :cond_4
    sget-object p1, Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;->FIT:Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;

    if-ne p2, p1, :cond_5

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1, v1, v1, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectRatio()F

    move-result p2

    invoke-virtual {p0, p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->growToAspect(Landroid/graphics/Rect;F)V

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setStartPosition(Landroid/graphics/Rect;)V

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setEndPosition(Landroid/graphics/Rect;)V

    return-void

    :cond_5
    sget-object p1, Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;->PANORAMA:Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;

    const-wide/high16 v8, 0x3fe0000000000000L    # 0.5

    if-ne p2, p1, :cond_a

    div-int p1, v4, v5

    int-to-float p1, p1

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectRatio()F

    move-result p2

    cmpg-float p2, p1, p2

    if-gez p2, :cond_7

    int-to-float p1, v4

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectRatio()F

    move-result p2

    div-float/2addr p1, p2

    float-to-int p1, p1

    new-instance p2, Landroid/graphics/Rect;

    invoke-direct {p2, v1, v1, v4, p1}, Landroid/graphics/Rect;-><init>(IIII)V

    new-instance v0, Landroid/graphics/Rect;

    sub-int p1, v5, p1

    invoke-direct {v0, v1, p1, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v1

    cmpg-double p1, v1, v8

    if-gez p1, :cond_6

    invoke-virtual {p0, p2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setStartPosition(Landroid/graphics/Rect;)V

    invoke-virtual {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setEndPosition(Landroid/graphics/Rect;)V

    goto :goto_2

    :cond_6
    invoke-virtual {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setStartPosition(Landroid/graphics/Rect;)V

    invoke-virtual {p0, p2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setEndPosition(Landroid/graphics/Rect;)V

    :goto_2
    return-void

    :cond_7
    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectRatio()F

    move-result p2

    cmpl-float p1, p1, p2

    if-lez p1, :cond_9

    int-to-float p1, v5

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectRatio()F

    move-result p2

    mul-float p1, p1, p2

    float-to-int p1, p1

    new-instance p2, Landroid/graphics/Rect;

    invoke-direct {p2, v1, v1, p1, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    new-instance v0, Landroid/graphics/Rect;

    sub-int p1, v4, p1

    invoke-direct {v0, p1, v1, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v1

    cmpg-double p1, v1, v8

    if-gez p1, :cond_8

    invoke-virtual {p0, p2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setStartPosition(Landroid/graphics/Rect;)V

    invoke-virtual {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setEndPosition(Landroid/graphics/Rect;)V

    goto :goto_3

    :cond_8
    invoke-virtual {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setStartPosition(Landroid/graphics/Rect;)V

    invoke-virtual {p0, p2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setEndPosition(Landroid/graphics/Rect;)V

    :goto_3
    return-void

    :cond_9
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1, v1, v1, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectRatio()F

    move-result p2

    invoke-virtual {p0, p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->shrinkToAspect(Landroid/graphics/Rect;F)V

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setStartPosition(Landroid/graphics/Rect;)V

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setEndPosition(Landroid/graphics/Rect;)V

    return-void

    :cond_a
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {p1}, Landroid/graphics/Rect;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_b

    mul-int/lit8 p2, v4, 0x3

    div-int/lit8 p2, p2, 0x4

    mul-int/lit8 v0, v5, 0x3

    div-int/lit8 v0, v0, 0x4

    invoke-virtual {p1, v1, v1, p2, v0}, Landroid/graphics/Rect;->set(IIII)V

    int-to-double v2, v4

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v6

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v2, v2, v6

    const-wide/high16 v6, 0x4010000000000000L    # 4.0

    div-double/2addr v2, v6

    double-to-int p2, v2

    int-to-double v2, v5

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v10

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v2, v2, v10

    div-double/2addr v2, v6

    double-to-int v0, v2

    invoke-virtual {p1, p2, v0}, Landroid/graphics/Rect;->offset(II)V

    goto :goto_4

    :cond_b
    div-int/lit8 p2, v4, 0x4

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v2

    sub-int/2addr p2, v2

    if-lt p2, v0, :cond_c

    iget v2, p1, Landroid/graphics/Rect;->left:I

    div-int/2addr p2, v0

    sub-int/2addr v2, p2

    iput v2, p1, Landroid/graphics/Rect;->left:I

    iget v2, p1, Landroid/graphics/Rect;->right:I

    add-int/2addr v2, p2

    iput v2, p1, Landroid/graphics/Rect;->right:I

    :cond_c
    div-int/lit8 p2, v5, 0x4

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v2

    sub-int/2addr p2, v2

    if-lt p2, v0, :cond_d

    iget v2, p1, Landroid/graphics/Rect;->top:I

    div-int/2addr p2, v0

    sub-int/2addr v2, p2

    iput v2, p1, Landroid/graphics/Rect;->top:I

    iget v0, p1, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v0, p2

    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    :cond_d
    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectRatio()F

    move-result p2

    invoke-virtual {p0, p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->growToAspect(Landroid/graphics/Rect;F)V

    invoke-virtual {p1, v1, v1, v4, v5}, Landroid/graphics/Rect;->intersect(IIII)Z

    move-result p2

    if-nez p2, :cond_e

    mul-int/lit8 p2, v4, 0x2

    div-int/lit8 p2, p2, 0x3

    mul-int/lit8 v0, v5, 0x2

    div-int/lit8 v0, v0, 0x3

    invoke-virtual {p1, v1, v1, p2, v0}, Landroid/graphics/Rect;->set(IIII)V

    int-to-double v2, v4

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v6

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v2, v2, v6

    const-wide/high16 v6, 0x4008000000000000L    # 3.0

    div-double/2addr v2, v6

    double-to-int p2, v2

    int-to-double v2, v5

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v10

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v2, v2, v10

    div-double/2addr v2, v6

    double-to-int v0, v2

    invoke-virtual {p1, p2, v0}, Landroid/graphics/Rect;->offset(II)V

    :cond_e
    :goto_4
    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectRatio()F

    move-result p2

    invoke-virtual {p0, p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->shrinkToAspect(Landroid/graphics/Rect;F)V

    new-instance p2, Landroid/graphics/Rect;

    invoke-direct {p2, v1, v1, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getFaceDetectSpeed()I

    move-result v6

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getClipDuration()I

    move-result v7

    move-object v1, p0

    move-object v2, p2

    move-object v3, p1

    invoke-virtual/range {v1 .. v7}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->applyCropSpeed(Landroid/graphics/Rect;Landroid/graphics/Rect;IIII)V

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectRatio()F

    move-result v0

    invoke-virtual {p0, p2, v0}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->shrinkToAspect(Landroid/graphics/Rect;F)V

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectRatio()F

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->shrinkToAspect(Landroid/graphics/Rect;F)V

    invoke-virtual {p1}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_10

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v0

    cmpg-double v2, v0, v8

    if-gez v2, :cond_f

    invoke-virtual {p0, p2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setStartPosition(Landroid/graphics/Rect;)V

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setEndPosition(Landroid/graphics/Rect;)V

    goto :goto_5

    :cond_f
    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setStartPosition(Landroid/graphics/Rect;)V

    invoke-virtual {p0, p2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setEndPosition(Landroid/graphics/Rect;)V

    :cond_10
    :goto_5
    invoke-static {}, Ljava/lang/Math;->random()D

    return-void

    :cond_11
    :goto_6
    return-void
.end method

.method public randomizeStartEndPosition(ZLcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;F)V
    .locals 12

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getStartPosition(Landroid/graphics/Rect;)V

    invoke-virtual {p0, v0}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getEndPosition(Landroid/graphics/Rect;)V

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotation:I

    const/16 v0, 0x5a

    if-eq p1, v0, :cond_1

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotation:I

    const/16 v0, 0x10e

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getWidth()I

    move-result p1

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getHeight()I

    move-result v0

    goto :goto_1

    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getHeight()I

    move-result p1

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getWidth()I

    move-result v0

    :goto_1
    move v4, p1

    move v5, v0

    const/4 p1, 0x1

    if-lt v4, p1, :cond_11

    if-ge v5, p1, :cond_2

    goto/16 :goto_6

    :cond_2
    invoke-direct {p0}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->isSolid()Z

    move-result p1

    const/4 v0, 0x2

    if-eqz p1, :cond_3

    new-instance p1, Landroid/graphics/Rect;

    sub-int/2addr v4, v0

    sub-int/2addr v5, v0

    invoke-direct {p1, v0, v0, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setStartPosition(Landroid/graphics/Rect;)V

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setEndPosition(Landroid/graphics/Rect;)V

    return-void

    :cond_3
    sget-object p1, Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;->FILL:Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;

    const/4 v1, 0x0

    if-ne p2, p1, :cond_4

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1, v1, v1, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {p0, p1, p3}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->shrinkToAspect(Landroid/graphics/Rect;F)V

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setStartPosition(Landroid/graphics/Rect;)V

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setEndPosition(Landroid/graphics/Rect;)V

    return-void

    :cond_4
    sget-object p1, Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;->FIT:Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;

    if-ne p2, p1, :cond_5

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1, v1, v1, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {p0, p1, p3}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->growToAspect(Landroid/graphics/Rect;F)V

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setStartPosition(Landroid/graphics/Rect;)V

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setEndPosition(Landroid/graphics/Rect;)V

    return-void

    :cond_5
    sget-object p1, Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;->PANORAMA:Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;

    const-wide/high16 v8, 0x3fe0000000000000L    # 0.5

    if-ne p2, p1, :cond_a

    div-int p1, v4, v5

    int-to-float p1, p1

    cmpg-float p2, p1, p3

    if-gez p2, :cond_7

    int-to-float p1, v4

    div-float/2addr p1, p3

    float-to-int p1, p1

    new-instance p2, Landroid/graphics/Rect;

    invoke-direct {p2, v1, v1, v4, p1}, Landroid/graphics/Rect;-><init>(IIII)V

    new-instance p3, Landroid/graphics/Rect;

    sub-int p1, v5, p1

    invoke-direct {p3, v1, p1, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v0

    cmpg-double p1, v0, v8

    if-gez p1, :cond_6

    invoke-virtual {p0, p2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setStartPosition(Landroid/graphics/Rect;)V

    invoke-virtual {p0, p3}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setEndPosition(Landroid/graphics/Rect;)V

    goto :goto_2

    :cond_6
    invoke-virtual {p0, p3}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setStartPosition(Landroid/graphics/Rect;)V

    invoke-virtual {p0, p2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setEndPosition(Landroid/graphics/Rect;)V

    :goto_2
    return-void

    :cond_7
    cmpl-float p1, p1, p3

    if-lez p1, :cond_9

    int-to-float p1, v5

    mul-float p1, p1, p3

    float-to-int p1, p1

    new-instance p2, Landroid/graphics/Rect;

    invoke-direct {p2, v1, v1, p1, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    new-instance p3, Landroid/graphics/Rect;

    sub-int p1, v4, p1

    invoke-direct {p3, p1, v1, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v0

    cmpg-double p1, v0, v8

    if-gez p1, :cond_8

    invoke-virtual {p0, p2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setStartPosition(Landroid/graphics/Rect;)V

    invoke-virtual {p0, p3}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setEndPosition(Landroid/graphics/Rect;)V

    goto :goto_3

    :cond_8
    invoke-virtual {p0, p3}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setStartPosition(Landroid/graphics/Rect;)V

    invoke-virtual {p0, p2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setEndPosition(Landroid/graphics/Rect;)V

    :goto_3
    return-void

    :cond_9
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1, v1, v1, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {p0, p1, p3}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->shrinkToAspect(Landroid/graphics/Rect;F)V

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setStartPosition(Landroid/graphics/Rect;)V

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setEndPosition(Landroid/graphics/Rect;)V

    return-void

    :cond_a
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {p1}, Landroid/graphics/Rect;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_b

    mul-int/lit8 p2, v4, 0x3

    div-int/lit8 p2, p2, 0x4

    mul-int/lit8 v0, v5, 0x3

    div-int/lit8 v0, v0, 0x4

    invoke-virtual {p1, v1, v1, p2, v0}, Landroid/graphics/Rect;->set(IIII)V

    int-to-double v2, v4

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v6

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v2, v2, v6

    const-wide/high16 v6, 0x4010000000000000L    # 4.0

    div-double/2addr v2, v6

    double-to-int p2, v2

    int-to-double v2, v5

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v10

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v2, v2, v10

    div-double/2addr v2, v6

    double-to-int v0, v2

    invoke-virtual {p1, p2, v0}, Landroid/graphics/Rect;->offset(II)V

    goto :goto_4

    :cond_b
    div-int/lit8 p2, v4, 0x4

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v2

    sub-int/2addr p2, v2

    if-lt p2, v0, :cond_c

    iget v2, p1, Landroid/graphics/Rect;->left:I

    div-int/2addr p2, v0

    sub-int/2addr v2, p2

    iput v2, p1, Landroid/graphics/Rect;->left:I

    iget v2, p1, Landroid/graphics/Rect;->right:I

    add-int/2addr v2, p2

    iput v2, p1, Landroid/graphics/Rect;->right:I

    :cond_c
    div-int/lit8 p2, v5, 0x4

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v2

    sub-int/2addr p2, v2

    if-lt p2, v0, :cond_d

    iget v2, p1, Landroid/graphics/Rect;->top:I

    div-int/2addr p2, v0

    sub-int/2addr v2, p2

    iput v2, p1, Landroid/graphics/Rect;->top:I

    iget v0, p1, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v0, p2

    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    :cond_d
    invoke-virtual {p0, p1, p3}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->growToAspect(Landroid/graphics/Rect;F)V

    invoke-virtual {p1, v1, v1, v4, v5}, Landroid/graphics/Rect;->intersect(IIII)Z

    move-result p2

    if-nez p2, :cond_e

    mul-int/lit8 p2, v4, 0x2

    div-int/lit8 p2, p2, 0x3

    mul-int/lit8 v0, v5, 0x2

    div-int/lit8 v0, v0, 0x3

    invoke-virtual {p1, v1, v1, p2, v0}, Landroid/graphics/Rect;->set(IIII)V

    int-to-double v2, v4

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v6

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v2, v2, v6

    const-wide/high16 v6, 0x4008000000000000L    # 3.0

    div-double/2addr v2, v6

    double-to-int p2, v2

    int-to-double v2, v5

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v10

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v2, v2, v10

    div-double/2addr v2, v6

    double-to-int v0, v2

    invoke-virtual {p1, p2, v0}, Landroid/graphics/Rect;->offset(II)V

    :cond_e
    :goto_4
    invoke-virtual {p0, p1, p3}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->shrinkToAspect(Landroid/graphics/Rect;F)V

    new-instance p2, Landroid/graphics/Rect;

    invoke-direct {p2, v1, v1, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->getFaceDetectSpeed()I

    move-result v6

    iget v7, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->clip_druation:I

    move-object v1, p0

    move-object v2, p2

    move-object v3, p1

    invoke-virtual/range {v1 .. v7}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->applyCropSpeed(Landroid/graphics/Rect;Landroid/graphics/Rect;IIII)V

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectRatio()F

    move-result p3

    invoke-virtual {p0, p2, p3}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->shrinkToAspect(Landroid/graphics/Rect;F)V

    invoke-static {}, Lcom/nexstreaming/nexeditorsdk/nexApplicationConfig;->getAspectRatio()F

    move-result p3

    invoke-virtual {p0, p1, p3}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->shrinkToAspect(Landroid/graphics/Rect;F)V

    invoke-virtual {p1}, Landroid/graphics/Rect;->isEmpty()Z

    move-result p3

    if-nez p3, :cond_10

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v0

    cmpg-double p3, v0, v8

    if-gez p3, :cond_f

    invoke-virtual {p0, p2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setStartPosition(Landroid/graphics/Rect;)V

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setEndPosition(Landroid/graphics/Rect;)V

    goto :goto_5

    :cond_f
    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setStartPosition(Landroid/graphics/Rect;)V

    invoke-virtual {p0, p2}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->setEndPosition(Landroid/graphics/Rect;)V

    :cond_10
    :goto_5
    invoke-static {}, Ljava/lang/Math;->random()D

    return-void

    :cond_11
    :goto_6
    return-void
.end method

.method public resetStartEndPosition()V
    .locals 2

    const/4 v0, 0x0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionLeft:I

    const v1, 0x186a0

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionBottom:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionRight:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionTop:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endPositionLeft:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endPositionBottom:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endPositionRight:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endPositionTop:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionLeft:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionBottom:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionRight:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionTop:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedEndPositionLeft:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedEndPositionBottom:I

    iput v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedEndPositionRight:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedEndPositionTop:I

    return-void
.end method

.method public setClipDuration(I)V
    .locals 0

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->clip_druation:I

    return-void
.end method

.method public setEndPosition(Landroid/graphics/Rect;)V
    .locals 3

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotation:I

    const v1, 0x186a0

    const/16 v2, 0x5a

    if-eq v0, v2, :cond_1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotation:I

    const/16 v2, 0x10e

    if-ne v0, v2, :cond_0

    goto :goto_0

    :cond_0
    iget v0, p1, Landroid/graphics/Rect;->bottom:I

    mul-int v0, v0, v1

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_height:I

    div-int/2addr v0, v2

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endPositionBottom:I

    iget v0, p1, Landroid/graphics/Rect;->left:I

    mul-int v0, v0, v1

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_width:I

    div-int/2addr v0, v2

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endPositionLeft:I

    iget v0, p1, Landroid/graphics/Rect;->right:I

    mul-int v0, v0, v1

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_width:I

    div-int/2addr v0, v2

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endPositionRight:I

    iget v0, p1, Landroid/graphics/Rect;->top:I

    mul-int v0, v0, v1

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_height:I

    div-int/2addr v0, v1

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endPositionTop:I

    goto :goto_1

    :cond_1
    :goto_0
    iget v0, p1, Landroid/graphics/Rect;->bottom:I

    mul-int v0, v0, v1

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_width:I

    div-int/2addr v0, v2

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedEndPositionBottom:I

    iget v0, p1, Landroid/graphics/Rect;->left:I

    mul-int v0, v0, v1

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_height:I

    div-int/2addr v0, v2

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedEndPositionLeft:I

    iget v0, p1, Landroid/graphics/Rect;->right:I

    mul-int v0, v0, v1

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_height:I

    div-int/2addr v0, v2

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedEndPositionRight:I

    iget v0, p1, Landroid/graphics/Rect;->top:I

    mul-int v0, v0, v1

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_width:I

    div-int/2addr v0, v1

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedEndPositionTop:I

    :goto_1
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endMatrix:[F

    if-nez v0, :cond_2

    const/16 v0, 0x9

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endMatrix:[F

    :cond_2
    invoke-direct {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->matrixForRect(Landroid/graphics/Rect;)Landroid/graphics/Matrix;

    move-result-object p1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endMatrix:[F

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->setValues([F)V

    return-void
.end method

.method public setEndPositionLock(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endLock:Z

    return-void
.end method

.method public setEndPositionRaw(Landroid/graphics/Rect;)V
    .locals 2

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotation:I

    const/16 v1, 0x5a

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotation:I

    const/16 v1, 0x10e

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    iget v0, p1, Landroid/graphics/Rect;->bottom:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endPositionBottom:I

    iget v0, p1, Landroid/graphics/Rect;->left:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endPositionLeft:I

    iget v0, p1, Landroid/graphics/Rect;->right:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endPositionRight:I

    iget p1, p1, Landroid/graphics/Rect;->top:I

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_endPositionTop:I

    goto :goto_1

    :cond_1
    :goto_0
    iget v0, p1, Landroid/graphics/Rect;->bottom:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedEndPositionBottom:I

    iget v0, p1, Landroid/graphics/Rect;->left:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedEndPositionLeft:I

    iget v0, p1, Landroid/graphics/Rect;->right:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedEndPositionRight:I

    iget p1, p1, Landroid/graphics/Rect;->top:I

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedEndPositionTop:I

    :goto_1
    return-void
.end method

.method public setFaceDetectSpeed(I)V
    .locals 0

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->facedetect_speed:I

    return-void
.end method

.method public setFacePosition(Landroid/graphics/Rect;)V
    .locals 3

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotation:I

    const v1, 0x186a0

    const/16 v2, 0x5a

    if-eq v0, v2, :cond_1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotation:I

    const/16 v2, 0x10e

    if-ne v0, v2, :cond_0

    goto :goto_0

    :cond_0
    iget v0, p1, Landroid/graphics/Rect;->bottom:I

    mul-int v0, v0, v1

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_height:I

    div-int/2addr v0, v2

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_facePositionBottom:I

    iget v0, p1, Landroid/graphics/Rect;->left:I

    mul-int v0, v0, v1

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_width:I

    div-int/2addr v0, v2

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_facePositionLeft:I

    iget v0, p1, Landroid/graphics/Rect;->right:I

    mul-int v0, v0, v1

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_width:I

    div-int/2addr v0, v2

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_facePositionRight:I

    iget p1, p1, Landroid/graphics/Rect;->top:I

    mul-int p1, p1, v1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_height:I

    div-int/2addr p1, v0

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_facePositionTop:I

    goto :goto_1

    :cond_1
    :goto_0
    iget v0, p1, Landroid/graphics/Rect;->bottom:I

    mul-int v0, v0, v1

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_width:I

    div-int/2addr v0, v2

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedFacePositionBottom:I

    iget v0, p1, Landroid/graphics/Rect;->left:I

    mul-int v0, v0, v1

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_height:I

    div-int/2addr v0, v2

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedFacePositionLeft:I

    iget v0, p1, Landroid/graphics/Rect;->right:I

    mul-int v0, v0, v1

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_height:I

    div-int/2addr v0, v2

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedFacePositionRight:I

    iget p1, p1, Landroid/graphics/Rect;->top:I

    mul-int p1, p1, v1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_width:I

    div-int/2addr p1, v0

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedFacePositionTop:I

    :goto_1
    return-void
.end method

.method setRotate(I)V
    .locals 2

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotation:I

    if-eq p1, v0, :cond_2

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotation:I

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotation:I

    const/16 v0, 0x5a

    const/4 v1, 0x0

    if-eq p1, v0, :cond_1

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotation:I

    const/16 v0, 0x10e

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionLeft:I

    if-nez p1, :cond_2

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionBottom:I

    if-nez p1, :cond_2

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionRight:I

    if-nez p1, :cond_2

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionTop:I

    if-nez p1, :cond_2

    sget-object p1, Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;->PAN_RAND:Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;

    invoke-virtual {p0, v1, p1}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->randomizeStartEndPosition(ZLcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;)V

    goto :goto_1

    :cond_1
    :goto_0
    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionLeft:I

    if-nez p1, :cond_2

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionBottom:I

    if-nez p1, :cond_2

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionRight:I

    if-nez p1, :cond_2

    iget p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionTop:I

    if-nez p1, :cond_2

    sget-object p1, Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;->PAN_RAND:Lcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;

    invoke-virtual {p0, v1, p1}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->randomizeStartEndPosition(ZLcom/nexstreaming/nexeditorsdk/nexCrop$CropMode;)V

    :cond_2
    :goto_1
    return-void
.end method

.method public setStartPosition(Landroid/graphics/Rect;)V
    .locals 3

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotation:I

    const v1, 0x186a0

    const/16 v2, 0x5a

    if-eq v0, v2, :cond_1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotation:I

    const/16 v2, 0x10e

    if-ne v0, v2, :cond_0

    goto :goto_0

    :cond_0
    iget v0, p1, Landroid/graphics/Rect;->bottom:I

    mul-int v0, v0, v1

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_height:I

    div-int/2addr v0, v2

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionBottom:I

    iget v0, p1, Landroid/graphics/Rect;->left:I

    mul-int v0, v0, v1

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_width:I

    div-int/2addr v0, v2

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionLeft:I

    iget v0, p1, Landroid/graphics/Rect;->right:I

    mul-int v0, v0, v1

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_width:I

    div-int/2addr v0, v2

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionRight:I

    iget v0, p1, Landroid/graphics/Rect;->top:I

    mul-int v0, v0, v1

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_height:I

    div-int/2addr v0, v1

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionTop:I

    goto :goto_1

    :cond_1
    :goto_0
    iget v0, p1, Landroid/graphics/Rect;->bottom:I

    mul-int v0, v0, v1

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_width:I

    div-int/2addr v0, v2

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionBottom:I

    iget v0, p1, Landroid/graphics/Rect;->left:I

    mul-int v0, v0, v1

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_height:I

    div-int/2addr v0, v2

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionLeft:I

    iget v0, p1, Landroid/graphics/Rect;->right:I

    mul-int v0, v0, v1

    iget v2, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_height:I

    div-int/2addr v0, v2

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionRight:I

    iget v0, p1, Landroid/graphics/Rect;->top:I

    mul-int v0, v0, v1

    iget v1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_width:I

    div-int/2addr v0, v1

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionTop:I

    :goto_1
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startMatrix:[F

    if-nez v0, :cond_2

    const/16 v0, 0x9

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startMatrix:[F

    :cond_2
    invoke-direct {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexCrop;->matrixForRect(Landroid/graphics/Rect;)Landroid/graphics/Matrix;

    move-result-object p1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startMatrix:[F

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->setValues([F)V

    return-void
.end method

.method public setStartPositionLock(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startLock:Z

    return-void
.end method

.method public setStartPositionRaw(Landroid/graphics/Rect;)V
    .locals 2

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotation:I

    const/16 v1, 0x5a

    if-eq v0, v1, :cond_1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotation:I

    const/16 v1, 0x10e

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    iget v0, p1, Landroid/graphics/Rect;->bottom:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionBottom:I

    iget v0, p1, Landroid/graphics/Rect;->left:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionLeft:I

    iget v0, p1, Landroid/graphics/Rect;->right:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionRight:I

    iget p1, p1, Landroid/graphics/Rect;->top:I

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_startPositionTop:I

    goto :goto_1

    :cond_1
    :goto_0
    iget v0, p1, Landroid/graphics/Rect;->bottom:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionBottom:I

    iget v0, p1, Landroid/graphics/Rect;->left:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionLeft:I

    iget v0, p1, Landroid/graphics/Rect;->right:I

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionRight:I

    iget p1, p1, Landroid/graphics/Rect;->top:I

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexCrop;->m_rotatedStartPositionTop:I

    :goto_1
    return-void
.end method

.method public shrinkToAspect(Landroid/graphics/Rect;F)V
    .locals 2

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v0, v1

    cmpg-float v0, v0, p2

    if-gez v0, :cond_0

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v0, p2

    float-to-int p2, v0

    invoke-virtual {p1}, Landroid/graphics/Rect;->centerY()I

    move-result v0

    div-int/lit8 v1, p2, 0x2

    sub-int/2addr v0, v1

    iput v0, p1, Landroid/graphics/Rect;->top:I

    iget v0, p1, Landroid/graphics/Rect;->top:I

    add-int/2addr v0, p2

    iput v0, p1, Landroid/graphics/Rect;->bottom:I

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v0

    int-to-float v0, v0

    mul-float v0, v0, p2

    float-to-int p2, v0

    invoke-virtual {p1}, Landroid/graphics/Rect;->centerX()I

    move-result v0

    div-int/lit8 v1, p2, 0x2

    sub-int/2addr v0, v1

    iput v0, p1, Landroid/graphics/Rect;->left:I

    iget v0, p1, Landroid/graphics/Rect;->left:I

    add-int/2addr v0, p2

    iput v0, p1, Landroid/graphics/Rect;->right:I

    :goto_0
    return-void
.end method
