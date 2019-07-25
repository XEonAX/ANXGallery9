.class public abstract Lcom/miui/gallery/widget/AntiDoubleItemClickListener;
.super Ljava/lang/Object;
.source "AntiDoubleItemClickListener.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# instance fields
.field private mLastClickTimeMillis:J

.field private mMinClickInterval:I


# direct methods
.method public constructor <init>()V
    .locals 1

    const/16 v0, 0x258

    invoke-direct {p0, v0}, Lcom/miui/gallery/widget/AntiDoubleItemClickListener;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/miui/gallery/widget/AntiDoubleItemClickListener;->mMinClickInterval:I

    return-void
.end method


# virtual methods
.method public abstract onAntiDoubleItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/miui/gallery/widget/AntiDoubleItemClickListener;->mLastClickTimeMillis:J

    sub-long/2addr v0, v2

    iget v2, p0, Lcom/miui/gallery/widget/AntiDoubleItemClickListener;->mMinClickInterval:I

    int-to-long v2, v2

    cmp-long v4, v0, v2

    if-gez v4, :cond_0

    const-string p1, "DoubleClick"

    const-string p2, "On filtered click event"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/widget/AntiDoubleItemClickListener;->mLastClickTimeMillis:J

    invoke-virtual/range {p0 .. p5}, Lcom/miui/gallery/widget/AntiDoubleItemClickListener;->onAntiDoubleItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    return-void
.end method
