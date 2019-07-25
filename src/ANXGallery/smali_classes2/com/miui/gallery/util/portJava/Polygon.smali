.class public Lcom/miui/gallery/util/portJava/Polygon;
.super Ljava/lang/Object;
.source "Polygon.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = -0x59a6bfa6a13b9c51L


# instance fields
.field protected bounds:Lcom/miui/gallery/util/portJava/Rectangle;

.field public npoints:I

.field public xpoints:[I

.field public ypoints:[I


# virtual methods
.method calculateBounds([I[II)V
    .locals 6

    const/high16 v0, -0x80000000

    const v1, 0x7fffffff

    const/4 v2, 0x0

    const v3, 0x7fffffff

    const/high16 v4, -0x80000000

    :goto_0
    if-ge v2, p3, :cond_0

    aget v5, p1, v2

    invoke-static {v1, v5}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {v0, v5}, Ljava/lang/Math;->max(II)I

    move-result v0

    aget v5, p2, v2

    invoke-static {v3, v5}, Ljava/lang/Math;->min(II)I

    move-result v3

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v4

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    new-instance p1, Lcom/miui/gallery/util/portJava/Rectangle;

    sub-int/2addr v0, v1

    sub-int/2addr v4, v3

    invoke-direct {p1, v1, v3, v0, v4}, Lcom/miui/gallery/util/portJava/Rectangle;-><init>(IIII)V

    iput-object p1, p0, Lcom/miui/gallery/util/portJava/Polygon;->bounds:Lcom/miui/gallery/util/portJava/Rectangle;

    return-void
.end method

.method public contains(DD)Z
    .locals 21

    move-object/from16 v0, p0

    move-wide/from16 v1, p1

    move-wide/from16 v3, p3

    iget v5, v0, Lcom/miui/gallery/util/portJava/Polygon;->npoints:I

    const/4 v7, 0x2

    if-le v5, v7, :cond_e

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/util/portJava/Polygon;->getBoundingBox()Lcom/miui/gallery/util/portJava/Rectangle;

    move-result-object v5

    invoke-virtual {v5, v1, v2, v3, v4}, Lcom/miui/gallery/util/portJava/Rectangle;->contains(DD)Z

    move-result v5

    if-nez v5, :cond_0

    goto/16 :goto_7

    :cond_0
    iget-object v5, v0, Lcom/miui/gallery/util/portJava/Polygon;->xpoints:[I

    iget v7, v0, Lcom/miui/gallery/util/portJava/Polygon;->npoints:I

    const/4 v8, 0x1

    sub-int/2addr v7, v8

    aget v5, v5, v7

    iget-object v7, v0, Lcom/miui/gallery/util/portJava/Polygon;->ypoints:[I

    iget v9, v0, Lcom/miui/gallery/util/portJava/Polygon;->npoints:I

    sub-int/2addr v9, v8

    aget v7, v7, v9

    move v10, v5

    const/4 v5, 0x0

    const/4 v9, 0x0

    :goto_0
    iget v11, v0, Lcom/miui/gallery/util/portJava/Polygon;->npoints:I

    if-ge v5, v11, :cond_c

    iget-object v11, v0, Lcom/miui/gallery/util/portJava/Polygon;->xpoints:[I

    aget v11, v11, v5

    iget-object v12, v0, Lcom/miui/gallery/util/portJava/Polygon;->ypoints:[I

    aget v12, v12, v5

    if-ne v12, v7, :cond_2

    :cond_1
    :goto_1
    move/from16 v17, v9

    goto/16 :goto_4

    :cond_2
    if-ge v11, v10, :cond_4

    int-to-double v13, v10

    cmpl-double v15, v1, v13

    if-ltz v15, :cond_3

    goto :goto_1

    :cond_3
    move v13, v11

    goto :goto_2

    :cond_4
    int-to-double v13, v11

    cmpl-double v15, v1, v13

    if-ltz v15, :cond_5

    goto :goto_1

    :cond_5
    move v13, v10

    :goto_2
    if-ge v12, v7, :cond_8

    int-to-double v14, v12

    cmpg-double v16, v3, v14

    if-ltz v16, :cond_1

    move/from16 v17, v9

    int-to-double v8, v7

    cmpl-double v16, v3, v8

    if-ltz v16, :cond_6

    goto :goto_4

    :cond_6
    int-to-double v8, v13

    cmpg-double v13, v1, v8

    if-gez v13, :cond_7

    add-int/lit8 v9, v17, 0x1

    goto :goto_5

    :cond_7
    int-to-double v8, v11

    invoke-static {v8, v9}, Ljava/lang/Double;->isNaN(D)Z

    sub-double v8, v1, v8

    invoke-static {v14, v15}, Ljava/lang/Double;->isNaN(D)Z

    sub-double v13, v3, v14

    move-wide/from16 v19, v8

    move-wide v8, v13

    move-wide/from16 v13, v19

    goto :goto_3

    :cond_8
    move/from16 v17, v9

    int-to-double v8, v7

    cmpg-double v14, v3, v8

    if-ltz v14, :cond_b

    int-to-double v14, v12

    cmpl-double v16, v3, v14

    if-ltz v16, :cond_9

    goto :goto_4

    :cond_9
    int-to-double v13, v13

    cmpg-double v15, v1, v13

    if-gez v15, :cond_a

    add-int/lit8 v9, v17, 0x1

    goto :goto_5

    :cond_a
    int-to-double v13, v10

    invoke-static {v13, v14}, Ljava/lang/Double;->isNaN(D)Z

    sub-double v13, v1, v13

    invoke-static {v8, v9}, Ljava/lang/Double;->isNaN(D)Z

    sub-double v8, v3, v8

    :goto_3
    sub-int/2addr v7, v12

    int-to-double v6, v7

    invoke-static {v6, v7}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v8, v6

    sub-int/2addr v10, v11

    int-to-double v6, v10

    invoke-static {v6, v7}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v8, v8, v6

    cmpg-double v6, v13, v8

    if-gez v6, :cond_b

    add-int/lit8 v9, v17, 0x1

    goto :goto_5

    :cond_b
    :goto_4
    move/from16 v9, v17

    :goto_5
    add-int/lit8 v5, v5, 0x1

    move v10, v11

    move v7, v12

    const/4 v8, 0x1

    goto/16 :goto_0

    :cond_c
    move/from16 v17, v9

    const/4 v5, 0x1

    and-int/lit8 v1, v17, 0x1

    if-eqz v1, :cond_d

    const/16 v18, 0x1

    goto :goto_6

    :cond_d
    const/16 v18, 0x0

    :goto_6
    return v18

    :cond_e
    :goto_7
    const/4 v1, 0x0

    return v1
.end method

.method public contains(II)Z
    .locals 2

    int-to-double v0, p1

    int-to-double p1, p2

    invoke-virtual {p0, v0, v1, p1, p2}, Lcom/miui/gallery/util/portJava/Polygon;->contains(DD)Z

    move-result p1

    return p1
.end method

.method public getBoundingBox()Lcom/miui/gallery/util/portJava/Rectangle;
    .locals 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget v0, p0, Lcom/miui/gallery/util/portJava/Polygon;->npoints:I

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/util/portJava/Rectangle;

    invoke-direct {v0}, Lcom/miui/gallery/util/portJava/Rectangle;-><init>()V

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/util/portJava/Polygon;->bounds:Lcom/miui/gallery/util/portJava/Rectangle;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/util/portJava/Polygon;->xpoints:[I

    iget-object v1, p0, Lcom/miui/gallery/util/portJava/Polygon;->ypoints:[I

    iget v2, p0, Lcom/miui/gallery/util/portJava/Polygon;->npoints:I

    invoke-virtual {p0, v0, v1, v2}, Lcom/miui/gallery/util/portJava/Polygon;->calculateBounds([I[II)V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/util/portJava/Polygon;->bounds:Lcom/miui/gallery/util/portJava/Rectangle;

    invoke-virtual {v0}, Lcom/miui/gallery/util/portJava/Rectangle;->getBounds()Lcom/miui/gallery/util/portJava/Rectangle;

    move-result-object v0

    return-object v0
.end method
