.class final Lcom/miui/gallery/editor/photo/core/imports/filter/FilterProvider$2;
.super Lcom/miui/gallery/editor/photo/core/imports/filter/FilterProvider;
.source "FilterProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/filter/FilterProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/editor/photo/core/imports/filter/FilterProvider<",
        "Lcom/miui/gallery/editor/photo/core/common/model/AdjustData;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/core/Effect;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterProvider;-><init>(Lcom/miui/gallery/editor/photo/core/Effect;)V

    return-void
.end method


# virtual methods
.method public list()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+",
            "Lcom/miui/gallery/editor/photo/core/common/model/AdjustData;",
            ">;"
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterManager;->getAdjustData()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic onCreateFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterProvider;->onCreateFragment()Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;

    move-result-object v0

    return-object v0
.end method
