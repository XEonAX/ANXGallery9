.class Lcom/xiaomi/push/log/LogUploader$1;
.super Lcom/xiaomi/push/log/LogUploader$Task;
.source "LogUploader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/push/log/LogUploader;->upload(Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field file:Ljava/io/File;

.field final synthetic this$0:Lcom/xiaomi/push/log/LogUploader;

.field final synthetic val$force:Z

.field final synthetic val$from:Ljava/util/Date;

.field final synthetic val$maxlen:I

.field final synthetic val$to:Ljava/util/Date;

.field final synthetic val$token:Ljava/lang/String;

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/xiaomi/push/log/LogUploader;ILjava/util/Date;Ljava/util/Date;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/push/log/LogUploader$1;->this$0:Lcom/xiaomi/push/log/LogUploader;

    iput p2, p0, Lcom/xiaomi/push/log/LogUploader$1;->val$maxlen:I

    iput-object p3, p0, Lcom/xiaomi/push/log/LogUploader$1;->val$from:Ljava/util/Date;

    iput-object p4, p0, Lcom/xiaomi/push/log/LogUploader$1;->val$to:Ljava/util/Date;

    iput-object p5, p0, Lcom/xiaomi/push/log/LogUploader$1;->val$url:Ljava/lang/String;

    iput-object p6, p0, Lcom/xiaomi/push/log/LogUploader$1;->val$token:Ljava/lang/String;

    iput-boolean p7, p0, Lcom/xiaomi/push/log/LogUploader$1;->val$force:Z

    invoke-direct {p0, p1}, Lcom/xiaomi/push/log/LogUploader$Task;-><init>(Lcom/xiaomi/push/log/LogUploader;)V

    return-void
.end method


# virtual methods
.method public postProcess()V
    .locals 8

    iget-object v0, p0, Lcom/xiaomi/push/log/LogUploader$1;->file:Ljava/io/File;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/push/log/LogUploader$1;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/push/log/LogUploader$1;->this$0:Lcom/xiaomi/push/log/LogUploader;

    invoke-static {v0}, Lcom/xiaomi/push/log/LogUploader;->access$100(Lcom/xiaomi/push/log/LogUploader;)Ljava/util/concurrent/ConcurrentLinkedQueue;

    move-result-object v0

    new-instance v7, Lcom/xiaomi/push/log/LogUploader$UploadTask;

    iget-object v2, p0, Lcom/xiaomi/push/log/LogUploader$1;->this$0:Lcom/xiaomi/push/log/LogUploader;

    iget-object v3, p0, Lcom/xiaomi/push/log/LogUploader$1;->val$url:Ljava/lang/String;

    iget-object v4, p0, Lcom/xiaomi/push/log/LogUploader$1;->val$token:Ljava/lang/String;

    iget-object v5, p0, Lcom/xiaomi/push/log/LogUploader$1;->file:Ljava/io/File;

    iget-boolean v6, p0, Lcom/xiaomi/push/log/LogUploader$1;->val$force:Z

    move-object v1, v7

    invoke-direct/range {v1 .. v6}, Lcom/xiaomi/push/log/LogUploader$UploadTask;-><init>(Lcom/xiaomi/push/log/LogUploader;Ljava/lang/String;Ljava/lang/String;Ljava/io/File;Z)V

    invoke-virtual {v0, v7}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/push/log/LogUploader$1;->this$0:Lcom/xiaomi/push/log/LogUploader;

    const-wide/16 v1, 0x0

    invoke-static {v0, v1, v2}, Lcom/xiaomi/push/log/LogUploader;->access$200(Lcom/xiaomi/push/log/LogUploader;J)V

    return-void
.end method

.method public process()V
    .locals 5

    invoke-static {}, Lcom/xiaomi/channel/commonutils/file/SDCardUtils;->isSDCardUseful()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    :try_start_0
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/xiaomi/push/log/LogUploader$1;->this$0:Lcom/xiaomi/push/log/LogUploader;

    invoke-static {v2}, Lcom/xiaomi/push/log/LogUploader;->access$000(Lcom/xiaomi/push/log/LogUploader;)Landroid/content/Context;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, "/.logcache"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_1

    new-instance v1, Lcom/xiaomi/push/log/LogFilter;

    invoke-direct {v1}, Lcom/xiaomi/push/log/LogFilter;-><init>()V

    iget v2, p0, Lcom/xiaomi/push/log/LogUploader$1;->val$maxlen:I

    invoke-virtual {v1, v2}, Lcom/xiaomi/push/log/LogFilter;->setMaxLen(I)V

    iget-object v2, p0, Lcom/xiaomi/push/log/LogUploader$1;->this$0:Lcom/xiaomi/push/log/LogUploader;

    invoke-static {v2}, Lcom/xiaomi/push/log/LogUploader;->access$000(Lcom/xiaomi/push/log/LogUploader;)Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/xiaomi/push/log/LogUploader$1;->val$from:Ljava/util/Date;

    iget-object v4, p0, Lcom/xiaomi/push/log/LogUploader$1;->val$to:Ljava/util/Date;

    invoke-virtual {v1, v2, v3, v4, v0}, Lcom/xiaomi/push/log/LogFilter;->filter(Landroid/content/Context;Ljava/util/Date;Ljava/util/Date;Ljava/io/File;)Ljava/io/File;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/log/LogUploader$1;->file:Ljava/io/File;
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_1
    return-void
.end method
