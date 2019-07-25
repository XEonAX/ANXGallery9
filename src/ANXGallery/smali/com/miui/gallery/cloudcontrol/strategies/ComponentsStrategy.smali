.class public Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;
.super Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;
.source "ComponentsStrategy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Component;,
        Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Priority;
    }
.end annotation


# static fields
.field public static final CLOUD_FIRST_MERGER:Lcom/miui/gallery/cloudcontrol/Merger;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/cloudcontrol/Merger<",
            "Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;",
            ">;"
        }
    .end annotation
.end field

.field public static final MATCH_ORDER:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Priority;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mPriority:Ljava/util/ArrayList;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "component-priority"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Priority;",
            ">;"
        }
    .end annotation
.end field

.field private mPriorityInternational:Ljava/util/ArrayList;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "component-priority-international"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Priority;",
            ">;"
        }
    .end annotation
.end field

.field private mShareComponents:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "share-components"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Component;",
            ">;"
        }
    .end annotation
.end field

.field private mShareComponentsInternational:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "share-components-international"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Component;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$1;

    invoke-direct {v0}, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;->MATCH_ORDER:Ljava/util/Comparator;

    new-instance v0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$2;

    invoke-direct {v0}, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$2;-><init>()V

    sput-object v0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;->CLOUD_FIRST_MERGER:Lcom/miui/gallery/cloudcontrol/Merger;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;)Ljava/util/ArrayList;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;->mPriorityInternational:Ljava/util/ArrayList;

    return-object p0
.end method

.method static synthetic access$002(Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;->mPriorityInternational:Ljava/util/ArrayList;

    return-object p1
.end method

.method static synthetic access$100(Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;)Ljava/util/ArrayList;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;->mPriority:Ljava/util/ArrayList;

    return-object p0
.end method

.method static synthetic access$102(Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;->mPriority:Ljava/util/ArrayList;

    return-object p1
.end method

.method public static createDefault()Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;
    .locals 9

    new-instance v0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;

    invoke-direct {v0}, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;-><init>()V

    invoke-static {}, Lcom/miui/gallery/util/BuildUtil;->isInternational()Z

    move-result v1

    const/4 v2, 0x3

    const/4 v3, 0x2

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v1, :cond_0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;->mShareComponentsInternational:Ljava/util/List;

    iget-object v1, v0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;->mShareComponentsInternational:Ljava/util/List;

    new-instance v6, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Component;

    const-string v7, "com.twitter.android"

    const-string v8, "com.twitter.android.composer.ComposerActivity"

    invoke-direct {v6, v7, v8, v5}, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Component;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v1, v0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;->mShareComponentsInternational:Ljava/util/List;

    new-instance v5, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Component;

    const-string v6, "com.instagram.android"

    const-string v7, "com.instagram.android.activity.ShareHandlerActivity"

    invoke-direct {v5, v6, v7, v4}, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Component;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v1, v0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;->mShareComponentsInternational:Ljava/util/List;

    new-instance v4, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Component;

    const-string v5, "com.whatsapp"

    const-string v6, "com.whatsapp.ContactPicker"

    invoke-direct {v4, v5, v6, v3}, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Component;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v1, v0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;->mShareComponentsInternational:Ljava/util/List;

    new-instance v3, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Component;

    const-string v4, "com.facebook.katana"

    const-string v5, "com.facebook.composer.shareintent.ImplicitShareIntentHandlerDefaultAlias"

    invoke-direct {v3, v4, v5, v2}, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Component;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v1, v0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;->mShareComponentsInternational:Ljava/util/List;

    new-instance v2, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Component;

    const-string v3, "com.facebook.orca"

    const-string v4, "com.facebook.messenger.intents.ShareIntentHandler"

    const/4 v5, 0x4

    invoke-direct {v2, v3, v4, v5}, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Component;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v1, v0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;->mShareComponentsInternational:Ljava/util/List;

    new-instance v2, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Component;

    const-string v3, "org.telegram.messenger"

    const-string v4, "org.telegram.ui.LaunchActivity"

    const/4 v5, 0x5

    invoke-direct {v2, v3, v4, v5}, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Component;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v1, v0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;->mShareComponentsInternational:Ljava/util/List;

    new-instance v2, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Component;

    const-string v3, "com.bsb.hike"

    const-string v4, "com.bsb.hike.ui.ComposeChatActivity"

    const/4 v5, 0x6

    invoke-direct {v2, v3, v4, v5}, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Component;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v1, v0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;->mShareComponentsInternational:Ljava/util/List;

    new-instance v2, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Component;

    const-string v3, "com.twitter.android"

    const-string v4, "com.twitter.android.DMActivity"

    const/4 v5, 0x7

    invoke-direct {v2, v3, v4, v5}, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Component;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v1, v0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;->mShareComponentsInternational:Ljava/util/List;

    new-instance v2, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Component;

    const-string v3, "com.xiaomi.midrop"

    const-string v4, "com.xiaomi.midrop.sender.ui.TransmissionActivity"

    const/16 v5, 0x8

    invoke-direct {v2, v3, v4, v5}, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Component;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;->mShareComponents:Ljava/util/List;

    iget-object v1, v0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;->mShareComponents:Ljava/util/List;

    new-instance v6, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Component;

    const-string v7, "com.tencent.mm"

    const-string v8, "com.tencent.mm.ui.tools.ShareImgUI"

    invoke-direct {v6, v7, v8, v5}, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Component;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v1, v0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;->mShareComponents:Ljava/util/List;

    new-instance v5, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Component;

    const-string v6, "com.tencent.mm"

    const-string v7, "com.tencent.mm.ui.tools.ShareToTimeLineUI"

    invoke-direct {v5, v6, v7, v4}, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Component;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v1, v0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;->mShareComponents:Ljava/util/List;

    new-instance v4, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Component;

    const-string v5, "com.qzone"

    const-string v6, "com.qzonex.module.operation.ui.QZonePublishMoodActivity"

    invoke-direct {v4, v5, v6, v3}, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Component;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v1, v0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;->mShareComponents:Ljava/util/List;

    new-instance v3, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Component;

    const-string v4, "com.tencent.mobileqq"

    const-string v5, "com.tencent.mobileqq.activity.JumpActivity"

    invoke-direct {v3, v4, v5, v2}, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Component;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;->mPriorityInternational:Ljava/util/ArrayList;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;->mPriority:Ljava/util/ArrayList;

    return-object v0
.end method


# virtual methods
.method public doAdditionalProcessing()V
    .locals 3

    invoke-static {}, Lcom/miui/gallery/util/BuildUtil;->isInternational()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;->mPriorityInternational:Ljava/util/ArrayList;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;->mPriority:Ljava/util/ArrayList;

    :goto_0
    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Priority;

    invoke-virtual {v2}, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Priority;->initMathOrder()V

    goto :goto_1

    :cond_1
    sget-object v1, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;->MATCH_ORDER:Ljava/util/Comparator;

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    :cond_2
    return-void
.end method

.method public getComponentPriority()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Priority;",
            ">;"
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/util/BuildUtil;->isInternational()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;->mPriorityInternational:Ljava/util/ArrayList;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;->mPriority:Ljava/util/ArrayList;

    :goto_0
    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    :goto_1
    return-object v0
.end method

.method public getShareComponents()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy$Component;",
            ">;"
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/util/BuildUtil;->isInternational()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;->mShareComponentsInternational:Ljava/util/List;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;->mShareComponents:Ljava/util/List;

    :goto_0
    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    :goto_1
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ComponentsStrategy{mShareComponents="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;->mShareComponents:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", mShareComponentsInternational="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;->mShareComponentsInternational:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", mPriority="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;->mPriority:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", mPriorityInternational="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/ComponentsStrategy;->mPriorityInternational:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
