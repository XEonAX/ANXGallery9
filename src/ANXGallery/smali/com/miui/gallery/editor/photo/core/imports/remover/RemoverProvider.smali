.class public Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverProvider;
.super Lcom/miui/gallery/editor/photo/core/SdkProvider;
.source "RemoverProvider.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/editor/photo/core/SdkProvider<",
        "Lcom/miui/gallery/editor/photo/core/common/model/RemoverData;",
        "Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractRemoverFragment;",
        ">;"
    }
.end annotation


# direct methods
.method static constructor <clinit>()V
    .locals 2

    sget-object v0, Lcom/miui/gallery/editor/photo/core/SdkManager;->INSTANCE:Lcom/miui/gallery/editor/photo/core/SdkManager;

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverProvider;

    invoke-direct {v1}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverProvider;-><init>()V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/SdkManager;->register(Lcom/miui/gallery/editor/photo/core/SdkProvider;)V

    return-void
.end method

.method protected constructor <init>()V
    .locals 1

    sget-object v0, Lcom/miui/gallery/editor/photo/core/Effect;->REMOVER:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/core/SdkProvider;-><init>(Lcom/miui/gallery/editor/photo/core/Effect;)V

    return-void
.end method


# virtual methods
.method public createEngine(Landroid/content/Context;)Lcom/miui/gallery/editor/photo/core/RenderEngine;
    .locals 0

    new-instance p1, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverEngine;

    invoke-direct {p1}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverEngine;-><init>()V

    return-object p1
.end method

.method public list()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/common/model/RemoverData;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x2

    new-array v0, v0, [Lcom/miui/gallery/editor/photo/core/common/model/RemoverData;

    new-instance v1, Lcom/miui/gallery/editor/photo/core/common/model/RemoverData;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverProvider;->getApplicationContext()Landroid/app/Application;

    move-result-object v2

    const v3, 0x7f1005e8

    invoke-virtual {v2, v3}, Landroid/app/Application;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    const v4, 0x7f070195

    invoke-direct {v1, v3, v2, v4, v3}, Lcom/miui/gallery/editor/photo/core/common/model/RemoverData;-><init>(SLjava/lang/String;II)V

    aput-object v1, v0, v3

    new-instance v1, Lcom/miui/gallery/editor/photo/core/common/model/RemoverData;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverProvider;->getApplicationContext()Landroid/app/Application;

    move-result-object v2

    const v3, 0x7f1005e9

    invoke-virtual {v2, v3}, Landroid/app/Application;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    const v4, 0x7f070196

    invoke-direct {v1, v3, v2, v4, v3}, Lcom/miui/gallery/editor/photo/core/common/model/RemoverData;-><init>(SLjava/lang/String;II)V

    aput-object v1, v0, v3

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method protected onActivityCreate()V
    .locals 0

    invoke-super {p0}, Lcom/miui/gallery/editor/photo/core/SdkProvider;->onActivityCreate()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverProvider;->notifyInitializeFinish()V

    return-void
.end method

.method protected bridge synthetic onCreateFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverProvider;->onCreateFragment()Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractRemoverFragment;

    move-result-object v0

    return-object v0
.end method

.method protected onCreateFragment()Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractRemoverFragment;
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/remover/RemoverRenderFragment;-><init>()V

    return-object v0
.end method
