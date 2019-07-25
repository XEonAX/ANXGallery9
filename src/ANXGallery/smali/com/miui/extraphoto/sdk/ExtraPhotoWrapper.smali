.class public Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;
.super Ljava/lang/Object;
.source "ExtraPhotoWrapper.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$StartCallback;
    }
.end annotation


# static fields
.field private static sWrapper:Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;


# instance fields
.field private mDualService:Lcom/miui/extraphoto/sdk/IExtraPhotoService;

.field private mHasBindService:Z

.field private mStartCallback:Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$StartCallback;


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->mHasBindService:Z

    return p0
.end method

.method static synthetic access$002(Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->mHasBindService:Z

    return p1
.end method

.method static synthetic access$100(Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->callbackStarted(Z)V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;)Lcom/miui/extraphoto/sdk/IExtraPhotoService;
    .locals 0

    iget-object p0, p0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->mDualService:Lcom/miui/extraphoto/sdk/IExtraPhotoService;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;)Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$StartCallback;
    .locals 0

    iget-object p0, p0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->mStartCallback:Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$StartCallback;

    return-object p0
.end method

.method static synthetic access$302(Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$StartCallback;)Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$StartCallback;
    .locals 0

    iput-object p1, p0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->mStartCallback:Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$StartCallback;

    return-object p1
.end method

.method private bindService(Landroid/content/Context;)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getWorkHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    new-instance v1, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$1;

    invoke-direct {v1, p0, p1}, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$1;-><init>(Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private callbackStarted(Z)V
    .locals 2

    new-instance v0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$3;

    invoke-direct {v0, p0, p1}, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$3;-><init>(Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;Z)V

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p1

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne p1, v1, :cond_0

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    :goto_0
    return-void
.end method

.method public static getInstance()Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;
    .locals 1

    sget-object v0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->sWrapper:Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;

    invoke-direct {v0}, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;-><init>()V

    sput-object v0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->sWrapper:Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;

    :cond_0
    sget-object v0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->sWrapper:Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;

    return-object v0
.end method

.method private init(Landroid/content/Context;Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$StartCallback;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->mDualService:Lcom/miui/extraphoto/sdk/IExtraPhotoService;

    if-eqz v0, :cond_0

    const-string p1, "ExtraPhotoWrapper"

    const-string p2, "service has been initialized"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    iput-object p2, p0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->mStartCallback:Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$StartCallback;

    invoke-direct {p0, p1}, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->bindService(Landroid/content/Context;)V

    return-void
.end method

.method private releaseEcho()V
    .locals 2

    const-string v0, "ExtraPhotoWrapper"

    const-string v1, "releaseEcho"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->mDualService:Lcom/miui/extraphoto/sdk/IExtraPhotoService;

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->mDualService:Lcom/miui/extraphoto/sdk/IExtraPhotoService;

    invoke-interface {v0}, Lcom/miui/extraphoto/sdk/IExtraPhotoService;->releaseEcho()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "ExtraPhotoWrapper"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :catch_1
    move-exception v0

    const-string v1, "ExtraPhotoWrapper"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    :goto_0
    return-void
.end method

.method private transFunc2Id(Lcom/miui/extraphoto/sdk/ExtraFunc;)I
    .locals 1

    sget-object v0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$4;->$SwitchMap$com$miui$extraphoto$sdk$ExtraFunc:[I

    invoke-virtual {p1}, Lcom/miui/extraphoto/sdk/ExtraFunc;->ordinal()I

    move-result p1

    aget p1, v0, p1

    packed-switch p1, :pswitch_data_0

    const/4 p1, 0x0

    return p1

    :pswitch_0
    const p1, 0x7f090141

    return p1

    :pswitch_1
    const p1, 0x7f09025b

    return p1

    :pswitch_2
    const p1, 0x7f09011f

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private unbindService(Landroid/content/Context;)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getWorkHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    new-instance v1, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$2;

    invoke-direct {v1, p0, p1}, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$2;-><init>(Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method


# virtual methods
.method public echo(Ljava/lang/String;Lcom/miui/extraphoto/sdk/BaseEchoListener;Z)Z
    .locals 3

    const-string v0, "ExtraPhotoWrapper"

    const-string v1, "echo %s, %s, %s"

    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {v0, v1, p1, p2, v2}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->mDualService:Lcom/miui/extraphoto/sdk/IExtraPhotoService;

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->mDualService:Lcom/miui/extraphoto/sdk/IExtraPhotoService;

    invoke-interface {v0, p1, p2, p3}, Lcom/miui/extraphoto/sdk/IExtraPhotoService;->echo(Ljava/lang/String;Lcom/miui/extraphoto/sdk/IEchoListener;Z)Z

    move-result p1
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception p1

    const-string p2, "ExtraPhotoWrapper"

    invoke-static {p2, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :catch_1
    move-exception p1

    const-string p2, "ExtraPhotoWrapper"

    invoke-static {p2, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public isExtraCamera()Z
    .locals 4

    iget-object v0, p0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->mDualService:Lcom/miui/extraphoto/sdk/IExtraPhotoService;

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->mDualService:Lcom/miui/extraphoto/sdk/IExtraPhotoService;

    invoke-interface {v0}, Lcom/miui/extraphoto/sdk/IExtraPhotoService;->isExtraCamera()Z

    move-result v0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    const-string v1, "ExtraPhotoWrapper"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :catch_1
    move-exception v0

    const-string v1, "ExtraPhotoWrapper"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    :goto_0
    const/4 v0, 0x0

    :goto_1
    const-string v1, "ExtraPhotoWrapper"

    const-string v2, "isExtraCamera %s"

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return v0
.end method

.method public isExtraPhoto(Ljava/lang/String;)Z
    .locals 4

    iget-object v0, p0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->mDualService:Lcom/miui/extraphoto/sdk/IExtraPhotoService;

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->mDualService:Lcom/miui/extraphoto/sdk/IExtraPhotoService;

    invoke-interface {v0, p1}, Lcom/miui/extraphoto/sdk/IExtraPhotoService;->isExtraPhoto(Ljava/lang/String;)Z

    move-result v0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    const-string v1, "ExtraPhotoWrapper"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :catch_1
    move-exception v0

    const-string v1, "ExtraPhotoWrapper"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    :goto_0
    const/4 v0, 0x0

    :goto_1
    const-string v1, "ExtraPhotoWrapper"

    const-string v2, "isExtraPhoto %s, %s"

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-static {v1, v2, v3, p1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return v0
.end method

.method public needEcho(Ljava/lang/String;)Z
    .locals 4

    iget-object v0, p0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->mDualService:Lcom/miui/extraphoto/sdk/IExtraPhotoService;

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->mDualService:Lcom/miui/extraphoto/sdk/IExtraPhotoService;

    invoke-interface {v0, p1}, Lcom/miui/extraphoto/sdk/IExtraPhotoService;->needEcho(Ljava/lang/String;)Z

    move-result v0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    const-string v1, "ExtraPhotoWrapper"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :catch_1
    move-exception v0

    const-string v1, "ExtraPhotoWrapper"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    :goto_0
    const/4 v0, 0x0

    :goto_1
    const-string v1, "ExtraPhotoWrapper"

    const-string v2, "needEcho %s, %s"

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-static {v1, v2, v3, p1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return v0
.end method

.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 1

    const-string p1, "ExtraPhotoWrapper"

    const-string v0, "onServiceConnected %s"

    invoke-static {p1, v0, p2}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    if-eqz p2, :cond_0

    invoke-static {p2}, Lcom/miui/extraphoto/sdk/IExtraPhotoService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/miui/extraphoto/sdk/IExtraPhotoService;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->mDualService:Lcom/miui/extraphoto/sdk/IExtraPhotoService;

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->callbackStarted(Z)V

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->callbackStarted(Z)V

    :goto_0
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 2

    const-string v0, "ExtraPhotoWrapper"

    const-string v1, "onServiceDisconnected %s"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public resolveExtraFuncs()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->mDualService:Lcom/miui/extraphoto/sdk/IExtraPhotoService;

    if-eqz v1, :cond_1

    :try_start_0
    iget-object v1, p0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->mDualService:Lcom/miui/extraphoto/sdk/IExtraPhotoService;

    invoke-interface {v1}, Lcom/miui/extraphoto/sdk/IExtraPhotoService;->resolveExtraFuncs()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/extraphoto/sdk/ExtraFunc;

    invoke-direct {p0, v2}, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->transFunc2Id(Lcom/miui/extraphoto/sdk/ExtraFunc;)I

    move-result v3

    if-lez v3, :cond_0

    const-string v4, "ExtraPhotoWrapper"

    const-string v5, "resolveExtraFuncs %s"

    invoke-virtual {v2}, Lcom/miui/extraphoto/sdk/ExtraFunc;->name()Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v5, v2}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    const-string v2, "ExtraPhotoWrapper"

    invoke-static {v2, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    :catch_1
    move-exception v1

    const-string v2, "ExtraPhotoWrapper"

    invoke-static {v2, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1
    :goto_1
    return-object v0
.end method

.method public start(Landroid/content/Context;Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$StartCallback;)V
    .locals 2

    const-string v0, "ExtraPhotoWrapper"

    const-string v1, "resumeEcho"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, p1, p2}, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->init(Landroid/content/Context;Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$StartCallback;)V

    return-void
.end method

.method public stop(Landroid/content/Context;)V
    .locals 2

    const-string v0, "ExtraPhotoWrapper"

    const-string v1, "pauseEcho"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->releaseEcho()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->mStartCallback:Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$StartCallback;

    iput-object v0, p0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->mDualService:Lcom/miui/extraphoto/sdk/IExtraPhotoService;

    invoke-direct {p0, p1}, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->unbindService(Landroid/content/Context;)V

    return-void
.end method

.method public unregisterEchoListener(Lcom/miui/extraphoto/sdk/BaseEchoListener;)V
    .locals 2

    const-string v0, "ExtraPhotoWrapper"

    const-string v1, "unregisterEchoListener %s"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->mDualService:Lcom/miui/extraphoto/sdk/IExtraPhotoService;

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->mDualService:Lcom/miui/extraphoto/sdk/IExtraPhotoService;

    invoke-interface {v0, p1}, Lcom/miui/extraphoto/sdk/IExtraPhotoService;->unregisterEchoListener(Lcom/miui/extraphoto/sdk/IEchoListener;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "ExtraPhotoWrapper"

    invoke-static {v0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :catch_1
    move-exception p1

    const-string v0, "ExtraPhotoWrapper"

    invoke-static {v0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    :goto_0
    return-void
.end method
