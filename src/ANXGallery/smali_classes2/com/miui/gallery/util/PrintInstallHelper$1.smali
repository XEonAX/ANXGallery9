.class Lcom/miui/gallery/util/PrintInstallHelper$1;
.super Ljava/lang/Object;
.source "PrintInstallHelper.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/util/PrintInstallHelper;->installPrintPackage(ZLjava/lang/String;Lcom/miui/gallery/util/PrintInstallHelper$InstallStateListener;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/util/PrintInstallHelper;

.field final synthetic val$isSilent:Z

.field final synthetic val$packageName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/miui/gallery/util/PrintInstallHelper;Ljava/lang/String;Z)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/PrintInstallHelper$1;->this$0:Lcom/miui/gallery/util/PrintInstallHelper;

    iput-object p2, p0, Lcom/miui/gallery/util/PrintInstallHelper$1;->val$packageName:Ljava/lang/String;

    iput-boolean p3, p0, Lcom/miui/gallery/util/PrintInstallHelper$1;->val$isSilent:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 1

    :try_start_0
    iget-object p1, p0, Lcom/miui/gallery/util/PrintInstallHelper$1;->this$0:Lcom/miui/gallery/util/PrintInstallHelper;

    invoke-static {p2}, Lcom/xiaomi/market/IAppDownloadManager$Stub;->asInterface(Landroid/os/IBinder;)Lcom/xiaomi/market/IAppDownloadManager;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/miui/gallery/util/PrintInstallHelper;->access$002(Lcom/miui/gallery/util/PrintInstallHelper;Lcom/xiaomi/market/IAppDownloadManager;)Lcom/xiaomi/market/IAppDownloadManager;

    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    const-string p2, "packageName"

    iget-object v0, p0, Lcom/miui/gallery/util/PrintInstallHelper$1;->val$packageName:Ljava/lang/String;

    invoke-virtual {p1, p2, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "ref"

    const-string v0, "MiuiGallery"

    invoke-virtual {p1, p2, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "senderPackageName"

    const-string v0, "com.miui.gallery"

    invoke-virtual {p1, p2, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean p2, p0, Lcom/miui/gallery/util/PrintInstallHelper$1;->val$isSilent:Z

    if-nez p2, :cond_0

    const-string p2, "show_cta"

    const/4 v0, 0x1

    invoke-virtual {p1, p2, v0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    :cond_0
    iget-object p2, p0, Lcom/miui/gallery/util/PrintInstallHelper$1;->this$0:Lcom/miui/gallery/util/PrintInstallHelper;

    invoke-static {p2}, Lcom/miui/gallery/util/PrintInstallHelper;->access$100(Lcom/miui/gallery/util/PrintInstallHelper;)V

    iget-object p2, p0, Lcom/miui/gallery/util/PrintInstallHelper$1;->this$0:Lcom/miui/gallery/util/PrintInstallHelper;

    invoke-static {p2}, Lcom/miui/gallery/util/PrintInstallHelper;->access$000(Lcom/miui/gallery/util/PrintInstallHelper;)Lcom/xiaomi/market/IAppDownloadManager;

    move-result-object p2

    invoke-interface {p2, p1}, Lcom/xiaomi/market/IAppDownloadManager;->download(Landroid/os/Bundle;)V

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    const-string p2, "silentInstallTimes"

    iget-object v0, p0, Lcom/miui/gallery/util/PrintInstallHelper$1;->this$0:Lcom/miui/gallery/util/PrintInstallHelper;

    invoke-static {v0}, Lcom/miui/gallery/util/PrintInstallHelper;->access$200(Lcom/miui/gallery/util/PrintInstallHelper;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "photo_print"

    const-string v0, "photo_print_package_download"

    invoke-static {p2, v0, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception p1

    :try_start_1
    const-string p2, "PrintInstallHelper"

    invoke-static {p2, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    iget-object p1, p0, Lcom/miui/gallery/util/PrintInstallHelper$1;->this$0:Lcom/miui/gallery/util/PrintInstallHelper;

    invoke-static {p1}, Lcom/miui/gallery/util/PrintInstallHelper;->access$300(Lcom/miui/gallery/util/PrintInstallHelper;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/util/PrintInstallHelper$1;->this$0:Lcom/miui/gallery/util/PrintInstallHelper;

    invoke-static {p1}, Lcom/miui/gallery/util/PrintInstallHelper;->access$400(Lcom/miui/gallery/util/PrintInstallHelper;)V

    return-void

    :goto_1
    iget-object p2, p0, Lcom/miui/gallery/util/PrintInstallHelper$1;->this$0:Lcom/miui/gallery/util/PrintInstallHelper;

    invoke-static {p2}, Lcom/miui/gallery/util/PrintInstallHelper;->access$400(Lcom/miui/gallery/util/PrintInstallHelper;)V

    throw p1
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 0

    return-void
.end method
