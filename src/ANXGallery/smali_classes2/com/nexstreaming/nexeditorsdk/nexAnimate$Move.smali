.class public Lcom/nexstreaming/nexeditorsdk/nexAnimate$Move;
.super Lcom/nexstreaming/nexeditorsdk/nexAnimate;
.source "nexAnimate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nexstreaming/nexeditorsdk/nexAnimate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "Move"
.end annotation


# instance fields
.field private mPath:Lcom/nexstreaming/nexeditorsdk/nexAnimate$MoveTrackingPath;


# direct methods
.method protected constructor <init>(IILcom/nexstreaming/nexeditorsdk/nexAnimate$MoveTrackingPath;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;-><init>(II)V

    iput-object p3, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Move;->mPath:Lcom/nexstreaming/nexeditorsdk/nexAnimate$MoveTrackingPath;

    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Move;->mPath:Lcom/nexstreaming/nexeditorsdk/nexAnimate$MoveTrackingPath;

    if-nez p1, :cond_0

    new-instance p1, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Move$1;

    invoke-direct {p1, p0}, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Move$1;-><init>(Lcom/nexstreaming/nexeditorsdk/nexAnimate$Move;)V

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Move;->mPath:Lcom/nexstreaming/nexeditorsdk/nexAnimate$MoveTrackingPath;

    :cond_0
    return-void
.end method


# virtual methods
.method protected getTranslatePosition(II)F
    .locals 1

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Move;->mPath:Lcom/nexstreaming/nexeditorsdk/nexAnimate$MoveTrackingPath;

    invoke-virtual {p0, p1}, Lcom/nexstreaming/nexeditorsdk/nexAnimate$Move;->timeRatio(I)F

    move-result p1

    invoke-interface {v0, p2, p1}, Lcom/nexstreaming/nexeditorsdk/nexAnimate$MoveTrackingPath;->getTranslatePosition(IF)F

    move-result p1

    return p1
.end method
