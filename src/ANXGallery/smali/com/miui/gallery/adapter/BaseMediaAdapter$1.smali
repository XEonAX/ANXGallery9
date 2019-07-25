.class Lcom/miui/gallery/adapter/BaseMediaAdapter$1;
.super Lcom/miui/gallery/adapter/BaseMediaAdapter$OnScrollListenerWrapper;
.source "BaseMediaAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/adapter/BaseMediaAdapter;->generateWrapScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)Landroid/support/v7/widget/RecyclerView$OnScrollListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/adapter/BaseMediaAdapter;


# direct methods
.method constructor <init>(Lcom/miui/gallery/adapter/BaseMediaAdapter;Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/adapter/BaseMediaAdapter$1;->this$0:Lcom/miui/gallery/adapter/BaseMediaAdapter;

    invoke-direct {p0, p2}, Lcom/miui/gallery/adapter/BaseMediaAdapter$OnScrollListenerWrapper;-><init>(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroid/support/v7/widget/RecyclerView;I)V
    .locals 1

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/adapter/BaseMediaAdapter$OnScrollListenerWrapper;->onScrollStateChanged(Landroid/support/v7/widget/RecyclerView;I)V

    iget-object v0, p0, Lcom/miui/gallery/adapter/BaseMediaAdapter$1;->this$0:Lcom/miui/gallery/adapter/BaseMediaAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/adapter/BaseMediaAdapter;->onViewScrollStateChanged(Landroid/support/v7/widget/RecyclerView;I)V

    return-void
.end method

.method public onScrolled(Landroid/support/v7/widget/RecyclerView;II)V
    .locals 1

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/adapter/BaseMediaAdapter$OnScrollListenerWrapper;->onScrolled(Landroid/support/v7/widget/RecyclerView;II)V

    iget-object v0, p0, Lcom/miui/gallery/adapter/BaseMediaAdapter$1;->this$0:Lcom/miui/gallery/adapter/BaseMediaAdapter;

    invoke-virtual {v0, p1, p2, p3}, Lcom/miui/gallery/adapter/BaseMediaAdapter;->onViewScrolled(Landroid/support/v7/widget/RecyclerView;II)V

    return-void
.end method
