.class Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$1;
.super Ljava/lang/Object;
.source "MiuiCameraCaptureReceiver.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$filePath:Ljava/lang/String;

.field final synthetic val$intent:Landroid/content/Intent;


# direct methods
.method constructor <init>(Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver;Ljava/lang/String;Landroid/content/Intent;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$1;->this$0:Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver;

    iput-object p2, p0, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$1;->val$filePath:Ljava/lang/String;

    iput-object p3, p0, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$1;->val$intent:Landroid/content/Intent;

    iput-object p4, p0, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$1;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$1;->run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;
    .locals 5

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    invoke-static {}, Lcom/miui/gallery/data/LocationManager;->getInstance()Lcom/miui/gallery/data/LocationManager;

    move-result-object p1

    iget-object v2, p0, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$1;->val$filePath:Ljava/lang/String;

    iget-object v3, p0, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$1;->val$intent:Landroid/content/Intent;

    invoke-virtual {p1, v2, v3}, Lcom/miui/gallery/data/LocationManager;->recordMediaLocation(Ljava/lang/String;Landroid/content/Intent;)V

    iget-object p1, p0, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$1;->val$context:Landroid/content/Context;

    iget-object v2, p0, Lcom/miui/gallery/receiver/MiuiCameraCaptureReceiver$1;->val$filePath:Ljava/lang/String;

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-static {p1, v2, v4, v3}, Lcom/miui/gallery/scanner/MediaScannerUtil;->scanSingleFile(Landroid/content/Context;Ljava/lang/String;IZ)V

    sget-boolean p1, Lcom/miui/os/Rom;->IS_DEV:Z

    if-eqz p1, :cond_0

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1, v3}, Ljava/util/HashMap;-><init>(I)V

    const-string v2, "recordLocationAndTriggerScan"

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, v0

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "media_scanner"

    const-string v1, "camera_capture_receiver_time_consuming"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method
