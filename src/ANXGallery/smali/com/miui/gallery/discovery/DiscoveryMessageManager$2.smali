.class Lcom/miui/gallery/discovery/DiscoveryMessageManager$2;
.super Ljava/lang/Object;
.source "DiscoveryMessageManager.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/discovery/DiscoveryMessageManager;->createComparatorByType(I)Ljava/util/Comparator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/miui/gallery/model/DiscoveryMessage;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/discovery/DiscoveryMessageManager;


# direct methods
.method constructor <init>(Lcom/miui/gallery/discovery/DiscoveryMessageManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/discovery/DiscoveryMessageManager$2;->this$0:Lcom/miui/gallery/discovery/DiscoveryMessageManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/miui/gallery/model/DiscoveryMessage;Lcom/miui/gallery/model/DiscoveryMessage;)I
    .locals 7

    invoke-virtual {p1}, Lcom/miui/gallery/model/DiscoveryMessage;->getPriority()I

    move-result v0

    invoke-virtual {p2}, Lcom/miui/gallery/model/DiscoveryMessage;->getPriority()I

    move-result v1

    const/4 v2, -0x1

    const/4 v3, 0x1

    if-ne v0, v1, :cond_2

    invoke-virtual {p1}, Lcom/miui/gallery/model/DiscoveryMessage;->getUpdateTime()J

    move-result-wide v0

    invoke-virtual {p2}, Lcom/miui/gallery/model/DiscoveryMessage;->getUpdateTime()J

    move-result-wide v4

    cmp-long v6, v0, v4

    if-nez v6, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-virtual {p1}, Lcom/miui/gallery/model/DiscoveryMessage;->getUpdateTime()J

    move-result-wide v0

    invoke-virtual {p2}, Lcom/miui/gallery/model/DiscoveryMessage;->getUpdateTime()J

    move-result-wide p1

    cmp-long v4, v0, p1

    if-lez v4, :cond_1

    goto :goto_0

    :cond_1
    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_2
    invoke-virtual {p1}, Lcom/miui/gallery/model/DiscoveryMessage;->getPriority()I

    move-result p1

    invoke-virtual {p2}, Lcom/miui/gallery/model/DiscoveryMessage;->getPriority()I

    move-result p2

    if-le p1, p2, :cond_3

    const/4 v2, 0x1

    :cond_3
    return v2
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    check-cast p1, Lcom/miui/gallery/model/DiscoveryMessage;

    check-cast p2, Lcom/miui/gallery/model/DiscoveryMessage;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/discovery/DiscoveryMessageManager$2;->compare(Lcom/miui/gallery/model/DiscoveryMessage;Lcom/miui/gallery/model/DiscoveryMessage;)I

    move-result p1

    return p1
.end method
