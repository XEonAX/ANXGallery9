.class Lcom/miui/gallery/activity/HomePageActivity$5;
.super Ljava/lang/Object;
.source "HomePageActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/activity/HomePageActivity;->unbindMTCameraRemoteService()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/activity/HomePageActivity;


# direct methods
.method constructor <init>(Lcom/miui/gallery/activity/HomePageActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/activity/HomePageActivity$5;->this$0:Lcom/miui/gallery/activity/HomePageActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/activity/HomePageActivity$5;->this$0:Lcom/miui/gallery/activity/HomePageActivity;

    invoke-static {v0}, Lcom/miui/gallery/activity/HomePageActivity;->access$1000(Lcom/miui/gallery/activity/HomePageActivity;)Landroid/content/ServiceConnection;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/activity/HomePageActivity$5;->this$0:Lcom/miui/gallery/activity/HomePageActivity;

    iget-object v1, p0, Lcom/miui/gallery/activity/HomePageActivity$5;->this$0:Lcom/miui/gallery/activity/HomePageActivity;

    invoke-static {v1}, Lcom/miui/gallery/activity/HomePageActivity;->access$1000(Lcom/miui/gallery/activity/HomePageActivity;)Landroid/content/ServiceConnection;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/activity/HomePageActivity;->unbindService(Landroid/content/ServiceConnection;)V

    iget-object v0, p0, Lcom/miui/gallery/activity/HomePageActivity$5;->this$0:Lcom/miui/gallery/activity/HomePageActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/activity/HomePageActivity;->access$1002(Lcom/miui/gallery/activity/HomePageActivity;Landroid/content/ServiceConnection;)Landroid/content/ServiceConnection;

    const-string v0, "HomePageActivity"

    const-string v1, "unbind CameraRemoteService"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "HomePageActivity"

    const-string v2, "unbind CameraRemoteService failed"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method
