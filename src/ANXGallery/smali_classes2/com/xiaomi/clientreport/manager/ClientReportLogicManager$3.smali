.class Lcom/xiaomi/clientreport/manager/ClientReportLogicManager$3;
.super Ljava/lang/Object;
.source "ClientReportLogicManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->startEventUploadJob()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;

.field final synthetic val$eventUploadJob:Lcom/xiaomi/clientreport/job/EventUploadJob;


# direct methods
.method constructor <init>(Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;Lcom/xiaomi/clientreport/job/EventUploadJob;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager$3;->this$0:Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;

    iput-object p2, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager$3;->val$eventUploadJob:Lcom/xiaomi/clientreport/job/EventUploadJob;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager$3;->val$eventUploadJob:Lcom/xiaomi/clientreport/job/EventUploadJob;

    invoke-virtual {v0}, Lcom/xiaomi/clientreport/job/EventUploadJob;->run()V

    return-void
.end method
