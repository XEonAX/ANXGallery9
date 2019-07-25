.class public abstract Lcom/miui/gallery/listener/SingleClickListener;
.super Ljava/lang/Object;
.source "SingleClickListener.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private mId:I

.field private mLastClickTime:J


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/miui/gallery/listener/SingleClickListener;->mLastClickTime:J

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/listener/SingleClickListener;->mId:I

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 7

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v2

    iget v3, p0, Lcom/miui/gallery/listener/SingleClickListener;->mId:I

    if-eq v3, v2, :cond_0

    iput v2, p0, Lcom/miui/gallery/listener/SingleClickListener;->mId:I

    iput-wide v0, p0, Lcom/miui/gallery/listener/SingleClickListener;->mLastClickTime:J

    invoke-virtual {p0, p1}, Lcom/miui/gallery/listener/SingleClickListener;->onSingleClick(Landroid/view/View;)V

    return-void

    :cond_0
    iget-wide v2, p0, Lcom/miui/gallery/listener/SingleClickListener;->mLastClickTime:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x3e8

    cmp-long v6, v2, v4

    if-lez v6, :cond_1

    iput-wide v0, p0, Lcom/miui/gallery/listener/SingleClickListener;->mLastClickTime:J

    invoke-virtual {p0, p1}, Lcom/miui/gallery/listener/SingleClickListener;->onSingleClick(Landroid/view/View;)V

    :cond_1
    return-void
.end method

.method protected abstract onSingleClick(Landroid/view/View;)V
.end method
