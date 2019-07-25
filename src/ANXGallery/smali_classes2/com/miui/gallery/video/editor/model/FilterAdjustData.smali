.class public Lcom/miui/gallery/video/editor/model/FilterAdjustData;
.super Lcom/miui/gallery/video/editor/model/AdjustData;
.source "FilterAdjustData.java"


# instance fields
.field MAX:I

.field MIN:I

.field private mId:I

.field private mIsMid:Z

.field private mLabel:Ljava/lang/String;


# direct methods
.method public constructor <init>(ISLjava/lang/String;IZLjava/lang/String;)V
    .locals 0

    invoke-direct {p0, p2, p3, p4}, Lcom/miui/gallery/video/editor/model/AdjustData;-><init>(SLjava/lang/String;I)V

    const/16 p2, 0x64

    iput p2, p0, Lcom/miui/gallery/video/editor/model/FilterAdjustData;->MAX:I

    const/4 p2, 0x0

    iput p2, p0, Lcom/miui/gallery/video/editor/model/FilterAdjustData;->MIN:I

    const-string p2, ""

    iput-object p2, p0, Lcom/miui/gallery/video/editor/model/FilterAdjustData;->mLabel:Ljava/lang/String;

    iput p1, p0, Lcom/miui/gallery/video/editor/model/FilterAdjustData;->mId:I

    iput-boolean p5, p0, Lcom/miui/gallery/video/editor/model/FilterAdjustData;->mIsMid:Z

    iput-object p6, p0, Lcom/miui/gallery/video/editor/model/FilterAdjustData;->mLabel:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getId()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/video/editor/model/FilterAdjustData;->mId:I

    return v0
.end method

.method public getLable()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/model/FilterAdjustData;->mLabel:Ljava/lang/String;

    return-object v0
.end method

.method public getMax()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/video/editor/model/FilterAdjustData;->MAX:I

    return v0
.end method

.method public getMin()I
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/video/editor/model/FilterAdjustData;->mIsMid:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/video/editor/model/FilterAdjustData;->MAX:I

    neg-int v0, v0

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/miui/gallery/video/editor/model/FilterAdjustData;->MIN:I

    :goto_0
    return v0
.end method

.method public isMid()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/video/editor/model/FilterAdjustData;->mIsMid:Z

    return v0
.end method
