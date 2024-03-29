.class public Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;
.super Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;
.source "ArcsoftBeautyProcessor.java"


# instance fields
.field private mBeautyParameters:[I

.field private mBrightEyeRatio:I

.field private mDeblemish:I

.field private mDepouchRatio:I

.field private mEnlargeEyeRatio:I

.field private mIrisShineRatio:I

.field private mLipBeautyRatio:I

.field private mRelightingRatio:I

.field private mRuddyRatio:I

.field private mShrinkFaceRatio:I

.field private mShrinkNooseRatio:I

.field private mSmoothStrength:I

.field private mWhiteStrength:I


# direct methods
.method constructor <init>()V
    .locals 4

    invoke-direct {p0}, Lcom/miui/filtersdk/beauty/IntelligentBeautyProcessor;-><init>()V

    const/16 v0, 0xb

    new-array v1, v0, [I

    iput-object v1, p0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mBeautyParameters:[I

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    iget-object v3, p0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mBeautyParameters:[I

    aput v1, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    const/high16 v0, 0x42480000    # 50.0f

    invoke-virtual {p0, v0}, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->setExtraSpan(F)V

    const/4 v0, 0x6

    new-array v0, v0, [[F

    const/16 v2, 0xc

    new-array v3, v2, [F

    fill-array-data v3, :array_0

    aput-object v3, v0, v1

    new-array v1, v2, [F

    fill-array-data v1, :array_1

    const/4 v3, 0x1

    aput-object v1, v0, v3

    const/4 v1, 0x2

    new-array v3, v2, [F

    fill-array-data v3, :array_2

    aput-object v3, v0, v1

    const/4 v1, 0x3

    new-array v3, v2, [F

    fill-array-data v3, :array_3

    aput-object v3, v0, v1

    const/4 v1, 0x4

    new-array v3, v2, [F

    fill-array-data v3, :array_4

    aput-object v3, v0, v1

    const/4 v1, 0x5

    new-array v2, v2, [F

    fill-array-data v2, :array_5

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mLevelParameters:[[F

    return-void

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
    .end array-data

    :array_1
    .array-data 4
        0x41200000    # 10.0f
        0x41a00000    # 20.0f
        0x41200000    # 10.0f
        0x41f00000    # 30.0f
        0x41700000    # 15.0f
        0x41200000    # 10.0f
        0x3f800000    # 1.0f
        0x428c0000    # 70.0f
        0x0
        0x41c80000    # 25.0f
        0x41200000    # 10.0f
        0x0
    .end array-data

    :array_2
    .array-data 4
        0x41200000    # 10.0f
        0x41e00000    # 28.0f
        0x41200000    # 10.0f
        0x41f00000    # 30.0f
        0x41700000    # 15.0f
        0x41200000    # 10.0f
        0x3f800000    # 1.0f
        0x428c0000    # 70.0f
        0x0
        0x41c80000    # 25.0f
        0x41200000    # 10.0f
        0x0
    .end array-data

    :array_3
    .array-data 4
        0x41200000    # 10.0f
        0x420c0000    # 35.0f
        0x41200000    # 10.0f
        0x41f00000    # 30.0f
        0x41700000    # 15.0f
        0x41200000    # 10.0f
        0x3f800000    # 1.0f
        0x428c0000    # 70.0f
        0x0
        0x41c80000    # 25.0f
        0x41200000    # 10.0f
        0x0
    .end array-data

    :array_4
    .array-data 4
        0x41200000    # 10.0f
        0x42280000    # 42.0f
        0x41200000    # 10.0f
        0x41f00000    # 30.0f
        0x41700000    # 15.0f
        0x41700000    # 15.0f
        0x3f800000    # 1.0f
        0x428c0000    # 70.0f
        0x0
        0x41c80000    # 25.0f
        0x41200000    # 10.0f
        0x0
    .end array-data

    :array_5
    .array-data 4
        0x41200000    # 10.0f
        0x42480000    # 50.0f
        0x41200000    # 10.0f
        0x41f00000    # 30.0f
        0x41700000    # 15.0f
        0x41700000    # 15.0f
        0x3f800000    # 1.0f
        0x428c0000    # 70.0f
        0x0
        0x41c80000    # 25.0f
        0x41200000    # 10.0f
        0x0
    .end array-data
.end method

.method private isParametersEmpty()Z
    .locals 1

    iget v0, p0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mBrightEyeRatio:I

    if-nez v0, :cond_0

    iget v0, p0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mSmoothStrength:I

    if-nez v0, :cond_0

    iget v0, p0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mWhiteStrength:I

    if-nez v0, :cond_0

    iget v0, p0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mShrinkFaceRatio:I

    if-nez v0, :cond_0

    iget v0, p0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mEnlargeEyeRatio:I

    if-nez v0, :cond_0

    iget v0, p0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mDeblemish:I

    if-nez v0, :cond_0

    iget v0, p0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mDepouchRatio:I

    if-nez v0, :cond_0

    iget v0, p0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mIrisShineRatio:I

    if-nez v0, :cond_0

    iget v0, p0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mLipBeautyRatio:I

    if-nez v0, :cond_0

    iget v0, p0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mRelightingRatio:I

    if-nez v0, :cond_0

    iget v0, p0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mRuddyRatio:I

    if-nez v0, :cond_0

    iget v0, p0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mShrinkNooseRatio:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public beautify(Landroid/graphics/Bitmap;II)V
    .locals 17

    move-object/from16 v0, p0

    invoke-direct/range {p0 .. p0}, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->isParametersEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    :cond_0
    iget v5, v0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mWhiteStrength:I

    iget v6, v0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mSmoothStrength:I

    iget v7, v0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mEnlargeEyeRatio:I

    iget v8, v0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mShrinkFaceRatio:I

    iget v9, v0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mBrightEyeRatio:I

    iget v10, v0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mDeblemish:I

    iget v11, v0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mDepouchRatio:I

    iget v12, v0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mIrisShineRatio:I

    iget v13, v0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mLipBeautyRatio:I

    iget v14, v0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mRelightingRatio:I

    iget v15, v0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mRuddyRatio:I

    iget v1, v0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mShrinkNooseRatio:I

    move-object/from16 v2, p1

    move/from16 v3, p2

    move/from16 v4, p3

    move/from16 v16, v1

    invoke-static/range {v2 .. v16}, Lcom/miui/filtersdk/BeautyArcsoftJni;->beautifyProcessBitmap(Landroid/graphics/Bitmap;IIIIIIIIIIIIII)V

    return-void
.end method

.method public beautify([BIII[BI)V
    .locals 17

    move-object/from16 v0, p0

    invoke-direct/range {p0 .. p0}, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->isParametersEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    :cond_0
    iget v5, v0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mWhiteStrength:I

    iget v6, v0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mSmoothStrength:I

    iget v7, v0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mEnlargeEyeRatio:I

    iget v8, v0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mShrinkFaceRatio:I

    iget v9, v0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mBrightEyeRatio:I

    iget v10, v0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mDeblemish:I

    iget v11, v0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mDepouchRatio:I

    iget v12, v0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mIrisShineRatio:I

    iget v13, v0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mLipBeautyRatio:I

    iget v14, v0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mRelightingRatio:I

    iget v15, v0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mRuddyRatio:I

    iget v1, v0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mShrinkNooseRatio:I

    move-object/from16 v2, p1

    move/from16 v3, p3

    move/from16 v4, p4

    move/from16 v16, v1

    invoke-static/range {v2 .. v16}, Lcom/miui/filtersdk/BeautyArcsoftJni;->beautifyProcess([BIIIIIIIIIIIIII)V

    return-void
.end method

.method public clearBeautyParameters()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mBrightEyeRatio:I

    iput v0, p0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mSmoothStrength:I

    iput v0, p0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mWhiteStrength:I

    iput v0, p0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mShrinkFaceRatio:I

    iput v0, p0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mEnlargeEyeRatio:I

    iput v0, p0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mIrisShineRatio:I

    iput v0, p0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mDeblemish:I

    iput v0, p0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mDepouchRatio:I

    iput v0, p0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mRelightingRatio:I

    iput v0, p0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mLipBeautyRatio:I

    iput v0, p0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mRuddyRatio:I

    iput v0, p0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mShrinkNooseRatio:I

    return-void
.end method

.method public getSupportedBeautyParamTypes()[Lcom/miui/filtersdk/beauty/BeautyParameterType;
    .locals 3

    const/16 v0, 0xc

    new-array v0, v0, [Lcom/miui/filtersdk/beauty/BeautyParameterType;

    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->WHITEN_STRENGTH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->SMOOTH_STRENGTH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ENLARGE_EYE_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->SHRINK_FACE_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->BRIGHT_EYE_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->IRIS_SHINE_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->DEBLEMISH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->DEPOUCH_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->RELIGHTING_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    const/16 v2, 0x8

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->LIP_BEAUTY_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    const/16 v2, 0x9

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->RUDDY_STRENGTH:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    const/16 v2, 0xa

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;->SHRINK_NOSE_RATIO:Lcom/miui/filtersdk/beauty/BeautyParameterType;

    const/16 v2, 0xb

    aput-object v1, v0, v2

    return-object v0
.end method

.method public getSupportedParamRange(Lcom/miui/filtersdk/beauty/BeautyParameterType;)[F
    .locals 1

    sget-object v0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor$1;->$SwitchMap$com$miui$filtersdk$beauty$BeautyParameterType:[I

    invoke-virtual {p1}, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ordinal()I

    move-result p1

    aget p1, v0, p1

    const/4 v0, 0x2

    packed-switch p1, :pswitch_data_0

    const/4 p1, 0x0

    new-array p1, p1, [F

    return-object p1

    :pswitch_0
    new-array p1, v0, [F

    fill-array-data p1, :array_0

    return-object p1

    :pswitch_1
    new-array p1, v0, [F

    fill-array-data p1, :array_1

    return-object p1

    :pswitch_2
    new-array p1, v0, [F

    fill-array-data p1, :array_2

    return-object p1

    :pswitch_3
    new-array p1, v0, [F

    fill-array-data p1, :array_3

    return-object p1

    :pswitch_4
    new-array p1, v0, [F

    fill-array-data p1, :array_4

    return-object p1

    :pswitch_5
    new-array p1, v0, [F

    fill-array-data p1, :array_5

    return-object p1

    :pswitch_6
    new-array p1, v0, [F

    fill-array-data p1, :array_6

    return-object p1

    :pswitch_7
    new-array p1, v0, [F

    fill-array-data p1, :array_7

    return-object p1

    :pswitch_8
    new-array p1, v0, [F

    fill-array-data p1, :array_8

    return-object p1

    :pswitch_9
    new-array p1, v0, [F

    fill-array-data p1, :array_9

    return-object p1

    :pswitch_a
    new-array p1, v0, [F

    fill-array-data p1, :array_a

    return-object p1

    :pswitch_b
    new-array p1, v0, [F

    fill-array-data p1, :array_b

    return-object p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x42c80000    # 100.0f
    .end array-data

    :array_2
    .array-data 4
        0x0
        0x42200000    # 40.0f
    .end array-data

    :array_3
    .array-data 4
        0x0
        0x42c80000    # 100.0f
    .end array-data

    :array_4
    .array-data 4
        0x0
        0x42c80000    # 100.0f
    .end array-data

    :array_5
    .array-data 4
        0x0
        0x42700000    # 60.0f
    .end array-data

    :array_6
    .array-data 4
        0x0
        0x42a00000    # 80.0f
    .end array-data

    :array_7
    .array-data 4
        0x0
        0x42200000    # 40.0f
    .end array-data

    :array_8
    .array-data 4
        0x0
        0x428c0000    # 70.0f
    .end array-data

    :array_9
    .array-data 4
        0x0
        0x428c0000    # 70.0f
    .end array-data

    :array_a
    .array-data 4
        0x0
        0x42c80000    # 100.0f
    .end array-data

    :array_b
    .array-data 4
        0x0
        0x42200000    # 40.0f
    .end array-data
.end method

.method public init(II)V
    .locals 0

    return-void
.end method

.method public setBeautyParamDegree(Lcom/miui/filtersdk/beauty/BeautyParameterType;Ljava/lang/Float;)V
    .locals 1

    sget-object v0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor$1;->$SwitchMap$com$miui$filtersdk$beauty$BeautyParameterType:[I

    invoke-virtual {p1}, Lcom/miui/filtersdk/beauty/BeautyParameterType;->ordinal()I

    move-result p1

    aget p1, v0, p1

    packed-switch p1, :pswitch_data_0

    goto/16 :goto_0

    :pswitch_0
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result p1

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    iput p1, p0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mDeblemish:I

    goto/16 :goto_0

    :pswitch_1
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result p1

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    iput p1, p0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mShrinkNooseRatio:I

    goto/16 :goto_0

    :pswitch_2
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result p1

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    iput p1, p0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mIrisShineRatio:I

    goto :goto_0

    :pswitch_3
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result p1

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    iput p1, p0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mDepouchRatio:I

    goto :goto_0

    :pswitch_4
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result p1

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    iput p1, p0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mLipBeautyRatio:I

    goto :goto_0

    :pswitch_5
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result p1

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    iput p1, p0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mRelightingRatio:I

    goto :goto_0

    :pswitch_6
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result p1

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    iput p1, p0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mRuddyRatio:I

    goto :goto_0

    :pswitch_7
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result p1

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    iput p1, p0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mBrightEyeRatio:I

    goto :goto_0

    :pswitch_8
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result p1

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    iput p1, p0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mSmoothStrength:I

    goto :goto_0

    :pswitch_9
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result p1

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    iput p1, p0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mWhiteStrength:I

    goto :goto_0

    :pswitch_a
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result p1

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    iput p1, p0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mShrinkFaceRatio:I

    goto :goto_0

    :pswitch_b
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result p1

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    iput p1, p0, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->mEnlargeEyeRatio:I

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setBeautyParamsDegree(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/miui/filtersdk/beauty/BeautyParameterType;",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/filtersdk/beauty/BeautyParameterType;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {p0, v1, v0}, Lcom/miui/filtersdk/beauty/ArcsoftBeautyProcessor;->setBeautyParamDegree(Lcom/miui/filtersdk/beauty/BeautyParameterType;Ljava/lang/Float;)V

    goto :goto_0

    :cond_0
    return-void
.end method
