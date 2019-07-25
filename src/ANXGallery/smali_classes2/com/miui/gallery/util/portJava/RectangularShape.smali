.class public abstract Lcom/miui/gallery/util/portJava/RectangularShape;
.super Ljava/lang/Object;
.source "RectangularShape.java"

# interfaces
.implements Ljava/lang/Cloneable;


# direct methods
.method protected constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 1

    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    new-instance v0, Ljava/lang/InternalError;

    invoke-direct {v0}, Ljava/lang/InternalError;-><init>()V

    throw v0
.end method

.method public getBounds()Lcom/miui/gallery/util/portJava/Rectangle;
    .locals 12

    invoke-virtual {p0}, Lcom/miui/gallery/util/portJava/RectangularShape;->getWidth()D

    move-result-wide v0

    invoke-virtual {p0}, Lcom/miui/gallery/util/portJava/RectangularShape;->getHeight()D

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmpg-double v6, v0, v4

    if-ltz v6, :cond_1

    cmpg-double v6, v2, v4

    if-gez v6, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/util/portJava/RectangularShape;->getX()D

    move-result-wide v4

    invoke-virtual {p0}, Lcom/miui/gallery/util/portJava/RectangularShape;->getY()D

    move-result-wide v6

    invoke-static {v4, v5}, Ljava/lang/Math;->floor(D)D

    move-result-wide v8

    invoke-static {v6, v7}, Ljava/lang/Math;->floor(D)D

    move-result-wide v10

    add-double/2addr v4, v0

    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    add-double/2addr v6, v2

    invoke-static {v6, v7}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    new-instance v4, Lcom/miui/gallery/util/portJava/Rectangle;

    double-to-int v5, v8

    double-to-int v6, v10

    sub-double/2addr v0, v8

    double-to-int v0, v0

    sub-double/2addr v2, v10

    double-to-int v1, v2

    invoke-direct {v4, v5, v6, v0, v1}, Lcom/miui/gallery/util/portJava/Rectangle;-><init>(IIII)V

    return-object v4

    :cond_1
    :goto_0
    new-instance v0, Lcom/miui/gallery/util/portJava/Rectangle;

    invoke-direct {v0}, Lcom/miui/gallery/util/portJava/Rectangle;-><init>()V

    return-object v0
.end method

.method public abstract getHeight()D
.end method

.method public abstract getWidth()D
.end method

.method public abstract getX()D
.end method

.method public abstract getY()D
.end method
