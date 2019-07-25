.class public Lcom/miui/gallery/ui/BabyAlbumDetailFragment$MyOnScrollListener;
.super Ljava/lang/Object;
.source "BabyAlbumDetailFragment.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/BabyAlbumDetailFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "MyOnScrollListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/BabyAlbumDetailFragment;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/BabyAlbumDetailFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$MyOnScrollListener;->this$0:Lcom/miui/gallery/ui/BabyAlbumDetailFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onScroll(Landroid/widget/AbsListView;III)V
    .locals 2

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-lez p3, :cond_0

    if-nez p2, :cond_0

    invoke-virtual {p1, p2}, Landroid/widget/AbsListView;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result p1

    if-ltz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$MyOnScrollListener;->this$0:Lcom/miui/gallery/ui/BabyAlbumDetailFragment;

    invoke-static {p1, v0}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->access$502(Lcom/miui/gallery/ui/BabyAlbumDetailFragment;Z)Z

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$MyOnScrollListener;->this$0:Lcom/miui/gallery/ui/BabyAlbumDetailFragment;

    invoke-static {p1, v1}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->access$502(Lcom/miui/gallery/ui/BabyAlbumDetailFragment;Z)Z

    :goto_0
    if-lez p2, :cond_1

    add-int/2addr p2, p3

    if-ne p2, p4, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$MyOnScrollListener;->this$0:Lcom/miui/gallery/ui/BabyAlbumDetailFragment;

    invoke-static {p1, v0}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->access$402(Lcom/miui/gallery/ui/BabyAlbumDetailFragment;Z)Z

    goto :goto_1

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailFragment$MyOnScrollListener;->this$0:Lcom/miui/gallery/ui/BabyAlbumDetailFragment;

    invoke-static {p1, v1}, Lcom/miui/gallery/ui/BabyAlbumDetailFragment;->access$402(Lcom/miui/gallery/ui/BabyAlbumDetailFragment;Z)Z

    :goto_1
    return-void
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 0

    return-void
.end method
