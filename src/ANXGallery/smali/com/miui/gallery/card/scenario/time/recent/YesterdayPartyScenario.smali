.class public Lcom/miui/gallery/card/scenario/time/recent/YesterdayPartyScenario;
.super Lcom/miui/gallery/card/scenario/time/recent/YesterdayScenario;
.source "YesterdayPartyScenario.java"


# direct methods
.method public constructor <init>()V
    .locals 2

    sget-object v0, Lcom/miui/gallery/card/scenario/ScenarioConstants;->TAGS_PARTY:[Ljava/lang/Integer;

    const/16 v1, 0x73

    invoke-direct {p0, v1, v0}, Lcom/miui/gallery/card/scenario/time/recent/YesterdayScenario;-><init>(I[Ljava/lang/Integer;)V

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

    const p1, 0x7f020011

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/scenario/time/recent/YesterdayPartyScenario;->getRandomArrayString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
