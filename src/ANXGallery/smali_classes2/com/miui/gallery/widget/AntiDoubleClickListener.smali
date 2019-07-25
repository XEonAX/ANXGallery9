.class public abstract Lcom/miui/gallery/widget/AntiDoubleClickListener;
.super Ljava/lang/Object;
.source "AntiDoubleClickListener.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private mLastClickTimeMillis:J

.field private mMinClickInterval:I


# direct methods
.method public constructor <init>()V
    .locals 1

    const/16 v0, 0x258

    invoke-direct {p0, v0}, Lcom/miui/gallery/widget/AntiDoubleClickListener;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/miui/gallery/widget/AntiDoubleClickListener;->mMinClickInterval:I

    return-void
.end method


# virtual methods
.method public abstract onAntiDoubleClick(Landroid/view/View;)V
.end method

.method public onClick(Landroid/view/View;)V
    .locals 5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/miui/gallery/widget/AntiDoubleClickListener;->mLastClickTimeMillis:J

    sub-long/2addr v0, v2

    iget v2, p0, Lcom/miui/gallery/widget/AntiDoubleClickListener;->mMinClickInterval:I

    int-to-long v2, v2

    cmp-long v4, v0, v2

    if-gez v4, :cond_0

    return-void

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/widget/AntiDoubleClickListener;->mLastClickTimeMillis:J

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/AntiDoubleClickListener;->onAntiDoubleClick(Landroid/view/View;)V

    return-void
.end method
