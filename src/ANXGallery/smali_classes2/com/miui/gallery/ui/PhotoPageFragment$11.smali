.class Lcom/miui/gallery/ui/PhotoPageFragment$11;
.super Lcom/miui/gallery/util/uil/CloudImageLoadingListenerAdapter;
.source "PhotoPageFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$11;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-direct {p0}, Lcom/miui/gallery/util/uil/CloudImageLoadingListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onDownloadComplete(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/view/View;Ljava/lang/String;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$11;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/miui/gallery/util/uil/CloudImageLoader;->getInstance()Lcom/miui/gallery/util/uil/CloudImageLoader;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/util/uil/CloudImageLoader;->isOrigin(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result p1

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$11;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2100(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$11;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2100(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2, p2}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->refreshDownloadItem(ZZ)V

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$11;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$11;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p2, p2, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {p2}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataItem(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$11;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2200(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    move-result-object p2

    if-eqz p2, :cond_2

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$11;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2200(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->settleItem(Lcom/miui/gallery/model/BaseDataItem;)V

    :cond_2
    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$11;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2300(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;

    move-result-object p2

    if-eqz p2, :cond_3

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$11;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2300(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->updateItem(Lcom/miui/gallery/model/BaseDataItem;)V

    :cond_3
    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$11;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2400(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager;

    move-result-object p2

    if-eqz p2, :cond_4

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$11;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2400(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$NFCManager;->settleItem(Lcom/miui/gallery/model/BaseDataItem;)V

    :cond_4
    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$11;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2500(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;

    move-result-object p2

    if-eqz p2, :cond_5

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$11;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2500(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->updateItem(Lcom/miui/gallery/model/BaseDataItem;)V

    :cond_5
    return-void
.end method

.method public onLoadingCancelled(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/view/View;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$11;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/miui/gallery/util/uil/CloudImageLoader;->getInstance()Lcom/miui/gallery/util/uil/CloudImageLoader;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/util/uil/CloudImageLoader;->isOrigin(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$11;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2100(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$11;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2100(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;

    move-result-object p1

    const/4 p2, 0x1

    invoke-virtual {p1, p2, p2}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->refreshDownloadItem(ZZ)V

    :cond_1
    return-void
.end method

.method public onLoadingFailed(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/view/View;Lcom/miui/gallery/error/core/ErrorCode;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$11;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/miui/gallery/util/uil/CloudImageLoader;->getInstance()Lcom/miui/gallery/util/uil/CloudImageLoader;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/util/uil/CloudImageLoader;->isOrigin(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$11;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2100(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$11;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2100(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;

    move-result-object p1

    const/4 p2, 0x1

    invoke-virtual {p1, p2, p2}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->refreshDownloadItem(ZZ)V

    :cond_1
    return-void
.end method

.method public onLoadingStarted(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/view/View;)V
    .locals 0

    invoke-static {}, Lcom/miui/gallery/util/uil/CloudImageLoader;->getInstance()Lcom/miui/gallery/util/uil/CloudImageLoader;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/util/uil/CloudImageLoader;->isOrigin(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$11;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2100(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$11;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2100(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;

    move-result-object p1

    const/4 p2, 0x1

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->refreshDownloadItem(ZZ)V

    :cond_0
    return-void
.end method
