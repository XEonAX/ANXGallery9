.class Lcom/miui/gallery/scanner/MediaScannerService$1;
.super Landroid/content/BroadcastReceiver;
.source "MediaScannerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/scanner/MediaScannerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/scanner/MediaScannerService;


# direct methods
.method constructor <init>(Lcom/miui/gallery/scanner/MediaScannerService;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/scanner/MediaScannerService$1;->this$0:Lcom/miui/gallery/scanner/MediaScannerService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    const-string v0, "android.intent.action.MEDIA_UNMOUNTED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-static {p1}, Lcom/miui/gallery/util/StorageUtils;->getMountedVolumePaths(Landroid/content/Context;)Ljava/util/List;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/scanner/MediaScannerService$1;->this$0:Lcom/miui/gallery/scanner/MediaScannerService;

    invoke-static {p1}, Lcom/miui/gallery/scanner/MediaScannerService;->access$200(Lcom/miui/gallery/scanner/MediaScannerService;)Lcom/miui/gallery/scanner/ScanTaskManager;

    move-result-object p1

    const/4 p2, 0x7

    invoke-virtual {p1, p2}, Lcom/miui/gallery/scanner/ScanTaskManager;->cancelByPriority(I)V

    const-string p1, "MediaScannerService"

    const-string p2, "All external storage are unmounted, cancel cleanup task"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
