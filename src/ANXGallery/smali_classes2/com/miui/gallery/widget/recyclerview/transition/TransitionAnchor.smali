.class public Lcom/miui/gallery/widget/recyclerview/transition/TransitionAnchor;
.super Ljava/lang/Object;
.source "TransitionAnchor.java"


# instance fields
.field final mFromAnchorId:J

.field final mToAnchorId:J


# direct methods
.method public constructor <init>(JJ)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionAnchor;->mFromAnchorId:J

    iput-wide p3, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionAnchor;->mToAnchorId:J

    return-void
.end method


# virtual methods
.method public isValid()Z
    .locals 5

    iget-wide v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionAnchor;->mFromAnchorId:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    iget-wide v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionAnchor;->mToAnchorId:J

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
