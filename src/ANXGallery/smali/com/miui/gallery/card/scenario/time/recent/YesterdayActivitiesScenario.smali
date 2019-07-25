.class public Lcom/miui/gallery/card/scenario/time/recent/YesterdayActivitiesScenario;
.super Lcom/miui/gallery/card/scenario/time/recent/YesterdayScenario;
.source "YesterdayActivitiesScenario.java"


# direct methods
.method public constructor <init>()V
    .locals 2

    sget-object v0, Lcom/miui/gallery/card/scenario/ScenarioConstants;->TAGS_ACTIVITY:[Ljava/lang/Integer;

    const/16 v1, 0x74

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

    const/high16 p1, 0x7f020000

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/scenario/time/recent/YesterdayActivitiesScenario;->getRandomArrayString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
