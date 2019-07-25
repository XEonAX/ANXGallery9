.class Lcom/miui/gallery/scanner/MediaScannerReceiver$1;
.super Ljava/lang/Object;
.source "MediaScannerReceiver.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/scanner/MediaScannerReceiver;->onMediaScannerFinished(Landroid/content/Context;Landroid/net/Uri;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/scanner/MediaScannerReceiver;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$uri:Landroid/net/Uri;


# direct methods
.method constructor <init>(Lcom/miui/gallery/scanner/MediaScannerReceiver;Landroid/net/Uri;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/scanner/MediaScannerReceiver$1;->this$0:Lcom/miui/gallery/scanner/MediaScannerReceiver;

    iput-object p2, p0, Lcom/miui/gallery/scanner/MediaScannerReceiver$1;->val$uri:Landroid/net/Uri;

    iput-object p3, p0, Lcom/miui/gallery/scanner/MediaScannerReceiver$1;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 4

    iget-object p1, p0, Lcom/miui/gallery/scanner/MediaScannerReceiver$1;->val$uri:Landroid/net/Uri;

    if-eqz p1, :cond_0

    const-string p1, "file"

    iget-object v0, p0, Lcom/miui/gallery/scanner/MediaScannerReceiver$1;->val$uri:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/scanner/MediaScannerReceiver$1;->val$uri:Landroid/net/Uri;

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/scanner/MediaScannerReceiver$1;->val$context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x6

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-static {v0, p1, v1, v2, v3}, Lcom/miui/gallery/scanner/MediaScannerUtil;->scanDirectory(Landroid/content/Context;Ljava/lang/String;IZZ)V

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method
