.class Lcom/miui/gallery/util/uil/CloudImageLoader$1;
.super Ljava/lang/Object;
.source "CloudImageLoader.java"

# interfaces
.implements Lcom/miui/gallery/sdk/download/listener/DownloadListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/util/uil/CloudImageLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/util/uil/CloudImageLoader;


# direct methods
.method constructor <init>(Lcom/miui/gallery/util/uil/CloudImageLoader;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$1;->this$0:Lcom/miui/gallery/util/uil/CloudImageLoader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDownloadCancel(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 3

    const-string v0, "CloudImageLoader"

    const-string v1, "onDownloadCancel %s"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$1;->this$0:Lcom/miui/gallery/util/uil/CloudImageLoader;

    new-instance v1, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;

    iget-object v2, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$1;->this$0:Lcom/miui/gallery/util/uil/CloudImageLoader;

    invoke-direct {v1, v2, p1, p2}, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;-><init>(Lcom/miui/gallery/util/uil/CloudImageLoader;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)V

    const/4 p1, 0x3

    invoke-static {v0, p1, v1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->access$100(Lcom/miui/gallery/util/uil/CloudImageLoader;ILcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)V

    return-void
.end method

.method public onDownloadFail(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V
    .locals 3

    const-string v0, "CloudImageLoader"

    const-string v1, "onDownloadFail %s"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$1;->this$0:Lcom/miui/gallery/util/uil/CloudImageLoader;

    new-instance v1, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;

    iget-object v2, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$1;->this$0:Lcom/miui/gallery/util/uil/CloudImageLoader;

    invoke-direct {v1, v2, p1, p2, p3}, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;-><init>(Lcom/miui/gallery/util/uil/CloudImageLoader;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V

    const/4 p1, 0x2

    invoke-static {v0, p1, v1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->access$100(Lcom/miui/gallery/util/uil/CloudImageLoader;ILcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)V

    return-void
.end method

.method public onDownloadStarted(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 3

    const-string v0, "CloudImageLoader"

    const-string v1, "onAddItem %s"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$1;->this$0:Lcom/miui/gallery/util/uil/CloudImageLoader;

    new-instance v1, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;

    iget-object v2, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$1;->this$0:Lcom/miui/gallery/util/uil/CloudImageLoader;

    invoke-direct {v1, v2, p1, p2}, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;-><init>(Lcom/miui/gallery/util/uil/CloudImageLoader;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)V

    const/4 p1, 0x0

    invoke-static {v0, p1, v1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->access$100(Lcom/miui/gallery/util/uil/CloudImageLoader;ILcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)V

    return-void
.end method

.method public onDownloadSuccess(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/sdk/download/assist/DownloadedItem;)V
    .locals 3

    const-string v0, "CloudImageLoader"

    const-string v1, "onDownloadSuccess %s"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$1;->this$0:Lcom/miui/gallery/util/uil/CloudImageLoader;

    new-instance v1, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;

    iget-object v2, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$1;->this$0:Lcom/miui/gallery/util/uil/CloudImageLoader;

    invoke-direct {v1, v2, p1, p2, p3}, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;-><init>(Lcom/miui/gallery/util/uil/CloudImageLoader;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/sdk/download/assist/DownloadedItem;)V

    const/4 p1, 0x1

    invoke-static {v0, p1, v1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->access$100(Lcom/miui/gallery/util/uil/CloudImageLoader;ILcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)V

    return-void
.end method
