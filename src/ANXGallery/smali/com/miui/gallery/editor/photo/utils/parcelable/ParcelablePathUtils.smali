.class public Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelablePathUtils;
.super Ljava/lang/Object;
.source "ParcelablePathUtils.java"


# direct methods
.method public static getPathFromPointList(Ljava/util/List;)Landroid/graphics/Path;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/graphics/PointF;",
            ">;)",
            "Landroid/graphics/Path;"
        }
    .end annotation

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v1, 0x0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/PointF;

    iget v3, v2, Landroid/graphics/PointF;->x:F

    iget v4, v2, Landroid/graphics/PointF;->y:F

    if-nez v1, :cond_0

    invoke-virtual {v0, v3, v4}, Landroid/graphics/Path;->moveTo(FF)V

    goto :goto_1

    :cond_0
    iget v5, v1, Landroid/graphics/PointF;->x:F

    add-float/2addr v5, v3

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v5, v3

    iget v6, v1, Landroid/graphics/PointF;->y:F

    add-float/2addr v6, v4

    div-float/2addr v6, v3

    iget v3, v1, Landroid/graphics/PointF;->x:F

    iget v1, v1, Landroid/graphics/PointF;->y:F

    invoke-virtual {v0, v3, v1, v5, v6}, Landroid/graphics/Path;->quadTo(FFFF)V

    :goto_1
    move-object v1, v2

    goto :goto_0

    :cond_1
    return-object v0
.end method
