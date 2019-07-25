.class public final Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;
.super Ljava/lang/Object;
.source "NexRectangle.java"


# instance fields
.field public mBottom:I

.field public mLeft:I

.field public mRight:I

.field public mTop:I


# direct methods
.method public constructor <init>(IIII)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;->mLeft:I

    iput p2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;->mTop:I

    iput p3, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;->mRight:I

    iput p4, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;->mBottom:I

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_6

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_1

    :cond_1
    check-cast p1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;

    iget v2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;->mLeft:I

    iget v3, p1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;->mLeft:I

    if-eq v2, v3, :cond_2

    return v1

    :cond_2
    iget v2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;->mTop:I

    iget v3, p1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;->mTop:I

    if-eq v2, v3, :cond_3

    return v1

    :cond_3
    iget v2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;->mRight:I

    iget v3, p1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;->mRight:I

    if-eq v2, v3, :cond_4

    return v1

    :cond_4
    iget v2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;->mBottom:I

    iget p1, p1, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;->mBottom:I

    if-ne v2, p1, :cond_5

    goto :goto_0

    :cond_5
    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_6
    :goto_1
    return v1
.end method

.method public hashCode()I
    .locals 2

    iget v0, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;->mLeft:I

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;->mTop:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;->mRight:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;->mBottom:I

    add-int/2addr v0, v1

    return v0
.end method

.method public setRect(IIII)V
    .locals 0

    iput p1, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;->mLeft:I

    iput p2, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;->mTop:I

    iput p3, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;->mRight:I

    iput p4, p0, Lcom/nexstreaming/kminternal/nexvideoeditor/NexRectangle;->mBottom:I

    return-void
.end method
