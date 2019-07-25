.class public Lcom/miui/gallery/projection/ConnectController;
.super Ljava/lang/Object;
.source "ConnectController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/projection/ConnectController$MediaPlayListener;,
        Lcom/miui/gallery/projection/ConnectController$ConnectListener;
    }
.end annotation


# static fields
.field private static mInstance:Lcom/miui/gallery/projection/ConnectController;


# instance fields
.field private mConnectListeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/miui/gallery/projection/ConnectController$ConnectListener;",
            ">;"
        }
    .end annotation
.end field

.field private mCurConnectedDevice:Ljava/lang/String;

.field private mCurrentIndex:I

.field private mCurrentPhoto:Ljava/lang/String;

.field private mDataSource:Lcom/milink/api/v1/MilinkClientManagerDataSource;

.field private mDelayConnect:Ljava/lang/Runnable;

.field private mDelegate:Lcom/milink/api/v1/MilinkClientManagerDelegate;

.field private mDeviceOpen:Z

.field private mDevices:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mHandler:Landroid/os/Handler;

.field private mIsFirstConnected:Z

.field private mMediaPlayListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/projection/ConnectController$MediaPlayListener;",
            ">;"
        }
    .end annotation
.end field

.field private mPhotoManager:Lcom/milink/api/v1/MilinkClientManager;

.field private mPhotoServerConnected:Z

.field private mRefreshDevices:Ljava/lang/Runnable;

.field private mSlideShowTypes:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mSlidingWindow:Lcom/miui/gallery/projection/SlidingWindow;

.field private mWaitConnectDevice:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/projection/ConnectController;->mDeviceOpen:Z

    iput-boolean v0, p0, Lcom/miui/gallery/projection/ConnectController;->mPhotoServerConnected:Z

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/miui/gallery/projection/ConnectController;->mSlideShowTypes:Ljava/util/ArrayList;

    new-instance v1, Lcom/miui/gallery/projection/SlidingWindow;

    invoke-direct {v1}, Lcom/miui/gallery/projection/SlidingWindow;-><init>()V

    iput-object v1, p0, Lcom/miui/gallery/projection/ConnectController;->mSlidingWindow:Lcom/miui/gallery/projection/SlidingWindow;

    const-string v1, ""

    iput-object v1, p0, Lcom/miui/gallery/projection/ConnectController;->mCurrentPhoto:Ljava/lang/String;

    iput v0, p0, Lcom/miui/gallery/projection/ConnectController;->mCurrentIndex:I

    iput-boolean v0, p0, Lcom/miui/gallery/projection/ConnectController;->mIsFirstConnected:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mWaitConnectDevice:Ljava/lang/String;

    iput-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mCurConnectedDevice:Ljava/lang/String;

    new-instance v0, Lcom/miui/gallery/projection/ConnectController$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/projection/ConnectController$1;-><init>(Lcom/miui/gallery/projection/ConnectController;)V

    iput-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mHandler:Landroid/os/Handler;

    new-instance v0, Lcom/miui/gallery/projection/ConnectController$4;

    invoke-direct {v0, p0}, Lcom/miui/gallery/projection/ConnectController$4;-><init>(Lcom/miui/gallery/projection/ConnectController;)V

    iput-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mDataSource:Lcom/milink/api/v1/MilinkClientManagerDataSource;

    new-instance v0, Lcom/miui/gallery/projection/ConnectController$5;

    invoke-direct {v0, p0}, Lcom/miui/gallery/projection/ConnectController$5;-><init>(Lcom/miui/gallery/projection/ConnectController;)V

    iput-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mDelegate:Lcom/milink/api/v1/MilinkClientManagerDelegate;

    new-instance v0, Lcom/miui/gallery/projection/ConnectController$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/projection/ConnectController$2;-><init>(Lcom/miui/gallery/projection/ConnectController;)V

    iput-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mDelayConnect:Ljava/lang/Runnable;

    new-instance v0, Lcom/miui/gallery/projection/ConnectController$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/projection/ConnectController$3;-><init>(Lcom/miui/gallery/projection/ConnectController;)V

    iput-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mRefreshDevices:Ljava/lang/Runnable;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mConnectListeners:Ljava/util/Set;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mDevices:Ljava/util/HashMap;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mMediaPlayListeners:Ljava/util/List;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/projection/ConnectController;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/projection/ConnectController;->doDeviceAdded(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/projection/ConnectController;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/projection/ConnectController;->doDeviceRemoved(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1000(Lcom/miui/gallery/projection/ConnectController;)Lcom/milink/api/v1/MilinkClientManager;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/projection/ConnectController;->mPhotoManager:Lcom/milink/api/v1/MilinkClientManager;

    return-object p0
.end method

.method static synthetic access$1100(Lcom/miui/gallery/projection/ConnectController;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/projection/ConnectController;->mCurrentPhoto:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1200(Lcom/miui/gallery/projection/ConnectController;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/projection/ConnectController;->mCurrentIndex:I

    return p0
.end method

.method static synthetic access$1300(Lcom/miui/gallery/projection/ConnectController;Ljava/lang/String;I)I
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/projection/ConnectController;->showPhoto(Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method static synthetic access$1400(Lcom/miui/gallery/projection/ConnectController;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/projection/ConnectController;->doPhotoConnectResponse(I)V

    return-void
.end method

.method static synthetic access$1500(Lcom/miui/gallery/projection/ConnectController;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/projection/ConnectController;->setPhotoServerDisconnect()V

    return-void
.end method

.method static synthetic access$1600(Lcom/miui/gallery/projection/ConnectController;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/projection/ConnectController;->doPhotoConnectRelease()V

    return-void
.end method

.method static synthetic access$1700(Lcom/miui/gallery/projection/ConnectController;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/projection/ConnectController;->mMediaPlayListeners:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/projection/ConnectController;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/projection/ConnectController;->disconnectBigShow(Z)V

    return-void
.end method

.method static synthetic access$300(Lcom/miui/gallery/projection/ConnectController;)Lcom/miui/gallery/projection/SlidingWindow;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/projection/ConnectController;->mSlidingWindow:Lcom/miui/gallery/projection/SlidingWindow;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/projection/ConnectController;)Ljava/util/HashMap;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/projection/ConnectController;->mDevices:Ljava/util/HashMap;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/projection/ConnectController;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/projection/ConnectController;->mHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/projection/ConnectController;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/projection/ConnectController;->mPhotoServerConnected:Z

    return p0
.end method

.method static synthetic access$602(Lcom/miui/gallery/projection/ConnectController;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/projection/ConnectController;->mPhotoServerConnected:Z

    return p1
.end method

.method static synthetic access$702(Lcom/miui/gallery/projection/ConnectController;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/projection/ConnectController;->mCurConnectedDevice:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$800(Lcom/miui/gallery/projection/ConnectController;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/projection/ConnectController;->mWaitConnectDevice:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$802(Lcom/miui/gallery/projection/ConnectController;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/projection/ConnectController;->mWaitConnectDevice:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$902(Lcom/miui/gallery/projection/ConnectController;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/projection/ConnectController;->mIsFirstConnected:Z

    return p1
.end method

.method private deviceOpened()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/projection/ConnectController;->mDeviceOpen:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method private disconnectBigShow(Z)V
    .locals 2

    const-string v0, "ConnectController"

    const-string v1, "~~~disconnectBigShow"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/miui/gallery/projection/ConnectController;->removePostDisonnectListener()V

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mConnectListeners:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    if-eqz v0, :cond_0

    if-eqz p1, :cond_2

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/projection/ConnectController;->setPhotoServerDisconnect()V

    invoke-direct {p0}, Lcom/miui/gallery/projection/ConnectController;->releasePhotoManager()V

    monitor-enter p0

    :try_start_0
    iget-object p1, p0, Lcom/miui/gallery/projection/ConnectController;->mPhotoManager:Lcom/milink/api/v1/MilinkClientManager;

    if-eqz p1, :cond_1

    const-string p1, "ConnectController"

    const-string v0, "set device close"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/projection/ConnectController;->mDevices:Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/util/HashMap;->clear()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/projection/ConnectController;->mDeviceOpen:Z

    iget-object p1, p0, Lcom/miui/gallery/projection/ConnectController;->mPhotoManager:Lcom/milink/api/v1/MilinkClientManager;

    invoke-virtual {p1}, Lcom/milink/api/v1/MilinkClientManager;->close()V

    :cond_1
    monitor-exit p0

    :cond_2
    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private doDeviceAdded(Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mConnectListeners:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/projection/ConnectController$ConnectListener;

    if-eqz v1, :cond_0

    invoke-interface {v1, p1}, Lcom/miui/gallery/projection/ConnectController$ConnectListener;->onDevicesAdded(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method private doDeviceAvailable(Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mConnectListeners:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/projection/ConnectController$ConnectListener;

    if-eqz v1, :cond_0

    invoke-interface {v1, p1}, Lcom/miui/gallery/projection/ConnectController$ConnectListener;->onDevicesAvailable(Ljava/util/ArrayList;)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method private doDeviceRefresh(Ljava/util/ArrayList;Ljava/lang/String;)V
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

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mConnectListeners:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/projection/ConnectController$ConnectListener;

    if-eqz v1, :cond_0

    invoke-interface {v1, p1, p2}, Lcom/miui/gallery/projection/ConnectController$ConnectListener;->onDeviceRefresh(Ljava/util/ArrayList;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method private doDeviceRemoved(Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mConnectListeners:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/projection/ConnectController$ConnectListener;

    if-eqz v1, :cond_0

    invoke-interface {v1, p1}, Lcom/miui/gallery/projection/ConnectController$ConnectListener;->onDeviceRemoved(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method private doPhotoConnectRelease()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mConnectListeners:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/projection/ConnectController$ConnectListener;

    if-eqz v1, :cond_0

    invoke-interface {v1}, Lcom/miui/gallery/projection/ConnectController$ConnectListener;->onPhotoConnectReleased()V

    goto :goto_0

    :cond_1
    return-void
.end method

.method private doPhotoConnectResponse(I)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mConnectListeners:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/projection/ConnectController$ConnectListener;

    if-eqz v1, :cond_0

    invoke-interface {v1, p1}, Lcom/miui/gallery/projection/ConnectController$ConnectListener;->onPhotoConnectResponse(I)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public static declared-synchronized getInstance()Lcom/miui/gallery/projection/ConnectController;
    .locals 2

    const-class v0, Lcom/miui/gallery/projection/ConnectController;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/projection/ConnectController;->mInstance:Lcom/miui/gallery/projection/ConnectController;

    if-nez v1, :cond_0

    new-instance v1, Lcom/miui/gallery/projection/ConnectController;

    invoke-direct {v1}, Lcom/miui/gallery/projection/ConnectController;-><init>()V

    sput-object v1, Lcom/miui/gallery/projection/ConnectController;->mInstance:Lcom/miui/gallery/projection/ConnectController;

    :cond_0
    sget-object v1, Lcom/miui/gallery/projection/ConnectController;->mInstance:Lcom/miui/gallery/projection/ConnectController;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private photoServerOpen()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/projection/ConnectController;->mPhotoServerConnected:Z

    return v0
.end method

.method private releasePhotoManager()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mPhotoManager:Lcom/milink/api/v1/MilinkClientManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mPhotoManager:Lcom/milink/api/v1/MilinkClientManager;

    invoke-virtual {v0}, Lcom/milink/api/v1/MilinkClientManager;->stopShow()Lcom/milink/api/v1/type/ReturnCode;

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mPhotoManager:Lcom/milink/api/v1/MilinkClientManager;

    invoke-virtual {v0}, Lcom/milink/api/v1/MilinkClientManager;->disconnect()Lcom/milink/api/v1/type/ReturnCode;

    :cond_0
    return-void
.end method

.method private removePostDisonnectListener()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/miui/gallery/projection/ConnectController;->mDelayConnect:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void
.end method

.method private setPhotoServerDisconnect()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/projection/ConnectController;->mPhotoServerConnected:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mWaitConnectDevice:Ljava/lang/String;

    iput-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mCurConnectedDevice:Ljava/lang/String;

    return-void
.end method

.method private showPhoto(Ljava/lang/String;I)I
    .locals 4

    invoke-direct {p0}, Lcom/miui/gallery/projection/ConnectController;->photoServerOpen()Z

    move-result v0

    const/4 v1, -0x1

    if-nez v0, :cond_0

    const-string p1, "ConnectController"

    const-string p2, "photo not connected"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_0
    const-string v0, "ConnectController"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "the photo is: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/miui/gallery/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p1, :cond_2

    :try_start_0
    iget-object p2, p0, Lcom/miui/gallery/projection/ConnectController;->mPhotoManager:Lcom/milink/api/v1/MilinkClientManager;

    invoke-virtual {p2, p1}, Lcom/milink/api/v1/MilinkClientManager;->show(Ljava/lang/String;)Lcom/milink/api/v1/type/ReturnCode;

    move-result-object p1

    sget-object p2, Lcom/milink/api/v1/type/ReturnCode;->OK:Lcom/milink/api/v1/type/ReturnCode;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    if-ne p1, p2, :cond_1

    const/4 v1, 0x0

    :cond_1
    return v1

    :catch_0
    move-exception p1

    const-string p2, "ConnectController"

    const-string v0, "MilinkClientManager show exception"

    invoke-static {p2, v0, p1}, Lcom/miui/gallery/util/Log;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_2
    return v1
.end method


# virtual methods
.method public connectPhotoServer(Ljava/lang/String;)I
    .locals 5

    invoke-direct {p0}, Lcom/miui/gallery/projection/ConnectController;->deviceOpened()Z

    move-result v0

    const/4 v1, -0x1

    if-nez v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mDevices:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_1

    return v1

    :cond_1
    iget-boolean v2, p0, Lcom/miui/gallery/projection/ConnectController;->mPhotoServerConnected:Z

    if-eqz v2, :cond_3

    const-string v2, "ConnectController"

    const-string v3, "connect to another device"

    invoke-static {v2, v3}, Lcom/miui/gallery/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/miui/gallery/projection/ConnectController;->mPhotoManager:Lcom/milink/api/v1/MilinkClientManager;

    invoke-virtual {v2}, Lcom/milink/api/v1/MilinkClientManager;->disconnect()Lcom/milink/api/v1/type/ReturnCode;

    move-result-object v2

    sget-object v3, Lcom/milink/api/v1/type/ReturnCode;->OK:Lcom/milink/api/v1/type/ReturnCode;

    if-eq v2, v3, :cond_2

    const-string v2, "ConnectController"

    const-string v3, "disconnect error"

    invoke-static {v2, v3}, Lcom/miui/gallery/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    invoke-direct {p0}, Lcom/miui/gallery/projection/ConnectController;->setPhotoServerDisconnect()V

    :cond_3
    const-string v2, "ConnectController"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "connect to server: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " photo: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/miui/gallery/projection/ConnectController;->mCurrentPhoto:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/miui/gallery/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/miui/gallery/projection/ConnectController;->mPhotoManager:Lcom/milink/api/v1/MilinkClientManager;

    const/16 v3, 0x1770

    invoke-virtual {v2, v0, v3}, Lcom/milink/api/v1/MilinkClientManager;->connect(Ljava/lang/String;I)Lcom/milink/api/v1/type/ReturnCode;

    move-result-object v0

    sget-object v2, Lcom/milink/api/v1/type/ReturnCode;->OK:Lcom/milink/api/v1/type/ReturnCode;

    if-eq v0, v2, :cond_4

    const-string v0, "ConnectController"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "connect error "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_4
    iput-object p1, p0, Lcom/miui/gallery/projection/ConnectController;->mWaitConnectDevice:Ljava/lang/String;

    const/4 p1, 0x0

    return p1
.end method

.method public disconnect(Lcom/miui/gallery/projection/ConnectController$ConnectListener;Z)V
    .locals 2

    const-string v0, "ConnectController"

    const-string v1, "disconnect"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/projection/ConnectController;->unregistConnectListener(Lcom/miui/gallery/projection/ConnectController$ConnectListener;)V

    iget-boolean p1, p0, Lcom/miui/gallery/projection/ConnectController;->mDeviceOpen:Z

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/projection/ConnectController;->doPhotoConnectRelease()V

    invoke-direct {p0, p2}, Lcom/miui/gallery/projection/ConnectController;->disconnectBigShow(Z)V

    return-void
.end method

.method public getCurConnectedDevice()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mCurConnectedDevice:Ljava/lang/String;

    return-object v0
.end method

.method public getCurrentPosition()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mPhotoManager:Lcom/milink/api/v1/MilinkClientManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mPhotoManager:Lcom/milink/api/v1/MilinkClientManager;

    invoke-virtual {v0}, Lcom/milink/api/v1/MilinkClientManager;->getPlaybackProgress()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getDeviceList()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/projection/ConnectController;->mDevices:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public getDuration()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mPhotoManager:Lcom/milink/api/v1/MilinkClientManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mPhotoManager:Lcom/milink/api/v1/MilinkClientManager;

    invoke-virtual {v0}, Lcom/milink/api/v1/MilinkClientManager;->getPlaybackDuration()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isOpen()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/projection/ConnectController;->mDeviceOpen:Z

    return v0
.end method

.method public isPlaying()Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mPhotoManager:Lcom/milink/api/v1/MilinkClientManager;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mPhotoManager:Lcom/milink/api/v1/MilinkClientManager;

    invoke-virtual {v0}, Lcom/milink/api/v1/MilinkClientManager;->getPlaybackRate()I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1

    :cond_1
    return v1
.end method

.method public open()V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/projection/ConnectController;->mDeviceOpen:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mPhotoManager:Lcom/milink/api/v1/MilinkClientManager;

    if-nez v0, :cond_1

    new-instance v0, Lcom/milink/api/v1/MilinkClientManager;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/milink/api/v1/MilinkClientManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mPhotoManager:Lcom/milink/api/v1/MilinkClientManager;

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mPhotoManager:Lcom/milink/api/v1/MilinkClientManager;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/util/BuildUtil;->getDeviceName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/milink/api/v1/MilinkClientManager;->setDeviceName(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mPhotoManager:Lcom/milink/api/v1/MilinkClientManager;

    iget-object v1, p0, Lcom/miui/gallery/projection/ConnectController;->mDataSource:Lcom/milink/api/v1/MilinkClientManagerDataSource;

    invoke-virtual {v0, v1}, Lcom/milink/api/v1/MilinkClientManager;->setDataSource(Lcom/milink/api/v1/MilinkClientManagerDataSource;)V

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mPhotoManager:Lcom/milink/api/v1/MilinkClientManager;

    iget-object v1, p0, Lcom/miui/gallery/projection/ConnectController;->mDelegate:Lcom/milink/api/v1/MilinkClientManagerDelegate;

    invoke-virtual {v0, v1}, Lcom/milink/api/v1/MilinkClientManager;->setDelegate(Lcom/milink/api/v1/MilinkClientManagerDelegate;)V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mPhotoManager:Lcom/milink/api/v1/MilinkClientManager;

    invoke-virtual {v0}, Lcom/milink/api/v1/MilinkClientManager;->open()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/projection/ConnectController;->mDeviceOpen:Z

    return-void
.end method

.method public pause()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mPhotoManager:Lcom/milink/api/v1/MilinkClientManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mPhotoManager:Lcom/milink/api/v1/MilinkClientManager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/milink/api/v1/MilinkClientManager;->setPlaybackRate(I)Lcom/milink/api/v1/type/ReturnCode;

    :cond_0
    return-void
.end method

.method public playVideo(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7

    iget-object p3, p0, Lcom/miui/gallery/projection/ConnectController;->mPhotoManager:Lcom/milink/api/v1/MilinkClientManager;

    if-nez p3, :cond_0

    return-void

    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_1

    :try_start_0
    const-string p3, "UTF-8"

    invoke-static {p1, p3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mPhotoManager:Lcom/milink/api/v1/MilinkClientManager;

    const/4 v3, 0x0

    const-wide/16 v4, 0x0

    sget-object v6, Lcom/milink/api/v1/type/MediaType;->Video:Lcom/milink/api/v1/type/MediaType;

    move-object v2, p2

    invoke-virtual/range {v0 .. v6}, Lcom/milink/api/v1/MilinkClientManager;->startPlay(Ljava/lang/String;Ljava/lang/String;IDLcom/milink/api/v1/type/MediaType;)Lcom/milink/api/v1/type/ReturnCode;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    :cond_1
    :goto_0
    return-void
.end method

.method public queryDevices(Z)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/projection/ConnectController;->getDeviceList()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    :cond_0
    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/projection/ConnectController;->mCurConnectedDevice:Ljava/lang/String;

    invoke-direct {p0, v0, p1}, Lcom/miui/gallery/projection/ConnectController;->doDeviceRefresh(Ljava/util/ArrayList;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    invoke-direct {p0, v0}, Lcom/miui/gallery/projection/ConnectController;->doDeviceAvailable(Ljava/util/ArrayList;)V

    :goto_0
    return-void
.end method

.method public refreshDevices()Z
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/projection/ConnectController;->deviceOpened()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/projection/ConnectController;->queryDevices(Z)V

    return v0
.end method

.method public registConnectListener(Lcom/miui/gallery/projection/ConnectController$ConnectListener;)V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/projection/ConnectController;->removePostDisonnectListener()V

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mConnectListeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object p1, p0, Lcom/miui/gallery/projection/ConnectController;->mHandler:Landroid/os/Handler;

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mRefreshDevices:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public registMediaPlayListener(Lcom/miui/gallery/projection/ConnectController$MediaPlayListener;)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mMediaPlayListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method

.method public release()I
    .locals 2

    const-string v0, "ConnectController"

    const-string v1, "do release"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/miui/gallery/projection/ConnectController;->mPhotoServerConnected:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/projection/ConnectController;->setPhotoServerDisconnect()V

    invoke-direct {p0}, Lcom/miui/gallery/projection/ConnectController;->releasePhotoManager()V

    invoke-direct {p0}, Lcom/miui/gallery/projection/ConnectController;->doPhotoConnectRelease()V

    return v1
.end method

.method public resume()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mPhotoManager:Lcom/milink/api/v1/MilinkClientManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mPhotoManager:Lcom/milink/api/v1/MilinkClientManager;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/milink/api/v1/MilinkClientManager;->setPlaybackRate(I)Lcom/milink/api/v1/type/ReturnCode;

    :cond_0
    return-void
.end method

.method public seekTo(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mPhotoManager:Lcom/milink/api/v1/MilinkClientManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mPhotoManager:Lcom/milink/api/v1/MilinkClientManager;

    invoke-virtual {v0, p1}, Lcom/milink/api/v1/MilinkClientManager;->setPlaybackProgress(I)Lcom/milink/api/v1/type/ReturnCode;

    :cond_0
    return-void
.end method

.method public showType(ZI)I
    .locals 3

    invoke-direct {p0}, Lcom/miui/gallery/projection/ConnectController;->photoServerOpen()Z

    move-result v0

    const/4 v1, -0x1

    if-nez v0, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x0

    if-eqz p1, :cond_2

    iput p2, p0, Lcom/miui/gallery/projection/ConnectController;->mCurrentIndex:I

    iget-object p1, p0, Lcom/miui/gallery/projection/ConnectController;->mSlidingWindow:Lcom/miui/gallery/projection/SlidingWindow;

    iget p2, p0, Lcom/miui/gallery/projection/ConnectController;->mCurrentIndex:I

    invoke-virtual {p1, p2}, Lcom/miui/gallery/projection/SlidingWindow;->onCurrentIndexChanged(I)V

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$SlideShow;->getSlideShowInterval()I

    move-result p1

    mul-int/lit16 p1, p1, 0x3e8

    const/16 p2, 0xbb8

    invoke-static {p2, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    iget-object p2, p0, Lcom/miui/gallery/projection/ConnectController;->mPhotoManager:Lcom/milink/api/v1/MilinkClientManager;

    sget-object v2, Lcom/milink/api/v1/type/SlideMode;->Recyle:Lcom/milink/api/v1/type/SlideMode;

    invoke-virtual {p2, p1, v2}, Lcom/milink/api/v1/MilinkClientManager;->startSlideshow(ILcom/milink/api/v1/type/SlideMode;)Lcom/milink/api/v1/type/ReturnCode;

    move-result-object p1

    sget-object p2, Lcom/milink/api/v1/type/ReturnCode;->OK:Lcom/milink/api/v1/type/ReturnCode;

    if-ne p1, p2, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, -0x1

    :goto_0
    return v0

    :cond_2
    return v0
.end method

.method public stop()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mPhotoManager:Lcom/milink/api/v1/MilinkClientManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mPhotoManager:Lcom/milink/api/v1/MilinkClientManager;

    invoke-virtual {v0}, Lcom/milink/api/v1/MilinkClientManager;->stopPlay()Lcom/milink/api/v1/type/ReturnCode;

    :cond_0
    return-void
.end method

.method public syncRemoteView(FFFFFFF)V
    .locals 10

    move-object v0, p0

    iget-object v1, v0, Lcom/miui/gallery/projection/ConnectController;->mPhotoManager:Lcom/milink/api/v1/MilinkClientManager;

    iget-object v2, v0, Lcom/miui/gallery/projection/ConnectController;->mCurrentPhoto:Ljava/lang/String;

    move v3, p1

    float-to-int v3, v3

    move v4, p2

    float-to-int v4, v4

    move v5, p3

    float-to-int v5, v5

    move v6, p4

    float-to-int v6, v6

    move v7, p5

    float-to-int v7, v7

    move/from16 v8, p6

    float-to-int v8, v8

    move/from16 v9, p7

    invoke-virtual/range {v1 .. v9}, Lcom/milink/api/v1/MilinkClientManager;->zoomPhoto(Ljava/lang/String;IIIIIIF)Lcom/milink/api/v1/type/ReturnCode;

    return-void
.end method

.method public unregistConnectListener(Lcom/miui/gallery/projection/ConnectController$ConnectListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mConnectListeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public updateCurrentFolder(Lcom/miui/gallery/model/BaseDataSet;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mSlidingWindow:Lcom/miui/gallery/projection/SlidingWindow;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/projection/SlidingWindow;->setMediaSet(Lcom/miui/gallery/model/BaseDataSet;)V

    return-void
.end method

.method public updateCurrentPhoto(Ljava/lang/String;I)V
    .locals 2

    iput-object p1, p0, Lcom/miui/gallery/projection/ConnectController;->mCurrentPhoto:Ljava/lang/String;

    iput p2, p0, Lcom/miui/gallery/projection/ConnectController;->mCurrentIndex:I

    invoke-virtual {p0}, Lcom/miui/gallery/projection/ConnectController;->getCurConnectedDevice()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/projection/ConnectController;->mSlidingWindow:Lcom/miui/gallery/projection/SlidingWindow;

    iget v1, p0, Lcom/miui/gallery/projection/ConnectController;->mCurrentIndex:I

    invoke-virtual {v0, v1}, Lcom/miui/gallery/projection/SlidingWindow;->onCurrentIndexChanged(I)V

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/projection/ConnectController;->showPhoto(Ljava/lang/String;I)I

    :cond_0
    return-void
.end method
