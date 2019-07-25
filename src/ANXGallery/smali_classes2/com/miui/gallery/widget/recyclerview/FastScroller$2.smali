.class Lcom/miui/gallery/widget/recyclerview/FastScroller$2;
.super Landroid/support/v7/widget/RecyclerView$OnScrollListener;
.source "FastScroller.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/widget/recyclerview/FastScroller;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/widget/recyclerview/FastScroller;


# direct methods
.method constructor <init>(Lcom/miui/gallery/widget/recyclerview/FastScroller;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller$2;->this$0:Lcom/miui/gallery/widget/recyclerview/FastScroller;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onScrolled(Landroid/support/v7/widget/RecyclerView;II)V
    .locals 0

    iget-object p2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller$2;->this$0:Lcom/miui/gallery/widget/recyclerview/FastScroller;

    invoke-virtual {p2}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->isDragging()Z

    move-result p2

    if-nez p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller$2;->this$0:Lcom/miui/gallery/widget/recyclerview/FastScroller;

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->computeHorizontalScrollOffset()I

    move-result p3

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->computeVerticalScrollOffset()I

    move-result p1

    invoke-virtual {p2, p3, p1}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->updateThumbPositionByScrolling(II)V

    :cond_0
    return-void
.end method
