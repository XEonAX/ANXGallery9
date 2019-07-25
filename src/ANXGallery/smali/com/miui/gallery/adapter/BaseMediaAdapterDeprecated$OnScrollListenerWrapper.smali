.class Lcom/miui/gallery/adapter/BaseMediaAdapterDeprecated$OnScrollListenerWrapper;
.super Ljava/lang/Object;
.source "BaseMediaAdapterDeprecated.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/adapter/BaseMediaAdapterDeprecated;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "OnScrollListenerWrapper"
.end annotation


# instance fields
.field private final mWrapped:Landroid/widget/AbsListView$OnScrollListener;


# direct methods
.method public constructor <init>(Landroid/widget/AbsListView$OnScrollListener;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/adapter/BaseMediaAdapterDeprecated$OnScrollListenerWrapper;->mWrapped:Landroid/widget/AbsListView$OnScrollListener;

    return-void
.end method


# virtual methods
.method public onScroll(Landroid/widget/AbsListView;III)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/BaseMediaAdapterDeprecated$OnScrollListenerWrapper;->mWrapped:Landroid/widget/AbsListView$OnScrollListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/BaseMediaAdapterDeprecated$OnScrollListenerWrapper;->mWrapped:Landroid/widget/AbsListView$OnScrollListener;

    invoke-interface {v0, p1, p2, p3, p4}, Landroid/widget/AbsListView$OnScrollListener;->onScroll(Landroid/widget/AbsListView;III)V

    :cond_0
    return-void
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/BaseMediaAdapterDeprecated$OnScrollListenerWrapper;->mWrapped:Landroid/widget/AbsListView$OnScrollListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/BaseMediaAdapterDeprecated$OnScrollListenerWrapper;->mWrapped:Landroid/widget/AbsListView$OnScrollListener;

    invoke-interface {v0, p1, p2}, Landroid/widget/AbsListView$OnScrollListener;->onScrollStateChanged(Landroid/widget/AbsListView;I)V

    :cond_0
    return-void
.end method
