.class public abstract Lcom/miui/gallery/util/portJava/Rectangle2D;
.super Lcom/miui/gallery/util/portJava/RectangularShape;
.source "Rectangle2D.java"


# direct methods
.method protected constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/util/portJava/RectangularShape;-><init>()V

    return-void
.end method


# virtual methods
.method public contains(DD)Z
    .locals 6

    invoke-virtual {p0}, Lcom/miui/gallery/util/portJava/Rectangle2D;->getX()D

    move-result-wide v0

    invoke-virtual {p0}, Lcom/miui/gallery/util/portJava/Rectangle2D;->getY()D

    move-result-wide v2

    cmpl-double v4, p1, v0

    if-ltz v4, :cond_0

    cmpl-double v4, p3, v2

    if-ltz v4, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/util/portJava/Rectangle2D;->getWidth()D

    move-result-wide v4

    add-double/2addr v0, v4

    cmpg-double v4, p1, v0

    if-gez v4, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/util/portJava/Rectangle2D;->getHeight()D

    move-result-wide p1

    add-double/2addr v2, p1

    cmpg-double p1, p3, v2

    if-gez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/miui/gallery/util/portJava/Rectangle2D;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    check-cast p1, Lcom/miui/gallery/util/portJava/Rectangle2D;

    invoke-virtual {p0}, Lcom/miui/gallery/util/portJava/Rectangle2D;->getX()D

    move-result-wide v3

    invoke-virtual {p1}, Lcom/miui/gallery/util/portJava/Rectangle2D;->getX()D

    move-result-wide v5

    cmpl-double v1, v3, v5

    if-nez v1, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/util/portJava/Rectangle2D;->getY()D

    move-result-wide v3

    invoke-virtual {p1}, Lcom/miui/gallery/util/portJava/Rectangle2D;->getY()D

    move-result-wide v5

    cmpl-double v1, v3, v5

    if-nez v1, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/util/portJava/Rectangle2D;->getWidth()D

    move-result-wide v3

    invoke-virtual {p1}, Lcom/miui/gallery/util/portJava/Rectangle2D;->getWidth()D

    move-result-wide v5

    cmpl-double v1, v3, v5

    if-nez v1, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/util/portJava/Rectangle2D;->getHeight()D

    move-result-wide v3

    invoke-virtual {p1}, Lcom/miui/gallery/util/portJava/Rectangle2D;->getHeight()D

    move-result-wide v5

    cmpl-double p1, v3, v5

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_2
    return v2
.end method

.method public hashCode()I
    .locals 6

    invoke-virtual {p0}, Lcom/miui/gallery/util/portJava/Rectangle2D;->getX()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v0

    invoke-virtual {p0}, Lcom/miui/gallery/util/portJava/Rectangle2D;->getY()D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v2

    const-wide/16 v4, 0x25

    mul-long v2, v2, v4

    add-long/2addr v0, v2

    invoke-virtual {p0}, Lcom/miui/gallery/util/portJava/Rectangle2D;->getWidth()D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v2

    const-wide/16 v4, 0x2b

    mul-long v2, v2, v4

    add-long/2addr v0, v2

    invoke-virtual {p0}, Lcom/miui/gallery/util/portJava/Rectangle2D;->getHeight()D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v2

    const-wide/16 v4, 0x2f

    mul-long v2, v2, v4

    add-long/2addr v0, v2

    long-to-int v2, v0

    const/16 v3, 0x20

    shr-long/2addr v0, v3

    long-to-int v0, v0

    xor-int/2addr v0, v2

    return v0
.end method
