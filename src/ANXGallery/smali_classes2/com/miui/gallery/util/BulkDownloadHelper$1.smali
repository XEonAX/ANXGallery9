.class Lcom/miui/gallery/util/BulkDownloadHelper$1;
.super Lcom/miui/gallery/util/BulkDownloadHelper$BulkItemLoadingListener;
.source "BulkDownloadHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/util/BulkDownloadHelper;->generatorItemListener(Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;)Lcom/miui/gallery/util/BulkDownloadHelper$BulkItemLoadingListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/util/BulkDownloadHelper;


# direct methods
.method constructor <init>(Lcom/miui/gallery/util/BulkDownloadHelper;Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/BulkDownloadHelper$1;->this$0:Lcom/miui/gallery/util/BulkDownloadHelper;

    invoke-direct {p0, p2}, Lcom/miui/gallery/util/BulkDownloadHelper$BulkItemLoadingListener;-><init>(Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;)V

    return-void
.end method


# virtual methods
.method public onLoadingFailed(Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;Lcom/miui/gallery/error/core/ErrorCode;)V
    .locals 1

    const-string p2, "BulkDownloadHelper"

    const-string v0, "onLoadingFailed %s"

    invoke-static {p2, v0, p1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object p2, p0, Lcom/miui/gallery/util/BulkDownloadHelper$1;->this$0:Lcom/miui/gallery/util/BulkDownloadHelper;

    invoke-static {p2, p1}, Lcom/miui/gallery/util/BulkDownloadHelper;->access$000(Lcom/miui/gallery/util/BulkDownloadHelper;Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;)Z

    move-result p2

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/util/BulkDownloadHelper$1;->this$0:Lcom/miui/gallery/util/BulkDownloadHelper;

    invoke-static {p2, p1}, Lcom/miui/gallery/util/BulkDownloadHelper;->access$100(Lcom/miui/gallery/util/BulkDownloadHelper;Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;)V

    :cond_0
    return-void
.end method

.method public onLoadingProgress(Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;JJ)V
    .locals 0

    iget-object p4, p0, Lcom/miui/gallery/util/BulkDownloadHelper$1;->this$0:Lcom/miui/gallery/util/BulkDownloadHelper;

    invoke-static {p4, p1}, Lcom/miui/gallery/util/BulkDownloadHelper;->access$000(Lcom/miui/gallery/util/BulkDownloadHelper;Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/util/BulkDownloadHelper$1;->this$0:Lcom/miui/gallery/util/BulkDownloadHelper;

    invoke-static {p1}, Lcom/miui/gallery/util/BulkDownloadHelper;->access$600(Lcom/miui/gallery/util/BulkDownloadHelper;)Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadListener;

    move-result-object p1

    if-eqz p1, :cond_0

    const/high16 p1, 0x3f800000    # 1.0f

    iget-object p4, p0, Lcom/miui/gallery/util/BulkDownloadHelper$1;->this$0:Lcom/miui/gallery/util/BulkDownloadHelper;

    invoke-static {p4}, Lcom/miui/gallery/util/BulkDownloadHelper;->access$200(Lcom/miui/gallery/util/BulkDownloadHelper;)J

    move-result-wide p4

    add-long/2addr p4, p2

    long-to-float p2, p4

    mul-float p2, p2, p1

    iget-object p1, p0, Lcom/miui/gallery/util/BulkDownloadHelper$1;->this$0:Lcom/miui/gallery/util/BulkDownloadHelper;

    invoke-static {p1}, Lcom/miui/gallery/util/BulkDownloadHelper;->access$700(Lcom/miui/gallery/util/BulkDownloadHelper;)J

    move-result-wide p3

    long-to-float p1, p3

    div-float/2addr p2, p1

    iget-object p1, p0, Lcom/miui/gallery/util/BulkDownloadHelper$1;->this$0:Lcom/miui/gallery/util/BulkDownloadHelper;

    invoke-static {p1}, Lcom/miui/gallery/util/BulkDownloadHelper;->access$600(Lcom/miui/gallery/util/BulkDownloadHelper;)Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadListener;

    move-result-object p1

    invoke-interface {p1, p2}, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadListener;->onDownloadProgress(F)V

    :cond_0
    return-void
.end method

.method public onLoadingSuccess(Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;)V
    .locals 5

    const-string v0, "BulkDownloadHelper"

    const-string v1, "onLoadingSuccess %s"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/util/BulkDownloadHelper$1;->this$0:Lcom/miui/gallery/util/BulkDownloadHelper;

    invoke-static {v0, p1}, Lcom/miui/gallery/util/BulkDownloadHelper;->access$000(Lcom/miui/gallery/util/BulkDownloadHelper;Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/BulkDownloadHelper$1;->this$0:Lcom/miui/gallery/util/BulkDownloadHelper;

    iget-object v1, p0, Lcom/miui/gallery/util/BulkDownloadHelper$1;->this$0:Lcom/miui/gallery/util/BulkDownloadHelper;

    invoke-static {v1}, Lcom/miui/gallery/util/BulkDownloadHelper;->access$200(Lcom/miui/gallery/util/BulkDownloadHelper;)J

    move-result-wide v1

    invoke-virtual {p1}, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;->getSize()J

    move-result-wide v3

    add-long/2addr v1, v3

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/BulkDownloadHelper;->access$202(Lcom/miui/gallery/util/BulkDownloadHelper;J)J

    iget-object v0, p0, Lcom/miui/gallery/util/BulkDownloadHelper$1;->this$0:Lcom/miui/gallery/util/BulkDownloadHelper;

    invoke-static {v0}, Lcom/miui/gallery/util/BulkDownloadHelper;->access$300(Lcom/miui/gallery/util/BulkDownloadHelper;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object p1, p0, Lcom/miui/gallery/util/BulkDownloadHelper$1;->this$0:Lcom/miui/gallery/util/BulkDownloadHelper;

    invoke-static {p1}, Lcom/miui/gallery/util/BulkDownloadHelper;->access$400(Lcom/miui/gallery/util/BulkDownloadHelper;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/util/BulkDownloadHelper$1;->this$0:Lcom/miui/gallery/util/BulkDownloadHelper;

    invoke-static {p1}, Lcom/miui/gallery/util/BulkDownloadHelper;->access$500(Lcom/miui/gallery/util/BulkDownloadHelper;)V

    :cond_0
    return-void
.end method
