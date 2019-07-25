.class Lcom/miui/gallery/ui/SimilarPhotoPickFragment$5;
.super Ljava/lang/Object;
.source "SimilarPhotoPickFragment.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/SimilarPhotoPickFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/SimilarPhotoPickFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$5;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onScroll(Landroid/widget/AbsListView;III)V
    .locals 0

    return-void
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$5;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    if-nez p1, :cond_0

    return-void

    :cond_0
    if-nez p2, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$5;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment;->access$1002(Lcom/miui/gallery/ui/SimilarPhotoPickFragment;Z)Z

    iget-object p1, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$5;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment;->access$1100(Lcom/miui/gallery/ui/SimilarPhotoPickFragment;)Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$5;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment;->access$1200(Lcom/miui/gallery/ui/SimilarPhotoPickFragment;)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/SimilarPhotoPickFragment$5;->this$0:Lcom/miui/gallery/ui/SimilarPhotoPickFragment;

    const/4 p2, 0x1

    invoke-static {p1, p2}, Lcom/miui/gallery/ui/SimilarPhotoPickFragment;->access$1002(Lcom/miui/gallery/ui/SimilarPhotoPickFragment;Z)Z

    :cond_2
    :goto_0
    return-void
.end method
