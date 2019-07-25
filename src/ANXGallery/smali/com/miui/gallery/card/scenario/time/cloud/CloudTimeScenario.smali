.class public Lcom/miui/gallery/card/scenario/time/cloud/CloudTimeScenario;
.super Lcom/miui/gallery/card/scenario/time/TimeScenario;
.source "CloudTimeScenario.java"


# instance fields
.field private mDescription:Ljava/lang/String;

.field private mEndTime:J

.field private mStartTime:J

.field private mTitle:Ljava/lang/String;


# direct methods
.method public constructor <init>(I)V
    .locals 2

    const/4 v0, 0x4

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/miui/gallery/card/scenario/time/TimeScenario;-><init>(III)V

    return-void
.end method


# virtual methods
.method public generateDescription(Lcom/miui/gallery/card/scenario/Record;Ljava/util/List;)Ljava/lang/String;
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

    iget-object p1, p0, Lcom/miui/gallery/card/scenario/time/cloud/CloudTimeScenario;->mDescription:Ljava/lang/String;

    return-object p1
.end method

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

    iget-object p1, p0, Lcom/miui/gallery/card/scenario/time/cloud/CloudTimeScenario;->mTitle:Ljava/lang/String;

    return-object p1
.end method

.method public onFillScenarioRule(Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy$ScenarioRule;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/miui/gallery/card/scenario/time/TimeScenario;->onFillScenarioRule(Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy$ScenarioRule;)V

    if-eqz p1, :cond_0

    instance-of v0, p1, Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy$CloudTimeScenarioRule;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy$CloudTimeScenarioRule;

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy$CloudTimeScenarioRule;->getTitle()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/card/scenario/time/cloud/CloudTimeScenario;->mTitle:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy$CloudTimeScenarioRule;->getDescription()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/card/scenario/time/cloud/CloudTimeScenario;->mDescription:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy$CloudTimeScenarioRule;->getStartTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/card/scenario/time/cloud/CloudTimeScenario;->mStartTime:J

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy$CloudTimeScenarioRule;->getEndTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/card/scenario/time/cloud/CloudTimeScenario;->mEndTime:J

    :cond_0
    return-void
.end method

.method public onPrepare(Ljava/util/List;Ljava/util/List;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/card/scenario/Record;",
            ">;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/card/Card;",
            ">;)Z"
        }
    .end annotation

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result p1

    const/4 v0, 0x0

    if-nez p1, :cond_2

    invoke-static {p2}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    iget-wide p1, p0, Lcom/miui/gallery/card/scenario/time/cloud/CloudTimeScenario;->mStartTime:J

    const-wide/16 v1, 0x0

    cmp-long v3, p1, v1

    if-lez v3, :cond_1

    iget-wide p1, p0, Lcom/miui/gallery/card/scenario/time/cloud/CloudTimeScenario;->mEndTime:J

    iget-wide v1, p0, Lcom/miui/gallery/card/scenario/time/cloud/CloudTimeScenario;->mStartTime:J

    cmp-long v3, p1, v1

    if-lez v3, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/card/scenario/time/cloud/CloudTimeScenario;->mTitle:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/card/scenario/time/cloud/CloudTimeScenario;->mDescription:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_1

    iget-wide p1, p0, Lcom/miui/gallery/card/scenario/time/cloud/CloudTimeScenario;->mStartTime:J

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/card/scenario/time/cloud/CloudTimeScenario;->setStartTime(J)V

    iget-wide p1, p0, Lcom/miui/gallery/card/scenario/time/cloud/CloudTimeScenario;->mEndTime:J

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/card/scenario/time/cloud/CloudTimeScenario;->setEndTime(J)V

    const/4 p1, 0x1

    return p1

    :cond_1
    return v0

    :cond_2
    :goto_0
    return v0
.end method
