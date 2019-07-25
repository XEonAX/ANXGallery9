.class Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;
.super Ljava/lang/Object;
.source "PhotoPageFragment.java"

# interfaces
.implements Landroid/os/Handler$Callback;
.implements Lcom/miui/gallery/projection/ConnectController$ConnectListener;
.implements Lcom/miui/gallery/projection/DeviceListController$OnItemClickListener;
.implements Lcom/miui/gallery/projection/RemoteControlReceiver$RemoteControlListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ProjectionManager"
.end annotation


# instance fields
.field private mConnectState:I

.field private mConnectedDeviceName:Ljava/lang/String;

.field private mCurItem:Lcom/miui/gallery/model/BaseDataItem;

.field private mHandler:Landroid/os/Handler;

.field private mRemoteController:Lcom/miui/gallery/projection/RemoteController;

.field private mWidget:Lcom/miui/gallery/projection/DeviceListController;

.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mWidget:Lcom/miui/gallery/projection/DeviceListController;

    const/4 v0, 0x1

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mConnectState:I

    const-string v0, ""

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mConnectedDeviceName:Ljava/lang/String;

    new-instance v0, Lcom/miui/gallery/projection/DeviceListController;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {v0, p1}, Lcom/miui/gallery/projection/DeviceListController;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mWidget:Lcom/miui/gallery/projection/DeviceListController;

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mWidget:Lcom/miui/gallery/projection/DeviceListController;

    invoke-virtual {p1, p0}, Lcom/miui/gallery/projection/DeviceListController;->setOnItemClickListener(Lcom/miui/gallery/projection/DeviceListController$OnItemClickListener;)V

    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, v0, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mHandler:Landroid/os/Handler;

    invoke-static {}, Lcom/miui/gallery/projection/ConnectController;->getInstance()Lcom/miui/gallery/projection/ConnectController;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/miui/gallery/projection/ConnectController;->registConnectListener(Lcom/miui/gallery/projection/ConnectController$ConnectListener;)V

    new-instance p1, Lcom/miui/gallery/projection/RemoteController;

    invoke-direct {p1, p0}, Lcom/miui/gallery/projection/RemoteController;-><init>(Lcom/miui/gallery/projection/RemoteControlReceiver$RemoteControlListener;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mRemoteController:Lcom/miui/gallery/projection/RemoteController;

    return-void
.end method

.method static synthetic access$4500(Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->projectClicked()V

    return-void
.end method

.method private isBigScreenSupported(Lcom/miui/gallery/model/BaseDataItem;)Z
    .locals 1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->isSecret()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getPathDisplayBetter()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method private projectClicked()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mWidget:Lcom/miui/gallery/projection/DeviceListController;

    invoke-virtual {v0}, Lcom/miui/gallery/projection/DeviceListController;->show()V

    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mConnectState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->switch2Local(I)V

    :cond_0
    return-void
.end method

.method private setConnectState(I)V
    .locals 3

    iput p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mConnectState:I

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mRemoteController:Lcom/miui/gallery/projection/RemoteController;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mConnectState:I

    const/4 v2, 0x3

    if-ne v1, v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/projection/RemoteController;->onConnectStateChange(Landroid/content/Context;Z)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->refreshProjectState()V

    return-void
.end method


# virtual methods
.method public disableRemoteControl()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mRemoteController:Lcom/miui/gallery/projection/RemoteController;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/projection/RemoteController;->disableDelay(Landroid/content/Context;)V

    return-void
.end method

.method public enableRemoteControl()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mRemoteController:Lcom/miui/gallery/projection/RemoteController;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/projection/RemoteController;->enable(Landroid/content/Context;)V

    return-void
.end method

.method public enterSlideShow(I)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/projection/ConnectController;->getInstance()Lcom/miui/gallery/projection/ConnectController;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1, p1}, Lcom/miui/gallery/projection/ConnectController;->showType(ZI)I

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const v1, 0x7f1005b2

    invoke-virtual {v0, v1}, Lcom/miui/gallery/activity/BaseActivity;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mRemoteController:Lcom/miui/gallery/projection/RemoteController;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/projection/RemoteController;->disable(Landroid/content/Context;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {}, Lcom/miui/gallery/projection/ConnectController;->getInstance()Lcom/miui/gallery/projection/ConnectController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/projection/ConnectController;->getCurConnectedDevice()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/ui/ProjectSlideFragment;->showProjectSlideFragment(Lcom/miui/gallery/activity/BaseActivity;Lmiui/app/Fragment;Ljava/lang/String;)V

    return-void
.end method

.method public exitSlideShow()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mCurItem:Lcom/miui/gallery/model/BaseDataItem;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->settleItem(Lcom/miui/gallery/model/BaseDataItem;I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mRemoteController:Lcom/miui/gallery/projection/RemoteController;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/projection/RemoteController;->enable(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isVisible()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mRemoteController:Lcom/miui/gallery/projection/RemoteController;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/projection/RemoteController;->disableDelay(Landroid/content/Context;)V

    :cond_0
    return-void
.end method

.method public handleMessage(Landroid/os/Message;)Z
    .locals 3

    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x2

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-virtual {p0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->switch2Local(I)V

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    invoke-static {}, Lcom/miui/gallery/projection/ConnectController;->getInstance()Lcom/miui/gallery/projection/ConnectController;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/projection/ConnectController;->connectPhotoServer(Ljava/lang/String;)I

    move-result p1

    if-nez p1, :cond_0

    invoke-static {}, Lcom/miui/gallery/projection/ConnectController;->getInstance()Lcom/miui/gallery/projection/ConnectController;

    move-result-object p1

    invoke-virtual {p1, v2, v2}, Lcom/miui/gallery/projection/ConnectController;->showType(ZI)I

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const v0, 0x7f1005ad

    invoke-static {p1, v0}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->setConnectState(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mWidget:Lcom/miui/gallery/projection/DeviceListController;

    invoke-virtual {p1}, Lcom/miui/gallery/projection/DeviceListController;->removeActive()V

    goto :goto_0

    :pswitch_2
    invoke-virtual {p0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->switch2Local(I)V

    :goto_0
    :pswitch_3
    return v2

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public isConnected()Z
    .locals 2

    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mConnectState:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public onDeviceRefresh(Ljava/util/ArrayList;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    const-string v0, "ProjectionManager"

    const-string v1, "onDeviceRefresh %s"

    invoke-static {v0, v1, p2}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mWidget:Lcom/miui/gallery/projection/DeviceListController;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/projection/DeviceListController;->refreshDevices(Ljava/util/ArrayList;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->refreshProjectState()V

    :cond_0
    if-eqz p2, :cond_1

    iget p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mConnectState:I

    const/4 p2, 0x3

    if-eq p1, p2, :cond_1

    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->setConnectState(I)V

    :cond_1
    return-void
.end method

.method public onDeviceRemoved(Ljava/lang/String;)V
    .locals 2

    const-string v0, "ProjectionManager"

    const-string v1, "onDeviceRemoved %s"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mWidget:Lcom/miui/gallery/projection/DeviceListController;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/projection/DeviceListController;->removeDevice(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->refreshProjectState()V

    :cond_0
    return-void
.end method

.method public onDevicesAdded(Ljava/lang/String;)V
    .locals 2

    const-string v0, "ProjectionManager"

    const-string v1, "onDevicesAdded %s"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mWidget:Lcom/miui/gallery/projection/DeviceListController;

    invoke-static {}, Lcom/miui/gallery/projection/ConnectController;->getInstance()Lcom/miui/gallery/projection/ConnectController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/projection/ConnectController;->getCurConnectedDevice()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/projection/DeviceListController;->addNewDevice(Ljava/lang/String;Z)V

    return-void
.end method

.method public onDevicesAvailable(Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const-string v0, "ProjectionManager"

    const-string v1, "onDevicesAvailable"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mWidget:Lcom/miui/gallery/projection/DeviceListController;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lcom/miui/gallery/projection/DeviceListController;->addNewDevice(Ljava/lang/String;Z)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onItemClicked(Ljava/lang/String;)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/projection/ConnectController;->getInstance()Lcom/miui/gallery/projection/ConnectController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/projection/ConnectController;->getCurConnectedDevice()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_1

    sget-object v0, Lcom/miui/gallery/projection/DeviceListController;->MOBILE_NAME:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->switch2Local(I)V

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/projection/ConnectController;->getInstance()Lcom/miui/gallery/projection/ConnectController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/projection/ConnectController;->release()I

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->switch2TV(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mHandler:Landroid/os/Handler;

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeMessages(I)V

    invoke-virtual {p0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->switch2Local(I)V

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mWidget:Lcom/miui/gallery/projection/DeviceListController;

    invoke-virtual {p1}, Lcom/miui/gallery/projection/DeviceListController;->dismiss()V

    return-void
.end method

.method public onPhotoConnectReleased()V
    .locals 2

    const-string v0, "ProjectionManager"

    const-string v1, "onPhotoConnectReleased"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    return-void
.end method

.method public onPhotoConnectResponse(I)V
    .locals 3

    const-string v0, "ProjectionManager"

    const-string v1, "onPhotoConnectResponse %d"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    const/4 v0, 0x3

    const/4 v1, 0x1

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->setConnectState(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    const-string p1, "photo"

    const-string v0, "project_photo_success"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :pswitch_1
    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->setConnectState(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const v0, 0x7f1005ad

    invoke-static {p1, v0}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    const-string p1, "photo"

    const-string v0, "project_photo_fail"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onRemoteControl(Z)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getCount()I

    move-result v0

    if-gtz v0, :cond_0

    return-void

    :cond_0
    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    if-ltz p1, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->isKeyGuardLocked(Landroid/content/Context;)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/widget/ViewPager;->setCurrentItem(IZ)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result p1

    add-int/lit8 p1, p1, 0x1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mAdapter:Lcom/miui/gallery/adapter/PhotoPageAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/PhotoPageAdapter;->getCount()I

    move-result v0

    if-ge p1, v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->isKeyGuardLocked(Landroid/content/Context;)Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/widget/ViewPager;->setCurrentItem(IZ)V

    :cond_2
    :goto_0
    return-void
.end method

.method refreshProjectState()V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2100(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;

    move-result-object v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_4

    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mConnectState:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v3, 0x7f1004e2

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :pswitch_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v3, 0x7f1004d1

    new-array v4, v2, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mConnectedDeviceName:Ljava/lang/String;

    aput-object v5, v4, v1

    invoke-virtual {v0, v3, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v3, 0x7f1004d2

    new-array v4, v2, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mConnectedDeviceName:Ljava/lang/String;

    aput-object v5, v4, v1

    invoke-virtual {v0, v3, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    iget v3, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mConnectState:I

    const/4 v4, 0x2

    if-ne v3, v2, :cond_0

    const-string v3, "init"

    goto :goto_1

    :cond_0
    iget v3, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mConnectState:I

    if-ne v3, v4, :cond_1

    const-string v3, "connecting"

    goto :goto_1

    :cond_1
    const-string v3, "connected"

    :goto_1
    iget-object v5, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mCurItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-direct {p0, v5}, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->isBigScreenSupported(Lcom/miui/gallery/model/BaseDataItem;)Z

    move-result v5

    if-eqz v5, :cond_3

    const-string v5, "ProjectionManager"

    const-string v6, "refreshProjectState: [%s] [visible]"

    invoke-static {v5, v6, v3}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v3}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2100(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;

    move-result-object v3

    iget v5, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mConnectState:I

    if-eq v5, v4, :cond_2

    const/4 v1, 0x1

    :cond_2
    invoke-virtual {v3, v0, v2, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->refreshCastItem(Ljava/lang/String;ZZ)V

    goto :goto_2

    :cond_3
    const-string v5, "ProjectionManager"

    const-string v6, "refreshProjectState: [%s] [gone]"

    invoke-static {v5, v6, v3}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v3}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2100(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;

    move-result-object v3

    invoke-virtual {v3, v0, v1, v2}, Lcom/miui/gallery/ui/PhotoPageFragment$MenuManager;->refreshCastItem(Ljava/lang/String;ZZ)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v4}, Landroid/os/Handler;->removeMessages(I)V

    :cond_4
    :goto_2
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public release()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mWidget:Lcom/miui/gallery/projection/DeviceListController;

    invoke-virtual {v0}, Lcom/miui/gallery/projection/DeviceListController;->dismiss()V

    invoke-static {}, Lcom/miui/gallery/projection/ConnectController;->getInstance()Lcom/miui/gallery/projection/ConnectController;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/miui/gallery/projection/ConnectController;->unregistConnectListener(Lcom/miui/gallery/projection/ConnectController$ConnectListener;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    invoke-static {}, Lcom/miui/gallery/projection/ConnectController;->getInstance()Lcom/miui/gallery/projection/ConnectController;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/miui/gallery/projection/ConnectController;->disconnect(Lcom/miui/gallery/projection/ConnectController$ConnectListener;Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mRemoteController:Lcom/miui/gallery/projection/RemoteController;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/projection/RemoteController;->release(Landroid/content/Context;)V

    return-void
.end method

.method public settleItem(Lcom/miui/gallery/model/BaseDataItem;I)V
    .locals 3

    if-nez p1, :cond_0

    return-void

    :cond_0
    const-string v0, "ProjectionManager"

    const-string v1, "updateItem %s  %d"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, p1, v2}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mCurItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->refreshProjectState()V

    invoke-static {}, Lcom/miui/gallery/projection/ConnectController;->getInstance()Lcom/miui/gallery/projection/ConnectController;

    move-result-object v0

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getPathDisplayBetter()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/projection/ConnectController;->updateCurrentPhoto(Ljava/lang/String;I)V

    return-void
.end method

.method public switch2Local(I)V
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->setConnectState(I)V

    if-ne p1, v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/projection/ConnectController;->getInstance()Lcom/miui/gallery/projection/ConnectController;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/projection/ConnectController;->release()I

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mWidget:Lcom/miui/gallery/projection/DeviceListController;

    invoke-virtual {p1}, Lcom/miui/gallery/projection/DeviceListController;->removeActive()V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mHandler:Landroid/os/Handler;

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeMessages(I)V

    return-void
.end method

.method public switch2TV(Ljava/lang/String;)V
    .locals 2

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mConnectedDeviceName:Ljava/lang/String;

    const/4 v0, 0x2

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->setConnectState(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    const/4 v1, 0x4

    iput v1, v0, Landroid/os/Message;->what:I

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method public updateRemoteView(Lcom/miui/gallery/model/BaseDataItem;Landroid/graphics/RectF;)V
    .locals 12

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getWidth()I

    move-result v0

    if-lez v0, :cond_2

    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_2

    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    move-result v0

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getWidth()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v0, v1

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/ViewPager;->getWidth()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getWidth()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v1, v2

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v2}, Lcom/miui/gallery/widget/ViewPager;->getHeight()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getHeight()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    const v2, 0x358637bd    # 1.0E-6f

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Utils;->floatNear(FFF)Z

    move-result v2

    if-nez v2, :cond_1

    cmpg-float v2, v0, v1

    if-gez v2, :cond_0

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v2}, Lcom/miui/gallery/widget/ViewPager;->getWidth()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    iget v3, p2, Landroid/graphics/RectF;->left:F

    sub-float/2addr v2, v3

    div-float/2addr v2, v0

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageFragment$ProjectionManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v3, v3, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {v3}, Lcom/miui/gallery/widget/ViewPager;->getHeight()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    iget p2, p2, Landroid/graphics/RectF;->top:F

    sub-float/2addr v3, p2

    div-float/2addr v3, v0

    move v11, v0

    goto :goto_1

    :cond_1
    :goto_0
    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getWidth()I

    move-result p2

    int-to-float p2, p2

    const/high16 v0, 0x40000000    # 2.0f

    div-float v2, p2, v0

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getHeight()I

    move-result p2

    int-to-float p2, p2

    div-float v3, p2, v0

    move v11, v1

    :goto_1
    move v5, v2

    move v6, v3

    invoke-static {}, Lcom/miui/gallery/projection/ConnectController;->getInstance()Lcom/miui/gallery/projection/ConnectController;

    move-result-object v4

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getWidth()I

    move-result p2

    int-to-float p2, p2

    mul-float p2, p2, v1

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    int-to-float v7, p2

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getHeight()I

    move-result p2

    int-to-float p2, p2

    mul-float p2, p2, v1

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    int-to-float v8, p2

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getWidth()I

    move-result p2

    int-to-float v9, p2

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getHeight()I

    move-result p1

    int-to-float v10, p1

    invoke-virtual/range {v4 .. v11}, Lcom/miui/gallery/projection/ConnectController;->syncRemoteView(FFFFFFF)V

    :cond_2
    return-void
.end method

.method public updateSet(Lcom/miui/gallery/model/BaseDataSet;)V
    .locals 1

    invoke-static {}, Lcom/miui/gallery/projection/ConnectController;->getInstance()Lcom/miui/gallery/projection/ConnectController;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/projection/ConnectController;->updateCurrentFolder(Lcom/miui/gallery/model/BaseDataSet;)V

    return-void
.end method
