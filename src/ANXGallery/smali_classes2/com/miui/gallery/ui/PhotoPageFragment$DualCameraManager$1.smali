.class Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager$1;
.super Ljava/lang/Object;
.source "PhotoPageFragment.java"

# interfaces
.implements Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$StartCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->resume()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onStarted(Z)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->isDualCamera()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->access$5600(Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->tryChangeStereoBtnVisible(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getDataItem(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object v0

    if-eqz p1, :cond_0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/FileMimeUtil;->getMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/FileMimeUtil;->isImageFromMimeType(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager$1;->this$1:Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment$DualCameraManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mPagerHelper:Lcom/miui/gallery/ui/PhotoPagerHelper;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPagerHelper;->onStart()V

    :cond_0
    return-void
.end method
