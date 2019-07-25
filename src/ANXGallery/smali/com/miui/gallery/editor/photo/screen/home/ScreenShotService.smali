.class public Lcom/miui/gallery/editor/photo/screen/home/ScreenShotService;
.super Landroid/app/Service;
.source "ScreenShotService.java"


# instance fields
.field private mListenerList:Landroid/os/RemoteCallbackList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/RemoteCallbackList<",
            "Lcom/android/systemui/screenshot/IScreenShotCallback;",
            ">;"
        }
    .end annotation
.end field

.field mStub:Lcom/android/systemui/screenshot/IBitmapService$Stub;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    new-instance v0, Landroid/os/RemoteCallbackList;

    invoke-direct {v0}, Landroid/os/RemoteCallbackList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShotService;->mListenerList:Landroid/os/RemoteCallbackList;

    new-instance v0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShotService$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenShotService$1;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenShotService;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShotService;->mStub:Lcom/android/systemui/screenshot/IBitmapService$Stub;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/screen/home/ScreenShotService;)Landroid/os/RemoteCallbackList;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShotService;->mListenerList:Landroid/os/RemoteCallbackList;

    return-object p0
.end method

.method private quitThumbnail()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShotService;->mListenerList:Landroid/os/RemoteCallbackList;

    invoke-virtual {v0}, Landroid/os/RemoteCallbackList;->beginBroadcast()I

    move-result v0

    const-string v1, "ScreenShotService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "quitThumbnail count: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShotService;->mListenerList:Landroid/os/RemoteCallbackList;

    invoke-virtual {v2, v1}, Landroid/os/RemoteCallbackList;->getBroadcastItem(I)Landroid/os/IInterface;

    move-result-object v2

    check-cast v2, Lcom/android/systemui/screenshot/IScreenShotCallback;

    if-eqz v2, :cond_0

    :try_start_0
    invoke-interface {v2}, Lcom/android/systemui/screenshot/IScreenShotCallback;->quitThumnail()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v2

    const-string v3, "ScreenShotService"

    const-string v4, "quitThumbnail: %s"

    invoke-virtual {v2}, Landroid/os/RemoteException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v4, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_0
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShotService;->mListenerList:Landroid/os/RemoteCallbackList;

    invoke-virtual {v0}, Landroid/os/RemoteCallbackList;->finishBroadcast()V

    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShotService;->mStub:Lcom/android/systemui/screenshot/IBitmapService$Stub;

    return-object p1
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 2

    if-eqz p1, :cond_0

    const-string v0, "quit_thumnail"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenShotService;->quitThumbnail()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenShotService;->stopSelf()V

    :cond_0
    invoke-super {p0, p1, p2, p3}, Landroid/app/Service;->onStartCommand(Landroid/content/Intent;II)I

    move-result p1

    return p1
.end method
