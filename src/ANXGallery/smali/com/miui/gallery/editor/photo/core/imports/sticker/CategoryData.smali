.class Lcom/miui/gallery/editor/photo/core/imports/sticker/CategoryData;
.super Lcom/miui/gallery/editor/photo/core/common/model/StickerCategory;
.source "CategoryData.java"


# instance fields
.field stickerList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/common/model/StickerData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(ISLjava/lang/String;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IS",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/common/model/StickerData;",
            ">;)V"
        }
    .end annotation

    int-to-long v0, p1

    invoke-direct {p0, v0, v1, p2, p3}, Lcom/miui/gallery/editor/photo/core/common/model/StickerCategory;-><init>(JSLjava/lang/String;)V

    iput-object p4, p0, Lcom/miui/gallery/editor/photo/core/imports/sticker/CategoryData;->stickerList:Ljava/util/List;

    return-void
.end method
