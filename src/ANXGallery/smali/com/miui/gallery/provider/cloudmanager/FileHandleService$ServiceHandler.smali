.class final Lcom/miui/gallery/provider/cloudmanager/FileHandleService$ServiceHandler;
.super Landroid/os/Handler;
.source "FileHandleService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/cloudmanager/FileHandleService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ServiceHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/provider/cloudmanager/FileHandleService;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/provider/cloudmanager/FileHandleService;Landroid/os/Looper;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/cloudmanager/FileHandleService$ServiceHandler;->this$0:Lcom/miui/gallery/provider/cloudmanager/FileHandleService;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Landroid/content/Intent;

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "check_unhandled_media_ids"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/miui/gallery/provider/cloudmanager/MediaRemarkManager;->loadFileHandleMediaIds()[J

    move-result-object p1

    if-eqz p1, :cond_1

    array-length v0, p1

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/FileHandleService$ServiceHandler;->this$0:Lcom/miui/gallery/provider/cloudmanager/FileHandleService;

    invoke-static {v0, p1}, Lcom/miui/gallery/provider/cloudmanager/FileHandleService;->access$000(Lcom/miui/gallery/provider/cloudmanager/FileHandleService;[J)V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "batch_count"

    array-length p1, p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "file_handle"

    const-string v1, "restore_unhandled_file_operations"

    invoke-static {p1, v1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_0

    :cond_0
    const-string v1, "dispatch_media_ids"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "ids"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getLongArrayExtra(Ljava/lang/String;)[J

    move-result-object p1

    if-eqz p1, :cond_1

    array-length v0, p1

    if-lez v0, :cond_1

    invoke-static {p1}, Lcom/miui/gallery/provider/cloudmanager/MediaRemarkManager;->addFileHandleMediaIds([J)I

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/FileHandleService$ServiceHandler;->this$0:Lcom/miui/gallery/provider/cloudmanager/FileHandleService;

    invoke-static {v0, p1}, Lcom/miui/gallery/provider/cloudmanager/FileHandleService;->access$000(Lcom/miui/gallery/provider/cloudmanager/FileHandleService;[J)V

    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/provider/cloudmanager/FileHandleService$ServiceHandler;->this$0:Lcom/miui/gallery/provider/cloudmanager/FileHandleService;

    invoke-static {p1}, Lcom/miui/gallery/provider/cloudmanager/FileHandleService;->access$100(Lcom/miui/gallery/provider/cloudmanager/FileHandleService;)V

    return-void
.end method
