.class Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider;
.super Lcom/miui/gallery/editor/photo/core/common/provider/AbstractTextProvider;
.source "TextProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider$ResourceListener;,
        Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider$LoadWatermarkTask;
    }
.end annotation


# instance fields
.field private mDialogManager:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager;

.field private mTextBubbleList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/common/model/TextData;",
            ">;"
        }
    .end annotation
.end field

.field private mTextWatermarkList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/common/model/TextData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    sget-object v0, Lcom/miui/gallery/editor/photo/core/SdkManager;->INSTANCE:Lcom/miui/gallery/editor/photo/core/SdkManager;

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider;

    invoke-direct {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider;-><init>()V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/SdkManager;->register(Lcom/miui/gallery/editor/photo/core/SdkProvider;)V

    return-void
.end method

.method protected constructor <init>()V
    .locals 1

    sget-object v0, Lcom/miui/gallery/editor/photo/core/Effect;->TEXT:Lcom/miui/gallery/editor/photo/core/Effect;

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/core/common/provider/AbstractTextProvider;-><init>(Lcom/miui/gallery/editor/photo/core/Effect;)V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider;->mTextWatermarkList:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$002(Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider;Ljava/util/List;)Ljava/util/List;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider;->mTextWatermarkList:Ljava/util/List;

    return-object p1
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider;)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider;->notifyInitializeFinish()V

    return-void
.end method

.method private initTextBubbleData()V
    .locals 6

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider;->mTextBubbleList:Ljava/util/List;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider;->mDialogManager:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager;->getDialogModelList()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;

    new-instance v4, Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;

    iget-object v5, v3, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;->name:Ljava/lang/String;

    invoke-direct {v4, v1, v5, v3}, Lcom/miui/gallery/editor/photo/core/imports/text/TextConfig;-><init>(SLjava/lang/String;Lcom/miui/gallery/editor/photo/core/imports/text/dialog/BaseDialogModel;)V

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider;->mTextBubbleList:Ljava/util/List;

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private initTextWaterMarkData()V
    .locals 4

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider$LoadWatermarkTask;

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider$1;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider;->getApplicationContext()Landroid/app/Application;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Application;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider$LoadWatermarkTask;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider$ResourceListener;Landroid/content/res/AssetManager;)V

    const/4 v1, 0x1

    new-array v1, v1, [Landroid/app/Application;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider;->getApplicationContext()Landroid/app/Application;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider$LoadWatermarkTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method private initialize()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider;->mDialogManager:Lcom/miui/gallery/editor/photo/core/imports/text/dialog/DialogManager;

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider;->initTextBubbleData()V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider;->initTextWaterMarkData()V

    return-void
.end method


# virtual methods
.method public createEngine(Landroid/content/Context;)Lcom/miui/gallery/editor/photo/core/RenderEngine;
    .locals 0

    new-instance p1, Lcom/miui/gallery/editor/photo/core/imports/text/TextEngine;

    invoke-direct {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEngine;-><init>()V

    return-object p1
.end method

.method public list()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/common/model/TextData;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider;->mTextBubbleList:Ljava/util/List;

    return-object v0
.end method

.method public listWatermark()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/common/model/TextData;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider;->mTextWatermarkList:Ljava/util/List;

    return-object v0
.end method

.method protected onActivityCreate()V
    .locals 0

    invoke-super {p0}, Lcom/miui/gallery/editor/photo/core/common/provider/AbstractTextProvider;->onActivityCreate()V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider;->initialize()V

    return-void
.end method

.method protected bridge synthetic onCreateFragment()Lcom/miui/gallery/editor/photo/core/RenderFragment;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextProvider;->onCreateFragment()Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;

    move-result-object v0

    return-object v0
.end method

.method protected onCreateFragment()Lcom/miui/gallery/editor/photo/core/common/fragment/AbstractEffectFragment;
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;-><init>()V

    return-object v0
.end method
