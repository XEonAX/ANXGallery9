.class Lcom/miui/gallery/ui/PhotoPageFragment$RefocusManager;
.super Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;
.source "PhotoPageFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RefocusManager"
.end annotation


# instance fields
.field private mRefocusSupport:Z

.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageFragment;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;)V
    .locals 2

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$RefocusManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment;Lcom/miui/gallery/ui/PhotoPageFragment$1;)V

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/extraphoto/sdk/ExtraPhotoSDK;->isDeviceSupportRefocus(Landroid/content/Context;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$RefocusManager;->mRefocusSupport:Z

    iget-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$RefocusManager;->mRefocusSupport:Z

    if-eqz p1, :cond_0

    const-wide/16 v0, 0x1

    const/4 p1, 0x1

    invoke-virtual {p2, v0, v1, p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->addTypeCallback(JLcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager$Callback;I)V

    :cond_0
    return-void
.end method


# virtual methods
.method public getEnterDrawableId()I
    .locals 1

    const v0, 0x7f070042

    return v0
.end method

.method public getEnterTextId()I
    .locals 1

    const v0, 0x7f1000c4

    return v0
.end method

.method protected handleEditorResult(Landroid/content/Intent;)Z
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    if-nez v1, :cond_1

    return v0

    :cond_1
    invoke-virtual {v1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2

    return v0

    :cond_2
    invoke-static {p1}, Lcom/miui/extraphoto/sdk/ExtraPhotoSDK;->sendResultStatic(Landroid/content/Intent;)V

    invoke-virtual {p0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$RefocusManager;->setTargetPath(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$RefocusManager;->insertAndNotifyDataSet(Ljava/lang/String;)V

    const/4 p1, 0x1

    return p1
.end method

.method public onEnterClick(Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$RefocusManager;->mRefocusSupport:Z

    if-eqz v0, :cond_1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$RefocusManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$RefocusManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/IntentUtil;->startAdvancedRefocusAction(Lcom/miui/gallery/model/BaseDataItem;Landroid/app/Activity;Lcom/miui/gallery/ui/PhotoPageFragment;)V

    invoke-static {}, Lcom/miui/extraphoto/sdk/ExtraPhotoSDK;->sendEnterStatic()V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$RefocusManager;->onStartEditor()V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method public onRecognized(Lcom/miui/gallery/model/BaseDataItem;Z)V
    .locals 0

    iget-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$RefocusManager;->mRefocusSupport:Z

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    invoke-static {}, Lcom/miui/extraphoto/sdk/ExtraPhotoSDK;->sendExposureStatic()V

    :cond_0
    return-void
.end method

.method public release()V
    .locals 0

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$TransitionEditorManager;->release()V

    return-void
.end method
