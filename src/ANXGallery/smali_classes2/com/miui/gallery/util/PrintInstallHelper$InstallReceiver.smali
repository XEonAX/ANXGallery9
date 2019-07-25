.class Lcom/miui/gallery/util/PrintInstallHelper$InstallReceiver;
.super Landroid/content/BroadcastReceiver;
.source "PrintInstallHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/util/PrintInstallHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InstallReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/util/PrintInstallHelper;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/util/PrintInstallHelper;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/PrintInstallHelper$InstallReceiver;->this$0:Lcom/miui/gallery/util/PrintInstallHelper;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/util/PrintInstallHelper;Lcom/miui/gallery/util/PrintInstallHelper$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/PrintInstallHelper$InstallReceiver;-><init>(Lcom/miui/gallery/util/PrintInstallHelper;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 7

    const-string p1, "packageName"

    invoke-virtual {p2, p1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/util/PrintInstallHelper$InstallReceiver;->this$0:Lcom/miui/gallery/util/PrintInstallHelper;

    invoke-static {v0}, Lcom/miui/gallery/util/PrintInstallHelper;->access$600(Lcom/miui/gallery/util/PrintInstallHelper;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_0

    return-void

    :cond_0
    const-string p1, "errorCode"

    const/4 v0, 0x0

    invoke-virtual {p2, p1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    const-string v1, "status"

    invoke-virtual {p2, v1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    const-string v2, "PrintInstallHelper"

    const-string v3, "install error code: %d, download status: %d"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v2, v3, v4, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v2, p0, Lcom/miui/gallery/util/PrintInstallHelper$InstallReceiver;->this$0:Lcom/miui/gallery/util/PrintInstallHelper;

    invoke-static {v2, p1}, Lcom/miui/gallery/util/PrintInstallHelper;->access$700(Lcom/miui/gallery/util/PrintInstallHelper;I)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/util/PrintInstallHelper$InstallReceiver;->this$0:Lcom/miui/gallery/util/PrintInstallHelper;

    invoke-static {p1}, Lcom/miui/gallery/util/PrintInstallHelper;->access$800(Lcom/miui/gallery/util/PrintInstallHelper;)V

    goto/16 :goto_1

    :cond_1
    iget-object v2, p0, Lcom/miui/gallery/util/PrintInstallHelper$InstallReceiver;->this$0:Lcom/miui/gallery/util/PrintInstallHelper;

    invoke-static {v2, p1}, Lcom/miui/gallery/util/PrintInstallHelper;->access$900(Lcom/miui/gallery/util/PrintInstallHelper;I)Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_3

    const-string v1, "reason"

    invoke-virtual {p2, v1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p2

    iget-object v1, p0, Lcom/miui/gallery/util/PrintInstallHelper$InstallReceiver;->this$0:Lcom/miui/gallery/util/PrintInstallHelper;

    invoke-static {v1, p1}, Lcom/miui/gallery/util/PrintInstallHelper;->access$1000(Lcom/miui/gallery/util/PrintInstallHelper;I)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "PrintInstallHelper"

    const-string v2, "print install success, silent install times : %d"

    iget-object v4, p0, Lcom/miui/gallery/util/PrintInstallHelper$InstallReceiver;->this$0:Lcom/miui/gallery/util/PrintInstallHelper;

    invoke-static {v4}, Lcom/miui/gallery/util/PrintInstallHelper;->access$200(Lcom/miui/gallery/util/PrintInstallHelper;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v1, v2, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "silentInstallTimes"

    iget-object v4, p0, Lcom/miui/gallery/util/PrintInstallHelper$InstallReceiver;->this$0:Lcom/miui/gallery/util/PrintInstallHelper;

    invoke-static {v4}, Lcom/miui/gallery/util/PrintInstallHelper;->access$200(Lcom/miui/gallery/util/PrintInstallHelper;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "photo_print"

    const-string v4, "photo_print_package_install_success"

    invoke-static {v2, v4, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_0

    :cond_2
    const-string v1, "PrintInstallHelper"

    const-string v2, "print install fail, error code : %d, reason : %d, silent install times : %d"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    iget-object v6, p0, Lcom/miui/gallery/util/PrintInstallHelper$InstallReceiver;->this$0:Lcom/miui/gallery/util/PrintInstallHelper;

    invoke-static {v6}, Lcom/miui/gallery/util/PrintInstallHelper;->access$200(Lcom/miui/gallery/util/PrintInstallHelper;)I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v1, v2, v4, v5, v6}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "%d_errorCode"

    new-array v5, v3, [Ljava/lang/Object;

    iget-object v6, p0, Lcom/miui/gallery/util/PrintInstallHelper$InstallReceiver;->this$0:Lcom/miui/gallery/util/PrintInstallHelper;

    invoke-static {v6}, Lcom/miui/gallery/util/PrintInstallHelper;->access$200(Lcom/miui/gallery/util/PrintInstallHelper;)I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v0

    invoke-static {v2, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "%d_failReason"

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/miui/gallery/util/PrintInstallHelper$InstallReceiver;->this$0:Lcom/miui/gallery/util/PrintInstallHelper;

    invoke-static {v5}, Lcom/miui/gallery/util/PrintInstallHelper;->access$200(Lcom/miui/gallery/util/PrintInstallHelper;)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v0

    invoke-static {v2, v4, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "photo_print"

    const-string v3, "photo_print_package_install_fail"

    invoke-static {v2, v3, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    const/4 v3, 0x0

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/util/PrintInstallHelper$InstallReceiver;->this$0:Lcom/miui/gallery/util/PrintInstallHelper;

    invoke-static {v1, v0}, Lcom/miui/gallery/util/PrintInstallHelper;->access$1102(Lcom/miui/gallery/util/PrintInstallHelper;I)I

    iget-object v0, p0, Lcom/miui/gallery/util/PrintInstallHelper$InstallReceiver;->this$0:Lcom/miui/gallery/util/PrintInstallHelper;

    invoke-virtual {v0, v3, p1, p2}, Lcom/miui/gallery/util/PrintInstallHelper;->notifyInstallFinish(ZII)V

    iget-object p1, p0, Lcom/miui/gallery/util/PrintInstallHelper$InstallReceiver;->this$0:Lcom/miui/gallery/util/PrintInstallHelper;

    invoke-static {p1}, Lcom/miui/gallery/util/PrintInstallHelper;->access$300(Lcom/miui/gallery/util/PrintInstallHelper;)V

    goto :goto_1

    :cond_3
    const/4 p1, -0x3

    if-ne v1, p1, :cond_4

    iget-object p1, p0, Lcom/miui/gallery/util/PrintInstallHelper$InstallReceiver;->this$0:Lcom/miui/gallery/util/PrintInstallHelper;

    const/4 p2, 0x2

    invoke-static {p1, p2}, Lcom/miui/gallery/util/PrintInstallHelper;->access$1102(Lcom/miui/gallery/util/PrintInstallHelper;I)I

    goto :goto_1

    :cond_4
    iget-object p1, p0, Lcom/miui/gallery/util/PrintInstallHelper$InstallReceiver;->this$0:Lcom/miui/gallery/util/PrintInstallHelper;

    invoke-static {p1, v3}, Lcom/miui/gallery/util/PrintInstallHelper;->access$1102(Lcom/miui/gallery/util/PrintInstallHelper;I)I

    :goto_1
    return-void
.end method
