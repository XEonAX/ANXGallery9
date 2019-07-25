.class Lcom/xiaomi/push/service/LongConnUploader$1;
.super Lcom/xiaomi/push/service/XMPushService$Job;
.source "LongConnUploader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/push/service/LongConnUploader;->upload(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/push/service/LongConnUploader;

.field final synthetic val$items:Ljava/util/List;

.field final synthetic val$pkgName:Ljava/lang/String;

.field final synthetic val$sourcePkgName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/xiaomi/push/service/LongConnUploader;ILjava/lang/String;Ljava/util/List;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/push/service/LongConnUploader$1;->this$0:Lcom/xiaomi/push/service/LongConnUploader;

    iput-object p3, p0, Lcom/xiaomi/push/service/LongConnUploader$1;->val$pkgName:Ljava/lang/String;

    iput-object p4, p0, Lcom/xiaomi/push/service/LongConnUploader$1;->val$items:Ljava/util/List;

    iput-object p5, p0, Lcom/xiaomi/push/service/LongConnUploader$1;->val$sourcePkgName:Ljava/lang/String;

    invoke-direct {p0, p2}, Lcom/xiaomi/push/service/XMPushService$Job;-><init>(I)V

    return-void
.end method


# virtual methods
.method public getDesc()Ljava/lang/String;
    .locals 1

    const-string v0, "Send tiny data."

    return-object v0
.end method

.method public process()V
    .locals 6

    iget-object v0, p0, Lcom/xiaomi/push/service/LongConnUploader$1;->this$0:Lcom/xiaomi/push/service/LongConnUploader;

    iget-object v1, p0, Lcom/xiaomi/push/service/LongConnUploader$1;->val$pkgName:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/xiaomi/push/service/LongConnUploader;->access$000(Lcom/xiaomi/push/service/LongConnUploader;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/xiaomi/push/service/LongConnUploader$1;->val$items:Ljava/util/List;

    iget-object v2, p0, Lcom/xiaomi/push/service/LongConnUploader$1;->val$pkgName:Ljava/lang/String;

    const v3, 0x8000

    invoke-static {v1, v2, v0, v3}, Lcom/xiaomi/push/service/TinyDataHelper;->pack(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;I)Ljava/util/ArrayList;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "TinyData LongConnUploader.upload pack notifications "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/util/ArrayList;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "  ts:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    if-eqz v1, :cond_3

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;

    const-string v3, "uploadWay"

    const-string v4, "longXMPushService"

    invoke-virtual {v2, v3, v4}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->putToExtra(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v3, p0, Lcom/xiaomi/push/service/LongConnUploader$1;->val$pkgName:Ljava/lang/String;

    sget-object v4, Lcom/xiaomi/xmpush/thrift/ActionType;->Notification:Lcom/xiaomi/xmpush/thrift/ActionType;

    invoke-static {v3, v0, v2, v4}, Lcom/xiaomi/push/service/MIPushHelper;->generateRequestContainer(Ljava/lang/String;Ljava/lang/String;Lorg/apache/thrift/TBase;Lcom/xiaomi/xmpush/thrift/ActionType;)Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;

    move-result-object v2

    iget-object v3, p0, Lcom/xiaomi/push/service/LongConnUploader$1;->val$sourcePkgName:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    iget-object v3, p0, Lcom/xiaomi/push/service/LongConnUploader$1;->val$pkgName:Ljava/lang/String;

    iget-object v4, p0, Lcom/xiaomi/push/service/LongConnUploader$1;->val$sourcePkgName:Ljava/lang/String;

    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v2}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->getMetaInfo()Lcom/xiaomi/xmpush/thrift/PushMetaInfo;

    move-result-object v3

    if-nez v3, :cond_0

    new-instance v3, Lcom/xiaomi/xmpush/thrift/PushMetaInfo;

    invoke-direct {v3}, Lcom/xiaomi/xmpush/thrift/PushMetaInfo;-><init>()V

    const-string v4, "-1"

    invoke-virtual {v3, v4}, Lcom/xiaomi/xmpush/thrift/PushMetaInfo;->setId(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/PushMetaInfo;

    invoke-virtual {v2, v3}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->setMetaInfo(Lcom/xiaomi/xmpush/thrift/PushMetaInfo;)Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;

    :cond_0
    invoke-virtual {v2}, Lcom/xiaomi/xmpush/thrift/XmPushActionContainer;->getMetaInfo()Lcom/xiaomi/xmpush/thrift/PushMetaInfo;

    move-result-object v3

    const-string v4, "ext_traffic_source_pkg"

    iget-object v5, p0, Lcom/xiaomi/push/service/LongConnUploader$1;->val$sourcePkgName:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Lcom/xiaomi/xmpush/thrift/PushMetaInfo;->putToInternal(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    invoke-static {v2}, Lcom/xiaomi/xmpush/thrift/XmPushThriftSerializeUtils;->convertThriftObjectToBytes(Lorg/apache/thrift/TBase;)[B

    move-result-object v2

    iget-object v3, p0, Lcom/xiaomi/push/service/LongConnUploader$1;->this$0:Lcom/xiaomi/push/service/LongConnUploader;

    invoke-static {v3}, Lcom/xiaomi/push/service/LongConnUploader;->access$100(Lcom/xiaomi/push/service/LongConnUploader;)Lcom/xiaomi/push/service/XMPushService;

    move-result-object v3

    iget-object v4, p0, Lcom/xiaomi/push/service/LongConnUploader$1;->val$pkgName:Ljava/lang/String;

    const/4 v5, 0x1

    invoke-virtual {v3, v4, v2, v5}, Lcom/xiaomi/push/service/XMPushService;->sendMessage(Ljava/lang/String;[BZ)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/xiaomi/push/service/LongConnUploader$1;->val$items:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "TinyData LongConnUploader.upload uploaded by com.xiaomi.push.service.TinyDataUploader.  item"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "  ts:"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    goto :goto_1

    :cond_3
    const-string v0, "TinyData LongConnUploader.upload Get a null XmPushActionNotification list when TinyDataHelper.pack() in XMPushService."

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;)V

    :cond_4
    return-void
.end method
