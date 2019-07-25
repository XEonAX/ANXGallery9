.class Lcom/miui/gallery/projection/SlidingWindow;
.super Ljava/lang/Object;
.source "ConnectController.java"


# instance fields
.field private mCurrentIndex:I

.field private mCurrentIndexChanged:Z

.field private mEndIndex:I

.field private mFiles:[Ljava/lang/String;

.field private mMediaSet:Lcom/miui/gallery/model/BaseDataSet;

.field private mStartIndex:I

.field private mTotalCount:I


# direct methods
.method constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x97

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/miui/gallery/projection/SlidingWindow;->mFiles:[Ljava/lang/String;

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/projection/SlidingWindow;->mCurrentIndex:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/projection/SlidingWindow;->mCurrentIndexChanged:Z

    return-void
.end method

.method private doSlideWindow(I)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/projection/SlidingWindow;->mMediaSet:Lcom/miui/gallery/model/BaseDataSet;

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/projection/SlidingWindow;->reset()V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/projection/SlidingWindow;->mMediaSet:Lcom/miui/gallery/model/BaseDataSet;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataSet;->getCount()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/projection/SlidingWindow;->mTotalCount:I

    iget v0, p0, Lcom/miui/gallery/projection/SlidingWindow;->mTotalCount:I

    if-gtz v0, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/projection/SlidingWindow;->reset()V

    return-void

    :cond_1
    add-int/lit8 v0, p1, -0x4b

    const/4 v1, 0x0

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/projection/SlidingWindow;->mStartIndex:I

    add-int/lit8 p1, p1, 0x4b

    add-int/lit8 p1, p1, 0x1

    iget v0, p0, Lcom/miui/gallery/projection/SlidingWindow;->mTotalCount:I

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/projection/SlidingWindow;->mEndIndex:I

    iget p1, p0, Lcom/miui/gallery/projection/SlidingWindow;->mStartIndex:I

    :goto_0
    iget v0, p0, Lcom/miui/gallery/projection/SlidingWindow;->mEndIndex:I

    if-ge p1, v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/projection/SlidingWindow;->mMediaSet:Lcom/miui/gallery/model/BaseDataSet;

    const/4 v2, 0x0

    invoke-virtual {v0, v2, p1}, Lcom/miui/gallery/model/BaseDataSet;->getItem(Lcom/miui/gallery/model/BaseDataItem;I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getPathDisplayBetter()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    iget-object v2, p0, Lcom/miui/gallery/projection/SlidingWindow;->mFiles:[Ljava/lang/String;

    aput-object v0, v2, v1

    add-int/lit8 v1, v1, 0x1

    :cond_2
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_3
    const-string p1, "SlidingWindow"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "slideWindow, mStartIndex="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/miui/gallery/projection/SlidingWindow;->mStartIndex:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mEndIndex="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/miui/gallery/projection/SlidingWindow;->mEndIndex:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private indexOf(Ljava/lang/String;)I
    .locals 5

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/projection/SlidingWindow;->mFiles:[Ljava/lang/String;

    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v4, v0, v2

    if-eqz v4, :cond_0

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    return v3

    :cond_0
    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method private isWindowDirty(I)Z
    .locals 3

    iget v0, p0, Lcom/miui/gallery/projection/SlidingWindow;->mStartIndex:I

    const/16 v1, 0x32

    if-lez v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/projection/SlidingWindow;->mStartIndex:I

    sub-int v0, p1, v0

    if-lt v0, v1, :cond_1

    :cond_0
    iget v0, p0, Lcom/miui/gallery/projection/SlidingWindow;->mEndIndex:I

    iget v2, p0, Lcom/miui/gallery/projection/SlidingWindow;->mTotalCount:I

    if-ge v0, v2, :cond_2

    iget v0, p0, Lcom/miui/gallery/projection/SlidingWindow;->mEndIndex:I

    sub-int/2addr v0, p1

    if-ge v0, v1, :cond_2

    :cond_1
    const/4 p1, 0x1

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private reset()V
    .locals 3

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/projection/SlidingWindow;->mStartIndex:I

    iput v0, p0, Lcom/miui/gallery/projection/SlidingWindow;->mEndIndex:I

    iget-object v1, p0, Lcom/miui/gallery/projection/SlidingWindow;->mFiles:[Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    iput v0, p0, Lcom/miui/gallery/projection/SlidingWindow;->mCurrentIndex:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/projection/SlidingWindow;->mCurrentIndexChanged:Z

    return-void
.end method

.method private slideWindowTo(I)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/projection/SlidingWindow;->mMediaSet:Lcom/miui/gallery/model/BaseDataSet;

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/projection/SlidingWindow;->reset()V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/projection/SlidingWindow;->mMediaSet:Lcom/miui/gallery/model/BaseDataSet;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataSet;->getCount()I

    move-result v0

    if-gtz v0, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/projection/SlidingWindow;->reset()V

    return-void

    :cond_1
    if-gez p1, :cond_2

    const/4 p1, 0x0

    goto :goto_0

    :cond_2
    if-lt p1, v0, :cond_3

    add-int/lit8 p1, v0, -0x1

    :cond_3
    :goto_0
    iget v1, p0, Lcom/miui/gallery/projection/SlidingWindow;->mStartIndex:I

    iget v2, p0, Lcom/miui/gallery/projection/SlidingWindow;->mEndIndex:I

    if-eq v1, v2, :cond_4

    iget v1, p0, Lcom/miui/gallery/projection/SlidingWindow;->mTotalCount:I

    if-ne v0, v1, :cond_4

    iget v0, p0, Lcom/miui/gallery/projection/SlidingWindow;->mTotalCount:I

    iget v1, p0, Lcom/miui/gallery/projection/SlidingWindow;->mEndIndex:I

    iget v2, p0, Lcom/miui/gallery/projection/SlidingWindow;->mStartIndex:I

    sub-int/2addr v1, v2

    if-le v0, v1, :cond_5

    invoke-direct {p0, p1}, Lcom/miui/gallery/projection/SlidingWindow;->isWindowDirty(I)Z

    move-result v0

    if-eqz v0, :cond_5

    :cond_4
    invoke-direct {p0, p1}, Lcom/miui/gallery/projection/SlidingWindow;->doSlideWindow(I)V

    :cond_5
    return-void
.end method


# virtual methods
.method public declared-synchronized getNext(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 6

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/miui/gallery/projection/SlidingWindow;->mCurrentIndexChanged:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iput-boolean v1, p0, Lcom/miui/gallery/projection/SlidingWindow;->mCurrentIndexChanged:Z

    iget v0, p0, Lcom/miui/gallery/projection/SlidingWindow;->mCurrentIndex:I

    invoke-direct {p0, v0}, Lcom/miui/gallery/projection/SlidingWindow;->slideWindowTo(I)V

    :cond_0
    iget v0, p0, Lcom/miui/gallery/projection/SlidingWindow;->mTotalCount:I

    const/4 v2, 0x0

    if-lez v0, :cond_8

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_2

    :cond_1
    invoke-direct {p0, p1}, Lcom/miui/gallery/projection/SlidingWindow;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v3, -0x1

    if-ne v0, v3, :cond_2

    iget p1, p0, Lcom/miui/gallery/projection/SlidingWindow;->mCurrentIndex:I

    iget v0, p0, Lcom/miui/gallery/projection/SlidingWindow;->mStartIndex:I

    sub-int v0, p1, v0

    goto :goto_0

    :cond_2
    iget v4, p0, Lcom/miui/gallery/projection/SlidingWindow;->mEndIndex:I

    iget v5, p0, Lcom/miui/gallery/projection/SlidingWindow;->mStartIndex:I

    sub-int/2addr v4, v5

    add-int/lit8 v4, v4, -0x1

    if-ne v0, v4, :cond_5

    iget v0, p0, Lcom/miui/gallery/projection/SlidingWindow;->mEndIndex:I

    iget v4, p0, Lcom/miui/gallery/projection/SlidingWindow;->mTotalCount:I

    if-ge v0, v4, :cond_3

    iget v0, p0, Lcom/miui/gallery/projection/SlidingWindow;->mEndIndex:I

    add-int/lit8 v0, v0, -0x1

    invoke-direct {p0, v0}, Lcom/miui/gallery/projection/SlidingWindow;->slideWindowTo(I)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/projection/SlidingWindow;->indexOf(Ljava/lang/String;)I

    move-result v0

    goto :goto_0

    :cond_3
    if-eqz p2, :cond_4

    invoke-direct {p0, v1}, Lcom/miui/gallery/projection/SlidingWindow;->slideWindowTo(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, -0x1

    goto :goto_0

    :cond_4
    monitor-exit p0

    return-object v2

    :cond_5
    :goto_0
    add-int/lit8 p1, v0, 0x1

    if-eqz p2, :cond_6

    :try_start_1
    iget-object p2, p0, Lcom/miui/gallery/projection/SlidingWindow;->mFiles:[Ljava/lang/String;

    array-length p2, p2

    if-lt p1, p2, :cond_7

    const/4 p1, 0x0

    goto :goto_1

    :cond_6
    iget-object p2, p0, Lcom/miui/gallery/projection/SlidingWindow;->mFiles:[Ljava/lang/String;

    array-length p2, p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-lt p1, p2, :cond_7

    monitor-exit p0

    return-object v2

    :cond_7
    :goto_1
    :try_start_2
    const-string p2, "SlidingWindow"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "getNext: next="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/projection/SlidingWindow;->mFiles:[Ljava/lang/String;

    aget-object v1, v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", index="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p2, p0, Lcom/miui/gallery/projection/SlidingWindow;->mFiles:[Ljava/lang/String;

    aget-object p1, p2, p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-object p1

    :cond_8
    :goto_2
    monitor-exit p0

    return-object v2

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized getPrevious(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/miui/gallery/projection/SlidingWindow;->mCurrentIndexChanged:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/projection/SlidingWindow;->mCurrentIndexChanged:Z

    iget v0, p0, Lcom/miui/gallery/projection/SlidingWindow;->mCurrentIndex:I

    invoke-direct {p0, v0}, Lcom/miui/gallery/projection/SlidingWindow;->slideWindowTo(I)V

    :cond_0
    iget v0, p0, Lcom/miui/gallery/projection/SlidingWindow;->mTotalCount:I

    const/4 v1, 0x0

    if-lez v0, :cond_6

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    invoke-direct {p0, p1}, Lcom/miui/gallery/projection/SlidingWindow;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_2

    iget v0, p0, Lcom/miui/gallery/projection/SlidingWindow;->mStartIndex:I

    invoke-direct {p0, v0}, Lcom/miui/gallery/projection/SlidingWindow;->slideWindowTo(I)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/projection/SlidingWindow;->indexOf(Ljava/lang/String;)I

    move-result v0

    :cond_2
    const/4 p1, -0x1

    if-ne v0, p1, :cond_3

    iget p1, p0, Lcom/miui/gallery/projection/SlidingWindow;->mCurrentIndex:I

    iget v0, p0, Lcom/miui/gallery/projection/SlidingWindow;->mStartIndex:I

    sub-int v0, p1, v0

    :cond_3
    add-int/lit8 v0, v0, -0x1

    if-eqz p2, :cond_4

    if-gez v0, :cond_5

    iget-object p1, p0, Lcom/miui/gallery/projection/SlidingWindow;->mFiles:[Ljava/lang/String;

    array-length p1, p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    add-int/lit8 v0, p1, -0x1

    goto :goto_0

    :cond_4
    if-gez v0, :cond_5

    monitor-exit p0

    return-object v1

    :cond_5
    :goto_0
    :try_start_1
    const-string p1, "SlidingWindow"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "getPrevious: pre="

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/projection/SlidingWindow;->mFiles:[Ljava/lang/String;

    aget-object v1, v1, v0

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", index="

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/projection/SlidingWindow;->mFiles:[Ljava/lang/String;

    aget-object p1, p1, v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object p1

    :cond_6
    :goto_1
    monitor-exit p0

    return-object v1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized onCurrentIndexChanged(I)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/miui/gallery/projection/SlidingWindow;->mCurrentIndexChanged:Z

    iget v1, p0, Lcom/miui/gallery/projection/SlidingWindow;->mCurrentIndex:I

    if-eq v1, p1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    or-int/2addr v0, v1

    iput-boolean v0, p0, Lcom/miui/gallery/projection/SlidingWindow;->mCurrentIndexChanged:Z

    iput p1, p0, Lcom/miui/gallery/projection/SlidingWindow;->mCurrentIndex:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setMediaSet(Lcom/miui/gallery/model/BaseDataSet;)V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/projection/SlidingWindow;->mMediaSet:Lcom/miui/gallery/model/BaseDataSet;

    if-ne v0, p1, :cond_0

    if-eqz p1, :cond_3

    :cond_0
    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/projection/SlidingWindow;->mMediaSet:Lcom/miui/gallery/model/BaseDataSet;

    if-eq v0, p1, :cond_2

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/projection/SlidingWindow;->reset()V

    :cond_2
    iput-object p1, p0, Lcom/miui/gallery/projection/SlidingWindow;->mMediaSet:Lcom/miui/gallery/model/BaseDataSet;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_3
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
