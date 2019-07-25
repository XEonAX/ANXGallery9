.class public Lcom/miui/gallery/widget/MultiClickListener;
.super Ljava/lang/Object;
.source "MultiClickListener.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private mClickCount:I

.field private mDuration:J

.field private mLastClickTime:J

.field private mMaxClickCount:I

.field private mOnClickListener:Landroid/view/View$OnClickListener;


# direct methods
.method public constructor <init>(ILandroid/view/View$OnClickListener;)V
    .locals 2

    const-wide/16 v0, 0x1f4

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/miui/gallery/widget/MultiClickListener;-><init>(JILandroid/view/View$OnClickListener;)V

    return-void
.end method

.method public constructor <init>(JILandroid/view/View$OnClickListener;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcom/miui/gallery/widget/MultiClickListener;->mDuration:J

    iput p3, p0, Lcom/miui/gallery/widget/MultiClickListener;->mMaxClickCount:I

    iput-object p4, p0, Lcom/miui/gallery/widget/MultiClickListener;->mOnClickListener:Landroid/view/View$OnClickListener;

    return-void
.end method

.method private callClick(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/MultiClickListener;->mOnClickListener:Landroid/view/View$OnClickListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/MultiClickListener;->mOnClickListener:Landroid/view/View$OnClickListener;

    invoke-interface {v0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 8

    iget v0, p0, Lcom/miui/gallery/widget/MultiClickListener;->mMaxClickCount:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/MultiClickListener;->callClick(Landroid/view/View;)V

    return-void

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/miui/gallery/widget/MultiClickListener;->mLastClickTime:J

    sub-long v4, v2, v4

    iget-wide v6, p0, Lcom/miui/gallery/widget/MultiClickListener;->mDuration:J

    cmp-long v0, v4, v6

    const/4 v4, 0x0

    if-lez v0, :cond_1

    iput v4, p0, Lcom/miui/gallery/widget/MultiClickListener;->mClickCount:I

    :cond_1
    iput-wide v2, p0, Lcom/miui/gallery/widget/MultiClickListener;->mLastClickTime:J

    iget v0, p0, Lcom/miui/gallery/widget/MultiClickListener;->mClickCount:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/miui/gallery/widget/MultiClickListener;->mClickCount:I

    iget v0, p0, Lcom/miui/gallery/widget/MultiClickListener;->mClickCount:I

    iget v1, p0, Lcom/miui/gallery/widget/MultiClickListener;->mMaxClickCount:I

    if-lt v0, v1, :cond_2

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/miui/gallery/widget/MultiClickListener;->mLastClickTime:J

    iput v4, p0, Lcom/miui/gallery/widget/MultiClickListener;->mClickCount:I

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/MultiClickListener;->callClick(Landroid/view/View;)V

    :cond_2
    return-void
.end method
