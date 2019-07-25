.class public Lcom/miui/gallery/card/scenario/time/free/DogMonthlyScenario;
.super Lcom/miui/gallery/card/scenario/time/free/TagMonthlyScenario;
.source "DogMonthlyScenario.java"


# direct methods
.method public constructor <init>()V
    .locals 2

    sget-object v0, Lcom/miui/gallery/card/scenario/ScenarioConstants;->TAGS_DOG:[Ljava/lang/Integer;

    const/16 v1, 0x192

    invoke-direct {p0, v1, v0}, Lcom/miui/gallery/card/scenario/time/free/TagMonthlyScenario;-><init>(I[Ljava/lang/Integer;)V

    return-void
.end method


# virtual methods
.method public generateTitle(Lcom/miui/gallery/card/scenario/Record;Ljava/util/List;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/card/scenario/Record;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/assistant/model/MediaFeatureItem;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f1000eb

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
