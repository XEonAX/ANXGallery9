.class public Lcom/miui/gallery/collage/core/poster/CollagePositionModel;
.super Ljava/lang/Object;
.source "CollagePositionModel.java"


# instance fields
.field public ignoreEdgeMargin:Z

.field public margin:F

.field public masks:[Ljava/lang/String;

.field public position:[F

.field public radius:[F

.field public relativePath:Ljava/lang/String;

.field public size:I


# direct methods
.method public static getCollagePositionModelByImageSize([Lcom/miui/gallery/collage/core/poster/CollagePositionModel;I)Lcom/miui/gallery/collage/core/poster/CollagePositionModel;
    .locals 5

    array-length v0, p0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_2

    aget-object v3, p0, v2

    iget v4, v3, Lcom/miui/gallery/collage/core/poster/CollagePositionModel;->size:I

    if-eqz v4, :cond_1

    iget v4, v3, Lcom/miui/gallery/collage/core/poster/CollagePositionModel;->size:I

    if-ne v4, p1, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    return-object v3

    :cond_2
    aget-object p0, p0, v1

    return-object p0
.end method
