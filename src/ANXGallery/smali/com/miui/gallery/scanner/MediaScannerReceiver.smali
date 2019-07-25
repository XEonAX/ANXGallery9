.class public Lcom/miui/gallery/scanner/MediaScannerReceiver;
.super Landroid/content/BroadcastReceiver;
.source "MediaScannerReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method static synthetic access$000(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 0

    invoke-static {p0, p1}, Lcom/miui/gallery/scanner/MediaScannerReceiver;->shouldHandlePath(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private onMediaScannerFinished(Landroid/content/Context;Landroid/net/Uri;)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/scanner/MediaScannerReceiver$1;

    invoke-direct {v1, p0, p2, p1}, Lcom/miui/gallery/scanner/MediaScannerReceiver$1;-><init>(Lcom/miui/gallery/scanner/MediaScannerReceiver;Landroid/net/Uri;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    return-void
.end method

.method private onMediaScannerScanFile(Landroid/content/Context;Landroid/net/Uri;)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/scanner/MediaScannerReceiver$2;

    invoke-direct {v1, p0, p2, p1}, Lcom/miui/gallery/scanner/MediaScannerReceiver$2;-><init>(Lcom/miui/gallery/scanner/MediaScannerReceiver;Landroid/net/Uri;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    return-void
.end method

.method private static shouldHandlePath(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 0

    invoke-static {p0, p1}, Lcom/miui/gallery/util/StorageUtils;->getRelativePath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "MIUI/Gallery/cloud"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/ExtraTextUtils;->startsWithIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3

    const-string v0, "com.miui.gallery.extra.trigger_scan"

    const/4 v1, 0x0

    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p2

    const-string v1, "MediaScannerReceiver"

    const-string v2, "Broadcast received, action: [%s], data uri: [%s]"

    invoke-static {v1, v2, v0, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    const-string v1, "android.intent.action.MEDIA_SCANNER_FINISHED"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/scanner/MediaScannerReceiver;->onMediaScannerFinished(Landroid/content/Context;Landroid/net/Uri;)V

    goto :goto_0

    :cond_1
    const-string v1, "android.intent.action.MEDIA_SCANNER_SCAN_FILE"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/scanner/MediaScannerReceiver;->onMediaScannerScanFile(Landroid/content/Context;Landroid/net/Uri;)V

    goto :goto_0

    :cond_2
    const-string v1, "android.intent.action.MEDIA_UNMOUNTED"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/scanner/MediaScannerUtil;->cleanup(Landroid/content/Context;)V

    goto :goto_0

    :cond_3
    const-string v1, "android.intent.action.MEDIA_MOUNTED"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    const/4 v0, 0x6

    const/4 v1, 0x1

    invoke-static {p1, p2, v0, v1, v1}, Lcom/miui/gallery/scanner/MediaScannerUtil;->scanDirectory(Landroid/content/Context;Ljava/lang/String;IZZ)V

    :cond_4
    :goto_0
    return-void
.end method
