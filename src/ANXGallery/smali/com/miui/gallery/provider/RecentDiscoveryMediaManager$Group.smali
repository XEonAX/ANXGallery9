.class Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$Group;
.super Ljava/lang/Object;
.source "RecentDiscoveryMediaManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/RecentDiscoveryMediaManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Group"
.end annotation


# instance fields
.field public albumId:J

.field public cursorPosList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public endDate:J

.field public julianday:I

.field public startDate:J


# direct methods
.method public constructor <init>(JIJI)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p4, p0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$Group;->albumId:J

    iput-wide p1, p0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$Group;->startDate:J

    iput-wide p1, p0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$Group;->endDate:J

    iput p3, p0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$Group;->julianday:I

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$Group;->cursorPosList:Ljava/util/List;

    iget-object p1, p0, Lcom/miui/gallery/provider/RecentDiscoveryMediaManager$Group;->cursorPosList:Ljava/util/List;

    invoke-static {p6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method
