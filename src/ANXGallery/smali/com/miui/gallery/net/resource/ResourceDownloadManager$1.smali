.class Lcom/miui/gallery/net/resource/ResourceDownloadManager$1;
.super Ljava/lang/Object;
.source "ResourceDownloadManager.java"

# interfaces
.implements Lcom/miui/gallery/net/base/ResponseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/net/resource/ResourceDownloadManager;->download(Lcom/miui/gallery/net/resource/Resource;Ljava/lang/String;Lcom/miui/gallery/net/download/Request$Listener;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/net/resource/ResourceDownloadManager;

.field final synthetic val$file:Ljava/io/File;

.field final synthetic val$isActiveNetworkMetered:Z

.field final synthetic val$listener:Lcom/miui/gallery/net/download/Request$Listener;


# direct methods
.method constructor <init>(Lcom/miui/gallery/net/resource/ResourceDownloadManager;Ljava/io/File;ZLcom/miui/gallery/net/download/Request$Listener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/net/resource/ResourceDownloadManager$1;->this$0:Lcom/miui/gallery/net/resource/ResourceDownloadManager;

    iput-object p2, p0, Lcom/miui/gallery/net/resource/ResourceDownloadManager$1;->val$file:Ljava/io/File;

    iput-boolean p3, p0, Lcom/miui/gallery/net/resource/ResourceDownloadManager$1;->val$isActiveNetworkMetered:Z

    iput-object p4, p0, Lcom/miui/gallery/net/resource/ResourceDownloadManager$1;->val$listener:Lcom/miui/gallery/net/download/Request$Listener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public varargs onResponse([Ljava/lang/Object;)V
    .locals 5

    const/4 v0, 0x0

    aget-object p1, p1, v0

    check-cast p1, Lcom/miui/gallery/net/resource/DownloadInfo;

    const-string v1, "ResourceDownloadManager"

    const-string v2, "download %s, %s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p1, Lcom/miui/gallery/net/resource/DownloadInfo;->url:Ljava/lang/String;

    aput-object v4, v3, v0

    iget-object v0, p1, Lcom/miui/gallery/net/resource/DownloadInfo;->sha1:Ljava/lang/String;

    const/4 v4, 0x1

    aput-object v0, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/miui/gallery/net/download/Request;

    iget-object v1, p1, Lcom/miui/gallery/net/resource/DownloadInfo;->url:Ljava/lang/String;

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/net/resource/ResourceDownloadManager$1;->val$file:Ljava/io/File;

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/net/download/Request;-><init>(Landroid/net/Uri;Ljava/io/File;)V

    iget-object v1, p0, Lcom/miui/gallery/net/resource/ResourceDownloadManager$1;->this$0:Lcom/miui/gallery/net/resource/ResourceDownloadManager;

    invoke-static {v1}, Lcom/miui/gallery/net/resource/ResourceDownloadManager;->access$000(Lcom/miui/gallery/net/resource/ResourceDownloadManager;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/net/download/Verifier$Sha1;

    iget-object p1, p1, Lcom/miui/gallery/net/resource/DownloadInfo;->sha1:Ljava/lang/String;

    invoke-direct {v1, p1}, Lcom/miui/gallery/net/download/Verifier$Sha1;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/net/download/Request;->setVerifier(Lcom/miui/gallery/net/download/Verifier;)V

    iget-boolean p1, p0, Lcom/miui/gallery/net/resource/ResourceDownloadManager$1;->val$isActiveNetworkMetered:Z

    invoke-virtual {v0, p1}, Lcom/miui/gallery/net/download/Request;->setAllowedOverMetered(Z)V

    iget-object p1, p0, Lcom/miui/gallery/net/resource/ResourceDownloadManager$1;->val$listener:Lcom/miui/gallery/net/download/Request$Listener;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/net/download/Request;->setListener(Lcom/miui/gallery/net/download/Request$Listener;)V

    sget-object p1, Lcom/miui/gallery/net/download/GalleryDownloadManager;->INSTANCE:Lcom/miui/gallery/net/download/GalleryDownloadManager;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/net/download/GalleryDownloadManager;->enqueue(Lcom/miui/gallery/net/download/Request;)Z

    return-void
.end method

.method public onResponseError(Lcom/miui/gallery/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    iget-object p3, p0, Lcom/miui/gallery/net/resource/ResourceDownloadManager$1;->val$listener:Lcom/miui/gallery/net/download/Request$Listener;

    const/4 v0, -0x1

    invoke-interface {p3, v0}, Lcom/miui/gallery/net/download/Request$Listener;->onComplete(I)V

    const-string p3, "ResourceDownloadManager"

    const-string v0, "errorMessage:%s,errorCode.name:%s"

    invoke-virtual {p1}, Lcom/miui/gallery/net/base/ErrorCode;->name()Ljava/lang/String;

    move-result-object p1

    invoke-static {p3, v0, p2, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method
