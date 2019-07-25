.class Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleProvider;
.super Lcom/miui/gallery/editor/photo/core/SdkProvider;
.source "DoodleProvider.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/editor/photo/core/SdkProvider<",
        "Lcom/miui/gallery/editor/photo/core/common/model/DoodleData;",
        "Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractDoodleFragment;",
        ">;"
    }
.end annotation


# instance fields
.field private mDoodleDataList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/common/model/DoodleData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    sget-object v0, Lcom/miui/gallery/editor/photo/core/SdkManager;->INSTANCE:Lcom/miui/gallery/editor/photo/core/SdkManager;

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleProvider;

    invoke-direct {v1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleProvider;-><init>()V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/SdkManager;->register(Lcom/miui/gallery/editor/photo/core/SdkProvider;)V

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    sget-object v0, Lcom/miui/gallery/editor/photo/core/Effect;->DOODLE:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/core/SdkProvider;-><init>(Lcom/miui/gallery/editor/photo/core/Effect;)V

    return-void
.end method

.method private initialize()V
    .locals 1

    invoke-static {}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleManager;->getDoodleData()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleProvider;->mDoodleDataList:Ljava/util/List;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleProvider;->notifyInitializeFinish()V

    return-void
.end method


# virtual methods
.method public createEngine(Landroid/content/Context;)Lcom/miui/gallery/editor/photo/core/RenderEngine;
    .locals 0

    new-instance p1, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEngine;

    invoke-direct {p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleEngine;-><init>()V

    return-object p1
.end method

.method public list()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/common/model/DoodleData;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleProvider;->mDoodleDataList:Ljava/util/List;

    return-object v0
.end method

.method protected onActivityCreate()V
    .locals 0

    invoke-super {p0}, Lcom/miui/gallery/editor/photo/core/SdkProvider;->onActivityCreate()V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleProvider;->initialize()V

    return-void
.end method

.method protected bridge synthetic onCreateFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleProvider;->onCreateFragment()Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractDoodleFragment;

    move-result-object v0

    return-object v0
.end method

.method protected onCreateFragment()Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractDoodleFragment;
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/DoodleFragment;-><init>()V

    return-object v0
.end method
