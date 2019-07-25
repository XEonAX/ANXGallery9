.class public Lcom/meicam/themehelper/Utils;
.super Ljava/lang/Object;
.source "Utils.java"


# static fields
.field private static motionIdxList:[I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x4

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/meicam/themehelper/Utils;->motionIdxList:[I

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static LtToRb(Landroid/graphics/RectF;Landroid/graphics/RectF;[FF)V
    .locals 3

    const/4 v0, 0x0

    aget v1, p2, v0

    const/high16 v2, 0x3e800000    # 0.25f

    sub-float/2addr v1, v2

    const/high16 v2, -0x40800000    # -1.0f

    invoke-static {v2, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    iput v1, p0, Landroid/graphics/RectF;->left:F

    aget v0, p2, v0

    const/4 v1, 0x2

    aget p2, p2, v1

    add-float/2addr v0, p2

    const p2, 0x3eb33333    # 0.35f

    add-float/2addr v0, p2

    const/high16 p2, 0x3f800000    # 1.0f

    invoke-static {p2, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    iput v0, p0, Landroid/graphics/RectF;->right:F

    iget v0, p0, Landroid/graphics/RectF;->right:F

    iget v1, p0, Landroid/graphics/RectF;->left:F

    sub-float/2addr v0, v1

    sget v1, Lcom/meicam/themehelper/NvsThemeHelper;->m_timelineRatio:F

    div-float/2addr v0, v1

    mul-float v0, v0, p3

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    const v1, 0x3d4ccccd    # 0.05f

    sub-float/2addr v0, v1

    iput v0, p0, Landroid/graphics/RectF;->top:F

    iget v0, p0, Landroid/graphics/RectF;->top:F

    neg-float v0, v0

    const v1, 0x3dcccccd    # 0.1f

    sub-float/2addr v0, v1

    iput v0, p0, Landroid/graphics/RectF;->bottom:F

    iget v0, p0, Landroid/graphics/RectF;->left:F

    sub-float/2addr v0, v1

    invoke-static {v2, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, p1, Landroid/graphics/RectF;->left:F

    iget v0, p0, Landroid/graphics/RectF;->top:F

    add-float/2addr v0, v1

    invoke-static {p2, v0}, Ljava/lang/Math;->min(FF)F

    move-result p2

    iput p2, p1, Landroid/graphics/RectF;->top:F

    iget p0, p0, Landroid/graphics/RectF;->right:F

    sub-float/2addr p0, v1

    iput p0, p1, Landroid/graphics/RectF;->right:F

    iget p0, p1, Landroid/graphics/RectF;->top:F

    iget p2, p1, Landroid/graphics/RectF;->right:F

    iget v0, p1, Landroid/graphics/RectF;->left:F

    sub-float/2addr p2, v0

    sget v0, Lcom/meicam/themehelper/NvsThemeHelper;->m_timelineRatio:F

    div-float/2addr p2, v0

    mul-float p2, p2, p3

    sub-float/2addr p0, p2

    iput p0, p1, Landroid/graphics/RectF;->bottom:F

    return-void
.end method

.method private static RtToLb(Landroid/graphics/RectF;Landroid/graphics/RectF;[FF)V
    .locals 3

    const/4 v0, 0x0

    aget v1, p2, v0

    const/4 v2, 0x2

    aget v2, p2, v2

    add-float/2addr v1, v2

    const/high16 v2, 0x3e800000    # 0.25f

    add-float/2addr v1, v2

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v2, v1}, Ljava/lang/Math;->min(FF)F

    move-result v1

    iput v1, p0, Landroid/graphics/RectF;->right:F

    aget p2, p2, v0

    const v0, 0x3eb33333    # 0.35f

    sub-float/2addr p2, v0

    const/high16 v0, -0x40800000    # -1.0f

    invoke-static {v0, p2}, Ljava/lang/Math;->max(FF)F

    move-result p2

    iput p2, p0, Landroid/graphics/RectF;->left:F

    iget p2, p0, Landroid/graphics/RectF;->right:F

    iget v0, p0, Landroid/graphics/RectF;->left:F

    sub-float/2addr p2, v0

    sget v0, Lcom/meicam/themehelper/NvsThemeHelper;->m_timelineRatio:F

    div-float/2addr p2, v0

    mul-float p2, p2, p3

    const/high16 v0, 0x40000000    # 2.0f

    div-float/2addr p2, v0

    const v0, 0x3d4ccccd    # 0.05f

    sub-float/2addr p2, v0

    iput p2, p0, Landroid/graphics/RectF;->top:F

    iget p2, p0, Landroid/graphics/RectF;->top:F

    neg-float p2, p2

    const v0, 0x3dcccccd    # 0.1f

    sub-float/2addr p2, v0

    iput p2, p0, Landroid/graphics/RectF;->bottom:F

    iget p2, p0, Landroid/graphics/RectF;->right:F

    add-float/2addr p2, v0

    invoke-static {v2, p2}, Ljava/lang/Math;->min(FF)F

    move-result p2

    iput p2, p1, Landroid/graphics/RectF;->right:F

    iget p2, p0, Landroid/graphics/RectF;->top:F

    add-float/2addr p2, v0

    invoke-static {v2, p2}, Ljava/lang/Math;->min(FF)F

    move-result p2

    iput p2, p1, Landroid/graphics/RectF;->top:F

    iget p0, p0, Landroid/graphics/RectF;->left:F

    add-float/2addr p0, v0

    iput p0, p1, Landroid/graphics/RectF;->left:F

    iget p0, p1, Landroid/graphics/RectF;->top:F

    iget p2, p1, Landroid/graphics/RectF;->right:F

    iget v0, p1, Landroid/graphics/RectF;->left:F

    sub-float/2addr p2, v0

    sget v0, Lcom/meicam/themehelper/NvsThemeHelper;->m_timelineRatio:F

    div-float/2addr p2, v0

    mul-float p2, p2, p3

    sub-float/2addr p0, p2

    iput p0, p1, Landroid/graphics/RectF;->bottom:F

    return-void
.end method

.method private static calcLandscapeLeftRec(Landroid/graphics/RectF;F)Landroid/graphics/RectF;
    .locals 2

    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Landroid/graphics/RectF;->left:F

    const v0, 0x3fb33333    # 1.4f

    iput v0, p0, Landroid/graphics/RectF;->top:F

    const v0, -0x404ccccd    # -1.4f

    iput v0, p0, Landroid/graphics/RectF;->bottom:F

    iget v0, p0, Landroid/graphics/RectF;->top:F

    iget v1, p0, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v0, v1

    div-float/2addr v0, p1

    sget p1, Lcom/meicam/themehelper/NvsThemeHelper;->m_timelineRatio:F

    mul-float v0, v0, p1

    iget p1, p0, Landroid/graphics/RectF;->left:F

    add-float/2addr v0, p1

    iput v0, p0, Landroid/graphics/RectF;->right:F

    return-object p0
.end method

.method private static calcLandscapeRightRec(Landroid/graphics/RectF;F)Landroid/graphics/RectF;
    .locals 2

    const v0, -0x40b33333    # -0.8f

    iput v0, p0, Landroid/graphics/RectF;->left:F

    const v0, 0x3fb33333    # 1.4f

    iput v0, p0, Landroid/graphics/RectF;->top:F

    const v0, -0x404ccccd    # -1.4f

    iput v0, p0, Landroid/graphics/RectF;->bottom:F

    iget v0, p0, Landroid/graphics/RectF;->top:F

    iget v1, p0, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v0, v1

    div-float/2addr v0, p1

    sget p1, Lcom/meicam/themehelper/NvsThemeHelper;->m_timelineRatio:F

    mul-float v0, v0, p1

    iget p1, p0, Landroid/graphics/RectF;->left:F

    add-float/2addr v0, p1

    iput v0, p0, Landroid/graphics/RectF;->right:F

    return-object p0
.end method

.method public static changeHoriROI(FLandroid/graphics/RectF;Ljava/lang/String;Lcom/meicam/sdk/NvsVideoClip;)Ljava/lang/String;
    .locals 5

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    if-eqz p1, :cond_0

    const/4 v2, 0x4

    new-array v2, v2, [F

    const/4 v3, 0x0

    iget v4, p1, Landroid/graphics/RectF;->left:F

    aput v4, v2, v3

    const/4 v3, 0x1

    iget v4, p1, Landroid/graphics/RectF;->top:F

    aput v4, v2, v3

    const/4 v3, 0x2

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v4

    aput v4, v2, v3

    const/4 v3, 0x3

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result p1

    aput p1, v2, v3

    invoke-static {v0, v1, v2, p0}, Lcom/meicam/themehelper/Utils;->upToBottomByFx(Landroid/graphics/RectF;Landroid/graphics/RectF;[FF)V

    goto :goto_0

    :cond_0
    invoke-static {v0, v1, p0}, Lcom/meicam/themehelper/Utils;->normalUpToBottomByFx(Landroid/graphics/RectF;Landroid/graphics/RectF;F)V

    :goto_0
    if-eqz p3, :cond_1

    invoke-virtual {p3, v0, v1}, Lcom/meicam/sdk/NvsVideoClip;->setImageMotionROI(Landroid/graphics/RectF;Landroid/graphics/RectF;)V

    goto :goto_1

    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, ""

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, v0, Landroid/graphics/RectF;->left:F

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p1, ","

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, v0, Landroid/graphics/RectF;->right:F

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p1, ","

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, v0, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p1, ","

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, v0, Landroid/graphics/RectF;->top:F

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, ""

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p3, v1, Landroid/graphics/RectF;->left:F

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p3, ","

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p3, v1, Landroid/graphics/RectF;->right:F

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p3, ","

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p3, v1, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p3, ","

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p3, v1, Landroid/graphics/RectF;->top:F

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p3, "xiaomiEndROI"

    invoke-virtual {p2, p3, p0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string p2, "xiaomiStartROI"

    invoke-virtual {p0, p2, p1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p2

    :goto_1
    return-object p2
.end method

.method public static changeHoriROIV3(FLandroid/graphics/RectF;Ljava/lang/String;Z)Ljava/lang/String;
    .locals 5

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    if-eqz p1, :cond_0

    const/4 v2, 0x4

    new-array v2, v2, [F

    const/4 v3, 0x0

    iget v4, p1, Landroid/graphics/RectF;->left:F

    aput v4, v2, v3

    const/4 v3, 0x1

    iget v4, p1, Landroid/graphics/RectF;->top:F

    aput v4, v2, v3

    const/4 v3, 0x2

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v4

    aput v4, v2, v3

    const/4 v3, 0x3

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result p1

    aput p1, v2, v3

    invoke-static {v0, v1, v2, p0}, Lcom/meicam/themehelper/Utils;->upToBottomByFx(Landroid/graphics/RectF;Landroid/graphics/RectF;[FF)V

    goto :goto_0

    :cond_0
    invoke-static {v0, v1, p0}, Lcom/meicam/themehelper/Utils;->normalUpToBottomByFx(Landroid/graphics/RectF;Landroid/graphics/RectF;F)V

    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, ""

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, v0, Landroid/graphics/RectF;->left:F

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p1, ","

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, v0, Landroid/graphics/RectF;->right:F

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p1, ","

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, v0, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p1, ","

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, v0, Landroid/graphics/RectF;->top:F

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, ""

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, v1, Landroid/graphics/RectF;->left:F

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v0, ","

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, v1, Landroid/graphics/RectF;->right:F

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v0, ","

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, v1, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v0, ","

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, v1, Landroid/graphics/RectF;->top:F

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    if-eqz p3, :cond_1

    const-string p3, "xiaomiStartROI"

    invoke-virtual {p2, p3, p0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string p2, "xiaomiEndROI"

    invoke-virtual {p0, p2, p1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    goto :goto_1

    :cond_1
    const-string p3, "jieshu"

    invoke-virtual {p2, p3, p0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string p2, "kaishi"

    invoke-virtual {p0, p2, p1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    :goto_1
    return-object p0
.end method

.method public static changeROI(FLandroid/graphics/RectF;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    invoke-static {v0, v1, p1, p0}, Lcom/meicam/themehelper/Utils;->setImageROI(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/RectF;F)V

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, ""

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, v0, Landroid/graphics/RectF;->left:F

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p1, ","

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, v0, Landroid/graphics/RectF;->right:F

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p1, ","

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, v0, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p1, ","

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, v0, Landroid/graphics/RectF;->top:F

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, ""

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, v1, Landroid/graphics/RectF;->left:F

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v0, ","

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, v1, Landroid/graphics/RectF;->right:F

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v0, ","

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, v1, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v0, ","

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, v1, Landroid/graphics/RectF;->top:F

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "xiaomiStartROI"

    invoke-virtual {p2, v0, p0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string p2, "xiaomiEndROI"

    invoke-virtual {p0, p2, p1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static changeROIV3(FLandroid/graphics/RectF;Ljava/lang/String;Z)Ljava/lang/String;
    .locals 2

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    invoke-static {v0, v1, p1, p0}, Lcom/meicam/themehelper/Utils;->setImageROI(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/RectF;F)V

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, ""

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, v0, Landroid/graphics/RectF;->left:F

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p1, ","

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, v0, Landroid/graphics/RectF;->right:F

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p1, ","

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, v0, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p1, ","

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, v0, Landroid/graphics/RectF;->top:F

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, ""

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, v1, Landroid/graphics/RectF;->left:F

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v0, ","

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, v1, Landroid/graphics/RectF;->right:F

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v0, ","

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, v1, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v0, ","

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, v1, Landroid/graphics/RectF;->top:F

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    if-eqz p3, :cond_0

    const-string p3, "xiaomiStartROI"

    invoke-virtual {p2, p3, p0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string p2, "xiaomiEndROI"

    invoke-virtual {p0, p2, p1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_0
    const-string p3, "kaishi"

    invoke-virtual {p2, p3, p0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string p2, "jieshu"

    invoke-virtual {p0, p2, p1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    :goto_0
    return-object p0
.end method

.method private static changeROTBottom(Landroid/graphics/RectF;F)F
    .locals 2

    iget v0, p0, Landroid/graphics/RectF;->left:F

    iget v1, p0, Landroid/graphics/RectF;->top:F

    iget p0, p0, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v1, p0

    div-float/2addr v1, p1

    sget p0, Lcom/meicam/themehelper/NvsThemeHelper;->m_timelineRatio:F

    mul-float v1, v1, p0

    add-float/2addr v0, v1

    return v0
.end method

.method public static changeVertROI(FLandroid/graphics/RectF;Ljava/lang/String;Lcom/meicam/sdk/NvsVideoClip;)Ljava/lang/String;
    .locals 5

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    if-eqz p1, :cond_0

    const/4 v2, 0x4

    new-array v2, v2, [F

    const/4 v3, 0x0

    iget v4, p1, Landroid/graphics/RectF;->left:F

    aput v4, v2, v3

    const/4 v3, 0x1

    iget v4, p1, Landroid/graphics/RectF;->top:F

    aput v4, v2, v3

    const/4 v3, 0x2

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v4

    aput v4, v2, v3

    const/4 v3, 0x3

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result p1

    aput p1, v2, v3

    invoke-static {v0, v1, v2, p0}, Lcom/meicam/themehelper/Utils;->leftToRightByFx(Landroid/graphics/RectF;Landroid/graphics/RectF;[FF)V

    goto :goto_0

    :cond_0
    invoke-static {v0, v1, p0}, Lcom/meicam/themehelper/Utils;->normalLeftToRightByFx(Landroid/graphics/RectF;Landroid/graphics/RectF;F)V

    :goto_0
    if-eqz p3, :cond_1

    invoke-virtual {p3, v0, v1}, Lcom/meicam/sdk/NvsVideoClip;->setImageMotionROI(Landroid/graphics/RectF;Landroid/graphics/RectF;)V

    goto :goto_1

    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, ""

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, v0, Landroid/graphics/RectF;->left:F

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p1, ","

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, v0, Landroid/graphics/RectF;->right:F

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p1, ","

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, v0, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p1, ","

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, v0, Landroid/graphics/RectF;->top:F

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, ""

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p3, v1, Landroid/graphics/RectF;->left:F

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p3, ","

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p3, v1, Landroid/graphics/RectF;->right:F

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p3, ","

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p3, v1, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p3, ","

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p3, v1, Landroid/graphics/RectF;->top:F

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p3, "xiaomiEndROI"

    invoke-virtual {p2, p3, p0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string p2, "xiaomiStartROI"

    invoke-virtual {p0, p2, p1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p2

    :goto_1
    return-object p2
.end method

.method public static changeVertROIV3(FLandroid/graphics/RectF;Ljava/lang/String;Z)Ljava/lang/String;
    .locals 5

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    if-eqz p1, :cond_0

    const/4 v2, 0x4

    new-array v2, v2, [F

    const/4 v3, 0x0

    iget v4, p1, Landroid/graphics/RectF;->left:F

    aput v4, v2, v3

    const/4 v3, 0x1

    iget v4, p1, Landroid/graphics/RectF;->top:F

    aput v4, v2, v3

    const/4 v3, 0x2

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v4

    aput v4, v2, v3

    const/4 v3, 0x3

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result p1

    aput p1, v2, v3

    invoke-static {v0, v1, v2, p0}, Lcom/meicam/themehelper/Utils;->leftToRightByFx(Landroid/graphics/RectF;Landroid/graphics/RectF;[FF)V

    goto :goto_0

    :cond_0
    invoke-static {v0, v1, p0}, Lcom/meicam/themehelper/Utils;->normalLeftToRightByFx(Landroid/graphics/RectF;Landroid/graphics/RectF;F)V

    :goto_0
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string p1, ""

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, v0, Landroid/graphics/RectF;->left:F

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p1, ","

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, v0, Landroid/graphics/RectF;->right:F

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p1, ","

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, v0, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p1, ","

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, v0, Landroid/graphics/RectF;->top:F

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, ""

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, v1, Landroid/graphics/RectF;->left:F

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v0, ","

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, v1, Landroid/graphics/RectF;->right:F

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v0, ","

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, v1, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v0, ","

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, v1, Landroid/graphics/RectF;->top:F

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    if-eqz p3, :cond_1

    const-string p3, "xiaomiStartROI"

    invoke-virtual {p2, p3, p0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string p2, "xiaomiEndROI"

    invoke-virtual {p0, p2, p1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    goto :goto_1

    :cond_1
    const-string p3, "jieshu"

    invoke-virtual {p2, p3, p0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    const-string p2, "kaishi"

    invoke-virtual {p0, p2, p1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    :goto_1
    return-object p0
.end method

.method public static dip2px(Landroid/content/Context;F)I
    .locals 0

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    mul-float p1, p1, p0

    const/high16 p0, 0x3f000000    # 0.5f

    add-float/2addr p1, p0

    float-to-int p0, p1

    return p0
.end method

.method public static getImgRatio(Lcom/meicam/sdk/NvsAVFileInfo;)F
    .locals 4

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/meicam/sdk/NvsAVFileInfo;->getVideoStreamDimension(I)Lcom/meicam/sdk/NvsSize;

    move-result-object v1

    invoke-virtual {p0, v0}, Lcom/meicam/sdk/NvsAVFileInfo;->getVideoStreamRotation(I)I

    move-result p0

    new-instance v0, Lcom/meicam/sdk/NvsSize;

    iget v2, v1, Lcom/meicam/sdk/NvsSize;->width:I

    iget v3, v1, Lcom/meicam/sdk/NvsSize;->height:I

    invoke-direct {v0, v2, v3}, Lcom/meicam/sdk/NvsSize;-><init>(II)V

    const/4 v2, 0x1

    if-eq p0, v2, :cond_0

    const/4 v2, 0x3

    if-ne p0, v2, :cond_1

    :cond_0
    iget p0, v1, Lcom/meicam/sdk/NvsSize;->height:I

    iput p0, v0, Lcom/meicam/sdk/NvsSize;->width:I

    iget p0, v1, Lcom/meicam/sdk/NvsSize;->width:I

    iput p0, v0, Lcom/meicam/sdk/NvsSize;->height:I

    :cond_1
    iget p0, v0, Lcom/meicam/sdk/NvsSize;->width:I

    int-to-float p0, p0

    iget v0, v0, Lcom/meicam/sdk/NvsSize;->height:I

    int-to-float v0, v0

    div-float/2addr p0, v0

    return p0
.end method

.method private static getMotionIdx(II)I
    .locals 2

    sget-object v0, Lcom/meicam/themehelper/NvsThemeHelper;->rand:Ljava/util/Random;

    invoke-virtual {v0, p0}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    sget-object v1, Lcom/meicam/themehelper/Utils;->motionIdxList:[I

    array-length v1, v1

    if-lt p1, v1, :cond_0

    return v0

    :cond_0
    sget-object v1, Lcom/meicam/themehelper/Utils;->motionIdxList:[I

    aget v1, v1, p1

    if-ne v0, v1, :cond_1

    add-int/lit8 v0, v0, 0x1

    if-lt v0, p0, :cond_1

    const/4 v0, 0x0

    :cond_1
    sget-object p0, Lcom/meicam/themehelper/Utils;->motionIdxList:[I

    aput v0, p0, p1

    return v0
.end method

.method public static getScreenWidth(Landroid/content/Context;)I
    .locals 2

    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    const-string v1, "window"

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/WindowManager;

    invoke-interface {p0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    iget p0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    return p0
.end method

.method private static leftToRight(Landroid/graphics/RectF;Landroid/graphics/RectF;[FF)V
    .locals 1

    const/4 v0, 0x0

    aget p2, p2, v0

    const v0, 0x3e99999a    # 0.3f

    sub-float/2addr p2, v0

    const/high16 v0, -0x40800000    # -1.0f

    invoke-static {v0, p2}, Ljava/lang/Math;->max(FF)F

    move-result p2

    iput p2, p0, Landroid/graphics/RectF;->left:F

    const p2, 0x3fb33333    # 1.4f

    iput p2, p0, Landroid/graphics/RectF;->top:F

    const p2, -0x404ccccd    # -1.4f

    iput p2, p0, Landroid/graphics/RectF;->bottom:F

    iget p2, p0, Landroid/graphics/RectF;->top:F

    iget v0, p0, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr p2, v0

    div-float/2addr p2, p3

    sget p3, Lcom/meicam/themehelper/NvsThemeHelper;->m_timelineRatio:F

    mul-float p2, p2, p3

    iget p3, p0, Landroid/graphics/RectF;->left:F

    add-float/2addr p2, p3

    iput p2, p0, Landroid/graphics/RectF;->right:F

    iget p2, p0, Landroid/graphics/RectF;->top:F

    iput p2, p1, Landroid/graphics/RectF;->top:F

    iget p2, p0, Landroid/graphics/RectF;->bottom:F

    iput p2, p1, Landroid/graphics/RectF;->bottom:F

    iget p2, p0, Landroid/graphics/RectF;->right:F

    const p3, 0x3e19999a    # 0.15f

    add-float/2addr p2, p3

    const/high16 p3, 0x3f800000    # 1.0f

    invoke-static {p3, p2}, Ljava/lang/Math;->min(FF)F

    move-result p2

    iput p2, p1, Landroid/graphics/RectF;->right:F

    iget p2, p0, Landroid/graphics/RectF;->left:F

    iget p3, p1, Landroid/graphics/RectF;->right:F

    add-float/2addr p2, p3

    iget p0, p0, Landroid/graphics/RectF;->right:F

    sub-float/2addr p2, p0

    iput p2, p1, Landroid/graphics/RectF;->left:F

    return-void
.end method

.method private static leftToRightByFx(Landroid/graphics/RectF;Landroid/graphics/RectF;[FF)V
    .locals 5

    float-to-double v0, p3

    const-wide/high16 v2, 0x3ff8000000000000L    # 1.5

    cmpl-double v4, v0, v2

    const/high16 v0, 0x40000000    # 2.0f

    if-lez v4, :cond_0

    const p2, 0x3fb33333    # 1.4f

    iput p2, p0, Landroid/graphics/RectF;->top:F

    const p2, -0x404ccccd    # -1.4f

    iput p2, p0, Landroid/graphics/RectF;->bottom:F

    iget p2, p0, Landroid/graphics/RectF;->top:F

    iget v1, p0, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr p2, v1

    sget v1, Lcom/meicam/themehelper/NvsThemeHelper;->m_timelineRatio:F

    mul-float p2, p2, v1

    div-float/2addr p2, p3

    const/high16 v1, -0x40800000    # -1.0f

    neg-float p2, p2

    div-float/2addr p2, v0

    const v0, 0x3d99999a    # 0.075f

    sub-float/2addr p2, v0

    invoke-static {v1, p2}, Ljava/lang/Math;->max(FF)F

    move-result p2

    iput p2, p0, Landroid/graphics/RectF;->left:F

    iget p2, p0, Landroid/graphics/RectF;->top:F

    iget v0, p0, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr p2, v0

    div-float/2addr p2, p3

    sget p3, Lcom/meicam/themehelper/NvsThemeHelper;->m_timelineRatio:F

    mul-float p2, p2, p3

    iget p3, p0, Landroid/graphics/RectF;->left:F

    add-float/2addr p2, p3

    iput p2, p0, Landroid/graphics/RectF;->right:F

    iget p2, p0, Landroid/graphics/RectF;->top:F

    iput p2, p1, Landroid/graphics/RectF;->top:F

    iget p2, p0, Landroid/graphics/RectF;->bottom:F

    iput p2, p1, Landroid/graphics/RectF;->bottom:F

    const/high16 p2, 0x3f800000    # 1.0f

    iget p3, p0, Landroid/graphics/RectF;->right:F

    const v0, 0x3e19999a    # 0.15f

    add-float/2addr p3, v0

    invoke-static {p2, p3}, Ljava/lang/Math;->min(FF)F

    move-result p2

    iput p2, p1, Landroid/graphics/RectF;->right:F

    iget p2, p0, Landroid/graphics/RectF;->left:F

    iget p3, p1, Landroid/graphics/RectF;->right:F

    add-float/2addr p2, p3

    iget p0, p0, Landroid/graphics/RectF;->right:F

    sub-float/2addr p2, p0

    iput p2, p1, Landroid/graphics/RectF;->left:F

    goto :goto_0

    :cond_0
    const/4 v1, 0x1

    aget v1, p2, v1

    mul-float v1, v1, v0

    const/4 v2, 0x3

    aget p2, p2, v2

    sub-float/2addr v1, p2

    div-float/2addr v1, v0

    const p2, -0x4099999a    # -0.9f

    iput p2, p0, Landroid/graphics/RectF;->left:F

    const p2, 0x3f333333    # 0.7f

    iput p2, p0, Landroid/graphics/RectF;->right:F

    iget p2, p0, Landroid/graphics/RectF;->right:F

    iget v2, p0, Landroid/graphics/RectF;->left:F

    sub-float/2addr p2, v2

    mul-float p2, p2, p3

    sget v2, Lcom/meicam/themehelper/NvsThemeHelper;->m_timelineRatio:F

    div-float/2addr p2, v2

    div-float/2addr p2, v0

    add-float/2addr p2, v1

    iput p2, p0, Landroid/graphics/RectF;->top:F

    iget p2, p0, Landroid/graphics/RectF;->right:F

    iget v2, p0, Landroid/graphics/RectF;->left:F

    sub-float/2addr p2, v2

    neg-float p2, p2

    mul-float p2, p2, p3

    sget p3, Lcom/meicam/themehelper/NvsThemeHelper;->m_timelineRatio:F

    div-float/2addr p2, p3

    div-float/2addr p2, v0

    add-float/2addr p2, v1

    iput p2, p0, Landroid/graphics/RectF;->bottom:F

    const p2, -0x40cccccd    # -0.7f

    iput p2, p1, Landroid/graphics/RectF;->left:F

    const p2, 0x3f666666    # 0.9f

    iput p2, p1, Landroid/graphics/RectF;->right:F

    iget p2, p0, Landroid/graphics/RectF;->top:F

    iput p2, p1, Landroid/graphics/RectF;->top:F

    iget p0, p0, Landroid/graphics/RectF;->bottom:F

    iput p0, p1, Landroid/graphics/RectF;->bottom:F

    :goto_0
    return-void
.end method

.method private static normalLbToRt(Landroid/graphics/RectF;Landroid/graphics/RectF;F)V
    .locals 3

    const v0, -0x4099999a    # -0.9f

    iput v0, p0, Landroid/graphics/RectF;->left:F

    const v0, 0x3f666666    # 0.9f

    iput v0, p0, Landroid/graphics/RectF;->top:F

    const v0, 0x3f59999a    # 0.85f

    iput v0, p0, Landroid/graphics/RectF;->right:F

    iget v0, p0, Landroid/graphics/RectF;->top:F

    invoke-virtual {p0}, Landroid/graphics/RectF;->width()F

    move-result v1

    mul-float v1, v1, p2

    sget v2, Lcom/meicam/themehelper/NvsThemeHelper;->m_timelineRatio:F

    div-float/2addr v1, v2

    sub-float/2addr v0, v1

    iput v0, p0, Landroid/graphics/RectF;->bottom:F

    iget v0, p0, Landroid/graphics/RectF;->bottom:F

    const/high16 v1, -0x40800000    # -1.0f

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    iput v1, p0, Landroid/graphics/RectF;->bottom:F

    invoke-static {p0, p2}, Lcom/meicam/themehelper/Utils;->changeROTBottom(Landroid/graphics/RectF;F)F

    move-result v0

    iput v0, p0, Landroid/graphics/RectF;->right:F

    :cond_0
    const/high16 p0, -0x40c00000    # -0.75f

    iput p0, p1, Landroid/graphics/RectF;->left:F

    const/high16 p0, 0x3f800000    # 1.0f

    iput p0, p1, Landroid/graphics/RectF;->top:F

    iput p0, p1, Landroid/graphics/RectF;->right:F

    iget p0, p1, Landroid/graphics/RectF;->top:F

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v0

    mul-float v0, v0, p2

    sget v2, Lcom/meicam/themehelper/NvsThemeHelper;->m_timelineRatio:F

    div-float/2addr v0, v2

    sub-float/2addr p0, v0

    iput p0, p1, Landroid/graphics/RectF;->bottom:F

    iget p0, p1, Landroid/graphics/RectF;->bottom:F

    cmpg-float p0, p0, v1

    if-gez p0, :cond_1

    iput v1, p1, Landroid/graphics/RectF;->bottom:F

    invoke-static {p1, p2}, Lcom/meicam/themehelper/Utils;->changeROTBottom(Landroid/graphics/RectF;F)F

    move-result p0

    iput p0, p1, Landroid/graphics/RectF;->right:F

    :cond_1
    return-void
.end method

.method public static normalLeftToRightByFx(Landroid/graphics/RectF;Landroid/graphics/RectF;F)V
    .locals 5

    float-to-double v0, p2

    const-wide/high16 v2, 0x3ff8000000000000L    # 1.5

    cmpl-double v4, v0, v2

    const/high16 v0, 0x40000000    # 2.0f

    if-lez v4, :cond_0

    const v1, 0x3fb33333    # 1.4f

    iput v1, p0, Landroid/graphics/RectF;->top:F

    const v1, -0x404ccccd    # -1.4f

    iput v1, p0, Landroid/graphics/RectF;->bottom:F

    iget v1, p0, Landroid/graphics/RectF;->top:F

    iget v2, p0, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v1, v2

    sget v2, Lcom/meicam/themehelper/NvsThemeHelper;->m_timelineRatio:F

    mul-float v1, v1, v2

    div-float/2addr v1, p2

    const/high16 v2, -0x40800000    # -1.0f

    neg-float v1, v1

    div-float/2addr v1, v0

    const v0, 0x3d99999a    # 0.075f

    sub-float/2addr v1, v0

    invoke-static {v2, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, p0, Landroid/graphics/RectF;->left:F

    iget v0, p0, Landroid/graphics/RectF;->top:F

    iget v1, p0, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v0, v1

    div-float/2addr v0, p2

    sget p2, Lcom/meicam/themehelper/NvsThemeHelper;->m_timelineRatio:F

    mul-float v0, v0, p2

    iget p2, p0, Landroid/graphics/RectF;->left:F

    add-float/2addr v0, p2

    iput v0, p0, Landroid/graphics/RectF;->right:F

    iget p2, p0, Landroid/graphics/RectF;->top:F

    iput p2, p1, Landroid/graphics/RectF;->top:F

    iget p2, p0, Landroid/graphics/RectF;->bottom:F

    iput p2, p1, Landroid/graphics/RectF;->bottom:F

    const/high16 p2, 0x3f800000    # 1.0f

    iget v0, p0, Landroid/graphics/RectF;->right:F

    const v1, 0x3e19999a    # 0.15f

    add-float/2addr v0, v1

    invoke-static {p2, v0}, Ljava/lang/Math;->min(FF)F

    move-result p2

    iput p2, p1, Landroid/graphics/RectF;->right:F

    iget p2, p0, Landroid/graphics/RectF;->left:F

    iget v0, p1, Landroid/graphics/RectF;->right:F

    add-float/2addr p2, v0

    iget p0, p0, Landroid/graphics/RectF;->right:F

    sub-float/2addr p2, p0

    iput p2, p1, Landroid/graphics/RectF;->left:F

    goto :goto_0

    :cond_0
    const v1, -0x40b33333    # -0.8f

    iput v1, p0, Landroid/graphics/RectF;->left:F

    const v1, 0x3f333333    # 0.7f

    iput v1, p0, Landroid/graphics/RectF;->right:F

    iget v1, p0, Landroid/graphics/RectF;->right:F

    iget v2, p0, Landroid/graphics/RectF;->left:F

    sub-float/2addr v1, v2

    mul-float v1, v1, p2

    sget p2, Lcom/meicam/themehelper/NvsThemeHelper;->m_timelineRatio:F

    div-float/2addr v1, p2

    div-float/2addr v1, v0

    iput v1, p0, Landroid/graphics/RectF;->top:F

    iget p2, p0, Landroid/graphics/RectF;->top:F

    neg-float p2, p2

    iput p2, p0, Landroid/graphics/RectF;->bottom:F

    const p2, -0x40cccccd    # -0.7f

    iput p2, p1, Landroid/graphics/RectF;->left:F

    const p2, 0x3f4ccccd    # 0.8f

    iput p2, p1, Landroid/graphics/RectF;->right:F

    iget p2, p0, Landroid/graphics/RectF;->top:F

    iput p2, p1, Landroid/graphics/RectF;->top:F

    iget p0, p0, Landroid/graphics/RectF;->bottom:F

    iput p0, p1, Landroid/graphics/RectF;->bottom:F

    :goto_0
    return-void
.end method

.method private static normalLtToRb(Landroid/graphics/RectF;Landroid/graphics/RectF;F)V
    .locals 5

    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Landroid/graphics/RectF;->left:F

    const/high16 v1, 0x3f800000    # 1.0f

    iput v1, p0, Landroid/graphics/RectF;->top:F

    const v2, 0x3f4ccccd    # 0.8f

    iput v2, p0, Landroid/graphics/RectF;->right:F

    iget v2, p0, Landroid/graphics/RectF;->top:F

    invoke-virtual {p0}, Landroid/graphics/RectF;->width()F

    move-result v3

    mul-float v3, v3, p2

    sget v4, Lcom/meicam/themehelper/NvsThemeHelper;->m_timelineRatio:F

    div-float/2addr v3, v4

    sub-float/2addr v2, v3

    iput v2, p0, Landroid/graphics/RectF;->bottom:F

    iget v2, p0, Landroid/graphics/RectF;->bottom:F

    cmpg-float v2, v2, v0

    if-gez v2, :cond_0

    iput v0, p0, Landroid/graphics/RectF;->bottom:F

    invoke-static {p0, p2}, Lcom/meicam/themehelper/Utils;->changeROTBottom(Landroid/graphics/RectF;F)F

    move-result v2

    iput v2, p0, Landroid/graphics/RectF;->right:F

    :cond_0
    const p0, -0x40a66666    # -0.85f

    iput p0, p1, Landroid/graphics/RectF;->left:F

    const p0, 0x3f666666    # 0.9f

    iput p0, p1, Landroid/graphics/RectF;->top:F

    iput v1, p1, Landroid/graphics/RectF;->right:F

    iget p0, p1, Landroid/graphics/RectF;->top:F

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v1

    mul-float v1, v1, p2

    sget v2, Lcom/meicam/themehelper/NvsThemeHelper;->m_timelineRatio:F

    div-float/2addr v1, v2

    sub-float/2addr p0, v1

    iput p0, p1, Landroid/graphics/RectF;->bottom:F

    iget p0, p1, Landroid/graphics/RectF;->bottom:F

    cmpg-float p0, p0, v0

    if-gez p0, :cond_1

    iput v0, p1, Landroid/graphics/RectF;->bottom:F

    invoke-static {p1, p2}, Lcom/meicam/themehelper/Utils;->changeROTBottom(Landroid/graphics/RectF;F)F

    move-result p0

    iput p0, p1, Landroid/graphics/RectF;->right:F

    :cond_1
    return-void
.end method

.method public static normalUpToBottomByFx(Landroid/graphics/RectF;Landroid/graphics/RectF;F)V
    .locals 2

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Landroid/graphics/RectF;->top:F

    const v0, -0x40b33333    # -0.8f

    iput v0, p0, Landroid/graphics/RectF;->bottom:F

    iget v0, p0, Landroid/graphics/RectF;->top:F

    iget v1, p0, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v0, v1

    neg-float v0, v0

    sget v1, Lcom/meicam/themehelper/NvsThemeHelper;->m_timelineRatio:F

    mul-float v0, v0, v1

    div-float/2addr v0, p2

    const/high16 p2, 0x40000000    # 2.0f

    div-float/2addr v0, p2

    iput v0, p0, Landroid/graphics/RectF;->left:F

    iget p2, p0, Landroid/graphics/RectF;->left:F

    neg-float p2, p2

    iput p2, p0, Landroid/graphics/RectF;->right:F

    iget p2, p0, Landroid/graphics/RectF;->left:F

    iput p2, p1, Landroid/graphics/RectF;->left:F

    iget p0, p0, Landroid/graphics/RectF;->right:F

    iput p0, p1, Landroid/graphics/RectF;->right:F

    const p0, 0x3f4ccccd    # 0.8f

    iput p0, p1, Landroid/graphics/RectF;->top:F

    const/high16 p0, -0x40800000    # -1.0f

    iput p0, p1, Landroid/graphics/RectF;->bottom:F

    return-void
.end method

.method public static readFile(Ljava/lang/String;Landroid/content/res/AssetManager;)Ljava/lang/String;
    .locals 2

    const/4 v0, 0x0

    if-nez p1, :cond_0

    :try_start_0
    new-instance p1, Ljava/io/File;

    invoke-direct {p1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance p0, Ljava/io/FileInputStream;

    invoke-direct {p0, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    goto :goto_0

    :catch_0
    move-exception p0

    goto :goto_1

    :catch_1
    move-exception p0

    goto :goto_2

    :cond_0
    invoke-virtual {p1, p0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p0

    :goto_0
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result p1

    new-array p1, p1, [B

    invoke-virtual {p0, p1}, Ljava/io/InputStream;->read([B)I

    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    new-instance p0, Ljava/lang/String;

    const-string v1, "UTF-8"

    invoke-direct {p0, p1, v1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :goto_1
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V

    return-object v0

    :goto_2
    invoke-virtual {p0}, Ljava/io/FileNotFoundException;->printStackTrace()V

    return-object v0
.end method

.method private static setClipMask(Lcom/meicam/sdk/NvsVideoClip;Z)V
    .locals 4

    const/high16 v0, 0x3f800000    # 1.0f

    const/high16 v1, -0x40800000    # -1.0f

    if-eqz p1, :cond_0

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1, v1, v0, v0, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {p0, p1}, Lcom/meicam/sdk/NvsVideoClip;->setImageMaskROI(Landroid/graphics/RectF;)V

    const-string p1, "fullscreenMode"

    const-string v0, "true"

    invoke-virtual {p0, p1, v0}, Lcom/meicam/sdk/NvsVideoClip;->setAttachment(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    sget p1, Lcom/meicam/themehelper/NvsThemeHelper;->m_timelineRatio:F

    new-instance v2, Landroid/graphics/RectF;

    neg-float v3, p1

    invoke-direct {v2, v1, p1, v0, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {p0, v2}, Lcom/meicam/sdk/NvsVideoClip;->setImageMaskROI(Landroid/graphics/RectF;)V

    const-string p1, "fullscreenMode"

    const-string v0, "false"

    invoke-virtual {p0, p1, v0}, Lcom/meicam/sdk/NvsVideoClip;->setAttachment(Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method public static setImageMotion(Lcom/meicam/sdk/NvsVideoClip;FZLandroid/graphics/RectF;)V
    .locals 3

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p2, :cond_1

    const/4 p2, 0x2

    const/4 p3, 0x4

    invoke-static {p2, p3}, Lcom/meicam/themehelper/Utils;->getMotionIdx(II)I

    move-result p2

    if-nez p2, :cond_0

    invoke-virtual {p0, v1}, Lcom/meicam/sdk/NvsVideoClip;->setImageMotionMode(I)V

    goto :goto_0

    :cond_0
    invoke-virtual {p0, v0}, Lcom/meicam/sdk/NvsVideoClip;->setImageMotionMode(I)V

    goto :goto_0

    :cond_1
    new-instance p2, Landroid/graphics/RectF;

    invoke-direct {p2}, Landroid/graphics/RectF;-><init>()V

    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2}, Landroid/graphics/RectF;-><init>()V

    invoke-static {p2, v2, p3, p1}, Lcom/meicam/themehelper/Utils;->setImageROI(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/RectF;F)V

    invoke-virtual {p0, p2, v2}, Lcom/meicam/sdk/NvsVideoClip;->setImageMotionROI(Landroid/graphics/RectF;Landroid/graphics/RectF;)V

    :goto_0
    const/high16 p2, 0x3f400000    # 0.75f

    cmpg-float p1, p1, p2

    if-gtz p1, :cond_2

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    :goto_1
    invoke-static {p0, v0}, Lcom/meicam/themehelper/Utils;->setClipMask(Lcom/meicam/sdk/NvsVideoClip;Z)V

    return-void
.end method

.method public static setImageROI(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/RectF;F)V
    .locals 5

    const/high16 v0, 0x3f800000    # 1.0f

    cmpg-float v0, p3, v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-gez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz p2, :cond_2

    const/4 v3, 0x4

    new-array v3, v3, [F

    iget v4, p2, Landroid/graphics/RectF;->left:F

    aput v4, v3, v1

    iget v1, p2, Landroid/graphics/RectF;->top:F

    aput v1, v3, v2

    const/4 v1, 0x2

    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    move-result v2

    aput v2, v3, v1

    const/4 v1, 0x3

    invoke-virtual {p2}, Landroid/graphics/RectF;->height()F

    move-result p2

    aput p2, v3, v1

    if-eqz v0, :cond_1

    invoke-static {p0, p1, p3, v3}, Lcom/meicam/themehelper/Utils;->setPortraitFaceImgMotion(Landroid/graphics/RectF;Landroid/graphics/RectF;F[F)V

    goto :goto_1

    :cond_1
    invoke-static {p0, p1, p3, v3}, Lcom/meicam/themehelper/Utils;->setLandscapeFaceImgMotion(Landroid/graphics/RectF;Landroid/graphics/RectF;F[F)V

    goto :goto_1

    :cond_2
    if-eqz v0, :cond_3

    invoke-static {p0, p1, p3}, Lcom/meicam/themehelper/Utils;->setPortraitImgMotion(Landroid/graphics/RectF;Landroid/graphics/RectF;F)V

    goto :goto_1

    :cond_3
    invoke-static {p0, p1, p3}, Lcom/meicam/themehelper/Utils;->setLandscapeImgMotion(Landroid/graphics/RectF;Landroid/graphics/RectF;F)V

    :goto_1
    return-void
.end method

.method private static setLandscapeFaceImgMotion(Landroid/graphics/RectF;Landroid/graphics/RectF;F[F)V
    .locals 2

    const/4 v0, 0x2

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/meicam/themehelper/Utils;->getMotionIdx(II)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-static {p1, p0, p3, p2}, Lcom/meicam/themehelper/Utils;->leftToRight(Landroid/graphics/RectF;Landroid/graphics/RectF;[FF)V

    goto :goto_0

    :pswitch_1
    invoke-static {p0, p1, p3, p2}, Lcom/meicam/themehelper/Utils;->leftToRight(Landroid/graphics/RectF;Landroid/graphics/RectF;[FF)V

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static setLandscapeImgMotion(Landroid/graphics/RectF;Landroid/graphics/RectF;F)V
    .locals 2

    const/4 v0, 0x4

    const/4 v1, 0x3

    invoke-static {v0, v1}, Lcom/meicam/themehelper/Utils;->getMotionIdx(II)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    if-nez v0, :cond_0

    invoke-static {p0, p2}, Lcom/meicam/themehelper/Utils;->calcLandscapeLeftRec(Landroid/graphics/RectF;F)Landroid/graphics/RectF;

    invoke-static {p1, p2}, Lcom/meicam/themehelper/Utils;->calcLandscapeRightRec(Landroid/graphics/RectF;F)Landroid/graphics/RectF;

    goto :goto_0

    :pswitch_0
    invoke-static {p1, p0, p2}, Lcom/meicam/themehelper/Utils;->setZoomIn(Landroid/graphics/RectF;Landroid/graphics/RectF;F)V

    goto :goto_0

    :pswitch_1
    invoke-static {p0, p1, p2}, Lcom/meicam/themehelper/Utils;->setZoomIn(Landroid/graphics/RectF;Landroid/graphics/RectF;F)V

    goto :goto_0

    :cond_0
    invoke-static {p1, p2}, Lcom/meicam/themehelper/Utils;->calcLandscapeLeftRec(Landroid/graphics/RectF;F)Landroid/graphics/RectF;

    invoke-static {p0, p2}, Lcom/meicam/themehelper/Utils;->calcLandscapeRightRec(Landroid/graphics/RectF;F)Landroid/graphics/RectF;

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static setPortraitFaceImgMotion(Landroid/graphics/RectF;Landroid/graphics/RectF;F[F)V
    .locals 2

    const/4 v0, 0x2

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/meicam/themehelper/Utils;->getMotionIdx(II)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-static {p1, p0, p3, p2}, Lcom/meicam/themehelper/Utils;->upToBottom(Landroid/graphics/RectF;Landroid/graphics/RectF;[FF)V

    goto :goto_0

    :pswitch_1
    invoke-static {p0, p1, p3, p2}, Lcom/meicam/themehelper/Utils;->upToBottom(Landroid/graphics/RectF;Landroid/graphics/RectF;[FF)V

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static setPortraitImgMotion(Landroid/graphics/RectF;Landroid/graphics/RectF;F)V
    .locals 3

    const v0, 0x3ecccccd    # 0.4f

    cmpg-float v0, p2, v0

    const/4 v1, 0x4

    if-gtz v0, :cond_0

    const/4 v0, 0x4

    goto :goto_0

    :cond_0
    const/4 v0, 0x6

    :goto_0
    const/4 v2, 0x2

    invoke-static {v0, v2}, Lcom/meicam/themehelper/Utils;->getMotionIdx(II)I

    move-result v0

    if-ne v0, v1, :cond_1

    invoke-static {p0, p1, p2}, Lcom/meicam/themehelper/Utils;->setPortraitZoomin(Landroid/graphics/RectF;Landroid/graphics/RectF;F)V

    goto :goto_1

    :cond_1
    const/4 v1, 0x5

    if-ne v0, v1, :cond_2

    invoke-static {p1, p0, p2}, Lcom/meicam/themehelper/Utils;->setPortraitZoomin(Landroid/graphics/RectF;Landroid/graphics/RectF;F)V

    goto :goto_1

    :cond_2
    packed-switch v0, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    invoke-static {p1, p0, p2}, Lcom/meicam/themehelper/Utils;->normalLbToRt(Landroid/graphics/RectF;Landroid/graphics/RectF;F)V

    goto :goto_1

    :pswitch_1
    invoke-static {p0, p1, p2}, Lcom/meicam/themehelper/Utils;->normalLbToRt(Landroid/graphics/RectF;Landroid/graphics/RectF;F)V

    goto :goto_1

    :pswitch_2
    invoke-static {p1, p0, p2}, Lcom/meicam/themehelper/Utils;->normalLtToRb(Landroid/graphics/RectF;Landroid/graphics/RectF;F)V

    goto :goto_1

    :pswitch_3
    invoke-static {p0, p1, p2}, Lcom/meicam/themehelper/Utils;->normalLtToRb(Landroid/graphics/RectF;Landroid/graphics/RectF;F)V

    :goto_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static setPortraitZoomin(Landroid/graphics/RectF;Landroid/graphics/RectF;F)V
    .locals 6

    sget v0, Lcom/meicam/themehelper/NvsThemeHelper;->m_timelineRatio:F

    cmpl-float v0, p2, v0

    const v1, -0x40a147ae    # -0.87f

    const v2, 0x3f5eb852    # 0.87f

    const/high16 v3, -0x40800000    # -1.0f

    const/high16 v4, 0x3f800000    # 1.0f

    const/high16 v5, 0x40000000    # 2.0f

    if-ltz v0, :cond_0

    iput v4, p0, Landroid/graphics/RectF;->top:F

    iput v3, p0, Landroid/graphics/RectF;->bottom:F

    iget v0, p0, Landroid/graphics/RectF;->top:F

    iget v3, p0, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v0, v3

    neg-float v0, v0

    div-float/2addr v0, p2

    sget v3, Lcom/meicam/themehelper/NvsThemeHelper;->m_timelineRatio:F

    mul-float v0, v0, v3

    div-float/2addr v0, v5

    iput v0, p0, Landroid/graphics/RectF;->left:F

    iget v0, p0, Landroid/graphics/RectF;->left:F

    neg-float v0, v0

    iput v0, p0, Landroid/graphics/RectF;->right:F

    iput v2, p1, Landroid/graphics/RectF;->top:F

    iput v1, p1, Landroid/graphics/RectF;->bottom:F

    iget p0, p1, Landroid/graphics/RectF;->top:F

    iget v0, p1, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr p0, v0

    neg-float p0, p0

    div-float/2addr p0, p2

    sget p2, Lcom/meicam/themehelper/NvsThemeHelper;->m_timelineRatio:F

    mul-float p0, p0, p2

    div-float/2addr p0, v5

    iput p0, p1, Landroid/graphics/RectF;->left:F

    iget p0, p1, Landroid/graphics/RectF;->left:F

    neg-float p0, p0

    iput p0, p1, Landroid/graphics/RectF;->right:F

    goto :goto_0

    :cond_0
    iput v3, p0, Landroid/graphics/RectF;->left:F

    iput v4, p0, Landroid/graphics/RectF;->right:F

    iget v0, p0, Landroid/graphics/RectF;->right:F

    iget v3, p0, Landroid/graphics/RectF;->left:F

    sub-float/2addr v0, v3

    mul-float v0, v0, p2

    sget v3, Lcom/meicam/themehelper/NvsThemeHelper;->m_timelineRatio:F

    div-float/2addr v0, v3

    div-float/2addr v0, v5

    iput v0, p0, Landroid/graphics/RectF;->top:F

    iget v0, p0, Landroid/graphics/RectF;->top:F

    neg-float v0, v0

    iput v0, p0, Landroid/graphics/RectF;->bottom:F

    iput v1, p1, Landroid/graphics/RectF;->left:F

    iput v2, p1, Landroid/graphics/RectF;->right:F

    iget p0, p1, Landroid/graphics/RectF;->right:F

    iget v0, p1, Landroid/graphics/RectF;->left:F

    sub-float/2addr p0, v0

    mul-float p0, p0, p2

    sget p2, Lcom/meicam/themehelper/NvsThemeHelper;->m_timelineRatio:F

    div-float/2addr p0, p2

    div-float/2addr p0, v5

    iput p0, p1, Landroid/graphics/RectF;->top:F

    iget p0, p1, Landroid/graphics/RectF;->top:F

    neg-float p0, p0

    iput p0, p1, Landroid/graphics/RectF;->bottom:F

    :goto_0
    return-void
.end method

.method private static setZoomIn(Landroid/graphics/RectF;Landroid/graphics/RectF;F)V
    .locals 2

    const v0, 0x3fb33333    # 1.4f

    iput v0, p0, Landroid/graphics/RectF;->top:F

    const v0, -0x404ccccd    # -1.4f

    iput v0, p0, Landroid/graphics/RectF;->bottom:F

    iget v0, p0, Landroid/graphics/RectF;->top:F

    iget v1, p0, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v0, v1

    neg-float v0, v0

    sget v1, Lcom/meicam/themehelper/NvsThemeHelper;->m_timelineRatio:F

    mul-float v0, v0, v1

    div-float/2addr v0, p2

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    iput v0, p0, Landroid/graphics/RectF;->left:F

    iget v0, p0, Landroid/graphics/RectF;->left:F

    neg-float v0, v0

    iput v0, p0, Landroid/graphics/RectF;->right:F

    const p0, 0x3f99999a    # 1.2f

    iput p0, p1, Landroid/graphics/RectF;->top:F

    const p0, -0x40666666    # -1.2f

    iput p0, p1, Landroid/graphics/RectF;->bottom:F

    iget p0, p1, Landroid/graphics/RectF;->top:F

    iget v0, p1, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr p0, v0

    neg-float p0, p0

    div-float/2addr p0, p2

    sget p2, Lcom/meicam/themehelper/NvsThemeHelper;->m_timelineRatio:F

    mul-float p0, p0, p2

    div-float/2addr p0, v1

    iput p0, p1, Landroid/graphics/RectF;->left:F

    iget p0, p1, Landroid/graphics/RectF;->left:F

    neg-float p0, p0

    iput p0, p1, Landroid/graphics/RectF;->right:F

    return-void
.end method

.method private static upToBottom(Landroid/graphics/RectF;Landroid/graphics/RectF;[FF)V
    .locals 4

    const/4 v0, 0x0

    aget v1, p2, v0

    const v2, 0x3eb33333    # 0.35f

    sub-float/2addr v1, v2

    const/high16 v3, -0x40800000    # -1.0f

    invoke-static {v3, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    iput v1, p0, Landroid/graphics/RectF;->left:F

    aget v0, p2, v0

    const/4 v1, 0x2

    aget v1, p2, v1

    add-float/2addr v0, v1

    add-float/2addr v0, v2

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v1, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    iput v0, p0, Landroid/graphics/RectF;->right:F

    const/4 v0, 0x1

    aget p2, p2, v0

    const/high16 v0, 0x3f000000    # 0.5f

    add-float/2addr p2, v0

    invoke-static {v1, p2}, Ljava/lang/Math;->min(FF)F

    move-result p2

    iput p2, p0, Landroid/graphics/RectF;->top:F

    iget p2, p0, Landroid/graphics/RectF;->top:F

    iget v0, p0, Landroid/graphics/RectF;->right:F

    iget v2, p0, Landroid/graphics/RectF;->left:F

    sub-float/2addr v0, v2

    sget v2, Lcom/meicam/themehelper/NvsThemeHelper;->m_timelineRatio:F

    div-float/2addr v0, v2

    mul-float v0, v0, p3

    sub-float/2addr p2, v0

    iput p2, p0, Landroid/graphics/RectF;->bottom:F

    iget p2, p0, Landroid/graphics/RectF;->bottom:F

    cmpg-float p2, p2, v3

    if-gez p2, :cond_1

    iget p2, p0, Landroid/graphics/RectF;->bottom:F

    sub-float p2, v3, p2

    iput v3, p0, Landroid/graphics/RectF;->bottom:F

    iget v0, p0, Landroid/graphics/RectF;->top:F

    add-float/2addr v0, p2

    iput v0, p0, Landroid/graphics/RectF;->top:F

    iget p2, p0, Landroid/graphics/RectF;->top:F

    cmpl-float p2, p2, v1

    if-lez p2, :cond_0

    invoke-static {p0, p1, p3}, Lcom/meicam/themehelper/Utils;->setPortraitZoomin(Landroid/graphics/RectF;Landroid/graphics/RectF;F)V

    return-void

    :cond_0
    iget p2, p0, Landroid/graphics/RectF;->top:F

    sub-float/2addr v1, p2

    iget p2, p0, Landroid/graphics/RectF;->top:F

    add-float/2addr p2, v1

    iput p2, p1, Landroid/graphics/RectF;->top:F

    iget p2, p0, Landroid/graphics/RectF;->bottom:F

    add-float/2addr p2, v1

    iput p2, p1, Landroid/graphics/RectF;->bottom:F

    goto :goto_0

    :cond_1
    iget p2, p0, Landroid/graphics/RectF;->bottom:F

    const p3, 0x3e051eb8    # 0.13f

    sub-float/2addr p2, p3

    iput p2, p1, Landroid/graphics/RectF;->bottom:F

    iget p2, p0, Landroid/graphics/RectF;->top:F

    sub-float/2addr p2, p3

    iput p2, p1, Landroid/graphics/RectF;->top:F

    iget p2, p1, Landroid/graphics/RectF;->bottom:F

    cmpg-float p2, p2, v3

    if-gez p2, :cond_2

    iget p2, p1, Landroid/graphics/RectF;->bottom:F

    sub-float p2, v3, p2

    iput v3, p1, Landroid/graphics/RectF;->bottom:F

    iget p3, p1, Landroid/graphics/RectF;->top:F

    add-float/2addr p3, p2

    iput p3, p1, Landroid/graphics/RectF;->top:F

    :cond_2
    :goto_0
    iget p2, p0, Landroid/graphics/RectF;->left:F

    iput p2, p1, Landroid/graphics/RectF;->left:F

    iget p0, p0, Landroid/graphics/RectF;->right:F

    iput p0, p1, Landroid/graphics/RectF;->right:F

    return-void
.end method

.method private static upToBottomByFx(Landroid/graphics/RectF;Landroid/graphics/RectF;[FF)V
    .locals 4

    const/4 v0, 0x0

    aget v0, p2, v0

    const/high16 v1, 0x40000000    # 2.0f

    mul-float v0, v0, v1

    const/4 v2, 0x2

    aget p2, p2, v2

    add-float/2addr v0, p2

    div-float/2addr v0, v1

    const/high16 p2, 0x3f800000    # 1.0f

    iput p2, p0, Landroid/graphics/RectF;->top:F

    const v2, -0x40b33333    # -0.8f

    iput v2, p0, Landroid/graphics/RectF;->bottom:F

    iget v2, p0, Landroid/graphics/RectF;->top:F

    iget v3, p0, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v2, v3

    neg-float v2, v2

    sget v3, Lcom/meicam/themehelper/NvsThemeHelper;->m_timelineRatio:F

    mul-float v2, v2, v3

    div-float/2addr v2, p3

    div-float/2addr v2, v1

    add-float/2addr v2, v0

    iput v2, p0, Landroid/graphics/RectF;->left:F

    iget v2, p0, Landroid/graphics/RectF;->top:F

    iget v3, p0, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v2, v3

    sget v3, Lcom/meicam/themehelper/NvsThemeHelper;->m_timelineRatio:F

    mul-float v2, v2, v3

    div-float/2addr v2, p3

    div-float/2addr v2, v1

    add-float/2addr v2, v0

    iput v2, p0, Landroid/graphics/RectF;->right:F

    iget p3, p0, Landroid/graphics/RectF;->left:F

    const/high16 v0, -0x40800000    # -1.0f

    cmpg-float p3, p3, v0

    if-gez p3, :cond_0

    iget p3, p0, Landroid/graphics/RectF;->right:F

    iget v1, p0, Landroid/graphics/RectF;->left:F

    sub-float v1, v0, v1

    add-float/2addr p3, v1

    iput p3, p0, Landroid/graphics/RectF;->right:F

    iput v0, p0, Landroid/graphics/RectF;->left:F

    :cond_0
    iget p3, p0, Landroid/graphics/RectF;->right:F

    cmpl-float p3, p3, p2

    if-lez p3, :cond_1

    iget p3, p0, Landroid/graphics/RectF;->left:F

    iget v1, p0, Landroid/graphics/RectF;->right:F

    sub-float/2addr v1, p2

    sub-float/2addr p3, v1

    iput p3, p0, Landroid/graphics/RectF;->left:F

    iput p2, p0, Landroid/graphics/RectF;->right:F

    :cond_1
    iget p2, p0, Landroid/graphics/RectF;->left:F

    iput p2, p1, Landroid/graphics/RectF;->left:F

    iget p0, p0, Landroid/graphics/RectF;->right:F

    iput p0, p1, Landroid/graphics/RectF;->right:F

    const p0, 0x3f4ccccd    # 0.8f

    iput p0, p1, Landroid/graphics/RectF;->top:F

    iput v0, p1, Landroid/graphics/RectF;->bottom:F

    return-void
.end method
