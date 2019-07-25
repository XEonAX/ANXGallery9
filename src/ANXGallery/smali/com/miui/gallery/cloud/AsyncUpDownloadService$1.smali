.class Lcom/miui/gallery/cloud/AsyncUpDownloadService$1;
.super Landroid/content/BroadcastReceiver;
.source "AsyncUpDownloadService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cloud/AsyncUpDownloadService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/cloud/AsyncUpDownloadService;


# direct methods
.method constructor <init>(Lcom/miui/gallery/cloud/AsyncUpDownloadService;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$1;->this$0:Lcom/miui/gallery/cloud/AsyncUpDownloadService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$1;->this$0:Lcom/miui/gallery/cloud/AsyncUpDownloadService;

    invoke-static {p1}, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->access$200(Lcom/miui/gallery/cloud/AsyncUpDownloadService;)V

    return-void
.end method
