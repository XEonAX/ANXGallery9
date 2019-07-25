.class public Lcom/miui/gallery/editor/photo/core/imports/crop/CropProvider;
.super Lcom/miui/gallery/editor/photo/core/SdkProvider;
.source "CropProvider.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/editor/photo/core/SdkProvider<",
        "Lcom/miui/gallery/editor/photo/core/common/model/CropData;",
        "Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;",
        ">;"
    }
.end annotation


# instance fields
.field private mDataList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/common/model/CropData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    sget-object v0, Lcom/miui/gallery/editor/photo/core/SdkManager;->INSTANCE:Lcom/miui/gallery/editor/photo/core/SdkManager;

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/crop/CropProvider;

    invoke-direct {v1}, Lcom/miui/gallery/editor/photo/core/imports/crop/CropProvider;-><init>()V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/SdkManager;->register(Lcom/miui/gallery/editor/photo/core/SdkProvider;)V

    return-void
.end method

.method protected constructor <init>()V
    .locals 17

    move-object/from16 v0, p0

    sget-object v1, Lcom/miui/gallery/editor/photo/core/Effect;->CROP:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-direct {v0, v1}, Lcom/miui/gallery/editor/photo/core/SdkProvider;-><init>(Lcom/miui/gallery/editor/photo/core/Effect;)V

    const/16 v1, 0xa

    new-array v1, v1, [Lcom/miui/gallery/editor/photo/core/common/model/CropData;

    new-instance v9, Lcom/miui/gallery/editor/photo/core/common/model/CropData$AspectRatio;

    const-string v4, "free"

    const/4 v3, 0x1

    const v5, 0x7f0700c8

    const v6, 0x7f10054b

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v2, v9

    invoke-direct/range {v2 .. v8}, Lcom/miui/gallery/editor/photo/core/common/model/CropData$AspectRatio;-><init>(SLjava/lang/String;IIII)V

    const/4 v2, 0x0

    aput-object v9, v1, v2

    new-instance v2, Lcom/miui/gallery/editor/photo/core/common/model/CropData$AspectRatio;

    const-string v12, "original"

    const/4 v11, 0x1

    const v13, 0x7f0700ca

    const v14, 0x7f10054d

    const/4 v15, -0x1

    const/16 v16, -0x1

    move-object v10, v2

    invoke-direct/range {v10 .. v16}, Lcom/miui/gallery/editor/photo/core/common/model/CropData$AspectRatio;-><init>(SLjava/lang/String;IIII)V

    aput-object v2, v1, v3

    new-instance v2, Lcom/miui/gallery/editor/photo/core/common/model/CropData$AspectRatio;

    const-string v6, "screen"

    const/4 v5, 0x1

    const v7, 0x7f0700cc

    const v8, 0x7f10054f

    const/4 v9, -0x2

    const/4 v10, -0x2

    move-object v4, v2

    invoke-direct/range {v4 .. v10}, Lcom/miui/gallery/editor/photo/core/common/model/CropData$AspectRatio;-><init>(SLjava/lang/String;IIII)V

    const/4 v3, 0x2

    aput-object v2, v1, v3

    new-instance v2, Lcom/miui/gallery/editor/photo/core/common/model/CropData$AspectRatio;

    const-string v6, "1:1"

    const/4 v5, 0x2

    const v7, 0x7f0700c2

    const v8, 0x7f100545

    const/4 v9, 0x1

    const/4 v10, 0x1

    move-object v4, v2

    invoke-direct/range {v4 .. v10}, Lcom/miui/gallery/editor/photo/core/common/model/CropData$AspectRatio;-><init>(SLjava/lang/String;IIII)V

    const/4 v3, 0x3

    aput-object v2, v1, v3

    new-instance v2, Lcom/miui/gallery/editor/photo/core/common/model/CropData$AspectRatio;

    const-string v6, "3:4"

    const v7, 0x7f0700c5

    const v8, 0x7f100548

    const/4 v9, 0x3

    const/4 v10, 0x4

    move-object v4, v2

    invoke-direct/range {v4 .. v10}, Lcom/miui/gallery/editor/photo/core/common/model/CropData$AspectRatio;-><init>(SLjava/lang/String;IIII)V

    const/4 v3, 0x4

    aput-object v2, v1, v3

    new-instance v2, Lcom/miui/gallery/editor/photo/core/common/model/CropData$AspectRatio;

    const-string v6, "4:3"

    const v7, 0x7f0700c6

    const v8, 0x7f100549

    const/4 v9, 0x4

    const/4 v10, 0x3

    move-object v4, v2

    invoke-direct/range {v4 .. v10}, Lcom/miui/gallery/editor/photo/core/common/model/CropData$AspectRatio;-><init>(SLjava/lang/String;IIII)V

    const/4 v3, 0x5

    aput-object v2, v1, v3

    new-instance v2, Lcom/miui/gallery/editor/photo/core/common/model/CropData$AspectRatio;

    const-string v6, "16:9"

    const v7, 0x7f0700c1

    const v8, 0x7f100544

    const/16 v9, 0x10

    const/16 v10, 0x9

    move-object v4, v2

    invoke-direct/range {v4 .. v10}, Lcom/miui/gallery/editor/photo/core/common/model/CropData$AspectRatio;-><init>(SLjava/lang/String;IIII)V

    const/4 v3, 0x6

    aput-object v2, v1, v3

    new-instance v2, Lcom/miui/gallery/editor/photo/core/common/model/CropData$AspectRatio;

    const-string v6, "9:16"

    const v7, 0x7f0700c7

    const v8, 0x7f10054a

    const/16 v9, 0x9

    const/16 v10, 0x10

    move-object v4, v2

    invoke-direct/range {v4 .. v10}, Lcom/miui/gallery/editor/photo/core/common/model/CropData$AspectRatio;-><init>(SLjava/lang/String;IIII)V

    const/4 v3, 0x7

    aput-object v2, v1, v3

    new-instance v2, Lcom/miui/gallery/editor/photo/core/common/model/CropData$AspectRatio;

    const-string v6, "2:3"

    const v7, 0x7f0700c3

    const v8, 0x7f100546

    const/4 v9, 0x2

    const/4 v10, 0x3

    move-object v4, v2

    invoke-direct/range {v4 .. v10}, Lcom/miui/gallery/editor/photo/core/common/model/CropData$AspectRatio;-><init>(SLjava/lang/String;IIII)V

    const/16 v3, 0x8

    aput-object v2, v1, v3

    new-instance v2, Lcom/miui/gallery/editor/photo/core/common/model/CropData$AspectRatio;

    const-string v6, "3:2"

    const v7, 0x7f0700c4

    const v8, 0x7f100547

    const/4 v9, 0x3

    const/4 v10, 0x2

    move-object v4, v2

    invoke-direct/range {v4 .. v10}, Lcom/miui/gallery/editor/photo/core/common/model/CropData$AspectRatio;-><init>(SLjava/lang/String;IIII)V

    const/16 v3, 0x9

    aput-object v2, v1, v3

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropProvider;->mDataList:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public createEngine(Landroid/content/Context;)Lcom/miui/gallery/editor/photo/core/RenderEngine;
    .locals 0

    new-instance p1, Lcom/miui/gallery/editor/photo/core/imports/crop/CropEngine;

    invoke-direct {p1}, Lcom/miui/gallery/editor/photo/core/imports/crop/CropEngine;-><init>()V

    return-object p1
.end method

.method public list()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/common/model/CropData;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropProvider;->mDataList:Ljava/util/List;

    return-object v0
.end method

.method protected onActivityCreate()V
    .locals 0

    invoke-super {p0}, Lcom/miui/gallery/editor/photo/core/SdkProvider;->onActivityCreate()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/crop/CropProvider;->notifyInitializeFinish()V

    return-void
.end method

.method public bridge synthetic onCreateFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/crop/CropProvider;->onCreateFragment()Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;

    move-result-object v0

    return-object v0
.end method

.method public onCreateFragment()Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractCropFragment;
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;-><init>()V

    return-object v0
.end method
