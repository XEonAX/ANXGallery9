.class Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$2;
.super Ljava/lang/Object;
.source "FilterFragment.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyDownloadStateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic lambda$onFinish$91(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$2;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$500(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Lcom/miui/gallery/editor/photo/core/imports/filter/FilterCategoryData;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterCategoryData;->setDownloadState(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$400(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$600(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;->notifyItemChanged(I)V

    return-void
.end method


# virtual methods
.method public onDownloadStart(I)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$500(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Lcom/miui/gallery/editor/photo/core/imports/filter/FilterCategoryData;

    move-result-object p1

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterCategoryData;->setDownloadState(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$400(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$600(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;->notifyItemChanged(I)V

    return-void
.end method

.method public onDownloading(II)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$500(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Lcom/miui/gallery/editor/photo/core/imports/filter/FilterCategoryData;

    move-result-object p1

    int-to-float p2, p2

    const/high16 v0, 0x42c80000    # 100.0f

    div-float/2addr p2, v0

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterCategoryData;->setDownloadPercent(F)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$400(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$600(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;->notifyItemChanged(I)V

    return-void
.end method

.method public onFinish(IZI)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyCheckHelper;->isSkyAvailable()Z

    move-result p1

    const/4 p2, 0x1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$700(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$200(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$300(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Landroid/support/v4/view/ViewPager;

    move-result-object p1

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {p3}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$600(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)I

    move-result p3

    invoke-virtual {p1, p3, p2}, Landroid/support/v4/view/ViewPager;->setCurrentItem(IZ)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$400(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$600(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;->setSelectedItemPosition(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$202(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;Z)Z

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$500(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Lcom/miui/gallery/editor/photo/core/imports/filter/FilterCategoryData;

    move-result-object p1

    const/4 p2, 0x3

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterCategoryData;->setDownloadState(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$400(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$600(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;->notifyItemChanged(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    const p2, 0x7f1003f1

    invoke-static {p1, p2}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$300(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Landroid/support/v4/view/ViewPager;

    move-result-object p1

    new-instance p2, Lcom/miui/gallery/editor/photo/app/filter/-$$Lambda$FilterFragment$2$xKK78Q6083My69j2MNFafoTzpag;

    invoke-direct {p2, p0}, Lcom/miui/gallery/editor/photo/app/filter/-$$Lambda$FilterFragment$2$xKK78Q6083My69j2MNFafoTzpag;-><init>(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$2;)V

    const-wide/16 v0, 0x3e8

    invoke-virtual {p1, p2, v0, v1}, Landroid/support/v4/view/ViewPager;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$500(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Lcom/miui/gallery/editor/photo/core/imports/filter/FilterCategoryData;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/filter/FilterCategoryData;->setDownloadState(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$400(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->access$600(Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;)I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;->notifyItemChanged(I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment$2;->this$0:Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/app/filter/FilterFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    const p2, 0x7f1003f0

    invoke-static {p1, p2}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    :goto_0
    return-void
.end method
