.class public Lcom/miui/gallery/card/scenario/ScenarioFactory;
.super Ljava/lang/Object;
.source "ScenarioFactory.java"


# static fields
.field private static final sScenarioClass:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ljava/lang/Class<",
            "+",
            "Lcom/miui/gallery/card/scenario/Scenario;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Lcom/miui/gallery/card/scenario/ScenarioFactory;->sScenarioClass:Landroid/util/SparseArray;

    sget-object v0, Lcom/miui/gallery/card/scenario/ScenarioFactory;->sScenarioClass:Landroid/util/SparseArray;

    const-class v1, Lcom/miui/gallery/card/scenario/time/annual/AnnualTravelsScenario;

    const/16 v2, 0x76

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    sget-object v0, Lcom/miui/gallery/card/scenario/ScenarioFactory;->sScenarioClass:Landroid/util/SparseArray;

    const-class v1, Lcom/miui/gallery/card/scenario/time/annual/AnnualEventsScenario;

    const/16 v2, 0x77

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    sget-object v0, Lcom/miui/gallery/card/scenario/ScenarioFactory;->sScenarioClass:Landroid/util/SparseArray;

    const-class v1, Lcom/miui/gallery/card/scenario/time/annual/AnnualPetsScenario;

    const/16 v2, 0x78

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    sget-object v0, Lcom/miui/gallery/card/scenario/ScenarioFactory;->sScenarioClass:Landroid/util/SparseArray;

    const-class v1, Lcom/miui/gallery/card/scenario/time/annual/AnnualFoodsScenario;

    const/16 v2, 0x79

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    sget-object v0, Lcom/miui/gallery/card/scenario/ScenarioFactory;->sScenarioClass:Landroid/util/SparseArray;

    const-class v1, Lcom/miui/gallery/card/scenario/time/recent/LastMonthScenario;

    const/16 v2, 0x6d

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    sget-object v0, Lcom/miui/gallery/card/scenario/ScenarioFactory;->sScenarioClass:Landroid/util/SparseArray;

    const-class v1, Lcom/miui/gallery/card/scenario/time/recent/LastSeasonScenario;

    const/16 v2, 0x6c

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    sget-object v0, Lcom/miui/gallery/card/scenario/ScenarioFactory;->sScenarioClass:Landroid/util/SparseArray;

    const-class v1, Lcom/miui/gallery/card/scenario/time/recent/LastWeekendScenario;

    const/16 v2, 0x6e

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    sget-object v0, Lcom/miui/gallery/card/scenario/ScenarioFactory;->sScenarioClass:Landroid/util/SparseArray;

    const-class v1, Lcom/miui/gallery/card/scenario/time/recent/RecentTravelScenario;

    const/16 v2, 0x72

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    sget-object v0, Lcom/miui/gallery/card/scenario/ScenarioFactory;->sScenarioClass:Landroid/util/SparseArray;

    const-class v1, Lcom/miui/gallery/card/scenario/time/recent/YesterdayActivitiesScenario;

    const/16 v2, 0x74

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    sget-object v0, Lcom/miui/gallery/card/scenario/ScenarioFactory;->sScenarioClass:Landroid/util/SparseArray;

    const-class v1, Lcom/miui/gallery/card/scenario/time/recent/YesterdayPartyScenario;

    const/16 v2, 0x73

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    sget-object v0, Lcom/miui/gallery/card/scenario/ScenarioFactory;->sScenarioClass:Landroid/util/SparseArray;

    const-class v1, Lcom/miui/gallery/card/scenario/time/recent/YesterdaySportsScenario;

    const/16 v2, 0x75

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    sget-object v0, Lcom/miui/gallery/card/scenario/ScenarioFactory;->sScenarioClass:Landroid/util/SparseArray;

    const-class v1, Lcom/miui/gallery/card/scenario/time/pastyear/ChineseHolidayScenario;

    const/16 v2, 0x65

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    sget-object v0, Lcom/miui/gallery/card/scenario/ScenarioFactory;->sScenarioClass:Landroid/util/SparseArray;

    const-class v1, Lcom/miui/gallery/card/scenario/time/pastyear/PastYearActivities;

    const/16 v2, 0x70

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    sget-object v0, Lcom/miui/gallery/card/scenario/ScenarioFactory;->sScenarioClass:Landroid/util/SparseArray;

    const-class v1, Lcom/miui/gallery/card/scenario/time/pastyear/PastYearMonthScenario;

    const/16 v2, 0x67

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    sget-object v0, Lcom/miui/gallery/card/scenario/ScenarioFactory;->sScenarioClass:Landroid/util/SparseArray;

    const-class v1, Lcom/miui/gallery/card/scenario/time/pastyear/PastYearParty;

    const/16 v2, 0x6f

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    sget-object v0, Lcom/miui/gallery/card/scenario/ScenarioFactory;->sScenarioClass:Landroid/util/SparseArray;

    const-class v1, Lcom/miui/gallery/card/scenario/time/pastyear/PastYearSeasonScenario;

    const/16 v2, 0x68

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    sget-object v0, Lcom/miui/gallery/card/scenario/ScenarioFactory;->sScenarioClass:Landroid/util/SparseArray;

    const-class v1, Lcom/miui/gallery/card/scenario/time/pastyear/PastYearSports;

    const/16 v2, 0x71

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    sget-object v0, Lcom/miui/gallery/card/scenario/ScenarioFactory;->sScenarioClass:Landroid/util/SparseArray;

    const-class v1, Lcom/miui/gallery/card/scenario/time/pastyear/SolarHolidayScenario;

    const/16 v2, 0x66

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    sget-object v0, Lcom/miui/gallery/card/scenario/ScenarioFactory;->sScenarioClass:Landroid/util/SparseArray;

    const-class v1, Lcom/miui/gallery/card/scenario/time/free/CatMonthlyScenario;

    const/16 v2, 0x191

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    sget-object v0, Lcom/miui/gallery/card/scenario/ScenarioFactory;->sScenarioClass:Landroid/util/SparseArray;

    const-class v1, Lcom/miui/gallery/card/scenario/time/free/DogMonthlyScenario;

    const/16 v2, 0x192

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    sget-object v0, Lcom/miui/gallery/card/scenario/ScenarioFactory;->sScenarioClass:Landroid/util/SparseArray;

    const-class v1, Lcom/miui/gallery/card/scenario/time/free/FoodMonthlyScenario;

    const/16 v2, 0x193

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    sget-object v0, Lcom/miui/gallery/card/scenario/ScenarioFactory;->sScenarioClass:Landroid/util/SparseArray;

    const-class v1, Lcom/miui/gallery/card/scenario/time/free/PastTravelScenario;

    const/16 v2, 0xc9

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    sget-object v0, Lcom/miui/gallery/card/scenario/ScenarioFactory;->sScenarioClass:Landroid/util/SparseArray;

    const-class v1, Lcom/miui/gallery/card/scenario/time/free/PastWeekendScenario;

    const/16 v2, 0x194

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    sget-object v0, Lcom/miui/gallery/card/scenario/ScenarioFactory;->sScenarioClass:Landroid/util/SparseArray;

    const-class v1, Lcom/miui/gallery/card/scenario/time/guarantee/RecentMemoryScenario;

    const/16 v2, 0x1f5

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    return-void
.end method

.method public static createCloudTimeScenario(Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy$CloudTimeScenarioRule;)Lcom/miui/gallery/card/scenario/Scenario;
    .locals 2

    if-eqz p0, :cond_0

    new-instance v0, Lcom/miui/gallery/card/scenario/time/cloud/CloudTimeScenario;

    invoke-virtual {p0}, Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy$CloudTimeScenarioRule;->getScenarioId()I

    move-result v1

    invoke-direct {v0, v1}, Lcom/miui/gallery/card/scenario/time/cloud/CloudTimeScenario;-><init>(I)V

    invoke-virtual {v0, p0}, Lcom/miui/gallery/card/scenario/time/cloud/CloudTimeScenario;->onFillScenarioRule(Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy$ScenarioRule;)V

    return-object v0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static createLocalScenario(Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy$ScenarioRule;)Lcom/miui/gallery/card/scenario/Scenario;
    .locals 2

    if-eqz p0, :cond_0

    sget-object v0, Lcom/miui/gallery/card/scenario/ScenarioFactory;->sScenarioClass:Landroid/util/SparseArray;

    invoke-virtual {p0}, Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy$ScenarioRule;->getScenarioId()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    if-eqz v0, :cond_0

    :try_start_0
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/card/scenario/Scenario;

    invoke-virtual {v0, p0}, Lcom/miui/gallery/card/scenario/Scenario;->onFillScenarioRule(Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy$ScenarioRule;)V
    :try_end_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p0

    const-string v0, "ScenarioFactory"

    invoke-static {v0, p0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    :catch_1
    move-exception p0

    const-string v0, "ScenarioFactory"

    invoke-static {v0, p0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method
