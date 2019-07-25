.class Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager$2;
.super Ljava/lang/Object;
.source "FontDownloadManager.java"

# interfaces
.implements Lcom/miui/gallery/net/download/Request$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager;->downloadResource(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadCallback;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager;

.field final synthetic val$data:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

.field final synthetic val$downloadListener:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadCallback;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager;Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadCallback;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager$2;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager$2;->val$data:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    iput-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager$2;->val$downloadListener:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onComplete(I)V
    .locals 4

    const-string v0, "FontDownloadManager"

    const-string v1, "download %s, resultCode: %d"

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager$2;->val$data:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    invoke-virtual {v2}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;->getDownloadFilePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager$2;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager$2;->val$data:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager$2;->val$downloadListener:Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadCallback;

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager;->access$100(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager;Lcom/miui/gallery/editor/photo/core/imports/text/typeface/TextStyle;Lcom/miui/gallery/editor/photo/core/imports/text/typeface/DownloadCallback;)V

    goto :goto_0

    :cond_0
    new-instance p1, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager$2$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager$2$1;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/typeface/FontDownloadManager$2;)V

    invoke-static {p1}, Lcom/miui/gallery/threadpool/ThreadManager;->runOnMainThread(Ljava/lang/Runnable;)V

    :goto_0
    return-void
.end method

.method public onProgressUpdate(I)V
    .locals 2

    const-string v0, "FontDownloadManager"

    const-string v1, "download progress :%d"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public onStart()V
    .locals 2

    const-string v0, "FontDownloadManager"

    const-string v1, "font start download."

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
