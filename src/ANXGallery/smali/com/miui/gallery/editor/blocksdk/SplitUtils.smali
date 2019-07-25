.class public Lcom/miui/gallery/editor/blocksdk/SplitUtils;
.super Ljava/lang/Object;
.source "SplitUtils.java"


# direct methods
.method public static split(II)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/blocksdk/Block;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    mul-int v1, p0, p1

    const v2, 0x5b8d80

    rem-int v3, v1, v2

    const/4 v4, 0x1

    if-nez v3, :cond_0

    div-int/2addr v1, v2

    goto :goto_0

    :cond_0
    div-int/2addr v1, v2

    add-int/2addr v1, v4

    :goto_0
    div-int v2, p1, v1

    const/4 v3, 0x0

    :goto_1
    if-ge v3, v1, :cond_2

    new-instance v5, Lcom/miui/gallery/editor/blocksdk/Block;

    invoke-direct {v5}, Lcom/miui/gallery/editor/blocksdk/Block;-><init>()V

    iput p1, v5, Lcom/miui/gallery/editor/blocksdk/Block;->totalHeight:I

    iput p0, v5, Lcom/miui/gallery/editor/blocksdk/Block;->mWidth:I

    add-int/lit8 v6, v1, -0x1

    if-ne v3, v6, :cond_1

    rem-int v6, p1, v1

    add-int/2addr v6, v2

    iput v6, v5, Lcom/miui/gallery/editor/blocksdk/Block;->mHeight:I

    goto :goto_2

    :cond_1
    iput v2, v5, Lcom/miui/gallery/editor/blocksdk/Block;->mHeight:I

    :goto_2
    iput v4, v5, Lcom/miui/gallery/editor/blocksdk/Block;->mStatus:I

    mul-int v6, v3, v2

    mul-int v6, v6, p0

    iput v6, v5, Lcom/miui/gallery/editor/blocksdk/Block;->mOffset:I

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_2
    return-object v0
.end method
