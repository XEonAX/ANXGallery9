.class public Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUBrightnessFilter;
.super Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPURGBLutFilter;
.source "GPUBrightnessFilter.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/core/imports/filter/render/IFilterEmptyValidate;


# direct methods
.method public constructor <init>(I)V
    .locals 4

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPURGBLutFilter;-><init>(I)V

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUBrightnessFilter;->mDegree:I

    const/4 v0, 0x0

    const/high16 v1, 0x42480000    # 50.0f

    const/high16 v2, 0x3f800000    # 1.0f

    const/16 v3, 0x32

    if-le p1, v3, :cond_0

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUBrightnessFilter;->mDegree:I

    sub-int/2addr p1, v3

    int-to-float p1, p1

    mul-float p1, p1, v2

    div-float/2addr p1, v1

    add-float/2addr p1, v0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUBrightnessFilter;->mPercent:F

    goto :goto_0

    :cond_0
    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUBrightnessFilter;->mDegree:I

    sub-int/2addr v3, p1

    int-to-float p1, v3

    mul-float p1, p1, v2

    div-float/2addr p1, v1

    add-float/2addr p1, v0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUBrightnessFilter;->mPercent:F

    :goto_0
    return-void
.end method


# virtual methods
.method protected getLUTPath()Ljava/lang/String;
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUBrightnessFilter;->mDegree:I

    const/16 v1, 0x32

    if-le v0, v1, :cond_0

    const-string v0, "filter/adjust/adjust_high_brightness.png"

    goto :goto_0

    :cond_0
    const-string v0, "filter/adjust/adjust_low_brightness.png"

    :goto_0
    return-object v0
.end method

.method public isEmpty()Z
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/filter/adjust/GPUBrightnessFilter;->mDegree:I

    const/16 v1, 0x32

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
