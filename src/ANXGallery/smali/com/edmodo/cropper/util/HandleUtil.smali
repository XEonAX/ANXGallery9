.class public Lcom/edmodo/cropper/util/HandleUtil;
.super Ljava/lang/Object;
.source "HandleUtil.java"


# direct methods
.method public static getOffset(Lcom/edmodo/cropper/cropwindow/handle/Handle;FFFFFFLandroid/graphics/PointF;)V
    .locals 1

    sget-object v0, Lcom/edmodo/cropper/util/HandleUtil$1;->$SwitchMap$com$edmodo$cropper$cropwindow$handle$Handle:[I

    invoke-virtual {p0}, Lcom/edmodo/cropper/cropwindow/handle/Handle;->ordinal()I

    move-result p0

    aget p0, v0, p0

    const/4 v0, 0x0

    packed-switch p0, :pswitch_data_0

    :goto_0
    const/4 p0, 0x0

    goto :goto_2

    :pswitch_0
    add-float/2addr p5, p3

    const/high16 p0, 0x40000000    # 2.0f

    div-float/2addr p5, p0

    add-float/2addr p4, p6

    div-float/2addr p4, p0

    sub-float v0, p5, p1

    sub-float p0, p4, p2

    goto :goto_2

    :pswitch_1
    sub-float p0, p6, p2

    goto :goto_2

    :pswitch_2
    sub-float p0, p5, p1

    goto :goto_1

    :pswitch_3
    sub-float p0, p4, p2

    goto :goto_2

    :pswitch_4
    sub-float p0, p3, p1

    :goto_1
    move v0, p0

    goto :goto_0

    :pswitch_5
    sub-float v0, p5, p1

    sub-float p0, p6, p2

    goto :goto_2

    :pswitch_6
    sub-float v0, p3, p1

    sub-float p0, p6, p2

    goto :goto_2

    :pswitch_7
    sub-float v0, p5, p1

    sub-float p0, p4, p2

    goto :goto_2

    :pswitch_8
    sub-float v0, p3, p1

    sub-float p0, p4, p2

    :goto_2
    iput v0, p7, Landroid/graphics/PointF;->x:F

    iput p0, p7, Landroid/graphics/PointF;->y:F

    return-void

    :pswitch_data_0
    .packed-switch 0x1
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

.method public static getPressedHandle(FFFFFFF)Lcom/edmodo/cropper/cropwindow/handle/Handle;
    .locals 13

    move v6, p0

    move v7, p1

    move/from16 v8, p4

    move/from16 v9, p5

    invoke-static/range {p0 .. p3}, Lcom/edmodo/cropper/util/MathUtil;->calculateDistance(FFFF)F

    move-result v0

    const/high16 v1, 0x7f800000    # Float.POSITIVE_INFINITY

    cmpg-float v2, v0, v1

    const/4 v10, 0x0

    if-gez v2, :cond_0

    sget-object v1, Lcom/edmodo/cropper/cropwindow/handle/Handle;->TOP_LEFT:Lcom/edmodo/cropper/cropwindow/handle/Handle;

    move/from16 v11, p3

    goto :goto_0

    :cond_0
    move/from16 v11, p3

    move-object v1, v10

    const/high16 v0, 0x7f800000    # Float.POSITIVE_INFINITY

    :goto_0
    invoke-static {p0, p1, v8, v11}, Lcom/edmodo/cropper/util/MathUtil;->calculateDistance(FFFF)F

    move-result v2

    cmpg-float v3, v2, v0

    if-gez v3, :cond_1

    sget-object v1, Lcom/edmodo/cropper/cropwindow/handle/Handle;->TOP_RIGHT:Lcom/edmodo/cropper/cropwindow/handle/Handle;

    move v12, p2

    move v0, v2

    goto :goto_1

    :cond_1
    move v12, p2

    :goto_1
    invoke-static {p0, p1, p2, v9}, Lcom/edmodo/cropper/util/MathUtil;->calculateDistance(FFFF)F

    move-result v2

    cmpg-float v3, v2, v0

    if-gez v3, :cond_2

    sget-object v1, Lcom/edmodo/cropper/cropwindow/handle/Handle;->BOTTOM_LEFT:Lcom/edmodo/cropper/cropwindow/handle/Handle;

    move v0, v2

    :cond_2
    invoke-static {p0, p1, v8, v9}, Lcom/edmodo/cropper/util/MathUtil;->calculateDistance(FFFF)F

    move-result v2

    cmpg-float v3, v2, v0

    if-gez v3, :cond_3

    sget-object v1, Lcom/edmodo/cropper/cropwindow/handle/Handle;->BOTTOM_RIGHT:Lcom/edmodo/cropper/cropwindow/handle/Handle;

    move v0, v2

    :cond_3
    cmpg-float v0, v0, p6

    if-gtz v0, :cond_4

    return-object v1

    :cond_4
    move v0, p0

    move v1, p1

    move v2, p2

    move/from16 v3, p4

    move/from16 v4, p3

    move/from16 v5, p6

    invoke-static/range {v0 .. v5}, Lcom/edmodo/cropper/util/HandleUtil;->isInHorizontalTargetZone(FFFFFF)Z

    move-result v0

    if-eqz v0, :cond_5

    sget-object v0, Lcom/edmodo/cropper/cropwindow/handle/Handle;->TOP:Lcom/edmodo/cropper/cropwindow/handle/Handle;

    return-object v0

    :cond_5
    move v0, p0

    move v1, p1

    move v2, p2

    move/from16 v3, p4

    move/from16 v4, p5

    move/from16 v5, p6

    invoke-static/range {v0 .. v5}, Lcom/edmodo/cropper/util/HandleUtil;->isInHorizontalTargetZone(FFFFFF)Z

    move-result v0

    if-eqz v0, :cond_6

    sget-object v0, Lcom/edmodo/cropper/cropwindow/handle/Handle;->BOTTOM:Lcom/edmodo/cropper/cropwindow/handle/Handle;

    return-object v0

    :cond_6
    move v0, p0

    move v1, p1

    move v2, p2

    move/from16 v3, p3

    move/from16 v4, p5

    move/from16 v5, p6

    invoke-static/range {v0 .. v5}, Lcom/edmodo/cropper/util/HandleUtil;->isInVerticalTargetZone(FFFFFF)Z

    move-result v0

    if-eqz v0, :cond_7

    sget-object v0, Lcom/edmodo/cropper/cropwindow/handle/Handle;->LEFT:Lcom/edmodo/cropper/cropwindow/handle/Handle;

    return-object v0

    :cond_7
    move v0, p0

    move v1, p1

    move/from16 v2, p4

    move/from16 v3, p3

    move/from16 v4, p5

    move/from16 v5, p6

    invoke-static/range {v0 .. v5}, Lcom/edmodo/cropper/util/HandleUtil;->isInVerticalTargetZone(FFFFFF)Z

    move-result v0

    if-eqz v0, :cond_8

    sget-object v0, Lcom/edmodo/cropper/cropwindow/handle/Handle;->RIGHT:Lcom/edmodo/cropper/cropwindow/handle/Handle;

    return-object v0

    :cond_8
    invoke-static/range {p0 .. p5}, Lcom/edmodo/cropper/util/HandleUtil;->isWithinBounds(FFFFFF)Z

    move-result v0

    if-eqz v0, :cond_9

    sget-object v0, Lcom/edmodo/cropper/cropwindow/handle/Handle;->CENTER:Lcom/edmodo/cropper/cropwindow/handle/Handle;

    return-object v0

    :cond_9
    return-object v10
.end method

.method private static isInHorizontalTargetZone(FFFFFF)Z
    .locals 0

    cmpl-float p2, p0, p2

    if-lez p2, :cond_0

    cmpg-float p0, p0, p3

    if-gez p0, :cond_0

    sub-float/2addr p1, p4

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p0

    cmpg-float p0, p0, p5

    if-gtz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static isInVerticalTargetZone(FFFFFF)Z
    .locals 0

    sub-float/2addr p0, p2

    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    move-result p0

    cmpg-float p0, p0, p5

    if-gtz p0, :cond_0

    cmpl-float p0, p1, p3

    if-lez p0, :cond_0

    cmpg-float p0, p1, p4

    if-gez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static isWithinBounds(FFFFFF)Z
    .locals 0

    cmpl-float p2, p0, p2

    if-ltz p2, :cond_0

    cmpg-float p0, p0, p4

    if-gtz p0, :cond_0

    cmpl-float p0, p1, p3

    if-ltz p0, :cond_0

    cmpg-float p0, p1, p5

    if-gtz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method
