.class public final Lcom/miui/gallery/card/CardSyncInfo$Builder;
.super Ljava/lang/Object;
.source "CardSyncInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/card/CardSyncInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private allMediaList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private coverMediaList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private description:Ljava/lang/String;

.field private duplicateKey:Ljava/lang/String;

.field private extraInfo:Ljava/lang/String;

.field private mediaList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private name:Ljava/lang/String;

.field private scenarioId:I

.field private sortTime:J

.field private status:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/card/CardSyncInfo$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/card/CardSyncInfo$Builder;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/card/CardSyncInfo$Builder;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/card/CardSyncInfo$Builder;->scenarioId:I

    return p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/card/CardSyncInfo$Builder;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/CardSyncInfo$Builder;->name:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/card/CardSyncInfo$Builder;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/CardSyncInfo$Builder;->description:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/card/CardSyncInfo$Builder;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/CardSyncInfo$Builder;->status:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/card/CardSyncInfo$Builder;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/CardSyncInfo$Builder;->duplicateKey:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/card/CardSyncInfo$Builder;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/CardSyncInfo$Builder;->coverMediaList:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/card/CardSyncInfo$Builder;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/CardSyncInfo$Builder;->mediaList:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/card/CardSyncInfo$Builder;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/CardSyncInfo$Builder;->allMediaList:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/card/CardSyncInfo$Builder;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/CardSyncInfo$Builder;->extraInfo:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$900(Lcom/miui/gallery/card/CardSyncInfo$Builder;)J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/card/CardSyncInfo$Builder;->sortTime:J

    return-wide v0
.end method


# virtual methods
.method public build()Lcom/miui/gallery/card/CardSyncInfo;
    .locals 2

    new-instance v0, Lcom/miui/gallery/card/CardSyncInfo;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/card/CardSyncInfo;-><init>(Lcom/miui/gallery/card/CardSyncInfo$Builder;Lcom/miui/gallery/card/CardSyncInfo$1;)V

    return-object v0
.end method

.method public setAllMediaList(Ljava/util/List;)Lcom/miui/gallery/card/CardSyncInfo$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;)",
            "Lcom/miui/gallery/card/CardSyncInfo$Builder;"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/card/CardSyncInfo$Builder;->allMediaList:Ljava/util/List;

    return-object p0
.end method

.method public setCoverMediaList(Ljava/util/List;)Lcom/miui/gallery/card/CardSyncInfo$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;)",
            "Lcom/miui/gallery/card/CardSyncInfo$Builder;"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/card/CardSyncInfo$Builder;->coverMediaList:Ljava/util/List;

    return-object p0
.end method

.method public setDescription(Ljava/lang/String;)Lcom/miui/gallery/card/CardSyncInfo$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/CardSyncInfo$Builder;->description:Ljava/lang/String;

    return-object p0
.end method

.method public setDuplicateKey(Ljava/lang/String;)Lcom/miui/gallery/card/CardSyncInfo$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/CardSyncInfo$Builder;->duplicateKey:Ljava/lang/String;

    return-object p0
.end method

.method public setExtraInfo(Ljava/lang/String;)Lcom/miui/gallery/card/CardSyncInfo$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/CardSyncInfo$Builder;->extraInfo:Ljava/lang/String;

    return-object p0
.end method

.method public setMediaList(Ljava/util/List;)Lcom/miui/gallery/card/CardSyncInfo$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;)",
            "Lcom/miui/gallery/card/CardSyncInfo$Builder;"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/card/CardSyncInfo$Builder;->mediaList:Ljava/util/List;

    return-object p0
.end method

.method public setName(Ljava/lang/String;)Lcom/miui/gallery/card/CardSyncInfo$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/CardSyncInfo$Builder;->name:Ljava/lang/String;

    return-object p0
.end method

.method public setScenarioId(I)Lcom/miui/gallery/card/CardSyncInfo$Builder;
    .locals 0

    iput p1, p0, Lcom/miui/gallery/card/CardSyncInfo$Builder;->scenarioId:I

    return-object p0
.end method

.method public setSortTime(J)Lcom/miui/gallery/card/CardSyncInfo$Builder;
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/card/CardSyncInfo$Builder;->sortTime:J

    return-object p0
.end method

.method public setStatus(Ljava/lang/String;)Lcom/miui/gallery/card/CardSyncInfo$Builder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/CardSyncInfo$Builder;->status:Ljava/lang/String;

    return-object p0
.end method
