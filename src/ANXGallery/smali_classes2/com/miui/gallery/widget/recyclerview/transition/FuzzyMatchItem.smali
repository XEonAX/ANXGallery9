.class public Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;
.super Ljava/lang/Object;
.source "FuzzyMatchItem.java"


# instance fields
.field public final mDate:J

.field public final mId:J

.field public final mLocation:Ljava/lang/String;

.field public final mPosition:I


# direct methods
.method public constructor <init>(IJLjava/lang/String;J)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;->mPosition:I

    iput-wide p2, p0, Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;->mId:J

    iput-object p4, p0, Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;->mLocation:Ljava/lang/String;

    iput-wide p5, p0, Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;->mDate:J

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 4

    const-string v0, "mPosition=%d; mId=%s, mLocation=%s, mDate=%s"

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    iget v2, p0, Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;->mPosition:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget-wide v2, p0, Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;->mId:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;->mLocation:Ljava/lang/String;

    const/4 v3, 0x2

    aput-object v2, v1, v3

    iget-wide v2, p0, Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;->mDate:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const/4 v3, 0x3

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
