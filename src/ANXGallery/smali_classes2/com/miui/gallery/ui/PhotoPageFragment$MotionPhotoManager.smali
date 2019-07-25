.class Lcom/miui/gallery/ui/PhotoPageFragment$MotionPhotoManager;
.super Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;
.source "PhotoPageFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MotionPhotoManager"
.end annotation


# instance fields
.field private mOperationView:Landroid/view/View;

.field private mSupported:Z

.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageFragment;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;Lcom/miui/gallery/ui/PhotoPageTopBar;)V
    .locals 2

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MotionPhotoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/ui/PhotoPageFragment$1;)V

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/extraphoto/sdk/ExtraPhotoSDK;->isDeviceSupportMotionPhoto(Landroid/content/Context;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MotionPhotoManager;->mSupported:Z

    iget-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MotionPhotoManager;->mSupported:Z

    if-eqz p1, :cond_0

    const-wide/16 v0, 0x20

    const/4 p1, 0x1

    invoke-virtual {p2, v0, v1, p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->addTypeCallback(JLcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager$Callback;I)V

    invoke-virtual {p3}, Lcom/miui/gallery/ui/PhotoPageTopBar;->getOperationView()Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MotionPhotoManager;->mOperationView:Landroid/view/View;

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MotionPhotoManager;->mOperationView:Landroid/view/View;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public getEnterDrawableId()I
    .locals 1

    const v0, 0x7f0701b6

    return v0
.end method

.method public getEnterTextId()I
    .locals 1

    const v0, 0x7f10047b

    return v0
.end method

.method protected handleEditorResult(Landroid/content/Intent;)Z
    .locals 2

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    if-nez p1, :cond_1

    return v0

    :cond_1
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    return v0

    :cond_2
    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$MotionPhotoManager;->setTargetPath(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$MotionPhotoManager;->insertAndNotifyDataSet(Ljava/lang/String;)V

    const-string p1, "motion_photo"

    const-string v0, "motion_photo_save"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x1

    return p1
.end method

.method protected onCanceled()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->onCanceled()V

    const-string v0, "motion_photo"

    const-string v1, "motion_photo_cancel"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    iget-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MotionPhotoManager;->mSupported:Z

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MotionPhotoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mPagerHelper:Lcom/miui/gallery/ui/PhotoPagerHelper;

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MotionPhotoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mPagerHelper:Lcom/miui/gallery/ui/PhotoPagerHelper;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPagerHelper;->getCurrentItem()Lcom/miui/gallery/ui/PhotoPageItem;

    move-result-object p1

    instance-of v0, p1, Lcom/miui/gallery/ui/PhotoPageImageItem;

    if-eqz v0, :cond_1

    check-cast p1, Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageImageItem;->onActionBarOperationClick()V

    :cond_1
    return-void

    :cond_2
    :goto_0
    return-void
.end method

.method public onDestroy()V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$MotionPhotoManager;->release()V

    return-void
.end method

.method public onEnterClick(Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MotionPhotoManager;->mSupported:Z

    if-eqz v0, :cond_1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MotionPhotoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MotionPhotoManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/IntentUtil;->startMotionPhotoAction(Lcom/miui/gallery/model/BaseDataItem;Landroid/app/Activity;Lcom/miui/gallery/ui/PhotoPageFragment;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$MotionPhotoManager;->onStartEditor()V

    const-string p1, "motion_photo"

    const-string v0, "motion_photo_enter"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method public onRecognized(Lcom/miui/gallery/model/BaseDataItem;Z)V
    .locals 0

    iget-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MotionPhotoManager;->mSupported:Z

    if-nez p1, :cond_0

    return-void

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$MotionPhotoManager;->mOperationView:Landroid/view/View;

    if-eqz p2, :cond_1

    const/4 p2, 0x0

    goto :goto_0

    :cond_1
    const/16 p2, 0x8

    :goto_0
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method
