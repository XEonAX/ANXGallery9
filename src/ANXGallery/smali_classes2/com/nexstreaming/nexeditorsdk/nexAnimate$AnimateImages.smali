.class public Lcom/nexstreaming/nexeditorsdk/nexAnimate$AnimateImages;
.super Lcom/nexstreaming/nexeditorsdk/nexAnimate;
.source "nexAnimate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nexstreaming/nexeditorsdk/nexAnimate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "AnimateImages"
.end annotation


# instance fields
.field private final resourceIds:[I


# direct methods
.method protected varargs constructor <init>(II[I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/nexstreaming/nexeditorsdk/nexAnimate;-><init>(II)V

    iput-object p3, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$AnimateImages;->resourceIds:[I

    return-void
.end method


# virtual methods
.method protected getImageResourceId(I)I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$AnimateImages;->mStartTime:I

    sub-int/2addr p1, v0

    div-int/lit8 p1, p1, 0x21

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$AnimateImages;->resourceIds:[I

    array-length v0, v0

    rem-int/2addr p1, v0

    if-gez p1, :cond_0

    const/4 p1, 0x0

    :cond_0
    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/nexAnimate$AnimateImages;->resourceIds:[I

    aget p1, v0, p1

    return p1
.end method
