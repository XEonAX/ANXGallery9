.class Lcom/miui/gallery/cloud/AsyncUpDownloadService$5;
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

    iput-object p1, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$5;->this$0:Lcom/miui/gallery/cloud/AsyncUpDownloadService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string v0, "android.intent.action.BATTERY_CHANGED"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    const-string p1, "status"

    const/4 v0, -0x1

    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    const/4 p2, 0x2

    if-eq p1, p2, :cond_1

    const/4 p2, 0x5

    if-ne p1, p2, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    iget-object p2, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$5;->this$0:Lcom/miui/gallery/cloud/AsyncUpDownloadService;

    invoke-static {p2, p1}, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->access$500(Lcom/miui/gallery/cloud/AsyncUpDownloadService;Z)V

    :cond_2
    return-void
.end method
