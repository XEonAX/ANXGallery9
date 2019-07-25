.class public Lcom/miui/gallery/card/CardSyncInfo;
.super Ljava/lang/Object;
.source "CardSyncInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/card/CardSyncInfo$Builder;,
        Lcom/miui/gallery/card/CardSyncInfo$MediaInfoBean;
    }
.end annotation


# instance fields
.field private description:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "description"
    .end annotation
.end field

.field private duplicateKey:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "duplicateKey"
    .end annotation
.end field

.field private extraInfo:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "extraInfo"
    .end annotation
.end field

.field private mediaInfo:Lcom/miui/gallery/card/CardSyncInfo$MediaInfoBean;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "mediaInfo"
    .end annotation
.end field

.field private name:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "name"
    .end annotation
.end field

.field private scenarioId:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "scenarioId"
    .end annotation
.end field

.field private sortTime:J
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "sortTime"
    .end annotation
.end field

.field private status:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "status"
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/miui/gallery/card/CardSyncInfo$Builder;)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/miui/gallery/card/CardSyncInfo$Builder;->access$000(Lcom/miui/gallery/card/CardSyncInfo$Builder;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/card/CardSyncInfo;->setScenarioId(I)V

    invoke-static {p1}, Lcom/miui/gallery/card/CardSyncInfo$Builder;->access$100(Lcom/miui/gallery/card/CardSyncInfo$Builder;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/card/CardSyncInfo;->setName(Ljava/lang/String;)V

    invoke-static {p1}, Lcom/miui/gallery/card/CardSyncInfo$Builder;->access$200(Lcom/miui/gallery/card/CardSyncInfo$Builder;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/card/CardSyncInfo;->setDescription(Ljava/lang/String;)V

    invoke-static {p1}, Lcom/miui/gallery/card/CardSyncInfo$Builder;->access$300(Lcom/miui/gallery/card/CardSyncInfo$Builder;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/card/CardSyncInfo;->setStatus(Ljava/lang/String;)V

    invoke-static {p1}, Lcom/miui/gallery/card/CardSyncInfo$Builder;->access$400(Lcom/miui/gallery/card/CardSyncInfo$Builder;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/card/CardSyncInfo;->setDuplicateKey(Ljava/lang/String;)V

    new-instance v0, Lcom/miui/gallery/card/CardSyncInfo$MediaInfoBean;

    invoke-static {p1}, Lcom/miui/gallery/card/CardSyncInfo$Builder;->access$500(Lcom/miui/gallery/card/CardSyncInfo$Builder;)Ljava/util/List;

    move-result-object v1

    invoke-static {p1}, Lcom/miui/gallery/card/CardSyncInfo$Builder;->access$600(Lcom/miui/gallery/card/CardSyncInfo$Builder;)Ljava/util/List;

    move-result-object v2

    invoke-static {p1}, Lcom/miui/gallery/card/CardSyncInfo$Builder;->access$700(Lcom/miui/gallery/card/CardSyncInfo$Builder;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lcom/miui/gallery/card/CardSyncInfo$MediaInfoBean;-><init>(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/card/CardSyncInfo;->setMediaInfo(Lcom/miui/gallery/card/CardSyncInfo$MediaInfoBean;)V

    invoke-static {p1}, Lcom/miui/gallery/card/CardSyncInfo$Builder;->access$800(Lcom/miui/gallery/card/CardSyncInfo$Builder;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/card/CardSyncInfo;->setExtraInfo(Ljava/lang/String;)V

    invoke-static {p1}, Lcom/miui/gallery/card/CardSyncInfo$Builder;->access$900(Lcom/miui/gallery/card/CardSyncInfo$Builder;)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/card/CardSyncInfo;->setSortTime(J)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/card/CardSyncInfo$Builder;Lcom/miui/gallery/card/CardSyncInfo$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/card/CardSyncInfo;-><init>(Lcom/miui/gallery/card/CardSyncInfo$Builder;)V

    return-void
.end method

.method public static newBuilder()Lcom/miui/gallery/card/CardSyncInfo$Builder;
    .locals 2

    new-instance v0, Lcom/miui/gallery/card/CardSyncInfo$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/miui/gallery/card/CardSyncInfo$Builder;-><init>(Lcom/miui/gallery/card/CardSyncInfo$1;)V

    return-object v0
.end method


# virtual methods
.method public setDescription(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/CardSyncInfo;->description:Ljava/lang/String;

    return-void
.end method

.method public setDuplicateKey(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/CardSyncInfo;->duplicateKey:Ljava/lang/String;

    return-void
.end method

.method public setExtraInfo(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/CardSyncInfo;->extraInfo:Ljava/lang/String;

    return-void
.end method

.method public setMediaInfo(Lcom/miui/gallery/card/CardSyncInfo$MediaInfoBean;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/CardSyncInfo;->mediaInfo:Lcom/miui/gallery/card/CardSyncInfo$MediaInfoBean;

    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/CardSyncInfo;->name:Ljava/lang/String;

    return-void
.end method

.method public setScenarioId(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/card/CardSyncInfo;->scenarioId:I

    return-void
.end method

.method public setSortTime(J)V
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/card/CardSyncInfo;->sortTime:J

    return-void
.end method

.method public setStatus(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/CardSyncInfo;->status:Ljava/lang/String;

    return-void
.end method
