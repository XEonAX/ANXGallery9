.class Lcom/miui/gallery/receiver/GalleryTestReceiver$1;
.super Ljava/lang/Object;
.source "GalleryTestReceiver.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/receiver/GalleryTestReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/receiver/GalleryTestReceiver;

.field final synthetic val$intent:Landroid/content/Intent;


# direct methods
.method constructor <init>(Lcom/miui/gallery/receiver/GalleryTestReceiver;Landroid/content/Intent;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/receiver/GalleryTestReceiver$1;->this$0:Lcom/miui/gallery/receiver/GalleryTestReceiver;

    iput-object p2, p0, Lcom/miui/gallery/receiver/GalleryTestReceiver$1;->val$intent:Landroid/content/Intent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/receiver/GalleryTestReceiver$1;->val$intent:Landroid/content/Intent;

    const-string v0, "type"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/receiver/GalleryTestReceiver$1;->val$intent:Landroid/content/Intent;

    const-string v1, "type"

    invoke-virtual {p1, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v1, "real_name"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance p1, Lcom/miui/gallery/cloudcontrol/CloudControlRequestHelper;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {p1, v1}, Lcom/miui/gallery/cloudcontrol/CloudControlRequestHelper;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Lcom/miui/gallery/cloudcontrol/CloudControlRequestHelper;->execRequestSync(Z)Z

    return-object v0

    :cond_0
    const-string v1, "anonymous"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    new-instance p1, Lcom/miui/gallery/cloudcontrol/CloudControlRequestHelper;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {p1, v1}, Lcom/miui/gallery/cloudcontrol/CloudControlRequestHelper;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Lcom/miui/gallery/cloudcontrol/CloudControlRequestHelper;->execRequestSync(Z)Z

    return-object v0

    :cond_1
    new-instance p1, Lcom/miui/gallery/cloudcontrol/CloudControlRequestHelper;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {p1, v1}, Lcom/miui/gallery/cloudcontrol/CloudControlRequestHelper;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/CloudControlRequestHelper;->execRequestSync()Z

    return-object v0
.end method
