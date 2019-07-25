.class public Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleManager;
.super Ljava/lang/Object;
.source "DoodleManager.java"


# direct methods
.method public static getDefaultScreenDoodleData()Lcom/miui/gallery/editor/photo/core/common/model/DoodleData;
    .locals 4

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->SCREEN_PATH:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleConfig;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->name()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {v1, v3, v2, v0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleConfig;-><init>(SLjava/lang/String;Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;)V

    return-object v1
.end method

.method public static getDoodleData()Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/common/model/DoodleData;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->values()[Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v2, :cond_1

    aget-object v5, v1, v4

    invoke-virtual {v5}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->isScreenData()Z

    move-result v6

    if-eqz v6, :cond_0

    goto :goto_1

    :cond_0
    new-instance v6, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleConfig;

    invoke-virtual {v5}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->name()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v3, v7, v5}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleConfig;-><init>(SLjava/lang/String;Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;)V

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public static getScreenDoodleData()Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/common/model/DoodleData;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->values()[Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v2, :cond_1

    aget-object v5, v1, v4

    invoke-virtual {v5}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->isScreenData()Z

    move-result v6

    if-nez v6, :cond_0

    goto :goto_1

    :cond_0
    new-instance v6, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleConfig;

    invoke-virtual {v5}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->name()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v3, v7, v5}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleConfig;-><init>(SLjava/lang/String;Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;)V

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method
