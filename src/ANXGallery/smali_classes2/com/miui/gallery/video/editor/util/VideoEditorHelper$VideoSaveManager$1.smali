.class Lcom/miui/gallery/video/editor/util/VideoEditorHelper$VideoSaveManager$1;
.super Ljava/lang/Object;
.source "VideoEditorHelper.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/video/editor/util/VideoEditorHelper$VideoSaveManager;->handleVideoSave(Ljava/lang/String;)V
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
.field final synthetic this$0:Lcom/miui/gallery/video/editor/util/VideoEditorHelper$VideoSaveManager;

.field final synthetic val$outputPath:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/miui/gallery/video/editor/util/VideoEditorHelper$VideoSaveManager;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper$VideoSaveManager$1;->this$0:Lcom/miui/gallery/video/editor/util/VideoEditorHelper$VideoSaveManager;

    iput-object p2, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper$VideoSaveManager$1;->val$outputPath:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper$VideoSaveManager$1;->run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper$VideoSaveManager$1;->this$0:Lcom/miui/gallery/video/editor/util/VideoEditorHelper$VideoSaveManager;

    invoke-static {p1}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper$VideoSaveManager;->access$700(Lcom/miui/gallery/video/editor/util/VideoEditorHelper$VideoSaveManager;)Lcom/miui/gallery/video/editor/util/VideoEditorHelper;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper$VideoSaveManager$1;->this$0:Lcom/miui/gallery/video/editor/util/VideoEditorHelper$VideoSaveManager;

    invoke-static {v0}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper$VideoSaveManager;->access$800(Lcom/miui/gallery/video/editor/util/VideoEditorHelper$VideoSaveManager;)Lcom/miui/gallery/threadpool/Future;

    move-result-object v0

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/Future;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p1}, Lcom/miui/gallery/video/editor/util/VideoEditorHelper;->access$300(Lcom/miui/gallery/video/editor/util/VideoEditorHelper;)Landroid/app/Activity;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper$VideoSaveManager$1;->val$outputPath:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/miui/gallery/scanner/MediaScanner;->scanSingleFile(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper$VideoSaveManager$1;->val$outputPath:Ljava/lang/String;

    const/4 v1, 0x2

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/MediaStoreUtils;->insert(Landroid/content/Context;Ljava/lang/String;I)Landroid/net/Uri;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/util/VideoEditorHelper$VideoSaveManager$1;->val$outputPath:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/miui/gallery/util/MediaStoreUtils;->sendScannerBroadcast(Landroid/content/Context;Ljava/lang/String;)V

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method
