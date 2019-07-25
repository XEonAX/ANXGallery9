.class public abstract Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$BaseHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "BaseAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "BaseHolder"
.end annotation


# instance fields
.field protected mSelected:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    const v0, 0x7f09018a

    invoke-virtual {p1, v0, p0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    const v0, 0x7f090193

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$BaseHolder;->mSelected:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public abstract bindView(I)V
.end method

.method public bindView(ILjava/lang/Object;)V
    .locals 0

    return-void
.end method
