.class public abstract Lcom/miui/gallery/search/core/display/QuickAdapterBase$InnerDiffCallback;
.super Landroid/support/v7/util/DiffUtil$Callback;
.source "QuickAdapterBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/search/core/display/QuickAdapterBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40c
    name = "InnerDiffCallback"
.end annotation


# direct methods
.method protected constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/support/v7/util/DiffUtil$Callback;-><init>()V

    return-void
.end method


# virtual methods
.method public areItemsTheSame(II)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public getNewListSize()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getOldListSize()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
