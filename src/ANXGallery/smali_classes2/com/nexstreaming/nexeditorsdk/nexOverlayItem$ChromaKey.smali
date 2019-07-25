.class public Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;
.super Ljava/lang/Object;
.source "nexOverlayItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nexstreaming/nexeditorsdk/nexOverlayItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ChromaKey"
.end annotation


# static fields
.field private static final CHROMA_DEF_BLEND_X0:F = 0.25f

.field private static final CHROMA_DEF_BLEND_X1:F = 0.75f

.field private static final CHROMA_DEF_BLEND_Y0:F = 0.25f

.field private static final CHROMA_DEF_BLEND_Y1:F = 0.75f

.field private static final CHROMA_DEF_CLIP_BG:F = 0.5f

.field private static final CHROMA_DEF_CLIP_FG:F = 0.72f

.field private static final CHROMA_DEF_COLOR:I = -0xff0100

.field private static final CHROMA_UNSET_COLOR:I


# instance fields
.field private m_chromaKeyBlend_x0:F

.field private m_chromaKeyBlend_x1:F

.field private m_chromaKeyBlend_y0:F

.field private m_chromaKeyBlend_y1:F

.field private m_chromaKeyClipBG:F

.field private m_chromaKeyClipFG:F

.field private m_chromaKeyColor:I

.field private m_chromaKeyDivisions:[F

.field private m_chromaKeyEnabled:Z

.field private m_chromaKeyMaskEnabled:Z

.field private m_chromaKeyStrengths:[F


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x4

    new-array v1, v0, [F

    fill-array-data v1, :array_0

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->m_chromaKeyDivisions:[F

    new-array v0, v0, [F

    fill-array-data v0, :array_1

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->m_chromaKeyStrengths:[F

    const/4 v0, 0x0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->m_chromaKeyColor:I

    const v0, 0x3f3851ec    # 0.72f

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->m_chromaKeyClipFG:F

    const/high16 v0, 0x3f000000    # 0.5f

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->m_chromaKeyClipBG:F

    const/high16 v0, 0x3e800000    # 0.25f

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->m_chromaKeyBlend_x0:F

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->m_chromaKeyBlend_y0:F

    const/high16 v0, 0x3f400000    # 0.75f

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->m_chromaKeyBlend_x1:F

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->m_chromaKeyBlend_y1:F

    return-void

    nop

    :array_0
    .array-data 4
        0x3d4ccccd    # 0.05f
        0x3e99999a    # 0.3f
        0x3f000000    # 0.5f
        0x3f266666    # 0.65f
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x3e800000    # 0.25f
        0x3f400000    # 0.75f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method static synthetic access$200(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;)I
    .locals 0

    iget p0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->m_chromaKeyColor:I

    return p0
.end method

.method static synthetic access$300(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;)F
    .locals 0

    iget p0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->m_chromaKeyClipFG:F

    return p0
.end method

.method static synthetic access$400(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;)F
    .locals 0

    iget p0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->m_chromaKeyClipBG:F

    return p0
.end method

.method static synthetic access$500(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;)F
    .locals 0

    iget p0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->m_chromaKeyBlend_x0:F

    return p0
.end method

.method static synthetic access$600(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;)F
    .locals 0

    iget p0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->m_chromaKeyBlend_y0:F

    return p0
.end method

.method static synthetic access$700(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;)F
    .locals 0

    iget p0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->m_chromaKeyBlend_x1:F

    return p0
.end method

.method static synthetic access$800(Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;)F
    .locals 0

    iget p0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->m_chromaKeyBlend_y1:F

    return p0
.end method

.method public static getChromaKeyRecommendedColors(Landroid/graphics/Bitmap;)[I
    .locals 13

    const/4 v0, 0x0

    if-eqz p0, :cond_a

    const/4 v1, 0x3

    new-array v1, v1, [F

    const/16 v2, 0x168

    new-array v3, v2, [I

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    mul-int v4, v4, v5

    new-array v4, v4, [I

    const/4 v7, 0x0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v8

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v11

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v12

    move-object v5, p0

    move-object v6, v4

    invoke-virtual/range {v5 .. v12}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    const/4 p0, 0x0

    :goto_0
    array-length v5, v4

    const/4 v6, 0x2

    const/4 v7, 0x1

    if-ge p0, v5, :cond_2

    aget v5, v4, p0

    invoke-static {v5, v1}, Landroid/graphics/Color;->colorToHSV(I[F)V

    aget v5, v1, v7

    const v8, 0x3e99999a    # 0.3f

    cmpg-float v5, v5, v8

    if-ltz v5, :cond_1

    aget v5, v1, v6

    const v6, 0x3e4ccccd    # 0.2f

    cmpg-float v5, v5, v6

    if-gez v5, :cond_0

    goto :goto_1

    :cond_0
    aget v5, v1, v0

    const/high16 v6, 0x43b40000    # 360.0f

    div-float/2addr v5, v6

    mul-float v5, v5, v6

    float-to-int v5, v5

    rem-int/2addr v5, v2

    aget v6, v3, v5

    add-int/2addr v6, v7

    aput v6, v3, v5

    :cond_1
    :goto_1
    add-int/lit8 p0, p0, 0x1

    goto :goto_0

    :cond_2
    const/4 p0, 0x0

    :goto_2
    array-length v4, v3

    if-ge p0, v4, :cond_3

    add-int/lit8 p0, p0, 0x1

    goto :goto_2

    :cond_3
    const/16 p0, 0xe

    new-array p0, p0, [I

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_3
    array-length v8, p0

    if-ge v4, v8, :cond_8

    const/4 v8, -0x1

    const/4 v9, 0x0

    const/4 v10, -0x1

    const/4 v11, -0x1

    :goto_4
    if-ge v9, v2, :cond_5

    aget v12, v3, v9

    if-le v12, v10, :cond_4

    aget v10, v3, v9

    move v11, v9

    :cond_4
    add-int/lit8 v9, v9, 0x1

    goto :goto_4

    :cond_5
    if-ltz v11, :cond_8

    const/4 v9, 0x5

    if-ge v10, v9, :cond_6

    goto :goto_6

    :cond_6
    mul-int/lit16 v9, v11, 0x168

    div-int/2addr v9, v2

    int-to-float v9, v9

    aput v9, v1, v0

    const/high16 v9, 0x3f800000    # 1.0f

    aput v9, v1, v7

    aput v9, v1, v6

    invoke-static {v1}, Landroid/graphics/Color;->HSVToColor([F)I

    move-result v9

    aput v9, p0, v5

    add-int/lit8 v5, v5, 0x1

    add-int/lit8 v9, v11, -0x3

    :goto_5
    add-int/lit8 v10, v11, 0x3

    if-ge v9, v10, :cond_7

    add-int/lit16 v10, v9, 0x168

    rem-int/2addr v10, v2

    aput v8, v3, v10

    add-int/lit8 v9, v9, 0x1

    goto :goto_5

    :cond_7
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    :cond_8
    :goto_6
    array-length v1, p0

    if-ge v5, v1, :cond_9

    new-array v1, v5, [I

    invoke-static {p0, v0, v1, v0, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object p0, v1

    :cond_9
    return-object p0

    :cond_a
    new-array p0, v0, [I

    return-object p0
.end method


# virtual methods
.method public getChromaKeyBGClip()F
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->m_chromaKeyClipBG:F

    return v0
.end method

.method public getChromaKeyBlend([F)V
    .locals 2

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->m_chromaKeyBlend_x0:F

    const/4 v1, 0x0

    aput v0, p1, v1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->m_chromaKeyBlend_y0:F

    const/4 v1, 0x1

    aput v0, p1, v1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->m_chromaKeyBlend_x1:F

    const/4 v1, 0x2

    aput v0, p1, v1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->m_chromaKeyBlend_y1:F

    const/4 v1, 0x3

    aput v0, p1, v1

    return-void
.end method

.method public getChromaKeyColor()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->m_chromaKeyColor:I

    return v0
.end method

.method public getChromaKeyDivisions([F)V
    .locals 3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->m_chromaKeyDivisions:[F

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->m_chromaKeyDivisions:[F

    array-length v1, v1

    const/4 v2, 0x0

    invoke-static {v0, v2, p1, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-void
.end method

.method public getChromaKeyEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->m_chromaKeyEnabled:Z

    return v0
.end method

.method public getChromaKeyFGClip()F
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->m_chromaKeyClipFG:F

    return v0
.end method

.method public getChromaKeyMaskEnabled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->m_chromaKeyMaskEnabled:Z

    return v0
.end method

.method public getChromaKeyStrengths([F)V
    .locals 3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->m_chromaKeyStrengths:[F

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->m_chromaKeyStrengths:[F

    array-length v1, v1

    const/4 v2, 0x0

    invoke-static {v0, v2, p1, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-void
.end method

.method public setChromaKeyBGClip(F)V
    .locals 0

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->m_chromaKeyClipBG:F

    return-void
.end method

.method public setChromaKeyBlend([F)V
    .locals 1

    const/4 v0, 0x0

    aget v0, p1, v0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->m_chromaKeyBlend_x0:F

    const/4 v0, 0x1

    aget v0, p1, v0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->m_chromaKeyBlend_y0:F

    const/4 v0, 0x2

    aget v0, p1, v0

    iput v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->m_chromaKeyBlend_x1:F

    const/4 v0, 0x3

    aget p1, p1, v0

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->m_chromaKeyBlend_y1:F

    return-void
.end method

.method public setChromaKeyColor(I)V
    .locals 0

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->m_chromaKeyColor:I

    return-void
.end method

.method public setChromaKeyEnabled(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->m_chromaKeyEnabled:Z

    return-void
.end method

.method public setChromaKeyFGClip(F)V
    .locals 0

    iput p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->m_chromaKeyClipFG:F

    return-void
.end method

.method public setChromaKeyMaskEnabled(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->m_chromaKeyMaskEnabled:Z

    return-void
.end method

.method public setChromaKeyStrengths([F)V
    .locals 3

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->m_chromaKeyStrengths:[F

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/nexOverlayItem$ChromaKey;->m_chromaKeyStrengths:[F

    array-length v1, v1

    const/4 v2, 0x0

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-void
.end method
