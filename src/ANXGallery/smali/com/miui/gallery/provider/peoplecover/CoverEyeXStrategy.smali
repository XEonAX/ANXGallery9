.class public Lcom/miui/gallery/provider/peoplecover/CoverEyeXStrategy;
.super Lcom/miui/gallery/provider/peoplecover/BaseStrategy;
.source "CoverEyeXStrategy.java"


# direct methods
.method public constructor <init>(I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/provider/peoplecover/BaseStrategy;-><init>(I)V

    return-void
.end method


# virtual methods
.method public isValid(Landroid/database/Cursor;)Z
    .locals 6

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    const/16 v1, 0xb

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/miui/gallery/provider/peoplecover/CoverEyeXStrategy;->isXYReversed(I)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getFloat(I)F

    move-result v1

    const/4 v3, 0x3

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getFloat(I)F

    move-result v3

    add-float/2addr v3, v1

    sub-float v4, v1, v3

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    const/4 v5, 0x5

    invoke-interface {p1, v5}, Landroid/database/Cursor;->getFloat(I)F

    move-result v5

    sub-float/2addr v5, v1

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v1

    const/4 v5, 0x7

    invoke-interface {p1, v5}, Landroid/database/Cursor;->getFloat(I)F

    move-result p1

    sub-float/2addr p1, v3

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    goto :goto_0

    :cond_1
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getFloat(I)F

    move-result v1

    const/4 v3, 0x2

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getFloat(I)F

    move-result v3

    add-float/2addr v3, v1

    sub-float v4, v1, v3

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    const/4 v5, 0x4

    invoke-interface {p1, v5}, Landroid/database/Cursor;->getFloat(I)F

    move-result v5

    sub-float/2addr v5, v1

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v1

    const/4 v5, 0x6

    invoke-interface {p1, v5}, Landroid/database/Cursor;->getFloat(I)F

    move-result p1

    sub-float/2addr p1, v3

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    :goto_0
    sub-float/2addr v1, p1

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    const v1, 0x3d4ccccd    # 0.05f

    mul-float v4, v4, v1

    cmpg-float p1, p1, v4

    if-gez p1, :cond_2

    const/4 v0, 0x1

    :cond_2
    return v0
.end method
