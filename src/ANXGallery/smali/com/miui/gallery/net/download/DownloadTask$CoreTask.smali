.class Lcom/miui/gallery/net/download/DownloadTask$CoreTask;
.super Landroid/os/AsyncTask;
.source "DownloadTask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/net/download/DownloadTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CoreTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Integer;",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field mRequest:Lcom/miui/gallery/net/download/Request;

.field final synthetic this$0:Lcom/miui/gallery/net/download/DownloadTask;


# direct methods
.method constructor <init>(Lcom/miui/gallery/net/download/DownloadTask;Lcom/miui/gallery/net/download/Request;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/net/download/DownloadTask$CoreTask;->this$0:Lcom/miui/gallery/net/download/DownloadTask;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/net/download/DownloadTask$CoreTask;->mRequest:Lcom/miui/gallery/net/download/Request;

    return-void
.end method

.method private onComplete(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/net/download/DownloadTask$CoreTask;->mRequest:Lcom/miui/gallery/net/download/Request;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/net/download/DownloadTask$CoreTask;->mRequest:Lcom/miui/gallery/net/download/Request;

    invoke-virtual {v0}, Lcom/miui/gallery/net/download/Request;->getListener()Lcom/miui/gallery/net/download/Request$Listener;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lcom/miui/gallery/net/download/Request$Listener;->onComplete(I)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/net/download/DownloadTask$CoreTask;->mRequest:Lcom/miui/gallery/net/download/Request;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/net/download/Request;->setListener(Lcom/miui/gallery/net/download/Request$Listener;)V

    iput-object v0, p0, Lcom/miui/gallery/net/download/DownloadTask$CoreTask;->mRequest:Lcom/miui/gallery/net/download/Request;

    :cond_1
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Integer;
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/net/download/DownloadTask$CoreTask;->this$0:Lcom/miui/gallery/net/download/DownloadTask;

    iget-object v0, p0, Lcom/miui/gallery/net/download/DownloadTask$CoreTask;->mRequest:Lcom/miui/gallery/net/download/Request;

    invoke-static {p1, v0}, Lcom/miui/gallery/net/download/DownloadTask;->access$100(Lcom/miui/gallery/net/download/DownloadTask;Lcom/miui/gallery/net/download/Request;)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/net/download/DownloadTask$CoreTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method protected onCancelled(Ljava/lang/Integer;)V
    .locals 3

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    goto :goto_0

    :cond_0
    const/4 p1, -0x2

    :goto_0
    const-string v0, "DownloadTask"

    const-string v1, "process download cancelled %d"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/net/download/DownloadTask$CoreTask;->onComplete(I)V

    return-void
.end method

.method protected bridge synthetic onCancelled(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/net/download/DownloadTask$CoreTask;->onCancelled(Ljava/lang/Integer;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Integer;)V
    .locals 2

    const-string v0, "DownloadTask"

    const-string v1, "process download finish %d"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/net/download/DownloadTask$CoreTask;->onComplete(I)V

    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/net/download/DownloadTask$CoreTask;->onPostExecute(Ljava/lang/Integer;)V

    return-void
.end method

.method protected varargs onProgressUpdate([Ljava/lang/Integer;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/net/download/DownloadTask$CoreTask;->mRequest:Lcom/miui/gallery/net/download/Request;

    invoke-virtual {v0}, Lcom/miui/gallery/net/download/Request;->getListener()Lcom/miui/gallery/net/download/Request$Listener;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    aget-object p1, p1, v1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-interface {v0, p1}, Lcom/miui/gallery/net/download/Request$Listener;->onProgressUpdate(I)V

    :cond_0
    return-void
.end method

.method protected bridge synthetic onProgressUpdate([Ljava/lang/Object;)V
    .locals 0

    check-cast p1, [Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/net/download/DownloadTask$CoreTask;->onProgressUpdate([Ljava/lang/Integer;)V

    return-void
.end method

.method publishProgress(I)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/net/download/DownloadTask$CoreTask;->mRequest:Lcom/miui/gallery/net/download/Request;

    invoke-virtual {v0}, Lcom/miui/gallery/net/download/Request;->getListener()Lcom/miui/gallery/net/download/Request$Listener;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Integer;

    const/4 v1, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v0, v1

    invoke-super {p0, v0}, Landroid/os/AsyncTask;->publishProgress([Ljava/lang/Object;)V

    :cond_0
    return-void
.end method
