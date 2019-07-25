.class public Lcom/miui/gallery/card/scenario/time/pastyear/PastYearSports;
.super Lcom/miui/gallery/card/scenario/time/pastyear/DayOfLastYearScenario;
.source "PastYearSports.java"


# direct methods
.method public constructor <init>()V
    .locals 3

    sget-object v0, Lcom/miui/gallery/card/scenario/ScenarioConstants;->TAGS_SPORTS:[Ljava/lang/Integer;

    const/16 v1, 0x71

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2, v0}, Lcom/miui/gallery/card/scenario/time/pastyear/DayOfLastYearScenario;-><init>(II[Ljava/lang/Integer;)V

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

    const p2, 0x7f1000ef

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
