.class Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$2;
.super Ljava/lang/Object;
.source "ExtraPhotoWrapper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->unbindService(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$2;->this$0:Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;

    iput-object p2, p0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$2;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$2;->this$0:Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;

    invoke-static {v0}, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->access$000(Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "ExtraPhotoWrapper"

    const-string v1, "hasn\'t bind service"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$2;->val$context:Landroid/content/Context;

    iget-object v1, p0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$2;->this$0:Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    iget-object v0, p0, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper$2;->this$0:Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;->access$002(Lcom/miui/extraphoto/sdk/ExtraPhotoWrapper;Z)Z

    const-string v0, "ExtraPhotoWrapper"

    const-string v1, "unbind service"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "ExtraPhotoWrapper"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method
