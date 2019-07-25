.class public Lcom/miui/gallery/ui/AlbumDetailScreenshotGridItem;
.super Lcom/miui/gallery/ui/AlbumDetailGridItem;
.source "AlbumDetailScreenshotGridItem.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/AlbumDetailGridItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method protected isSquareItem()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method protected onMeasure(II)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/BaseConfig$ScreenConfig;->getRealScreenHeight()I

    move-result p2

    invoke-static {}, Lcom/miui/gallery/BaseConfig$ScreenConfig;->getRealScreenWidth()I

    move-result v0

    invoke-static {p2, v0}, Ljava/lang/Math;->max(II)I

    move-result p2

    invoke-static {}, Lcom/miui/gallery/BaseConfig$ScreenConfig;->getRealScreenHeight()I

    move-result v0

    invoke-static {}, Lcom/miui/gallery/BaseConfig$ScreenConfig;->getRealScreenWidth()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    mul-int p2, p2, v1

    div-int/2addr p2, v0

    const/high16 v0, 0x40000000    # 2.0f

    invoke-static {p2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    invoke-super {p0, p1, v0}, Lcom/miui/gallery/ui/AlbumDetailGridItem;->onMeasure(II)V

    const-string p1, "AlbumDetailScreenshotGridItem"

    const-string v0, "onMeasure w: %d, h: %d"

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-static {p1, v0, v1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method
