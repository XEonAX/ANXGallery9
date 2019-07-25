.class public Lcom/google/android/flexbox/FlexLine;
.super Ljava/lang/Object;
.source "FlexLine.java"


# instance fields
.field mBottom:I

.field mCrossSize:I

.field mDividerLengthInMainSize:I

.field mFirstIndex:I

.field mGoneItemCount:I

.field mIndicesAlignSelfStretch:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field mItemCount:I

.field mLastIndex:I

.field mLeft:I

.field mMainSize:I

.field mMaxBaseline:I

.field mRight:I

.field mSumCrossSizeBefore:I

.field mTop:I

.field mTotalFlexGrow:F

.field mTotalFlexShrink:F


# direct methods
.method constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const v0, 0x7fffffff

    iput v0, p0, Lcom/google/android/flexbox/FlexLine;->mLeft:I

    iput v0, p0, Lcom/google/android/flexbox/FlexLine;->mTop:I

    const/high16 v0, -0x80000000

    iput v0, p0, Lcom/google/android/flexbox/FlexLine;->mRight:I

    iput v0, p0, Lcom/google/android/flexbox/FlexLine;->mBottom:I

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/android/flexbox/FlexLine;->mIndicesAlignSelfStretch:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public getCrossSize()I
    .locals 1

    iget v0, p0, Lcom/google/android/flexbox/FlexLine;->mCrossSize:I

    return v0
.end method

.method public getItemCount()I
    .locals 1

    iget v0, p0, Lcom/google/android/flexbox/FlexLine;->mItemCount:I

    return v0
.end method

.method public getItemCountNotGone()I
    .locals 2

    iget v0, p0, Lcom/google/android/flexbox/FlexLine;->mItemCount:I

    iget v1, p0, Lcom/google/android/flexbox/FlexLine;->mGoneItemCount:I

    sub-int/2addr v0, v1

    return v0
.end method
