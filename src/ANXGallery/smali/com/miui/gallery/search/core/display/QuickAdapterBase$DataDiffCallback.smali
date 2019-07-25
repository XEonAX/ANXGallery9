.class Lcom/miui/gallery/search/core/display/QuickAdapterBase$DataDiffCallback;
.super Landroid/support/v7/util/DiffUtil$Callback;
.source "QuickAdapterBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/search/core/display/QuickAdapterBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DataDiffCallback"
.end annotation


# instance fields
.field mInnerDiffCallback:Landroid/support/v7/util/DiffUtil$Callback;

.field mNewTypeList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field mOldTypeList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/ArrayList;Ljava/util/ArrayList;Landroid/support/v7/util/DiffUtil$Callback;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;",
            "Landroid/support/v7/util/DiffUtil$Callback;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Landroid/support/v7/util/DiffUtil$Callback;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase$DataDiffCallback;->mOldTypeList:Ljava/util/ArrayList;

    iput-object p2, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase$DataDiffCallback;->mNewTypeList:Ljava/util/ArrayList;

    iput-object p3, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase$DataDiffCallback;->mInnerDiffCallback:Landroid/support/v7/util/DiffUtil$Callback;

    return-void
.end method

.method private getItemStartPosition(Ljava/util/ArrayList;)I
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;)I"
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x1

    if-eq v2, v3, :cond_0

    return v1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return v0
.end method


# virtual methods
.method public areContentsTheSame(II)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase$DataDiffCallback;->mOldTypeList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0x10

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase$DataDiffCallback;->mNewTypeList:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase$DataDiffCallback;->mInnerDiffCallback:Landroid/support/v7/util/DiffUtil$Callback;

    iget-object v1, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase$DataDiffCallback;->mOldTypeList:Ljava/util/ArrayList;

    invoke-direct {p0, v1}, Lcom/miui/gallery/search/core/display/QuickAdapterBase$DataDiffCallback;->getItemStartPosition(Ljava/util/ArrayList;)I

    move-result v1

    sub-int/2addr p1, v1

    iget-object v1, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase$DataDiffCallback;->mNewTypeList:Ljava/util/ArrayList;

    invoke-direct {p0, v1}, Lcom/miui/gallery/search/core/display/QuickAdapterBase$DataDiffCallback;->getItemStartPosition(Ljava/util/ArrayList;)I

    move-result v1

    sub-int/2addr p2, v1

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/util/DiffUtil$Callback;->areContentsTheSame(II)Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public areItemsTheSame(II)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase$DataDiffCallback;->mOldTypeList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase$DataDiffCallback;->mNewTypeList:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public getNewListSize()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase$DataDiffCallback;->mNewTypeList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getOldListSize()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase$DataDiffCallback;->mOldTypeList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method
