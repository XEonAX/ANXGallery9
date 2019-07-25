.class Lcom/miui/gallery/editor/photo/screen/home/ScreenShotService$1;
.super Lcom/android/systemui/screenshot/IBitmapService$Stub;
.source "ScreenShotService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/screen/home/ScreenShotService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenShotService;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenShotService;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShotService$1;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenShotService;

    invoke-direct {p0}, Lcom/android/systemui/screenshot/IBitmapService$Stub;-><init>()V

    return-void
.end method


# virtual methods
.method public registerCallback(Lcom/android/systemui/screenshot/IScreenShotCallback;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    :try_start_0
    const-string v0, "ScreenShotService"

    const-string v1, "registerCallback"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShotService$1;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenShotService;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenShotService;->access$000(Lcom/miui/gallery/editor/photo/screen/home/ScreenShotService;)Landroid/os/RemoteCallbackList;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/os/RemoteCallbackList;->register(Landroid/os/IInterface;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "ScreenShotService"

    const-string v1, "registerCallback: %s"

    invoke-virtual {p1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method public unregisterCallback(Lcom/android/systemui/screenshot/IScreenShotCallback;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    :try_start_0
    const-string v0, "ScreenShotService"

    const-string v1, "unregisterCallback"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenShotService$1;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenShotService;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenShotService;->access$000(Lcom/miui/gallery/editor/photo/screen/home/ScreenShotService;)Landroid/os/RemoteCallbackList;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/os/RemoteCallbackList;->unregister(Landroid/os/IInterface;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "ScreenShotService"

    const-string v1, "unregisterCallback: %s"

    invoke-virtual {p1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method
